using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace project1
{
    public partial class ministatement : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You can set a default card number here if needed.
                TextBox4.Text = "Enter Card Number";
            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            string cardNumber = TextBox4.Text.Trim(); // Fetch user input from TextBox4
            if (string.IsNullOrEmpty(cardNumber))
            {
                Label2.Text = "Please enter a valid card number.";
                return;
            }

            string connectionString = "Data Source=DESKTOP-08DS8VJ\\SQLEXPRESS;Initial Catalog=atm;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 * FROM transactions WHERE AccountNumber = @CardNumber ORDER BY TransactionDate DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CardNumber", cardNumber);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    Label2.Text = reader["AccountNumber"].ToString(); // Card number
                    Label3.Text = reader["TransactionDate"].ToString(); // Transaction Date
                    Label4.Text = reader["TransactionAmount"].ToString(); // Transaction Amount
                    Label5.Text = reader["TransactionType"].ToString(); // Transaction Type (Debit/Credit)
                }
                else
                {
                    Label2.Text = "No transactions found.";
                    Label3.Text = Label4.Text = Label5.Text = string.Empty;
                }

                reader.Close();
            }
        }
    }
}
