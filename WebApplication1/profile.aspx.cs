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
    public partial class profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {



            if (Session["accID"] == null)
                Response.Redirect("index.aspx");

            int usrID = Convert.ToInt32 (Session["accID"]);

            DAL dal = new DAL();


            if ( dal.isUniversity(usrID) > 0)
            {

                applyBtn.Visible = false;

            }

            updateInfo();

        }

        public void updateInfo()
        {

            DAL dal = new DAL();

            int ID = Convert.ToInt32( Request.QueryString["id"] );

            // name of profile
            profileName.Text = "@" + dal.getUsername(ID);

            // no of posts
            postCount.Text = dal.getPostsByID(ID).Rows.Count.ToString();

            // fetching posts
            DataTable dt = dal.getPostsByID(ID);

            posts.DataSource = dt;
            posts.DataBind();


            int isStudent = dal.isStudent(ID);


            if ( isStudent > 0 )
            {

                dt = dal.getAppsForStd(ID);

                recentApps.DataSource = dt;
                recentApps.DataBind();

                typeLabel.Text = "Student";

            }
            else
            {

                dt = dal.getAppsForUni(ID);

                recentApps.DataSource = dt;
                recentApps.DataBind();

                typeLabel.Text = "University";


            }

        }

        protected void applyBtn_Click(object sender, EventArgs e)
        {


            DAL dal = new DAL();

            int applicantID = Convert.ToInt32(Session["accID"]);
            int uniID = Convert.ToInt32(
                Request.QueryString["id"]);


            dal.applyToUni(applicantID, uniID);



        }



    }
}