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

    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }


            loadUnis();

        }

        public void loadUnis()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getUnis();
            searchResults.DataSource = dt;
            searchResults.DataBind();

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();

            string squery = searchQuery.Text.Trim();

            DataTable dt = dal.getUnisLike(squery);
            searchResults.DataSource = dt;
            searchResults.DataBind();
        }

        protected void applyBtn_Click(object sender, EventArgs e)
        {



            DAL dal = new DAL();
            
            int applicantID = Convert.ToInt32(Session["accID"]);
            int uniID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);

            dal.applyToUni(applicantID, uniID);


        }
    }

}