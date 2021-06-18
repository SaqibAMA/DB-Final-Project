using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class search_result
        {
            public int ID { get; set; }
            public String name { get; set; }

        }


        // This function searches for the universities

        [System.Web.Services.WebMethod]
        public static List<search_result> searching_function(String query)
        {

            // Get ALL universities from DB here

            var results = new List<search_result>()
            {
                new search_result { ID = 1, name = "FAST-NUCES" },
                new search_result { ID = 2, name = "NUST" }
            };


            return results;

        }


        // This function applies to a certain university
        [System.Web.Services.WebMethod]
        public static int applying_function(String id)
        {

            return id.Length;

        }


    }

}