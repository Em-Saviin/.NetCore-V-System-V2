using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
 
using System.Web.Razor.Tokenizer.Symbols;
using V_System_Core.Component;
using V_System_Core.Data;

namespace V_System_Core.Controllers
{ 
    public class RegisterUsersController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public RegisterUsersController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        } 
         
        //View Index
        public IActionResult Index()
        {
            return View();
        }

        //Block Action
        public JsonResult GetUserList()
        {
            try
            {
                var userList = db.tbl_Users.ToList();
                return Json(new {code = 0, data = userList });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = ex.Message });
            }
        }
        public JsonResult LookupData()
        {
            try
            {
                var LookupCompany = MyHelperSql.GetSelect2Item(db, "COMPANY");
                var LookupDepartment = MyHelperSql.GetSelect2Item(db, "COMPANY");
                return Json(new {code = 0 , company = LookupCompany, department = LookupDepartment});
            }
            catch(Exception ex)
            {
                return Json(new { code = 12, message = ex.Message});
            }
        }

    }
}
