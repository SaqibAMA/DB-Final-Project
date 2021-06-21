using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1.tier3
{
    public class DAL
    {
        static string connection_str = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Jamya;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        //static string connection_str = @"Server=tcp:jamyadbserver.database.windows.net,1433;Initial Catalog=Jamya_db;Persist Security Info=False;User ID=MughalGandu;Password=AraainPenchod123();MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

        //LOGIN SECTION
        public string isUserExists(string uname, string pass)
        {
            string email = "";
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "isUsrExists";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@username", uname);
                sqlCMD.Parameters.AddWithValue("@password", pass);
                sqlCMD.Parameters.Add("@email", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@email"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                email = Convert.ToString(sqlCMD.Parameters["@email"].Value.ToString());
                sqlCon.Close();
            }
            return email;
        }
        public int getID(string eml)
        {
            int accID = 0;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getID";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@eml", eml);
                sqlCMD.Parameters.Add("@accID", SqlDbType.Int);
                sqlCMD.Parameters["@accID"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                accID = int.Parse(sqlCMD.Parameters["@accID"].Value.ToString());
                sqlCon.Close();
            }
            return accID;
        }

        public string getUsername(int accID)
        {
            string username_;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getUserName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@username", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@username"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                username_ = sqlCMD.Parameters["@username"].Value.ToString();
                sqlCon.Close();
            }
            return username_;
        }


        public string getName(int accID)
        {

            string name = "User";
            
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getStudentName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@fullname", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@fullname"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                name = sqlCMD.Parameters["@fullname"].Value.ToString();
                sqlCon.Close();
            }

            return name;
        
        }


        public int isStudent(int accID)
        {
            int count = 0;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.isStudent";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@count", SqlDbType.Int);
                sqlCMD.Parameters["@count"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                count = int.Parse(sqlCMD.Parameters["@count"].Value.ToString());
                sqlCon.Close();
            }
            return count;
        }
        public int isUniversity(int accID)
        {
            int count = 0;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.isUniversity";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@count", SqlDbType.Int);
                sqlCMD.Parameters["@count"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                count = int.Parse(sqlCMD.Parameters["@count"].Value.ToString());
                sqlCon.Close();
            }
            return count;
        }
        public void stdName(int accID, ref string fName, ref string lName)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.stdDetails";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@fName", SqlDbType.VarChar, 20);
                sqlCMD.Parameters["@fName"].Direction = ParameterDirection.Output;
                sqlCMD.Parameters.Add("@lName", SqlDbType.VarChar, 20);
                sqlCMD.Parameters["@lName"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                fName = Convert.ToString(sqlCMD.Parameters["@fName"].Value.ToString());
                lName = Convert.ToString(sqlCMD.Parameters["@lName"].Value.ToString());
                sqlCon.Close();
            }
        }
        public string uniName(int accID)
        {
            string name = "";
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.uniName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@uName", SqlDbType.VarChar, 50);
                sqlCMD.Parameters["@uName"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                name = Convert.ToString(sqlCMD.Parameters["@uName"].Value.ToString());
                sqlCon.Close();
            }
            return name;
        }
        //University SIGNUP Section
        public void isAlreadyUsr(string username, string email, ref int ucount, ref int ecount)
        {
#pragma warning disable CS0219 // The variable 'count' is assigned but its value is never used
            int count = 0;
#pragma warning restore CS0219 // The variable 'count' is assigned but its value is never used
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.isAlreadyUsr";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@username", username);
                sqlCMD.Parameters.AddWithValue("@email", email);
                sqlCMD.Parameters.Add("@ucount", SqlDbType.Int);
                sqlCMD.Parameters["@ucount"].Direction = ParameterDirection.Output;
                sqlCMD.Parameters.Add("@ecount", SqlDbType.Int);
                sqlCMD.Parameters["@ecount"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                ucount = int.Parse(sqlCMD.Parameters["@ucount"].Value.ToString());
                ecount = int.Parse(sqlCMD.Parameters["@ecount"].Value.ToString());
                sqlCon.Close();
            }
        }
        public void uniSignup(string username, string email, string password, string uName, string address, string contact)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.uniSignup";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@username", username);
                sqlCMD.Parameters.AddWithValue("@email", email);
                sqlCMD.Parameters.AddWithValue("@password", password);
                sqlCMD.Parameters.AddWithValue("@uName", uName);
                sqlCMD.Parameters.AddWithValue("@address", address);
                sqlCMD.Parameters.AddWithValue("@contact", contact);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void stdSignup(string username, string email, string password, string fName, string lName, string defaultdate)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.stdSignup";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@username", username);
                sqlCMD.Parameters.AddWithValue("@email", email);
                sqlCMD.Parameters.AddWithValue("@password", password);
                sqlCMD.Parameters.AddWithValue("@fName", fName);
                sqlCMD.Parameters.AddWithValue("@lName", lName);
                sqlCMD.Parameters.AddWithValue("@defaultdate", defaultdate);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        //for appliation management
        public void acceptApplication(int applicationID)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.acceptApplication";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@applicationID", applicationID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void deleteApplication(int applicationID)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.deleteApplication";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@applicationID", applicationID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void rejectApplication(int applicationID)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.rejectApplication";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@applicationID", applicationID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        //update marks sheet of student
        public void updateInterMarks(int stdID, decimal marks)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateInterMarks";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@stdID", stdID);
                sqlCMD.Parameters.AddWithValue("@marks", marks);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void updateMatricMarks(int stdID, decimal marks)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateMatricMarks";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@stdID", stdID);
                sqlCMD.Parameters.AddWithValue("@marks", marks);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void updateUnderGradMarks(int stdID, decimal cgpa)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateUnderGradMarks";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@stdID", stdID);
                sqlCMD.Parameters.AddWithValue("@cgpa", cgpa);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        public void updateGradMarks(int stdID, float cgpa)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateGradMarks";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@stdID", stdID);
                sqlCMD.Parameters.AddWithValue("@cgpa", cgpa);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        //update Student's date of birth
        public void updateDOB(int stdID, string dob)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateDOB";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@stdID", stdID);
                sqlCMD.Parameters.AddWithValue("@dob", dob);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        //for chat data
        public void putMessage(int accID,string message)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.insertMessage";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@AccountID", accID);
                sqlCMD.Parameters.AddWithValue("@message", message);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }


        public void sendNotificationToApps(int uniID, string notif)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.sendNotificationToApplicants";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.Parameters.AddWithValue("@text", notif);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }


        // adds a review
        public void addReview(int accID, int uniID, string review)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.addReview";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.AddWithValue("@review", review);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }


        //
        //returns list of Programs University offers
        public static List<string> getProgramsForUniversity(int uniID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getProgramsForUniversity";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                List<string> majors = new List<string>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string temp;
                    temp = Convert.ToString(dt.Rows[i]["MajorName"]);
                    majors.Add(temp);
                }
                sqlCon.Close();
                return majors;
            }
        }
        //returns list of ReviewsAbtUniversity
        public DataTable getReviewsByUniID(int uniID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getReviewsByUniID";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uID", uniID);
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }
        }
        //returns list of PromotedUniversities
        public DataTable getPromotedUniversities()
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getPromotedUniversities";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }
        }



        // get all the applications for the student

        public DataTable getApplicationsForStd(int stdID)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getApplicationsForStd";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", stdID);
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;

            }
        }


        //returns list of Applications FOR UniID
        public class UniAppstype
        {
            public int appID { get; set; }
            public int stdID { get; set; }
            public string fName { get; set; }
            public string lName { get; set; }
            public string Major { get; set; }
        }
        public static List<UniAppstype> getApplicationsForUni(int uniID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getApplicationsForUni";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", uniID);
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                List<UniAppstype> applist = new List<UniAppstype>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    UniAppstype temp = new UniAppstype();
                    temp.appID = Convert.ToInt32(dt.Rows[i]["ApplicationID"]);
                    temp.stdID = Convert.ToInt32(dt.Rows[i]["StudentID"]);
                    temp.fName= Convert.ToString(dt.Rows[i]["fName"]);
                    temp.lName= Convert.ToString(dt.Rows[i]["lName"]);
                    temp.Major = Convert.ToString(dt.Rows[i]["MajorName"]);
                    applist.Add(temp);
                }
                sqlCon.Close();
                return applist;
            }
        }
        

        public DataTable getStories()
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {

                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getStories";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                sqlCon.Close();

                return dt;

            }
        }
        //returns list of notifications
        public static List<string> getNotificationsForID(int accID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getNotificationsForID";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                List<string> notiflist = new List<string>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string temp;
                    temp = Convert.ToString(dt.Rows[i]["textContent"]);
                    notiflist.Add(temp);
                }
                sqlCon.Close();
                return notiflist;
            }
        }


        // Getting notifications
        public DataTable getNotifs(int accID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getNotifications";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }

        // Getting POSTS by ID

        public DataTable getPostsByID(int accID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getPostsByID";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }

        public void addPost(int accID, string post)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.addPost";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.AddWithValue("@post", post);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }

        public void deletePost(int ID)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.deletePost";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@ID", ID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }

        public void addStory(int accID, string story)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.addStory";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.AddWithValue("@story", story);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }


        // All universities for search
        public DataTable getUnis()
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getUnis";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                sqlCon.Close();
                return dt;
            }
        }

        public DataTable getUnisLike(String squery)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getUnisLike";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@query", squery);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }

        // Getting Applications
        public DataTable getAppsForStd(int accID)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getApplicationsForStd";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }

        public DataTable getAppsForUni(int accID)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getApplicationsForUni";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }



        // Apply to university
        public void applyToUni(int accID, int uniID)
        {
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.applyToUni";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }

        public void updateMajor(int appID, int majID)
        {

            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.updateMajor";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@appID", appID);
                sqlCMD.Parameters.AddWithValue("@majID", majID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }

        }


        // For application data retrieval
        public String getAppUniName(int appID)
        {

            string name = "User";

            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getAppUniName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@appID", appID);
                sqlCMD.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@name"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                name = sqlCMD.Parameters["@name"].Value.ToString();
                sqlCon.Close();
            }

            return name;

        }

        public int getAppUniID(int appID)
        {
            int accID = 0;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getAppUniID";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@appID", appID);
                sqlCMD.Parameters.Add("@uniID", SqlDbType.Int);
                sqlCMD.Parameters["@uniID"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                accID = Convert.ToInt32(
                    sqlCMD.Parameters["@uniID"].Value.ToString());
                sqlCon.Close();
            }
            return accID;
        }


        public String getAppDate(int appID)
        {

            string name = "User";

            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getAppDate";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@appID", appID);
                sqlCMD.Parameters.Add("@date", SqlDbType.Date);
                sqlCMD.Parameters["@date"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                name = sqlCMD.Parameters["@date"].Value.ToString();
                sqlCon.Close();
            }

            return name;

        }

        public String getAppStatus(int appID)
        {

            string status = "User";

            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getAppStatus";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@appID", appID);
                sqlCMD.Parameters.Add("@status", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@status"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                status = sqlCMD.Parameters["@status"].Value.ToString();
                sqlCon.Close();
            }

            return status;

        }

        // get all of the majors offered by the university
        public DataTable getUniMajors(int uniID)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getUniMajors";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }


        public DataTable getSuggestionsForStd(int accID)
        {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getSuggestionsForStd";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }


        // get marks
        public decimal getMarks(int accID, string level)
        {

            decimal marks = 0;
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();

                if (level == "matric")
                {
                    sqlCMD.CommandText = "dbo.getMatric";
                }
                else if (level == "inter")
                {
                    sqlCMD.CommandText = "dbo.getInter";
                }
                else
                {
                    sqlCMD.CommandText = "dbo.getUG";
                }

                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@marks", SqlDbType.Decimal);

                sqlCMD.Parameters["@marks"].Direction = ParameterDirection.Output;
                sqlCMD.Parameters["@marks"].SqlDbType = SqlDbType.Decimal;
                sqlCMD.Parameters["@marks"].Precision = 4;
                sqlCMD.Parameters["@marks"].Scale = 2;

                sqlCMD.ExecuteScalar();

                if ( DBNull.Value.Equals(sqlCMD.Parameters["@marks"].Value) )
                {
                    marks = 1;
                }
                else
                {
                    marks = Convert.ToDecimal(
                        sqlCMD.Parameters["@marks"].Value
                    );
                }



                sqlCon.Close();
            }

            return marks;

        }






        // review application stuff
        public DataTable getUnderReviewApps(int uniID) {

            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getUnderReviewApps";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@uniID", uniID);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);

                return dt;
            }

        }





        public DataTable loadMessages()
        {
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.loadMessages";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                sqlCon.Close();
                return dt;
            }
        }
    }
}