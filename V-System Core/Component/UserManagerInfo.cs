using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace V_System_Core.Component
{
    public   class UserManagerInfo : Controller
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public int _UserId { get; private set; }
        public UserManagerInfo(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor ?? throw new ArgumentNullException(nameof(httpContextAccessor)); 
            SetUserId();
        }
        private void SetUserId()
        {
            var user = _httpContextAccessor.HttpContext?.User;
            if (user != null && user.Identity?.IsAuthenticated == true)
            {
                var userIdClaim = user.FindFirst("UserID")?.Value;
                _UserId = !string.IsNullOrEmpty(userIdClaim) ? Convert.ToInt32(userIdClaim) : 0;
            }
            else
            {
                _UserId = 0;
            }
        }

        public int GetUserId()
        {
            return _UserId;
        }


    }
}
