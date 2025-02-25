using Microsoft.AspNetCore.Mvc;

namespace V_System_Core.Controllers
{
    public class NoPermissionController : Controller
    {
        public IActionResult ErrorStatus400()
        {
            return View();
        }
        public IActionResult ErrorStatus401UnAuthorize()
        {
            return View();
        }
    }
}
