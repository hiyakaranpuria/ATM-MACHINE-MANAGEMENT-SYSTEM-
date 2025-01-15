using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace project1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No specific initialization required
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

            
            if (string.IsNullOrWhiteSpace(TextBox2.Text) || string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                    "<script>alert('Please provide both PIN and deposit amount.')</script>");
                return;
            }

           
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                string query = "SELECT account_number, balance, pin FROM user_info WHERE pin = @Pin";
                SqlCommand cmd = new SqlCommand(query, con);
               

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    
                    string accountNumber = reader["account_number"].ToString();
                    int currentBalance = reader["balance"] != DBNull.Value ? Convert.ToInt32(reader["balance"]) : 0;
                  

                    
                    if (int.TryParse(TextBox1.Text, out int depositAmount) && depositAmount > 0)
                    {
                       
                        int newBalance = currentBalance + depositAmount;
                        DateTime transactionDate = DateTime.Now; 
                        string transactionType = "Deposit"; 

                        
                        string updateQuery = "UPDATE user_info SET balance = @NewBalance WHERE account_number = @AccountNumber";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@NewBalance", newBalance);
                        updateCmd.Parameters.AddWithValue("@AccountNumber", accountNumber);
                        updateCmd.ExecuteNonQuery();
                      


                        string insertTransactionQuery = @"
                            INSERT INTO transactions (AccountNumber, TransactionDate, TransactionAmount, TransactionType, BalanceAfterTransaction, Description) 
                            VALUES (@AccountNumber, @TransactionDate, @TransactionAmount, @TransactionType, @BalanceAfterTransaction, @Description,)";
                        SqlCommand transactionCmd = new SqlCommand(insertTransactionQuery, con);
                        transactionCmd.Parameters.AddWithValue("@AccountNumber", accountNumber);
                        transactionCmd.Parameters.AddWithValue("@TransactionDate", transactionDate);
                        transactionCmd.Parameters.AddWithValue("@TransactionAmount", depositAmount);
                        transactionCmd.Parameters.AddWithValue("@TransactionType", transactionType); 
                        transactionCmd.Parameters.AddWithValue("@BalanceAfterTransaction", newBalance);
                        transactionCmd.Parameters.AddWithValue("@Description", "Credit");
                       




                       transactionCmd.ExecuteNonQuery();

                       
                        Response.Redirect("cashdepositfinal.aspx");
                    }
                    else
                    {
                        
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                            "<script>alert('Please enter a valid deposit amount greater than 0.')</script>");
                    }
                }
                else
                {
                   
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                        "<script>alert('Invalid PIN. Please try again.')</script>");
                }
            }
        }
    }
}
