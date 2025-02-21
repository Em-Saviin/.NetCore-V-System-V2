using Newtonsoft.Json.Serialization;
using System.Text.Json;

namespace V_System_Core.Models
{
    public class tbl_Department

    {
        [Newtonsoft.Json.JsonProperty("ID")]
        public int ID { get; set; }

        [Newtonsoft.Json.JsonProperty("name")]
        public string? name { get; set; }

        [Newtonsoft.Json.JsonProperty("create_date")] 
        public DateTime? create_date { get; set; }

        [Newtonsoft.Json.JsonProperty("is_active")] 
        public bool? is_active { get; set; } 

    }
}
