USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Trans].[SP_INSERT_SUPPLIER_TRANS]    Script Date: 01/19/2017 17:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Item Data 
01/19/2017
Russel Vasquez
*/

ALTER PROC [Master].[SP_INSERT_ITEM_INVENTORY]
@ITEMCODE nvarchar(10),
@ITEMNAME nvarchar(150),
@UOMCODE nvarchar(6),
@ITEMPRICE float,
@ITEMSTATUS bit,
@REMARKS nvarchar(255),
@BEGSTOCK float,
@MINIMUMSTOCKLEVEL float,
@USERCODE nvarchar(50),
@PREFIXCODE nvarchar(5)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
--INSERT ON ITEM DATA
INSERT INTO Master.Item_Data(ItemCode,ItemName,UomCode,ItemPrice,ItemStatus,Remarks,UserCode)
VALUES(@ITEMCODE,@ITEMNAME,@UOMCODE,@ITEMPRICE,@ITEMSTATUS,@REMARKS,@USERCODE)

--INSERT ON INVENTORY DATA
INSERT INTO master.Inventory_Data(ItemCode,BegStock,MinimumStockLevel)
VALUES(@ITEMCODE,@BEGSTOCK,@MINIMUMSTOCKLEVEL)

--UPDATE 
EXEC xSys.SP_UPDATE_SERIES_NUMBER @PREFIXCODE
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END