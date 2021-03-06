USE [master]
GO
/****** Object:  Database [WEBSITE_VANPHONGPHAM]    Script Date: 12/11/2021 7:10:36 PM ******/
CREATE DATABASE [WEBSITE_VANPHONGPHAM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBSITE_VANPHONGPHAM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WEBSITE_VANPHONGPHAM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WEBSITE_VANPHONGPHAM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WEBSITE_VANPHONGPHAM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBSITE_VANPHONGPHAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET  MULTI_USER 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEBSITE_VANPHONGPHAM', N'ON'
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET QUERY_STORE = OFF
GO
USE [WEBSITE_VANPHONGPHAM]
GO
/****** Object:  Table [dbo].[address]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[ward_id] [int] NOT NULL,
	[specific_address] [nvarchar](100) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](300) NULL,
	[note] [nvarchar](300) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[district_id] [int] NOT NULL,
	[district_name] [nvarchar](100) NULL,
	[district_prefix] [nvarchar](100) NULL,
	[province_id] [int] NULL,
 CONSTRAINT [PK_district] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[comment] [nvarchar](2000) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[total_price] [numeric](18, 2) NOT NULL,
	[status_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[item_price] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_permission] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poster]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NULL,
	[type] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_poster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[image] [nvarchar](300) NULL,
	[price] [numeric](18, 2) NOT NULL,
	[specification] [nvarchar](50) NULL,
	[calculation_unit] [nvarchar](15) NOT NULL,
	[discount] [int] NULL,
	[sold_quantity] [int] NULL,
	[quantity] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[province_id] [int] NOT NULL,
	[province_name] [nvarchar](100) NULL,
	[province_code] [nvarchar](20) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](100) NULL,
	[image] [nvarchar](300) NULL,
	[address_id] [int] NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[created_at] [date] NOT NULL,
	[permission_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ward]    Script Date: 12/11/2021 7:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ward](
	[ward_id] [int] NOT NULL,
	[ward_name] [nvarchar](50) NOT NULL,
	[ward_prefix] [nvarchar](20) NULL,
	[district_id] [int] NULL,
 CONSTRAINT [PK_ward] PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (1, 173, N'1/15C kp3 t??? 38')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (2, 173, N'1/10D')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (3, 191, N'1/15CF')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (4, 94, N'123')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (5, 1, N'123')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (6, 1, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (7, 1, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (8, 94, N'1/1D')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (9, 143, N'2/3C')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (10, 1, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (11, 1, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (12, 1, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (13, 66, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (14, 84, N'12')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (15, 98, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (16, 1, N'7/6H')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (17, 1, N'2/3C')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (18, 1, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (19, 1, N'')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (20, 1, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (21, 191, N'1/1YH')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (22, 195, N'45F')
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (23, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (24, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (25, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (26, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (27, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (28, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (29, 173, NULL)
GO
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (30, 173, NULL)
GO
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (1, N'Thi??n Long', N'Thi??n Long l?? c??ng ty chuy??n v??? v??n ph??ng ph???m, d???ng c??? m??? thu???t c???a Vi???t Nam. C??ng ty ???????c th??nh l???p v??o n??m 1981 t???i th??nh ph??? H??? Ch?? Minh, ti???n th??n l?? C?? s??? b??t bi Thi??n Long.')
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (2, N'Bizner', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (3, N'Double A', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (4, N'IK Plus', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (5, N'G-Star', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (6, N'Pronoti', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (7, N'Xukiva', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (8, N'Paper Mate', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (9, N'SAHAKA', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (10, N'Supreme', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (11, N'Ford', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (12, N'SUBARU', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (13, N'Sharpie', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (14, N'Colokit', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (15, N'Crayola', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (16, N'Flexoffice', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (17, N'??i???m 10', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (18, N'Tomy', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (19, N'CASIO', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (20, N'Vinacal', NULL)
GO
INSERT [dbo].[brand] ([brand_id], [name], [description]) VALUES (21, N'Logitech', NULL)
GO
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (3, 26, 5)
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (3, 37, 1)
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (4, 37, 1)
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (9, 26, 1)
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (30, 30, 1)
GO
INSERT [dbo].[cart] ([product_id], [user_id], [quantity]) VALUES (37, 22, 3)
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (1, N'B??t vi???t', N'butViet.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (2, N'Gi???y v??n ph??ng', N'giayVP.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (3, N'D???ng c??? v??n ph??ng', N'dungCuVP.jpg', N'')
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (4, N'File b??a h??? s??', N'fileBiaHoSo.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (5, N'D???ng c??? h???c t???p', N'dungCuHocTap.png', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (6, N'B??ng keo - Dao k??o - H??? d??n', N'bangKeoHoDan.png', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (7, N'S??? - B?? th??', N'soBiathu.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (8, N'M??y t??nh', N'mayTinh.png', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (9, N'B???ng v??n ph??ng', N'bangVP.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (10, N'B???o h??? lao ?????ng', N'baoHoLD.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (11, N'Pin c??c lo???i', N'pin.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (12, N'Gi???y in ???nh - in m??u ch???t l?????ng cao', N'giayInAnh.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (13, N'Ph??? ki???n ??i???n tho???i', N'PKdienThoai.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (14, N'Thi???t b??? v??n ph??ng', N'thietBiVP.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (15, N'Thi???t b??? ??i???n t???', N'thietBiDienTu.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (16, N'M??? thu???t', N'myThuat.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (17, N'M???c in - B??m m???c', N'mucIn.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (18, N'K??? - R???', N'keRo.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (19, N'D???ng c??? v??? sinh v??n ph??ng', N'DungCuVSVP.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (20, N'D???ng c??? ????ng d???u', N'dungCuDongDau.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (21, N'??n v???t v??n ph??ng', N'anVat.jpg', NULL)
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (22, N'B??t cao c???p', N'211118231826t???i xu???ng.jpg', N'B??t vi???t ch???t l?????ng cao, gi?? c??? m???c')
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (23, N'M??y t??nh cao c???p', N'defaul.png', N'M??y t??nh n?????c ngo??i ch???t l?????ng b???n b???, nhi???u t??nh n??ng')
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (24, N'G??m t???y ch???t l?????ng t???t', N'defaul.png', N'G??m t???y ch???t l?????ng t???t, gi?? c??? v???a ph???i')
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (33, N'D???ng c??? v??n ph??ng phong c??ch c??? trang', N'agenda.png', N'C??c s???n ph???m m?? ph???ng theo phong c??ch c??? x??a')
GO
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (44, N'B??t vi???t lo???i 3', N'defaul.png', N'')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (1, N'B??nh Ch??nh', N'Huy???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (2, N'B??nh T??n', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (3, N'B??nh Th???nh', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (4, N'C???n Gi???', N'Huy???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (5, N'C??? Chi', N'Huy???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (6, N'G?? V???p', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (7, N'H??c M??n', N'Huy???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (8, N'Nh?? B??', N'Huy???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (9, N'Ph?? Nhu???n', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (10, N'Qu???n 1', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (11, N'Qu???n 10', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (12, N'Qu???n 11', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (13, N'Qu???n 12', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (14, N'Qu???n 2', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (15, N'Qu???n 3', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (16, N'Qu???n 4', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (17, N'Qu???n 5', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (18, N'Qu???n 6', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (19, N'Qu???n 7', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (20, N'Qu???n 8', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (21, N'Qu???n 9', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (22, N'T??n B??nh', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (23, N'T??n Ph??', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (24, N'Th??? ?????c', N'Qu???n', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (25, N'Ba ????nh', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (26, N'Ba V??', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (27, N'B???c T??? Li??m', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (28, N'C???u Gi???y', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (29, N'Ch????ng M???', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (30, N'??an Ph?????ng', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (31, N'????ng Anh', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (32, N'?????ng ??a', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (33, N'Gia L??m', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (34, N'H?? ????ng', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (35, N'Hai B?? Tr??ng', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (36, N'Ho??i ?????c', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (37, N'Ho??n Ki???m', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (38, N'Ho??ng Mai', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (39, N'Long Bi??n', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (40, N'M?? Linh', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (41, N'M??? ?????c', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (42, N'Nam T??? Li??m', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (43, N'Ph?? Xuy??n', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (44, N'Ph??c Th???', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (45, N'Qu???c Oai', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (46, N'S??c S??n', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (47, N'S??n T??y', N'Th??? x??', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (48, N'T??y H???', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (49, N'Th???ch Th???t', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (50, N'Thanh Oai', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (51, N'Thanh Tr??', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (52, N'Thanh Xu??n', N'Qu???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (53, N'Th?????ng T??n', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (54, N'???ng H??a', N'Huy???n', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (55, N'C???m L???', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (56, N'H???i Ch??u', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (57, N'H??a Vang', N'Huy???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (58, N'Ho??ng Sa', N'Huy???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (59, N'Li??n Chi???u', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (60, N'Ng?? H??nh S??n', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (61, N'S??n Tr??', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (62, N'Thanh Kh??', N'Qu???n', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (63, N'B??u B??ng', N'Huy???n', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (64, N'B???n C??t', N'Th??? x??', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (65, N'D???u Ti???ng', N'Huy???n', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (66, N'D?? An', N'Th??? x??', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (67, N'Ph?? Gi??o', N'Huy???n', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (68, N'T??n Uy??n', N'Huy???n', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (69, N'Th??? D???u M???t', N'Th??? x??', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (70, N'Thu???n An', N'Huy???n', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (71, N'Bi??n H??a', N'Th??nh ph???', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (72, N'C???m M???', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (73, N'?????nh Qu??n', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (74, N'Long Kh??nh', N'Th??? x??', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (75, N'Long Th??nh', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (76, N'Nh??n Tr???ch', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (77, N'T??n Ph??', N'Qu???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (78, N'Th???ng Nh???t', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (79, N'Tr???ng Bom', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (80, N'V??nh C???u', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (81, N'Xu??n L???c', N'Huy???n', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (82, N'Cam L??m', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (83, N'Cam Ranh', N'Th??nh ph???', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (84, N'Di??n Kh??nh', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (85, N'Kh??nh S??n', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (86, N'Kh??nh V??nh', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (87, N'Nha Trang', N'Th??nh ph???', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (88, N'Ninh H??a', N'Th??? x??', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (89, N'Tr?????ng Sa', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (90, N'V???n Ninh', N'Huy???n', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (91, N'An D????ng', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (92, N'An L??o', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (93, N'B???ch Long V??', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (94, N'C??t H???i', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (95, N'????? S??n', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (96, N'D????ng Kinh', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (97, N'H???i An', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (98, N'H???ng B??ng', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (99, N'Ki???n An', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (100, N'Ki???n Th???y', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (101, N'L?? Ch??n', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (102, N'Ng?? Quy???n', N'Qu???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (103, N'Th???y Nguy??n', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (104, N'Ti??n L??ng', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (105, N'V??nh B???o', N'Huy???n', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (106, N'B???n L???c', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (107, N'C???n ???????c', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (108, N'C???n Giu???c', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (109, N'Ch??u Th??nh', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (110, N'?????c H??a', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (111, N'?????c Hu???', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (112, N'Ki???n T?????ng', N'Th??? x??', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (113, N'M???c H??a', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (114, N'T??n An', N'Th??nh ph???', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (115, N'T??n H??ng', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (116, N'T??n Th???nh', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (117, N'T??n Tr???', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (118, N'Th???nh H??a', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (119, N'Th??? Th???a', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (120, N'V??nh H??ng', N'Huy???n', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (121, N'B???c Tr?? My', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (122, N'?????i L???c', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (123, N'??i???n B??n', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (124, N'????ng Giang', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (125, N'Duy Xuy??n', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (126, N'Hi???p ?????c', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (127, N'H???i An', N'Th??nh ph???', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (128, N'Nam Giang', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (129, N'Nam Tr?? My', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (130, N'N??ng S??n', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (131, N'N??i Th??nh', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (132, N'Ph?? Ninh', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (133, N'Ph?????c S??n', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (134, N'Qu??? S??n', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (135, N'Tam K???', N'Th??nh ph???', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (136, N'T??y Giang', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (137, N'Th??ng B??nh', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (138, N'Ti??n Ph?????c', N'Huy???n', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (139, N'B?? R???a', N'Th??? x??', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (140, N'Ch??u ?????c', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (141, N'C??n ?????o', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (142, N'?????t ?????', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (143, N'Long ??i???n', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (144, N'T??n Th??nh', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (145, N'V??ng T??u', N'Th??nh ph???', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (146, N'Xuy??n M???c', N'Huy???n', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (147, N'Bu??n ????n', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (148, N'Bu??n H???', N'Th??? x??', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (149, N'Bu??n Ma Thu???t', N'Th??nh ph???', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (150, N'C?? Kuin', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (151, N'C?? M''gar', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (152, N'Ea H''Leo', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (153, N'Ea Kar', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (154, N'Ea S??p', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (155, N'Kr??ng Ana', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (156, N'Kr??ng B??ng', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (157, N'Kr??ng Buk', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (158, N'Kr??ng N??ng', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (159, N'Kr??ng P???c', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (160, N'L??k', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (161, N'M''??r??k', N'Huy???n', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (162, N' Th???i Lai', N'Huy???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (163, N'B??nh Th???y', N'Qu???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (164, N'C??i R??ng', N'Qu???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (165, N'C??? ?????', N'Huy???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (166, N'Ninh Ki???u', N'Qu???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (167, N'?? M??n', N'Qu???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (168, N'Phong ??i???n', N'Huy???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (169, N'Th???t N???t', N'Qu???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (170, N'V??nh Th???nh', N'Huy???n', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (171, N'B???c B??nh', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (172, N'?????o Ph?? Qu??', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (173, N'?????c Linh', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (174, N'H??m T??n', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (175, N'H??m Thu???n B???c', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (176, N'H??m Thu???n Nam', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (177, N'La Gi', N'Th??? x??', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (178, N'Phan Thi???t', N'Th??nh ph???', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (179, N'T??nh Linh', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (180, N'Tuy Phong', N'Huy???n', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (181, N'B???o L??m', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (182, N'B???o L???c', N'Th??nh ph???', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (183, N'C??t Ti??n', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (184, N'????? Huoai', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (185, N'???? L???t', N'Th??nh ph???', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (186, N'????? T???h', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (187, N'??am R??ng', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (188, N'Di Linh', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (189, N'????n D????ng', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (190, N'?????c Tr???ng', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (191, N'L???c D????ng', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (192, N'L??m H??', N'Huy???n', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (193, N'A L?????i', N'Huy???n', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (194, N'Hu???', N'Th??nh ph???', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (195, N'H????ng Th???y', N'Th??? x??', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (196, N'H????ng Tr??', N'Huy???n', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (197, N'Nam ????ng', N'Huy???n', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (198, N'Phong ??i???n', N'Huy???n', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (199, N'Ph?? L???c', N'Huy???n', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (200, N'Ph?? Vang', N'Huy???n', 15)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (12, 2, CAST(N'2021-10-03' AS Date), N'B??t kh?? cute *tym*', 5)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (12, 3, CAST(N'2021-10-20' AS Date), N'B??t t???m ???????c', 3)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (13, 5, CAST(N'2021-11-20' AS Date), N'B??t g?? m?? d???m qu?? :<', NULL)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (13, 7, CAST(N'2021-11-18' AS Date), N'Gi???y t???t', NULL)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (13, 8, CAST(N'2021-11-24' AS Date), N'Gi???y t???t, r???', NULL)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (30, 5, CAST(N'2021-11-24' AS Date), N'B??t r???t t???t, r???', NULL)
GO
SET IDENTITY_INSERT [dbo].[order] ON 
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (2, CAST(N'2021-10-02' AS Date), CAST(6400.00 AS Numeric(18, 2)), 4, 14)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (3, CAST(N'2021-10-02' AS Date), CAST(9000.00 AS Numeric(18, 2)), 4, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (4, CAST(N'2021-11-18' AS Date), CAST(727431.00 AS Numeric(18, 2)), 5, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (5, CAST(N'2021-11-18' AS Date), CAST(32920.00 AS Numeric(18, 2)), 3, 14)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (6, CAST(N'2021-11-18' AS Date), CAST(160920.00 AS Numeric(18, 2)), 3, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (11, CAST(N'2021-11-18' AS Date), CAST(228991.00 AS Numeric(18, 2)), 5, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (12, CAST(N'2021-11-20' AS Date), CAST(115421.00 AS Numeric(18, 2)), 5, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (13, CAST(N'2021-11-20' AS Date), CAST(126580.80 AS Numeric(18, 2)), 3, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (14, CAST(N'2021-11-20' AS Date), CAST(7092941.00 AS Numeric(18, 2)), 4, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (15, CAST(N'2021-11-21' AS Date), CAST(83391.00 AS Numeric(18, 2)), 3, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (16, CAST(N'2021-11-21' AS Date), CAST(138600.00 AS Numeric(18, 2)), 3, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (17, CAST(N'2021-11-21' AS Date), CAST(45000.00 AS Numeric(18, 2)), 3, 14)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (18, CAST(N'2021-11-21' AS Date), CAST(742500.00 AS Numeric(18, 2)), 5, 14)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (19, CAST(N'2021-11-21' AS Date), CAST(75500.00 AS Numeric(18, 2)), 5, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (20, CAST(N'2021-11-22' AS Date), CAST(392763.40 AS Numeric(18, 2)), 3, 14)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (21, CAST(N'2021-11-22' AS Date), CAST(4750.00 AS Numeric(18, 2)), 3, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (22, CAST(N'2021-11-23' AS Date), CAST(221991.00 AS Numeric(18, 2)), 3, 27)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (23, CAST(N'2021-11-23' AS Date), CAST(81000.00 AS Numeric(18, 2)), 3, 27)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (24, CAST(N'2021-11-23' AS Date), CAST(7000.00 AS Numeric(18, 2)), 4, 30)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (25, CAST(N'2021-11-23' AS Date), CAST(1251000.00 AS Numeric(18, 2)), 1, 34)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (26, CAST(N'2021-11-24' AS Date), CAST(24900.00 AS Numeric(18, 2)), 2, 13)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (27, CAST(N'2021-12-08' AS Date), CAST(286200.00 AS Numeric(18, 2)), 1, 34)
GO
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (28, CAST(N'2021-12-11' AS Date), CAST(284482.00 AS Numeric(18, 2)), 1, 37)
GO
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (2, 28, 1, CAST(6400.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (3, 17, 2, CAST(9000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (4, 7, 1, CAST(83391.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (4, 19, 2, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (4, 30, 2, CAST(317520.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (5, 2, 1, CAST(8300.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (5, 4, 1, CAST(10620.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (5, 5, 2, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (6, 12, 2, CAST(78210.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (6, 19, 1, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (11, 5, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (11, 7, 1, CAST(83391.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (11, 9, 1, CAST(138600.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (12, 4, 4, CAST(10620.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (12, 8, 1, CAST(72941.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (13, 6, 1, CAST(40500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (13, 34, 1, CAST(86080.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (14, 8, 1, CAST(72941.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (14, 23, 10, CAST(702000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (15, 7, 2, CAST(83391.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (16, 9, 1, CAST(138600.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (17, 14, 1, CAST(45000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (18, 6, 1, CAST(40500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (18, 23, 1, CAST(702000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (19, 5, 5, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (19, 6, 1, CAST(40500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (20, 35, 1, CAST(220763.40 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (20, 36, 2, CAST(86000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (21, 37, 5, CAST(950.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (22, 7, 1, CAST(83391.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (22, 9, 1, CAST(138600.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (23, 6, 2, CAST(40500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (24, 5, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (25, 26, 1, CAST(863000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (25, 28, 1, CAST(6400.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (25, 32, 1, CAST(381600.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (26, 2, 3, CAST(8300.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (27, 9, 2, CAST(138600.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (27, 17, 1, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (27, 19, 1, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (28, 8, 2, CAST(72941.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (28, 9, 1, CAST(138600.00 AS Numeric(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (1, N'Ch??? x??? l??')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (2, N'Y??u c???u h???y')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (3, N'??ang giao')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (4, N'???? giao')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (5, N'???? h???y')
GO
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 
GO
INSERT [dbo].[permission] ([permission_id], [name]) VALUES (1, N'Kh??ch h??ng')
GO
INSERT [dbo].[permission] ([permission_id], [name]) VALUES (2, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[poster] ON 
GO
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1, N'poster10.jpg', 1, 1)
GO
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (2, N'poster11.jpg', 1, 1)
GO
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (3, N'poster15.jpg', 1, 1)
GO
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (4, N'poster14.jpg', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[poster] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (2, N'B??t gel 2 vi??n bi Thi??n Long Flexoffice FO-GEL18/VN - M???c n?????c, ?????m, t????i', N'N??t vi???t tr??n, ??m, m???c ra ?????u v?? li??n t???c.

Kh??ng ?????c h???i, ti???n d???ng khi s??? d???ng.
 M???c h??? n?????c, h??? m??u dye.', N'fo-gel18_vn_tim_71669d93f8d04bf498bbf73b7ab162e5_1024x1024.jpg                                                                                                                                                                                                                                              ', CAST(8300.00 AS Numeric(18, 2)), N'1 b??t/ ki???n.', N'c??y', 0, 1, 30, 1, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (3, N'B??t bi Thi??n Long Flexoffice FO-039 PLUS/VN 4MC - M???c ?????t ti??u chu???n ch??u ??u', N'????? n??i tho??ng m??t, tr??nh ngu???n nhi???t. Kh??ng th??ch h???p cho tr??? d?????i 3 tu???i.', N'fo-039_plus_vn_4mc_4_ae40e120115b48d4ae2a85e09a47d53a_1024x1024.jpg                                                                                                                                                                                                                                         ', CAST(4600.00 AS Numeric(18, 2)), N'1 b??t/ ki???n.', N'c??y', 0, 0, 30, 1, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (4, N'B??t gel x??a ???????c Thi??n Long ??i???m 10 TP-GELE002', N'D???ng b??t c?? n???p ?????y. B??t d???ng m???c n?????c, vi???t tr??n ??m, m???c ra ?????u, li??n t???c. M???c ch???t l?????ng cao kh??ng ?????c h???i v???i ng?????i s??? d???ng. B??t c?? 2 g??m/t???y tr??n c??n v?? n???p b??t thu???n ti???n s??? d???ng khi x??a m???c.', N'220536693_2758032537653829_5778804089958025826_n_1__ac9f66a0e2ec4ff0a57d832ca9e12ff5_1024x1024.jpg                                                                                                                                                                                                          ', CAST(11800.00 AS Numeric(18, 2)), N'5 c??y / 1 ki???n', N'c??y', 10, 1, 40, 1, 17, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (5, N'B??t Gel Thi??n Long GEL-012 ????? (FS)', N'B??t c?? thi???t k??? ????n gi???n nh??ng khoa h???c, th??n tr??n, nh??? r???t ph?? h???p v???i tay c???m c???a h???c sinh ti???u h???c. Th??n v?? n???p b??t b???ng nh???a tr???ng ?????c, in nh?? kim lo???i. M???c m??u ?????m v?? t????i s??ng, vi???t ??m tr??n, ra ?????u v?? li??n t???c.', N'but_gel_thien_long_gel-012__14__grande.jpg                                                                                                                                                                                                                                                                  ', CAST(7000.00 AS Numeric(18, 2)), N'1 b??t/ ki???n.', N'c??y', 0, 3, 35, 1, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (6, N'B??t Gel Papermate OS UPC Ink Joy 0.5 mm', NULL, N'ppmate_os_upc_0.5_2_5b8dbcaf15eb47dba2b5b6596fc146cd_1024x1024.jpg                                                                                                                                                                                                                                          ', CAST(45000.00 AS Numeric(18, 2)), N'5 c??y / h???p', N'h???p', 10, 3, 40, 1, 8, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (7, N'Ream gi???y A4 80 gsm IK Copy (500 t???) - H??ng nh???p kh???u Indonesia', N'Gi???y ?????u m??u. Kh??ng g???n s??ng, kh??ng x?? x?????c v?? kh??ng t??ch l???p. Gi???y l??ng, kh??ng b??? ?????m kh??c m??u hay t???p ch???t x?? c???ng. Ch??? in kh??ng b??? nh??e, kh??ng lem k??? c??? in 2 m???t gi???y.', N'ik_copy_a480_ton_kho2_dac0ed5096a9416fa0b5fb1cfb6b00ad_1024x1024.jpg                                                                                                                                                                                                                                        ', CAST(87780.00 AS Numeric(18, 2)), N'	500 t??? / ream', N'ream', 5, 3, 50, 2, 4, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (8, N'Ream gi???y A4 70 gsm IK Copy (500 t???) - H??ng nh???p kh???u Indonesia', N'Gi???y ?????u m??u. Kh??ng g???n s??ng, kh??ng x?? x?????c v?? kh??ng t??ch l???p. Gi???y l??ng, kh??ng b??? ?????m kh??c m??u hay t???p ch???t x?? c???ng. Ch??? in kh??ng b??? nh??e, kh??ng lem k??? c??? in 2 m???t gi???y.', N'ik_copy_a470_ton_kho2_5772a8166e324ee8b8eb76723a68e169_1024x1024.jpg                                                                                                                                                                                                                                        ', CAST(76780.00 AS Numeric(18, 2)), N'	500 t??? / ream', N'ream', 5, 1, 50, 2, 4, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (9, N'Gi???y d??n nh??n Tomy A4 ????? s???', N'D??ng in tem, nh??n s???n ph???m b???ng m??y laser th??ng th?????ng. C?? nhi???u k??ch c??? kh??c nhau, ph?? h???p m???i nhu c???u s??? d???ng. Ch???t gi???y ?????p, m???n, l??ng.', N'giay_dan_nhan_tomy_a4_du_so_9635a65db4fd4e8e99b0b2ce25838e1d_1024x1024.jpg                                                                                                                                                                                                                                  ', CAST(154000.00 AS Numeric(18, 2)), N'	100 t???/ h???p/ ki???n', N'ki???n', 10, 2, 40, 2, 18, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (11, N'Gi???y d??n nh??n Tomy A5 ????? s???', N'D??ng in tem, nh??n s???n ph???m b???ng m??y laser th??ng th?????ng. C?? nhi???u k??ch c??? kh??c nhau, ph?? h???p m???i nhu c???u s??? d???ng. Ch???t gi???y ?????p, m???n, l??ng.', N'giay_dan_nhan_tomy_a5_du_so_2_eee2b9a4d2024fa0970cf14b5177e781_1024x1024.jpg                                                                                                                                                                                                                                ', CAST(10000.00 AS Numeric(18, 2)), N'10 t???/ x???p/ ki???n', N'ki???n', 10, 0, 60, 2, 18, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (12, N'Gi???y photo A4 70 Thi??n Long PP-001', N'Gi???y in v??n ph??ng ch???t l?????ng cao , b??? m???t nh???n tuy???t v???i , mau kh?? m???c , th??ch h???p cho c??c lo???i m??y in phun , m??y in laser , m??y fax laser , m??y photocopy??? Gi???y kh??ng b??? b???i gi??p k??o d??i tu???i th??? c??c thi???t b??? in , photocopy . Gi???y in Thi??n Long ???????c s???n xu???t v?? ????ng g??i theo ti??u chu???n, d??y chuy???n thi???t b??? hi???n ?????i, chuy??n dung trong c??c v??n ph??ng, c??ng ty , tr?????ng h???c. V???i kh??? n??ng ????p ???ng in ???n , photocopy t???t. Th??ng gi???y ???????c l??m t??? ch???t li???u t???t , ti???n l???i cho vi???c v???n chuy???n v?? t??i s??? d???ng v??o vi???c l??u tr??? t??i li???u v??n ph??ng.', N'mo_ta_giay_fa-13_675bf3a33cfd486099a82e383d103d67_grande.jpg                                                                                                                                                                                                                                                ', CAST(86900.00 AS Numeric(18, 2)), N'500 t??? / ream', N'ream', 10, 2, 30, 2, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (13, N'Gi???y b??a m??u A4/180 BC-C01', N'B??a gi???y m??u tr??n, kh??ng hoa v??n, kh??ng m??i, d??ng ????ng b??a h??? s??, t??i li???u theo kh??? A4 v???i nhi???u m??u l???a ch???n. M??u s???c trung th???c v?? s???ng ?????ng. C??ng ngh??? m???i l??m gi???y tr??ng m???ng nh??ng th???c t??? gi???y ???? ???????c n??n ch???t h??n, l??m b??? m???t c???a gi???y nh???n, ?????u h??n. Ch???t l?????ng: ?????p, tr???ng, m???n, l??ng.', N'giay_bia_mau_a4-180_bc-c01__4__grande.jpg                                                                                                                                                                                                                                                                   ', CAST(43000.00 AS Numeric(18, 2)), N'100 t???/x???p', N'x???p', 0, 0, 50, 2, 10, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (14, N'Gi???y note Xukiva177 N-X02', N'Gi??p c??c b???n qu???n l?? t??? ch???c k??? ho???ch trong th???i gian d??i h???n. Ti???n l???i cho vi???c mang theo m???i l??c m???i n??i. Ngay c??? trong nh???ng l??c b???n r???n nh???t b???n c??ng c?? th??? ghi ch?? 1 c??ch d??? d??ng. G???m nhi???u t??? trong 1 x???p. Ch???t l?????ng : ?????p, m???n, l??ng. ', N'abl_4183_grande.jpg                                                                                                                                                                                                                                                                                         ', CAST(45000.00 AS Numeric(18, 2)), N'12 x???p/l???c', N'l???c', 0, 1, 40, 2, 7, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (16, N'Gi???y than G-Star 21x33 CP-G01 XANH', N'Gi???y c???m nhi???t, m???t kh??ng nhi???t ???????c qu???n b??n trong, m???t nhi???t ???????c qu???n ra ngo??i. ???????ng k??nh trong l??i 27 mm, g??i gi???y b???c c??ch nhi???t, d??n tem hai ?????u, c?? m??ng co.', N'abl_5400_grande.jpg                                                                                                                                                                                                                                                                                         ', CAST(73000.00 AS Numeric(18, 2)), N'100 t???/h???p', N'h???p', 0, 0, 40, 2, 5, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (17, N'K???p gi???y Flexoffice FO-PAC01', N'K???p gi???y Thi??n Long FO-PAC01 (25mm) c?? ?????u tam gi??c, ?????u tr??n. S???n xu???t t??? kim lo???i c?? ch???t l?????ng cao, ???????c ph??? l???p niken ch???ng g???. C?? th??? gi??? ???????c 10 t??? gi???y A4', N'617__1__grande.jpg                                                                                                                                                                                                                                                                                          ', CAST(5000.00 AS Numeric(18, 2)), N'	10 h???p/h???p l???n', N'chi???c', 10, 2, 40, 3, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (18, N'Kim b???m s??? 3 Flexoffice FO-STS01', N'Kim b???m gi???y l?? s???n ph???m ???????c l??m t??? th??p cao c???p, gi??p li??n k???t c??c t??i li???u v??n b???n l???i v???i nhau. Kim b???m c?? ????? c???ng cao, s??ng b??ng v?? kh??ng b??? g??? s??t theo th???i gian. D??? d??ng s??? d???ng v?? th??n thi??n v???i ng?????i d??ng', N'651__5__grande.jpg                                                                                                                                                                                                                                                                                          ', CAST(5000.00 AS Numeric(18, 2)), N'20 h???p/h???p l???n', N'h???p', 0, 0, 30, 3, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (19, N'B??a n??t trong su???t nhi???u m??u F4 Thi??n Long Flexoffice FO-CBF08', N'B??a b???ng nh???a PP ch???u l???c cao. ???????ng h??n ch???c ch???n, n??t b???n h??n.', N'fo-cbf08_xk3_97ef69dd7dc84a91be7151a4a3991f5e_1024x1024.jpg                                                                                                                                                                                                                                                 ', CAST(5000.00 AS Numeric(18, 2)), N'1 b??a / ki???n', N'c??i', 10, 1, 30, 4, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (21, N'B??a ?????ng h??? s?? 60 l?? s???c ch???a 300 t??? A4 80 gsm Thi??n Long Flexoffice FO-DB009', N'????? l??u tr??? v?? b???o qu???n c??c lo???i h??? s??, t??i li???u, tranh ???nh... B??a 60 l?? th??ch h???p cho gia ????nh, v??n ph??ng: l??u tr??? c??c lo???i gi???y t??? nh?? ?????t, gi???y b???o hi???m, h??a ????n, gi???y b???o h??nh??? S???n ph???m ???????c s???n xu???t t??? nh???a PP ch???t l?????ng cao, an to??n v???i ng?????i s??? d???ng, s???n ph???m c?? th??? ???????c t??i ch??? ho??n to??n. B??? m???t tr??n l??ng, h???n ch??? tr???y x?????c v?? b??m b???n. C??c l?? ???????c h??n tr??n c??ng ngh??? h??n si??u ??m, c?? kh??? n??ng ch???u ???ng su???t k??o cao.', N'fo-db009_2_af0b93f66f03446f98c05ef449beb913_1024x1024.jpg                                                                                                                                                                                                                                                   ', CAST(7000.00 AS Numeric(18, 2)), N'b??t/ki???n', N'c??i', 10, 0, 30, 4, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (23, N'M??y t??nh Casio FX-570ES Plus', N'Kh??ng ph???i ng???u nhi??n m?? m??y t??nh CASIO FX 570ES PLUS ???????c r???t nhi???u h???c sinh, sinh vi??n ??a th??ch ?????n v???y. M??y s??? h???u ki???u d??ng hi???n ?????i, m??u s???c trang nh?? tinh t??? c??ng v???i danh s??ch c??c t??nh n??ng h???u ??ch, h??? tr??? t???i ??a trong qu?? tr??nh h???c t???p c??ng nh?? l??m vi???c. Chi???c m??y CASIO FX 570 ES PLUS l?? s???n ph???m ph?? h???p v???i c??c b???n h???c sinh trung h???c.', N'casio.png                                                                                                                                                                                                                                                                                                   ', CAST(702000.00 AS Numeric(18, 2)), NULL, N'chi???c', 0, 10, 30, 8, 19, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (25, N'M??Y T??NH VINACAL 570ES PLUS - H???NG', NULL, N'vinacal-570ex-plus-hong.jpg                                                                                                                                                                                                                                                                                 ', CAST(1008000.00 AS Numeric(18, 2)), NULL, N'chi???c', 3, 0, 30, 8, 20, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (26, N'M??y t??nh VINACAL 570 ES PLUS II - Xanh', N' Ph??m b???m c???a m??y t??nh khoa h???c Vinacal 570ES Plus II r???t nh???y. T??nh n??ng v?????t tr???i h??n, ti???n l???i h??n, m??u s???c th???i trang. Ki???u d??ng ho??n to??n m???i, g??c c???nh, hi???n ?????i.', N'63_60029_vinacal-570es-plus-ii-xanh-duo.jpg                                                                                                                                                                                                                                                                 ', CAST(863000.00 AS Numeric(18, 2)), NULL, N'chi???c', 0, 0, 30, 8, 20, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (27, N'K??o l???n 25cm - K20', N' L?????i k??o ???????c l??m b???ng kim lo???i cao c???p, s???c b??n, cho ???????ng c???t d???t kho??t v?? ?????p m???t. Tay c???m k??o ???????c b???c nh???a ??m ??i, tr??nh l??m ??au tay khi thao t??c nhi???u.', N'20210220153305-4.jpg                                                                                                                                                                                                                                                                                        ', CAST(34200.00 AS Numeric(18, 2)), NULL, N'c??y', 0, 0, 30, 6, 17, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (28, N'G??m Pentel Nh??? 03 - Lo???i 1', N'G??m Pentel H.03. ?????c ??i???m: G??m/t???y s??? d???ng cho vi???c b??i x??a tr??n gi???y v?? m??ng film. G??m/t???y ???????c b???c gi???y b???o v??? b??n ngo??i n??n h???n ch??? d?? khi s??? d???ng ch??a h???t.
', N'unnamed.jpg                                                                                                                                                                                                                                                                                                 ', CAST(6400.00 AS Numeric(18, 2)), NULL, N'c???c', 0, 1, 30, 3, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (30, N'Chu???t m??y t??nh kh??ng d??y Logitech B175', N'Mang phong c??ch n??ng ?????ng, th??? thao v???i nh???ng ???????ng bo tr??n m???m m???i. B??? m???t ????? cong v???a ph???i ??m s??t l??ng b??n tay ????? ng?????i d??ng c?? th??? thao t??c tho???i m??i trong th???i gian d??i.
Gi??p b???n l?????t chu???t nhanh v?? nh??? nh??ng h??n. ?????ng th???i, bi l??n v?? n??t b???m nh???y cho c??c thao t??c nh?? r??, k??o c?? ???????c ????? ch??nh x??c cao.', N'unnamed (1).jpg                                                                                                                                                                                                                                                                                             ', CAST(352800.00 AS Numeric(18, 2)), NULL, N'c??i', 10, 0, 50, 14, 21, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (32, N'????? T???n Nhi???t 4 Qu???t', N'????? T???n Nhi???t 4 Qu???t', N'32036chu???t-????? T???n Nhi???t 4 Qu???t 265000.jpg                                                                                                                                                                                                                                                                   ', CAST(381600.00 AS Numeric(18, 2)), NULL, N'mi???ng', 0, 0, 20, 14, 21, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (34, N'Ch???i v??? sinh b??n ph??m', N'Ch???i qu??t m??y t??nh', N'choi-quet-may-tinh.jpg                                                                                                                                                                                                                                                                                      ', CAST(96720.00 AS Numeric(18, 2)), NULL, N'c??y', 11, 1, 40, 3, 9, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (35, N'H???p b??t v???i c?? kh??a m???t m?? 20x6x8cm', N'H???p b??t v???i c?? kh??a m???t m?? 20x6x8cm', N'hopbuttim.png', CAST(265980.00 AS Numeric(18, 2)), NULL, N'h???p', 17, 1, 30, 5, 17, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (36, N'T??i ?????ng b??t v???i ????nh huy hi???u Maimaibaby', N'D???ng ??? ????y m???t ch??t r??i m??nh ng???m T??I B??T!!! Ui ch??i t??i b??t xinh nung ninh nh?? n??y h??ng ch??? l?? ng???m thui ????u m?? c??n ph???i h???t l??? lun nh??! ??i h???c hay ??i l??m ??em t??i b??t l?? ti???n nh???t r??i. ?????ng ????? d??ng h???c t???p hay ????? m??? ph???m be b?? xinh xinh v???a nh?? in lun ???!', N'5_800x800.jpg                                                                                                                                                                                                                                                                                               ', CAST(86000.00 AS Numeric(18, 2)), NULL, N't??i', 0, 12, 50, 5, 17, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (37, N'test 1', N'B??t test', N'default.png', CAST(1000.00 AS Numeric(18, 2)), N'b??t/ki???n', N'c??i', 5, 5, 15, 1, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [brand_id], [status]) VALUES (38, N'B??t m??u', N'B??t m??u ch???t l?????ng cao', N'2111241445200000282-hop-but-mau.jpg', CAST(7000.00 AS Numeric(18, 2)), N'b??t/ki???n', N'h???p', 0, 0, 30, 3, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (1, N'H??? Ch?? Minh', N'SG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (2, N'Ha?? N????i', N'HN')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (3, N'???? N???ng', N'DDN')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (4, N'B??nh D????ng', N'BD')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (5, N'?????ng Nai', N'DNA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (6, N'Kh??nh H??a', N'KH')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (7, N'H???i Ph??ng', N'HP')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (8, N'Long An', N'LA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (9, N'Qu???ng Nam', N'QNA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (10, N'B?? R???a V??ng T??u', N'VT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (11, N'?????k L???k', N'DDL')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (12, N'C???n Th??', N'CT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (13, N'B??nh Thu???n  ', N'BTH')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (14, N'L??m ?????ng', N'LDD')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (15, N'Th???a Thi??n Hu???', N'TTH')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (16, N'Ki??n Giang', N'KG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (17, N'B???c Ninh', N'BN')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (18, N'Qu???ng Ninh', N'QNI')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (19, N'Thanh H??a', N'TH')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (20, N'Ngh??? An', N'NA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (21, N'H???i D????ng', N'HD')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (22, N'Gia Lai', N'GL')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (23, N'B??nh Ph?????c', N'BP')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (24, N'H??ng Y??n', N'HY')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (25, N'B??nh ?????nh', N'BDD')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (26, N'Ti???n Giang', N'TG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (27, N'Th??i B??nh', N'TB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (28, N'B???c Giang', N'BG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (29, N'H??a B??nh', N'HB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (30, N'An Giang', N'AG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (31, N'V??nh Ph??c', N'VP')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (32, N'T??y Ninh', N'TNI')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (33, N'Th??i Nguy??n', N'TN')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (34, N'L??o Cai', N'LCA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (35, N'Nam ?????nh', N'NDD')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (36, N'Qu???ng Ng??i', N'QNG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (37, N'B???n Tre', N'BTR')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (38, N'?????k N??ng', N'DNO')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (39, N'C?? Mau', N'CM')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (40, N'V??nh Long', N'VL')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (41, N'Ninh B??nh', N'NB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (42, N'Ph?? Th???', N'PT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (43, N'Ninh Thu???n', N'NT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (44, N'Ph?? Y??n', N'PY')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (45, N'H?? Nam', N'HNA')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (46, N'H?? T??nh', N'HT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (47, N'?????ng Th??p', N'DDT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (48, N'S??c Tr??ng', N'ST')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (49, N'Kon Tum', N'KT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (50, N'Qu???ng B??nh', N'QB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (51, N'Qu???ng Tr???', N'QT')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (52, N'Tr?? Vinh', N'TV')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (53, N'H???u Giang', N'HGI')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (54, N'S??n La', N'SL')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (55, N'B???c Li??u', N'BL')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (56, N'Y??n B??i', N'YB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (57, N'Tuy??n Quang', N'TQ')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (58, N'??i???n Bi??n', N'DDB')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (59, N'Lai Ch??u', N'LCH')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (60, N'L???ng S??n', N'LS')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (61, N'H?? Giang', N'HG')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (62, N'B???c K???n', N'BK')
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (63, N'Cao B???ng', N'CB')
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (11, N'reintrinh1306', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Trinh', N'Nguy???n Ng???c Ph????ng', N'resources/images/users/211211185414avatar.jpg', 1, N'reintrinh1306@gmail.com', N'0396311734', CAST(N'2021-10-02' AS Date), 2, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (12, N'hathimo', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'M??', N'H??', N'resources/images/users/userDefaul.png', 2, N'hathimo@gmail.com', N'0123456789', CAST(N'2021-10-02' AS Date), 2, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (13, N'nhunguyen', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Nh??', N'Nguy???n Ng???c L??m', N'resources/images/users/211211190051avatar.jpg', 3, N'nhunguyen123@gmail.com', N'1234567890', CAST(N'2021-11-16' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (14, N'trinhnguyen1306', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Trinh', N'Nguy???n', N'resources/images/users/star.png', 4, N'otakuvocaloid70@gmail.com', N'0123456789', CAST(N'2021-11-20' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (19, N'admin', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Admin', N'Nguy???n', N'resources/images/users/userDefaul.png', 9, N'otakuvocaloid79@gmail.com', N'0000000000', CAST(N'2021-10-28' AS Date), 2, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (20, N'abc', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Harry', N'Potter', N'resources/images/users/userDefaul.png', 10, N'abc@gmail.com', N'1234567890', CAST(N'2021-11-16' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (21, N'test', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'test', N'test', N'resources/images/users/userDefaul.png', 5, N'test@gmail.com', N'0', CAST(N'2021-11-16' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (22, N'phuongtrinh', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Naruto', N'Uzumaki', N'resources/images/users/userDefaul.png', 13, N'naruto@gmail.com', N'0000000001', CAST(N'2021-11-22' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (24, N'rein', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Sasuke', N'Uchiha', N'resources/images/users/userDefaul.png', 11, N'sasuke@gmail.com', N'1234567890', CAST(N'2021-11-22' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (25, N'rein1306', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Rein', N'Nguy???n', N'resources/images/users/userDefaul.png', 12, N'otakuvocaloid@gmail.com', N'0123456700', CAST(N'2021-11-22' AS Date), 1, 0)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (26, N'boruto', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Boruto', N'Uzumaki', N'resources/images/users/userDefaul.png', 14, N'boruto@gmail.com', N'0000000005', CAST(N'2021-11-22' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (27, N'hinata', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Hinata', N'Hyuga', N'resources/images/users/userDefaul.png', 15, N'hinata@gmail.com', N'0000000008', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (28, N'sophiduong', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'D????ng', N'S??? Phi', N'resources/images/users/userDefaul.png', 16, N'sophiduong@gmail.com', N'0000000009', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (29, N'thuanh', N'$2a$12$7nYAZyfQBi1UuFGHKnS0I.ddu4QBVhtgXWt4iLaPFs1xUPq92eddS', N'???nh', N'Qu??n Th??', N'resources/images/users/userDefaul.png', 17, N'reintrinh1306@gmail.com', N'0000000007', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (30, N'quanngao', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Ng???o', N'Tri???n Qu???n', N'resources/images/users/userDefaul.png', 20, N'trienquanngao@gmail.com', N'0001230000', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (31, N'thachdau', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'?????u', N'Th???ch', N'resources/images/users/userDefaul.png', 18, N'thachdau@gmail.com', N'0034000000', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (32, N'solan', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'L??n', N'S???', N'resources/images/users/userDefaul.png', 19, N'solan@gmail.com', N'0000000023', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (33, N'lamthucnhan', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Nh??n', N'L??m Th???c', N'resources/images/users/userDefaul.png', 21, N'lamthucnhan@gmail.com', N'0000000057', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (34, N'namcungkiet', N'$2a$12$JX9hZOnV22MD3uZywWRE/.DP.zonmOVqTmLmrN9b0YQBwumGKziwK', N'Ki???t', N'Nam Cung', N'resources/images/users/userDefaul.png', 22, N'akiet@gmail.com', N'0123456722', CAST(N'2021-11-23' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (35, N'abc1', N'$2a$12$TyE8thl0q70c9RmyGizPR.tgvmbcPWRLmPWuitOX88s3aLLHn3PPW', N'Abc', N'Nguy???n', N'resources/images/users/userDefaul.png', 23, N'reintrinh2408@gmail.com', N'0123456000', CAST(N'2021-12-11' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (37, N'yayoi1306', NULL, NULL, NULL, N'https://lh3.googleusercontent.com/a-/AOh14Gi0lzlzcMvDnGT0Xmt6PHSEHJqeLs4fWcLVp8dm=s96-c', 25, N'yayoi1306@gmail.com', NULL, CAST(N'2021-12-11' AS Date), 1, 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (38, N'yayoi', N'$2a$12$TyE8thl0q70c9RmyGizPR.tgvmbcPWRLmPWuitOX88s3aLLHn3PPW', N'Yayoi', N'Nguy???n', N'resources/images/users/userDefaul.png', 26, N'yayoi@gmail.com', N'0123456000', CAST(N'2021-12-11' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (1, N'An Ph?? T??y', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (2, N'B??nh Ch??nh', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (3, N'B??nh H??ng', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (4, N'B??nh L???i', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (5, N'??a Ph?????c', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (6, N'H??ng Long', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (7, N'L?? Minh Xu??n', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (8, N'Ph???m V??n Hai', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (9, N'Phong Ph??', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (10, N'Quy ?????c', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (11, N'T??n Ki??n', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (12, N'T??n Nh???t', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (13, N'T??n Qu?? T??y', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (14, N'T??n T??c', N'Th??? tr???n', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (15, N'V??nh L???c A', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (16, N'V??nh L???c B', N'X??', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (17, N'An L???c', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (18, N'An L???c A', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (19, N'B??nh H??ng H??a', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (20, N'B??nh H??ng H??a A', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (21, N'B??nh H??ng H??a B', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (22, N'B??nh Tr??? ????ng', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (23, N'B??nh Tr??? ????ng A', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (24, N'B??nh Tr??? ????ng B', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (25, N'T??n T???o', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (26, N'T??n T???o A', N'Ph?????ng', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (27, N'1', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (28, N'11', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (29, N'12', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (30, N'13', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (31, N'14', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (32, N'15', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (33, N'17', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (34, N'19', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (35, N'2', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (36, N'21', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (37, N'22', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (38, N'24', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (39, N'25', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (40, N'26', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (41, N'27', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (42, N'28', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (43, N'3', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (44, N'5', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (45, N'6', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (46, N'7', N'Ph?????ng', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (47, N'An Th???i ????ng', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (48, N'B??nh Kh??nh', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (49, N'C???n Th???nh ', N'Ph?????ng', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (50, N'Long H??a', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (51, N'L?? Nh??n', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (52, N'Tam Th??n Hi???p', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (53, N'Th???nh An', N'X??', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (54, N'An Nh??n T??y', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (55, N'An Ph??', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (56, N'An Ph?? Trung', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (57, N'B??nh M???', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (58, N'C??? Chi', N'Th??? tr???n', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (59, N'H??a Ph??', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (60, N'Nhu???n ?????c', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (61, N'Ph???m V??n C???i', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (62, N'Ph?? H??a ????ng', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (63, N'Ph?? M??? H??ng', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (64, N'Ph?????c Hi???p', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (65, N'Ph?????c Th???nh', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (66, N'Ph?????c V??nh An', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (67, N'T??n An H???i', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (68, N'T??n Ph?? Trung', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (69, N'T??n Th???nh ????ng', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (70, N'T??n Th???nh T??y', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (71, N'T??n Th??ng H???i', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (72, N'Th??i M???', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (73, N'Trung An', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (74, N'Trung L???p H???', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (75, N'Trung L???p H???', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (76, N'Trung L???p Th?????ng', N'X??', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (77, N'1', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (78, N'10', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (79, N'11', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (80, N'12', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (81, N'13', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (82, N'14', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (83, N'15', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (84, N'16', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (85, N'17', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (86, N'3', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (87, N'4', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (88, N'5', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (89, N'6', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (90, N'7', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (91, N'8', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (92, N'9', N'Ph?????ng', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (93, N' ????ng Th???nh', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (94, N' H??c M??n', N'Ph?????ng', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (95, N'B?? ??i???m', N'Ph?????ng', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (96, N'Nh??? B??nh', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (97, N'T??n Hi???p', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (98, N'T??n Th???i Nh??', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (99, N'T??n Xu??n', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (100, N'Th???i Tam Th??n', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (101, N'Trung Ch??nh', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (102, N'Xu??n Th???i ????ng', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (103, N'Xu??n Th???i S??n', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (104, N'Xu??n Th???i Th?????ng', N'X??', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (105, N'Hi???p Ph?????c', N'Ph?????ng', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (106, N'Long Th???i', N'X??', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (107, N'Nh?? B??', N'Th??? tr???n', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (108, N'Nh??n ?????c', N'X??', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (109, N'Ph?? Xu??n', N'X??', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (110, N'Ph?????c Ki???n', N'X??', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (111, N'Ph?????c L???c', N'X??', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (112, N'1', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (113, N'10', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (114, N'11', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (115, N'12', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (116, N'13', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (117, N'14', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (118, N'15', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (119, N'17', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (120, N'2', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (121, N'25', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (122, N'3', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (123, N'4', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (124, N'5', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (125, N'6', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (126, N'7', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (127, N'8', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (128, N'9', N'Ph?????ng', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (129, N'B???n Ngh??', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (130, N'B???n Th??nh', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (131, N'C???u Kho', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (132, N'C???u ??ng L??nh', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (133, N'C?? Giang', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (134, N'??a Kao', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (135, N'Nguy???n C?? Trinh', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (136, N'Nguy???n Th??i B??nh', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (137, N'Ph???m Ng?? L??o', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (138, N'T??n ?????nh', N'Ph?????ng', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (139, N'1', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (140, N'10', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (141, N'11', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (142, N'12', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (143, N'13', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (144, N'14', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (145, N'15', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (146, N'2', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (147, N'3', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (148, N'4', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (149, N'5', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (150, N'6', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (151, N'7', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (152, N'8', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (153, N'9', N'Ph?????ng', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (154, N'1', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (155, N'10', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (156, N'11', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (157, N'12', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (158, N'13', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (159, N'14', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (160, N'15', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (161, N'16', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (162, N'2', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (163, N'3', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (164, N'4', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (165, N'5', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (166, N'6', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (167, N'7', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (168, N'8', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (169, N'9', N'Ph?????ng', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (170, N'An Ph?? ????ng', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (171, N'????ng H??ng Thu???n', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (172, N'Hi???p Th??nh', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (173, N'T??n Ch??nh Hi???p', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (174, N'T??n H??ng Thu???n', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (175, N'T??n Th???i Hi???p', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (176, N'T??n Th???i Nh???t', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (177, N'Th???nh L???c', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (178, N'Th???nh Xu??n', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (179, N'Th???i An', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (180, N'Trung M??? T??y', N'Ph?????ng', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (181, N' Th???nh M??? L???i', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (182, N'An Kh??nh', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (183, N'An L???i ????ng', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (184, N'An Ph??', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (185, N'B??nh An', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (186, N'B??nh Kh??nh', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (187, N'B??nh Tr??ng ????ng', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (188, N'B??nh Tr??ng T??y', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (189, N'C??t L??i', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (190, N'Th???o ??i???n', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (191, N'Th??? Thi??m', N'Ph?????ng', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (192, N'1', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (193, N'10', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (194, N'11', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (195, N'12', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (196, N'13', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (197, N'14', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (198, N'2', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (199, N'3', N'Ph?????ng', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (200, N'4', N'Ph?????ng', 15)
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_status_id]  DEFAULT ((0)) FOR [status_id]
GO
ALTER TABLE [dbo].[poster] ADD  CONSTRAINT [DF_poster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_sold_quantity]  DEFAULT ((0)) FOR [sold_quantity]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_user_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_ward] FOREIGN KEY([ward_id])
REFERENCES [dbo].[ward] ([ward_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_ward]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD  CONSTRAINT [FK_district_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[province] ([province_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [FK_district_province]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_product]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_users]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[order_status] ([status_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_status]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_user_permission] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permission] ([permission_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_user_permission]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_address]
GO
ALTER TABLE [dbo].[ward]  WITH CHECK ADD  CONSTRAINT [FK_ward_district] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([district_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ward] CHECK CONSTRAINT [FK_ward_district]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quy c??ch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product', @level2type=N'COLUMN',@level2name=N'specification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ph?????ng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ward', @level2type=N'COLUMN',@level2name=N'ward_id'
GO
USE [master]
GO
ALTER DATABASE [WEBSITE_VANPHONGPHAM] SET  READ_WRITE 
GO
