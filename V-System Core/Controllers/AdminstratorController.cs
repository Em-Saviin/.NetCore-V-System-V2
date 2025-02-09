using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;
using System.Globalization;
using System.Linq;
using V_System_Core.Data;
using V_System_Core.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using V_System_Core.Component;

namespace V_System_Core.Controllers
{
    public class AdminstratorController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db; 
       
        public AdminstratorController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        //Block Menu
        //[HttpGet]
        //public JsonResult GetMenuList()
        //{
        //    try
        //    {
        //        var MenuResult = db.tbl_Menus.Where(m => m.is_active == true).ToList(); 
        //        return Json(new { code = 0, data = MenuResult });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //public JsonResult GetMenuInfo(int menuId)
        //{
        //    try
        //    {
        //        var MenuResult = db.tbl_Menus.Where(mm => mm.ID == menuId && mm.is_active == true).ToList();
        //        return Json(new { code = 0, data = MenuResult });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //public JsonResult AddMenu(tbl_Menus objs)
        //{
        //    try
        //    {
        //        if (string.IsNullOrWhiteSpace(objs.partial_name))
        //        {
        //            objs.partial_name = "#";
        //        }
        //        if (objs.ID == 0)
        //        {
        //            var newMenuItem = new tbl_Menus
        //            {
        //                menu_name = objs.menu_name,
        //                menu_name_kh = objs.menu_name_kh,
        //                level = 1,
        //                icon = objs.icon,
        //                partial_name = objs.partial_name,
        //                is_active = true
        //            };
        //            db.tbl_Menus.Add(newMenuItem);
        //            db.SaveChanges();
        //            return Json(new { code = 0, message = "Menu" + objs.menu_name + "Save Successfully!!" });
        //        }
        //        else
        //        {
        //            var thisMenu = db.tbl_Menus.FirstOrDefault(m => m.ID == objs.ID);

        //            if (thisMenu != null)
        //            {
        //                thisMenu.menu_name = objs.menu_name;
        //                thisMenu.menu_name_kh = objs.menu_name_kh;
        //                thisMenu.level = objs.level;
        //                thisMenu.icon = objs.icon;
        //                thisMenu.partial_name = objs.partial_name;
        //                db.SaveChanges();
        //                return Json(new { code = 0, message = "Menu " + objs.menu_name + " updated successfully!" });
        //            }
        //            else
        //            {
        //                return Json(new { code = 1, message = "Menu not found for update!" });
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //public JsonResult DeleteMenu(int menuId)
        //{
        //    try
        //    { 
        //        var menu = db.tbl_Menus.FirstOrDefault(m => m.ID == menuId);
                
        //        if (menu == null)
        //        {
        //            return Json(new { success = false, message = "Menu not found." });
        //        }
        //        menu.is_active = false; 
        //        db.SaveChanges();
        //        return Json(new { code = 0 , success = true, message = "Menu deleted successfully." });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, success = true, message = ex.Message });

        //    }
        //}

        ////--Block Module---
        //[HttpGet]
        //public JsonResult GetModuleListSelect()
        //{
        //    try
        //    {
        //        var MenuResult = db.tbl_Menus.Select(m => new
        //        {
        //            id = m.ID,
        //            text = m.menu_name
        //        }).ToList();
               
