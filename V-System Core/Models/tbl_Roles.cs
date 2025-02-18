using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace V_System_Core.Models
{
    public class tbl_Roles
    {
        [JsonProperty("id")]
        public int? ID { get; set; }

        [JsonProperty("role_name")]
        [Required]
        public string? Role_Name { get; set; }

        [JsonProperty("description")]
        [Required] 
        public string? Description { get; set; }
 
    }
}
