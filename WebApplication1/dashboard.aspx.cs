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
    public partial class dashboard : System.Web.UI.Page
    {

        public decimal currMatric;
        public decimal currInter;
        public decimal currUG;

        public void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["email"]).Length < 1)
            {
                Response.Redirect("index.aspx");
            }


            // Loading Stories
            loadStories();

            loadNotifs();

            loadPosts();

            if (Session["type"].ToString() == "Student")
                loadMarks();

            // Loading data
            DAL dal = new DAL();

            String uname = dal.getUsername( Convert.ToInt32( Session["accID"] ) );
            String uemail = Session["email"].ToString();

            Label unamelabel = (Label)FindControl("username");
            Label uemaillabel = (Label)FindControl("useremail");

            unamelabel.Text = "@" + uname;
            uemaillabel.Text = uemail;

            dateErr.Visible = false;



            if (Session["type"].ToString() == "University")
                loadPromos();


        }

        public void loadStories()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getStories();
            stories.DataSource = dt;
            stories.DataBind();

            if (dt.Rows.Count > 0)
            {
                noStoriesLabel.Visible = false;
            }
            else
            {
                noStoriesLabel.Visible = true;
            }


        }

        public void loadNotifs()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getNotifs( Convert.ToInt32( Session["accID"] ) );

            notifs.DataSource = dt;
            notifs.DataBind();

            if (dt.Rows.Count > 0)
            {
                noNotifsLabel.Visible = false;
            }
            else
            {
                noNotifsLabel.Visible = true;
            }


        }

        public void loadPosts()
        {
            DAL dal = new DAL();

            DataTable dt = dal.getPostsByID(Convert.ToInt32(Session["accID"]));

            posts.DataSource = dt;
            posts.DataBind();

            if (dt.Rows.Count > 0)
            {
                noPostsLabel.Visible = false;
            }
            else
            {
                noPostsLabel.Visible = true;
            }

        }

        protected void addPost_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();

            string pText = postText.Text.Trim();

            dal.addPost(
                Convert.ToInt32(Session["accID"]),
                pText
            );

            loadPosts();
        }

        protected void addStory_Click(object sender, EventArgs e)
        {

            DAL dal = new DAL();

            string sText = storyText.Text.Trim();

            dal.addStory(
                Convert.ToInt32(Session["accID"]),
                sText
            );

            loadStories();

        }

        protected void deletePost_Click(object sender, EventArgs e)
        {

            DAL dal = new DAL();

            int postID = Convert.ToInt32((sender as LinkButton).Attributes["data"]);
            dal.deletePost(postID);

            loadPosts();

        }

        public void loadMarks()
        {

            if (Page.IsPostBack)
            {

                currMatric = Convert.ToDecimal(matricInput.Text.Trim());
                currInter = Convert.ToDecimal(interInput.Text.Trim());
                currUG = Convert.ToDecimal(ugInput.Text.Trim());

            }
            else
            {

                DAL dal = new DAL();

                int accID = Convert.ToInt32(Session["accID"]);


                decimal matMarks = dal.getMarks(accID, "matric");
                decimal intMarks = dal.getMarks(accID, "inter");
                decimal uMarks = dal.getMarks(accID, "ug");

                matricMarks.Text = matMarks.ToString() + " %";
                interMarks.Text = intMarks.ToString() + " %";
                ugMarks.Text = uMarks.ToString() + " CGPA";

                matricInput.Text = matMarks.ToString();
                interInput.Text = intMarks.ToString();
                ugInput.Text = uMarks.ToString();

            }

        }

        protected void updateMarks_Click(object sender, EventArgs e)
        {



            DAL dal = new DAL();

            int accID = Convert.ToInt32(Session["accID"]);

            dal.updateMatricMarks(accID, currMatric);
            dal.updateInterMarks(accID, currInter);
            dal.updateUnderGradMarks(accID, currUG);


        }

        protected void sendNotification_Click(object sender, EventArgs e)
        {


            DAL dal = new DAL();

            int uniID = Convert.ToInt32(Session["accID"].ToString());
            string notif = notifText.Text.Trim().ToString();


            dal.sendNotificationToApps(uniID, notif);


        }

        protected void addPromotion_Click(object sender, EventArgs e)
        {

            DateTime dt = Convert.ToDateTime(endDate.Text);

            if (dt < DateTime.Now)
            {

                Response.Write(" <script> alert('Unfortunately, we cannot run promotions in the past! :(') </script> ");

            }
            else
            {


                DAL dal = new DAL();

                int uniID = Convert.ToInt32(Session["accID"].ToString());

                dal.addPromotion(uniID, dt);


            }



        }


        public void loadPromos()
        {

            DAL dal = new DAL();

            int uniID = Convert.ToInt32(Session["accID"].ToString());

            DataTable dt = dal.getInactivePromos(uniID);
            prevPromos.DataSource = dt;
            prevPromos.DataBind();

        }

    }
}