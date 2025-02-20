using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using V_System_Core.Component;
using V_System_Core.Data;
using V_System_Core.Models;


namespace V_System_Core.Controllers
{
    public class PermissionController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public PermissionController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }
        public IActionResult Index()
        {
            return View();
        }

        //Block Action

        //Block Permission on Role
        public IActionResult GetDataSelect2()
        {
            var RoleData = StaticClass.GetSelect2Item(db, "ROLE", 0);
            //var MenuData = StaticClass.GetSelect2Item(db, "MENU", 0);
            var MenuData = db.tbl_Menus.Where(m => m.is_active == true).Select(mm => new { Id = mm.ID, Text = mm.menu_name }).ToArray();
            return Json(new { RoleData = RoleData, MenuData = MenuData });
        }
        public IActionResult GetMenu(int menuId = 0, int roleId = 0)
        {

            if (menuId > 0)
            {
                var MenuData = db.tbl_Menus.Where(m => m.ID == menuId).Select(mm => new { id = mm.ID, menu_name = mm.menu_name }).ToList();
                return Json(new { data = MenuData });
            }
            else
            {
                var MenuData = db.tbl_Menus.Select(mm => new { id = mm.ID, menu_name = mm.menu_name }).ToList();
                return Json(new { data = MenuData });
            }

        }
        public IActionResult GetListPermissionOnRole(int menuId   , int roleId  )
        {
            string sql = "SP_GET_MODULE_ON_ROLE_PERMISSION";
            var param = new[]
            {
                new SqlParameter("@MenuId", menuId),
                new SqlParameter("@RoleId", roleId)
            };
            var rows = StaticClass.ExecSPWithParam(db, sql, param);
                        return Json(new { data = rows });
        }

        public IActionResult AddNewRole(string Role_Name, string Description)
        {

            tbl_Roles objNewRole = new tbl_Roles();
            objNewRole.Role_Name = Role_Name;
            objNewRole.Description = Description;
            try
            {
                db.tbl_Roles.Add(objNewRole);
                db.SaveChanges();
                return Json(new { code = 0, message = "Role added successfully!" });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, message = $"An error occurred: {ex.Message}" });
            }
        }

        //---------------------------------------------------------------------------------




        //Block System Role
        public IActionResult GetRoleData()
        {
            var dataRoles = db.tbl_Roles.Select(rr => new
            {
                id = rr.ID,
                role_name = rr.Role_Name,
                description = rr.Description
            }).ToList();

            return Json(new { data = dataRoles });
        }
        public IActionResult GetUserOfRole(int roleId)
        {
            var userRoleData = from u in db.tbl_Users
                               join ur in db.tbl_UserRoles on u.ID equals ur.User_Id into urGroup
                               from ur in urGroup.DefaultIfEmpty()
                               join r in db.tbl_Roles on ur.Role_Id equals r.ID into rGroup
                               from r in rGroup.DefaultIfEmpty()
                               where ur.Role_Id == roleId && u.is_active == true
                               select new
                               {
                                   user_id = u.ID,
                                   fullname = u.lastname + " " + u.firstname,
                                   role_name = r.Role_Name,
                                   user_name = u.username,
                                   sex = u.sex,
                                   assign_date = ur.Assigned_Date
                               };
            return Json(new { data = userRoleData.ToList() });
        }

        public IActionResult GetSelect2UserNotInRole(int roleId = 0)
        {
            var UserNotInRoleData = StaticClass.GetSelect2Item(db, "USER_NOT_IN_ROLE", roleId);
            return Json(new { UserNotInRoleData });

        }
    }
}
