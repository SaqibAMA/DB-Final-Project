using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (Convert.ToString(Session["uName"]).Length > 1)
                    Response.Redirect("dashboard.aspx");
                else
                    Response.Redirect("dashboard.aspx");
            }
      
        }

        protected void signUpButton_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("signup.aspx");
            }

        }
    }
}