using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class delete_post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["email"]).Length < 1 ||
                Request.QueryString["post_id"] == null)
            {
                Response.Redirect("index.aspx");
            }

            int postID = Convert.ToInt32(Request.QueryString["post_id"]);

            deletePost(postID);

        }

        public void deletePost(int postID)
        {

            DAL dal = new DAL();
            dal.deletePost(postID);

            closeWindow();

        }

        public void closeWindow()
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
        }

    }
}