<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="balancepage.aspx.cs" Inherits="project1.balancepage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Complete</title>
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

        /* Main container */
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 400px;
            text-align: center;
            /* Animation */
            opacity: 0;
            transform: translateY(50px) scale(0.9);
            animation: fadeIn 1s ease-out forwards, scaleUp 0.8s ease-out forwards;
        }

        /* Header */
        .header {
            font-size: 28px;
            color: #007bff; /* Blue color */
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Label styles */
        .label-container {
            font-size: 20px;
            margin: 20px 0;
            color: #333;
        }

        .balance-label {
            font-size: 22px;
            color: #28a745; /* Green color for balance */
            font-weight: bold;
        }

        /* Button styling */
        .button-container {
            margin-top: 20px;
        }

        .button {
            padding: 12px 24px;
            font-size: 18px;
            color: white;
            background-color: #007bff; /* Blue background */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Animation keyframes */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(50px);
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
            <div class="header"></div>

            <div class="label-container">Available Balance:</div>
            <div class="balance-label">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>

            <div class="button-container">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" CssClass="button" Text="Cancel" />
            </div>
        </div>
    </form>

</body>
</html>
