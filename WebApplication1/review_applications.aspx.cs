using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;
using System.Data;

namespace WebApplication1
{
    public partial class review_applications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            // need to be logged in
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }


            // Loading data
            DAL dal = new DAL();

            String uname = dal.getUsername(Convert.ToInt32(Session["accID"]));
            String uemail = Session["email"].ToString();

            Label unamelabel = (Label)FindControl("username");
            Label uemaillabel = (Label)FindControl("useremail");

            unamelabel.Text = "@" + uname;
            uemaillabel.Text = uemail;



            loadUnderReviewApps();


        }

        public void loadUnderReviewApps()
        {

            DAL dal = new DAL();

            int uniID = Convert.ToInt32(Session["accID"].ToString());

            DataTable dt = dal.getUnderReviewApps(uniID);
            underReviewApps.DataSource = dt;
            underReviewApps.DataBind();

            if (dt.Rows.Count > 0)
            {
                noURAppsLabel.Visible = false;
            }
            else
            {
                noURAppsLabel.Visible = true;
            }

        }

        protected void acceptBtn_Click(object sender, EventArgs e)
        {
            Response.Write("Clicked");
        }

        protected void rejectBtn_Click(object sender, EventArgs e)
        {
            Response.Write("Clicked");
        }



    }
}