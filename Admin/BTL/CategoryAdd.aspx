<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryAdd.aspx.cs" Inherits="BTL.CategoryAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thêm danh mục
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h2> Thêm danh mục</h2>
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="category_id" DefaultMode="Insert">
            <EditItemTemplate>
                ID:
                <asp:Label Text='<%# Eval("category_id") %>' runat="server" ID="category_idLabel1" /><br />
                Tên danh mục:
                <asp:TextBox Text='<%# Bind("category_name") %>' runat="server" ID="category_nameTextBox" /><br />
                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Tên danh mục:
                <asp:TextBox Text='<%# Bind("category_name") %>' runat="server" ID="category_nameTextBox" /><br />
                <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label Text='<%# Eval("category_id") %>' runat="server" ID="category_idLabel" /><br />
                Tên danh mục:
                <asp:Label Text='<%# Bind("category_name") %>' runat="server" ID="category_nameLabel" /><br />
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
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
