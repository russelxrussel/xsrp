USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Trans].[SP_INSERT_SUPPLIER_TRANS_ROWS]    Script Date: 01/19/2017 15:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Supplier Transaction 
01/16/2017
Russel Vasquez
*/

ALTER PROC [Trans].[SP_INSERT_SUPPLIER_TRANS_ROWS]
@SUPPLIERCODE nvarchar(10),
@SSNUM nvarchar(10),
@ITEMCODE nvarchar(10),
@ITEMQTY float,
@ITEMPRICE float,
@UOM nvarchar(5),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO Trans.Supplier_Rows(SupplierCode, SSNum, ItemCode, ItemQty, ItemPrice, UOM, UserCode)
	VALUES(@SUPPLIERCODE, @SSNUM, @ITEMCODE,@ITEMQTY, @ITEMPRICE,@UOM, @USERCODE)
	
	--UPDATE STOCK INVENTORY
	EXEC Trans.SP_UPDATE_STOCK_INVENTORY_FROM_SUPPLIER @ITEMCODE,@ITEMQTY

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END