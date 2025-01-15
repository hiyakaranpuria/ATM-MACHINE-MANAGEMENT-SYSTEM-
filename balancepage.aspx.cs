using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace project1
{
    public partial class balancepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
            if (!IsPostBack)
            {
                
                string userPin = Request.QueryString["Pin"];

                if (string.IsNullOrEmpty(userPin))
                {
                    Label1.Text = "Invalid PIN. Please try again.";
                    return;
                }

                string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                   
                    string query = "SELECT Balance FROM user_info WHERE Pin = @Pin";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                       
                        cmd.Parameters.AddWithValue("@Pin", userPin);


                        con.Open();

                     
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            
                            Label1.Text = "Your available balance is: ₹" + result.ToString();
                        }
                        else
                        {

                            Label1.Text = "No account found with the provided PIN.";
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("welcome.aspx");
        }
    }
}
