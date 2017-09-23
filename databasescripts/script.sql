USE [master]
GO
/****** Object:  Database [SalesApp]    Script Date: 9/23/2017 12:24:33 PM ******/
CREATE DATABASE [SalesApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SalesApp.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalesApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SalesApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalesApp] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [SalesApp] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [SalesApp] SET  DISABLE_BROKER 
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
ALTER DATABASE [SalesApp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SalesApp]
GO
/****** Object:  User [salesapp]    Script Date: 9/23/2017 12:24:33 PM ******/
CREATE USER [salesapp] FOR LOGIN [salesapp] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_datareader] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [salesapp]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [salesapp]
GO
/****** Object:  Table [dbo].[ActivitiesType]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_ActivitiesType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_CompanyDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomForms]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_CustomForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormsAnswers]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_FormsAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormsQuestionFields]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_FormsQuestionFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InputFields]    Script Date: 9/23/2017 12:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InputFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](50) NULL,
 CONSTRAINT [PK_InputFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotesActivities]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhotoActivities]    Script Date: 9/23/2017 12:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhotoActivities](
	[Id] [int] NOT NULL,
	[PhotoUrl] [varchar](150) NULL,
	[Tags] [varchar](150) NULL,
	[PlaceId] [int] NULL,
	[UserId] [int] NULL,
	[Note] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PhotoActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlacesDetails]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_PlacesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/23/2017 12:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesAppLogInfo]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_SalesAppLogInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAssignedPlaces]    Script Date: 9/23/2017 12:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedPlaces](
	[UserId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NOT NULL,
 CONSTRAINT [PK_UserAssignedPlaces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersActivities]    Script Date: 9/23/2017 12:24:33 PM ******/
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
 CONSTRAINT [PK_UsersActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ActivitiesType] ON 

INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description]) VALUES (1, N'AUDIT', N'Audit form description')
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description]) VALUES (2, N'ORDER', N'Order from description')
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description]) VALUES (3, N'PHOTO', N'PhotoUpload description')
INSERT [dbo].[ActivitiesType] ([Id], [Type], [Description]) VALUES (4, N'NOTE', N'Note description')
SET IDENTITY_INSERT [dbo].[ActivitiesType] OFF
SET IDENTITY_INSERT [dbo].[CompanyDetails] ON 

INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [Address], [RegistrationNo]) VALUES (1, N'TCS', N'Pune', N'2323HJ8')
INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [Address], [RegistrationNo]) VALUES (2, N'Wipro', N'pune', N'0987YO3')
SET IDENTITY_INSERT [dbo].[CompanyDetails] OFF
SET IDENTITY_INSERT [dbo].[InputFields] ON 

INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (1, N'textbox')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (2, N'textarea')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (3, N'datepicker')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (4, N'photo')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (5, N'checkbox')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (6, N'radio')
INSERT [dbo].[InputFields] ([Id], [FieldName]) VALUES (7, N'label')
SET IDENTITY_INSERT [dbo].[InputFields] OFF
SET IDENTITY_INSERT [dbo].[PlacesDetails] ON 

INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (6, N'Fairbroker.in', 1, N'151/1, Chhoti Khajrani, L.I.G. Tiraha, A.B. Road, Near Lifeline Hospital,, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ4V44PU_9YjkRwG--WWc0pl4', CAST(22.7335809 AS Decimal(9, 7)), CAST(75.8903729 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (7, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkROVgLcLPmj6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (8, N'Surya Roshni Limited', 1, N'2/10, Sogani Complex, T & Gate T Nagar, Ring Road, Dewas Naka, Indore', N'', N'', N'', N'', N'', N'', N'https://lh3.googleusercontent.com/p/AF1QipNqUTvJkTUNxnIR2nMn-72zX19NujKx7XZWMGdx=w640-k', N'ChIJq6qq6jIdYzkR0CMwaWdEfeo', CAST(22.7322465 AS Decimal(9, 7)), CAST(75.8922109 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (9, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkROVgLcL6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (10, N'Bank of India', 1, N'Sanvid Nagar, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ8f0J-TT9YjkVgLcL6Y', CAST(22.7235417 AS Decimal(9, 7)), CAST(75.8974398 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (11, N'Search Schemes', 1, N'211 Anoop Nagar Ground Floor, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJixkxMkn9YjkRuArnfuo2ZEA', CAST(22.7320670 AS Decimal(9, 7)), CAST(75.8920309 AS Decimal(9, 7)), N'')
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags]) VALUES (12, N'Inspire Education', 1, N'Rafael Tower, 318, 8/2, Greater Kailash Road, Saket Square, Old Palasia, Indore', N'', N'', N'', N'', N'', N'', N'https://lh3.googleusercontent.com/p/AF1QipPDILuE0mmDc-09KTfIptYFRohj3nxtIwtRATEo=w640-k', N'ChIJq6qqakf9YjkRSNOficUCJ7k', CAST(22.7250806 AS Decimal(9, 7)), CAST(75.8941155 AS Decimal(9, 7)), N'')
SET IDENTITY_INSERT [dbo].[PlacesDetails] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (2, N'Representative')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (3, N'SuperAdmin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UserAssignedPlaces] ON 

INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 7, 7)
INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 8, 8)
INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 9, 9)
INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 10, 10)
INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 11, 11)
INSERT [dbo].[UserAssignedPlaces] ([UserId], [Id], [PlaceId]) VALUES (1, 12, 12)
SET IDENTITY_INSERT [dbo].[UserAssignedPlaces] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById]) VALUES (1, N'Sachin', N'sachin.patidar4@gmail.com', N'12342323', N'English', N'ii', 1, 1, N'123456', N'klasdf', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'patidar', N'sachin.patidar4@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[SalesAppLogInfo] ADD  CONSTRAINT [DF_SalesAppLogInfo_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
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
/****** Object:  StoredProcedure [dbo].[GetAllPlacesInfo]    Script Date: 9/23/2017 12:24:33 PM ******/
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
USE [master]
GO
ALTER DATABASE [SalesApp] SET  READ_WRITE 
GO
