using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_RoleMenuPermissions
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("role_id")]
        public int? Role_Id { get; set; }
        [JsonProperty("User_Id")]
        public int? User_Id { get; set; }

        [JsonProperty("menu_id")]
        public int? Menu_Id { get; set; }

        [JsonProperty("is_active")]
        public bool? Is_Active { get; set; }
        [JsonProperty("company_id")]
        public int? Company_Id { get; set; }
    }
}
