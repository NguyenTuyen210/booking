USE [master]
GO
/****** Object:  Database [ShopDienThoai]    Script Date: 6/17/2024 8:44:31 PM ******/
CREATE DATABASE [ShopDienThoai]
GO
ALTER DATABASE [ShopDienThoai] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopDienThoai] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [ShopDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopDienThoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopDienThoai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopDienThoai', N'ON'
GO
ALTER DATABASE [ShopDienThoai] SET QUERY_STORE = OFF
GO
USE [ShopDienThoai]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [date] NULL,
	[status] [nvarchar](50) NULL,
	[order_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [date] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[product_quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[description] [text] NULL,
	[image_url] [varchar](max) NULL,
	[brand_id] [int] NULL,
	[release_date] [date] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/17/2024 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[banned] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (17, CAST(N'2024-03-20' AS Date), N'process', 17, 6)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (18, CAST(N'2024-03-20' AS Date), N'wait', 18, 6)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (19, CAST(N'2024-04-23' AS Date), N'wait', 19, 7)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (20, CAST(N'2024-04-23' AS Date), N'wait', 20, 7)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (21, CAST(N'2024-04-23' AS Date), N'done', 21, 7)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (22, CAST(N'2024-04-23' AS Date), N'wait', 22, 7)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (23, CAST(N'2024-06-17' AS Date), N'done', 23, 8)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (24, CAST(N'2024-06-17' AS Date), N'wait', 24, 8)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (25, CAST(N'2024-06-17' AS Date), N'wait', 25, 2)
INSERT [dbo].[bill] ([id], [created_date], [status], [order_id], [user_id]) VALUES (26, CAST(N'2024-06-17' AS Date), N'wait', 26, 2)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [name]) VALUES (1, N'iPhone')
INSERT [dbo].[brand] ([id], [name]) VALUES (2, N'Samsung')
INSERT [dbo].[brand] ([id], [name]) VALUES (3, N'Xiaomi')
INSERT [dbo].[brand] ([id], [name]) VALUES (4, N'Nokia')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (17, CAST(N'2024-03-20' AS Date), 6)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (18, CAST(N'2024-03-20' AS Date), 6)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (19, CAST(N'2024-04-23' AS Date), 7)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (20, CAST(N'2024-04-23' AS Date), 7)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (21, CAST(N'2024-04-23' AS Date), 7)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (22, CAST(N'2024-04-23' AS Date), 7)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (23, CAST(N'2024-06-17' AS Date), 8)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (24, CAST(N'2024-06-17' AS Date), 8)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (25, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[order] ([id], [created_date], [user_id]) VALUES (26, CAST(N'2024-06-17' AS Date), 2)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (3, 1, 17, 1650)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (5, 1, 23, 1650)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (1, 1, 25, 1650)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (3, 2, 17, 1360)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (6, 2, 19, 1360)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (3, 2, 21, 1360)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (1, 2, 25, 1360)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (7, 4, 17, 780)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (5, 4, 19, 780)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (3, 4, 21, 780)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (4, 4, 23, 780)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (6, 5, 19, 800)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (1, 5, 23, 800)
INSERT [dbo].[order_detail] ([product_quantity], [product_id], [order_id], [price]) VALUES (1, 11, 21, 366)
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (1, N'iPhone 15 Pro Max 256GB', 1650, 100, N'Apple', N'https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/13/iphone-15-pro-max-natural-titanium-pure-back-iphone-15-pro-max-natural-titanium-pure-front-2up-screen-usen.png', 1, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (2, N'iPhone 14 Pro Max 128GB', 1360, 44, N'Apple', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-tim-thumb-600x600.jpg', 1, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (3, N'iPhone 11', 560, 45, N'Apple', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBISEhEQEhISEREREhERDxEQERIREBERGRgaGRgUGBgcIS4lHB4rIxgYJjgmKy8xNTU1GiQ7QDszPy40NzEBDAwMEA8QHhISHjErISs0NjQ0NDE0MTY0NDQ0NDQ0NDQ0NDQ0Njc0NDQ0NDY0NDE0NDQ0NDQ2NDQ0NDQxMT80NP/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIDBAcGBQj/xABSEAABAwIABQ4JCAYJBQEAAAABAAIDBBEFEiExQQYHEzIzUWFxcnOBkbGyF1JikpOhs8HRFCI1QlN0tNMjJUOD0vAVJIKUoqTE4fFUY6PCwxb/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QANREAAgECAQcLBAEFAAAAAAAAAAECAxExBAUSITJRoRMUQWJxgZGxwdHhIlJh8EIVIzNDsv/aAAwDAQACEQMRAD8A2ZCEIAQhNc6wJOYC5QFapqCDiMGM8i9jmaPGd8NKgFK92V8jzwMcY2DgAblPSlohdhkdtpDjngGgdAsFyurPVzFQObCG7LUPFwwus1jcoxnHLpBAGkg5hlUEnV/II989L3/FJ8gj3z57/is0wbroEyNE7I2xk2L2Xswb5ab3HCCLbxzLUKSdsjQ4W6LFQBgwe3h89/xS/wBHs4fPf8VYLBvJWO0HoKApTUcbGlzsaw3nvJJ0AC+UrN9VGr6mpnuhjxpHtNnhkj2xsO854uXngbYZxc2XS64mFHQ07w1xacXExmkgtux75HAjM4MY4A6C8FY7qL1OtrHPqagY0TX4rYxdoe+wJvvMaCBYe6xvCDm7IpUqKEdJnsHXQk0NjA3hHK71ukR4UZfI9E/+NdhT4IpmizaanA3hAwe5Ty4Hgex7DDFZzXNJ2KPJcWvmW/NvycqyzqnE+FGTyfRP/jS+FGTyfQu/MWe4TwdLTSOhmaWPYSMoNiNDmnSDoKpLmsdlzT/CjJ5PoXfmI8KMnk+hd+YsyY62gHjS7IPFCaiTTPCjJ5PoXfmJPCjJ5PoXfxrNWvAa4YoJNrOOccSjTUDTvCjJ5Pon/wAaTwpSbzPRP/MUWtlgEky1U0QLCwRwbKwEOJIc57Q4ZrADG4SN9d67B0P2MXoo/gt4UNJXuc1TKVCTVrnJ0Wu09jhsjQ5txuZkY4Die57T1BanqZ1TQ10bZInh18hyYrmu8V7bnFOfSQbGxWf4Z1K0lQxzTFHE83xZImNjc12gnFsHDgK5LUBVS0eEHU7yRiu2OSx+aWY7Wlw4iWvB8k75VJ0nAtSrxqdp9GoUNNJjMa45yMvA7MR13UyobAhCEAIQhACEIQAoK0ExyAZyx9uOxU6r125S82/ulGBkbbRsG8Gg+pfPmuvSyR4UlfJfEmZG+J1jbFawMcBxOaT08K+g49ozib7l5uqDU7TV0eJUMa8DK0uuC074IIIPEQouSfMM8wJAYMpJ+a0l17k2A6wF9J6iaeSOlhjkvjMigjfc3s5kbGvF+BwI6F5OBtb/AAdTSh8bWmRuVrnvc97OFocbNPDa/Cu0YwRsswZGtyAcCSlpO4SsQ09G5kkkhke4PNwx21ZwDL8FaGcdKpCaQFpJvjXuLZBxK7pCqibWM411QRFLcZHMqHDhtFE3/wBiud1vR/UYuF8xPnFe/rpuvHNluAypGe4H6OC4Xh63Y/qMXKm75XVk+0zjyzYXb6M62MKywKGMKywLqZxpDXsBzgHjF03YWeK3zQpi1JZQSRbC3xW+aEbCzxW+aFJZFkJsR7CzxW+aEuwt8VvmhSWRZBYa4KBwVkhROCFWipIFmNacXC1WRktA53TsDTfrWovastr/AKXrPu7vw7VlX2O82yVWq9z80fQ9C0hliLHHk6i9xVpVMHG7P7cvfcra40egCEIUgEIQgBCEIAVev3KXm390qwq9fuUvNv7pRgZFtGcTfcse10NWVT8odQUz3RMja0zPjJbI9zhdrQ4ZWjFLTky/Otoy7DCLxt5I7FjuuhqUnFU7CEEb5Y5WsE7WNL3sewBodijKRYNGTMRwqFa+sPA4nBmqKspHtkEsr23u+KZ7nxvAzghxyHyhlC+idTuERUQxyAkteyORhdtix7Q5t+Gxyr50wdgarrJGxxxyHLZ0kjXNjjBzlziNG9n0AL6K1O4OFNBHEL2YyONt9tisaGgnhyXPGpna+oRv0nqbG3PYJRnHSlukaLni7VUlmZ66O5z8iq7kC8jW5H9Qi5U3fcvY10iDHPY5o6kHjEcGReXrcj+oQ8Jl9o5dGT7Ry5WvpXb6M6xjVZYFE0KVi6jjH2SYqeEtkLIixUuKn2RZQSMDUuKnWSKSBpCheFO5ROCEFeRqyrCX0xW/d3/h2rWHjIsmwj9MVv3d/wCHasq2yu1eptk3+Tu9UfQuDdz/AHkvfcraqYN3P95L33K2uNHcwQhCkAhCEAIQhACqYTJEMpAudjcAOMWVtVcI7jJyCoYFptozkjsSvjBSU+5s5I7FKhKK7aYA3yX37ZVKGHf9SehRYkQMO/1ZE8C2QJQhSVMv10x+il5FX3Yl5+t239X0x3zOOqR3xV/XRvsU4NsjKm1t4shI7VU1uW3wXTu8SSa/EXuHbZa0H9RhlKvDvOrDU4BK1OXYcQrXJwTLJbIByE1CE3HJCUiLIGNJRZOSIQV5sgKyXCrbYYrPuzj10zD71rNSL2YM7iG9elZZh4frqv8Au7rf3ZqxrbKN8nX1vsN7wW4ljgRa0sgHCMYm/rKvKlgzaO5yTvFXVyo7WCEIQAhCEAIQhACq4R3GTkFWlUwkCYZQDY7G4g58wujA6n3NnJHYpVHT7RnJHYpFBKBCEISK1KmpyEGX66IOxTEm92VduABkIA9SZrWsBwZEDmLpr+e4J+ug68U3AyrB48WJJrVfRsPKm9o5XpmVXBHREFhxT0HfG+nhyuSxB4segjODvhUJIpGaMdu+0ZRxhdcZXOOUHHsJLouq7KgFSCQK5mmS3RdRh4RjhQTckukuo8cJccIB6RxUTpwOE6AMpKkjpXvyvuxni/Wdx7w9fEjaWISvgFIzGcZDtW3DOE5ifd1rJMPfTVf93f8AhmrasUAWAsALADMAsVw59NV/3d34Zq5qjurnXRjou34fob7gzaO5yTvFXVRwW0hrje+NLIRwDGIt6vWryxR0sEIQhAIQhACEIQAq9fuUvNv7pVhV6/cpebf3SjAlPubOSOxSqKn2jOSOxSqpKBCEKCQStKRICpuQzM9dMARz2FvmVJyb+xwZU3Wq+jYeVN7R6frq7lNzdR7OBR61h/VsHKm9o9aU8TKrh3naoSXSrUyuRTUsb9s0E7+Z3WMqquwW36r3t47OCvpVKk1gQ4ReKPLODH6JAeNhHvSf0dJ9ozqK9VCtykinIw/WeY3Br9MgHEwn3qVuDG/We53SGj1ZfWryFGnInk4Lo8yKKBjNq0Dh+senOpEIVS61YCOORYth76arvupP+VYtnechWMYf+ma37oPwkarPAvT2jfsHbQ85L33K2qmDdoecl77lbWSNmCEIQAhCEAIQhACr1+5S82/ulWFXr9xl5t/dKMCU+0ZyR2KVRU+0ZyR2KVUJQITUISOTHvDQXOIAAJcSbAAZyToCVchrlVbmUsbGmwlmDX20ta1zsXrAPQpBzuuPVslglkjeHsdHVBrhexxWQtNukFLrYZMG0/CZj/5ZB7l4eGHXwWD5Fd/817utr9G0nCagdUz/AIrSniY1dk7RpS3UT5WsF3EBME0hytjeRvnJ22WpiWbpLqualw2zHt4cUkdeZOjq2OzEdaki6J0iBIEuOFBYS6MZLjBJcILCYyMZBcEgcN9ANlOQrG9UA/XVZ90H4SNbBVH5ptnOQcZzLItU4thyvG9S26qSNUm9ReltM3rBu0POS99ytqpg7aHnJe+5W1mjZghCEAIQhACEIQAq9fuMvNv7pVhV6/cpebf3SjAlPtGckdiemU+0ZyR2J6oSgQnJqEjlzWrvBTqqie2MY0sThNG0Z3FoIc0cJa51hv2XRoUgw2ufjYIYd9tf2xrqdbKHGwTSkHFc19TY2xshkdfJ0BQa5UDI4Z2sa1jS2seWtAa3Ge2F7nW3y5xJ4Sk1v8Ksp8D0twXOc+psAQMgldck6M4R1FBaTdhGlKrLQirtncQ07WnGyuf47hlHFvKe/B2Lln6q3aIWjjc53ZZVKjVHUPyAsjHkNy9ZuuaWXUcbt93vY7oZpyjCyXevS/E7S53lHJC122YHcpouuBfXTOyukeeN7iOq6WOrePrO84rB5yisIvx+GdDzPK2ua8Pd+h2j6JmhjhyXu7DcJhpSNMg48U/BcvHhOQfXd5xVpmGpB9c9OVSs674vxT9jCWZpLBx8j3vk7vHf5jf4k4Ut875OhoHxXiN1QSDSD0KUapbZ42dBI+K0hnSnLG67UvS5k80VVgk+9+p64oo9Ie7lOI7LJ4oovE/xvv2rxG6qRph81/8Asp2ap4NLJBxYrveFsstpS/n5r0KvNddf6v8Al+TPWZSsaQQ03GUXe5wB37ErG9VH07hD7t/pY1rdLhuneQBJik5scYlzvXzetZJqp+ncIfdv9JGto1FNXTuc86MqT0ZR0X2WN5wbtDzkvtHK2qmDdoecl9o5W0RVghCFIBCEIAQhCAFXr9yl5t/dKsKvX7lLzb+6UYEp9ozkjsT0yn2jOSOxPVCUCEIQkEIQgM0109ym5FR7OBePqWivgehdoD6pp4zI4j3r2NdPcpuRUezgUeoOm2XAcLRlIdO8cYkfk6rhZZRBzoSisfbWb5JUVOvGTwv56vUoIQ8ZULwj68UJ4KjCW6hlWiUFGMo7pLqLFdEeXJpKaSkU2LaIpQkQpLAuaw4CMMVYN7iijBvnv8ijvddpgWi2aZrbXY04z+SM46cg6VyOqr6dwh92/wBIxepm+DtKXd+/u88LPNVNwprHW/HV6Pgbzg7aHnJe+5W1UwbtDzkvfcra9FHiAhCEAIQhACEIQAq9fuUvNv7pVhV6/cZebf3SjAlPtGckdiemU+0ZyR2J6oSgQkQhIIQhAZrrp7lNyKj2cCs61H0TTcqo9q5VtdPc5ubqfZwJ+tjlwRSM8eSdp5OyPJHSBbpVlgVY3D9GI5C5ljG/5zS3K0HSL8HZZeTcLUaijjkYWSNDmnRmIOgg6CubrtS8TcrZnC98VmIHOPSLddl5VfIpqTdNat27x6Nx7+SZ0p8mo1nZrpte/h07zksYJDIP+ASuhbqXLv2tuDFv/wAqQak/+9bijPxWPNK328V7nX/Ucl+/hL2Oa2Tg60mOeDqPxXVN1JN0zk8UYHvUg1JxfaP6grLI6z/jxXuVec8l+7hL2OQxzvjq/wB0B54DxZF1/wD+Ui+0f1N+CeNSkGl8h80e5TzKtu4kPOmS734M48PB4OAqamp3SODWNLicwaLldgzUzSj6rnctwI9QC9GkY2mGK1jRGc7mN/SN4XaXj18avHIJvaaXF+3n2GNXO9NL+3Ft/nUvO5DgfAbYWEv+c5wyi/zRvDhtdY5qicThqtJyn5ILnfPySO63aqqGtjL7gtIuCDcEHMQVg+Hz+uq77qfwrF6kIRhFRjgjwalSVSbnJ62fQGDtoecl77lbVTBu0POS99ytqyKMEIQgBCEIAQhCAFXr9yl5t/dKsKvX7lLzb+6UYGwbRnJHYnpkG0ZyR2KRUJQiEqEJBCRCAzXXT3Kbm6j2cCq631RiYLoDewMlQ08bpSB2FWddPc5ubqfZwLz9RFI6bA0TWbeMulZbOXx1D3gdNgOlWWBVmmT1IjZjHKTka3xjvLzWOLiXuN3HOdA4BvBVJKnHDZHOFi1oZvAHMBvk+vqXl4Uw4IfmAXk0MsccXyjGA2vEfneTbKrRi5OyJjFydkdMHAKpU4Yp4t0mjZbQ6RoPVdcJMampP6SRzWn9mDbJwgG3apKfAkbd8nfNvgumOTfdLw1/vE64ZJ9z8NZ1L9V1EP22NyGSP7Gpg1Z0fjSegm/hXitwWwaP8TvinHBrPF9bvir8hS3vh7GvNKW98D34tVdG79sG842SMdbmhehS4Tglyxyxyc3I1/YVxj8Ft3j1lUqjAjHZdIzEgEg8BFioeT03hJruuQ8jp9En3pM0nHTgVmkNRXU25zOkaP2cjjIOguyjoK6PAmqL5Q4RuLY582xva5uMfJN8vFkWM6Eo68V+DlqUJQ14r8FzDRLdjgBOJLK1xYNAacZ1joBIaCOHhWWYe+mq77qfwrFsrqG7XOecZ5sQbWDbZgBo0/za2MYc+mq77s4f5VixMT6BwbtDzkvfcraqYN2h5yXvuVtQgCEIUgEIQgBCEIAVev3KXm390qwq9fuUvNv7pRgSn2jOSOxPUcG0ZyR2J6oShUiEISCEIQGaa6e5zc3U+zgUms+L4Ojv48oHFjk+8qPXT3Obm6n2cCr63+E20mBWTkBzseZkbD9eQvfit4s5PACrxV9SItd2R7OqfCEdI4Q0zG/KZBcvAB+TsOkbzjoGjPvA87RUn1jcuNy5xuXEnKTc75UdFA+R7pZHF8kji57znJOfi4l0FNTruhFQVkejSgoKwynpleZTKaOOylAU3LuZCIAl2EKeyLKLldIqOgCgkp16JCa5im5KmeJLAvMrqFrxlyOG1eNs0/zoXSyxKhPCpvYs3ct6lsPPkDqOoN542F0Uh/bxjPfyx6xxErMMMm+Ga/mJPw7V1GEmPjLJo8kkLhIw8IztPARkIXJ4QqGy4Vq5WbSSkL28AdStNjw5Vy1YJO66Tz60NF3R9D4N2h5yXvuVtU8G7n+8l77lcWCMQQhCkAhCEAIQhACr1+5S82/ulWFBWEiOQjOGPI47FAMg2jOSOxPTYnXYw74BTlQlAhCEJBCEIDNNdPc5ubqfZwLi9S87paSlgyiOAzOt40j3uJd0NxQP7W+u411XkwyDQ1lSB0xwu9xXH6gYgaZjvKf3it6G0aUds7Gip7AL1ImgKrG4BP2ZdJ23LwcEY6oGdNMyEWPQ2VGyLztmRs6Eaj0hInY4XmiZOE6CxdfZVpmJuzJDIhJ5WEIshWaU8eJhCqbvQT24tiuAtUq7EFZjI39Z1YH/AE8o6dhAWdXZMK+yfR2Ddp/bl77lbVaieXMuc+PIOp7h7lZXKjkBCEKQCEIQAhCEAJj2ggg5iCDxFPQgPPoHfoww7aMljuMZLqyoaiB2Nskdsa1nNOQPA4dB4f5EX9IMbkkxo3bzwQOh2Y9CqWLaFWFdF9ozzgj5bH9ozzgoBZQq/wAtj+0Z5wSfLY/tGecEByeuRg4yU73AEgNMjgM5ZiPjk6mvD/3ZWS6jMOMpi+mnIYMclj3H5rXZiCdAyXBzZ19Bz1EL24pkYNIIcLtdoIWT6q9buGSR0tNLHEXXLoySacnfY5oLox5JBGgEAWV4S0XcmLcXdHoNrgRdpBGgg3CVtUVxHg6qPFxx40dTSFp857T6kvg7n+zf/eKL8xb8ut3H4NuX6vH4O9ZKSpBdZ/4OpvEk9PQ/mI8HU3iS+nofzFPLrdx+Bzjq8fg0Cx3ilsVn/g6l+zl9PQ/mI8HUv2cvp6H8xRy63cfgc46vH4NAy8Ka5xG+uB8HUv2cvp6H8xJ4OpvEl9PQ/mJy63cfgc46vH4O8M6UTrgfB1P9nJ6eh/NSHW7n+zf01FF+YnLrdx+By/V4/B12F8NQ07HOkeAbHFYCC9x3mt/kLjtQ0MlZhB0xG3djSAZQ2Jrmuk6MUNZxyNVui1sKiQgF7Ix9b54neOJsVwelwWu6jtSMOD48VjTjmxe92KZHuF7Y1sgAubNGQXuSSbrOdTSMpzcjpaWMtY1pz2ueUcp9ZKnQhUMwQhCAEIQgBCEIAQhCAF5OGtoUIQHPNzJwQhQASIQgK0u2KWnzniSoUgelCEKACEIUgQoQhAKhCEAqaUIQHu4CzL3UIQAhCEAIQhACEIQH/9k=', 1, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (4, N'iPhone 13', 780, 56, N'Apple', N'data:image/jpeg;base64,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', 1, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (5, N'iPhone 15 Plus', 800, 24, N'Apple', N'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iphone_15/iphone-15-plus-8.JPG', 1, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (6, N'Samsung Galaxy S22 5G128GB', 1150, 54, N'Samsung', N'https://cdn.tgdd.vn/Products/Images/42/231110/samsung-galaxy-s22-090222-102419-600x600.jpg', 2, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (7, N'Samsung Galaxy S24 Ultra 5G 256GB', 1560, 23, N'Samsung', N'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(5):fill(white)/fptshop.com.vn/Uploads/Originals/2024/1/15/638409395342231798_samsung-galaxy-s24-ultra-xam-1.png', 2, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (8, N'Samsung Galaxy A15 128GB', 275, 144, N'Samsung', N'https://cdn.tgdd.vn/Products/Images/42/316075/thumb-xanh-duong-4g-600x600.jpg', 2, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (9, N'
Samsung Galaxy Z Fold5 5G 256GB', 2099, 45, N'Samsung', N'https://cdn.tgdd.vn/Products/Images/42/309746/samsung-galaxy-z-fold5-%20xanh-600x600.jpg', 2, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (10, N'Xiaomi Redmi Note 13 Pro', 486, 23, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/314206/xiaomi-redmi-note-13-green-thumb-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (11, N'Xiaomi Redmi Note 13', 366, 67, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/320460/xiaomi-redmi-note-13-black-thumb-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (12, N'Xiaomi 13T Pro 5G', 879, 23, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/309816/xiaomi-13t-pro-xanh-thumb-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (13, N'Xiaomi Redmi Note 12 Pro 128GB', 299, 67, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/299734/xiaomi-redmi-note-12-pro-4g-den-thumb-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (14, N'Xiaomi Redmi 12', 199, 78, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/307245/xiaomi-redmi-12-xanh-duong-thumb-1-1-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (15, N'Xiaomi Redmi A2 series', 179, 55, N'Xiaomi', N'https://cdn.tgdd.vn/Products/Images/42/302654/xiaomi-redmi-a2-xanh-duong-thumbnail-600x600.jpg', 3, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (16, N'Nokia 8210 4G', 99, 45, N'Nokia', N'https://cdn.tgdd.vn/Products/Images/42/286060/Nokia%208210-do-thumb-600x600.jpg', 4, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (17, N'Nokia 215 4G', 59, 56, N'Nokia', N'https://cdn.tgdd.vn/Products/Images/42/228366/nokia-215-xanh-ngoc-new-600x600-600x600.jpg', 4, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (18, N'Nokia 105', 49, 33, N'Nokia', N'https://cdn.tgdd.vn/Products/Images/42/240194/nokia-105-4g-blue-600x600.jpg', 4, NULL)
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (19, N'iPhone 12', 899, 56, N'Apple', N'data:image/jpeg;base64,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', 1, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[product] ([id], [name], [price], [quantity], [description], [image_url], [brand_id], [release_date]) VALUES (20, N'iPhone 13 Pro Max ', 1190, 67, N'Apple', N'data:image/jpeg;base64,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', 1, CAST(N'2023-08-08' AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[role] ([id], [name]) VALUES (0, N'admin')
INSERT [dbo].[role] ([id], [name]) VALUES (1, N'customer')
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (1, N'admin', N'admin', N'admin', N'admin@gmail.com', N'123456789', N'admin', 0, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (2, N'user1', N'user1', N'User 1', N'user1@gmail.com', N'023456789', N'Ha Noi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (3, N'cus2', N'cus2', N'Customer 2', N'cus2@gmail.com', N'098765432', N'Ha Noi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (4, N'abc123', N'123456', N'ABC', N'abc@gmail.com', N'098674822', N'Ha Noi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (5, N'hieulc', N'123456', N'Le Cong Hieu', N'hieulc@gmail.com', N'092782472', N'Ha Noi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (6, N'cus4', N'cus4', N'cus4', N'cus4@gmail.com', N'0123456789', N'Hanoi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (7, N'test', N'test', N'test', N'test@gmail.com', N'0123456789', N'Hanoi', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [fullname], [email], [phone], [address], [role_id], [banned]) VALUES (8, N'quantm', N'123', N'Trần Minh Quân', N'quantm@fpt.edu.vn', N'0123456789', N'Cần Thơ', 1, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Username]    Script Date: 6/17/2024 8:44:32 PM ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UQ_Username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_order]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_role]
GO
USE [master]
GO
ALTER DATABASE [ShopDienThoai] SET  READ_WRITE 
GO
