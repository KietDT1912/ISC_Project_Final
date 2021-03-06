USE [master]
GO
/****** Object:  Database [ShoppingOnline]    Script Date: 3/15/2022 8:04:34 PM ******/
CREATE DATABASE [ShoppingOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingOnline] SET QUERY_STORE = OFF
GO
USE [ShoppingOnline]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/15/2022 8:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](100) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[create_date] [date] NOT NULL,
	[active_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/15/2022 8:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 3/15/2022 8:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](100) NOT NULL,
	[create_date] [date] NOT NULL,
	[total_price] [float] NOT NULL,
 CONSTRAINT [PK__order__3213E83FA9120B88] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 3/15/2022 8:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](200) NOT NULL,
	[product_price] [decimal](18, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__order_de__3213E83F8F31E1B2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/15/2022 8:04:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](2000) NULL,
	[image] [nvarchar](100) NULL,
	[create_date] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__product__3213E83FE0F71A36] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'Admin', N'Admin', N'KietDT', N'HCM', N'KietDTSE140777@fpt.edu.vn', N'0123456789', 1, 1, CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'Cent', N'123', N'Cent', N'Ho Chi Minh', N'lionvs12345@gmail.com', N'0333333333', 0, 0, CAST(N'2020-10-27' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'minh', N'123', N'Nhat Minh', N'Thanh Hoa', N'minh@gmail.com', N'0222222222', 0, 1, CAST(N'2020-10-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'nghia', N'123', N'Minh Nghia', N'Thanh Hoa', N'nghia@gmail.com', N'0987654321', 0, 1, CAST(N'2020-10-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'quan', N'123', N'Hong Quan', N'Thanh Hoa', N'quan@gmail.com', N'0866823499', 0, 1, CAST(N'2020-10-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'User', N'123456', N'Kiet', N'HCM', N'Kiet123@gmail.com', N'0111111111', 0, 1, CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'User2', N'123456', N'Do Tuan Kiet', N'Ha Noi', N'fuhub@gmail.com', N'0828191299', 0, 1, CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'User3', N'123456', N'Do Tuan Kiet', N'Ha Noi', N'1401bachnhi@gmail.com', N'0147835656', 0, 1, CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'User4', N'123456', N'Vera', N'Ha Noi', N'Koo@gmail.com', N'0256987456', 0, 1, CAST(N'2020-10-24' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'User5', N'123456', N'Test', N'Ho Chi Minh', N'gybj@gmail.com', N'02555555555', 0, 1, CAST(N'2020-10-27' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (1, N'YADEA', 1)
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (2, N'JVC', 1)
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (3, N'DK Bike', 1)
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (4, N'HITASA', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (1, N'Cent', CAST(N'2020-10-31' AS Date), 15)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (2, N'Cent', CAST(N'2020-10-31' AS Date), 20)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (14, N'Admin', CAST(N'2020-10-31' AS Date), 35)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (16, N'Admin', CAST(N'2020-10-31' AS Date), 55)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (20, N'quan', CAST(N'2020-10-31' AS Date), 50)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (22, N'Cent', CAST(N'2020-10-31' AS Date), 35)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (24, N'Admin', CAST(N'2020-10-31' AS Date), 56)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (27, N'Cent', CAST(N'2020-11-20' AS Date), 105)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (29, N'Admin', CAST(N'2021-01-28' AS Date), 60)
INSERT [dbo].[order] ([id], [Customer], [create_date], [total_price]) VALUES (31, N'nghia', CAST(N'2022-03-12' AS Date), 60)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1, 1, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 1, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2, 1, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 1, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3, 2, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 1, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4, 2, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 1, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (5, 14, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 1, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (6, 14, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 1, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (7, 16, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 1, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (8, 16, 3, N'Tool3', CAST(15 AS Decimal(18, 0)), 1, N'3.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (9, 16, 6, N'Tool6', CAST(20 AS Decimal(18, 0)), 1, N'6.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (10, 20, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 1, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (11, 20, 6, N'Tool6', CAST(20 AS Decimal(18, 0)), 1, N'6.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (12, 20, 3, N'Tool3', CAST(15 AS Decimal(18, 0)), 1, N'3.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (13, 22, 3, N'Tool3', CAST(15 AS Decimal(18, 0)), 1, N'3.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (14, 22, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 1, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (15, 24, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 2, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (16, 24, 6, N'Tool6', CAST(20 AS Decimal(18, 0)), 1, N'6.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (17, 24, 4, N'Tool4', CAST(6 AS Decimal(18, 0)), 1, N'4.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (18, 27, 1, N'Tool1', CAST(15 AS Decimal(18, 0)), 2, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (19, 27, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 3, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (20, 27, 3, N'Tool3', CAST(15 AS Decimal(18, 0)), 1, N'3.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (21, 29, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 3, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (22, 31, 2, N'Tool2', CAST(20 AS Decimal(18, 0)), 3, N'2.jpg')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (1, 1, N'SP001', N'YADEA XMen Neo', 20, 15, N'Excited', N'1.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (2, 1, N'SP002', N'YADEA S3', 15, 20490000, N'Love it since first try', N'2.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (3, 1, N'SP003', N'YADEA Ulike', 20, 15, N'Get It Now', N'3.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (4, 1, N'SP004', N'YADEA X-Joy', 202, 6, N'Sale Off is coming', N'4.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (5, 1, N'SP005', N'YADEA G5', 212, 7, N'Get it now', N'5.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (6, 2, N'SP006', N'JVC G5', 20, 20, N'Suitable for family', N'6.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (7, 2, N'SP007', N'JVC Vespa Đèn Tròn', 20, 3, N'Give it to your BFF', N'7.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (8, 2, N'SP008', N'JVC Xmen F1', 4, 15, N'Should trial', N'8.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (9, 2, N'SP009', N'JVC GOGO S', 25, 45, N'Boom', N'9.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (10, 3, N'SP0010', N'DK Roma SX New', 5, 78, N'Best in price', N'10.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (11, 3, N'SP0011', N'DK XMan X2', 2, 1000, N'Get it now', N'11.jpg', CAST(N'2020-10-22' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (15, 3, N'SP0012', N'DK Xman X1', 1, 2, N'Must trial', N'12.jpg', CAST(N'2020-10-26' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (19, 4, N'SP0022', N'HITASA S16', 1, 1234, N'Everyone like it', N'13.jpg', CAST(N'2020-10-27' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (20, 4, N'SP0015', N'HITASA 18IM', 1, 999999, N'Good', N'14.jpg', CAST(N'2020-10-27' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (22, 4, N'SP0055', N'HITASA N18', 3554, 1E+30, N'aaa', N'15.jpg', CAST(N'2020-11-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_Account_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF__product__create___145C0A3F]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK__order__Customer__607251E5] FOREIGN KEY([Customer])
REFERENCES [dbo].[account] ([userName])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK__order__Customer__607251E5]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK__order_det__order__4E53A1AA] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK__order_det__order__4E53A1AA]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
USE [master]
GO
ALTER DATABASE [ShoppingOnline] SET  READ_WRITE 
GO
