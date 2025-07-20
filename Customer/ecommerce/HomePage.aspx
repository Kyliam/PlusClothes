<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ecommerce.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <%-- Baner --%>
    <div class="mt-10 relative mb-20" style="height: 500px">
        <swiper-container class="swiper-container" pagination="true" pagination-dynamic-bullets="true">
            <swiper-slide>
                <img src="https://img3.thuthuatphanmem.vn/uploads/2019/10/14/banner-thoi-trang-dang-hien-dai-nhat_113856210.jpg" alt="Alternate Text" /></swiper-slide>
            <swiper-slide>
                <img src="https://down-bs-vn.img.susercontent.com/vn-11134210-7r98o-lq5op5vbq81jbb.webp" alt="Alternate Text" /></swiper-slide>
            <swiper-slide>
                <img src="https://down-bs-vn.img.susercontent.com/vn-11134210-7r98o-lt51envjbli15b.webp
"
                    alt="Alternate Text" /></swiper-slide>
            <!-- Add more slides as needed -->
        </swiper-container>
        <div class="banner">
            <h2 style="font-size: 20px; line-height: 18px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; color: #fff;">BEST PLACE TO BUY CLOTHES</h2>
            <h1 style="text-transform: uppercase; color: #fff; font-size: 34px; font-weight: 600">LOCALSTAR</h1>
            <p style="color: #fff; font-size: 18px;">
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Corrupti ex corporis commodi illum, accusamus
                necessitatibus!
            </p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ProductPage.aspx?category_id=1" CssClass="bg-pink-300  rounded-md hover:opacity-75" Style="padding: 15px 20px; color: black; width: 200px; margin: 0 auto; font-weight: 600; text-align: center">Xem sản phẩm </asp:HyperLink>


        </div>
    </div>

    <!-- ---------------------------------------------------End banner-------------------------->

    <section class="container">
        <div class="story animate__animated text-center px-40" id="myElement">
            <h1 style="margin: 20px 0; font-size: 28px; line-height: 40px; font-weight: 400; text-transform: uppercase;">This is the story that inspired us to create this brand</h1>
            <p style="color: #1d1f2eb3; line-height: 30px; font-weight: 400; margin-bottom: 25px;">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti impedit in cumque ab doloremque odit
                dicta rerum debitis nostrum ea, praesentium eum, molestias nemo doloribus obcaecati corrupti pariatur et
                iste omnis voluptas officiis sapiente asperiores minus quas. Molestias veniam quisquam perferendis quod
                voluptatem, iusto iste repellat voluptates, reiciendis ducimus animi.
            </p>
            <a href="#" style="text-decoration: none; color: #a25f4b; font-size: 18px; position: relative;">Read the full Story</a>
        </div>
    </section>

    <%-- Headline --%>
    <div class="subheadline">
        <span></span>
        Sản phẩm mới ra mắt
            <span></span>
    </div>

    <%-- Top 6 sản phẩm mới ra mắt --%>
    <section class="main">
        <div class="list-products">
            <asp:Repeater ID="newProductsRepeater" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product-img">
                            <img src='<%# Eval("image", "./imgs/{0}") %>' alt='<%# Eval("product_name") %>' />
                        </div>
                        <div class="product-content">
                            <div class="product-info">
                                <p class="product-name"><%# Eval("product_name") %></p>
                                <p class="product-price"><%# Eval("formatted_price")%></p>
                            </div>
                            <a href='<%# "ProductDetails.aspx?sku=" + Eval("SKU") %>' style="display: block;">Xem sản phẩm</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
    <%-- Headline --%>
    <div class="subheadline">
        <span></span>
        Sản phẩm bán chạy nhất
          <span></span>
    </div>
    <%-- Top 6 sản phẩm bán chạy nhất --%>
    <section class="main">
        <div class="list-products justify-center">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product-img">
                            <img src='<%# Eval("image", "./imgs/{0}") %>' alt='<%# Eval("product_name") %>' />
                        </div>
                        <div class="product-content">
                            <div class="product-info">
                                <p class="product-name"><%# Eval("product_name") %></p>
                                <p class="product-price"><%# Eval("price", "{0:N0} VND") %></p>
                            </div>
                            <a href='<%# "ProductDetails.aspx?sku=" + Eval("SKU") %>' style="display: block;">Xem sản phẩm</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
    <!-- --------------------------------------End Products List-------------------------------------- -->

    <section>
        <div class="video">
            <video id="myVideo" src="imgs/video.mp4" autoplay width="100%" muted preload></video>
        </div>
    </section>
    <!-- --------------------------------------End Video-------------------------------------- -->

    <div class="subheadline">
        <span></span>
        BUY 2 ITEMS AND GET A CLOTHES MAGAZINE FREE
        <span></span>
    </div>
    <!-- --------------------------------------End line-------------------------------------- -->
    <section class="main" style="margin-bottom: 200px; margin-top: 100px">
        <div class="magazine">
            <div class="magazine-left">
                <h3>PREMIUM OFFER</h3>
                <h1>Get our Coffee Magazine</h1>
                <p>The most versatile furniture system ever created. Designed to fit your life.</p>
                <a href="#">START SHOPPING</a>
            </div>
            <div class="magazine-right">
                <div class="magazine1">
                    <img src="https://images.unsplash.com/photo-1558769132-cb1aea458c5e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                </div>
                <div class="magazine23">
                    <div class="magazine2">
                        <img src="https://images.unsplash.com/photo-1574201635302-388dd92a4c3f?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                    </div>
                    <div class="magazine3">
                        <img src="https://images.unsplash.com/photo-1479064555552-3ef4979f8908?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
