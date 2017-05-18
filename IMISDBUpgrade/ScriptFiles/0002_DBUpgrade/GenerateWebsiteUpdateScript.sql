SET NOCOUNT ON 
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF

DECLARE @sql1 varchar(max);
DECLARE @sql2 varchar(max);
DECLARE @sql3 varchar(max);
DECLARE @sql4 varchar(max);
DECLARE @sql5 varchar(max);
DECLARE @sql6 varchar(max);
DECLARE @sql7 varchar(max);

SET @sql1 = 'SET NOCOUNT ON 
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF-- Grab the blob we''re interested in
DECLARE @xml xml;
SELECT @xml = CAST(CAST(SUBSTRING([Blob], 1, DATALENGTH(Blob)) AS varchar(max)) AS xml)
  FROM [dbo].[DocumentMain]
 WHERE [DocumentVersionKey] = ''';
SET @sql2 = ''' AND [DocumentStatusCode] = 40 AND [DocumentTypeCode] = ''WEB'';
-- Update the desired nodes to the desired values
SET @xml.modify(''declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; replace value of (/w:Website/w:IsDefaultWebsite/text())[1] with "';
SET @sql3 = '"'');
SET @xml.modify(''declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; replace value of (/w:Website/w:SecureWebsiteRootUrl/text())[1] with "';
SET @sql4 = '"'');
SET @xml.modify(''declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; replace value of (/w:Website/w:UseMultipleWebsites/text())[1] with "';
SET @sql5 = '"'');
SET @xml.modify(''declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; replace value of (/w:Website/w:WebsiteRootUrl/text())[1] with "';
SET @sql6 = '"'');
-- Put the updated blob back
UPDATE [dbo].[DocumentMain]
   SET [Blob] = CAST(CAST(@xml AS varchar(max)) AS image)
 WHERE [DocumentVersionKey] = ''';
SET @sql7 = ''' AND [DocumentStatusCode] = 40 AND [DocumentTypeCode] = ''WEB'';
GO
';

SELECT @sql1 + CAST([DocumentVersionKey] as varchar(40)) + 
       @sql2 + CAST(CAST(SUBSTRING(Blob, 1, DATALENGTH(Blob)) AS varchar(max)) AS xml).value( 'declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; (w:Website/w:IsDefaultWebsite)[1]', 'varchar(256)') + 
       @sql3 + CAST(CAST(SUBSTRING(Blob, 1, DATALENGTH(Blob)) AS varchar(max)) AS xml).value( 'declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; (w:Website/w:SecureWebsiteRootUrl)[1]', 'varchar(256)') +  
       @sql4 + CAST(CAST(SUBSTRING(Blob, 1, DATALENGTH(Blob)) AS varchar(max)) AS xml).value( 'declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; (w:Website/w:UseMultipleWebsites)[1]', 'varchar(256)') +  
       @sql5 + CAST(CAST(SUBSTRING(Blob, 1, DATALENGTH(Blob)) AS varchar(max)) AS xml).value( 'declare namespace w="http://schemas.imis.com/2008/01/DataContracts/Website"; (w:Website/w:WebsiteRootUrl)[1]', 'varchar(256)') + 
       @sql6 + CAST([DocumentVersionKey] as varchar(40)) + @sql7
  FROM [dbo].[DocumentMain] 
 WHERE [DocumentStatusCode] = 40 AND [DocumentTypeCode] = 'WEB'
   AND [DocumentVersionKey] IN 
   ('D30229F1-D53B-48D7-99AE-D0CE9FEA621D', -- iMIS Web View (Admin)
   'FBDF17A3-CAE7-4943-B1EB-71B9C0DD65D2', -- Desktop (CS)
   'FAD2FD17-7E27-4C96-BABE-3291ECDE4822', -- Admin Console (CS2)
   '4243D9E2-E91E-468C-97C2-2046D70C1E1A', -- Staff
   '77C6BF57-1505-456C-A3E9-8473532388EA', -- Annual Conference
   'A39D90DD-AFAE-4F98-85E3-EF34FEAF63CC', -- Annual Conference Mobile
   '60B993C6-6608-4D34-89E6-E8CFE0234E3E', -- Donor
   'DEEA0907-2D5E-405C-8EC4-E9794203EADD', -- Member
   'A9EF00FE-F87F-42A6-8150-3F3775861973') -- Member Mobile
