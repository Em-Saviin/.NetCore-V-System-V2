using Azure.Core;
using Azure;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace V_System_Core.Component
{
    public class SpecialMethod
    {
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
    }
}
     
