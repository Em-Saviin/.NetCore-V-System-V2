using Microsoft.AspNetCore.Mvc;

namespace V_System_Core.Controllers
{
    public class SalesReportController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
