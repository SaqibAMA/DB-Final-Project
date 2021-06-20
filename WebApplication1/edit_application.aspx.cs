using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class edit_application : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            // need to be logged in
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }


            // Fills the form data
            loadApplicationData();


        }

        public void loadApplicationData()
        {


            DAL dal = new DAL();

            int usrID = Convert.ToInt32(Session["accID"]);

            int appID = Convert.ToInt32(Request.QueryString["application_id"]);


            stdName.Text = dal.getName(usrID);
            uniName.Text = dal.getAppUniName(appID);
            appliedDate.Text = dal.getAppDate(appID);
            appStatus.Text = dal.getAppStatus(appID);


        }



    }
}