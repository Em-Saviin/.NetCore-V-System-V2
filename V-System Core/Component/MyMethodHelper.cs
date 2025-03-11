using Azure.Core;
using Azure;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace V_System_Core.Component
{
    public class MyMethodHelper
    {
        private static int? _storeModuleId;

        public static void SetUserCookie(HttpContext context, string cookieName, string cookieValue)
        {
            context.Response.Cookies.Append(cookieName, cookieValue, new CookieOptions
            {
                Expires = DateTimeOffset.UtcNow.AddMinutes(10),
                HttpOnly = true,
                Secure = true,
                SameSite = SameSiteMode.Lax
            });
        }
        public static IActionResult RedirectToLogin()
        {
            return new RedirectResult("/Dashboard/Login");
        }
        public static SqlParameter GetOutputMessageParameter()
        {
            return new SqlParameter
            {
                ParameterName = "@Message",
                SqlDbType = System.Data.SqlDbType.NVarChar,
                Size = 255,
                Direction = System.Data.ParameterDirection.Output
            };
        } 
        public static void SetModuleId(int data)
        {
            _storeModuleId = data;
        }

        // Method to get data
        public static int GetModuleId()
        {
            return _storeModuleId ?? 0;
        }

         
        
    }
}
     
