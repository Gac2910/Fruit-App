using System.Data;
using System.Data.SqlClient;

namespace Fruit_App.Database
{
	public class SqlServer
	{

        private static string connString = "Data Source=ZCM-851704219\\SQLEXPRESS01;Initial Catalog=FruitsDB;Integrated Security=True";
        //private static string connString = "Data Source=LAPTOP-UP6DGQ4Q\\SQLEXPRESS;Initial Catalog=FruitsDB;Integrated Security=True";
		private static SqlConnection conn = new SqlConnection(connString);
		public static DataTable Query(string cmd)
		{
			conn.Open();
			DataSet dataSet = new DataSet();
			SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn);
			adapter.Fill(dataSet);
			conn.Close();
			return dataSet.Tables[0];
		}
		public static void NonQuery(string cmd)
		{
			conn.Open();
			SqlCommand sqlCmd = new SqlCommand(cmd, conn);
			sqlCmd.ExecuteNonQuery();
			sqlCmd.Dispose();
			conn.Close();
		}
	}
}