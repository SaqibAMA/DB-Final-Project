using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Not available for logged out
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }

            // Handling null params

            int parsedID = -1;

            if (Request.QueryString["id"] == null)
            {
                closeWindow();
            }
            else
            {
                parsedID = Int16.Parse(Request.QueryString["id"]);
            }


            applyToUniversity(parsedID);

        }

        protected void applyToUniversity(int id)
        {

            int applicantID = Convert.ToInt32(Session["accID"]);

            DAL dal = new DAL();

            // Adding application
            dal.applyToUni(applicantID, id);

            // After apply function is done
            closeWindow();

        }

        protected void closeWindow()
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
        }
    }
}