using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_Permissions
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("permission_name")]
        public string? Permission_Name { get; set; }

        [JsonProperty("description")]
        public string? Description { get; set; }

        [JsonProperty("is_active")]
        public bool? Is_Active { get; set; }
    }
}
