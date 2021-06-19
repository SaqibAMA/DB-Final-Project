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
    public partial class dashboard : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }

            // Loading Stories
            loadStories();

        }

        public void loadStories()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getStories();
            stories.DataSource = dt;
            stories.DataBind();


        }

    }
}