
namespace DataAccess
{
    public interface IDBAccess
    {
        List<T> QueryDB<T, U>(string sqlStatement, U parameters, string connString, bool isStoredProcedure = false);
        void WriteToDB<T>(string sqlStatement, T parameters, string connString, bool isStoredProcedure = false);
    }
}