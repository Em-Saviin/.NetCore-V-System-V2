using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_Icons
    {
        [JsonProperty("ID")]
        public int ID { get; set; }

        [JsonProperty("class_name")]
        public string? class_name { get; set; }

        [JsonProperty("label_icon")] 
        public string? label_icon { get; set; }
    }
}
