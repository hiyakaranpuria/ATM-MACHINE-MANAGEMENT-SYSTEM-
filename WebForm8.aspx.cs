using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project1
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic if any
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            // Logic for when TextBox1 text changes
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            // Logic for when TextBox2 text changes
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string accountNumber = TextBox1.Text.Trim();
            string pin = TextBox2.Text.Trim();

            if (string.IsNullOrWhiteSpace(accountNumber) || string.IsNullOrWhiteSpace(pin))
            {
                ShowAlert("Please enter both account number and PIN.");
                return;
            }

            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "SELECT COUNT(1) FROM user_info WHERE account_number = @accountNumber AND pin = @pin";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@accountNumber", accountNumber);
                        cmd.Parameters.AddWithValue("@pin", pin);

                        int matchCount = Convert.ToInt32(cmd.ExecuteScalar());

                        if (matchCount == 1)
                        {
                            Session["AccountNumber"] = accountNumber;
                            Session["UserPin"] = pin;
                            Response.Redirect("ministatementfinal.aspx");
                        }
                        else
                        {
                            ShowAlert("Invalid account number or PIN. Please try again.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred while processing your request. Please try again later.");
            }
        }

        private void ShowAlert(string message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"<script>alert('{message}');</script>");
        }
    }
}
