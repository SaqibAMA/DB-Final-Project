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
    public partial class applications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // need to be logged in
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }


            // load applications
            loadApplications();

            // load suggestions
            loadSuggestions();

            // load promotions
            loadPromoted();


            // Loading data
            DAL dal = new DAL();

            String uname = dal.getUsername(Convert.ToInt32(Session["accID"]));
            String uemail = Session["email"].ToString();

            Label unamelabel = (Label)FindControl("username");
            Label uemaillabel = (Label)FindControl("useremail");

            unamelabel.Text = "@" + uname;
            uemaillabel.Text = uemail;

        }

        public void loadPromoted()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getPromotedUniversities();
            promolist.DataSource = dt;
            promolist.DataBind();

        }

        public void loadSuggestions()
        {

            int accID = Convert.ToInt32(Session["accID"]);

            DAL dal = new DAL();

            DataTable dt = dal.getSuggestionsForStd( accID );
            suggList.DataSource = dt;
            suggList.DataBind();

        }

        public void loadApplications()
        {


            int stdID = Convert.ToInt32(Session["accID"]);

            DAL dal = new DAL();

            DataTable dt = dal.getAppsForStd(stdID);
            applist.DataSource = dt;
            applist.DataBind();

            if (dt.Rows.Count > 0)
            {
                noAppsLabel.Visible = false;
            }
            else
            {
                noAppsLabel.Visible = true;
            }

        }

        public void editApplication_Click(object sender, EventArgs e)
        {


            int applicationID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);
            Response.Redirect("edit_application.aspx?application_id=" + applicationID);


        }

        protected void deleteApplication_Click(object sender, EventArgs e)
        {

            int applicationID = Convert.ToInt32 ((sender as LinkButton).Attributes["data"]);


            DAL dal = new DAL();
            dal.deleteApplication(applicationID);

            loadApplications();


        }

    }
}