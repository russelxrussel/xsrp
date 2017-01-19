USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Trans].[SP_INSERT_SUPPLIER_TRANS]    Script Date: 01/19/2017 15:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Supplier Transaction 
01/13/2017
Russel Vasquez
*/

ALTER PROC [Trans].[SP_INSERT_SUPPLIER_TRANS]
@SUPPLIERCODE nvarchar(10),
@DOCUMENTDATE datetime,
@DELIVERYDATE datetime,
@SSNUM nvarchar(10),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

INSERT INTO Trans.Supplier_Hdr(SupplierCode, DocumentDate, DeliveryDate, SSNum, Remarks, UserCode)
VALUES(@SUPPLIERCODE, @DOCUMENTDATE, @DELIVERYDATE,@SSNUM, @REMARKS, @USERCODE)

END