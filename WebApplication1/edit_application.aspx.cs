using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WebApplication1.tier3;
using System.Data;


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

        public int appID;

        public void loadApplicationData()
        {


            DAL dal = new DAL();

            int usrID = Convert.ToInt32(Session["accID"]);
            appID = Convert.ToInt32(Request.QueryString["application_id"]);


            stdName.Text = dal.getName(usrID);
            uniName.Text = dal.getAppUniName(appID);
            appliedDate.Text = dal.getAppDate(appID);
            appStatus.Text = dal.getAppStatus(appID);

            // getting list of all majors
            DataTable majlist = dal.getUniMajors(dal.getAppUniID(appID));

            // Generating a radio button list
            majorsradio.DataSource = majlist;
            majorsradio.DataBind();



        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {


            DAL dal = new DAL();

            dal.updateMajor(appID, curr_maj_val);


        }

        public static int curr_maj_val;


        [System.Web.Services.WebMethod]
        public static string update_maj_val(string maj_val)
        {

            string o = maj_val;

            curr_maj_val = Convert.ToInt32(maj_val);

            return o;
        }


    }
}