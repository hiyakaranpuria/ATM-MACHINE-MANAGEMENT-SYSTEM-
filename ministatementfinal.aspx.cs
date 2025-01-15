using System;
using System.Data.SqlClient;

namespace project1
{
    public partial class MiniStatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserPin"] == null || Session["AccountNumber"] == null)
            {
                Response.Redirect("ministatement.aspx"); 
                return;
            }

            string userPin = Session["UserPin"].ToString();
            string accountNumber = Session["AccountNumber"].ToString();

            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                LabelAccountNumber.Text = "Account Number: " + accountNumber;

                
                string query = @"
                    SELECT TOP 5 TransactionDate, TransactionAmount, TransactionType, BalanceAfterTransaction
                    FROM transactions 
                    WHERE AccountNumber = @AccountNumber 
                    ORDER BY TransactionDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AccountNumber", accountNumber);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    LabelTransactionHistory.Text += "<br/>" +
                        "Date: " + Convert.ToDateTime(reader["TransactionDate"]).ToString("dd-MM-yyyy HH:mm") +
                        ", Amount: " + reader["TransactionAmount"] +
                        ", Type: " + reader["TransactionType"] +
                        ", Balance After Transaction: " + reader["BalanceAfterTransaction"];
                }

                reader.Close();

               
                query = "SELECT balance FROM user_info WHERE account_number = @AccountNumber";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AccountNumber", accountNumber);

                object balanceResult = cmd.ExecuteScalar();
                LabelAvailableBalance.Text = "Available Balance: " + (balanceResult != DBNull.Value ? balanceResult.ToString() : "0");
            }
        }
    }
}
