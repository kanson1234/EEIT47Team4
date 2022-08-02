USE [AAA]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 2022/7/30 ¤U¤È 03:44:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_A1_Date]  DEFAULT (getdate()) FOR [A1_Date]
GO

ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_C1_Data]  DEFAULT (getdate()) FOR [C1_Data]
GO

ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_C1_State]  DEFAULT ((1)) FOR [C1_State]
GO

ALTER TABLE [dbo].[Retailer] ADD  CONSTRAINT [DF_Retailer_C2_Date]  DEFAULT (getdate()) FOR [C2_Date]
GO

ALTER TABLE [dbo].[Retailer] ADD  CONSTRAINT [DF_Retailer_C2_State]  DEFAULT ((1)) FOR [C2_State]
GO

ALTER TABLE [dbo].[Retailer]  WITH CHECK ADD  CONSTRAINT [CK_Retailer] CHECK  (([C2_Id]<(2000000)))
GO

ALTER TABLE [dbo].[StoreHouse] ADD  CONSTRAINT [DF_StoreHouse_SH_State]  DEFAULT ((1)) FOR [SH_State]
GO

ALTER TABLE [dbo].[StoreHouse] ADD  CONSTRAINT [DF_StoreHouse_SH_Date]  DEFAULT (getdate()) FOR [SH_Date]
GO

ALTER TABLE [dbo].[StoreHouse]  WITH CHECK ADD  CONSTRAINT [CK_StoreHouse] CHECK  (([SH_Price]>(0)))
GO

ALTER TABLE [dbo].[StoreHouse] CHECK CONSTRAINT [CK_StoreHouse]
GO

ALTER TABLE [dbo].[EvaluationSystem] ADD  CONSTRAINT [DF_EvaluationSystem_ES_Date]  DEFAULT (getdate()) FOR [ES_Date]
GO

ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [CK_EvaluationSystem] CHECK  (([ES_Start]>=(0) AND [ES_Start]<=(5)))
GO

ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [CK_EvaluationSystem]
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Msg_Time]  DEFAULT (getdate()) FOR [Msg_Time]
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Msg_State]  DEFAULT ((1)) FOR [Msg_State]
GO

ALTER TABLE [dbo].[ShopCar] ADD  CONSTRAINT [DF_ShopCar_Count]  DEFAULT ((1)) FOR [Count]
GO

ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD  CONSTRAINT [CK_ShopCar] CHECK  (([Count]>(0) AND [Count]<(11)))
GO

ALTER TABLE [dbo].[ShopCar] CHECK CONSTRAINT [CK_ShopCar]
GO

ALTER TABLE [dbo].[ShoppingRecord] ADD  CONSTRAINT [DF_ShoppingRecord_SR_Time]  DEFAULT (getdate()) FOR [SR_Time]
GO

ALTER TABLE [dbo].[ShoppingRecord] ADD  CONSTRAINT [DF_ShoppingRecord_SR_State]  DEFAULT ((1)) FOR [SR_State]
GO

--End-------------------------------------------------------------------------------------------------------------------------------------------
