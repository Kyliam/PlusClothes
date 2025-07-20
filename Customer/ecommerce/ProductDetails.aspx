<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ecommerce.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container mx-auto px-4" style="width: 80%; margin: 60px auto;">
        <div class="flex mt-10 gap-10 mx-auto">
            <div class="w-full md:w-2/5">
                <div class="mb-4">
                    <asp:Image ID="productImage" runat="server" CssClass="rounded-lg w-full h-full border border-pink-700" />
                </div>
            </div>
            <div class="w-full md:w-3/5">
                <h2 class="text-2xl font-bold mb-10 text-gray-700">
                    <asp:Label ID="name" runat="server" Text=""></asp:Label>
                </h2>
                <div class="text-lg text-gray-800 mb-4 flex gap-5">
                    <p>Price: </p>
                    <div>
                        <asp:Label ID="price" runat="server" Text=""></asp:Label>
                        <span class="font-bold text-pink-800">VND</span>
                    </div>
                </div>
                <div class="mb-10">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Chọn size:</label>
                    <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
                        <asp:ListItem Text="S" Value="S"></asp:ListItem>
                        <asp:ListItem Text="M" Value="M"></asp:ListItem>
                        <asp:ListItem Text="L" Value="L"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="grid grid-cols-3 gap-4 items-center mb-10">
                    <p>Chọn số lượng</p>
                    <div class="flex items-center col-span-3">
                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="py-2 px-4 rounded-l-md focus:outline-none bg-pink-400 hover:bg-black hover:text-pink-400 font-bold" OnClick="decreaseQuantity_Click" />
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="py-2 rounded-none text-center w-10 font-bold" Text="1"></asp:TextBox>
                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="py-2 px-4 rounded-r-md focus:outline-none bg-pink-400 hover:bg-black hover:text-pink-400 font-bold" OnClick="increaseQuantity_Click" />
                    </div>
                </div>
                <asp:Button Text="Thêm vào giỏ hàng" runat="server" OnClick="btnAddToCart_Click" Style="padding: 10px 20px; cursor: pointer; border-radius: 8px; text-align: center; background-color: #1d1f2e; border: none; color: white; font-weight: 600;" />
            </div>
        </div>
        <div style="margin-top: 50px">
            <h2 class="font-semibold text-2xl text-gray-700 mb-10">Mô tả sản phẩm</h2>
            <asp:Label ID="des" runat="server" CssClass="text-gray-700" Style="line-height: 30px"></asp:Label>
        </div>
        <div style="margin-top: 50px">
            <h2 class="font-semibold text-2xl text-gray-700 mb-10">Sản phẩm liên quan</h2>
            <asp:ListView ID="relatedProductsListView" runat="server">
                <LayoutTemplate>
                    <div class="flex flex-wrap -mx-4 gap-10" style="width: 80%; justify-content: center; margin: 50px auto">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="related-product-item border rounded-lg p-4 w-full md:w-1/2 lg:w-1/4 px-4 mb-8 hover:border-pink-300">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ProductDetails.aspx?sku=" + Eval("SKU") %>' CssClass="hover:text-pink-700">
                            <asp:Image ID="relatedProductImage" runat="server" ImageUrl='<%# string.Concat("./imgs/", Eval("image")) %>' CssClass="w-full object-cover mb-4" />
                        </asp:HyperLink>

                        <h3 class="text-lg font-semibold text-gray-700">
                            <asp:HyperLink ID="relatedProductLink" runat="server" NavigateUrl='<%# "ProductDetails.aspx?sku=" + Eval("SKU") %>' Text='<%# Eval("product_name") %>' CssClass="hover:text-pink-700"></asp:HyperLink>
                        </h3>
                        <p class="text-gray-600">
                            <asp:Label ID="relatedProductPrice" runat="server" Text='<%# String.Format("{0:N0} VND", Eval("price")) %>'></asp:Label>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:ListView>

        </div>
    </div>
</asp:Content>
