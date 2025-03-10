using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace V_System_Core.Component
{
    public   class UserManagerInfo : Controller
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public int _UserId { get; set; }
        public UserManagerInfo(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor ?? throw new ArgumentNullException(nameof(httpContextAccessor));

            var user = _httpContextAccessor.HttpContext?.User;
            if (user != null && user.Identity.IsAuthenticated)
            {
                var userIdClaim = user.FindFirst("UserID")?.Value;
                _UserId = !string.IsNullOrEmpty(userIdClaim) ? Convert.ToInt32(userIdClaim) : 0;
            }
            else
            {
                _UserId = 0;
            }
        }
        //public UserManagerInfo(IHttpContextAccessor httpContextAccessor)
        //{
        //    _httpContextAccessor = httpContextAccessor ?? throw new ArgumentNullException(nameof(httpContextAccessor)); 
        //     var userIdCookie = _httpContextAccessor.HttpContext?.Request.Cookies["UserID"];
           

        //    _UserId = userIdCookie != null ? Convert.ToInt32(userIdCookie) : 0;
        //}
    }
}
