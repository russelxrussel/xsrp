USE [srpedroDB]
GO

/* User query for Location List 
01/23/2017
*/

ALTER PROC [Util].[SP_GET_LOCATION_LIST]
AS
BEGIN

 SELECT *
 FROM Util.Item_Location_RF

END