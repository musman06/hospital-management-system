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
    public partial class Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Select * From DoctorDetails";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec TotalDoctors";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Insert into Doctor values(@i1,@i2,@i3,@i4)";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@i1", Doctor11.Text);
            command.Parameters.AddWithValue("@i2", Doctor12.Text);
            command.Parameters.AddWithValue("@i3", Doctor13.Text);
            command.Parameters.AddWithValue("@i4", Doctor14.Text);
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Delete From Doctor Where DoctorID=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Doctor21.Text);
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec sdd @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Doctor31.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec pd @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Doctor41.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec pw @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Doctor51.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec pwd @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Doctor61.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

       
    }
}