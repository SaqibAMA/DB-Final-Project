using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class studentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["email"]).Length>1)
            {
                lblUserName.Text = Convert.ToString(Session["fName"]) +" "+ Convert.ToString(Session["lName"]);
                //lblUserEmail.Text = Convert.ToString(Session["email"]);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["email"] = "";
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}