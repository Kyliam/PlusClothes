<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ecommerce.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Lịch sử mua hàng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container my-10">
        <div class="w-full h-20 bg-black p-5 mb-10">
            <h1 class="text-white ml-5 text-2xl font-semibold uppercase">Lịch sử mua hàng</h1>
        </div>
        <asp:Repeater ID="rptOrderHistory" runat="server" >
            <HeaderTemplate>
                <div class="mb-5 px-10 py-2">
                    <div class="flex font-semibold">
                        <div class="w-1/5 text-lg">Ngày đặt hàng</div>
                        <div class="w-1/5 text-lg">Tổng giá</div>
                        <div class="w-1/5 text-lg">Địa chỉ</div>
                        <div class="w-1/5 text-lg">Trạng thái</div>
                        <div class="w-1/5 text-lg">Chi tiết</div>
                    </div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="mb-5 p-10">
                    <div class="flex">
                        <div class="w-1/4"><%# Eval("order_date", "{0:dd/MM/yyyy HH:mm}") %></div>
                        <div class="w-1/4"><%# Eval("total_price") %> VND</div>
                        <div class="w-1/4"><%# Eval("address") %></div>
                        <div class="w-1/4 font-semibold <%# GetStateColor(Eval("state")) %>"><%# Eval("state") %></div>

                        <div class="w-1/4">
                            <asp:HyperLink ID="lnkOrderDetails" runat="server" NavigateUrl='<%# "OrderDetails.aspx?order_id=" + Eval("order_id") %>' Text="Xem chi tiết" CssClass="text-pink-500 hover:underline" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
