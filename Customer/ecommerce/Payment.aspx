<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ecommerce.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thanh toán
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container my-10" style="height: 500px; margin-bottom: 200px">
        <div class="w-full h-20 bg-black p-5 mb-10">
            <h1 class="text-white ml-5 text-2xl font-semibold uppercase">Thanh toán</h1>
        </div>
        <div class="flex gap-60">
            <div class="flex flex-col gap-5 px-5 py-16 rounded-lg">
                <h1 class="text-2xl font-semibold text-gray-500">Thông tin khách hàng</h1>
                <div class="">
                    <asp:Label Text="Họ và tên" runat="server" CssClass="mb-3 block" />
                    <asp:TextBox runat="server" ID="txtName" CssClass="border border-gray-400 rounded-md px-4 py-1 outline-none w-80 hover:border-pink-300" />
                </div>
                <div>
                    <asp:Label Text="Địa chỉ" runat="server" CssClass="mb-3 block" />
                    <asp:TextBox runat="server" ID="txtAddress" CssClass="border border-gray-400 rounded-md px-4 py-1 outline-none w-80 hover:border-pink-300" />
                </div>
                <div>
                    <asp:Label Text="Số điện thoại" runat="server" CssClass="mb-3 block" />
                    <asp:TextBox runat="server" ID="txtPhone" CssClass="border border-gray-400 rounded-md px-4 py-1 outline-none w-80 hover:border-pink-300" />
                </div>

                <asp:Button Text="Hoàn tất mua hàng" runat="server" ID="btnCheckout" OnClick="btnCheckout_Click" CssClass="rounded-lg bg-black text-lg p-2 cursor-pointer font-semibold hover:bg-pink-300 hover:text-black text-pink-300" />
            </div>
            <div class="px-5 py-16">
                <h1 class="text-2xl font-semibold text-gray-500 mb-10">Thông tin sản phẩm</h1>
                <asp:Repeater ID="rptCartItems" runat="server">
                    <ItemTemplate>
                        <div class="flex gap-20 border border-gray-500 p-4 ">
                            <div style="min-width: 250px">
                                <asp:Label Text='<%# Eval("product_name") %>' runat="server" CssClass="text-pink-500" />
                                <br />
                                <asp:Label Text='<%# "x" + Eval("quantity") %>' runat="server" />
                                <asp:Label Text='<%# "size " + Eval("size") %>' runat="server" />
                            </div>
                            <div class="text-gray-700 text-lg font-semibold"><%# Eval("total_price")  %> VND</div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
