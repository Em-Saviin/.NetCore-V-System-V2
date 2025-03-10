using System.Security.Claims;

namespace V_System_Core.Component
{
    public static class ClaimsPrincipalExtensions
    {
        public static int GetUserId(this ClaimsPrincipal claimsPrincipal)
        {
             var userId = claimsPrincipal.FindFirstValue("UserId"); 
            return userId != null && int.TryParse(userId, out var id) ? id : 0;
        }
        public static int GetUserIdFromCookie(HttpContext httpContext)
        {
            if (httpContext?.User == null || !httpContext.User.Identity.IsAuthenticated)
            {
                return 0; // Return a default value if the user is not authenticated
            }
            var userIdClaim = httpContext.User.FindFirst("UserId");

            // Check if the claim exists and can be parsed to an integer
            if (userIdClaim != null && int.TryParse(userIdClaim.Value, out int userId))
            {
                return userId; // Return the parsed UserID if it's valid
            } 
            return 0; 
        }
    }
}
