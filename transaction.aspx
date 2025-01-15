<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transaction.aspx.cs" Inherits="project1.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Transaction</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://i.ibb.co/CMHKFm8/background.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 500px; 
            background-color: rgba(255, 255, 255, 0.85); 
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            transform: scale(0.8);
            opacity: 0;
            animation: fadeInScale 1.5s ease-out forwards;
        }

        @keyframes fadeInScale {
            0% {
                transform: scale(0.8);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .container h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1a73e8; 
        }

        .description {
            font-size: 18px;
            margin-bottom: 30px;
            line-height: 1.6;
            color: #333;
        }

        .button-container {
            text-align: right;
        }

        .button-container input[type="submit"] {
            margin-top: 15px;
            padding: 10px 25px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background: linear-gradient(45deg, #1a73e8, #004ba0); 
            color: white;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .button-container input[type="submit"]:hover {
            background: linear-gradient(45deg, #004ba0, #1a73e8); 
            transform: scale(1.05);
        }

        .spacer {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Select Your Transaction</h1>
            <div class="description">Please select one of the following options by pressing the button.</div>
            <div class="spacer"></div>
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="Cash Deposit" OnClick="Button1_Click" />
            </div>
            <div class="button-container">
                <asp:Button ID="Button2" runat="server" Text="Cash Withdrawal" OnClick="Button2_Click" />
            </div>
            <div class="button-container">
                <asp:Button ID="Button3" runat="server" Text="Check Balance" OnClick="Button3_Click" />
            </div>
            <div class="button-container">
                <asp:Button ID="Button4" runat="server" Text="Mini Statement" OnClick="Button4_Click" />
            </div>
        </div>
    </form>
</body>
</html>
