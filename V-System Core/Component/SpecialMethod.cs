using Azure.Core;
using Azure;

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
                Secure = false,
                SameSite = SameSiteMode.Lax
            });
        } 
    }
}
