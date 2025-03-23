using Dapper;
using System.Data;
using Microsoft.Data.SqlClient; // ? Correct for .NET Core

public static class DatabaseHelper
{
    private static string _connectionString;

    /// <summary>
    /// Initialize the connection string (Call this once in Program.cs)
    /// </summary>
    public static void Initialize(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection");
    }

    /// <summary>
    /// Executes a stored procedure and returns a list of objects
    /// </summary>
    //public static ResultModel<List<T>> ExecuteStoredProcedureList<T>(string storedProcedureName, object parameters = null)
    //{
    //    try
    //    {
    //        using (var connection = new SqlConnection(_connectionString))
    //        {
    //            connection.Open();
    //            var result = connection.Query<T>(storedProcedureName, parameters, commandType: CommandType.StoredProcedure).ToList();

    //            return new ResultModel<List<T>>
    //            {
    //                Data = result,
    //                Message = "Stored procedure executed successfully.",
    //                Success = true
    //            };
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        return new ResultModel<List<T>>
    //        {
    //            Data = null,
    //            Message = $"Error: {ex.Message}",
    //            Success = false
    //        };
    //    }
    //}

    /// <summary>
    /// Executes a stored procedure and returns a single object
    /// </summary>
    //public static ResultModel<T> ExecuteStoredProcedureSingle<T>(string storedProcedureName, object parameters = null)
    //{
    //    try
    //    {
    //        using (var connection = new SqlConnection(_connectionString))
    //        {
    //            connection.Open();
    //            var result = connection.QueryFirstOrDefault<T>(storedProcedureName, parameters, commandType: CommandType.StoredProcedure);

    //            return new ResultModel<T>
    //            {
    //                Data = result,
    //                Message = result != null ? "Stored procedure executed successfully." : "No data found.",
    //                Success = result != null
    //            };
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        return new ResultModel<T>
    //        {
    //            Data = default,
    //            Message = $"Error: {ex.Message}",
    //            Success = false
    //        };
    //    }
    //}

    /// <summary>
    /// Executes a stored procedure that does not return data (INSERT, UPDATE, DELETE)
    /// </summary>
    public static ResultModel<int> ExecuteNonQuery(string storedProcedureName, object parameters = null)
    {
        try
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                int rowsAffected = connection.Execute(storedProcedureName, parameters, commandType: CommandType.StoredProcedure);

                return new ResultModel<int>
                {
                    Data = rowsAffected,
                    Message = "Query executed successfully.",
                    Success = true
                };
            }
        }
        catch (Exception ex)
        {
            return new ResultModel<int>
            {
                Data = 0,
                Message = $"Error: {ex.Message}",
                Success = false
            };
        }
    }

    /// <summary>
    /// Executes a stored procedure that returns a single scalar value (e.g., COUNT, SUM)
    /// </summary>
    public static ResultModel<T> ExecuteScalar<T>(string storedProcedureName, object parameters = null)
    {
        try
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                T result = connection.ExecuteScalar<T>(storedProcedureName, parameters, commandType: CommandType.StoredProcedure);

                return new ResultModel<T>
                {
                    Data = result,
                    Message = "Scalar query executed successfully.",
                    Success = true
                };
            }
        }
        catch (Exception ex)
        {
            return new ResultModel<T>
            {
                Data = default,
                Message = $"Error: {ex.Message}",
                Success = false
            };
        }
    }

     /// <summary>
    /// Execute stored procedure and return list of a different model
    /// </summary>
    public static List<T> ExecuteStoredProcedureList<T>(string storedProcedureName, object parameters = null)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();
            return connection.Query<T>(storedProcedureName, parameters, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    /// <summary>
    /// Execute stored procedure and return a single object in a different model
    /// </summary>
    public static T ExecuteStoredProcedureSingle<T>(string storedProcedureName, object parameters = null)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();
            return connection.QueryFirstOrDefault<T>(storedProcedureName, parameters, commandType: CommandType.StoredProcedure);
        }
    }
}

/// <summary>
/// Generic Result Model
/// </summary>
public class ResultModel<T>
{
    public T Data { get; set; }
    public string Message { get; set; }
    public bool Success { get; set; }
}


//Install-Package Dapper
