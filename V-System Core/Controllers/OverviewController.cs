using Microsoft.AspNetCore.Mvc;

namespace V_System_Core.Controllers
{
    public class OverviewController : Controller
    {
  
        public IActionResult Index()
        {
            ViewBag.UserName = Request.Cookies["UserName"];
            ViewBag.UserId = Request.Cookies["UserID"];
            return View();
        }
    }
}
