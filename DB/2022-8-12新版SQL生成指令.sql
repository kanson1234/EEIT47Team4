USE [EEIT47Group4]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[A1_id] [int] IDENTITY(1,1) NOT NULL,
	[A1_FirstName] [nvarchar](50) NOT NULL,
	[A1_LastName] [nvarchar](50) NOT NULL,
	[A1_Account] [nvarchar](50) NOT NULL,
	[A1_Pwd] [nvarchar](50) NOT NULL,
	[A1_Phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[A1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Admin] UNIQUE NONCLUSTERED 
(
	[A1_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classify_Category]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classify_Category](
	[SH_Classify_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C1_Id] [int] IDENTITY(2000000,1) NOT NULL,
	[C1_FirstName] [nvarchar](50) NOT NULL,
	[C1_LastName] [nvarchar](50) NOT NULL,
	[C1_Account] [nvarchar](50) NOT NULL,
	[C1_Pwd] [nvarchar](50) NULL,
	[C1_Img] [varbinary](max) NULL,
	[C1_Data] [datetime2](7) NOT NULL,
	[C1_BirthDay] [datetime2](7) NOT NULL,
	[C1_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C1_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Customer] UNIQUE NONCLUSTERED 
(
	[C1_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailRecord]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailRecord](
	[ER_EmailId] [int] IDENTITY(1,1) NOT NULL,
	[ER_Context] [nvarchar](max) NOT NULL,
	[ER_Time] [datetime2](7) NOT NULL,
	[ER_R_Id] [int] NOT NULL,
	[ER_S_Id] [int] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[ER_EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationSystem]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationSystem](
	[ES_id] [int] IDENTITY(1,1) NOT NULL,
	[ES_Date] [datetime2](7) NOT NULL,
	[ES_Star] [int] NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
	[ES_Context] [nvarchar](max) NULL,
 CONSTRAINT [PK_EvaluationSystem] PRIMARY KEY CLUSTERED 
(
	[ES_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Msg_Message_Id] [int] IDENTITY(1,1) NOT NULL,
	[Msg_Context] [nvarchar](max) NOT NULL,
	[Msg_Time] [datetime2](7) NOT NULL,
	[Msg_State] [bit] NOT NULL,
	[Msg_C1C2_Status] [bit] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
	[CS_Id] [int] NOT NULL,
	[CR_Id] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Msg_Message_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retailer]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retailer](
	[C2_Id] [int] IDENTITY(1000000,1) NOT NULL,
	[C2_Name] [nvarchar](50) NOT NULL,
	[C2_Account] [nvarchar](50) NOT NULL,
	[C2_Pwd] [nvarchar](50) NOT NULL,
	[C2_Phone] [nvarchar](11) NOT NULL,
	[C2_Date] [datetime2](7) NOT NULL,
	[C2_State] [bit] NOT NULL,
	[C2_info] [nvarchar](max) NULL,
	[C2_logo] [varbinary](255) NULL,
	[C2_photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Retailer] PRIMARY KEY CLUSTERED 
(
	[C2_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Retailer] UNIQUE NONCLUSTERED 
(
	[C2_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopingCar]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopingCar](
	[SC_Id] [int] IDENTITY(1,1) NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
	[SC_Count] [int] NOT NULL,
 CONSTRAINT [PK_ShopCar] PRIMARY KEY CLUSTERED 
(
	[SC_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingRecord]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingRecord](
	[SR_ShoppingRecord_Id] [int] IDENTITY(1,1) NOT NULL,
	[SR_Time] [datetime2](7) NOT NULL,
	[SR_State] [bit] NOT NULL,
	[SR_Count] [int] NOT NULL,
	[C1_Id] [int] NOT NULL,
	[SH_Item_Id] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingRecord] PRIMARY KEY CLUSTERED 
(
	[SR_ShoppingRecord_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreHouse]    Script Date: 2022/8/12 下午 02:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreHouse](
	[SH_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[SH_ItemName] [nvarchar](50) NOT NULL,
	[SH_Img] [varbinary](max) NULL,
	[SH_Price] [money] NOT NULL,
	[SH_Classify] [nvarchar](50) NULL,
	[SH_State] [bit] NOT NULL,
	[SH_Date] [datetime2](7) NOT NULL,
	[C2_Id] [int] NOT NULL,
 CONSTRAINT [PK_StoreHouse] PRIMARY KEY CLUSTERED 
(
	[SH_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_C1_Data]  DEFAULT (getdate()) FOR [C1_Data]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_C1_Status]  DEFAULT ((1)) FOR [C1_Status]
GO
ALTER TABLE [dbo].[EvaluationSystem] ADD  CONSTRAINT [DF_EvaluationSystem_ES_Date]  DEFAULT (getdate()) FOR [ES_Date]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Msg_Time]  DEFAULT (getdate()) FOR [Msg_Time]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Msg_State]  DEFAULT ((1)) FOR [Msg_State]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Msg_C1C2_Status]  DEFAULT ((0)) FOR [Msg_C1C2_Status]
GO
ALTER TABLE [dbo].[Retailer] ADD  CONSTRAINT [DF_Retailer_C2_Date]  DEFAULT (getdate()) FOR [C2_Date]
GO
ALTER TABLE [dbo].[Retailer] ADD  CONSTRAINT [DF_Retailer_C2_State]  DEFAULT ((1)) FOR [C2_State]
GO
ALTER TABLE [dbo].[ShopingCar] ADD  CONSTRAINT [DF_ShopCar_SC_Count]  DEFAULT ((1)) FOR [SC_Count]
GO
ALTER TABLE [dbo].[ShoppingRecord] ADD  CONSTRAINT [DF_ShoppingRecord_SR_Time]  DEFAULT (getdate()) FOR [SR_Time]
GO
ALTER TABLE [dbo].[ShoppingRecord] ADD  CONSTRAINT [DF_ShoppingRecord_SR_State]  DEFAULT ((1)) FOR [SR_State]
GO
ALTER TABLE [dbo].[StoreHouse] ADD  CONSTRAINT [DF_StoreHouse_SH_State]  DEFAULT ((1)) FOR [SH_State]
GO
ALTER TABLE [dbo].[StoreHouse] ADD  CONSTRAINT [DF_StoreHouse_SH_Date]  DEFAULT (getdate()) FOR [SH_Date]
GO
ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationSystem_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
GO
ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [FK_EvaluationSystem_Customer]
GO
ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationSystem_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
GO
ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [FK_EvaluationSystem_StoreHouse]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_StoreHouse]
GO
ALTER TABLE [dbo].[ShopingCar]  WITH CHECK ADD  CONSTRAINT [FK_ShopCar_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
GO
ALTER TABLE [dbo].[ShopingCar] CHECK CONSTRAINT [FK_ShopCar_Customer]
GO
ALTER TABLE [dbo].[ShopingCar]  WITH CHECK ADD  CONSTRAINT [FK_ShopCar_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
GO
ALTER TABLE [dbo].[ShopingCar] CHECK CONSTRAINT [FK_ShopCar_StoreHouse]
GO
ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingRecord_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
GO
ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [FK_ShoppingRecord_Customer]
GO
ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingRecord_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
GO
ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [FK_ShoppingRecord_StoreHouse]
GO
ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [FKdl824pkgnc98tn050sljyn9wg] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
GO
ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [FKdl824pkgnc98tn050sljyn9wg]
GO
ALTER TABLE [dbo].[StoreHouse]  WITH CHECK ADD  CONSTRAINT [FK_StoreHouse_Retailer] FOREIGN KEY([C2_Id])
REFERENCES [dbo].[Retailer] ([C2_Id])
GO
ALTER TABLE [dbo].[StoreHouse] CHECK CONSTRAINT [FK_StoreHouse_Retailer]
GO
ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [CK_EvaluationSystem] CHECK  (([ES_Star]>=(0) AND [ES_Star]<=(5)))
GO
ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [CK_EvaluationSystem]
GO
ALTER TABLE [dbo].[Retailer]  WITH CHECK ADD  CONSTRAINT [CK_Retailer] CHECK  (([C2_Id]<(2000000)))
GO
ALTER TABLE [dbo].[Retailer] CHECK CONSTRAINT [CK_Retailer]
GO
ALTER TABLE [dbo].[ShopingCar]  WITH CHECK ADD  CONSTRAINT [CK_ShopCar] CHECK  (([SC_Count]>(0)))
GO
ALTER TABLE [dbo].[ShopingCar] CHECK CONSTRAINT [CK_ShopCar]
GO
ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [CK_ShoppingRecord] CHECK  (([SR_Count]>(0)))
GO
ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [CK_ShoppingRecord]
GO
ALTER TABLE [dbo].[StoreHouse]  WITH CHECK ADD  CONSTRAINT [CK_StoreHouse] CHECK  (([SH_Price]>(0)))
GO
ALTER TABLE [dbo].[StoreHouse] CHECK CONSTRAINT [CK_StoreHouse]
GO
