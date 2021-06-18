using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class edit_application : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            // Display error if the student is not the one in the application
            // Display error if the application does not exist

            int applicationID = -1;

            if (Request.QueryString["application_id"] == null)
            {
                applicationID = -1;
            }
            else
            {
                applicationID = Int16.Parse(Request.QueryString["application_id"]);
            }

            if (applicationID == -1)
            {
                isValidApplication.Text = "0";
            }

        }

        public class ApplicationData
        {

            public int stdID { get; set; }
            public int uniID { get; set; }
            public string date_applied { get; set; }
            public string status { get; set; }

        }

        [System.Web.Services.WebMethod]
        public static ApplicationData getApplicationData(string application_id)
        {

            var app_details = new ApplicationData
            {
                stdID = 1,
                uniID = 2,
                date_applied = "12/01/2001",
                status = "In Progress"
            };

            return app_details;

        }


    }
}