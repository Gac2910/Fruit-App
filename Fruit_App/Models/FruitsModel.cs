using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data;
using Fruit_App.Database;

namespace Fruit_App.Models
{
	public class FruitsModel : PageModel
	{
		[BindProperty]
		public string? Name { get; set; }
		[BindProperty]
		public string? Color { get; set; }
		[BindProperty]
		public string? Taste { get; set; }

		public static DataTable fruitData = new DataTable();
		public static void Init()
		{
			fruitData = SqlServer.Query("EXEC SelectAll");
		}
	}
}
