USE [ecommerce]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Item]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[total_price] [decimal](10, 2) NULL,
	[user_id] [int] NULL,
	[shipment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[SKU] [varchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[price] [decimal](10, 2) NULL,
	[stock] [int] NULL,
	[image] [varchar](100) NULL,
	[size] [varchar](1) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[shipment_date] [datetime] NULL,
	[address] [nvarchar](200) NULL,
	[state] [nvarchar](100) NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[phone_number] [varchar](100) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 6/18/2024 9:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[wishlist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([cart_id], [quantity], [user_id], [product_id]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Carts] ([cart_id], [quantity], [user_id], [product_id]) VALUES (4, 1, 4, 2)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Áo')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Quần')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Mũ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Item] ON 

INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (1, 1, CAST(299000.00 AS Decimal(10, 2)), 3, 3)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (2, 2, CAST(199000.00 AS Decimal(10, 2)), 4, 5)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (3, 3, CAST(599000.00 AS Decimal(10, 2)), 2, 5)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (4, 6, CAST(560000.00 AS Decimal(10, 2)), 11, 6)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (5, 2, CAST(599000.00 AS Decimal(10, 2)), 2, 6)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (6, 2, CAST(300000.00 AS Decimal(10, 2)), 1, 7)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (7, 2, CAST(560000.00 AS Decimal(10, 2)), 13, 7)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (8, 3, CAST(899000.00 AS Decimal(10, 2)), 36, 8)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (9, 2, CAST(899000.00 AS Decimal(10, 2)), 37, 8)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (10, 1, CAST(899000.00 AS Decimal(10, 2)), 5, 8)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (13, 9, CAST(560000.00 AS Decimal(10, 2)), 39, 11)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (14, 1, CAST(560000.00 AS Decimal(10, 2)), 11, 12)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (15, 1, CAST(300000.00 AS Decimal(10, 2)), 24, 12)
INSERT [dbo].[Order_Item] ([order_item_id], [quantity], [price], [product_id], [order_id]) VALUES (16, 1, CAST(250000.00 AS Decimal(10, 2)), 19, 12)
SET IDENTITY_INSERT [dbo].[Order_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (2, CAST(N'2024-06-16T00:00:00.000' AS DateTime), CAST(300000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (3, CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(299000.00 AS Decimal(10, 2)), 3, 6)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (4, CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(299000.00 AS Decimal(10, 2)), 3, 7)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (5, CAST(N'2024-06-16T16:14:52.760' AS DateTime), CAST(2195000.00 AS Decimal(10, 2)), 7, 8)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (6, CAST(N'2024-06-17T21:53:30.933' AS DateTime), CAST(4558000.00 AS Decimal(10, 2)), 7, 10)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (7, CAST(N'2024-06-17T22:38:59.087' AS DateTime), CAST(1720000.00 AS Decimal(10, 2)), 8, 11)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (8, CAST(N'2024-06-17T23:17:15.247' AS DateTime), CAST(5394000.00 AS Decimal(10, 2)), 7, 12)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (11, CAST(N'2024-06-18T00:23:59.130' AS DateTime), CAST(5040000.00 AS Decimal(10, 2)), 7, 14)
INSERT [dbo].[Orders] ([order_id], [order_date], [total_price], [user_id], [shipment_id]) VALUES (12, CAST(N'2024-06-18T21:15:48.740' AS DateTime), CAST(1110000.00 AS Decimal(10, 2)), 7, 15)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (1, N'DirtyCoins Jico', N'SKU001', N' • Chất liệu: JeanDenim. • Baggy Fit. • Bề mặt vải dệt jacquard logo pattern. • Nhãn da thương hiệu may ở sau lưng quần.', CAST(300000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jico.jpg', N'M', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (2, N'DirtyCoins Jogger', N'SKU002', N'• Chất liệu: Polyester. • Relaxed Fit. • Logo Y được thêu bên hông mặt trước quần. • Phần dây rút đồng chất liệu vải quần.', CAST(599000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jogger.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (3, N'DirtyCoins Jeans', N'SKU003', N'• Chất liệu: Cotton Denim. • Slim Fit. • Bề mặt vải được wash nhẹ. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(299000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jeans.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (4, N'DirtyCoins Logo Dad Cap', N'SKU004', N'• Freesize. • Chất liệu: Polyester. • Artwork "DirtyCoins Wavy" được áp dụng kĩ thuật in lụa. • Artwork "Dico Junior" và "Y Heart" được áp dụng kĩ thuật thêu patch.', CAST(199000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Logo_Dad_Cap.jpg', N'S', 3)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (5, N'DirtyCoins Plannel love', N'SKU005', N'• Chất liệu: Nhung tăm. • Relaxed Fit. • Chi tiết túi áo hình trái tim trên ngực trái. • Logo DirtyCoins được thêu trên túi ngực.', CAST(899000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Plannel_love.jpg', N'S', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (11, N'DirtCoins Cadigan pink', N'SKU006', N'• Chất liệu: nỉ bông. • Relaxed Fit. • 2 túi thân áo. • Hoạ tiết DirtyCoins được in tràn toàn bộ thân áo. • Ngực trái thêu logo chữ Y.', CAST(560000.00 AS Decimal(10, 2)), 10, N'DirtCoins_Cadigan_pink.jpg', N'S', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (12, N'DirtyCoins Bagy', N'SKU007', N'• Chất liệu: Cotton Denim. • Baggy Fit. • Bề mặt vải được wash và nhuộm màu. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Bagy.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (13, N'DirtyCoins Brown Pants', N'SKU008', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(560000.00 AS Decimal(10, 2)), 10, N'DirtyCoins_Brown_Pants.jpg', N'M', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (14, N'DirtyCoins Cago', N'SKU009', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Cago.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (15, N'Dirtycoins Academy', N'SKU0016', N'• Chất liệu: Cotton. • Regular Fit. • Hình in mặt trước áo được áp dụng công nghệ in phồng.', CAST(350000.00 AS Decimal(10, 2)), 10, N'Dirtycoins_Academy.jpg', N'M', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (16, N'DirtyCoins Chonky Kittens', N'SKU0010', N'• Chất liệu: Cotton. • Regular Fit. • Hình in mặt trước áo được áp dụng công nghệ in phồng.', CAST(350000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Chonky_Kittens.jpg', N'M', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (17, N'Gothic', N'SKU0011', N'• Chất liệu: Cotton. • Regular Fit. • Hình in mặt trước áo được áp dụng công nghệ in phồng.', CAST(350000.00 AS Decimal(10, 2)), 50, N'gothic.jpg', N'M', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (18, N'DirtyCoins University Logo Snapback', N'SKU0012', N'• Freesize. • Chất liệu: Polyester. • Artwork "DirtyCoins Wavy" được áp dụng kĩ thuật in lụa. • Artwork "Dico Junior" và "Y Heart" được áp dụng kĩ thuật thêu patch.', CAST(199000.00 AS Decimal(10, 2)), 80, N'DirtyCoins_University_Logo_Snapback.jpg', N'S', 3)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (19, N'DirtyCoins Logo Mesh Cap', N'SKU0013', N'• Freesize. • Chất liệu: Polyester. • Artwork "DirtyCoins Wavy" được áp dụng kĩ thuật in lụa. • Artwork "Dico Junior" và "Y Heart" được áp dụng kĩ thuật thêu patch.', CAST(250000.00 AS Decimal(10, 2)), 80, N'Logo_Mesh_Cap.jpg', N'S', 3)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (21, N'DirtyCoins Jacket', N'SKU0014', N'• Chất liệu: Cotton Denim. • Relaxed Fit. • Bề mặt vải dệt jacquard logo pattern. • Vải có hiệu ứng wash bề mặt. • Nút kim loại dập logo thương hiệu. • Nhãn da thương hiệu may ở lai áo thân sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jacket.jpg', N'S', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (23, N'Dirtycoins Loure', N'SKU0015', N'• Chất liệu: Cotton Denim. • Baggy Fit. • Bề mặt vải dệt jacquard logo pattern. • Nhãn da thương hiệu may ở sau lưng quần.', CAST(250000.00 AS Decimal(10, 2)), 10, N'Dirtycoins_Loure.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (24, N' DirtyCoins Jico', N'SKU001', N'• Chất liệu: JeanDenim. • Baggy Fit. • Bề mặt vải dệt jacquard logo pattern. • Nhãn da thương hiệu may ở sau lưng quần.', CAST(300000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jico.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (25, N'DirtyCoins Jico', N'SKU001', N' • Chất liệu: JeanDenim. • Baggy Fit. • Bề mặt vải dệt jacquard logo pattern. • Nhãn da thương hiệu may ở sau lưng quần.', CAST(300000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jico.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (26, N'DirtyCoins Jogger', N'SKU002', N'• Chất liệu: Polyester. • Relaxed Fit. • Logo Y được thêu bên hông mặt trước quần. • Phần dây rút đồng chất liệu vải quần.', CAST(599000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jogger.jpg', N'M', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (27, N'DirtyCoins Jogger', N'SKU002', N'• Chất liệu: Polyester. • Relaxed Fit. • Logo Y được thêu bên hông mặt trước quần. • Phần dây rút đồng chất liệu vải quần.', CAST(599000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jogger.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (28, N'DirtyCoins Jeans', N'SKU003', N'• Chất liệu: Cotton Denim. • Slim Fit. • Bề mặt vải được wash nhẹ. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(299000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jeans.jpg', N'M', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (29, N'DirtyCoins Jeans', N'SKU003', N'• Chất liệu: Cotton Denim. • Slim Fit. • Bề mặt vải được wash nhẹ. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(299000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Jeans.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (30, N'DirtyCoins Logo Dad Cap', N'SKU004', N'• Freesize. • Chất liệu: Polyester. • Artwork "DirtyCoins Wavy" được áp dụng kĩ thuật in lụa. • Artwork "Dico Junior" và "Y Heart" được áp dụng kĩ thuật thêu patch.', CAST(199000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Logo_Dad_Cap.jpg', N'M', 3)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (31, N'DirtyCoins Logo Dad Cap', N'SKU004', N'• Freesize. • Chất liệu: Polyester. • Artwork "DirtyCoins Wavy" được áp dụng kĩ thuật in lụa. • Artwork "Dico Junior" và "Y Heart" được áp dụng kĩ thuật thêu patch.', CAST(199000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Logo_Dad_Cap.jpg', N'L', 3)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (36, N'DirtyCoins Plannel love', N'SKU005', N'• Chất liệu: Nhung tăm. • Relaxed Fit. • Chi tiết túi áo hình trái tim trên ngực trái. • Logo DirtyCoins được thêu trên túi ngực.', CAST(899000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Plannel_love.jpg', N'M', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (37, N'DirtyCoins Plannel love', N'SKU005', N'• Chất liệu: Nhung tăm. • Relaxed Fit. • Chi tiết túi áo hình trái tim trên ngực trái. • Logo DirtyCoins được thêu trên túi ngực.', CAST(899000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Plannel_love.jpg', N'L', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (38, N'DirtCoins Cadigan pink', N'SKU006', N'• Chất liệu: nỉ bông. • Relaxed Fit. • 2 túi thân áo. • Hoạ tiết DirtyCoins được in tràn toàn bộ thân áo. • Ngực trái thêu logo chữ Y.', CAST(560000.00 AS Decimal(10, 2)), 50, N'DirtCoins_Cadigan_pink.jpg', N'M', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (39, N'DirtCoins Cadigan pink', N'SKU006', N'• Chất liệu: nỉ bông. • Relaxed Fit. • 2 túi thân áo. • Hoạ tiết DirtyCoins được in tràn toàn bộ thân áo. • Ngực trái thêu logo chữ Y.', CAST(560000.00 AS Decimal(10, 2)), 50, N'DirtCoins_Cadigan_pink.jpg', N'L', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (40, N'DirtyCoins Bagy', N'SKU007', N'• Chất liệu: Cotton Denim. • Baggy Fit. • Bề mặt vải được wash và nhuộm màu. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Bagy.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (41, N'DirtyCoins Bagy', N'SKU007', N'• Chất liệu: Cotton Denim. • Baggy Fit. • Bề mặt vải được wash và nhuộm màu. • Nhãn da in thương hiệu được may sau quần. • Logo Y được thêu trên 2 túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Bagy.jpg', N'M', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (42, N'DirtyCoins Brown Pants', N'SKU008', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(560000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Brown_Pants.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (43, N'DirtyCoins Brown Pants', N'SKU008', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(560000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Brown_Pants.jpg', N'L', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (44, N'DirtyCoins Cago', N'SKU009', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Cago.jpg', N'S', 2)
INSERT [dbo].[Products] ([product_id], [product_name], [SKU], [description], [price], [stock], [image], [size], [category_id]) VALUES (45, N'DirtyCoins Cago', N'SKU009', N'• Chất liệu: Denim Cotton. • Form dáng: Relaxed Fit. • Thiết kế dạng double knee, miếng đắp mảnh cùng chất liệu. • Hình thêu logo Y trên túi quần sau.', CAST(650000.00 AS Decimal(10, 2)), 50, N'DirtyCoins_Cago.jpg', N'M', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipment] ON 

INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (1, CAST(N'2024-06-16T00:00:00.000' AS DateTime), N'Tu Hoàng, Hà N?i', N'Đã giao', NULL, NULL, NULL)
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (4, CAST(N'2024-06-17T00:00:00.000' AS DateTime), N'Tu Hoàng', N'Ðang x? lý', 4, NULL, NULL)
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (5, CAST(N'2024-06-17T00:00:00.000' AS DateTime), N'Đại học Công Nghiệp Hà Nội', N'Đang xử lý', 4, NULL, NULL)
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (6, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'Đông Anh', N'Trả hàng', 3, NULL, NULL)
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (7, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Hà Nội', N'Trả hàng', 3, NULL, NULL)
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (8, CAST(N'2024-06-16T16:14:52.757' AS DateTime), N'hà nội', N'Trả hàng', 7, N'Đỗ Đức Ninh', N'0369936010')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (10, CAST(N'2024-06-17T21:53:30.930' AS DateTime), N'Tu Hoàng, Nam Từ Liêm, Hà Nội', N'Đã giao', 7, N'Đỗ Đức Ninh', N'0369936010')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (11, CAST(N'2024-06-17T22:38:59.073' AS DateTime), N'Tu Hoàng, Nam Từ Liêm, Hà Nội', N'Đã giao', 8, N'Nguyễn Cao Kỳ', N'0377889900')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (12, CAST(N'2024-06-17T23:17:15.240' AS DateTime), N'Tu Hoàng, Nam Từ Liêm, Hà Nội', N'Đang xử lý', 7, N'Đỗ Đức Ninh', N'0369936010')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (13, CAST(N'2024-06-17T23:56:57.490' AS DateTime), N'', N'Đang xử lý', 7, N'', N'')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (14, CAST(N'2024-06-18T00:23:59.127' AS DateTime), N'Đông Anh, Hà Nội', N'Đang xử lý', 7, N'Đỗ Đức Ninh', N'03778866990')
INSERT [dbo].[Shipment] ([shipment_id], [shipment_date], [address], [state], [user_id], [name], [phone]) VALUES (15, CAST(N'2024-06-18T21:15:48.733' AS DateTime), N'Tu Hoàng, Nam Từ Liêm, Hà Nội', N'Đang xử lý', 7, N'Nguyễn Cao Kỳ', N'0377889900')
SET IDENTITY_INSERT [dbo].[Shipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (3, N'ducninh', N'ducninh@gmail.com', N'123', N'Ha Noi', N'0369936010', 2)
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (4, N'caoky', N'caoky@gmail.com', N'123', N'Phu Tho', N'012345678910', 2)
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (5, N'nck309', N'nck309@gmail.com', N'abc123!@#', N'Phú Thọ', N'0987654321', 1)
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (6, N'admin', N'admin@gmail.com', N'123', N'Hà Nội', N'0987654321', 1)
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (7, N'Do Duc Ninh', N'ninh1@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, N'0369936010', 2)
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [phone_number], [role_id]) VALUES (8, N'kyliam', N'nguyencaoky3092003@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, N'0377889900', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__783254B1A5872B90]    Script Date: 6/18/2024 9:55:27 PM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Shipment] ADD  CONSTRAINT [DF_Shipment_Date]  DEFAULT (getdate()) FOR [shipment_date]
GO
ALTER TABLE [dbo].[Shipment] ADD  CONSTRAINT [DF_Shipment_State]  DEFAULT (N'Đang xử lý') FOR [state]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((2)) FOR [role_id]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([shipment_id])
REFERENCES [dbo].[Shipment] ([shipment_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Role]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([size]='L' OR [size]='M' OR [size]='S'))
GO
