using Microsoft.Data.SqlClient;
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
        public DbSet<tbl_Permission_Module_On_Role> tbl_Permission_Module_On_Role { get; set; }
        public DbSet<tbl_Permission_Module_On_User> tbl_Permission_Module_On_User { get; set; }
        
      
        public IQueryable<tbl_Menus> GetMenuByRole(int userId = 0, int roleId = 0)
        {
             var userIdParam = new SqlParameter("@UserId", userId);
            var roleIdParam = new SqlParameter("@RoleId", roleId);
             
            return this.tbl_Menus.FromSqlRaw("EXECUTE  SP_GET_MENU_PERMISSION_ON_SCREEN @UserId, @RoleId", userIdParam, roleIdParam);
        }
        public IQueryable<tbl_Modules> GetModuleByRole(int userId = 0, int roleId = 0)
        {
            var userIdParam = new SqlParameter("@UserId", userId);
            var roleIdParam = new SqlParameter("@RoleId", roleId);

            return this.tbl_Modules.FromSqlRaw("EXECUTE  SP_GET_MODULE_PERMISSION_ON_SCREEN @UserId, @RoleId", userIdParam, roleIdParam);
        }

    }
}
