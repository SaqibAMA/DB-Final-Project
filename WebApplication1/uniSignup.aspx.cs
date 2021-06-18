using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class uniSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrName.Visible = false;
            lblErrEmail.Visible = false;
            //pass>8
            lblErrPass.Visible = false;
            //success
            lblSuccess.Visible = false;
            lblNotSuccess.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            int usr_count = 0;
            int eml_count = 0;
            DAL obj = new DAL();
            obj.isAlreadyUsr(username.Text.Trim(), email.Text.Trim(), ref usr_count, ref eml_count);
            if (usr_count >= 1 || eml_count >= 1)
            {
                if (usr_count >= 1)
                {
                    lblErrName.Visible = true;
                }
                else
                {
                    lblErrEmail.Visible = true;
                }
            }
            else if(password.Text.Trim().Length<8)
            {
                lblErrPass.Visible = true;
            }
            else
            {
                obj.uniSignup(username.Text.Trim(), email.Text.Trim(), password.Text.Trim(), uniName.Text.Trim(), city.Text.Trim(), telephone.Text.Trim());
                if(obj.isUserExists(username.Text.Trim(), password.Text.Trim()).Length>1)
                {
                    lblSuccess.Visible = true;
                    Session["uName"] = uniName.Text.Trim();
                    Session["email"] = email.Text.Trim();
                    System.Threading.Thread.Sleep(2000);
                    Response.Redirect("login.aspx");
                }
                else
                {
                    lblNotSuccess.Visible = true;
                }
              
            }
        }
    }
}