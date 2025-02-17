using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;
using System.Globalization;
using System.Linq;
using V_System_Core.Data;
using V_System_Core.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using V_System_Core.Component;

namespace V_System_Core.Controllers
{
    public class AdminstratorController : Controller
    {
        private readonly V_System_Core.Data.AppDbContext db; 
       
        public AdminstratorController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

         
    } 
}
