<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashdepositfinal.aspx.cs" Inherits="project1.cashdepositfinal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Complete</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 15px;
            padding: 50px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 600px;  /* Increased the width */
            text-align: center;
            opacity: 0;  /* Initial state for animation */
            transform: scale(0.8);  /* Initial state for animation */
            animation: fadeInScale 1.5s forwards;  /* Animation for smooth scale and fade-in */
        }

        @keyframes fadeInScale {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .header {
            font-size: 32px;  /* Increased font size */
            font-weight: bold;
            color: #28a745;
            margin-bottom: 25px;
        }

        .message {
            font-size: 22px;  /* Increased font size */
            color: #555;
            margin: 30px 0;
            line-height: 1.6;
        }

        .button-container {
            margin-top: 30px;
        }

        .button-container button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 20px 40px;  /* Increased padding for a larger button */
            font-size: 20px;  /* Increased font size */
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 200px;  /* Added width for consistent button size */
            margin: 10px 0;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }

        .footer {
            font-size: 14px;
            color: #888;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">Transaction Complete</div>
            <div class="message">
                Your transaction has been successfully completed. <br />
                Thank you for using our services.
            </div>

            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="btn" Height="45px" OnClick="Button1_Click" Width="125px" />
            </div>

            
        </div>
    </form>
</body>
</html>
