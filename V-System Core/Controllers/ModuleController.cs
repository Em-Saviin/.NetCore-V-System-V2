using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using V_System_Core.Component;
using V_System_Core.Data;
using V_System_Core.Models;

namespace V_System_Core.Controllers
{
    [Authorize]
    public class ModuleController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;

        public ModuleController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }

        //Index View
        public IActionResult Index()
        {
            return View();
        }

        //--Block Module---
        [HttpGet]
        public JsonResult GetModuleListSelect()
        {
            try
            {
                var MenuResult = db.tbl_Menus.Select(m => new
                {
                    id = m.ID,
                    text = m.menu_name
                }).ToList();

                var combinedResult = new[] { StaticClass.defaultSelect2 }
                                            .Concat(MenuResult)
                                            .ToList();
                return Json(new { code = 0, data = combinedResult });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        [HttpGet]
        public JsonResult GetModuleList(int menuId)
        {
            try
            {
                if (menuId == 0)
                {
                    var moduleResult = (from md in db.tbl_Modules
                                        join menu in db.tbl_Menus on md.menu_id equals menu.ID
                                        where (md.is_active == true)
                                        select new
                                        {
                                            md.ID,
                                            md.module_name,
                                            md.module_name_kh,
                                            menu.menu_name,
                                            md.level,
                                            md.icon,
                                            md.controller,
                                            md.views,
                                            md.partial_name,
                                            md.url,
                                            MenuId = menu.ID,
                                            md.is_active
                                        }).ToList();
                    return Json(new { code = 0, data = moduleResult });
                }
                else
                {
                    var moduleResult = (from md in db.tbl_Modules
                                        join menu in db.tbl_Menus on md.menu_id equals menu.ID
                                        where (md.is_active == true && md.menu_id == menuId)
                                        select new
                                        {
                                            md.ID,
                                            md.module_name,
                                            md.module_name_kh,
                                            menu.menu_name,
                                            md.level,
                                            md.icon,
                                            md.controller,
                                            md.views,
                                            md.partial_name,
                                            md.url,
                                            MenuId = menu.ID,
                                            md.is_active
                                        }).ToList();
                    return Json(new { code = 0, data = moduleResult });
                }

            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        [HttpPost]
        public JsonResult GetModuleListDetail(int menuId)
        {
            try
            {
                var moduleResult = (from md in db.tbl_Modules
                                    join menu in db.tbl_Menus on md.menu_id equals menu.ID
                                    where (md.ID == menuId)
                                    select new
                                    {
                                        md.ID,
                                        md.module_name,
                                        md.module_name_kh,
                                        menu.menu_name,
                                        md.level,
                                        md.icon,
                                        md.controller,
                                        md.views,
                                        md.partial_name,
                                        md.url,
                                        md.menu_id,
                                    }).ToList();
                return Json(new { code = 0, data = moduleResult });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        [HttpPost]
        public JsonResult AddModule(tbl_Modules objs)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(objs.url))
                {
                    objs.url = "#";
                }

                if (objs.ID == 0)
                {

                    var newModuleItem = new tbl_Modules
                    {
                        module_name = objs.module_name,
                        module_name_kh = objs.module_name_kh,
                        is_active = true,
                        icon = objs.icon,
                        partial_name = objs.partial_name,
                        views = objs.views,
                        controller = objs.controller,
                        url = objs.url,
                        menu_id = objs.menu_id,
                        level = objs.level
                    };
                    db.tbl_Modules.Add(newModuleItem);
                    db.SaveChanges();
                    return Json(new { code = 0, message = "Module" + objs.module_name + " added successfully." });
                }
                else
                {
                    var mdExist = db.tbl_Modules.FirstOrDefault(m => m.ID == objs.ID);
                    if (mdExist != null)
                    {

                        mdExist.module_name = objs.module_name ?? mdExist.module_name;
                        mdExist.module_name_kh = objs.module_name_kh ?? mdExist.module_name_kh;
                        mdExist.icon = objs.icon ?? mdExist.icon;
                        mdExist.level = objs.level ?? mdExist.level;
                        mdExist.partial_name = objs.partial_name ?? mdExist.partial_name;
                        mdExist.menu_id = objs.menu_id;
                        mdExist.views = objs.views;
                        mdExist.controller = objs.controller;
                        mdExist.url = objs.url;
                        db.SaveChanges();
                        return Json(new { code = 0, message = "Module" + objs.module_name + " update successfully." });
                    }
                    else
                    {
                        return Json(new { code = 11, message = "Module not found." });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = "Error: " + ex.Message });
            }
        }
        public JsonResult DeleteModule(int menuId)
        {
            try
            {
                var menu = db.tbl_Modules.FirstOrDefault(m => m.ID == menuId);

                if (menu == null)
                {
                    return Json(new { code = 111, message = "Module not found." });
                }
                menu.is_active = false;
                db.SaveChanges();
                return Json(new { code = 0, success = true, message = "Module deleted successfully." });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, success = true, message = ex.Message });

            }
        }
    }
}
