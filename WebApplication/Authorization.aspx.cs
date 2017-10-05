using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Hashing;

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
            string pass = Hash.GetHashString(Password.Text);

            string sqlExpressionData = $"SELECT AccessLevel FROM [Cars].[dbo].[Users] WHERE Login = '{login}' AND Password = '{pass}'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(sqlExpressionData, connection);

                try
                {
                    int access = (int)command.ExecuteScalar();

                    // Создать объект cookie-набора
                    HttpCookie cookie = new HttpCookie("Cookie");

                    // Установить значения в нем
                    cookie["Login"] = login;
                    cookie["Access"] = access.ToString();

                    //Добавить куки в ответ
                    Response.Cookies.Add(cookie);

                    Enter.PostBackUrl = "~/Main.aspx";
                }
                    catch (Exception ex)
                    {
                        Response.Write("Неверный пароль или логин");
                    }
            }
        }
    }
}