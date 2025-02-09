using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;
using V_System_Core.Models;

namespace V_System_Core.Controllers
{
    public class MenuController : Controller
    {

        private readonly V_System_Core.Data.AppDbContext db;
        public MenuController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }
        //View Index
        public IActionResult Index()
        {
            return View();
        }


        //Block Action
        [HttpGet]
        public JsonResult GetMenuList()
        {
            try
            {
                var MenuResult = db.tbl_Menus.Where(m => m.is_active == true).ToList();
                return Json(new { code = 0, data = MenuResult });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        public JsonResult GetMenuInfo(int menuId)
        {
            try
            {
                var MenuResult = db.tbl_Menus.Where(mm => mm.ID == menuId && mm.is_active == true).ToList();
                return Json(new { code = 0, data = MenuResult });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        public JsonResult AddMenu(tbl_Menus objs)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(objs.partial_name))
                {
                    objs.partial_name = "#";
                }
                if (objs.ID == 0)
                {
                    var newMenuItem = new tbl_Menus
                    {
                        menu_name = objs.menu_name,
                        menu_name_kh = objs.menu_name_kh,
                        level = 1,
                        icon = objs.icon,
                        partial_name = objs.partial_name,
                        is_active = true
                    };
                    db.tbl_Menus.Add(newMenuItem);
                    db.SaveChanges();
                    return Json(new { code = 0, message = "Menu" + objs.menu_name + "Save Successfully!!" });
                }
                else
                {
                    var thisMenu = db.tbl_Menus.FirstOrDefault(m => m.ID == objs.ID);

                    if (thisMenu != null)
                    {
                        thisMenu.menu_name = objs.menu_name;
                        thisMenu.menu_name_kh = objs.menu_name_kh;
                        thisMenu.level = objs.level;
                        thisMenu.icon = objs.icon;
                        thisMenu.partial_name = objs.partial_name;
                        db.SaveChanges();
                        return Json(new { code = 0, message = "Menu " + objs.menu_name + " updated successfully!" });
                    }
                    else
                    {
                        return Json(new { code = 1, message = "Menu not found for update!" });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        public JsonResult DeleteMenu(int menuId)
        {
            try
            {
                var menu = db.tbl_Menus.FirstOrDefault(m => m.ID == menuId);

                if (menu == null)
                {
                    return Json(new { success = false, message = "Menu not found." });
                }
                menu.is_active = false;
                db.SaveChanges();
                return Json(new { code = 0, success = true, message = "Menu deleted successfully." });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, success = true, message = ex.Message });

            }
        }

    }
}
