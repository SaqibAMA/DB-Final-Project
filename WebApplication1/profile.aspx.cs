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

            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
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


            if ( Session["type"].ToString() == "Student" )
            {

                dt = dal.getAppsForStd(ID);

                recentApps.DataSource = dt;
                recentApps.DataBind();

            }

        }


    }
}