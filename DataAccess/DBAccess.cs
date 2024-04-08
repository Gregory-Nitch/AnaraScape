
/**
 * Used to submit crud operations to db server.
 */

using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess;

public class DBAccess : IDBAccess
{
    public List<T> QueryDB<T, U>(string sqlStatement, U parameters, string connString, bool isStoredProcedure = false)
    {
        CommandType commandType = CommandType.Text;

        if (isStoredProcedure)
        {
            commandType = CommandType.StoredProcedure;
        }

        using IDbConnection connection = new SqlConnection(connString);
        return connection.Query<T>(sqlStatement, parameters, commandType: commandType).ToList();
    }

    public void WriteToDB<T>(string sqlStatement, T parameters, string connString, bool isStoredProcedure = false)
    {
        CommandType commandType = CommandType.Text;

        if (isStoredProcedure)
        {
            commandType = CommandType.StoredProcedure;
        }

        using IDbConnection connection = new SqlConnection(connString);
        connection.Execute(sqlStatement, parameters, commandType: commandType);
    }

}
