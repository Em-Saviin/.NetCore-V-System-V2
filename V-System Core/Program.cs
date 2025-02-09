using Microsoft.EntityFrameworkCore;
using V_System_Core.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

 

// Add DbContext for SQL Server connection
builder.Services.AddDbContext<AppDbContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    options.UseSqlServer(connectionString);  
});

var app = builder.Build();

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");  
    app.UseHsts(); 
}

 
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
 
app.UseAuthorization();
 
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Dashboard}/{action=Login}/{id?}"); // Default controller is Dashboard, action is Login

// Start the application
app.Run();
