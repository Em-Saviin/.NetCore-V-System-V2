using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;

namespace V_System_Core.Controllers
{
    public class ProfileSettingController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public ProfileSettingController(AppDbContext _dbContext)
        {
            this.db = _dbContext; 
        }
        //View Index
        public IActionResult Index()
        {
            return View();
        }
    }
}
