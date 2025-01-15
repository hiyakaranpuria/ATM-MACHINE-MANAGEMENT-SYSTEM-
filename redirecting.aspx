<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="redirecting.aspx.cs" Inherits="project1.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Processing</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px 50px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            width: 400px;
            transform: scale(0.8);
            opacity: 0;
            animation: fadeInScale 1s forwards;
        }

        .header {
            font-size: 26px;
            font-weight: bold;
            color: #4caf50;
            margin-bottom: 15px;
        }

        .message {
            font-size: 20px;
            margin: 15px 0;
            line-height: 1.6;
        }

        .footer {
            font-size: 16px;
            color: #888;
            margin-top: 20px;
        }

        .loader {
            border: 6px solid #f3f3f3;
            border-top: 6px solid #4caf50;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
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
    </style>
    <script type="text/javascript">
        
        setTimeout(function () {
            var key = '<%= Request.QueryString["key"] %>'; 
            var redirectUrl = '';

            
            if (key == '1') {
                redirectUrl = 'transaction.aspx';
            } else if (key == '2') {
                redirectUrl = 'cashdeposit.aspx';
            } else if (key == '3') {
                redirectUrl = 'cashwidhrawal.aspx';
            } else if (key == '4') {
                redirectUrl = 'checkbalance.aspx';
            } else if (key == '5') {
                redirectUrl = 'WebForm8.aspx';
            } else {
                redirectUrl = 'default.aspx';  
            }

            
            window.location.href = redirectUrl;
        }, 5000); 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">Processing Transaction</div>
            <div class="loader"></div>
            <div class="message">We are processing your transaction.<br />Please wait while we complete the process.</div>
            <div class="footer">Thank you for your patience!</div>
        </div>
    </form>
</body>
</html>
