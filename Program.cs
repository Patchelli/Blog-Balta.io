// See https://aka.ms/new-console-template for more information
using blog.Models;
using blog.Repository;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

const string CONNECTION_STRING = @"Server=localhost,1433;Database=blog;User ID=sa;Password=1q2w3e4r@#$;Trusted_Connection=False; TrustServerCertificate=True;";
var connection = new SqlConnection(CONNECTION_STRING);
connection.Open();
ReadUsers(connection);
ReadRoles(connection);
// ReadUser();
// CreateUser();
// UpdateUser();
// DeleteUser();
connection.Close();

//buscar todos os usuarios
static void ReadUsers(SqlConnection connection)
{
    var repository = new UserRepository(connection);
    var users = repository.GetAll();

    foreach (var user in users)
        System.Console.WriteLine(user.Name);
}


//buscar todos os usuarios
static void ReadRoles(SqlConnection connection)
{
    var repository = new RoleRepository(connection);
    var roles = repository.GetAll();

    foreach (var role in roles)
        System.Console.WriteLine(role.Name);
}
