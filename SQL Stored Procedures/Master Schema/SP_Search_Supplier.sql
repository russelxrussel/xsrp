USE [srpedroDB]
GO
/****** Object:  StoredProcedure [Master].[SP_Search_Supplier]    Script Date: 01/16/2017 16:22:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* User query for searching Supplier List 
01/05/2017
*/

ALTER PROC [Master].[SP_Search_Supplier]
@SUPPLIERNAME nvarchar(50)
AS
BEGIN

 SELECT TOP 10 SupplierName, SupplierCode
 FROM Master.Supplier_Data 
 WHERE SupplierName like '%' + @SUPPLIERNAME + '%'
 ORDER BY SupplierName ASC

END