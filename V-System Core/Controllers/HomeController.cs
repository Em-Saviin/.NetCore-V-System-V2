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
            if (isAdmin) { 
                  MenuResult = db.tbl_Menus.Where(m => m.is_active == true).ToList();
                  ModuleResult = db.tbl_Modules.Where(md => md.is_active == true).ToList();
            }
            else
            {
                //MenuResult = (from m in db.tbl_Menus
                //                  join rpm in db.tbl_Role_Menu_Permissions on m.ID equals rpm.Menu_Id
                //                  join c in db.tbl_Company on rpm.Company_Id equals c.ID
                //                  join u in db.tbl_Users on c.ID equals u.Company_Id
                //                  join ur in db.tbl_UserRoles on rpm.Role_Id equals ur.Role_Id
                //                  where rpm.User_Id == UserID && rpm.Is_Active == true
                //                  orderby m.Level ascending
                //                  select m).Distinct().ToList();
                MenuResult = (from m in db.tbl_Menus
                              join mpd in db.tbl_Role_Menu_Permissions on m.ID equals mpd.Menu_Id 
                              join r in db.tbl_UserRoles on mpd.Role_Id equals r.Role_Id
                              where r.User_Id == UserID && mpd.Is_Active == true 
                              orderby m.level ascending
                              select m).Distinct().ToList();

                ModuleResult = (from md in db.tbl_Modules
                                join rmp in db.tbl_Role_Module_Permissions on md.ID equals rmp.Module_Id
                                join u in db.tbl_UserRoles on rmp.Role_Id equals u.Role_Id
                                where rmp.User_Id == UserID
                                && rmp.Is_Active == true
                                orderby md.level ascending
                                select md).ToList();
                //ModuleResult = (from m in db.tbl_Modules
                //                join mpd in db.tbl_Module_Permission_Detail on m.ID equals mpd.Module_Id
                //                join u in db.tbl_Users on mpd.User_Id equals u.ID
                //                where mpd.User_Id == UserID && mpd.Is_Active == true && m.Is_Active == true
                //                orderby m.Level ascending
                //                select m).Distinct().ToList(); 
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
