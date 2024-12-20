USE [master]
GO
/****** Object:  Database [EFLYER]    Script Date: 30-11-2024 11:51:29 ******/
CREATE DATABASE [EFLYER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFLYER', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EFLYER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EFLYER_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EFLYER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EFLYER] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFLYER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFLYER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFLYER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFLYER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFLYER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFLYER] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFLYER] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EFLYER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFLYER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFLYER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFLYER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFLYER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFLYER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFLYER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFLYER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFLYER] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EFLYER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFLYER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFLYER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFLYER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFLYER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFLYER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFLYER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFLYER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EFLYER] SET  MULTI_USER 
GO
ALTER DATABASE [EFLYER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFLYER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFLYER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFLYER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EFLYER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EFLYER] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EFLYER] SET QUERY_STORE = ON
GO
ALTER DATABASE [EFLYER] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EFLYER]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminEmail] [nvarchar](max) NULL,
	[AdminPassword] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[RegCId] [int] NULL,
	[ProductCId] [int] NULL,
	[Quantity] [int] NULL,
	[CategoryCId] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[PricePerUnit] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedItems]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedItems](
	[Order_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[CartId] [int] NULL,
	[RegCId] [int] NULL,
	[ProductCId] [int] NULL,
	[Quantity] [int] NULL,
	[CategoryCId] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[PricePerUnit] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[RegOId] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[OrderStatus] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductImagePath] [nvarchar](255) NULL,
	[CategoryPId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](max) NULL,
	[Mobile] [varchar](10) NULL,
	[CountryRId] [int] NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RegDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Registration] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CategoryCId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductCId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([RegCId])
REFERENCES [dbo].[Registration] ([RegId])
GO
ALTER TABLE [dbo].[OrderedItems]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([RegOId])
REFERENCES [dbo].[Registration] ([RegId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryPId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD FOREIGN KEY([CountryRId])
REFERENCES [dbo].[Country] ([CountryId])
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddOrder]
@RegOId int,
@TotalAmount decimal(18,2)
AS
BEGIN
	insert into Orders(RegOId,TotalAmount)
	values(@RegOId,@TotalAmount);
END
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddToCart]

@RegCId int,
@ProductCId int,
@CategoryCId int,
@PricePerUnit decimal,
@Quantity int
AS
BEGIN
	insert into Cart (RegCId,ProductCId,CategoryCId,PricePerUnit,TotalPrice)
	values(@RegCId,@ProductCId,@CategoryCId,@PricePerUnit,@PricePerUnit * @Quantity);
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryDropdown]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CategoryDropdown]
AS
BEGIN
	SELECT * FROM Categories
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChangePassword]
@RegId int,
@newPassword varchar(max)
AS
BEGIN
	update Registration
	set Password = @newPassword
	where RegId = @RegId
