using Fruit_App.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Fruit_App.Database;
using System.Data;
using Newtonsoft.Json;

namespace Fruit_App.Controllers
{
	public class FruitsController : Controller
	{
		private readonly ILogger<FruitsController> _logger;

		public FruitsController(ILogger<FruitsController> logger)
		{
			_logger = logger;
		}
		public IActionResult Index()
		{
			return View();
		}
		public IActionResult Get()
		{
			try
            {
				Console.WriteLine("Selecting all from fruits");
				DataTable fruits = SqlServer.Query("EXEC SelectAll");
				string fruitsJSON = JsonConvert.SerializeObject(fruits);
				return Ok(fruitsJSON);
			}
			catch (Exception ex)
            {
				return BadRequest(ex.Message);
            }
		}
		public IActionResult Post(Fruit fruit)
		{
			try
			{
				Console.WriteLine("Inserting in fruits");
				SqlServer.NonQuery($"EXEC InsertFruit '{fruit.Name}', '{fruit.Color}', '{fruit.Taste}'");
				return Ok("Fruit Inserted");
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}
		public IActionResult Delete()
		{
            try
            {
				int id = int.Parse(HttpContext.Request.Query["id"]);
                Console.WriteLine("Deleting from fruits");
				SqlServer.NonQuery($"EXEC DeleteFruit '{id}'");
                return Ok("Fruit Deleted");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
		public IActionResult Put(Fruit fruit)
		{
			try
			{
				int id = int.Parse(HttpContext.Request.Query["id"]);
				Console.WriteLine("Updating in fruits");
				SqlServer.NonQuery($"EXEC UpdateFruit '{id}', '{fruit.Name}', '{fruit.Color}', '{fruit.Taste}'");
				return Ok("Fruit Updated");
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}
		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
