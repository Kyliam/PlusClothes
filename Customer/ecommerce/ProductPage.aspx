<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="ecommerce.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="flex gap-5 item-center justify-center" style="margin: 50px auto">
        <div class="">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập tên sản phẩm" CssClass="w-full py-2 border border-gray-300 rounded outline-none px-5" />
        </div>
        <div class="">
            <asp:TextBox ID="txtMinPrice" runat="server" placeholder="Giá tối thiểu" TextMode="Number" CssClass="w-full py-2 border border-gray-300 rounded outline-none px-5" />
        </div>
        <div class="">
            <asp:TextBox ID="txtMaxPrice" runat="server" placeholder="Giá tối đa" TextMode="Number" CssClass="w-full py-2 border border-gray-300 rounded outline-none px-5" />
        </div>
        <div class="text-center">
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="bg-pink-500 text-white px-4 py-2 rounded hover:text-pink-700 cursor-pointer hover:bg-black font-medium" OnClick="btnSearch_Click" />
        </div>
    </div>

    <section class="main" style="margin: 100px auto">
        <div class="list-products">
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product-img">
                            <img src="/imgs/<%# Eval("image") %>" alt="" />
                        </div>
                        <div class="product-content">
                            <p class="product-name" style="margin: 10px auto 20px; height: 54px;"><%# Eval("product_name") %></p>
                            <p class="product-price"><%# Eval("formatted_price") %> VND</p>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/ProductDetails.aspx?SKU=" + Eval("SKU") %>' CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-pink-100">Xem sản phẩm</asp:HyperLink>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="pagination" id="paginationContainer" runat="server">
        </div>
    </section>
</asp:Content>
