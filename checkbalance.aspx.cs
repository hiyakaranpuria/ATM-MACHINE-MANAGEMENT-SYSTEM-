using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace project1
{
    public partial class checkbalance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            string query = "SELECT * FROM user_info WHERE Pin = @Pin";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Pin", TextBox1.Text);

            con.Open();

            SqlDataReader abcd = cmd.ExecuteReader();
            if (abcd.HasRows)
            {
                // After successfully validating the Pin, pass it to the second page (balancepage.aspx)
                Response.Redirect("balancepage.aspx?Pin=" + TextBox1.Text);
            }
           
            con.Close();
        }
    }
}
