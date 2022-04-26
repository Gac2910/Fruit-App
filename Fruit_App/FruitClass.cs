namespace Fruit_App
{
	public class Fruit
	{
		public string?  Name { get; set; }
		public string?  Color { get; set; }
		public string?  Taste { get; set; }
		public Fruit() { }
		public Fruit(string name, string color, string taste)
		{
			this.Name = name;
			this.Color = color;
			this.Taste = taste;
		}
	}
}
