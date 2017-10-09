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
        string _connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            _connectionString = @"server=LAPTOP-B6SOJQMR;Initial Catalog=Cars;Integrated Security=True;Persist Security Info=False;";

            HttpCookie cookieReq = Request.Cookies["Cookie"];

            //if (cookieReq != null)
            //    Label2.Text= cookieReq["Login"];


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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            String newLogin = ((TextBox)(row.Cells[2].Controls[0])).Text;

            string sqlExpression = $"SELECT AccessLevel FROM [Cars].[dbo].[Users] WHERE LOWER(Login) = '{newLogin}'";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(sqlExpression, connection);

                try
                {
                    string access = (string)command.ExecuteScalar();
                    Response.Write("Такой логин уже есть!");
                    e.Cancel = true;
                }
                catch (Exception ex)
                {
                }
            }
        }

    }
}