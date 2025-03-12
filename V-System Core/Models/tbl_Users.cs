using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace V_System_Core.Models
{
    public class tbl_Users
    {

        [JsonProperty("id")]
        [Key]
        public int? ID { get; set; }

        [JsonProperty("username")]
        public string? username { get; set; }

        [JsonProperty("password")]
        public string? password { get; set; }

        [JsonProperty("email")]
        public string? email { get; set; } 

        [JsonProperty("is_active")]
        public bool? is_active { get; set; }

        [JsonProperty("sex")]
        public string? sex { get; set; }

        [JsonProperty("sddress")]
        public string? address { get; set; }

        [JsonProperty("phone")]
        public string? phone { get; set; }

        [JsonProperty("first_name")]
        public string? firstname { get; set; }

        [JsonProperty("last_name")]
        public string? lastname { get; set; }

        [JsonProperty("image")]
        public string? image { get; set; }

        [JsonProperty("image_path")] 
        public string? image_path { get; set; } 

        [JsonProperty("department_id")]
        public int? department_id { get; set; }

        [JsonProperty("company_id")]
        public int? company_id { get; set; }

    }
}
