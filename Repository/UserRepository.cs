using blog.Models;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

namespace blog.Repository
{
    public class UserRepository
    {

        private readonly SqlConnection _connection;
        public UserRepository(SqlConnection connection)
        {
            _connection = connection;
        }
        public IEnumerable<User> GetAll()
        //Expression Body
            => _connection.GetAll<User>();


        //buscar um usuario
        public User Get(int id, string connectionString)
        {

            return _connection.Get<User>(id);
        }

        public void Create(User user, string connectionString)
        {

            _connection.Insert<User>(user);
        }

    }
}