using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Covid19Project
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "Select Count(1) from Users where UserName=@in1 And [Password]=@in2";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlconn.Open();
            sqlcomm.Parameters.AddWithValue("@in1", TextBox4.Text);
            sqlcomm.Parameters.AddWithValue("@in2", TextBox5.Text);
            int number = Convert.ToInt32(sqlcomm.ExecuteScalar());
            if (number == 1)
            {
                Session["UserName"] = TextBox4.Text;
                Response.Redirect("Menu.aspx");
            }
            else
            {
                string script = "window.onload = Verify()";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
            }
            sqlconn.Close();
        }

        protected void R1_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string string1 = TextBox1.Text;
            string string2 = TextBox3.Text;
            string query2="Select Count(1) from Users where UserName=@in1";
            SqlCommand sqlcomm = new SqlCommand(query2, sqlconn);
            sqlconn.Open();
            sqlcomm.Parameters.AddWithValue("@in1", TextBox1.Text);
            int number1 = Convert.ToInt32(sqlcomm.ExecuteScalar());
            if (number1!=1)
            {
                if ((string1.Length<5)||(string2.Length<6))
                {
                    string script = "window.onload = Verify1()";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                }
                else
                {
                    string sqlquery = "Insert into Users values (@in1,@in3)";
                    SqlCommand sqlcomm1 = new SqlCommand(sqlquery, sqlconn);
                    sqlcomm1.Parameters.AddWithValue("@in1", TextBox1.Text);
                    sqlcomm1.Parameters.AddWithValue("@in3", TextBox3.Text);
                    sqlcomm1.ExecuteNonQuery();
                    string script = "window.onload = Verify3()";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
            else
            {
                string script = "window.onload = Verify2()";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
            }
            sqlconn.Close();
        }
    }
}