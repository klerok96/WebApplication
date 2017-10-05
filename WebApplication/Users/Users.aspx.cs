using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication.Users
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string connectionString = @"server=LAPTOP-B6SOJQMR;Initial Catalog=Cars;Integrated Security=True;Persist Security Info=False;";

            //string sqlExpressionData = $"SELECT UserID, Login, AccessLevel FROM [Cars].[dbo].[Users]";

            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    connection.Open();

            //    SqlCommand command = new SqlCommand(sqlExpressionData, connection);
            //    SqlDataReader dr = command.ExecuteReader();

            //    GridView1.DataSource = dr;
            //    GridView1.DataBind();

            //}
        }
    }
}