USE [master]
GO
/****** Object:  Database [SalesApp]    Script Date: 10/27/2017 11:27:54 AM ******/
CREATE DATABASE [SalesApp]
 
USE [SalesApp]
GO
/****** Object:  Table [dbo].[ActivitiesType]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[CustomForms]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[FormsAnswers]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[FormsQuestionFields]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[FormsVisibleOnTheseReps]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[InputFields]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[NotesActivities]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[PhotoActivities]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[PlacesDetails]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[SalesAppLogInfo]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[UseActivitiesComments]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[UserAssignedPlaces]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/27/2017 11:27:54 AM ******/
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
/****** Object:  Table [dbo].[UsersActivities]    Script Date: 10/27/2017 11:27:54 AM ******/
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
	[FormId] [int] NULL,
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

INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(N'2017-09-25 18:20:08.957' AS DateTime), CAST(N'2017-09-25 18:20:09.577' AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(N'2017-09-25 18:21:53.863' AS DateTime), CAST(N'2017-09-25 18:21:54.147' AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (3, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(N'2017-09-25 18:45:47.317' AS DateTime), CAST(N'2017-09-25 18:45:47.317' AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, N'Test Custom Forms Creation', N'Test Description', 1, N'Test1,Test2', 1, CAST(N'2017-09-25 18:54:10.670' AS DateTime), CAST(N'2017-09-25 18:54:10.670' AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, N'new forms', N'no description self exp', 1, NULL, 1, CAST(N'2017-10-17 18:10:45.537' AS DateTime), CAST(N'2017-10-17 18:10:45.537' AS DateTime), NULL)
INSERT [dbo].[CustomForms] ([Id], [Title], [Description], [IsActive], [Tags], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (6, N'new form for 8', N'this is specially created for 8', 1, NULL, 1, CAST(N'2017-10-27 00:36:27.550' AS DateTime), CAST(N'2017-10-27 00:36:27.550' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CustomForms] OFF
SET IDENTITY_INSERT [dbo].[FormsAnswers] ON 

INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 6, 1, 1, 1, N'Testing Answer For First Question...', CAST(N'2017-09-28 01:15:39.563' AS DateTime), CAST(N'2017-09-28 01:15:39.577' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1002, 1, 1, 1, 1, N'sample string 2', CAST(N'2017-10-16 18:02:53.600' AS DateTime), CAST(N'2017-10-16 18:02:53.903' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1003, 1, 1, 1, 1, N'sample string 2', CAST(N'2017-10-16 18:03:08.647' AS DateTime), CAST(N'2017-10-16 18:03:08.887' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1004, 13, 7, 5, 6, N'Hhh', CAST(N'2017-10-17 18:12:42.407' AS DateTime), CAST(N'2017-10-17 18:12:42.760' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1005, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171811591173_IMG-20171013-WA0006.jpg', CAST(N'2017-10-17 18:12:49.653' AS DateTime), CAST(N'2017-10-17 18:12:49.910' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1006, 13, 7, 5, 5, N'Hhhh', CAST(N'2017-10-17 18:21:49.860' AS DateTime), CAST(N'2017-10-17 18:21:50.053' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1007, 13, 7, 5, 6, N'Hhhhh', CAST(N'2017-10-17 18:22:07.033' AS DateTime), CAST(N'2017-10-17 18:22:07.293' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1008, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171821357343_Screenshot_2017-09-10-18-55-38-102_com.whatsapp.png', CAST(N'2017-10-17 18:22:10.603' AS DateTime), CAST(N'2017-10-17 18:22:10.820' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1009, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:24:24.703' AS DateTime), CAST(N'2017-10-17 18:24:24.703' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1010, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:24:25.010' AS DateTime), CAST(N'2017-10-17 18:24:25.010' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1011, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:24:25.017' AS DateTime), CAST(N'2017-10-17 18:24:25.017' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1012, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:24:43.177' AS DateTime), CAST(N'2017-10-17 18:24:43.403' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1013, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:24:47.287' AS DateTime), CAST(N'2017-10-17 18:24:47.493' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1014, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:24:50.810' AS DateTime), CAST(N'2017-10-17 18:24:51.020' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1015, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:25:32.297' AS DateTime), CAST(N'2017-10-17 18:25:32.540' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1016, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:25:36.007' AS DateTime), CAST(N'2017-10-17 18:25:36.213' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1017, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:25:41.900' AS DateTime), CAST(N'2017-10-17 18:25:42.157' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1018, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:29:38.647' AS DateTime), CAST(N'2017-10-17 18:29:38.953' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1019, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:29:49.490' AS DateTime), CAST(N'2017-10-17 18:29:49.803' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1020, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:29:55.430' AS DateTime), CAST(N'2017-10-17 18:29:55.697' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1021, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:34:08.867' AS DateTime), CAST(N'2017-10-17 18:34:09.117' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1022, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:34:16.857' AS DateTime), CAST(N'2017-10-17 18:34:17.157' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1023, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:34:21.840' AS DateTime), CAST(N'2017-10-17 18:34:22.083' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1024, 13, 7, 5, 5, N'Hhh', CAST(N'2017-10-17 18:38:33.883' AS DateTime), CAST(N'2017-10-17 18:38:34.183' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1025, 13, 7, 5, 6, N'Hhhhhh', CAST(N'2017-10-17 18:38:45.633' AS DateTime), CAST(N'2017-10-17 18:38:45.633' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1026, 13, 7, 5, 7, N'http://192.168.0.13:80/SalesApp/Public/201710171824181796_Screenshot_2017-08-25-21-40-48-736_com.supercell.clashofclans.png', CAST(N'2017-10-17 18:38:45.667' AS DateTime), CAST(N'2017-10-17 18:38:45.667' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1027, 14, 8, 6, 10, N'Sachin', CAST(N'2017-10-27 03:32:33.857' AS DateTime), CAST(N'2017-10-27 03:32:33.857' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1028, 14, 8, 6, 11, N'Bxhxhxg', CAST(N'2017-10-27 03:32:33.860' AS DateTime), CAST(N'2017-10-27 03:32:33.860' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1029, 14, 8, 6, 12, N'24257', CAST(N'2017-10-27 03:32:33.863' AS DateTime), CAST(N'2017-10-27 03:32:33.863' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1030, 14, 8, 6, 13, N'True', CAST(N'2017-10-27 03:32:33.863' AS DateTime), CAST(N'2017-10-27 03:32:33.863' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1031, 14, 8, 6, 14, N'second', CAST(N'2017-10-27 03:32:33.867' AS DateTime), CAST(N'2017-10-27 03:32:33.867' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1032, 14, 8, 6, 15, N'http://192.168.0.3:80/SalesApp/Public/201710270328428487_IMG-20171026-WA0000.jpg', CAST(N'2017-10-27 03:32:33.870' AS DateTime), CAST(N'2017-10-27 03:32:33.870' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1033, 14, 8, 6, 16, N'2017-10-26T18:30:00.000Z', CAST(N'2017-10-27 03:32:33.873' AS DateTime), CAST(N'2017-10-27 03:32:33.873' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1034, 14, 8, 6, 18, N'http://goo.gl/TkGr5s', CAST(N'2017-10-27 03:32:33.877' AS DateTime), CAST(N'2017-10-27 03:32:33.877' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1035, 14, 8, 6, 10, N'Sachin dady', CAST(N'2017-10-27 03:34:38.717' AS DateTime), CAST(N'2017-10-27 03:34:38.717' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1036, 14, 8, 6, 11, N'Bxhxhxg', CAST(N'2017-10-27 03:34:38.727' AS DateTime), CAST(N'2017-10-27 03:34:38.727' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1037, 14, 8, 6, 12, N'24257', CAST(N'2017-10-27 03:34:38.730' AS DateTime), CAST(N'2017-10-27 03:34:38.730' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1038, 14, 8, 6, 13, N'True', CAST(N'2017-10-27 03:34:38.730' AS DateTime), CAST(N'2017-10-27 03:34:38.730' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1039, 14, 8, 6, 14, N'second', CAST(N'2017-10-27 03:34:38.733' AS DateTime), CAST(N'2017-10-27 03:34:38.733' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1040, 14, 8, 6, 15, N'http://192.168.0.3:80/SalesApp/Public/201710270037076199_IMG-20171025-WA0007.jpg', CAST(N'2017-10-27 03:34:38.737' AS DateTime), CAST(N'2017-10-27 03:34:38.737' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1041, 14, 8, 6, 16, N'2017-10-26T18:30:00.000Z', CAST(N'2017-10-27 03:34:38.737' AS DateTime), CAST(N'2017-10-27 03:34:38.737' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1042, 14, 8, 6, 18, N'http://goo.gl/TkGr5s', CAST(N'2017-10-27 03:34:38.737' AS DateTime), CAST(N'2017-10-27 03:34:38.737' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1043, 14, 8, 6, 10, N'Sachinpapa', CAST(N'2017-10-27 03:33:15.727' AS DateTime), CAST(N'2017-10-27 03:33:15.727' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1044, 14, 8, 6, 11, N'Bxhxhxg', CAST(N'2017-10-27 03:33:15.730' AS DateTime), CAST(N'2017-10-27 03:33:15.730' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1045, 14, 8, 6, 12, N'24257', CAST(N'2017-10-27 03:33:15.730' AS DateTime), CAST(N'2017-10-27 03:33:15.730' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1046, 14, 8, 6, 13, N'True', CAST(N'2017-10-27 03:33:15.733' AS DateTime), CAST(N'2017-10-27 03:33:15.733' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1047, 14, 8, 6, 14, N'second', CAST(N'2017-10-27 03:33:15.737' AS DateTime), CAST(N'2017-10-27 03:33:15.737' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1048, 14, 8, 6, 15, N'http://192.168.0.3:80/SalesApp/Public/201710270037076199_IMG-20171025-WA0007.jpg', CAST(N'2017-10-27 03:33:15.737' AS DateTime), CAST(N'2017-10-27 03:33:15.737' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1049, 14, 8, 6, 16, N'2017-10-26T18:30:00.000Z', CAST(N'2017-10-27 03:33:15.740' AS DateTime), CAST(N'2017-10-27 03:33:15.740' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1050, 14, 8, 6, 18, N'http://goo.gl/TkGr5s', CAST(N'2017-10-27 03:33:15.743' AS DateTime), CAST(N'2017-10-27 03:33:15.743' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1051, 14, 8, 6, 10, N'New entry', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1052, 14, 8, 6, 11, N'Dghdhdh', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1053, 14, 8, 6, 12, N'558', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1054, 14, 8, 6, 13, N'True', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1055, 14, 8, 6, 14, N'first', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1056, 14, 8, 6, 15, N'http://192.168.0.3:80/SalesApp/Public/201710270343438953_IMG-20171026-WA0002.jpg', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1057, 14, 8, 6, 16, N'2017-10-24T18:30:00.000Z', CAST(N'2017-10-27 03:43:59.920' AS DateTime), CAST(N'2017-10-27 03:43:59.920' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1058, 14, 8, 6, 10, N'Sachin pat', CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.310' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1059, 14, 8, 6, 11, N'Gsgdggs', CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.313' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1060, 14, 8, 6, 12, N'555', CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.313' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1061, 14, 8, 6, 13, NULL, CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.317' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1062, 14, 8, 6, 14, NULL, CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.317' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1063, 14, 8, 6, 15, NULL, CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.320' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1064, 14, 8, 6, 16, N'1970-01-01T00:00:00.000Z', CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.320' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1065, 14, 8, 6, 17, NULL, CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.323' AS DateTime), NULL)
INSERT [dbo].[FormsAnswers] ([Id], [PlaceId], [UserId], [FormId], [FormsQuestionId], [Answer], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1066, 14, 8, 6, 18, NULL, CAST(N'2017-10-27 03:49:10.187' AS DateTime), CAST(N'2017-10-27 03:49:35.323' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FormsAnswers] OFF
SET IDENTITY_INSERT [dbo].[FormsQuestionFields] ON 

INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (1, 1, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(N'2017-09-25 18:20:38.990' AS DateTime), CAST(N'2017-09-25 18:20:39.263' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (2, 1, N'Test Question 1', 1, 2, N'Male/FeMale', CAST(N'2017-09-25 18:22:00.310' AS DateTime), CAST(N'2017-09-25 18:22:00.623' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (3, 3, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(N'2017-09-25 18:45:48.540' AS DateTime), CAST(N'2017-09-25 18:45:48.540' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (4, 4, N'Test Question 1', 1, 1, N'Male/FeMale', CAST(N'2017-09-25 18:54:10.680' AS DateTime), CAST(N'2017-09-25 18:54:10.680' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (5, 5, N'jaklfjalfjasdlfjdklfj', 0, 1, NULL, CAST(N'2017-10-17 18:10:45.553' AS DateTime), CAST(N'2017-10-17 18:10:45.553' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (6, 5, N'dfjklsadfjaslfjasdlfjasdlf', 0, 2, NULL, CAST(N'2017-10-17 18:10:45.570' AS DateTime), CAST(N'2017-10-17 18:10:45.570' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (7, 5, N'photo', 1, 4, NULL, CAST(N'2017-10-17 18:10:45.573' AS DateTime), CAST(N'2017-10-17 18:10:45.573' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (8, 5, N'kjlksafjlasdjfasdlfjasflkj', 0, 9, NULL, CAST(N'2017-10-17 18:10:45.573' AS DateTime), CAST(N'2017-10-17 18:10:45.573' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (9, 5, N'jkjakhasdfjkhasdjkfhasdfh', 0, 10, NULL, CAST(N'2017-10-17 18:10:45.577' AS DateTime), CAST(N'2017-10-17 18:10:45.577' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (10, 6, N'text box', 1, 1, NULL, CAST(N'2017-10-27 00:36:27.567' AS DateTime), CAST(N'2017-10-27 00:36:27.567' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (11, 6, N'long text', 0, 2, NULL, CAST(N'2017-10-27 00:36:27.583' AS DateTime), CAST(N'2017-10-27 00:36:27.583' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (12, 6, N'numeric', 0, 9, NULL, CAST(N'2017-10-27 00:36:27.587' AS DateTime), CAST(N'2017-10-27 00:36:27.587' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (13, 6, N'yes no', 0, 5, NULL, CAST(N'2017-10-27 00:36:27.587' AS DateTime), CAST(N'2017-10-27 00:36:27.587' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (14, 6, N'new selection field', 0, 6, N'first,second', CAST(N'2017-10-27 00:36:27.590' AS DateTime), CAST(N'2017-10-27 00:36:27.590' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (15, 6, N'photofield', 0, 4, NULL, CAST(N'2017-10-27 00:36:27.597' AS DateTime), CAST(N'2017-10-27 00:36:27.597' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (16, 6, N'date field', 1, 3, NULL, CAST(N'2017-10-27 00:36:27.597' AS DateTime), CAST(N'2017-10-27 00:36:27.597' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (17, 6, N'bar selected from selection bar', 0, 7, NULL, CAST(N'2017-10-27 00:36:27.600' AS DateTime), CAST(N'2017-10-27 00:36:27.600' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (18, 6, N'barcode', 1, 10, NULL, CAST(N'2017-10-27 00:36:27.603' AS DateTime), CAST(N'2017-10-27 00:36:27.603' AS DateTime), NULL)
INSERT [dbo].[FormsQuestionFields] ([Id], [FormId], [Question], [IsMandatory], [InputFieldsId], [ListOptions], [CreatedDate], [ModefiedDate], [CreatedBy]) VALUES (19, 6, N'new product', 0, 0, NULL, CAST(N'2017-10-27 00:36:27.607' AS DateTime), CAST(N'2017-10-27 00:36:27.607' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FormsQuestionFields] OFF
SET IDENTITY_INSERT [dbo].[FormsVisibleOnTheseReps] ON 

INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (1, 2, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (2, 3, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (3, 4, 1, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (4, 5, 7, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (5, 5, 2, NULL, NULL)
INSERT [dbo].[FormsVisibleOnTheseReps] ([Id], [CustomFormsId], [UserId], [CreatedDate], [CreatedBy]) VALUES (6, 6, 8, NULL, NULL)
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

INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, 6, N'Testing For Notes', 4, CAST(N'2017-10-07 20:35:30.783' AS DateTime), CAST(N'2017-10-07 20:35:31.017' AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 13, N'Hello dear', 7, CAST(N'2017-10-17 18:05:40.137' AS DateTime), CAST(N'2017-10-17 18:05:40.137' AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (3, 13, N'Hi iiiiii', 7, CAST(N'2017-10-17 18:06:18.240' AS DateTime), CAST(N'2017-10-17 18:06:19.123' AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, 14, N'Take a new note', 8, CAST(N'2017-10-27 00:13:13.227' AS DateTime), CAST(N'2017-10-27 00:13:13.227' AS DateTime), NULL)
INSERT [dbo].[NotesActivities] ([Id], [PlaceId], [Note], [UserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, 14, N'Take a note gdgdggd', 8, CAST(N'2017-10-27 00:17:27.967' AS DateTime), CAST(N'2017-10-27 00:17:27.970' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[NotesActivities] OFF
SET IDENTITY_INSERT [dbo].[PhotoActivities] ON 

INSERT [dbo].[PhotoActivities] ([Id], [PhotoUrl], [Tags], [PlaceId], [UserId], [Note], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (4, N'Public/201710171744203585_Screenshot_2017-10-02-07-54-46-615_com.whatsapp.png', NULL, 13, 7, N'Hello', CAST(N'2017-10-17 17:44:38.907' AS DateTime), CAST(N'2017-10-17 17:44:39.627' AS DateTime), NULL)
INSERT [dbo].[PhotoActivities] ([Id], [PhotoUrl], [Tags], [PlaceId], [UserId], [Note], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, N'Public/201710171804174789_IMG-20171017-WA0013.jpg', N'Hh', 13, 7, N'H', CAST(N'2017-10-17 18:04:32.410' AS DateTime), CAST(N'2017-10-17 18:04:32.410' AS DateTime), NULL)
INSERT [dbo].[PhotoActivities] ([Id], [PhotoUrl], [Tags], [PlaceId], [UserId], [Note], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (6, N'Public/201710270008110026_IMG-20171025-WA0007.jpg', NULL, 14, 8, N'Good for health', CAST(N'2017-10-27 00:08:22.900' AS DateTime), CAST(N'2017-10-27 00:08:22.900' AS DateTime), NULL)
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
INSERT [dbo].[PlacesDetails] ([Id], [Name], [IsActive], [Address], [State], [PostalCode], [Country], [CountryCode], [Note], [Website], [PhotoUrl], [PlaceId], [Latitude], [Longitude], [Tags], [CreatedDate], [CreatedBy]) VALUES (14, N'Arisia Township', 1, N'Niranjanpur - Kabit Khedi, Bulandshahr, Scheme Number 136, Indore', N'', N'', N'', N'', N'', N'', NULL, N'ChIJ2cekHMcCYzkRqfG4Ln5VtEA', CAST(22.7750943 AS Decimal(9, 7)), CAST(75.8845585 AS Decimal(9, 7)), N'', CAST(N'2017-10-27 00:07:52.110' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PlacesDetails] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (1, N'Admin', NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (2, N'Representative', NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Role], [CreatedDate], [CreatedBy]) VALUES (3, N'SuperAdmin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UseActivitiesComments] ON 

INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (1, 1, N'Testing User Comments By Mr. RituRaj Pandey', 3, CAST(N'2017-10-07 13:08:11.377' AS DateTime), CAST(N'2017-10-07 13:08:11.590' AS DateTime), NULL)
INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (2, 1, N'This is testing acvitiy for useer', 3, CAST(N'2017-10-07 14:38:50.937' AS DateTime), CAST(N'2017-10-07 14:38:50.937' AS DateTime), NULL)
INSERT [dbo].[UseActivitiesComments] ([CommentId], [UsersActivitiesId], [UserComment], [CommentByUserId], [CreatedDate], [ModifiedDate], [CreatedBy]) VALUES (5, 1, N'This is testing acvitiy for useer', 4, CAST(N'2017-10-07 18:58:59.960' AS DateTime), CAST(N'2017-10-07 18:59:00.193' AS DateTime), NULL)
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
INSERT [dbo].[UserAssignedPlaces] ([Id], [UserId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (16, 8, 14, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAssignedPlaces] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (1, N'Sachin', N'sachin.patidar4@gmail.com', N'12342323', N'English', N'ii', 1, 1, N'123456', N'klasdf', N'Public/201708262227189504_IMG_20170826_131246.jpg', 1, N'patidar', N'sachin.patidar4@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (2, N'RituRaj', N'rituraj.pandey786@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Pandey', N'rituraj.pandey786@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (3, N'Ashwini', N'ashwini.bokade@yahoo.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Bokade', N'ashwini.bokade@yahoo.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (4, N'Rohan', N'rohan.trivedi341@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Trivedi', N'rohan.trivedi341@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (5, N'Ashish', N'sharma.ashish788@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Sharma', N'sharma.ashish788@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (6, N'Deepak', N'Deepak.yogi227@gmail.com', N'9926373732', N'English', N'ii', 1, 1, N'123456', N'Testing User', N'Public/201708262227189504_IMG_20170826_131246.jpg', 2, N'Yogi', N'deepak.yogi227@gmail.com', N'452010', N'India', N'Mp', N'klasdjflaskjdf', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (7, N'amj', N'amj@gmail.com', N'12121212', N'en', N'asdfasdf', 1, 1, N'123456', N'asdfadsfasdfasdf', N'./images/no_avatar_putnik.png', 2, N'amj', N'123456', N'', N'_', N'_', N'_', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [Email], [Phone], [Language], [Teritory], [IsActive], [CompanyId], [Password], [Note], [PhotoUrl], [RoleId], [LastName], [UserName], [PostalCode], [Country], [City], [Address], [CreatedById], [CreatedDate]) VALUES (8, N'newrep', N'mail@mail.com', N'3232323', N'en', N'asdklfj', 1, 1, N'123456', N'sdfsfsfsdfsdfsdf', N'Public/201710270006257445_Lighthouse.jpg', 2, N'newrep', N'TCSuser', N'', N'_', N'_', N'_', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersActivities] ON 

INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (1, 1, 1, N'', NULL, N'', CAST(0.00 AS Decimal(6, 2)), 0, NULL, 6, CAST(N'2017-01-10 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (2, 2, 1, N'', NULL, N'', CAST(0.00 AS Decimal(6, 2)), 0, NULL, 6, CAST(N'2017-02-10 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (3, 3, 7, N'Public/201710171744203585_Screenshot_2017-10-02-07-54-46-615_com.whatsapp.png', N'Hello', NULL, NULL, NULL, NULL, 13, CAST(N'2017-03-10 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (4, 3, 7, N'Public/201710171804174789_IMG-20171017-WA0013.jpg', N'H', NULL, NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (5, 4, 7, N'', N'Hello dear', NULL, NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (6, 4, 7, N'', N'Hi iiiiii', NULL, NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (7, 5, 7, N'', N'', N'new forms', NULL, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (8, 3, 8, N'Public/201710270008110026_IMG-20171025-WA0007.jpg', N'Good for health', NULL, NULL, NULL, NULL, 14, CAST(N'2017-10-27 00:08:22.900' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (9, 4, 8, N'', N'Take a new note', NULL, NULL, NULL, NULL, 14, CAST(N'2017-10-27 00:13:13.227' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (10, 4, 8, N'', N'Take a note gdgdggd', NULL, NULL, NULL, NULL, 14, CAST(N'2017-10-27 00:17:27.967' AS DateTime), NULL)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (11, 5, 8, N'', N'', N'new form for 8', NULL, NULL, 6, 14, CAST(N'2017-10-27 00:40:22.653' AS DateTime), 8)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (12, 5, 8, N'', N'', N'new form for 8', NULL, NULL, 6, 14, CAST(N'2017-10-27 02:38:20.647' AS DateTime), 8)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (13, 5, 8, N'', N'', N'new form for 8', NULL, NULL, 6, 14, CAST(N'2017-10-27 02:38:26.407' AS DateTime), 8)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (14, 5, 8, N'', N'', N'new form for 8', NULL, NULL, 6, 14, CAST(N'2017-10-27 03:43:59.920' AS DateTime), 8)
INSERT [dbo].[UsersActivities] ([Id], [ActivityId], [UserId], [PhotoUrl], [Note], [FormName], [OrderCost], [AuditItems], [FormId], [PlaceId], [CreatedDate], [CreatedBy]) VALUES (15, 5, 8, N'', N'', N'new form for 8', NULL, NULL, 6, 14, CAST(N'2017-10-27 03:49:10.187' AS DateTime), 8)
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
/****** Object:  StoredProcedure [dbo].[GetAllPlacesInfo]    Script Date: 10/27/2017 11:27:54 AM ******/
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
