using Microsoft.AspNetCore.Mvc;
using V_System_Core.Data;
using V_System_Core.Models;

namespace V_System_Core.Controllers
{
    public class RegisterCompanyController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db;
        public RegisterCompanyController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }

        //View Index
        public IActionResult Index()
        {
            return View();
        }

        //Block Action
        [HttpPost]
        public JsonResult RegisterCompany([FromForm] tbl_Company model, IFormFile companyPhoto)
        {
            try
            {
                if (companyPhoto != null && companyPhoto.Length > 0)
                {

                    var uploadsDirectory = Path.Combine("wwwroot", "lib", "uploads", "companylogo");
                    if (!Directory.Exists(uploadsDirectory))
                    {
                        Directory.CreateDirectory(uploadsDirectory);
                    }

                    string sanitizedCompanyName = !string.IsNullOrEmpty(model.company_name)
                                                ? model.company_name.Replace(" ", "_").ToLower()
                                                : "default_company";

                    string fileExtension = Path.GetExtension(companyPhoto.FileName);
                    string newFileName = $"{sanitizedCompanyName}{fileExtension}";
                    var filePath = Path.Combine(uploadsDirectory, newFileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        companyPhoto.CopyToAsync(stream);
                    }
                    string logoPath = $"/lib/uploads/companylogo/{newFileName}";
                    var companies = new tbl_Company
                    {
                        company_code = model.company_code,
                        company_name = model.company_name,
                        logo = newFileName,
                        path_logo = logoPath,
                        bussiness_type = model.bussiness_type,
                        register_number = model.register_number,
                        register_date = model.register_date,
                        address = model.address,
                        contact_email = model.contact_email,
                        contact_phone = model.contact_phone,
                        contact_name = model.contact_name,
                        is_active = true
                    };

                    db.tbl_Company.Add(companies);
                    db.SaveChanges();
                }

                return Json(new { code = 0, message = "Company registered successfully!" });
            }
            catch (Exception ex)
            {
                return Json(new { code = 11, message = "Error: " + ex.Message });
            }
        }

        public JsonResult GetCompanyList()
        {
            try
            {
                var companyList = db.tbl_Company.ToList();
                return Json(new { data = companyList });
            }
            catch (Exception e)
            {
                return Json(new { code = 0, message = e.Message });
            }
        }
    }
}
