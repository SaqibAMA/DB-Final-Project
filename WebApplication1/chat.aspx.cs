using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.tier3;
using System.Web.Services;
using System.Data;

namespace WebApplication1
{
    public partial class chat : System.Web.UI.Page
    {
        public class msg_data
        {
            public string username { get; set; }
            public string message { get; set; }
            public string time { get; set; }
        };

        // Creating Global DT
        public static List<msg_data> msglist;

        // Page Load
        public void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }

            loadMessages();

        }

        public void loadMessages()
        {

            DAL dal = new DAL();


            DataTable dt = dal.loadMessages();
            messages.DataSource = dt;
            messages.DataBind();

            Label lbl = (Label)FindControl("topUsername");
            lbl.Text = "Hello @" + dal.getUsername(Convert.ToInt32 (Session["accID"]) );


        }

        public void sendbtn_Click(object sender, EventArgs e)
        {

            DAL obj = new DAL();
            int accID = Convert.ToInt32(Session["accID"]);
            string msg = messagebox.Text.Trim();
            messagebox.Text = "";
            obj.putMessage(accID,msg);

            loadMessages();

        }



    }
}