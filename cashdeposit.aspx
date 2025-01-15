<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashdeposit.aspx.cs" Inherits="project1.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ATM Cash Deposit</title>
    <style type="text/css">
        /* CSS Styling (same as before) */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 400px;
            text-align: left;
            animation: fadeInUp 1s forwards, scaleUp 0.5s forwards;
        }

        .header {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        .input-container {
            margin-bottom: 20px;
        }

        .input-container label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .input-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #007bff;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .input-container input:focus {
            border-color: #0056b3;
            outline: none;
        }

        .button-container {
            text-align: center;
        }

        .continue-button {
            padding: 15px 30px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .continue-button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 480px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">ATM Cash Deposit</div>

            <!-- Amount input field -->
            <div class="input-container">
                <label for="TextBox1">Enter the deposit amount:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- PIN input field -->
            <div class="input-container">
                <label for="TextBox2">Enter your PIN:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Continue button -->
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Continue" CssClass="continue-button" />
            </div>
        </div>
    </form>
</body>
</html>
