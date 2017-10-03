using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication
{
    public partial class Authorization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            string connectionString = @"server=LAPTOP-B6SOJQMR;Initial Catalog=Cars;Integrated Security=True;Persist Security Info=False;";

            string login = Login.Text;
            string pass = Password.Text;

            string sqlExpressionData = $"SELECT * FROM [Cars].[dbo].[Users] WHERE Login = '{login}'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(sqlExpressionData, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                    Response.Write("aa");
                // TextBox1.Text = count.ToString();
            }
        }
    }
}