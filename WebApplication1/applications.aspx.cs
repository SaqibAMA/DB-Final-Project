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



        }


        public void loadApplications()
        {


            int stdID = Convert.ToInt32(Session["accID"]);

            DAL dal = new DAL();

            DataTable dt = dal.getAppsForStd(stdID);
            applist.DataSource = dt;
            applist.DataBind();

        }

        public void editApplication_Click(object sender, EventArgs e)
        {



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