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
        private readonly UserManagerInfo _ManagerUserID;  

        public AdminstratorController(AppDbContext _dbContext, UserManagerInfo userMangerInfo)
        {
            this.db = _dbContext; 
            this._ManagerUserID = userMangerInfo;
            if (_ManagerUserID._UserId == 0)
            {
                SpecialMethod.RedirectToLogin(); 
            };
        }

        public IActionResult Index()
        {
            return View();
        }

         
    } 
}
