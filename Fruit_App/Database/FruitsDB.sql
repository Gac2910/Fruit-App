USE [master]
GO
/****** Object:  Database [FruitsDB]    Script Date: 4/26/2022 11:56:26 AM ******/
CREATE DATABASE [FruitsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FruitsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\FruitsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FruitsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\FruitsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FruitsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FruitsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FruitsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FruitsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FruitsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FruitsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FruitsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FruitsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FruitsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FruitsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FruitsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FruitsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FruitsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FruitsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FruitsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FruitsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FruitsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FruitsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FruitsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FruitsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FruitsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FruitsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FruitsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FruitsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FruitsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FruitsDB] SET  MULTI_USER 
GO
ALTER DATABASE [FruitsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FruitsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FruitsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FruitsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FruitsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FruitsDB] SET QUERY_STORE = OFF
GO
USE [FruitsDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FruitsDB]
GO
/****** Object:  Table [dbo].[Fruits]    Script Date: 4/26/2022 11:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fruits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[taste] [varchar](50) NULL,
 CONSTRAINT [PK_Fruits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fruits] ON 

INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (1, N'Apple', N'Red', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (2, N'Lemon', N'Yellow', N'Sour')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (3, N'Grapefruit', N'Pink Red', N'Bitter Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (4, N'Grape', N'Purple', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (5, N'Mango', N'Yellow Red', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (6, N'Lime', N'Green', N'Sour')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (7, N'Banana', N'Yellow', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (9, N'Starfruit', N'Yellow', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (10, N'Kiwi', N'Brown Green', N'Sweet Sour')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (11, N'Coconut', N'Brown White', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (12, N'Strawberry', N'Red', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (13, N'Blueberry', N'Blue', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (14, N'Raspberry', N'Red', N'Tart Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (42, N'Plantain', N'Yellow', N'Sweet')
INSERT [dbo].[Fruits] ([id], [name], [color], [taste]) VALUES (60, N'Guava', N'Green Pink', N'Sweet')
SET IDENTITY_INSERT [dbo].[Fruits] OFF
/****** Object:  StoredProcedure [dbo].[DeleteFruit]    Script Date: 4/26/2022 11:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteFruit]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[Fruits] WHERE [id] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFruit]    Script Date: 4/26/2022 11:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertFruit]
	@Name varchar(50) ,
	@Color varchar(50) ,
	@Taste varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Fruits] 
	(name, color, taste)
	VALUES
	(@Name, @Color, @Taste)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll]    Script Date: 4/26/2022 11:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[Fruits]
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateFruit]    Script Date: 4/26/2022 11:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateFruit]
	@ID int,
	@Name varchar(50) ,
	@Color varchar(50) ,
	@Taste varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[Fruits]
	SET [name] = @Name, [color] = @Color, [taste] = @Taste
	WHERE [id] = @ID
END
GO
USE [master]
GO
ALTER DATABASE [FruitsDB] SET  READ_WRITE 
GO
