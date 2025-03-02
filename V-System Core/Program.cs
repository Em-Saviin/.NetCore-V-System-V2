using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using System.Text;
using V_System_Core.Component;
using V_System_Core.Data;
 

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Register IHttpContextAccessor to allow accessing HttpContext in services
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

// Register UserManagerInfo as scoped (it depends on IHttpContextAccessor)
builder.Services.AddScoped<UserManagerInfo>();

// Add DbContext for SQL Server connection
builder.Services.AddDbContext<AppDbContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    options.UseSqlServer(connectionString);
});

// Add SignalR ✅
builder.Services.AddSignalR();

// Add Authentication and Authorization services (since you're using cookies)
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/NoPermission/ErrorStatus401UnAuthorize";
    });

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigins",
        builder =>
        {
            builder.WithOrigins("http://localhost:5171") // ✅ Specify allowed frontend origin
                   .AllowAnyMethod()
                   .AllowAnyHeader()
                   .AllowCredentials(); // ✅ Required for SignalR
        });
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
app.UseCors("AllowSpecificOrigins");
app.UseRouting();

// ✅ Register SignalR Hub 
app.MapHub<FingerprintHub>("/fingerprintHub");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Dashboard}/{action=Login}/{id?}"); // Default route

// Start the application
app.Run();
