using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace V_System_Core.Models
{
    public class tbl_WorkflowTransaction
    {
        [Key]
        public int ID { get; set; }

        [Column("workflow_id")]
        public int WorkflowId { get; set; }

        [Column("status_from")]
        public int StatusFrom { get; set; }

        [Column("status_to")]
        public int StatusTo { get; set; }

        [Column("role_id")]
        public int RoleId { get; set; }

        [Column("create_by")]
        public int CreateBy { get; set; }

        [Column("create_date")]
        public DateTime? CreateDate { get; set; }
    }
}
