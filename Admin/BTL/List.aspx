<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="BTL.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Danh sách sản phẩm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .title{
            display:flex;
            justify-content:space-between;
        }
        .search{
            display:flex;
            gap: 2px;
        }
        .search h4{
            padding:5px;
        }
        .txt-search{
            border-radius: 10px;
            margin: 20px;
            border: 0.5px solid black;
        }
        .btn-search{
            border-radius: 10px;
            margin: 20px 10px;
            border: 0.5px solid black;
        }
        .p-list th{
            color: white;
        }
    </style>
    <div>
        <div class="title">
             <h2>Danh sách sản phẩm</h2>
               <div class="search">
                   <h4>Tìm kiếm</h4>
                   <asp:TextBox ID="searchProduct" runat="server" CssClass="txt-search"></asp:TextBox>
                   <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" Onclick="btnSearch_Click"/>
               </div>
              
        </div>
       
        <div class="p-list">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" HeaderStyle-BackColor="#4CAF50" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="product_id"></asp:BoundField>
                    <asp:BoundField DataField="product_name" HeaderText="Tên sản phẩm" SortExpression="product_name"></asp:BoundField>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU"  ControlStyle-Width="130px"></asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Mô tả" SortExpression="description"></asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Giá" SortExpression="price" ControlStyle-Width="140px"></asp:BoundField>
                    <asp:BoundField DataField="stock" HeaderText="Stock" SortExpression="stock"></asp:BoundField>
                    <asp:TemplateField HeaderText="Ảnh" SortExpression="image">
                        <ItemTemplate>
                            <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# "~/Images/" + Eval("image") %>' AlternateText="Product Image" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" ControlStyle-Width="50px"></asp:BoundField>
                    <asp:BoundField DataField="category_id" HeaderText="Mã danh mục" SortExpression="category_id"></asp:BoundField>
                    <asp:TemplateField HeaderText="Sửa" SortExpression="edits">
                        <EditItemTemplate>
                            ID:
                            <asp:Label Text='<%# Eval("product_id") %>' runat="server" ID="product_idLabel1" /><br />
                            Tên sản phẩm:
                            <asp:TextBox Text='<%# Bind("product_name") %>' runat="server" ID="product_nameTextBox" /><br />
                            SKU:
                            <asp:TextBox Text='<%# Bind("SKU") %>' runat="server" ID="SKUTextBox" /><br />
                            Mô tả:
                            <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /><br />
                            Giá:
                            <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" /><br />
                            Stock:
                            <asp:TextBox Text='<%# Bind("stock") %>' runat="server" ID="stockTextBox" /><br />
                            Ảnh:
                            <asp:Label Text='<%# Eval("image") %>' runat="server" ID="imageLabel" />
                            <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                            Size:
                            <asp:TextBox Text='<%# Bind("size") %>' runat="server" ID="sizeTextBox" /><br />
                            Mã danh mục:
                            <asp:TextBox Text='<%# Bind("category_id") %>' runat="server" ID="category_idTextBox" /><br />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
          
            &nbsp;
        </div>
    </div>

</asp:Content>
