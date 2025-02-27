using Microsoft.AspNetCore.Mvc;
using System.Text;
using V_System_Core.Data;
using V_System_Core.Models;

namespace V_System_Core.Controllers
{
     
    public class RoleManagementController : Controller
    {
        private readonly HttpClient _httpClient;
        private readonly V_System_Core.Data.AppDbContext db;
        public RoleManagementController(AppDbContext _dbContext)
        {
            this.db = _dbContext;
            _httpClient = new HttpClient();
        }
         
        //View Index
        public IActionResult Index()
        {
            var dataTelegramUser = db.tbl_Telgram_Users
                           .AsEnumerable()  
                           .GroupBy(u => u.user_id)
                           .Select(g => g.OrderByDescending(u => u.ID).First())
                           .OrderByDescending(u => u.ID)
                           .ToList();


            ViewData["TelegramUsers"] = dataTelegramUser;
            return View();
        }
         
         
        [HttpPost]
        public async Task<IActionResult> SentMessageTelegram(int userId, string message)
        {
            var apiUrl = "http://localhost:3000/send-message";  

            var jsonData = new
            {
                userId = userId,
                message = message
            };

            var content = new StringContent(System.Text.Json.JsonSerializer.Serialize(jsonData), Encoding.UTF8, "application/json");

            try
            {
                var response = await _httpClient.PostAsync(apiUrl, content);
                var responseText = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    return Json(new { code = 0, message = "Sent successfully", response = responseText });
                }
                else
                {
                    return Json(new { code = 1, message = "Failed to send", error = responseText });
                }
            }
            catch (HttpRequestException ex)
            {
                return Json(new { code = 2, message = "Error", error = ex.Message });
            }
        }

    }
}
