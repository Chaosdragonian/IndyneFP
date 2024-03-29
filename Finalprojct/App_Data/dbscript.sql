USE [master]
GO
/****** Object:  Database [Finalproject]    Script Date: 2019-08-12 오후 2:21:14 ******/
CREATE DATABASE [Finalproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Finalproject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Finalproject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Finalproject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Finalproject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Finalproject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Finalproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Finalproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Finalproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Finalproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Finalproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Finalproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [Finalproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Finalproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Finalproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Finalproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Finalproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Finalproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Finalproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Finalproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Finalproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Finalproject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Finalproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Finalproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Finalproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Finalproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Finalproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Finalproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Finalproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Finalproject] SET RECOVERY FULL 
GO
ALTER DATABASE [Finalproject] SET  MULTI_USER 
GO
ALTER DATABASE [Finalproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Finalproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Finalproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Finalproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Finalproject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Finalproject', N'ON'
GO
ALTER DATABASE [Finalproject] SET QUERY_STORE = OFF
GO
USE [Finalproject]
GO
/****** Object:  Table [dbo].[Award]    Script Date: 2019-08-12 오후 2:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Award](
	[AwardID] [int] NOT NULL,
	[AwardName] [varchar](50) NOT NULL,
	[AwardDesc] [varchar](max) NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[ContactID] [int] NOT NULL,
 CONSTRAINT [PK_Award] PRIMARY KEY CLUSTERED 
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2019-08-12 오후 2:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Github] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Github]    Script Date: 2019-08-12 오후 2:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Github](
	[GitID] [int] NOT NULL,
	[Gitaddress] [varchar](max) NOT NULL,
	[ContactID] [int] NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Github] PRIMARY KEY CLUSTERED 
(
	[GitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Award] ([AwardID], [AwardName], [AwardDesc], [ContactName], [ContactID]) VALUES (1, N'BOB5th Grandprix', N'Start-up Contest about Cyber Security', N'LeeHyunseok', 1)
INSERT [dbo].[Award] ([AwardID], [AwardName], [AwardDesc], [ContactName], [ContactID]) VALUES (2, N'KSFS Winter Prize', N'For poster presentation', N'LeeHyunseok', 1)
INSERT [dbo].[Contact] ([ID], [Name], [Email], [Phone], [Github]) VALUES (1, N'LeeHyunseok', N'dlgustjr02124@gmail.com', N'010-3420-9715', N'https://github.com/lhs02124')
INSERT [dbo].[Github] ([GitID], [Gitaddress], [ContactID], [ContactName]) VALUES (1, N'https://github.com/lhs02124/rezeroidforSWM', 1, N'LeeHyunseok')
INSERT [dbo].[Github] ([GitID], [Gitaddress], [ContactID], [ContactName]) VALUES (2, N'https://github.com/lhs02124/Asarattaforswm', 1, N'LeeHyunseok')
INSERT [dbo].[Github] ([GitID], [Gitaddress], [ContactID], [ContactName]) VALUES (3, N'https://github.com/lhs02124/ReReView', 1, N'LeeHyunseok')
INSERT [dbo].[Github] ([GitID], [Gitaddress], [ContactID], [ContactName]) VALUES (4, N'https://github.com/lhs02124/Finalproject', 1, N'LeeHyunseok')
ALTER TABLE [dbo].[Award]  WITH CHECK ADD  CONSTRAINT [FK_Award_Contact] FOREIGN KEY([ContactID], [ContactName])
REFERENCES [dbo].[Contact] ([ID], [Name])
GO
ALTER TABLE [dbo].[Award] CHECK CONSTRAINT [FK_Award_Contact]
GO
ALTER TABLE [dbo].[Github]  WITH CHECK ADD  CONSTRAINT [FK_Github_Contact] FOREIGN KEY([ContactID], [ContactName])
REFERENCES [dbo].[Contact] ([ID], [Name])
GO
ALTER TABLE [dbo].[Github] CHECK CONSTRAINT [FK_Github_Contact]
GO
USE [master]
GO
ALTER DATABASE [Finalproject] SET  READ_WRITE 
GO
