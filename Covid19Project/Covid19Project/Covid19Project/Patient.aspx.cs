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
    public partial class Patient : System.Web.UI.Page
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
            string sql = "Select * From PatientDetails";
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
            string sql = "Exec TotalPatients";
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
            string sql = "Exec spd @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Patient31.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec sp @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Patient51.Text);
            SqlDataReader reader = command.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Insert into Patient values(@i1,@i2,@i3,@i4,@i5,@i6,@i7,@i8,@i9)";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@i1", Patient11.Text);
            command.Parameters.AddWithValue("@i2", Patient12.Text);
            command.Parameters.AddWithValue("@i3", Patient13.Text);
            command.Parameters.AddWithValue("@i4", Patient14.Text);
            command.Parameters.AddWithValue("@i5", Patient15.Text);
            command.Parameters.AddWithValue("@i6", Patient16.Text);
            command.Parameters.AddWithValue("@i7", Patient17.Text);
            command.Parameters.AddWithValue("@i8", Patient18.Text);
            command.Parameters.AddWithValue("@i9", Patient19.Text);
            command.ExecuteNonQuery();
            string script = "window.onload = Verification()";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            connection.Close();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec delPat @id=@id1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@id1", Patient21.Text);
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Insert into Symptoms values(@i1,@i2)";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@i1", Patient41.Text);
            command.Parameters.AddWithValue("@i2", Patient42.Text);
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Covid19Entities"].ConnectionString;
            SqlConnection connection = new SqlConnection(mainconn);
            string sql = "Exec dtp @id=@i2, @id1=@i1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            command.Parameters.AddWithValue("@i1", Patient61.Text);
            command.Parameters.AddWithValue("@i2", Patient62.Text);
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}