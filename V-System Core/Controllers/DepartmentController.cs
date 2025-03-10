using Microsoft.AspNetCore.Mvc;
using V_System_Core.Component;
using V_System_Core.Data;

namespace V_System_Core.Controllers
{
    public class DepartmentController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db; 
        private readonly UserManagerInfo _ManagerUserID;
       
        public DepartmentController(AppDbContext _dbContext , UserManagerInfo userManagerInfo)
        { 
            this.db = _dbContext;
            this._ManagerUserID = userManagerInfo;
            if (_ManagerUserID._UserId == 0)
            {
                SpecialMethod.RedirectToLogin();
            };
        }

        //View Index
        public IActionResult Index()
        {
            return View();
        }

        //Block Action
        [HttpGet]
        public IActionResult GetCompanies()
        {
            var companies = db.tbl_Company
                           .Select(c => new
                           {
                               id = c.ID.ToString(),
                               text = c.company_name,
                               parent = "#"
                           }).ToList();
            return Json(new { code = 0, data = companies });
        }
        //[HttpGet]
        //public IActionResult GetDepartments(int companyId)
        //{
        //    if (companyId != 0)
        //    {
        //        var departments = db.tbl_Department
        //                           .Where(d => d.company_id == companyId)
        //                           .Select(d => new
        //                           {
        //                               id = d.ID.ToString(),
        //                               text = d.name,
        //                               parent = companyId.ToString()
        //                           }).ToList();
        //        return Json(new { code = 0, data = departments });
        //    }
        //    else
        //    {
        //        var departments = db.tbl_Department
        //                                .Select(d => new
        //                                {
        //                                    id = d.ID.ToString(),
        //                                    text = d.name,
        //                                    parent = companyId.ToString()
        //                                }).ToList();
        //        return Json(new { code = 0, data = departments });
        //    }

        //}

        public IActionResult GetAllDepartments()
        {
            try
            {
                var departments = db.tbl_Department
                                                  .Where(d => d.is_active == true).Select(mm => new
                                                  {
                                                      id = mm.ID,
                                                      name = mm.name,
                                                      company_name = "",
                                                      is_active = mm.is_active,
                                                      create_date = mm.create_date
                                                  }).ToList();
                return Json(new { code = 0, data = departments });

            }
            catch (Exception e)
            {
                return Json(new { code = 11, message = e.Message });

            }
        }
    }
}
