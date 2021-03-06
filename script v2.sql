USE [master]
GO
/****** Object:  Database [ProjectManDB]    Script Date: 02-12-17 3:18:00 PM ******/
CREATE DATABASE [ProjectManDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectManDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectManDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectManDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectManDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectManDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectManDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectManDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectManDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectManDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectManDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectManDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectManDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectManDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectManDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectManDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectManDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectManDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectManDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectManDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectManDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectManDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectManDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectManDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectManDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectManDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectManDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectManDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectManDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectManDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectManDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectManDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectManDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectManDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectManDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectManDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectManDB', N'ON'
GO
USE [ProjectManDB]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NULL,
	[TaskId] [int] NULL,
	[UserInfoId] [int] NULL,
	[Time] [smalldatetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuPermission]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuPermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [int] NULL,
	[MenuPath] [varchar](max) NULL,
	[MenuCaption] [varchar](50) NULL,
	[SortId] [int] NULL,
 CONSTRAINT [PK_MenuPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[CodeName] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectAssignToPersons]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectAssignToPersons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserInfoId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectAssignToPersons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Task]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[UserInfoId] [int] NULL,
	[Description] [varchar](max) NULL,
	[DueDate] [smalldatetime] NULL,
	[Priority] [varchar](20) NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 02-12-17 3:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[DesignationId] [int] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name]) VALUES (1, N'IT Admin')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (2, N'Project Manager')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (3, N'Team Lead')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (4, N'Developer')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (5, N'QA Engineer')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (6, N'UX Engineer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[MenuPermission] ON 

INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (1, 2, N'/User/Index', N'Add User', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (2, 2, N'/UnderConstruction/Index', N'Add Project', 3)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (3, 2, N'/UnderConstruction/Index', N'Assign User', 5)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (4, 2, N'/UnderConstruction/Index', N'Add Task', 6)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (5, 2, N'/UnderConstruction/Index', N'View Project', 7)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (6, 2, N'/UnderConstruction/Index', N'View Project Details', 8)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (7, 2, N'/UnderConstruction/Index', N'Add Comment', 9)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (8, 2, N'/UnderConstruction/Index', N'View Comment', 10)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (9, 2, N'/User/EditView', N'Edit/View User', 2)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (10, 2, N'/UnderConstruction/Index', N'Edit Project', 4)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (11, 1, N'/User/Index', N'Add User', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (12, 3, N'/UnderConstruction/Index', N'Add Task', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (13, 3, N'/UnderConstruction/Index', N'View Projects', 2)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (14, 3, N'/UnderConstruction/Index', N'View Project Details', 3)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (15, 3, N'/UnderConstruction/Index', N'Add Comment', 4)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (16, 3, N'/UnderConstruction/Index', N'View Comment', 5)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (17, 4, N'/UnderConstruction/Index', N'Add Task', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (18, 4, N'/UnderConstruction/Index', N'View Project', 2)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (19, 4, N'/UnderConstruction/Index', N'View Project Details', 3)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (20, 4, N'/UnderConstruction/Index', N'Add Comment', 4)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (21, 4, N'/UnderConstruction/Index', N'View Comment', 5)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (22, 5, N'/UnderConstruction/Index', N'Add Task', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (23, 5, N'/UnderConstruction/Index', N'View Project', 2)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (24, 5, N'/UnderConstruction/Index', N'View Project Details', 3)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (25, 5, N'/UnderConstruction/Index', N'Add Comment', 4)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (26, 5, N'/UnderConstruction/Index', N'View Comment', 5)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (27, 6, N'/UnderConstruction/Index', N'Add Task', 1)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (28, 6, N'/UnderConstruction/Index', N'View Project', 2)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (29, 6, N'/UnderConstruction/Index', N'View Project Details', 3)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (30, 6, N'/UnderConstruction/Index', N'Add Comment', 4)
INSERT [dbo].[MenuPermission] ([Id], [DesignationId], [MenuPath], [MenuCaption], [SortId]) VALUES (31, 6, N'/UnderConstruction/Index', N'View Comment', 5)
SET IDENTITY_INSERT [dbo].[MenuPermission] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (1, N'Md. Tayeb Himel', N'himel951@outlook.com', N'678', 1, 2)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (2, N'Payel', N'payel@gmail.com', N'678', 1, 1)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (3, N'Ruhul Amin', N'amin@gmail.com', N'frnsElrfnq3htr678', 1, 3)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (4, N'Jahidur Rahman', N'jahid@outlook.com', N'678', 1, 4)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (5, N'sohel', N'sohel@yahoo.com', N'xtmjqE~fmtt3htr678', 1, 4)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (6, N'Mishu', N'mishu@gmail.com', N'678', 0, 3)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (7, N'Nasir', N'nasir@hotmail.com', N'678', 1, 1)
INSERT [dbo].[UserInfo] ([Id], [Name], [Email], [Password], [IsActive], [DesignationId]) VALUES (8, N'Nuhash', N'nuhash@gmail.com', N'678', 1, 2)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserInfo]    Script Date: 02-12-17 3:18:00 PM ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [IX_UserInfo] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_UserInfo] FOREIGN KEY([UserInfoId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_UserInfo]
GO
ALTER TABLE [dbo].[MenuPermission]  WITH CHECK ADD  CONSTRAINT [FK_MenuPermission_MenuPermission] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[MenuPermission] CHECK CONSTRAINT [FK_MenuPermission_MenuPermission]
GO
ALTER TABLE [dbo].[ProjectAssignToPersons]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAssignToPersons_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectAssignToPersons] CHECK CONSTRAINT [FK_ProjectAssignToPersons_Project]
GO
ALTER TABLE [dbo].[ProjectAssignToPersons]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAssignToPersons_UserInfo] FOREIGN KEY([UserInfoId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[ProjectAssignToPersons] CHECK CONSTRAINT [FK_ProjectAssignToPersons_UserInfo]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_Project]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_UserInfo] FOREIGN KEY([UserInfoId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_UserInfo]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Designation]
GO
USE [master]
GO
ALTER DATABASE [ProjectManDB] SET  READ_WRITE 
GO
