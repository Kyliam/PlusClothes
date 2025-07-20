<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #form1 {
            background-color: white;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 20px;
            width: 350px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .admin-icon {
            width: 50px;
            height: 50px;
            margin-bottom: 20px;
        }
        .label, .textbox, .btn-login {
            display: block;
            width: 100%;
            margin: 10px 0;
        }
        .label {
            text-align: left;
            color: black;
        }
        .textbox {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-left: -10px;
        }
       .btn-login {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-login:hover {
            background-color: #45a049;
        }
        .admin-icon{
            width:50px;
            height:50px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="Images/logo.jpg" alt="logo" class="admin-icon"/>
            
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label>
            <br />
            <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login"/>
        </div>
    </form>
</body>
</html>
