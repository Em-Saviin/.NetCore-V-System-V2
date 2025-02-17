using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using V_System_Core.Models;

namespace V_System_Core.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
           
        } 
        public DbSet<tbl_Menus> tbl_Menus { get; set; }
        public DbSet<tbl_Modules> tbl_Modules { get; set; } 
        public DbSet<tbl_Users> tbl_Users { get; set; }
        public DbSet<tbl_RoleMenuPermissions> tbl_Role_Menu_Permissions { get; set; }
        public DbSet<tbl_Role_Module_Permissions> tbl_Role_Module_Permissions { get; set; }
        public DbSet<tbl_Company> tbl_Company { get; set; }
        public DbSet<tbl_UserRoles> tbl_UserRoles { get; set; }
        public DbSet<tbl_Roles> tbl_Roles { get; set; }
        public DbSet<tbl_Module_Permission_Detail> tbl_Module_Permission_Detail { get; set; } 
        public DbSet<tbl_Department>    tbl_Department { get; set; }   
        public DbSet<tbl_Icons> tbl_Icons { get; set; } 
        public DbSet<CoreSelect2Item> CoreSelect2Item { get; set; }

    }
}
