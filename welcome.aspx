<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="project1.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bank Transactions</title>
    <style>
        /* General Body Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://i.ibb.co/CMHKFm8/background.jpg');
            background-size: cover;
            background-position: center;
        }

        /* Welcome Box Container */
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* White with some transparency */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            width: 450px; /* Increased width */
            max-width: 90%; /* Ensure it doesn't overflow on smaller screens */
            text-align: center;
            animation: fadeIn 1s ease-in-out; /* Animation for box */
        }

        /* Header Styles */
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 32px; /* Larger text */
            font-weight: 600;
            animation: slideIn 0.5s ease-out; /* Animation for header */
        }

        /* Text Styles */
        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 16px;
            line-height: 1.5;
            animation: slideIn 0.7s ease-out; /* Animation for paragraph */
        }

        /* Label Styles */
        label {
            display: block;
            margin-bottom: 10px;
            color: #666;
            font-size: 14px;
        }

        /* Input Box Styles */
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #4caf50;
        }

        /* Button Styles */
        button {
            background: linear-gradient(45deg, #4caf50, #81c784); /* Gradient background */
            color: white;
            padding: 15px 0; /* Increased padding for larger button */
            border: none;
            border-radius: 6px;
            font-size: 18px; /* Increased font size */
            cursor: pointer;
            width: 100%;
            transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            animation: buttonAnimation 0.5s ease-in-out; /* Animation for button */
        }

        button:hover {
            background: linear-gradient(45deg, #66bb6a, #388e3c); /* Darker gradient on hover */
            transform: scale(1.05); /* Slight scaling effect */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect on hover */
        }

        /* Fade-in Animation for Welcome Box */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Slide-in Animation for Header and Text */
        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateX(-20px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Button Click Animation */
        @keyframes buttonAnimation {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Welcome</h1>
            <p>Please enter your account or card number to proceed with Withdrawal, Deposit, or Other Transactions.</p>
            <asp:Label ID="Label3" runat="server" Text="Enter your Card Number"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Card Number"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
