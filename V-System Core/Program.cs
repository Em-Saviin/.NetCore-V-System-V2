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
        options.LoginPath = "/NoPermission/ErrorStatus401UnAuthorize"; // Redirect when not authenticated
        options.AccessDeniedPath = "/NoPermission/ErrorStatus400"; // Redirect when access is denied
        options.ExpireTimeSpan = TimeSpan.FromMinutes(10); // Set cookie expiration time
        options.SlidingExpiration = true; // Extend session when active
        options.Cookie.HttpOnly = true; // Prevent JavaScript access (XSS protection)
        options.Cookie.SecurePolicy = CookieSecurePolicy.Always; // Use HTTPS only
        options.Cookie.SameSite = SameSiteMode.Strict; // Prevent CSRF attacks
        options.Events = new CookieAuthenticationEvents
        {
            OnRedirectToLogin = context =>
            {
                if (context.Request.Path.StartsWithSegments("/api"))
                { 
                    context.Response.StatusCode = 401;
                    return Task.CompletedTask;
                } 
                context.Response.Redirect("/NoPermission/ErrorStatus401UnAuthorize");
                return Task.CompletedTask;
            }
        };
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
 

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Dashboard}/{action=Login}/{id?}");  

// Start the application
app.Run();
