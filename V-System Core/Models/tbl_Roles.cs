using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_Roles
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("role_name")]
        public string? Role_Name { get; set; }

        [JsonProperty("description")]
        public string? Description { get; set; }
    }
}
