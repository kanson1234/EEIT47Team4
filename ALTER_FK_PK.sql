USE [AAA]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 2022/7/30 ¤U¤È 03:44:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationSystem_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [FK_EvaluationSystem_Customer]
GO

ALTER TABLE [dbo].[EvaluationSystem]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationSystem_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[EvaluationSystem] CHECK CONSTRAINT [FK_EvaluationSystem_StoreHouse]
GO
----------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Customer] FOREIGN KEY([C_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Customer]
GO

ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Retailer] FOREIGN KEY([C_Id])
REFERENCES [dbo].[Retailer] ([C2_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Retailer]
GO

ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_StoreHouse]
GO

----------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD  CONSTRAINT [FK_ShopCar_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[ShopCar] CHECK CONSTRAINT [FK_ShopCar_Customer]
GO

ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD  CONSTRAINT [FK_ShopCar_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[ShopCar] CHECK CONSTRAINT [FK_ShopCar_StoreHouse]
GO

----------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingRecord_Customer] FOREIGN KEY([C1_Id])
REFERENCES [dbo].[Customer] ([C1_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [FK_ShoppingRecord_Customer]
GO

ALTER TABLE [dbo].[ShoppingRecord]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingRecord_StoreHouse] FOREIGN KEY([SH_Item_Id])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[ShoppingRecord] CHECK CONSTRAINT [FK_ShoppingRecord_StoreHouse]
GO

----------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[C2_SH]  WITH CHECK ADD  CONSTRAINT [FK_C2_SH_Retailer] FOREIGN KEY([C2_ID])
REFERENCES [dbo].[Retailer] ([C2_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[C2_SH] CHECK CONSTRAINT [FK_C2_SH_Retailer]
GO

ALTER TABLE [dbo].[C2_SH]  WITH CHECK ADD  CONSTRAINT [FK_C2_SH_StoreHouse] FOREIGN KEY([SH_Item_ID])
REFERENCES [dbo].[StoreHouse] ([SH_Item_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[C2_SH] CHECK CONSTRAINT [FK_C2_SH_StoreHouse]
GO
--End-------------------------------------------------------------------------------------------------------------------------------------------
