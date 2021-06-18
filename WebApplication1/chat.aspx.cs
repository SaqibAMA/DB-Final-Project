using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;

namespace WebApplication1
{
    public partial class chat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }
            
        }

        protected void sendbtn_Click(object sender, EventArgs e)
        {
            DAL obj = new DAL();
            int accID = Convert.ToInt32(Session["accID"]);
            string msg = messagebox.Text.Trim();
            obj.putMessage(accID,msg);
        }
    }
}