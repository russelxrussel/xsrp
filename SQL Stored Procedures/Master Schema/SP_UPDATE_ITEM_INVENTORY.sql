USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Master].[SP_INSERT_ITEM_INVENTORY]    Script Date: 01/20/2017 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Update Item Data 
01/20/2017
Russel Vasquez
*/

CREATE PROC [Master].[SP_UPDATE_ITEM_INVENTORY]
@ITEMCODE nvarchar(10),
@ITEMNAME nvarchar(150),
@ITEMPRICE float,
@ITEMSTATUS bit,
@REMARKS nvarchar(255),
@MINIMUMSTOCKLEVEL float,
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
--UPDATE ITEM DATA
UPDATE Master.Item_Data
SET ItemName=@ITEMNAME, ItemPrice=@ITEMPRICE,
ItemStatus=@ITEMSTATUS,
Remarks=@REMARKS,DateUpdate=GetDate(),
UserCode=@USERCODE
WHERE ItemCode=@ITEMCODE

--UPDATE INVENTORY DATA
UPDATE master.Inventory_Data
SET MinimumStockLevel=@MINIMUMSTOCKLEVEL
WHERE ItemCode=@ITEMCODE

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END