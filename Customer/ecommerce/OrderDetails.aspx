<%@ Page Title="Chi tiết đơn hàng" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ecommerce.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Chi tiết đơn hàng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container my-10">
        <div class="w-full h-20 bg-black p-5 mb-10">
            <h1 class="text-white ml-5 text-2xl font-semibold uppercase">Chi tiết đơn hàng</h1>
        </div>
        <asp:Repeater ID="rptOrderDetails" runat="server">
            <HeaderTemplate>
                <div class="mb-5 px-10 py-2 text-center" >
                    <div class="flex font-semibold">
                        <div class="w-1/4">Tên sản phẩm</div>
                        <div class="w-1/4">Số lượng</div>
                        <div class="w-1/4">Giá</div>
                        <div class="w-1/4">Tổng</div>
                    </div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="mb-5 px-10 border-b border-slate-800 py-5 text-center" >
                    <div class="flex">
                        <div class="w-1/4"><%# Eval("product_name") %></div>
                        <div class="w-1/4"><%# Eval("quantity") %></div>
                        <div class="w-1/4"><%# Eval("price") %> VND</div>
                        <div class="w-1/4"><%# Eval("total_price") %> VND</div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="mb-40"></div>
    </div>
</asp:Content>
