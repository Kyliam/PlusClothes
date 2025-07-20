<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ecommerce.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section class="container" style="width: 80%; margin: 50px auto">
        <div>
            <h1 class="cart_title" style="font-size: 30px; margin: 50px 0;">Cart</h1>

            <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                <ItemTemplate>
                    <div class="cart_item flex items-center gap-10 border-b border-slate-900 py-5">
                        <div class="cart_item__img">
                            <asp:Image ImageUrl='<%# Eval("image", "./imgs/{0}") %>' runat="server" CssClass="w-36 h-36 object-cover" />

                        </div>
                        <div class="cart_item__name ">
                            <p class="text-lg" style="display: block; min-width: 200px;">
                                <%# Eval("product_name") %>
                            </p>
                        </div>
                        <div class="cart_item__price">
                            <p class="text-lg"><%# Eval("formatted_price") %> VND</p>
                        </div>
                        <div class="cart_item__size">
                            <p class="text-lg"><%# Eval("size") %></p>
                        </div>
                        <div class="cart_item__btngroup flex items-center gap-2">
                            <asp:Button Text="+" CommandName="IncreaseQuantity" CommandArgument='<%# Eval("cart_id") %>' runat="server" CssClass="text-sm p-1 bg-black text-white px-2 w-7 text-center cursor-pointer hover:bg-pink-700" />
                            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("quantity") %>' CssClass="w-7 h-7 bg-pink-300 text-center" ReadOnly="true" />
                            <asp:Button Text="-" CommandName="DecreaseQuantity" CommandArgument='<%# Eval("cart_id") %>' runat="server" CssClass="text-sm bg-gray-900 text-white p-1 cursor-pointer hover:bg-pink-700 w-7" />
                            <asp:Button Text="Xóa" CommandName="RemoveItem" CommandArgument='<%# Eval("cart_id") %>' runat="server" CssClass="text-sm bg-red-500 text-white p-1 cursor-pointer hover:bg-red-700 w-14" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="flex gap-5 items-center my-10">
                <h1 class="text-xl text-pink-500 font-semibold">Tổng giá:</h1>
                <asp:Label ID="lblTotalPrice" runat="server" Text="0 VND" />
            </div>
            <asp:HyperLink ID="payment" runat="server" NavigateUrl='Payment.aspx' CssClass="p-5 mx-auto mb-20 rounded-lg bg-black text-pink-300 font-semibold cursor-pointer hover:bg-pink-200 hover:text-black" Style="width: 200px; margin-bottom: 100px; display: block; text-align: center">Thanh toán</asp:HyperLink>


        </div>
    </section>
</asp:Content>
