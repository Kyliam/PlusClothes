<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="BTL.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Danh sách tài khoản
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .user-list th{
            color: white;
        }
    </style>
    <h2>Danh sách tài khoản</h2>
    <div class="user-list">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="user_id" HeaderStyle-BackColor="#4CAF50">
            <Columns >
                
                <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="user_id"></asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="Tên" SortExpression="username"></asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="Mật khẩu" SortExpression="password"></asp:BoundField>
                <asp:BoundField DataField="address" HeaderText="Địa chỉ" SortExpression="address"></asp:BoundField>
                <asp:BoundField DataField="phone_number" HeaderText="SĐT" SortExpression="phone_number"></asp:BoundField>
                <asp:BoundField DataField="role_id" HeaderText="Role ID" SortExpression="role_id"></asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
            </Columns>

        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString2 %>" DeleteCommand="DELETE FROM [Users] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [Users] ([username]) VALUES (@username)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String"></asp:Parameter>
                <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
