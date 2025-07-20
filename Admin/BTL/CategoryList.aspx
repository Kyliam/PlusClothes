<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="BTL.CategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Danh sách các danh mục
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .cate-list th{
            color: white;
        }
        
    </style>
    <h2>Danh sách danh mục</h2>
    <div class="cate-list">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="category_id" HeaderStyle-BackColor="#4CAF50">
            <Columns>
                <asp:BoundField DataField="category_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="category_id" ></asp:BoundField>
                <asp:BoundField DataField="category_name" HeaderText="Tên danh mục" SortExpression="category_name"></asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString2 %>" DeleteCommand="DELETE FROM [Categories] WHERE [category_id] = @original_category_id AND (([category_name] = @original_category_name) OR ([category_name] IS NULL AND @original_category_name IS NULL))" InsertCommand="INSERT INTO [Categories] ([category_name]) VALUES (@category_name)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [category_name] = @category_name WHERE [category_id] = @original_category_id AND (([category_name] = @original_category_name) OR ([category_name] IS NULL AND @original_category_name IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_category_name" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="category_name" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="category_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_category_name" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
