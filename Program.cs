using blog.Models;
using blog.Repositories;
using Microsoft.Data.SqlClient;

const string CONNECTION_STRING = @"Server=localhost,1433;Database=blog;User ID=sa;Password=1q2w3e4r@#$;Trusted_Connection=False; TrustServerCertificate=True;";
var connection = new SqlConnection(CONNECTION_STRING);
connection.Open();
ReadUsers(connection);
ReadRoles(connection);
ReadTag(connection);
// ReadUser();
// CreateUser();
// UpdateUser();
// DeleteUser();
connection.Close();

//buscar todos os usuarios
static void ReadUsers(SqlConnection connection)
{
    var repository = new Repository<User>(connection);
    var itens = repository.GetAll();

    foreach (var item in itens)
        System.Console.WriteLine(item.Name);
}


//buscar todos os usuarios
static void ReadRoles(SqlConnection connection)
{
    var repository = new Repository<Role>(connection);
    var itens = repository.GetAll();

    foreach (var item in itens)
        System.Console.WriteLine(item.Name);
}


//buscar todos os usuarios
static void ReadTag(SqlConnection connection)
{
    var repository = new Repository<Tag>(connection);
    var itens = repository.GetAll();

    foreach (var item in itens)
        System.Console.WriteLine(item.Name);
}