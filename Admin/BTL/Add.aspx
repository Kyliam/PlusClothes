<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="BTL.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thêm sản phẩm
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
            gap:10px;
        }
        .form-actions link-btn {
            margin-right: 10px;
            padding: 5px 10px;
            border: 1px solid #4CAF50;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .form-actions link-btn:hover {
            background-color: #45a049;
            border-color: #45a049;
        }
    </style>

    <h2>Thêm sản phẩm</h2>
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="product_id" OnPageIndexChanging="FormView1_PageIndexChanging" AllowPaging="True" OnItemInserting="ItemInserting" OnItemUpdating="ItemUpdating" DefaultMode="Insert">
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
                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form-container">
        <div class="form-group">
            <label for="product_nameTextBox">Tên sản phẩm:</label>
            <asp:TextBox Text='<%# Bind("product_name") %>' runat="server" ID="product_nameTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="SKUTextBox">SKU:</label>
            <asp:TextBox Text='<%# Bind("SKU") %>' runat="server" ID="SKUTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="descriptionTextBox">Mô tả:</label>
            <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="priceTextBox">Giá:</label>
            <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="stockTextBox">Stock:</label>
            <asp:TextBox Text='<%# Bind("stock") %>' runat="server" ID="stockTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="FileUpload1">Ảnh:</label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="sizeTextBox">Size:</label>
            <asp:TextBox Text='<%# Bind("size") %>' runat="server" ID="sizeTextBox" CssClass="txtbox" />
        </div>
        <div class="form-group">
            <label for="category_idTextBox">Mã danh mục:</label>
            <asp:TextBox Text='<%# Bind("category_id") %>' runat="server" ID="category_idTextBox" CssClass="txtbox" />
        </div>
        <div class="form-actions">
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="link-btn" />
            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="link-btn" />
        </div>
    </div>
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label Text='<%# Eval("product_id") %>' runat="server" ID="product_idLabel" /><br />
                Tên sản phẩm:
                <asp:Label Text='<%# Bind("product_name") %>' runat="server" ID="product_nameLabel" /><br />
                SKU:
                <asp:Label Text='<%# Bind("SKU") %>' runat="server" ID="SKULabel" /><br />
                Mô tả:
                <asp:Label Text='<%# Bind("description") %>' runat="server" ID="descriptionLabel" /><br />
                Giá:
                <asp:Label Text='<%# Bind("price") %>' runat="server" ID="priceLabel" /><br />
                Stock:
                <asp:Label Text='<%# Bind("stock") %>' runat="server" ID="stockLabel" /><br />
                Ảnh:
                <asp:Label Text='<%# Bind("image") %>' runat="server" ID="imageLabel" /><br />
                Size:
                <asp:Label Text='<%# Bind("size") %>' runat="server" ID="sizeLabel" /><br />
                Mã danh mục:
                <asp:Label Text='<%# Bind("category_id") %>' runat="server" ID="category_idLabel" /><br />
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString2 %>" DeleteCommand="DELETE FROM [Products] WHERE [product_id] = @product_id" InsertCommand="INSERT INTO [Products] ([product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (@product_name, @SKU, @description, @price, @stock, @image, @size, @category_id)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [product_name] = @product_name, [SKU] = @SKU, [description] = @description, [price] = @price, [stock] = @stock, [image] = @image, [size] = @size, [category_id] = @category_id WHERE [product_id] = @product_id">
            <DeleteParameters>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="product_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="SKU" Type="String"></asp:Parameter>
                <asp:Parameter Name="description" Type="String"></asp:Parameter>
                <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="stock" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="image" Type="String"></asp:Parameter>
                <asp:Parameter Name="size" Type="String"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="SKU" Type="String"></asp:Parameter>
                <asp:Parameter Name="description" Type="String"></asp:Parameter>
                <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="stock" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="image" Type="String"></asp:Parameter>
                <asp:Parameter Name="size" Type="String"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="SqlAddProduct"></asp:SqlDataSource>
    </div>

</asp:Content>
