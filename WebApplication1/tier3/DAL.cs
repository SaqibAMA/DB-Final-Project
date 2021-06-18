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
        static string connection_str = @"Server=tcp:jamyadbserver.database.windows.net,1433;Initial Catalog=Jamya_db;Persist Security Info=False;User ID=MughalGandu;Password=AraainPenchod123();MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

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
                sqlCMD.Parameters.Add("@username", SqlDbType.NVarChar);
                sqlCMD.Parameters["@username"].Direction = ParameterDirection.Output;
                sqlCMD.ExecuteScalar();
                username_ = sqlCMD.Parameters["@username"].Value.ToString();
                sqlCon.Close();
            }
            return username_;
        }


        public string getName(int accID)
        {

            string name = "";
            
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandText = "dbo.getAccountName";
                sqlCMD.CommandType = CommandType.StoredProcedure;
                sqlCMD.Parameters.AddWithValue("@accID", accID);
                sqlCMD.Parameters.Add("@name", SqlDbType.NVarChar);
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
                sqlCMD.Parameters.AddWithValue("@MessageText", message);
                sqlCMD.ExecuteScalar();
                sqlCon.Close();
            }
        }
        //for messages creating another datatype
        public class msg_data{
            public string username { get; set; }
            public string message { get; set; }
            public string time { get; set; }
        }
        public static List<msg_data> loadMessages()
        {
            DataTable dt=new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connection_str))
            {
                sqlCon.Open();
                SqlCommand sqlCMD = sqlCon.CreateCommand();
                sqlCMD.CommandType = CommandType.Text;
                sqlCMD.CommandText = "SELECT Account.Username, Messages.MessageText,Messages.SentTime from Account JOIN Messages ON Account.AccountID=Messages.MessageID";
                sqlCMD.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(sqlCMD);
                da.Fill(dt);
                List<msg_data> msglist = new List<msg_data>();
                for(int i=0;i<dt.Rows.Count;i++)
                {
                    msg_data temp = new msg_data();
                    temp.username = Convert.ToString(dt.Rows[i]["Username"]);
                    temp.message= Convert.ToString(dt.Rows[i]["MessageText"]);
                    temp.time=Convert.ToString(dt.Rows[i]["SentTime"]);
                    msglist.Add(temp);
                }
                sqlCon.Close();
                foreach( msg_data i in msglist )
                {
                    Console.Write(i.message);
                }
                    return msglist;
            }
        }
    }
}