END
GO
/****** Object:  StoredProcedure [dbo].[CheckEmail]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckEmail]
@RegId INT,
@Email NVARCHAR(MAX),
@Type VARCHAR(100)
AS
BEGIN
	
	IF @Type = 'INSERT'
	BEGIN
	  SELECT * FROM Registration WHERE Email = @Email;
	END
	ELSE
	BEGIN
		SELECT * FROM Registration WHERE Email = @Email AND RegId <> @RegId;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CountryDropdown]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountryDropdown]
AS
BEGIN
	select * from Country;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCartItem]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCartItem]
@CartId int
AS
BEGIN
	Delete from Cart
	where CartId = @CartId;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct]
@ProductId int
AS
BEGIN
	Delete From Products where ProductId = @ProductId;
END
GO
/****** Object:  StoredProcedure [dbo].[EditProduct]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditProduct]
@ProductId int,
@ProductName NVARCHAR(100),
@Description NVARCHAR(500),
@Price DECIMAL(18, 2),
@ProductImagePath NVARCHAR(255),
@CategoryPId INT
AS
BEGIN
	Update Products 
	set ProductName=@ProductName, Description=@Description,Price=@Price,ProductImagePath=@ProductImagePath,CategoryPId=@CategoryPId
	where ProductId = @ProductId;
END
GO
/****** Object:  StoredProcedure [dbo].[EditQuantity]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditQuantity]
@ProductCId int,
@RegCId int,
@NewQuantity int,
@TotalPrice decimal
AS
BEGIN
	
	UPDATE Cart
	SET Quantity = @NewQuantity,
		TotalPrice = @TotalPrice
	WHERE RegCId = @RegCId AND ProductCId = @ProductCId

	
END
GO
/****** Object:  StoredProcedure [dbo].[EditUserDetails]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditUserDetails]
@RegId int,
@FullName VARCHAR(MAX),
@Mobile VARCHAR(10),
@CountryRId INT,
@Email NVARCHAR(MAX),
@ImagePath NVARCHAR(MAX)
AS
BEGIN
	Update Registration 
	set FullName=@FullName,Mobile=@Mobile,CountryRId=@CountryRId,email=@Email,ImagePath=@ImagePath
	where RegId = @RegId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCartData]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCartData]

AS
BEGIN
	select * from Cart 
	inner join Products 
	on Cart.ProductCId = Products.ProductId
	inner join Categories
	on Categories.CategoryId = Cart.CategoryCId
	inner join Registration
	on Cart.RegCId = Registration.RegId
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrder]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOrder]
AS
BEGIN
	select * From Orders
	inner join Cart
	on Orders.CartOId = Cart.CartId
	inner join Registration
	on Registration.RegId = Orders.RegOId
END
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProduct]
AS
BEGIN
	Select * from Products
	inner join Categories
	on Products.CategoryPId = Categories.CategoryId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductPrice]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductPrice]
    @ProductCId INT
AS
BEGIN
    SELECT Price
    FROM Products
    WHERE ProductId = @ProductCId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRegData]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRegData]
AS
BEGIN
SELECT * FROM Registration
INNER JOIN Country 
ON Registration.CountryRId = Country.CountryId
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByEmail]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByEmail]
@Email Nvarchar(max)
AS
BEGIN
	select * from Registration where Email=@Email;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProduct]
@ProductName NVARCHAR(100),
@Description NVARCHAR(500),
@Price DECIMAL(18, 2),
@ProductImagePath NVARCHAR(255),
@CategoryPId INT
AS
BEGIN
	INSERT INTO Products (ProductName, Description, Price, ProductImagePath, CategoryPId) VALUES 
	(@ProductName, @Description, @Price, @ProductImagePath, @CategoryPId)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRegData]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRegData]
@FullName VARCHAR(MAX),
@Mobile VARCHAR(10),
@CountryRId INT,
@Email NVARCHAR(MAX),
@Password NVARCHAR(MAX),
@ImagePath NVARCHAR(MAX)
AS
BEGIN
	INSERT INTO Registration (FullName,Mobile,CountryRId,Email,Password,ImagePath)
	VALUES(@FullName,@Mobile,@CountryRId,@Email,@Password,@ImagePath)
END
GO
/****** Object:  StoredProcedure [dbo].[OrderedItemsP]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderedItemsP]
@ID int
AS
BEGIN
	Select * from OrderedItems O
	inner join Products P
	on O.ProductCId = p.ProductId
	inner join Categories C
	on P.CategoryPId = C.CategoryId
	where Order_Id = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PlaceOrder]
@CartOId int,
@RegOId int
AS
BEGIN
	insert into Orders (CartOId,RegOId)
	values(@CartOId,@RegOId)
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 30-11-2024 11:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidateUser]
@Email nvarchar(max),
@Password nvarchar(max),
@Type varchar(10)
AS
BEGIN
	IF @Type = 'User'
	BEGIN
	select * from Registration
	where Email = @Email and Password = @Password;
	END
	ELSE 
	BEGIN
	select * from AdminUser
	where AdminEmail = @Email and Password = @Password;
	END
END
GO
USE [master]
GO
ALTER DATABASE [EFLYER] SET  READ_WRITE 
GO