        //        var combinedResult = new[] { StaticClass.defaultSelect2 }
        //                                    .Concat(MenuResult)
        //                                    .ToList();
        //        return Json(new { code = 0, data = combinedResult });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //[HttpGet]
        //public JsonResult GetModuleList(int menuId)
        //{
        //    try
        //    {
        //        if(menuId == 0)
        //        {
        //            var moduleResult = (from md in db.tbl_Modules
        //                                join menu in db.tbl_Menus on md.menu_id equals menu.ID
        //                                where (md.is_active == true)
        //                                select new
        //                                {
        //                                    md.ID,
        //                                    md.module_name,
        //                                    md.module_name_kh,
        //                                    menu.menu_name,
        //                                    md.level,
        //                                    md.icon,
        //                                    md.controller,
        //                                    md.views,
        //                                    md.partial_name,
        //                                    md.url,
        //                                    MenuId = menu.ID,
        //                                    md.is_active
        //                                }).ToList();
        //            return Json(new { code = 0, data = moduleResult });
        //        }
        //        else
        //        {
        //            var moduleResult = (from md in db.tbl_Modules
        //                                join menu in db.tbl_Menus on md.menu_id equals menu.ID
        //                                where (md.is_active == true && md.menu_id == menuId)
        //                                select new
        //                                {
        //                                    md.ID,
        //                                    md.module_name,
        //                                    md.module_name_kh,
        //                                    menu.menu_name,
        //                                    md.level,
        //                                    md.icon,
        //                                    md.controller,
        //                                    md.views,
        //                                    md.partial_name,
        //                                    md.url,
        //                                    MenuId = menu.ID,
        //                                    md.is_active
        //                                }).ToList();
        //            return Json(new { code = 0, data = moduleResult });
        //        }
               
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //[HttpPost]
        //public JsonResult GetModuleListDetail(int menuId)
        //{
        //    try
        //    {
        //        var moduleResult = (from md in db.tbl_Modules
        //                            join menu in db.tbl_Menus on md.menu_id equals menu.ID
        //                            where (md.ID == menuId)
        //                            select new
        //                            {
        //                                md.ID,
        //                                md.module_name,
        //                                md.module_name_kh,
        //                                menu.menu_name,
        //                                md.level,
        //                                md.icon,
        //                                md.controller,
        //                                md.views,
        //                                md.partial_name,
        //                                md.url,
        //                                md.menu_id, 
        //                            }).ToList();
        //        return Json(new { code = 0, data = moduleResult });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}
        //[HttpPost]
        //public JsonResult AddModule(tbl_Modules objs )
        //{
        //    try
        //    {
        //        if (string.IsNullOrWhiteSpace(objs.url))
        //        { 
        //            objs.url = "#";
        //        }

        //        if (objs.ID == 0)
        //        {
                    
        //            var newModuleItem  = new tbl_Modules{ 
        //                module_name = objs.module_name,
        //                module_name_kh = objs.module_name_kh,
        //                is_active = true,
        //                icon = objs.icon,
        //                partial_name = objs.partial_name,
        //                views = objs.views,
        //                controller = objs.controller,
        //                url = objs.url,
        //                menu_id = objs.menu_id,
        //                level = objs.level
        //            }; 
        //            db.tbl_Modules.Add(newModuleItem);
        //            db.SaveChanges(); 
        //            return Json(new { code = 0, message = "Module" + objs.module_name + " added successfully." });
        //        }
        //        else
        //        { 
        //            var mdExist = db.tbl_Modules.FirstOrDefault(m => m.ID == objs.ID);
        //            if (mdExist != null)
        //            {

        //                mdExist.module_name = objs.module_name ?? mdExist.module_name;
        //                mdExist.module_name_kh = objs.module_name_kh ?? mdExist.module_name_kh;
        //                mdExist.icon = objs.icon ?? mdExist.icon;
        //                mdExist.level = objs.level ?? mdExist.level;
        //                mdExist.partial_name = objs.partial_name ?? mdExist.partial_name;
        //                mdExist.menu_id = objs.menu_id;
        //                mdExist.views = objs.views;
        //                mdExist.controller = objs.controller;
        //                mdExist.url = objs.url;
        //                db.SaveChanges();
        //                return Json(new { code = 0, message = "Module" + objs.module_name + " update successfully." });
        //            }
        //            else
        //            { 
        //                return Json(new { code = 11, message = "Module not found." });
        //            }
        //        } 
        //    }
        //    catch (Exception ex)
        //    { 
        //        return Json(new { code = 11, message = "Error: " + ex.Message });
        //    }
        //}
        //public JsonResult DeleteModule(int menuId)
        //{
        //    try
        //    {
        //        var menu = db.tbl_Modules.FirstOrDefault(m => m.ID == menuId);

        //        if (menu == null)
        //        {
        //            return Json(new { code = 111, message = "Module not found." });
        //        }
        //        menu.is_active = false;
        //        db.SaveChanges();
        //        return Json(new { code = 0, success = true, message = "Module deleted successfully." });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new { code = 11, success = true, message = ex.Message });

        //    }
        //}

        //BLock User
        //public JsonResult GetUserList()
        //{
        //    try
        //    {
        //        var userList = db.tbl_Users.ToList();
        //        return Json(new { data = userList  }); 
        //    }catch(Exception ex)
        //    {
        //        return Json(new { code = 11, message = ex.Message });
        //    }
        //}



