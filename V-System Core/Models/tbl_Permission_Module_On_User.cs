namespace V_System_Core.Models
{
    public class tbl_Permission_Module_On_User
    {
        public int? ID { get; set; }
        public int? module_id { get; set; }
        public int? role_id { get; set; }
        public int? user_id { get; set; }
        public string? company_code { get; set; }
        public bool? full { get; set; }
        public bool? list { get; set; }
        public bool? add { get; set; }
        public bool? edit { get; set; }
        public bool? print { get; set; }
        public bool? view { get; set; }
        public bool? is_active { get; set; }
        public DateTime? assign_date { get; set; }
    }
}
