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



            loadApps();


        }

        public void loadApps()
        {

            DAL dal = new DAL();

            int uniID = Convert.ToInt32(Session["accID"].ToString());

            DataTable dt = dal.getAppsByStatus(uniID, "Incomplete");
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


            dt = dal.getAppsByStatus(uniID, "Accepted");

            acceptedApps.DataSource = dt;
            acceptedApps.DataBind();

            if (dt.Rows.Count > 0)
            {
                noAcceptedApps.Visible = false;
            }
            else
            {
                noAcceptedApps.Visible = true;
            }


            dt = dal.getAppsByStatus(uniID, "Rejected");

            rejectedApps.DataSource = dt;
            rejectedApps.DataBind();

            if (dt.Rows.Count > 0)
            {
                noReject.Visible = false;
            }
            else
            {
                noReject.Visible = true;
            }

        }

        protected void acceptBtn_Click(object sender, EventArgs e)
        {

            int appID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);

            DAL dal = new DAL();

            dal.acceptApplication(appID);

            loadApps();

        }

        protected void rejectBtn_Click(object sender, EventArgs e)
        {

            int appID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);

            DAL dal = new DAL();

            dal.rejectApplication(appID);


            loadApps();


        }

        protected void incompleteBtn_Click(object sender, EventArgs e)
        {


            int appID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);


            DAL dal = new DAL();

            dal.setAppIncomplete(appID);

            loadApps();


        }



    }
}