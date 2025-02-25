using Microsoft.AspNetCore.Mvc;

namespace V_System_Core.Component
{
    public class UserManagerInfo : Controller
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public int _UserId { get; set; } 
        public UserManagerInfo(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor ?? throw new ArgumentNullException(nameof(httpContextAccessor)); 
            var userIdCookie = _httpContextAccessor.HttpContext?.Request.Cookies["UserID"];
            _UserId = userIdCookie != null ? Convert.ToInt32(userIdCookie) : 0;
        }
    }
}
