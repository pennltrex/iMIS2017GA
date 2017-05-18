----------------------------------------------------------------------------------------
-- This script is to allow modifying document-system related data AFTER all the new
-- and updated documents have been loaded, but prior to restoring FK constraints, etc.
----------------------------------------------------------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script

-------------------------------------------------------
-- PBI 38854 - Rename Content Management terminology 
-------------------------------------------------------
-- Remove unneeded Web Content Management navigation item
EXEC dbo.asi_DocumentDelete '4C5A8083-E6C6-4F7C-8C82-499E4C015391', 1
EXEC dbo.asi_DocumentDelete 'B7C49390-D19B-4024-821D-B765DD5258A8', 1
EXEC dbo.asi_DocumentDelete '5EB6E52D-6F33-4D51-9BBE-1C82801B84B3', 1
GO

-------------------------------------------------------------------------------------
-- PBI 38329 - BUG: ObjectBrowser not reflecting name change on queries and folders
-------------------------------------------------------------------------------------
-- Remove the (unused) alternate name on queries and folders
UPDATE [dbo].[DocumentMain]
   SET [AlternateName] = NULL
 WHERE [DocumentTypeCode] = 'IQD'
    AND [AlternateName] IS NOT NULL
 
UPDATE [dbo].[DocumentMain]
   SET [AlternateName] = NULL
 WHERE [DocumentTypeCode] = 'FOL'
    AND [AlternateName] IS NOT NULL

-------------------------------------------------------
-- PBI 39251 - iMIS Communities2 Document Library Bug 
-------------------------------------------------------
-- Stop using AlternateName for uploaded Communities2 documents
UPDATE [dbo].[DocumentMain]
   SET [AlternateName] = NULL
 WHERE [DocumentTypeCode] IN ('AVI', 'BMP', 'DOC','EML', 'FLV', 'GIF', 'HTM', 'JPE', 'JPG','MOV', 'MP3', 'MPG',
                              'PDF', 'PNG', 'PPT','RA', 'RAM', 'RDL', 'RPT', 'RTL', 'TIF','TXT', 'WAV', 'WLT',
                              'WMV', 'WPD', 'WRI','XLS', 'XML', 'ZIP') 
   AND [AlternateName] IS NOT NULL
   
--------------------------------------------------------------------------------------
-- PBI 40030 - Reorganize Admin Console
--------------------------------------------------------------------------------------
-- Remove old, unwanted navigation items from upgrade
EXEC dbo.asi_DocumentDelete 'E40EFF91-CEA8-498C-BF84-DB5718C46D1A', 1 -- Admin Console - ~/Continuum/Membership Reports/Referral reports
EXEC dbo.asi_DocumentDelete 'EE0FD0A1-90EA-47BD-A81E-0CD558D4C0CD', 1 -- Admin Console - ~/Tools
EXEC dbo.asi_DocumentDelete '4E851FD7-339E-4840-8E30-28A9BA9D9204', 1 -- Admin Console - ~/Home/Break
EXEC dbo.asi_DocumentDelete 'B792A1C2-B45A-4D42-BED1-33EB433E28A4', 1 -- Admin Console - ~/Home/Break
EXEC dbo.asi_DocumentDelete '95DFDD77-DE73-46CB-8A31-4444F4632A3C', 1 -- Admin Console - ~/Home/Break
EXEC dbo.asi_DocumentDelete 'AF884C1A-CC1F-455D-AB88-ACDB0B22CADC', 1 -- Admin Console - ~/Home/Break
EXEC dbo.asi_DocumentDelete 'EA9A6EFD-5A5E-4A12-ABA4-EB10E47B61A7', 1 -- Admin Console - ~/Home/Certification
EXEC dbo.asi_DocumentDelete '17C5A42E-2092-4E90-B1F0-189B497328EA', 1 -- Admin Console - ~/Home/Referrals
EXEC dbo.asi_DocumentDelete '640D16CC-3CDC-4B2A-8F3A-455889F442FE', 1 -- Admin Console - ~/Home/Customer Service/Enter dues payments
EXEC dbo.asi_DocumentDelete 'F29EB6AE-A800-4693-AAA3-C4B43B6823A5', 1 -- Admin Console - ~/Home/Customer Service/Register for an_event
EXEC dbo.asi_DocumentDelete 'CE75056A-1CBB-4D1A-808E-4CE77655C53F', 1 -- Admin Console - ~/Home/Customer Service/Process sales transactions
EXEC dbo.asi_DocumentDelete '9C41AA02-41D8-4763-82C8-92A5C4C325F5', 1 -- Admin Console - ~/Settings/Certification
EXEC dbo.asi_DocumentDelete '6B94C076-CEE4-4432-9FF2-9BBB6A44558B', 1 -- Admin Console - ~/Settings/Break
EXEC dbo.asi_DocumentDelete 'EE48C22C-1264-43E6-A77A-2E59060602A6', 1 -- Admin Console - ~/Continuum/Membership_Reports/Certification reports
EXEC dbo.asi_DocumentDelete 'ECBCDAD6-DF50-4EDB-AE9A-2AF584D707CD', 1 -- Admin Console - ~/Home/Membership/Manage expired members
EXEC dbo.asi_DocumentDelete '999FC06D-1CDD-4E52-B932-44B6480F5D9A', 1 -- Admin Console - ~/Home/Membership/Manage accrual dues
EXEC dbo.asi_DocumentDelete 'DF12EF06-2E5B-438B-915C-FF9611D84614', 1 -- Admin Console - ~/Home/Membership/Process automatic payments
EXEC dbo.asi_DocumentDelete 'F282E139-8B36-4B56-B8ED-29530DCAE39B', 1 -- Admin Console - ~/Home/Membership/Enter and edit accrual dues credit memos
EXEC dbo.asi_DocumentDelete '87E30CBF-C99A-4C62-BC5F-F38AC39D0A45', 1 -- Admin Console - ~/Home/Membership/Enter and edit accrual dues debit memos
GO

