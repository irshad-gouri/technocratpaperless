USE [master]
GO
/****** Object:  Database [SalesApp]    Script Date: 10/23/2017 5:15:57 PM ******/
CREATE DATABASE [SalesApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SalesApp.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalesApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SalesApp_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalesApp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SalesApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SalesApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalesApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SalesApp] SET  MULTI_USER 
GO
ALTER DATABASE [SalesApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SalesApp]
GO
/****** Object:  StoredProcedure [dbo].[GetAllPlacesInfo]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sachin patidar
-- Create date: 26/08/2017
-- Description:	For getting all the data of places for particular user
-- Usage : exec GetAllPlacesInfo 1
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPlacesInfo] 
	(
	@userId INT
	)
AS
BEGIN
	SELECT 
	pd.Id,
	pd.Address,
	pd.Country,
	pd.CountryCode,
	pd.IsActive,
	pd.Latitude,
	pd.Longitude,
	pd.Name,
	pd.Note,
	pd.PhotoUrl,
	pd.PostalCode,
	pd.Website,
	uap.UserId

	FROM PlacesDetails pd 
		INNER JOIN UserAssignedPlaces uap ON uap.PlaceId = pd.Id
	WHERE uap.UserId = @userId
		
END




GO
/****** Object:  Table [dbo].[ActivitiesType]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivitiesType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ActivitiesType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](150) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[RegistrationNo] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_CompanyDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomForms]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomForms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](150) NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[Tags] [varchar](150) NULL,
	[UserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_CustomForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormsAnswers]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormsAnswers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NULL,
	[UserId] [int] NULL,
	[FormId] [int] NULL,
	[FormsQuestionId] [int] NULL,
	[Answer] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_FormsAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormsQuestionFields]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormsQuestionFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NULL,
	[Question] [varchar](150) NULL,
	[IsMandatory] [bit] NULL,
	[InputFieldsId] [int] NULL,
	[ListOptions] [varchar](300) NULL,
	[CreatedDate] [datetime] NULL,
	[ModefiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_FormsQuestionFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormsVisibleOnTheseReps]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormsVisibleOnTheseReps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomFormsId] [int] NULL,
	[UserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_FormsVisibleOnTheseReps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InputFields]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InputFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_InputFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotesActivities]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotesActivities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NULL,
	[Note] [varchar](max) NULL,
	[UserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhotoActivities]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhotoActivities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhotoUrl] [varchar](150) NULL,
	[Tags] [varchar](150) NULL,
	[PlaceId] [int] NULL,
	[UserId] [int] NULL,
	[Note] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PhotoActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlacesDetails]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlacesDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Address] [varchar](150) NULL,
	[State] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](50) NULL,
	[CountryCode] [varchar](10) NULL,
	[Note] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
	[PhotoUrl] [varchar](100) NULL,
	[PlaceId] [varchar](150) NULL,
	[Latitude] [decimal](9, 7) NULL,
	[Longitude] [decimal](9, 7) NULL,
	[Tags] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PlacesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesAppLogInfo]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesAppLogInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KeyId] [int] NOT NULL,
	[KeyDescription] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_SalesAppLogInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UseActivitiesComments]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseActivitiesComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UsersActivitiesId] [int] NULL,
	[UserComment] [nvarchar](max) NULL,
	[CommentByUserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_UseActivitiesComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAssignedPlaces]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedPlaces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_UserAssignedPlaces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Teritory] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CompanyId] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Note] [varchar](150) NULL,
	[PhotoUrl] [varchar](200) NULL,
	[RoleId] [int] NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[CreatedById] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersActivities]    Script Date: 10/23/2017 5:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersActivities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PhotoUrl] [varchar](150) NULL,
	[Note] [varchar](200) NULL,
	[FormName] [varchar](50) NULL,
	[OrderCost] [decimal](6, 2) NULL,
	[AuditItems] [int] NULL,
	[PlaceId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_UsersActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ActivitiesType] ON 

INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description], [CreatedBy], [CreatedDate]) VALUES (1, N'AUDIT', N'Audit form description', NULL, NULL)
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description], [CreatedBy], [CreatedDate]) VALUES (2, N'ORDER', N'Order from description', NULL, NULL)
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description], [CreatedBy], [CreatedDate]) VALUES (3, N'PHOTO', N'PhotoUpload description', NULL, NULL)
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description], [CreatedBy], [CreatedDate]) VALUES (4, N'NOTE', N'Note description', NULL, NULL)
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description], [CreatedBy], [CreatedDate]) VALUES (5, N'FORM', N'FORM description', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActivitiesType] OFF
SET IDENTITY_INSERT [dbo].[CompanyDetails] ON 

INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [Address], [RegistrationNo], [CreatedDate], [CreatedBy]) VALUES (1, N'TCS', N'Pune', N'2323HJ8', NULL, NULL)
INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [Address], [RegistrationNo], [CreatedDate], [CreatedBy]) VALUES (2, N'Wipro', N'pune', N'0987YO3', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CompanyDetails] OFF
SET IDENTITY_INSERT [dbo].[CustomForms] ON 

INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(0x0000A7F9012E2A3F AS DateTime), CAST(0x0000A7F9012E2AF9 AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(0x0000A7F9012EA52F AS DateTime), CAST(0x0000A7F9012EA584 AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (3, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(0x0000A7F901353503 AS DateTime), CAST(0x0000A7F901353503 AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(0x0000A7F9013782E1 AS DateTime), CAST(0x0000A7F9013782E1 AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, N'new forms', N'no description self exp', 1, NULL, 1, CAST(0x0000A80F012B95FD AS DateTime), CAST(0x0000A80F012B95FD AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CustomForms] OFF
SET IDENTITY_INSERT [dbo].[FormsAnswers] ON 

INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 6, 1, 1, 1, N'Testing Answer For First Question...', CAST(0x0000A7FC0014C7CD AS DateTime), CAST(0x0000A7FC0014C7D1 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1002, 1, 1, 1, 1, N'sample string 2', CAST(0x0000A80E01296CF0 AS DateTime), CAST(0x0000A80E01296D4B AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1003, 1, 1, 1, 1, N'sample string 2', CAST(0x0000A80E01297E92 AS DateTime), CAST(0x0000A80E01297EDA AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1004, 13, 7, 5, 6, N'Hhh', CAST(0x0000A80F012C1EF2 AS DateTime), CAST(0x0000A80F012C1F5C AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1005, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171811591173_IMG-20171013-WA0006.jpg', CAST(0x0000A80F012C2770 AS DateTime), CAST(0x0000A80F012C27BD AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1006, 13, 7, 5, 5, N'Hhhh', CAST(0x0000A80F012EA07E AS DateTime), CAST(0x0000A80F012EA0B8 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1007, 13, 7, 5, 6, N'Hhhhh', CAST(0x0000A80F012EB49E AS DateTime), CAST(0x0000A80F012EB4EC AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1008, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171821357343_Screenshot_2017-09-10-18-55-38-102_com.whatsapp.png', CAST(0x0000A80F012EB8CD AS DateTime), CAST(0x0000A80F012EB90E AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1009, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F012F55F3 AS DateTime), CAST(0x0000A80F012F55F3 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1010, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F012F564F AS DateTime), CAST(0x0000A80F012F564F AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1011, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F012F5651 AS DateTime), CAST(0x0000A80F012F5651 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1012, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F012F6B99 AS DateTime), CAST(0x0000A80F012F6BDD AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1013, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F012F706A AS DateTime), CAST(0x0000A80F012F70A8 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1014, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F012F748B AS DateTime), CAST(0x0000A80F012F74CA AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1015, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F012FA529 AS DateTime), CAST(0x0000A80F012FA572 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1016, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F012FA982 AS DateTime), CAST(0x0000A80F012FA9C0 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1017, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F012FB06A AS DateTime), CAST(0x0000A80F012FB0B7 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1018, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F0130C5DA AS DateTime), CAST(0x0000A80F0130C636 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1019, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F0130D28F AS DateTime), CAST(0x0000A80F0130D2ED AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1020, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F0130D985 AS DateTime), CAST(0x0000A80F0130D9D5 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1021, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F01320284 AS DateTime), CAST(0x0000A80F013202CF AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1022, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F01320BE1 AS DateTime), CAST(0x0000A80F01320C3B AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1023, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F013211B8 AS DateTime), CAST(0x0000A80F01321201 AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1024, 13, 7, 5, 5, N'Hhh', CAST(0x0000A80F01333915 AS DateTime), CAST(0x0000A80F0133396F AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1025, 13, 7, 5, 6, N'Hhhhhh', CAST(0x0000A80F013346DA AS DateTime), CAST(0x0000A80F013346DA AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1026, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(0x0000A80F013346E4 AS DateTime), CAST(0x0000A80F013346E4 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FormsAnswers] OFF
SET IDENTITY_INSERT [dbo].[FormsQuestionFields] ON 

INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (1, 1, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(0x0000A7F9012E4D71 AS DateTime), CAST(0x0000A7F9012E4DC3 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (2, 1, N'Test Question 1', 1, 2, N'Male/FeMale', CAST(0x0000A7F9012EACBD AS DateTime), CAST(0x0000A7F9012EAD1B AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (3, 3, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(0x0000A7F901353672 AS DateTime), CAST(0x0000A7F901353672 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (4, 4, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(0x0000A7F9013782E4 AS DateTime), CAST(0x0000A7F9013782E4 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (5, 5, N'jaklfjalfjasdlfjdklfj', 0, 1, NULL, CAST(0x0000A80F012B9602 AS DateTime), CAST(0x0000A80F012B9602 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (6, 5, N'dfjklsadfjaslfjasdlfjasdlf', 0, 2, NULL, CAST(0x0000A80F012B9607 AS DateTime), CAST(0x0000A80F012B9607 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (7, 5, N'photo', 1, 4, NULL, CAST(0x0000A80F012B9608 AS DateTime), CAST(0x0000A80F012B9608 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (8, 5, N'kjlksafjlasdjfasdlfjasflkj', 0, 9, NULL, CAST(0x0000A80F012B9608 AS DateTime), CAST(0x0000A80F012B9608 AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (9, 5, N'jkjakhasdfjkhasdjkfhasdfh', 0, 10, NULL, CAST(0x0000A80F012B9609 AS DateTime), CAST(0x0000A80F012B9609 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FormsQuestionFields] OFF
SET IDENTITY_INSERT [dbo].[FormsVisibleOnTheseReps] ON 

INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (1, 2, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (2, 3, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (3, 4, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (4, 5, 7, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (5, 5, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FormsVisibleOnTheseReps] OFF
SET IDENTITY_INSERT [dbo].[InputFields] ON 

INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (1, N'textbox', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (2, N'textarea', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (3, N'datepicker', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (4, N'photo', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (5, N'checkbox', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (6, N'list', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (7, N'header', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (8, N'product', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (9, N'numeric', NULL, NULL)
INSERT [dbo].[InputFields] ([Id], [FieldName], [CreatedDate], [CreatedBy]) VALUES (10, N'barcode', NULL, NULL)
SET IDENTITY_INSERT [dbo].[InputFields] OFF
SET IDENTITY_INSERT [dbo].[NotesActivities] ON 

INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, 6, N'Testing For Notes', 4, CAST(0x0000A80501535803 AS DateTime), CAST(0x0000A80501535849 AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 13, N'Hello dear', 7, CAST(0x0000A80F012A3019 AS DateTime), CAST(0x0000A80F012A3019 AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (3, 13, N'Hi iiiiii', 7, CAST(0x0000A80F012A5CC0 AS DateTime), CAST(0x0000A80F012A5DC9 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[NotesActivities] OFF
SET IDENTITY_INSERT [dbo].[PhotoActivities] ON 

INSERT [dbo].[PhotoActivities] ([Id], [PhotoUrl], [Tags], [PlaceId], [UserId], [Note], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, N'Public/201710171744203585_Screenshot_2017-10-02-07-54-46-615_com.whatsapp.png', NULL, 13, 7, N'Hello', CAST(0x0000A80F01246A18 AS DateTime), CAST(0x0000A80F01246AF0 AS DateTime), NULL)
INSERT [dbo].[PhotoActivities] ([Id], [PhotoUrl], [Tags], [PlaceId], [UserId], [Note], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, N'Public/201710171804174789_IMG-20171017-WA0013.jpg', N'Hh', 13, 7, N'H', CAST(0x0000A80F0129E0BB AS DateTime), CAST(0x0000A80F0129E0BB AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PhotoActivities] OFF
SET IDENTITY_INSERT [dbo].[PlacesDetails] ON 

INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (6, N'Fairbroker.in', 1, N'151/1, Chhoti Khajrani, L.I.G. Tiraha, A.B. Road, Near Lifeline Hospital,, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ4V44PU_9YjkRwG--WWc0pl4', CAST(22.7335809 AS Decimal(9, 7)), CAST(75.8903729 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (7, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkROVgLcLPmj6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (8, N'Surya Roshni Limited', 1, N'2/10, Sogani Complex, T & Gate T Nagar, Ring Road, Dewas Naka, Indore', N'', N'', N'', N'', N'', N'', N'https://lh3.googleusercontent.com/p/AF1QipNqUTvJkTUNxnIR2nMn-72zX19NujKx7XZWMGdx=w640-k', N'ChIJq6qq6jIdYzkR0CMwaWdEfeo', CAST(22.7322465 AS Decimal(9, 7)), CAST(75.8922109 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (9, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkROVgLcL6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (10, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkVgLcL6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (11, N'Search Schemes', 1, N'211 Anoop Nagar Ground Floor, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJixkxMkn9YjkRuArnfuo2ZEA', CAST(22.7320670 AS Decimal(9, 7)), CAST(75.8920309 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (12, N'Inspire Education', 1, N'Rafael Tower, 318, 8/2, Greater Kailash Road, Saket Square, Old Palasia, Indore', N'', N'', N'', N'', N'', N'', N'https://lh3.googleusercontent.com/p/AF1QipPDILuE0mmDc-09KTfIptYFRohj3nxtIwtRATEo=w640-k', N'ChIJq6qqakf9YjkRSNOficUCJ7k', CAST(22.7250806 AS Decimal(9, 7)), CAST(75.8941155 AS Decimal(9, 7)), N'', NULL, NULL)
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (13, N'Ginger Hotel in Indore', 1, N'Agra Bombay Road, Off NH 3, Beside Raj TV Office, Near Shaniwar Darpan, Post LIG Square, Chhoti Khajrani, Indore', N'', N'', N'', N'', N'', N'', N'https://lh3.googleusercontent.com/p/AF1QipNGdg5HVeaRnxqMUMqTI4cz1iU6AYrQpKr_1xYT=w640-k', N'ChIJEZRiXG39YjkRuWj3ZJqf1yA', CAST(22.7362481 AS Decimal(9, 7)), CAST(75.8914626 AS Decimal(9, 7)), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PlacesDetails] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (1, N'Admin', NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (2, N'Representative', NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (3, N'SuperAdmin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UseActivitiesComments] ON 

INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, 1, N'Testing User Comments By Mr. RituRaj Pandey', 3, CAST(0x0000A80500D87B95 AS DateTime), CAST(0x0000A80500D87BD5 AS DateTime), NULL)
INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 1, N'This is testing acvitiy for useer', 3, CAST(0x0000A80500F16211 AS DateTime), CAST(0x0000A80500F16211 AS DateTime), NULL)
INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, 1, N'This is testing acvitiy for useer', 4, CAST(0x0000A8050138D5E4 AS DateTime), CAST(0x0000A8050138D62A AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UseActivitiesComments] OFF
SET IDENTITY_INSERT [dbo].[UserAssignedPlaces] ON 

INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (7, 3, 7, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (8, 4, 8, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (9, 4, 9, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (10, 6, 10, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (11, 1, 11, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (12, 1, 12, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (13, 7, 13, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (14, 7, 13, NULL, NULL)
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (15, 7, 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAssignedPlaces] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (1, N'Sachin', N'sachin.patidar4@gmail.com', N'12342323', N'English', N'ii', 1, 1, N'123456', N'klasdf', N'Public/201708262227189504_IMG_20170826_131246.jpg', 1, N'patidar', N'sachin.patidar4@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (2, N'RituRaj', N'rituraj.pandey786@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Pandey', N'rituraj.pandey786@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (3, N'Ashwini', N'ashwini.bokade@yahoo.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Bokade', N'ashwini.bokade@yahoo.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (4, N'Rohan', N'rohan.trivedi341@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Trivedi', N'rohan.trivedi341@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (5, N'Ashish', N'sharma.ashish788@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Sharma', N'sharma.ashish788@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (6, N'Deepak', N'Deepak.yogi227@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Yogi', N'deepak.yogi227@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (7, N'amj', N'amj@gmail.com', N'12121212', N'en', N'asdfasdf', 1, 1, N'123456', N'asdfadsfasdfasdf', N'./images/no_avatar_putnik.png', 2, N'amj', N'123456', N'', N'_', N'_', N'_', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersActivities] ON 

INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (1, 1, 1, N'', NULL, N'', CAST(0.00 AS Decimal(6, 2)), 0, 6, CAST(0x0000A6F700000000 AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (2, 2, 1, N'', NULL, N'', CAST(0.00 AS Decimal(6, 2)), 0, 6, CAST(0x0000A71600000000 AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (3, 3, 7, N'Public/201710171744203585_Screenshot_2017-10-02-07-54-46-615_com.whatsapp.png', N'Hello', NULL, NULL, NULL, 13, CAST(0x0000A73200000000 AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (4, 3, 7, N'Public/201710171804174789_IMG-20171017-WA0013.jpg', N'H', NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (5, 4, 7, N'', N'Hello dear', NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (6, 4, 7, N'', N'Hi iiiiii', NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (7, 5, 7, N'', N'', N'new forms', NULL, NULL, 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UsersActivities] OFF
ALTER TABLE [dbo].[SalesAppLogInfo] ADD  CONSTRAINT [DF_SalesAppLogInfo_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[FormsVisibleOnTheseReps]  WITH CHECK ADD  CONSTRAINT [FK_FormsVisibleOnTheseReps_CustomForms] FOREIGN KEY([CustomFormsId])
REFERENCES [dbo].[CustomForms] ([Id])
GO
ALTER TABLE [dbo].[FormsVisibleOnTheseReps] CHECK CONSTRAINT [FK_FormsVisibleOnTheseReps_CustomForms]
GO
ALTER TABLE [dbo].[FormsVisibleOnTheseReps]  WITH CHECK ADD  CONSTRAINT [FK_FormsVisibleOnTheseReps_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FormsVisibleOnTheseReps] CHECK CONSTRAINT [FK_FormsVisibleOnTheseReps_Users]
GO
ALTER TABLE [dbo].[NotesActivities]  WITH CHECK ADD  CONSTRAINT [FK_Notes_PlacesDetails] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[PlacesDetails] ([Id])
GO
ALTER TABLE [dbo].[NotesActivities] CHECK CONSTRAINT [FK_Notes_PlacesDetails]
GO
ALTER TABLE [dbo].[NotesActivities]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NotesActivities] CHECK CONSTRAINT [FK_Notes_Users]
GO
ALTER TABLE [dbo].[PhotoActivities]  WITH CHECK ADD  CONSTRAINT [FK_PhotoActivities_PlacesDetails] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[PlacesDetails] ([Id])
GO
ALTER TABLE [dbo].[PhotoActivities] CHECK CONSTRAINT [FK_PhotoActivities_PlacesDetails]
GO
ALTER TABLE [dbo].[PhotoActivities]  WITH CHECK ADD  CONSTRAINT [FK_PhotoActivities_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[PhotoActivities] CHECK CONSTRAINT [FK_PhotoActivities_Users]
GO
ALTER TABLE [dbo].[UseActivitiesComments]  WITH CHECK ADD  CONSTRAINT [FK_UseActivitiesComments_Users] FOREIGN KEY([CommentByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UseActivitiesComments] CHECK CONSTRAINT [FK_UseActivitiesComments_Users]
GO
ALTER TABLE [dbo].[UseActivitiesComments]  WITH CHECK ADD  CONSTRAINT [FK_UseActivitiesComments_UsersActivities] FOREIGN KEY([UsersActivitiesId])
REFERENCES [dbo].[UsersActivities] ([Id])
GO
ALTER TABLE [dbo].[UseActivitiesComments] CHECK CONSTRAINT [FK_UseActivitiesComments_UsersActivities]
GO
ALTER TABLE [dbo].[UserAssignedPlaces]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedPlaces_PlacesDetails] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[PlacesDetails] ([Id])
GO
ALTER TABLE [dbo].[UserAssignedPlaces] CHECK CONSTRAINT [FK_UserAssignedPlaces_PlacesDetails]
GO
ALTER TABLE [dbo].[UserAssignedPlaces]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedPlaces_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAssignedPlaces] CHECK CONSTRAINT [FK_UserAssignedPlaces_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_CompanyDetails] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_CompanyDetails]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[UsersActivities]  WITH CHECK ADD  CONSTRAINT [FK_UsersActivities_ActivitiesType] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[ActivitiesType] ([Id])
GO
ALTER TABLE [dbo].[UsersActivities] CHECK CONSTRAINT [FK_UsersActivities_ActivitiesType]
GO
ALTER TABLE [dbo].[UsersActivities]  WITH CHECK ADD  CONSTRAINT [FK_UsersActivities_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersActivities] CHECK CONSTRAINT [FK_UsersActivities_Users]
GO
USE [master]
GO
ALTER DATABASE [SalesApp] SET  READ_WRITE 
GO
