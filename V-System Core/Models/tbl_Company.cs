using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_Company
    {
        [JsonProperty("id")]
        public int ID { get; set; }
        [JsonProperty("company_name")]
        public string? company_name { get; set; }
       
        [JsonProperty("company_code")]
        public string? company_code { get; set; }

        [JsonProperty("business_type")]
        public string? bussiness_type { get; set; }

        [JsonProperty("register_date")]
        public DateTime? register_date { get; set; }

        [JsonProperty("logo")]
        public string? logo { get; set; } 

        [JsonProperty("path_logo")]
        public string? path_logo { get; set; }

        [JsonProperty("address")]
        public string? address { get; set; }

        [JsonProperty("contact_name")]
        public string? contact_name { get; set; }

        [JsonProperty("contact_email")]
        public string? contact_email { get; set; }

        [JsonProperty("contact_phone")]
        public string? contact_phone { get; set; }

        [JsonProperty("is_active")]
        public bool is_active { get; set; }
        [JsonProperty("register_number")]
        public string? register_number { get; set; }
    }
}

 