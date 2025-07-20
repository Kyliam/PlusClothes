<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="top3_5.aspx.cs" Inherits="BTL.top3_5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Top sản phẩm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .product-list {
            width: 80%;
            margin: 0 auto;
        }
        .product-list h2 {
            text-align: center;
        }
        .product-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .product-list th, .product-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .product-list th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
    
    <div class="product-list">
        <h2>Top 5 Sản Phẩm Bán Chạy Nhất</h2>
        <asp:GridView ID="GridViewTopProducts" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="product_id" HeaderText="ID" />
                <asp:BoundField DataField="product_name" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="TotalSold" HeaderText="Số lượng đã bán" />
            </Columns>
        </asp:GridView>

        <h2>Danh Sách Sản Phẩm Không Bán Được( tồn kho lâu nhất )</h2>
        <asp:GridView ID="GridViewUnsoldProducts" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="product_id" HeaderText="ID" />
                <asp:BoundField DataField="product_name" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="size" HeaderText="Kích cỡ" />

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
