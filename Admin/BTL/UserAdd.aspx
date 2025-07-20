<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserAdd.aspx.cs" Inherits="BTL.UserAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thêm Tài Khoản
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <style>
        .form-container {
            display: flex;
            flex-direction: column;
            max-width: 300px;
            
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-group label {
            width: 40%;
        }
        .form-group .txtbox {
            width: 55%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .form-group .txtbox:focus {
            border-color: #4CAF50;
        }
        .form-actions {
            display: flex;
            justify-content: flex-start;
            margin-top: 10px;
            gap: 10px;
        }
        .form-actions button {
            margin-right: 10px;
            padding: 5px 10px;
            border: 1px solid #4CAF50;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .form-actions button:hover {
            background-color: #45a049;
            border-color: #45a049;
        }
    </style>
    <h2>Thêm Tài Khoản</h2>
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="user_id" DefaultMode="Insert">
            <EditItemTemplate>
                ID:
                <asp:Label Text='<%# Eval("user_id") %>' runat="server" ID="user_idLabel1" /><br />
                Tên:
                <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="usernameTextBox" /><br />
                Email:
                <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" /><br />
                Mật khẩu:
                <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordTextBox" /><br />
                Địa chỉ:
                <asp:TextBox Text='<%# Bind("address") %>' runat="server" ID="addressTextBox" /><br />
                SĐT:
                <asp:TextBox Text='<%# Bind("phone_number") %>' runat="server" ID="phone_numberTextBox" /><br />
                Role ID:
                <asp:TextBox Text='<%# Bind("role_id") %>' runat="server" ID="role_idTextBox" /><br />
                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                 <div class="form-container">
        <div class="form-group">
            <label for="usernameTextBox">Tên:</label>
            <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="usernameTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="emailTextBox">Email:</label>
            <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="passwordTextBox">Mật khẩu:</label>
            <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="addressTextBox">Địa chỉ:</label>
            <asp:TextBox Text='<%# Bind("address") %>' runat="server" ID="addressTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="phone_numberTextBox">SĐT:</label>
            <asp:TextBox Text='<%# Bind("phone_number") %>' runat="server" ID="phone_numberTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="role_idTextBox">Role ID:</label>
            <asp:TextBox Text='<%# Bind("role_id") %>' runat="server" ID="role_idTextBox" CssClass="txtbox" />
        </div>
        <div class="form-actions">
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="button" />
            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="button" />
        </div>
    </div>
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label Text='<%# Eval("user_id") %>' runat="server" ID="user_idLabel" /><br />
                Tên:
                <asp:Label Text='<%# Bind("username") %>' runat="server" ID="usernameLabel" /><br />
                Email:
                <asp:Label Text='<%# Bind("email") %>' runat="server" ID="emailLabel" /><br />
                Mật khẩu:
                <asp:Label Text='<%# Bind("password") %>' runat="server" ID="passwordLabel" /><br />
                Địa chỉ:
                <asp:Label Text='<%# Bind("address") %>' runat="server" ID="addressLabel" /><br />
                SĐT:
                <asp:Label Text='<%# Bind("phone_number") %>' runat="server" ID="phone_numberLabel" /><br />
                Role ID:
                <asp:Label Text='<%# Bind("role_id") %>' runat="server" ID="role_idLabel" /><br />
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString2 %>" DeleteCommand="DELETE FROM [Users] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [Users] ([username], [email], [password], [address], [phone_number], [role_id]) VALUES (@username, @email, @password, @address, @phone_number, @role_id)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [email] = @email, [password] = @password, [address] = @address, [phone_number] = @phone_number, [role_id] = @role_id WHERE [user_id] = @user_id">
    <DeleteParameters>
        <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="username" Type="String"></asp:Parameter>
        <asp:Parameter Name="email" Type="String"></asp:Parameter>
        <asp:Parameter Name="password" Type="String"></asp:Parameter>
        <asp:Parameter Name="address" Type="String"></asp:Parameter>
        <asp:Parameter Name="phone_number" Type="String"></asp:Parameter>
        <asp:Parameter Name="role_id" Type="Int32"></asp:Parameter>
    </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String"></asp:Parameter>
                <asp:Parameter Name="email" Type="String"></asp:Parameter>
                <asp:Parameter Name="password" Type="String"></asp:Parameter>
                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                <asp:Parameter Name="phone_number" Type="String"></asp:Parameter>
                <asp:Parameter Name="role_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
    </UpdateParameters>
</asp:SqlDataSource>
    </div>
</asp:Content>