--------------------------------------------------------
-- Change security of root document to full access
UPDATE [dbo].[DocumentMain] 
   SET [AccessKey] = '00000000-0000-0000-0000-000000000E1E'
   WHERE [DocumentVersionKey] = 'CFCFA28D-A731-4336-9061-C43F3B5DD90D'
         AND [DocumentStatusCode] = 40

GO

----------------------------------------------------------
-- PBI 41272 - Delete obsolete Mbr navigation for upgrade
----------------------------------------------------------
-- ~/Manage/Education
EXEC dbo.asi_DocumentDelete '1332B346-B9B0-45A0-8195-1C6087CE7F88', 1
-- ~/Manage/Setup
EXEC dbo.asi_DocumentDelete 'B6FAC00F-D686-418C-964B-9B465186C4DF', 1
-- ~/Membership/Directory/Add/People
EXEC dbo.asi_DocumentDelete 'B1DAA3A7-0837-43C3-BC08-093E365CBE50', 1
-- ~/Membership/Directory/Add/Organizations
EXEC dbo.asi_DocumentDelete '86EEB3F4-5387-40B0-9DC4-F9A83C11F605', 1
-- ~/Process_Manager
EXEC dbo.asi_DocumentDelete '934571A6-51CC-4DDC-A02B-A0370F712A87', 1
-- ~/Marketing
EXEC dbo.asi_DocumentDelete 'AE0D9C4C-286D-4929-AC6C-63386B6F632E', 1
GO

---------------------------------------------------------------------------------------------------------
-- PBI 43041 - Delete queries hard-coded to gold demo data (these have been copied to the Samples folder)
---------------------------------------------------------------------------------------------------------
-- /ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/Members only directory
EXEC asi_DocumentDelete 'E9FAF476-9041-43A2-8312-61BFC4B939B4', 1
-- NOTE: CW - 7 Feb 2014 - I removed 2 delete statements I had previously added here. 
-- These queries have been restored to their original pre 20.1.4 state so they don't have hard-coded gold data
GO

---------------------------------------------------
-- Delete duplicate published RLD documents, if any
---------------------------------------------------
DECLARE @documentKeyToDelete TABLE ([DocumentKey] uniqueidentifier PRIMARY KEY)
INSERT INTO @documentKeyToDelete 
    SELECT [DocumentKey] 
      FROM [dbo].[DocumentMain] old
     WHERE old.[DocumentTypeCode] = 'RDL' 
       AND old.[DocumentStatusCode] = '40'
       AND EXISTS (SELECT 1 FROM [dbo].[DocumentMain] newer 
                    WHERE newer.[DocumentVersionKey] = old.[DocumentVersionKey] 
                      AND newer.[DocumentKey] <> old.[DocumentKey] 
                      AND newer.[DocumentStatusCode] = '40'
                      AND newer.[StatusUpdatedOn] > old.[StatusUpdatedOn]
                   )
DELETE [dbo].[DocumentMain] WHERE [DocumentKey] IN (SELECT [DocumentKey] FROM @documentKeyToDelete)
DELETE [dbo].[UniformRegistry] WHERE [UniformKey] IN (SELECT [DocumentKey] FROM @documentKeyToDelete)
GO

---------------------------------------------------------------------------
-- PBI 42834 Remove ASIINTERNAL license key from Member Responsive website
---------------------------------------------------------------------------
-- Member Responsive Website and Webroot
DELETE FROM [dbo].[UniformLicense]
WHERE LicenseKey='0BD59CCC-9AB5-442A-81E3-12FD8B38FA15'
AND UniformKey in ('E7590042-1672-4D0F-A20C-335E0BF62DE2', '26A98EA2-957A-4AE3-A8CA-779B5B85A43C')
GO

-- End of script
SET NOCOUNT OFF
GO
