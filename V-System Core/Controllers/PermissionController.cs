using Microsoft.AspNetCore.Mvc;
using V_System_Core.Component;
using V_System_Core.Data;


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

        public IActionResult GetDataSelect2()
        {
            var RoleData = StaticClass.GetSelect2Item(db , "ROLE" , 0);
            var MenuData = StaticClass.GetSelect2Item(db , "MENU" , 0);
            return Json(new { RoleData, MenuData });    
        }

        public IActionResult GetMenu(int menuId = 0, int roleId = 0)
        {
            var MenuData = StaticClass.GetSelect2Item(db, "MENU", 0);
            return Json(new { data = MenuData });
        }
        public IActionResult GetListPermissionOnRole()
        {
            string sql = "SP_GET_MODULE_ON_ROLE_PERMISSION";
            var rows = StaticClass.ExecSPWithoutParam(db, sql);
            return Json(new {data = rows });
        }
    }
}
