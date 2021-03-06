USE [master]
GO
/****** Object:  Database [SalesApp]    Script Date: 11/8/2017 1:11:33 PM ******/
Go
CREATE DATABASE [SalesApp]
Go
use SalesApp
Go
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
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[CustomForms]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[FormsAnswers]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[FormsQuestionFields]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[FormsVisibleOnTheseReps]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[InputFields]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[NotesActivities]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[PhotoActivities]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[PlacesDetails]    Script Date: 11/8/2017 1:11:33 PM ******/
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
	[PlaceStatus] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[ContactName] [varchar](50) NULL,
	[City] [varchar](50) NULL,
 CONSTRAINT [PK_PlacesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductOrderDetails]    Script Date: 11/8/2017 1:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PlaceId] [int] NULL,
	[OrderPrice] [decimal](10, 2) NULL,
	[ProductId] [int] NULL,
	[ProductPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[TransactionId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_ProductOrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/8/2017 1:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[EAN] [varchar](100) NULL,
	[DefaultPrice] [decimal](10, 2) NULL,
	[Note] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[AdminId] [int] NOT NULL,
	[Tags] [varchar](50) NULL,
	[ProductGroupId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductsGroup]    Script Date: 11/8/2017 1:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductsGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayCode] [varchar](50) NOT NULL,
	[AdminId] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductsGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTransaction]    Script Date: 11/8/2017 1:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[TotalAmountPayable] [decimal](10, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NOT NULL,
	[TaxPercentage] [decimal](5, 2) NOT NULL,
	[DueDays] [int] NULL,
	[Signature] [varchar](200) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_ProductTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[SalesAppLogInfo]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[UseActivitiesComments]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[UserAssignedPlaces]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/8/2017 1:11:33 PM ******/
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
/****** Object:  Table [dbo].[UsersActivities]    Script Date: 11/8/2017 1:11:33 PM ******/
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
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_PlacesDetails] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[PlacesDetails] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_PlacesDetails]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_Products]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_ProductTransaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[ProductTransaction] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_ProductTransaction]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductsGroup] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductsGroup] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductsGroup]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[ProductsGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductsGroup_Users] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductsGroup] CHECK CONSTRAINT [FK_ProductsGroup_Users]
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
/****** Object:  StoredProcedure [dbo].[GetAllPlacesInfo]    Script Date: 11/8/2017 1:11:33 PM ******/
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
