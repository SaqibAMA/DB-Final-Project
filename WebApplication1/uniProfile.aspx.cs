using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class uniProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["uName"]).Length >1)
            {
                uniName.Text = Convert.ToString(Session["uName"]);
                //email.Text = Convert.ToString(Session["email"]);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session["uName"] = "";
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}