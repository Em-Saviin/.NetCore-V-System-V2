using Microsoft.AspNetCore.Mvc; 
using System.Diagnostics;
using System.Reflection;
using V_System_Core.Data;
using V_System_Core.Models; 

namespace V_System_Core.Controllers
{
    public class HomeController : Controller
    { 
        private readonly V_System_Core.Data.AppDbContext db;
        private int UserID { get; set; }
        private readonly string? _connectionString;

        public HomeController(AppDbContext _dbContext )
        { 
            this.db = _dbContext; 
        }

        public IActionResult Index()
        { 
            if (Request.Cookies["UserID"] != null)
            {
                UserID = Convert.ToInt32(Request.Cookies["UserID"]);
            }
            else
            {
                return RedirectToAction("Login", "Dashboard");
            }
            var InfoUser = db.tbl_Users.Where(u => u.ID == UserID).FirstOrDefault(); 
            
            if (InfoUser == null)
            { 
                return RedirectToAction("Login", "Dashboard");
            }

            List<tbl_Menus> MenuResult = new List<tbl_Menus>();
            List<tbl_Modules> ModuleResult = new List<tbl_Modules>();
            //Find Role
            var userRoles = (from r in db.tbl_Roles
                         join u in db.tbl_UserRoles
                         on r.ID equals u.Role_Id
                         where u.User_Id == UserID
                         select new
                         {
                             r.ID,
                             r.Role_Name
                         }).ToList();
            
            bool isAdmin = userRoles.Any(role => role.Role_Name == "Admin");
            var userRoleId = userRoles 
                                    .Select(role => role.ID)
                                    .FirstOrDefault();

            if (isAdmin) { 
                  MenuResult = db.tbl_Menus.Where(m => m.is_active == true).ToList();
                  ModuleResult = db.tbl_Modules.Where(md => md.is_active == true).ToList();
            }
            else
            { 
                  
                MenuResult = (from m in db.tbl_Menus
                              join md in db.tbl_Modules on m.ID equals md.menu_id
                              join pmu in db.tbl_Permission_Module_On_User on md.ID equals pmu.module_id
                              join u in db.tbl_Users on pmu.user_id equals u.ID
                              join ur in db.tbl_UserRoles on u.ID equals ur.User_Id
                              join pmr in db.tbl_Permission_Module_On_Role on pmu.module_id equals pmr.module_id into pmrJoin
                              from pmr in pmrJoin.DefaultIfEmpty()  
                              where ur.User_Id == UserID
                                    && pmr.is_active == true
                                    && m.is_active == true
                                    && ur.Role_Id == userRoleId
                                    && pmu.list == true
                              orderby m.level descending
                              select m).Distinct().ToList();

                ModuleResult = (from md in db.tbl_Modules
                                join rmp in db.tbl_Permission_Module_On_User on md.ID equals rmp.module_id 
                                where rmp.user_id == UserID 
                                && rmp.list == true
                                && rmp.is_active == true
                                orderby md.level ascending
                                select md).ToList(); 
                
            } 
            ViewData["MenuData"] = MenuResult;
            ViewData["ModuleData"] = ModuleResult;
            ViewBag.Username = InfoUser?.username ?? "Unknow User";
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
