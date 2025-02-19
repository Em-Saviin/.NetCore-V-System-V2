using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_UserRoles
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("user_id")]
        public int? User_Id { get; set; }

        [JsonProperty("role_id")]
        public int? Role_Id { get; set; }

        [JsonProperty("assigned_date")]
        public DateTime? Assigned_Date { get; set; }
        [JsonProperty("delete_date")]
        public DateTime? Delete_Date { get; set; }
        [JsonProperty("asssign_by")]
        public int? Assign_By { get; set; }
        [JsonProperty("remark")]
        public string? Remark { get; set; }
    }
}
