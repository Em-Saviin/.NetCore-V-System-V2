using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace V_System_Core.Models
{
    public class tbl_Modules
    {
        [JsonProperty("ID")] 
        public int ID { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        [JsonProperty("module_name")]
        public string? module_name { get; set; }

        [JsonProperty("controller")]
        public string? controller { get; set; }

        [JsonProperty("views")]
        public string? views { get; set; }


        [JsonProperty("module_name_kh")] 
        public string? module_name_kh { get; set; }

        [JsonProperty("icon")] 
        public string? icon { get; set; }

        [JsonProperty("level")] 
        public int? level { get; set; }

        [JsonProperty("partial_name")] 
        public string? partial_name { get; set; }

        [JsonProperty("url")]
        public string? url { get; set; }

        [JsonProperty("menu_id")]   
        public int? menu_id { get; set; }
        [JsonProperty("is_active")]
        public bool? is_active { get; set; }
    }
}
