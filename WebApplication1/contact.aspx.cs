using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            message.TextMode = TextBoxMode.MultiLine;
            message.Rows = 10;

            nameErr.Visible = false;
            emailErr.Visible = false;
            messageErr.Visible = false;
            submittedQuery.Visible = false;

        }

        protected void submitQuery_Click(object sender, EventArgs e)
        {


            string nm = name.Text.Trim();
            string em = email.Text.Trim();
            string mg = message.Text.Trim();

            if (nm.Length < 1)
            {
                nameErr.Visible = true;
            }
            else if (em.Length < 1)
            {
                emailErr.Visible = true;
            }
            else if (mg.Length < 1)
            {
                messageErr.Visible = true;
            }
            else
            {


                DAL dal = new DAL();


                dal.submitQuery(nm, em, mg);

                submittedQuery.Visible = true;


            }


        }
    }
}