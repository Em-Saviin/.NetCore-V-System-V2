using Newtonsoft.Json;
using System.Diagnostics;

namespace V_System_Core.Models
{
    public class tbl_Menus
    {
        [JsonProperty("ID")]
        public int ID { get; set; } 

        [JsonProperty("menu_name")] 
        public string? menu_name { get; set; }

        [JsonProperty("menu_name_kh")] 
        public string? menu_name_kh { get; set; }

        [JsonProperty("icon")] 
        public string? icon { get; set; }

        [JsonProperty("level")] 
        public int? level { get; set; }

        [JsonProperty("partial_name")] 
        public string? partial_name { get; set; }
        [JsonProperty("is_active")]
        public bool? is_active { get; set; }

        internal static object FromSqlInterpolated(string v)
        {
            throw new NotImplementedException();
        }
    }
}
