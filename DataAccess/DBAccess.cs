using Dapper;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess;

/// <summary>
/// Submits CRUD object sql to database.
/// </summary>
/// <param name="config">config containing connection string</param>
public class DBAccess(IConfiguration config) : IDBAccess
{
    private readonly IConfiguration _config = config;

    public List<T> QueryDB<T, U>(string sqlStatement,
                                 U parameters,
                                 string connStringName,
                                 bool isStoredProcedure = false)
    {
        string connString = _config.GetConnectionString(connStringName)!;
        CommandType commandType = CommandType.Text;

        if (isStoredProcedure)
        {
            commandType = CommandType.StoredProcedure;
        }

        using IDbConnection connection = new SqlConnection(connString);
        return connection.Query<T>(sqlStatement, parameters, commandType: commandType).ToList();
    }

    public void WriteToDB<T>(string sqlStatement,
                             T parameters,
                             string connStringName,
                             bool isStoredProcedure = false)
    {
        string connString = _config.GetConnectionString(connStringName)!;
        CommandType commandType = CommandType.Text;

        if (isStoredProcedure)
        {
            commandType = CommandType.StoredProcedure;
        }

        using IDbConnection connection = new SqlConnection(connString);
        connection.Execute(sqlStatement, parameters, commandType: commandType);
    }
}
