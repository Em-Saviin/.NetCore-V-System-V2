using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_System
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("system_name")]
        public string? System_Name { get; set; }

        [JsonProperty("description")]
        public string? Description { get; set; }

        [JsonProperty("is_active")]
        public bool? Is_Active { get; set; }
    }
}
