namespace V_System_Core.Models
{
    public class tbl_WorkflowEntity
    {
        public int ID { get; set; }

        public string? WorkflowName { get; set; }

        public string? Remark { get; set; }

        public int? ModuleId { get; set; }

        public int? FirstStatusId { get; set; }

        public int? LastStatusId { get; set; }

        public bool? IsDelete { get; set; }

        public int CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public DateTime? DeleteDate { get; set; }
    }
     

}
