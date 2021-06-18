using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }
        protected void loginButton_Click(object sender,EventArgs e)
        {
                DAL obj = new DAL();
            string eml = "";
            //will get accID
           eml=obj.isUserExists(txtUsername.Text.Trim(), txtPassword.Text.Trim());
            int accID=-1;
            if (eml.Length >1)
            {
                 accID= obj.getID(eml);
            }
                //check account type
                int uni_found = 0; int std_found = 0;
            //search in student and uni
            if (accID != -1)
            {
                std_found = obj.isStudent(accID);
                uni_found = obj.isUniversity(accID);
            }
                if (eml.Length>1 && std_found==1)
                {
                
                string fName = "";
                //on login we will decide accType
                string type_ = "Student";
                string lName = "";
                    obj.stdName(accID,ref fName,ref lName);
                Session["accID"] = accID;
                Session["fName"] = fName;
                    Session["lName"] = lName;
                    Session["email"] = eml;
                    Session["type"] = type_;
                    Response.Redirect("studentProfile.aspx");
                }
                else if(eml.Length > 1 && uni_found == 1)
                {
                //on login we will decide accType
                string type_ = "University";


                string uniName = obj.uniName(accID);
                Session["accID"] = accID;
                Session["uName"] = uniName;
                Session["email"] = eml;
                Session["type"] = type_;
                Response.Redirect("uniProfile.aspx");
                }
                else {
                    lblErrorMessage.Visible = true;
            }
            }
        }

    }