namespace DataAccess;

/// <summary>
/// Represents required implementations for DBAccess objects.
/// </summary>
public interface IDBAccess
{
    List<T> QueryDB<T, U>(string sqlStatement,
                          U parameters,
                          string connStringName,
                          bool isStoredProcedure = false);
    void WriteToDB<T>(string sqlStatement,
                      T parameters,
                      string connStringName,
                      bool isStoredProcedure = false);
}
