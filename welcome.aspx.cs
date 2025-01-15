using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.ObjectModel;


namespace project1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {if (TextBox1.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('ENTER CARD NUMBER !!')</script>");
                return;

            }
            string conection = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";
            SqlConnection con = new SqlConnection(conection);
            string query = "select * from user_info where card_number =@card_no";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@card_no", TextBox1.Text);
            con.Open();
            SqlDataReader abcd= cmd.ExecuteReader();
            if (abcd.HasRows)
            {
                int key = 1;
                Response.Redirect("redirecting.aspx?key=" + key);

            }
            
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('INVALID CARD NUMBER !!')</script>");
            }
            con.Close();


        }
    }
}