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
                sqlCMD.CommandText = "dbo.getName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                sqlCMD.Parameters["@name"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                name = sqlCMD.Parameters["@name"].Value.ToString();
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
        public void updateInterMarks(int stdID, int marks)
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
        public void updateMatricMarks(int stdID, int marks)
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
        public void updateUnderGradMarks(int stdID, int cgpa)
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
        public void updateGradMarks(int stdID, int cgpa)
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
        public static List<string> getReviewsByUniID(int uniID)
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
                List<string> reviews = new List<string>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string temp;
                    temp = Convert.ToString(dt.Rows[i]["ReviewText"]);
                    reviews.Add(temp);
                }
                sqlCon.Close();
                return reviews;
            }
        }
        //returns list of PromotedUniversities
        public static List<string> getPromotedUniversities()
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
                List<string> pmtlist = new List<string>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string temp;
                    temp = Convert.ToString(dt.Rows[i]["Name"]);
                    pmtlist.Add(temp);
                }
                sqlCon.Close();
                return pmtlist;
            }
        }
        //Student Applied Application list
        public class stdAppstype
        {
            public int appID { get; set; }
            public string uniName { get; set; }
            public string Major { get; set; }
        }
        public static List<stdAppstype> getApplicationsForStd(int stdID)
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
                List<stdAppstype> applist = new List<stdAppstype>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    stdAppstype temp = new stdAppstype();
                    temp.appID = Convert.ToInt32(dt.Rows[i]["ApplicationID"]);
                    temp.uniName = Convert.ToString(dt.Rows[i]["Name"]);
                    temp.Major = Convert.ToString(dt.Rows[i]["MajorName"]);
                    applist.Add(temp);
                }
                sqlCon.Close();
                return applist;
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

        //for messages creating another datatype

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