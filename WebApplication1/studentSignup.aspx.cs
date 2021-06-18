using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;
using System.Data;
using WebApplication1.tier3;
namespace WebApplication1
{
    public partial class studentSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrMsgEmail.Visible = false;
            lblErrorMsgUser.Visible = false;
            lblSuccess.Visible = false;
            lblNotSuccess.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            DAL obj = new DAL();
            int usr_count = 0;
            int eml_count = 0;
            obj.isAlreadyUsr(username.Text.Trim(), email.Text.Trim(), ref usr_count, ref eml_count);
                if (usr_count >= 1 || eml_count >= 1)
                {
                    if (usr_count >= 1)
                    {
                        lblErrorMsgUser.Visible = true;
                    }
                    else
                    {
                        lblErrMsgEmail.Visible = true;
                    }
                }
                else if(password.Text.Trim().Length<8)
            {
                lblNotSuccess.Visible = true;
            }
                else
                {
                    if (fName.Text.Trim() != null)
                    {
                    string defaultdate = "03-03-2001";
                   
                    obj.stdSignup(username.Text.Trim(), email.Text.Trim(), password.Text.Trim(), fName.Text.Trim(), lName.Text.Trim(), defaultdate);
                    if (obj.isUserExists(username.Text.Trim(), password.Text.Trim()).Length > 1)
                    {
                        lblSuccess.Visible = true;
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
    }