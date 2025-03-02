using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;

namespace V_System_Core.Controllers
{
    public class BoostrapIconsController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public BoostrapIconsController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }
        //View Index
        public IActionResult Index()
        {
            return View();
        }

        //Block Action
        public IActionResult GetAllIcon()
        {
            try
            {
                var listIcon = db.tbl_Icons.ToList();
                return Json(new { code = 0, data = listIcon });
            }
            catch (Exception e)
            {
                return Json(new { code = 11, message = e.Message });
            }
        }
 
        //public IActionResult ExportToPdf()
        //{
        //    return new ViewAsPdf("Index")
        //    {
        //        FileName = "IconsReport.pdf",
        //        PageSize = Rotativa.AspNetCore.Options.Size.A4
        //    };
        //} 
    }
}
