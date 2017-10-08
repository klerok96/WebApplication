using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["Login"] != null)
            {
                LabelLogin.Text = "Логин: " + (string)Session["Login"];

                if ((string)Session["Access"] == "normal")
                {
                    Menu1.Items.Remove(Menu1.FindItem("Пользователи"));
                }
            }
            else
            {
                Menu1.Items.Clear();
            }
        }

        protected void ButtonEntEx_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Authorization.aspx");
        }
    }
}