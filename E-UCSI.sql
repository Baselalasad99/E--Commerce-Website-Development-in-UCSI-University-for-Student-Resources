USE [master]
GO
/****** Object:  Database [E-UCSI]    Script Date: 08-Mar-20 3:38:29 PM ******/
CREATE DATABASE [E-UCSI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-UCSI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\E-UCSI.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E-UCSI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\E-UCSI_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E-UCSI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-UCSI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-UCSI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-UCSI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-UCSI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-UCSI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-UCSI] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-UCSI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-UCSI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-UCSI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-UCSI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-UCSI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-UCSI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-UCSI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-UCSI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-UCSI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-UCSI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-UCSI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-UCSI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-UCSI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-UCSI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-UCSI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-UCSI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-UCSI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-UCSI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-UCSI] SET  MULTI_USER 
GO
ALTER DATABASE [E-UCSI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-UCSI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-UCSI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-UCSI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [E-UCSI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [E-UCSI]
GO
/****** Object:  Table [dbo].[tbl_files]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_files](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NULL,
	[f_name] [nvarchar](max) NULL,
	[f_file] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[cat_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](max) NULL,
	[uemail] [nvarchar](max) NULL,
	[upassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblbook]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbook](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[b_name] [nvarchar](max) NULL,
	[no] [nvarchar](max) NULL,
	[pic] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[price] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblbookcat]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbookcat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblbookcat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblmain]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmain](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[pic] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblmajor]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmajor](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NULL,
	[m_name] [nvarchar](max) NULL,
	[user_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbluser]    Script Date: 08-Mar-20 3:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbluser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](max) NULL,
	[uemail] [nvarchar](max) NULL,
	[upassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbluser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_files] ON 

INSERT [dbo].[tbl_files] ([f_id], [m_id], [f_name], [f_file], [user_id], [cat_id]) VALUES (1, 0, N'English', N'~/images/tf02809165.dotx', 1, 3)
INSERT [dbo].[tbl_files] ([f_id], [m_id], [f_name], [f_file], [user_id], [cat_id]) VALUES (2, 4, N'English', N'~/images/tf02809165.dotx', 1, 7)
INSERT [dbo].[tbl_files] ([f_id], [m_id], [f_name], [f_file], [user_id], [cat_id]) VALUES (1002, 1009, N'Eyes', N'~/images/10 Barriers of Mobile Commerce Adoption Intention Perceptions of Generation X in Malaysia.pdf', 2, 1009)
INSERT [dbo].[tbl_files] ([f_id], [m_id], [f_name], [f_file], [user_id], [cat_id]) VALUES (1001, 5, N'Mobile Commerce ', N'~/images/1 Online to Mobile.pptx', 2, 7)
SET IDENTITY_INSERT [dbo].[tbl_files] OFF
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([id], [uname], [uemail], [upassword]) VALUES (2, N'basel alasad', N'bassilaalsad1996@gmail.com', N'0123456')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
SET IDENTITY_INSERT [dbo].[tblbook] ON 

INSERT [dbo].[tblbook] ([b_id], [id], [b_name], [no], [pic], [user_id], [price]) VALUES (3, 2, N'Java', N'0178750497', N'~/images/images.jfif', 2, N'$100')
SET IDENTITY_INSERT [dbo].[tblbook] OFF
SET IDENTITY_INSERT [dbo].[tblbookcat] ON 

INSERT [dbo].[tblbookcat] ([id], [name]) VALUES (2, N'Computer Science')
INSERT [dbo].[tblbookcat] ([id], [name]) VALUES (1002, N'Math')
SET IDENTITY_INSERT [dbo].[tblbookcat] OFF
SET IDENTITY_INSERT [dbo].[tblmain] ON 

INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (7, N'Faculty of Business & Information Science', NULL, N'~/images/23.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (8, N'Pre-U Studies', NULL, N'~/images/Signature programmes-03.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (9, N'Faculty of Hospitality & Tourism Management', NULL, N'~/images/hotel-management-school.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1007, N'Faculty of Applied Sciences', NULL, N'~/images/1253_Ontario_focus_basic_applied_sciences_900_540_80.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1008, N'Faculty of Engineering, Technology & Built Environmen', NULL, N'~/images/faculty-of-architecture-and-built-environment.png')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1009, N'Faculty of Medicine & Health Sciences', NULL, N'~/images/1568705578547rvcopy_1568705558.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1010, N'Faculty of Pharmaceutical Sciences', NULL, N'~/images/Pharmacy-careers.jpg')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1011, N'Faculty of Social Sciences & Liberal Arts', NULL, N'~/images/download.jfif')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1012, N'Institute of Music', NULL, N'~/images/download (1).jfif')
INSERT [dbo].[tblmain] ([cat_id], [cat_name], [user_id], [pic]) VALUES (1013, N'Centre for Languages', NULL, N'~/images/banner_cfl_4.jpg')
SET IDENTITY_INSERT [dbo].[tblmain] OFF
SET IDENTITY_INSERT [dbo].[tblmajor] ON 

INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (4, 7, N'one', 1)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (5, 7, N'BSc (Hons) Business Information Systems', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1004, 8, N'Foundation in Science (Engineering)', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1008, 1008, N'Bachelor of Civil Engineering with Honours', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1006, 9, N'Bachelor of Hospitality Administration (Kuala Lumpur Campus)', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1007, 1007, N'BSc (Hons) Nutrition with Wellness', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1009, 1009, N'Bachelor of Optometry (Hons)', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1010, 1010, N'Bachelor of Pharmacy (Hons)', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1011, 1011, N'BA (Hons) Psychology', 2)
INSERT [dbo].[tblmajor] ([m_id], [cat_id], [m_name], [user_id]) VALUES (1012, 1012, N'Bachelor of Classical Music (Hons.)', 2)
SET IDENTITY_INSERT [dbo].[tblmajor] OFF
SET IDENTITY_INSERT [dbo].[tbluser] ON 

INSERT [dbo].[tbluser] ([id], [uname], [uemail], [upassword]) VALUES (1, N'asad', N'admin@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[tbluser] OFF
USE [master]
GO
ALTER DATABASE [E-UCSI] SET  READ_WRITE 
GO
