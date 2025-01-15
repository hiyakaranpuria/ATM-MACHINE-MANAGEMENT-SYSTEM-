﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbalance.aspx.cs" Inherits="project1.checkbalance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Balance</title>
    <style type="text/css">
        /* General body styles */
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

        /* Main form container */
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 400px;
            text-align: left;

            /* Add animation */
            opacity: 0;
            transform: translateY(50px) scale(0.9);
            animation: fadeInBox 0.8s ease-out forwards, scaleUpBox 0.8s ease-out forwards;
        }

        /* Header Style */
        .header {
            font-size: 28px;
            color: #007bff; /* Blue color */
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        /* Animation: Fade and scale effect */
        @keyframes fadeInBox {
            0% {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes scaleUpBox {
            0% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Input container */
        .input-container {
            margin-bottom: 20px;
        }

        /* Label and input field alignment */
        .input-container label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .input-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #007bff; /* Blue border */
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .input-container input:focus {
            border-color: #0056b3; /* Darker blue on focus */
            outline: none;
        }

        /* Button container and button styling */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .continue-button {
            padding: 15px 30px;
            background-color: #007bff; /* Blue background */
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
            <div class="header">Check Balance</div>

            <!-- PIN input field -->
            <div class="input-container">
                <label for="TextBox1">Enter your PIN:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Button container -->
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="Continue" CssClass="continue-button" OnClick="Button1_Click" />
            </div>
        </div>
    </form>

</body>
</html>
