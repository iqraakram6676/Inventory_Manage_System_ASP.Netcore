USE [IMSAPI]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[InventoryLog]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InventoryLog]') AND type in (N'U'))
DROP TABLE [dbo].[InventoryLog]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16/08/2025 12:28:35 am ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryLog]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OldQuantity] [int] NOT NULL,
	[NewQuantity] [int] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InventoryLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[QuantityInStock] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CategoryId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](150) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/08/2025 12:28:35 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250813173956_CreateUsersTable', N'9.0.8')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'Electronics', N'Devices, gadgets, and electronic accessories')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'Clothing', N'Men and women apparel and fashion items')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Books', N'Printed and digital reading materials')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (4, N'Home Appliances', N'Appliances and equipment for home use')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (5, N'Sports', N'Sports gear, fitness equipment, and accessories')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryLog] ON 
GO
INSERT [dbo].[InventoryLog] ([LogId], [ProductId], [UserId], [OldQuantity], [NewQuantity], [UpdatedAt]) VALUES (1, 1, 1, 50, 45, CAST(N'2025-08-13T22:47:48.5266667' AS DateTime2))
GO
INSERT [dbo].[InventoryLog] ([LogId], [ProductId], [UserId], [OldQuantity], [NewQuantity], [UpdatedAt]) VALUES (2, 2, 2, 20, 18, CAST(N'2025-08-13T22:47:48.5266667' AS DateTime2))
GO
INSERT [dbo].[InventoryLog] ([LogId], [ProductId], [UserId], [OldQuantity], [NewQuantity], [UpdatedAt]) VALUES (3, 3, 3, 100, 95, CAST(N'2025-08-13T22:47:48.5266667' AS DateTime2))
GO
INSERT [dbo].[InventoryLog] ([LogId], [ProductId], [UserId], [OldQuantity], [NewQuantity], [UpdatedAt]) VALUES (4, 4, 4, 15, 14, CAST(N'2025-08-13T22:47:48.5266667' AS DateTime2))
GO
INSERT [dbo].[InventoryLog] ([LogId], [ProductId], [UserId], [OldQuantity], [NewQuantity], [UpdatedAt]) VALUES (5, 5, 5, 60, 58, CAST(N'2025-08-13T22:47:48.5266667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[InventoryLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [QuantityInStock], [CreatedAt], [UpdatedAt], [CategoryId], [SupplierId]) VALUES (1, N'Smartphone X200', N'Latest smartphone with 5G support and 128GB storage', 50, CAST(N'2025-08-13T22:47:02.3766667' AS DateTime2), NULL, 1, 1)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [QuantityInStock], [CreatedAt], [UpdatedAt], [CategoryId], [SupplierId]) VALUES (2, N'Men''s Leather Jacket', N'Genuine leather jacket for winter wear', 20, CAST(N'2025-08-13T22:47:02.3766667' AS DateTime2), NULL, 2, 2)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [QuantityInStock], [CreatedAt], [UpdatedAt], [CategoryId], [SupplierId]) VALUES (3, N'Science Fiction Novel', N'Bestselling sci-fi novel with hardcover', 100, CAST(N'2025-08-13T22:47:02.3766667' AS DateTime2), NULL, 3, 3)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [QuantityInStock], [CreatedAt], [UpdatedAt], [CategoryId], [SupplierId]) VALUES (4, N'Microwave Oven 800W', N'Compact microwave oven with digital controls', 15, CAST(N'2025-08-13T22:47:02.3766667' AS DateTime2), NULL, 4, 4)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [QuantityInStock], [CreatedAt], [UpdatedAt], [CategoryId], [SupplierId]) VALUES (5, N'Football', N'Standard size football for outdoor games', 60, CAST(N'2025-08-13T22:47:02.3766667' AS DateTime2), NULL, 5, 5)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'Employee')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [ContactInfo], [Address]) VALUES (1, N'TechWorld Inc.', N'techworld@example.com | +1-555-1001', N'123 Silicon Valley, CA, USA')
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [ContactInfo], [Address]) VALUES (2, N'FashionHub', N'contact@fashionhub.com | +44-20-1234-5678', N'221B Baker Street, London, UK')
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [ContactInfo], [Address]) VALUES (3, N'BookPlanet', N'support@bookplanet.com | +61-2-5555-6789', N'45 Queen Street, Sydney, Australia')
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [ContactInfo], [Address]) VALUES (4, N'HomeEssentials Co.', N'info@homeessentials.com | +1-555-8899', N'789 Maple Avenue, Toronto, Canada')
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [ContactInfo], [Address]) VALUES (5, N'Sportify Gear', N'sales@sportifygear.com | +49-30-123456', N'56 Alexanderplatz, Berlin, Germany')
GO
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Username], [Email], [PasswordHash], [RoleId]) VALUES (1, N'Ali', N'Ali@example.com', N'abcd', 1)
GO
INSERT [dbo].[Users] ([UserId], [Username], [Email], [PasswordHash], [RoleId]) VALUES (2, N'john_doe', N'john@example.com', N'abcd', 3)
GO
INSERT [dbo].[Users] ([UserId], [Username], [Email], [PasswordHash], [RoleId]) VALUES (3, N'jane_smith', N'jane@example.com', N'abcd', 1)
GO
INSERT [dbo].[Users] ([UserId], [Username], [Email], [PasswordHash], [RoleId]) VALUES (4, N'mark_white', N'mark@example.com', N'abcd', 3)
GO
INSERT [dbo].[Users] ([UserId], [Username], [Email], [PasswordHash], [RoleId]) VALUES (5, N'emma_brown', N'emma@example.com', N'abcd', 3)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
