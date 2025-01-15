using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace project1
{
    public partial class cashwidhrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Query to get user information based on the entered PIN
                string query = "SELECT account_number, balance, pin FROM user_info WHERE pin = @Pin";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Pin", TextBox2.Text.Trim());

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    // Fetch account number, current balance, and PIN
                    string accountNumber = reader["account_number"].ToString();
                    int currentBalance = reader["balance"] != DBNull.Value ? Convert.ToInt32(reader["balance"]) : 0;
                    string userPin = reader["pin"].ToString();

                    reader.Close();

                    // Validate and parse the withdrawal amount
                    if (int.TryParse(TextBox1.Text.Trim(), out int withdrawalAmount) && withdrawalAmount > 0)
                    {
                        if (currentBalance >= withdrawalAmount)
                        {
                            // Calculate the new balance
                            int newBalance = currentBalance - withdrawalAmount;
                            DateTime transactionDate = DateTime.Now;
                            string transactionType = "Withdrawal";

                            // Update the user's balance in the `user_info` table
                            string updateQuery = "UPDATE user_info SET balance = @NewBalance WHERE account_number = @AccountNumber";
                            SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                            updateCmd.Parameters.AddWithValue("@NewBalance", newBalance);
                            updateCmd.Parameters.AddWithValue("@AccountNumber", accountNumber);

                            con.Close(); // Close the connection before reopening for update
                            con.Open();
                            updateCmd.ExecuteNonQuery();

                            // Insert the transaction into the `transactions` table
                            string insertTransactionQuery = @"
                                INSERT INTO transactions (AccountNumber, TransactionDate, TransactionAmount, TransactionType, BalanceAfterTransaction, Description, Pin) 
                                VALUES (@AccountNumber, @TransactionDate, @TransactionAmount, @TransactionType, @BalanceAfterTransaction, @Description, @Pin)";
                            SqlCommand transactionCmd = new SqlCommand(insertTransactionQuery, con);
                            transactionCmd.Parameters.AddWithValue("@AccountNumber", accountNumber);
                            transactionCmd.Parameters.AddWithValue("@TransactionDate", transactionDate);
                            transactionCmd.Parameters.AddWithValue("@TransactionAmount", withdrawalAmount);
                            transactionCmd.Parameters.AddWithValue("@TransactionType", transactionType); // "Withdrawal"
                            transactionCmd.Parameters.AddWithValue("@BalanceAfterTransaction", newBalance);
                            transactionCmd.Parameters.AddWithValue("@Description", "Debit"); // Withdrawal is a debit transaction
                           // transactionCmd.Parameters.AddWithValue("@Pin", userPin); // Include PIN in the transaction

                            transactionCmd.ExecuteNonQuery();

                            // Redirect to confirmation page
                            Response.Redirect("cashdepositfinal.aspx");
                        }
                        else
                        {
                            // Display error for insufficient funds
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                                "<script>alert('Insufficient funds.')</script>");
                        }
                    }
                    else
                    {
                        // Display error for invalid withdrawal amount
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                            "<script>alert('Invalid withdrawal amount.')</script>");
                    }
                }
                else
                {
                    // Display error for invalid PIN
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                        "<script>alert('Invalid PIN.')</script>");
                }
            }
        }
    }
}
