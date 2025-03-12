using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using V_System_Core.Models;


namespace V_System_Core.Component
{
    public static class MyHelperSql
    {
       public static   object defaultSelect2 = new
        {
            id = 0,
            text = "Select an option"
        };

        public static List<Dictionary<string, object>> ExecSpReturnObj(DbContext dbContext, string storedProcedureName, params SqlParameter[] parameters)
        {
            var result = new List<Dictionary<string, object>>();

            var command = dbContext.Database.GetDbConnection().CreateCommand();
            command.CommandText = storedProcedureName;
            command.CommandType = System.Data.CommandType.StoredProcedure;

            if (parameters != null && parameters.Length > 0)
            {
                foreach (var param in parameters)
                {
                    command.Parameters.Add(param);
                }
            }

            if (command.Connection.State != System.Data.ConnectionState.Open)
            {
                command.Connection.Open();
            }

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var rowDictionary = new Dictionary<string, object>();

                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        var columnName = reader.GetName(i);
                        var columnValue = reader.IsDBNull(i) ? null : reader.GetValue(i);
                        rowDictionary[columnName] = columnValue;
                    }

                    result.Add(rowDictionary);
                }
            }

            return result;
        }

        public static List<Dictionary<string, object>> ExecSpReturnObj_NoParam(DbContext dbContext, string storedProcedureName)
        {
            var result = new List<Dictionary<string, object>>();

            var command = dbContext.Database.GetDbConnection().CreateCommand();
            command.CommandText = storedProcedureName;
            command.CommandType = System.Data.CommandType.StoredProcedure;

            if (command.Connection.State != System.Data.ConnectionState.Open)
            {
                command.Connection.Open();
            }

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var rowDictionary = new Dictionary<string, object>();

                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        var columnName = reader.GetName(i);
                        var columnValue = reader.IsDBNull(i) ? null : reader.GetValue(i);
                        rowDictionary[columnName] = columnValue;
                    } 
                    result.Add(rowDictionary);
                }
            } 
            return result;
        }

        public static List<CoreSelect2Item> GetSelect2Item(DbContext db, string mapKey, int keyId = 0)
        {
            string sql = "EXEC SP_SELECT2_DATA @MapKey, @KeyId";
            return db.Set<CoreSelect2Item>().FromSqlRaw(sql,
                new SqlParameter("@MapKey", mapKey),
                new SqlParameter("@KeyId", keyId))
                .ToList();
        } 

        public static void ExecSpNotReturn(DbContext dbContext, string storedProcedureName, params SqlParameter[] parameters)
        {
            using (var command = dbContext.Database.GetDbConnection().CreateCommand())
            { 
                if (!storedProcedureName.TrimStart().StartsWith("EXEC", StringComparison.OrdinalIgnoreCase))
                {
                    storedProcedureName = $"EXEC {storedProcedureName}";
                }

                command.CommandText = storedProcedureName;
                command.CommandType = System.Data.CommandType.Text; 

                if (parameters != null && parameters.Length > 0)
                {
                    foreach (var param in parameters)
                    {
                        param.Direction = System.Data.ParameterDirection.Input;  
                        command.Parameters.Add(param);
                    }
                }

                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                command.ExecuteNonQuery();  
            }
        }

        public static string ExexSpReturnMessageFromStore(DbContext dbContext, string storedProcedureName, params SqlParameter[] parameters)
        {
            string outputMessage = "";

            using (var command = dbContext.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = storedProcedureName;
                command.CommandType = System.Data.CommandType.StoredProcedure; // Use StoredProcedure type

                if (parameters != null && parameters.Length > 0)
                {
                    foreach (var param in parameters)
                    {
                        param.Direction = System.Data.ParameterDirection.Input;
                        command.Parameters.Add(param);
                    }
                } 
                var messageParam = new SqlParameter("@Message", System.Data.SqlDbType.NVarChar, 255)
                {
                    Direction = System.Data.ParameterDirection.Output
                };
                command.Parameters.Add(messageParam);

                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                command.ExecuteNonQuery();

                // Retrieve the output value
                outputMessage = messageParam.Value.ToString();
            }

            return outputMessage;
        }

    

}


}
