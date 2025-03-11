using Newtonsoft.Json;

namespace V_System_Core.Component
{
    public class PartialModel
    {
        public class DataMenu
        {
            public int ID { get; set; }
            public string? menu_name { get; set; }

            public string? menu_name_kh { get; set; }
            public string? icon { get; set; }
            public int? level { get; set; }
            public bool? is_active { get; set; }

        } 
        public class DataModule
        { 
            public int ID { get; set; } 
            public string? module_name { get; set; } 
            public string? module_name_kh { get; set; } 
            public string? icon { get; set; } 
            public int? level { get; set; }    
        }

        public class DataPermissionCheck
        {
            public int module_id { get; set; }
            public int full { get; set; }
            public int list { get; set; }
            public int add { get; set; }
            public int delete { get; set; }
            public int edit { get; set; }
            public int print { get; set; }
        }

    }

   
        
}
