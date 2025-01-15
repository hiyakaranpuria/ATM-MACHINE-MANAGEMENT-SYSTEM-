<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ministatementfinal.aspx.cs" Inherits="project1.MiniStatement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mini Statement</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff; 
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 30px; 
            width: 800px; 
            text-align: center;
        }

        h2 {
            color: #007bff; 
            margin-bottom: 20px;
        }

        .label-container label {
            display: block;
            font-size: 18px;
            color: #007bff; 
        }

        .label-container label.dashed {
            border-bottom: 1px dashed #007bff; 
        }

        .label-container label + label {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Mini Statement</h2>

        <div class="label-container">
            <asp:Label ID="LabelAccountNumber" runat="server" CssClass="dashed" Text=""></asp:Label>
        </div>
        
        <div class="label-container">
            <asp:Label ID="LabelTransactionHistory" runat="server" Text="" style="white-space: nowrap;"></asp:Label>
        </div>
        
        <div class="label-container">
            <asp:Label ID="LabelAvailableBalance" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
