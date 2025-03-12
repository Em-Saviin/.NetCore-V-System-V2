using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using V_System_Core.Component;
using V_System_Core.Data;
using V_System_Core.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;

namespace V_System_Core.Controllers
{

    [Authorize]
    public class PermissionController : Controller
    {
        private readonly UserManagerInfo _ManagerUserID;  
        private readonly V_System_Core.Data.AppDbContext db; 
        public PermissionController(AppDbContext _dbContext , UserManagerInfo userMangerInfo  )
        { 
            this.db = _dbContext;
            this._ManagerUserID = userMangerInfo;  
            if(_ManagerUserID._UserId == 0 ) { 
                RedirectToAction("Login", "Dashboard");
            };
        }
         
        public IActionResult Index()
        {
          
            return View();
        }

        //Block Action 
        //Block Permission on Role
        public IActionResult GetDataSelect2()
        {
            var RoleData = MyHelperSql.GetSelect2Item(db, "ROLE", 0); 
            var MenuData = db.tbl_Menus.Where(m => m.is_active == true).Select(mm => new { Id = mm.ID, Text = mm.menu_name }).ToArray();
            var UserData = db.tbl_Users.Where(u => u.is_active == true).Select(uu => new { Id = uu.ID, Text = uu.lastname + " " + uu.firstname }).ToArray();
            return Json(new { RoleData = RoleData, MenuData = MenuData ,UserData = UserData });
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
            var rows = MyHelperSql.ExecSpReturnObj(db, sql, param);
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
        public IActionResult AssignRoleToUser(int roleId, string remark, string JsonData)
        {
            try
            {
                if (JsonData.IsNullOrEmpty())
                {
                    return Json(new { code = 300, message = "User can not to null!!" });
                } 
                string sql = "SP_ASSIGN_ROLE_TO_USER";
                var param = new[]
                { 
                new SqlParameter("@RoleId", roleId),
                new SqlParameter("@AssignBy",  _ManagerUserID._UserId ),
                new SqlParameter("@JsonData", JsonData),
                new SqlParameter("@Remark", remark)
                };
              var _FromMessage =   MyHelperSql.ExexSpReturnMessageFromStore(db, sql, param);
                return Json(new {code = 0 , message = _FromMessage });
            }
            catch (Exception ex) { 
                return Json(new { code = 500 , message = ex.Message });
            }  
        }
        public IActionResult SavePermissionsOnRole(string JsonData)
        {

            try
            {
                if (string.IsNullOrEmpty(JsonData))
                {
                    return Json(new { code = 300, message = "User cannot be null!!" });
                } 
                var param = new[]
                    {
                        new SqlParameter("@AssignBy", SqlDbType.Int) { Value = _ManagerUserID._UserId },
                        new SqlParameter("@JsonData", SqlDbType.NVarChar) { Value = JsonData }
                    };

                var _FromMessage = MyHelperSql.ExexSpReturnMessageFromStore(db, "SP_SAVE_ON_ROLE_PERMISSION", param);
                return Json(new { code = 0, message = _FromMessage }); 
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, message = ex.Message });
            } 
        }

        //---------------------------------------------------------------------------------
        public IActionResult GetListPermissionOnUserRole(int menuId , int userId)
        {
            string sql = "SP_GET_MODULE_ON_USER_ROLE_PERMISSION";
            var param = new[]
            {
                new SqlParameter("@MenuId", menuId), 
                new SqlParameter("@UserId", userId)
            };
            var rows = MyHelperSql.ExecSpReturnObj(db, sql, param);
            return Json(new { data = rows });
        }

        public IActionResult GetUserSelect2(int roleId = 0)
        {
            var UserData = MyHelperSql.GetSelect2Item(db, "DATA_USER_ROLE", roleId);
            return Json(new { userData = UserData });

        }

        public IActionResult SavePermissionsRoleOnUser(String JsonData)
        {
            try
            {
                if (string.IsNullOrEmpty(JsonData))
                {
                    return Json(new { code = 300, message = "User cannot be null!!" });
                }
                 
                var param = new[]
                    {
                        new SqlParameter("@AssignBy", SqlDbType.Int) { Value = _ManagerUserID._UserId },
                        new SqlParameter("@JsonData", SqlDbType.NVarChar) { Value = JsonData }
                    };

                var _FromMessage = MyHelperSql.ExexSpReturnMessageFromStore(db, "SP_SAVE_USER_ROLE_PERMISSIONS", param);
                return Json(new { code = 0, message = _FromMessage });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, message = ex.Message });
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
            var userRoleData = (from u in db.tbl_Users
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
                               });
            return Json(new { data = userRoleData.ToList() });
        }

        public IActionResult GetSelect2UserNotInRole(int roleId = 0)
        {
            var UserNotInRoleData = MyHelperSql.GetSelect2Item(db, "USER_NOT_IN_ROLE", roleId);
            return Json(new { UserNotInRoleData });

        }
        public IActionResult RemoveRoleFromUser(int roleId , int userId)
        {
            try
            {
                var messageParam = MyMethodHelper.GetOutputMessageParameter();
                string sql = "EXEC SP_DELETE_ROLE_FROM_USER @RoleId, @UserId, @Message OUTPUT";

                db.Database.ExecuteSqlRaw(sql,
                    new SqlParameter("@RoleId", roleId),
                    new SqlParameter("@UserId", userId),
                    messageParam);

                string message = messageParam.Value.ToString() ?? "";

                return Json(new { code = 0, message = "Success delete!" });
            }
            catch(Exception e)
            {
                return Json(new { code = 400, message = e.Message });
            }
        }
    }
}
