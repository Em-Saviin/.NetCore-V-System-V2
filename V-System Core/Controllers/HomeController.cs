using Azure.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore; 
using System.Diagnostics;
using System.Security.Claims;
using V_System_Core.Component;
using V_System_Core.Data;
using V_System_Core.Models; 

namespace V_System_Core.Controllers
{ 
    public class HomeController : Controller
    { 
        private readonly V_System_Core.Data.AppDbContext db;
        private int UserID { get; set; }
        
        public HomeController(AppDbContext _dbContext )
        { 
            this.db = _dbContext; 
        }
      
        public IActionResult Index()
        {
            UserID = Convert.ToInt32(User.FindFirst(ClaimTypes.NameIdentifier)?.Value); 
            var InfoUser = db.tbl_Users.Where(u => u.ID == UserID).FirstOrDefault(); 
            
            if (InfoUser == null)
            { 
                return RedirectToAction("Login", "Dashboard");
            }

            List<tbl_Menus> MenuResult1 = new List<tbl_Menus>();
            List<tbl_Menus> MenuResult2 = new List<tbl_Menus>();
            List<tbl_Menus> FinalMenuResult = new List<tbl_Menus>();
            List<tbl_Modules> ModuleResult1 = new List<tbl_Modules>();
            List<tbl_Modules> ModuleResult2 = new List<tbl_Modules>();
            List<tbl_Modules> FinalModuleResult = new List<tbl_Modules>();
            //Find Role
            var userRoles = (from r in db.tbl_Roles
                         join u in db.tbl_UserRoles
                         on r.ID equals u.Role_Id
                         where u.User_Id == UserID
                         select new   { r.ID,  r.Role_Name }).ToList();
            
            bool isAdmin = userRoles.Any(role => role.Role_Name == "Admin");
            var userRoleId = userRoles.Select(role => role.ID).FirstOrDefault() ;  
          
            FinalMenuResult = db.GetMenuByRole(UserID).ToList(); 
            FinalModuleResult = db.GetModuleByRole(UserID).ToList(); 
            ViewBag.Rolename = "NotAdmin";
          
            ViewData["MenuData"] = FinalMenuResult;
            ViewData["ModuleData"] = FinalModuleResult;
            ViewBag.OverviewDashboard = FinalModuleResult.FirstOrDefault(md => md.ID == 27) != null ? true : false;
            ViewBag.Username = InfoUser?.username ?? "Unknow User" ;
            return View();
        }

      


        public JsonResult LoadIframeView(int moduleId)
        {
            
            var dataModule = (from md in db.tbl_Modules
                        join mn in db.tbl_Menus on md.menu_id equals mn.ID
                        where md.ID == moduleId
                        select new
                        {
                            ModuleController = md.controller,
                            ModuleViews = md.views,
                            ModuleName = md.module_name,
                            ModuleIcon = md.icon,
                            MenuIcon = mn.icon,
                            MenuName = mn.menu_name
                        }).FirstOrDefault();


            if (dataModule == null)
            {
                return Json(new { error = "Module not found" });
            } 
            return Json(new {  data = dataModule });
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

         
    }
}
