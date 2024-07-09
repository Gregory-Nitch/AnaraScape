using AnaraScapeWeb.Components;
using DataAccess;
using DataAccess.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.AddTransient<IDBAccess, DBAccess>();
builder.Services.AddTransient<ICrud, Crud>();
builder.Services.AddSingleton<DungeonTileCache>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();
app.UseStatusCodePagesWithRedirects("/Error/{0}");

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
