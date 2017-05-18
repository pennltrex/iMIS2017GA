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

--------------------------------------------------------
-- Fix sort order for a couple of out-of-order NAV items
--------------------------------------------------------
DECLARE @documentASort int
DECLARE @documentBSort int
SELECT @documentASort = SortOrder FROM [dbo].[Hierarchy] WHERE UniformKey = '8F87B685-BCFD-48B2-85D7-C6C71C005A94'
SELECT @documentBSort = SortOrder FROM [dbo].[Hierarchy] WHERE UniformKey = '6FD3B8F9-1369-42CE-A1C4-FBFC5E85A181'
IF @documentASort > @documentBSort
BEGIN
    UPDATE [dbo].[Hierarchy] SET [SortOrder] = @documentBSort WHERE UniformKey = '8F87B685-BCFD-48B2-85D7-C6C71C005A94'
    UPDATE [dbo].[Hierarchy] SET [SortOrder] = @documentASort WHERE UniformKey = '6FD3B8F9-1369-42CE-A1C4-FBFC5E85A181'
END
GO
DECLARE @documentASort int
DECLARE @documentBSort int
SELECT @documentASort = SortOrder FROM [dbo].[Hierarchy] WHERE UniformKey = '84AC5DBB-186B-4289-9DAE-7EE20560DC24'
SELECT @documentBSort = SortOrder FROM [dbo].[Hierarchy] WHERE UniformKey = '664E65AF-2F90-4A03-B045-42F687923FAA'
IF @documentASort > @documentBSort
BEGIN
    UPDATE [dbo].[Hierarchy] SET [SortOrder] = @documentBSort WHERE UniformKey = '84AC5DBB-186B-4289-9DAE-7EE20560DC24'
    UPDATE [dbo].[Hierarchy] SET [SortOrder] = @documentASort WHERE UniformKey = '664E65AF-2F90-4A03-B045-42F687923FAA'
END
GO
--- PBI 44594 - Remove old broken 'Set up tables' nav (7B9E122D-A416-41E1-AAC0-FAECBD9B056A) as added a new one (C93317C5-5E10-409F-97F4-C9C53B8AB269) and moved all the children to it
EXEC dbo.asi_DocumentDelete '7B9E122D-A416-41E1-AAC0-FAECBD9B056A', 1
----------------------------------------------------------------------
--- PBI 47456 - Remove old broken 'Set up tables' nav ('425225D4-AE1D-4601-BB18-C0C15BE5F61B') as added a new one (1B26BFBE-5A65-453F-80CE-AB0803B779E0) and moved all the children to it
EXEC dbo.asi_DocumentDelete '425225D4-AE1D-4601-BB18-C0C15BE5F61B', 1
-------------------------------------------------------------
-- Delete now-unused system settings pages (Part of PBI 41602)
-------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '2256ABFD-007D-431B-B892-5BF20422C1E6', 1 -- RiSE/System Settings
EXEC dbo.asi_DocumentDelete 'BF2E4869-66E5-4085-9A22-B57A7487E766', 1 -- RiSE/Set up web components

-- Delete the old "ASI Only' content type folder
EXEC asi_DocumentDelete 'DDEE48EA-B86B-4BDB-AC3D-CE649E58F596', 1

-------------------------------------------------------------
-- PBI 46122 - Migrate new Donor site to v10
-------------------------------------------------------------
-- Need to delete the old navigation and content
EXEC dbo.asi_DocumentDelete '426A3144-4C69-4945-BE40-F2684645172D', 1 -- (NAV) My_Account
EXEC dbo.asi_DocumentDelete 'E4F602BB-E7CF-4188-B006-518C9796DB6A', 1 -- (NAV) Who_We_Are
EXEC dbo.asi_DocumentDelete '26506EF4-6E6B-44F2-8EE5-3AA30FC8196E', 1 -- (NAV) What_We_Do
EXEC dbo.asi_DocumentDelete '99811E6B-C413-45D1-975B-4760D78EEE75', 1 -- (NAV) Get_Involved
EXEC dbo.asi_DocumentDelete 'F023C986-BB85-4653-9D0C-E0E826341EF2', 1 -- (NAV) Donate
EXEC dbo.asi_DocumentDelete 'C4E40DCE-BCAC-47AE-9A3B-F83751EDB880', 1 -- (NAV) Shop
EXEC dbo.asi_DocumentDelete 'E05BA4BE-14C8-4AD0-B864-4A8E81EB0DFB', 1 -- (CFL) @/iSamples/Donor (old content)
EXEC dbo.asi_DocumentDelete 'AC74324E-9ECE-4346-BFF3-9CE226AD01D7', 1 -- (NAV) Manage > Acquisitions Dashboard
EXEC dbo.asi_DocumentDelete 'DF57D03D-72E4-48D0-9572-A145818E76F2', 1 -- (NAV) Manage > Major Donors
EXEC dbo.asi_DocumentDelete 'DE7901F1-129D-4C82-9F36-8D048FE71459', 1 -- (NAV) Manage > Break

--------------------------------------------------------------------------
-- PBI 48486 - BUG: GUID results showing in "Returns all contacts" query
--------------------------------------------------------------------------
-- Moved the query to a folder not used by On Behalf Of
-- Need to update security settings if they were set to use that query

-- AllUsersAccessQuery
UPDATE SystemConfig
   SET ParameterValue = '$/Samples/Security/UserAccess/All Contacts'
 WHERE SystemConfigKey = 'A3350DB1-E6FD-49A2-A5F7-A3547A291826' -- AllUsersAccessQuery
       AND ParameterValue = '$/ContactManagement/DefaultSystem/Queries/Contacts/All Contacts'
       
-- AuthenticatedUsersAccessQuery
UPDATE SystemConfig
   SET ParameterValue = '$/Samples/Security/UserAccess/All Contacts'
 WHERE SystemConfigKey = 'A1B1561A-643C-4A33-A74F-F42627CCE271' -- AuthenticatedUsersAccessQuery
       AND ParameterValue = '$/ContactManagement/DefaultSystem/Queries/Contacts/All Contacts'
       
-- MemberAccessQuery
UPDATE SystemConfig
   SET ParameterValue = '$/Samples/Security/UserAccess/All Contacts'
 WHERE SystemConfigKey = '2DA65CB5-C52F-4F15-B274-57D289B8C14D' -- MemberAccessQuery
       AND ParameterValue = '$/ContactManagement/DefaultSystem/Queries/Contacts/All Contacts'


-- End of script
SET NOCOUNT OFF
GO
