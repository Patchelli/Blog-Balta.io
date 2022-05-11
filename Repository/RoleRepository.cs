using blog.Models;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

namespace blog.Repository
{
    public class RoleRepository
    {

        private readonly SqlConnection _connection;
        public RoleRepository(SqlConnection connection)
        {
            _connection = connection;
        }
        public IEnumerable<Role> GetAll()
        //Expression Body <<
            => _connection.GetAll<Role>();


        //buscar um usuario
        public Role Get(int id, string connectionString)
        {

            return _connection.Get<Role>(id);
        }

        public void Create(Role role, string connectionString)
        {

            _connection.Insert<Role>(role);
        }

    }
}