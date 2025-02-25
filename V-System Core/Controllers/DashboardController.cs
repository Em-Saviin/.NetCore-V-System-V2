﻿using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;
using V_System_Core.Models;
 using V_System_Core.Component;
using Azure.Core;
using Microsoft.AspNetCore.Authorization;
namespace V_System_Core.Controllers
{
    
    public class DashboardController : Controller
    {
        private readonly AppDbContext _db;

        public DashboardController(AppDbContext dbcontext)
        {
            _db = dbcontext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }
     
        [HttpPost] 
        public IActionResult CheckLogin(tbl_Users objs)
        {
            if (objs == null || string.IsNullOrEmpty(objs.username) || string.IsNullOrEmpty(objs.password))
            { 
                return Json(new { success = 12, redirectUrl = Url.Action("Login", "Dashboard") , message = "Please input your information!." });
            }

            var user = _db.tbl_Users.FirstOrDefault(u => u.username == objs.username);
      
            if (user != null && user.ID.HasValue && user.username != null)
            {
                string userId = user.ID.Value.ToString();     
                SpecialMethod.SetUserCookie(HttpContext, "UserID", userId);
                SpecialMethod.SetUserCookie(HttpContext, "UserName",  user.username );  
                return Json(new { success = 0, redirectUrl = Url.Action("Index", "Home") });
            }
            else
            { 
                return Json(new { success = 11, redirectUrl = Url.Action("Login", "Dashboard") , message = "Incorrect username or password!!"});
            }
           
        } 
        public IActionResult Logout()
        {
            foreach (var cookie in Request.Cookies)
            {
                Response.Cookies.Append(cookie.Key, "", new CookieOptions
                {
                    Expires = DateTimeOffset.UtcNow.AddMinutes(-100),  
                    HttpOnly = true,
                    Secure = false,
                    SameSite = SameSiteMode.Lax
                });
            }
            return RedirectToAction("Login");
        }
    }
}
