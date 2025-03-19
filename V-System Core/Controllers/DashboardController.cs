using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using V_System_Core.Data;
using V_System_Core.Models;

namespace V_System_Core.Controllers
{

    public class DashboardController : Controller
    {
   
        private readonly V_System_Core.Data.AppDbContext db; 
        public DashboardController(AppDbContext _dbContext)
        { 
            this.db = _dbContext;  
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return View();
        } 

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> CheckLogin(tbl_Users objs)
        {
            if (objs == null || string.IsNullOrEmpty(objs.username) || string.IsNullOrEmpty(objs.password))
            {
                return Json(new { success = 12, redirectUrl = Url.Action("Login", "Dashboard"), message = "Please input your information!" });
            }

            var user = db.tbl_Users.FirstOrDefault(u => u.username == objs.username && u.password == objs.password);

            if (user != null && user.ID.HasValue && user.username != null)
            {
                
                var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.username), 
                        new Claim(ClaimTypes.NameIdentifier, user.ID.ToString() ?? "0"),
                         new Claim("UserID", user.ID.ToString() ?? "0")

                    }; 
                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity); 
                // Set the authentication cookie with the user's claims
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsPrincipal, new AuthenticationProperties
                {
                    IsPersistent = true 
                });

                return Json(new { success = 0, redirectUrl = Url.Action("Index", "Home") });
            }
            else
            {
                return Json(new { success = 11, redirectUrl = Url.Action("Login", "Dashboard"), message = "Incorrect username or password!" });
            }
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme); 
            return RedirectToAction("Login");
        }   
    }
}
