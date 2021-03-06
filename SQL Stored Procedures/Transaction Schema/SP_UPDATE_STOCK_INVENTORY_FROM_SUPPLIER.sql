USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Trans].[SP_UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]    Script Date: 01/20/2017 10:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE STOCK ITEM IN INVENTORY FROM SUPPLIER 
01/18/2017
Russel Vasquez
*/

ALTER PROC [Trans].[SP_UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]
@ITEMCODE nvarchar(10),
@QTY float
AS
BEGIN

UPDATE master.Inventory_Data
SET InStock = InStock + @QTY, 
RunningStock = RunningStock + @QTY, dateUpdate=GETDATE()
WHERE ItemCode=@ITEMCODE

END