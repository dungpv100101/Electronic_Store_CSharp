USE [Electronic_Shop_System]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [CK_Sell_PriceProduct]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Staffs]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/20/2022 1:28:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 7/20/2022 1:28:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTypes]') AND type in (N'U'))
DROP TABLE [dbo].[ProductTypes]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/20/2022 1:28:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/20/2022 1:28:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/20/2022 1:28:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/20/2022 1:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[BuyPrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/20/2022 1:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[DeliverDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/20/2022 1:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Useguide] [nvarchar](max) NULL,
	[ProduceCountry] [nvarchar](50) NULL,
	[Price] [int] NOT NULL,
	[SellPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 7/20/2022 1:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/20/2022 1:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nchar](10) NULL,
	[isManager] [int] NOT NULL,
	[Account] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[isStaff] [int] NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [Name], [Description], [Useguide], [ProduceCountry], [Price], [SellPrice], [Quantity], [Image]) VALUES (1, 2, N'Laptop Asus', NULL, NULL, NULL, 99, 120, 10, N'm123')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [Name], [Description], [Useguide], [ProduceCountry], [Price], [SellPrice], [Quantity], [Image]) VALUES (2, 2, N'Desktop MC2022', NULL, NULL, NULL, 120, 150, 12, N'k12')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [Name], [Description], [Useguide], [ProduceCountry], [Price], [SellPrice], [Quantity], [Image]) VALUES (3, 1, N'Tv soni 2021', NULL, NULL, NULL, 100, 130, 10, N'T123')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [Name], [Description], [Useguide], [ProduceCountry], [Price], [SellPrice], [Quantity], [Image]) VALUES (4, 3, N'Bếp từ Sunhouse', NULL, NULL, NULL, 200, 250, 5, N'B123')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName]) VALUES (1, N'TV')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName]) VALUES (2, N'PC, LapTop')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName]) VALUES (3, N'Kitchenware')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staffs] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Users] ([StaffID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staffs]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Sell_PriceProduct] CHECK  (([SellPrice]>((20)*[Price])/(100)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Sell_PriceProduct]
GO

INSERT [dbo].[Users] VALUES(1, 'Dung', 'Ha Noi', '0123456789', 1, 'admin', '12345678', 0)
INSERT [dbo].[Users] VALUES(2, 'Huy', 'Ha Noi', '0123456789', 0, 'staff', '12345678', 1)
INSERT [dbo].[Users] VALUES(3, 'Hoang', 'Ha Noi', '0123456789', 0, 'user', '12345678', 0)
