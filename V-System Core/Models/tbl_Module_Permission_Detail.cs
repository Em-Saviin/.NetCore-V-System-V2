namespace V_System_Core.Models
{
    public class tbl_Module_Permission_Detail
    {
        public int? ID { get; set; }
        public int? menu_id { get; set; }
        public int? module_id { get; set; }
        public bool?  full { get; set; }
        public bool? list { get; set; }
        public bool? add { get; set; }
        public bool? edit { get; set; }
        public bool? print { get; set; }
        public bool? view { get; set; }
        public int? user_id { get; set; }
        public bool? is_active { get; set; }
        public DateTime? assign_date { get; set; }
        public string? company_code { get; set; }
    }
}
