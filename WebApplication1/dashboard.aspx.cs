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

            loadMarks();

            // Loading data
            DAL dal = new DAL();

            String uname = dal.getUsername( Convert.ToInt32( Session["accID"] ) );
            String uemail = Session["email"].ToString();

            Label unamelabel = (Label)FindControl("username");
            Label uemaillabel = (Label)FindControl("useremail");

            unamelabel.Text = "@" + uname;
            uemaillabel.Text = uemail;

        }

        public void loadStories()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getStories();
            stories.DataSource = dt;
            stories.DataBind();


        }

        public void loadNotifs()
        {

            DAL dal = new DAL();

            DataTable dt = dal.getNotifs( Convert.ToInt32( Session["accID"] ) );

            notifs.DataSource = dt;
            notifs.DataBind();


        }

        public void loadPosts()
        {
            DAL dal = new DAL();

            DataTable dt = dal.getPostsByID(Convert.ToInt32(Session["accID"]));

            posts.DataSource = dt;
            posts.DataBind();

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

            DAL dal = new DAL();

            int accID = Convert.ToInt32(Session["accID"]);


            int matMarks = dal.getMarks(accID, "matric");
            int intMarks = dal.getMarks(accID, "inter");
            int uMarks = dal.getMarks(accID, "ug");

            matricMarks.Text = matMarks.ToString();
            interMarks.Text = intMarks.ToString();
            ugMarks.Text = uMarks.ToString();

            matricInput.Text = matMarks.ToString();
            interInput.Text = intMarks.ToString();
            ugInput.Text = uMarks.ToString();

        }

        protected void updateMarks_Click(object sender, EventArgs e)
        {



            DAL dal = new DAL();

            int matMarks =  Convert.ToInt32 (matricInput.Text.Trim());
            int intMarks = Convert.ToInt32(interInput.Text.Trim());
            int uMarks = Convert.ToInt32(ugInput.Text.Trim());

            int accID = Convert.ToInt32(Session["accID"]);

            dal.updateMatricMarks(accID, matMarks);
            dal.updateInterMarks(accID, intMarks);
            dal.updateUnderGradMarks(accID, uMarks);


        }
    }
}