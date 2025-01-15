<%@ Page Language="C#" AutoEventWireup="True" CodeFile="WebForm8.aspx.cs" Inherits="project1.WebForm8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mini Statement</title>
    <style type="text/css">
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
            transform: scale(0.9);
            opacity: 0;
            animation: fadeInUp 1s forwards, scaleUp 0.5s forwards;
        }

        .header {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes scaleUp {
            0% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
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
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Responsive design */
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
            <div class="header">Mini Statement</div>

            <!-- Account number input field -->
            <div class="input-container">
                <label for="TextBox1">Enter your account number:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </div>

            <!-- PIN input field -->
            <div class="input-container">
                <label for="TextBox2">Enter your PIN:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            </div>

            <!-- Continue button -->
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Continue" />
            </div>
        </div>
    </form>

</body>
</html>
