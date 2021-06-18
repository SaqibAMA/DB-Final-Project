using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Handling null params

            int parsedID = -1;

            if (Request.QueryString["id"] == null)
            {
                parsedID = -1;
            }
            else
            {
                parsedID = Int16.Parse(Request.QueryString["id"]);
            }


            applyToUniversity(parsedID);

        }

        protected void applyToUniversity(int id)
        {

            // Considering edge case
            if (id == -1)
            {
                closeWindow();
            }


            // Add the application Logic here
            //

            Response.Write("Applying to university " + id);

            // After apply function is done
            closeWindow();

        }

        protected void closeWindow()
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
        }
    }
}