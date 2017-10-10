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
            //_connectionString = @"server=LAPTOP-B6SOJQMR;Initial Catalog=Cars;Integrated Security=True;Persist Security Info=False;";
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