USE [srpedroDB]
GO

/* User query for Location List 
01/23/2017
*/

CREATE PROC [Util].[SP_GET_LOCATION_LIST]
AS
BEGIN

 SELECT *
 FROM Util.Location_RF

END