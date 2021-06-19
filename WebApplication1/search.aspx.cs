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

            loadUnis();

        }

        public void loadUnis()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getUnis();
            searchResults.DataSource = dt;
            searchResults.DataBind();

        }

        public void search_universities()
        {



        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();

            string squery = searchQuery.Text.Trim();

            DataTable dt = dal.getUnisLike(squery);
            searchResults.DataSource = dt;
            searchResults.DataBind();
        }
    }

}