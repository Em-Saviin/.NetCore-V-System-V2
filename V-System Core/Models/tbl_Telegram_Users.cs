using System.ComponentModel.DataAnnotations;

namespace V_System_Core.Models
{
    public class tbl_Telegram_Users 
    {
        [Key]
        public int ID { get; set; }

        public int user_id { get; set; }

        [Required]
        [StringLength(100)]
        public string? first_name { get; set; }

        [Required]
        [StringLength(100)]
        public string? last_name { get; set; }

        [Required]
        [StringLength(100)]
        public string? user_name { get; set; }
    }
   
}
