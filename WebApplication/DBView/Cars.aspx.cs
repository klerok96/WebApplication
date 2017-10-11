using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication.DBView
{
    public partial class Cars : System.Web.UI.Page
    {
        string _connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            _connectionString = @"server=LAPTOP-B6SOJQMR;Initial Catalog=Cars;Integrated Security=True;Persist Security Info=False;";

            if ((string)Session["Login"] != null)
            {
                if ((string)Session["Access"] == "normal")
                {
                    SqlDataSourceCars.SelectCommand = 
                        $"SELECT Car.CarID, Car.CarName, Car.Cost, Car.Power, Car.Consumption, Car.ColorID, Car.DiskCarID, Color.ColorName, DiskCar.DiskCarName, Users.Login " +
                        $"FROM Users INNER JOIN UserCar ON Users.UserID = UserCar.UserID INNER JOIN Car ON UserCar.CarID = Car.CarID" +
                        $" INNER JOIN DiskCar ON Car.DiskCarID = DiskCar.DiskCarID " +
                        $"INNER JOIN Color ON Car.ColorID = Color.ColorID WHERE (Users.Login = '{(string)Session["Login"]}')";
                }

            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string carName = TextBoxCarName.Text;
            string cost = TextBoxCost.Text;
            string power = TextBoxPower.Text;
            string consum = TextBoxConsum.Text;
            string color = DropDownListColor.SelectedValue;
            string diskCar = DropDownListDisk.SelectedValue;

            string sqlExpression = "INSERT Cars.dbo.Car VALUES (@name, @cost, @power, @consumption, @color, @disk)";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.Parameters.AddWithValue("@name", carName);
                command.Parameters.AddWithValue("@cost", cost);
                command.Parameters.AddWithValue("@power", power);
                command.Parameters.AddWithValue("@consumption", consum);
                command.Parameters.AddWithValue("@color", color);
                command.Parameters.AddWithValue("@disk", diskCar);

                command.ExecuteNonQuery();
            }

            Response.Redirect(Request.RawUrl);
        }

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = GridView1.Rows[e.RowIndex];
        //    string carID = ((Label)(row.FindControl("Label1"))).Text;
        //    string carNameNew = ((TextBox)(row.Cells[1].Controls[0])).Text;
        //    string costNew = ((TextBox)(row.Cells[2].Controls[0])).Text;
        //    string powerNew = ((TextBox)(row.Cells[3].Controls[0])).Text;
        //    string consumptionNew = ((TextBox)(row.Cells[4].Controls[0])).Text;
        //    string colorNameNew = ((DropDownList)(row.FindControl("DropDownList1"))).SelectedValue;
        //    string diskCarNameNew = ((DropDownList)(row.FindControl("DropDownList2"))).SelectedValue;

        //    string sqlExpression = "UPDATE Cars.dbo.Car " +
        //        "SET CarName = @name, Cost = @cost, Power = @power, Consumption" +
        //        " = @consumption, ColorID = @color, DiskCarID = @disk WHERE CarID = @id";

        //    using (SqlConnection connection = new SqlConnection(_connectionString))
        //    {
        //        connection.Open();

        //        SqlCommand command = new SqlCommand(sqlExpression, connection);
        //        command.Parameters.AddWithValue("@name", carNameNew);
        //        command.Parameters.AddWithValue("@cost", costNew);
        //        command.Parameters.AddWithValue("@power", powerNew);
        //        command.Parameters.AddWithValue("@consumption", consumptionNew);
        //        command.Parameters.AddWithValue("@color", colorNameNew);
        //        command.Parameters.AddWithValue("@disk", diskCarNameNew);
        //        command.Parameters.AddWithValue("@id", carID);

        //        command.ExecuteNonQuery();
        //    }

        //    //e.Cancel = true;
        //}

        //protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        //{
        //    Response.Write("qq");
        //}
    }
}