using Newtonsoft.Json;

namespace V_System_Core.Models
{
    public class tbl_BussinessType
    {
        public class BussinessType
        {
            [JsonProperty("id")]
            public int? ID { get; set; }

            [JsonProperty("bussiness_name")]
            public string Bussiness_Name { get; set; }

            [JsonProperty("remark")]
            public string Remark { get; set; }

            [JsonProperty("is_active")]
            public bool? Is_Active { get; set; }
        }
    }
}