        //Block Company
        //[HttpPost]
        //public JsonResult RegisterCompany([FromForm] tbl_Company model, IFormFile companyPhoto)
        //{
        //    try
        //    {  
        //        if (companyPhoto != null && companyPhoto.Length > 0)
        //        {
                   
        //            var uploadsDirectory = Path.Combine("wwwroot", "lib", "uploads", "companylogo");
        //            if (!Directory.Exists(uploadsDirectory))
        //            {
        //                Directory.CreateDirectory(uploadsDirectory);
        //            }

        //            string sanitizedCompanyName = !string.IsNullOrEmpty(model.company_name)
        //                                        ? model.company_name.Replace(" ", "_").ToLower()
        //                                        : "default_company";

        //            string fileExtension = Path.GetExtension(companyPhoto.FileName);
        //            string newFileName = $"{sanitizedCompanyName}{fileExtension}";
        //            var filePath = Path.Combine(uploadsDirectory, newFileName);
        //            using (var stream = new FileStream(filePath, FileMode.Create))
        //            {
        //                  companyPhoto.CopyToAsync(stream);
        //            }
        //            string logoPath = $"/lib/uploads/companylogo/{newFileName}";
        //            var companies = new tbl_Company
        //            {
        //                company_code = model.company_code,
        //                company_name = model.company_name,
        //                logo = newFileName,
        //                path_logo = logoPath,
        //                bussiness_type = model.bussiness_type,
        //                register_number = model.register_number,
        //                register_date = model.register_date,
        //                address = model.address,
        //                contact_email = model.contact_email,
        //                contact_phone = model.contact_phone,
        //                contact_name = model.contact_name,
        //                is_active = true
        //            };

        //            db.tbl_Company.Add(companies);
        //            db.SaveChanges();
        //        }

        //        return Json(new { code = 0, message = "Company registered successfully!" });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(  new { code = 11, message = "Error: " + ex.Message });
        //    }
        //}

        //public JsonResult GetCompanyList()
        //{
        //    try
        //    {
        //        var companyList = db.tbl_Company.ToList();
        //        return Json(new { data = companyList });
        //    }catch(Exception e)
        //    {
        //        return Json(new { code = 0, message = e.Message });
        //    }
        //}


        //Block department
        //[HttpGet]
        //public IActionResult GetCompanies()
        //{ 
        //    var companies = db.tbl_Company
        //                   .Select(c => new
        //                   {
        //                       id = c.ID.ToString(),
        //                       text = c.company_name,
        //                       parent = "#"  
        //                   }).ToList();
        //    return Json(new { code = 0, data = companies }); 
        //}
        //[HttpGet]
        //public IActionResult GetDepartments(int companyId)
        //{
        //     if(companyId != 0 )
        //        {
        //            var departments = db.tbl_Department
        //                               .Where(d => d.company_id == companyId)
        //                               .Select(d => new
        //                               {
        //                                   id = d.ID.ToString(),
        //                                   text = d.name,
        //                                   parent = companyId.ToString()
        //                               }).ToList();
        //            return Json(new { code = 0, data = departments });
        //    }
        //    else
        //    {
        //        var departments = db.tbl_Department
        //                                .Select(d => new
        //                                {
        //                                    id = d.ID.ToString(),
        //                                    text = d.name,
        //                                    parent = companyId.ToString()
        //                                }).ToList();
        //        return Json(new { code = 0, data = departments });
        //    }
            
        //} 

        //public IActionResult GetAllDepartments()
        //{
        //    try
        //    {
        //        var departments = db.tbl_Department
        //                                          .Where(d => d.is_active == true)
        //                                          .Join(db.tbl_Company,
        //                                              d => d.company_id,
        //                                              c => c.ID,
        //                                              (d, c) => new
        //                                              {
        //                                                  id = d.ID,
        //                                                  name = d.name,
        //                                                  company_name = c.company_name ,
        //                                                  is_active = d.is_active,
        //                                                  create_date = d.create_date 
        //                                              })
        //                                          .ToList();
        //        return Json(new {code = 0, data = departments});

        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { code = 11 , message = e.Message });

        //    }
        //}

        //Block Icon
        //public IActionResult GetAllIcon()
        //{
        //    try
        //    {
        //        var listIcon = db.tbl_Icons.ToList();
        //        return Json(new {code = 0 , data = listIcon});  
        //    }catch(Exception e)
        //    {
        //        return Json(new { code = 11, message = e.Message});
        //    }
        //}
    } 
}
