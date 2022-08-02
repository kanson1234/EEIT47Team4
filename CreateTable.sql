USE [AAA]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 2022/7/30 ¤U¤È 03:44:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Admin](
	[A1_id] [int] IDENTITY(-1,-1) NOT NULL,
	[A1_FirstName] [nvarchar](50) NOT NULL,
	[A1_LastName] [nvarchar](50) NOT NULL,
	[A1_Account] [nvarchar](50) NOT NULL,
	[A1_Pwd] [nvarchar](50) NOT NULL,
	[A1_Phone] [nvarchar](10) NOT NULL,
	[A1_Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[A1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*-------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE [dbo].[Customer](
	[C1_Id] [int] IDENTITY(2000000,1) NOT NULL,
	[C1_FirstName] [nvarchar](50) NOT NULL,
	[C1_LastName] [nvarchar](50) NOT NULL,
	[C1_Account] [nvarchar](50) NOT NULL,
	[C1_Pwd] [nvarchar](50) NOT NULL,
	[C1_Data] [datetime2](7) NOT NULL,
	[C1_State] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C1_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*-------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE [dbo].[Retailer](
	[C2_Id] [int] IDENTITY(1000000,1) NOT NULL,
	[C2_FirstName] [nvarchar](50) NOT NULL,
	[C2_LastName] [nvarchar](50) NOT NULL,
	[C2_Account] [nvarchar](50) NOT NULL,
	[C2_Pwd] [nvarchar](50) NOT NULL,
	[C2_Phone] [nvarchar](11) NOT NULL,
	[C2_Date] [datetime2](7) NOT NULL,
	[C2_State] [bit] NOT NULL,
 CONSTRAINT [PK_Retailer] PRIMARY KEY CLUSTERED 
(
	[C2_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*-------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE [dbo].[StoreHouse](
	[SH_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[SH_ItemName] [nvarchar](50) NOT NULL,
	[SH_Img] [varbinary](max) NULL,
	[SH_Price] [money] NOT NULL,
	[SH_Classify] [nvarchar](50) NULL,
	[SH_State] [bit] NOT NULL,
	[SH_Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StoreHouse] PRIMARY KEY CLUSTERED 
(
	[SH_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/*-------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE [dbo].[EvaluationSystem](
	[ES_id] [int] IDENTITY(1,1) NOT NULL,
	[ES_Date] [datetime2](7) NOT NULL,
	[ES_Start] [int] NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
 CONSTRAINT [PK_EvaluationSystem] PRIMARY KEY CLUSTERED 
(
	[ES_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*---------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [dbo].[Message](
	[Msg_Message_Id] [int] IDENTITY(1,1) NOT NULL,
	[Msg_Context] [nvarchar](max) NOT NULL,
	[Msg_Time] [datetime2](7) NOT NULL,
	[Msg_State] [bit] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
	[C_Id] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Msg_Message_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/*------------------------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE [dbo].[ShopCar](
	[Count] [int] NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL
) ON [PRIMARY]
GO

/*---------------------------------------------------------------------------------------------------------*/
CREATE TABLE [dbo].[ShoppingRecord](
	[ShoppingRecord_Id] [int] NOT NULL,
	[SR_Time] [datetime2](7) NOT NULL,
	[SR_State] [bit] NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingRecord] PRIMARY KEY CLUSTERED 
(
	[ShoppingRecord_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*--------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE [dbo].[C2_SH](
	[C2_ID] [int] NOT NULL,
	[SH_Item_ID] [int] NOT NULL,
 CONSTRAINT [PK_C2_SH] PRIMARY KEY CLUSTERED 
(
	[C2_ID] ASC,
	[SH_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--End-------------------------------------------------------------------------------------------------------------------------------------------






