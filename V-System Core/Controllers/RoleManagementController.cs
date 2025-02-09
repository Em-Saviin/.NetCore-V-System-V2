using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;

namespace V_System_Core.Controllers
{
    public class RoleManagementController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public RoleManagementController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }

        //View Index
        public IActionResult Index()
        {
            return View();
        }
        
        //Block Action
    }
}
