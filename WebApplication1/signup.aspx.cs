using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication1
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrMsgEmail.Visible = false;
            lblErrorMsgUser.Visible = false;
            lblSignUp.Visible = false;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentSignup.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("uniSignup.aspx");
        }
    }
}