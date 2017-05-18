-----------------------------------------
-- Update misc. data in various tables --
-----------------------------------------

--------------------------------
-- Correct AccessArea table data
--------------------------------
UPDATE [dbo].[AccessArea]
   SET [IsContentACL] = 1
 WHERE [Name] LIKE 'CA+%' AND [IsContentACL] = 0
GO

--------------------------------------------
-- Remove obsolete row from ContactStatusRef
--------------------------------------------
DELETE FROM [dbo].[ContactStatusRef] WHERE [ContactStatusCode] = '5'
GO


-----------------------------------------------------
-- Update DocumentSummaryLink for the CTY type in DocumentTypeRef
-----------------------------------------------------
UPDATE [dbo].[DocumentTypeRef] 
SET [DocumentSummaryLink] = '[TemplatePath]?ContentCode=BSA.DocumentSummary.Default&TemplateType=E' 
WHERE [DocumentTypeCode] = 'CTY'
GO

-----------------------------------------------------
-- Remove the SSRS Template type from DocumentTypeRef
-----------------------------------------------------
DELETE FROM [dbo].[DocumentTypeRef] WHERE [DocumentTypeCode] = 'RST'
GO

---------------------------------------------
-- Add 'Inactive' member status to Gen_Tables
---------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Gen_Tables] WHERE [TABLE_NAME] = 'MEMBER_STATUS' AND [CODE] = 'I' )
BEGIN
    INSERT INTO [dbo].[Gen_Tables] ([TABLE_NAME],[CODE],[UPPER_CODE],[DESCRIPTION]) 
    VALUES ('MEMBER_STATUS', 'I', 'I', 'Inactive')
END
GO

-------------------------------------------------------------------------------
-- Ensure required Name_Fin, Name_Security, and Name_Security_Groups rows exist
-------------------------------------------------------------------------------
INSERT INTO Name_Fin (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Fin b ON a.ID = b.ID
WHERE b.ID IS NULL
GO
INSERT INTO Name_Security (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Security b ON a.ID = b.ID
WHERE b.ID IS NULL
GO
INSERT INTO Name_Security_Groups (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Security_Groups b ON a.ID = b.ID
WHERE b.ID IS NULL
GO

----------------------------------
-- Add Alabama to StateProvinceRef
----------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[StateProvinceRef] WHERE [StateProvinceCode] = 'AL')
BEGIN
    INSERT INTO [dbo].[StateProvinceRef] ([StateProvinceCode], [CountryCode], [StateProvinceDesc], [IsActive], 
                [IsHandModified], [UpdatedByUserKey], [UpdatedOn]) 
    VALUES ('AL', 'US', 'Alabama', 1, 0, @systemUserKey, @now)
END
GO


----------------------------------
-- Add Member site hierarchy root
----------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '71E7EBE8-1F90-416A-AE0D-9560A6704F85')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('71E7EBE8-1F90-416A-AE0D-9560A6704F85', '~', 'Member', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

--------------------------------
-- Add Member Perspective entry
--------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Member')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('F7E48A90-1141-4174-BEA9-47FDD4CD588A', 'Member', 'DEEA0907-2D5E-405C-8EC4-E9794203EADD', '71E7EBE8-1F90-416A-AE0D-9560A6704F85', NULL, '8D34E992-65D8-4F9B-814A-8BA74846F418')
END
GO

--------------------------------------------------------
-- Move ConentWebUserControl into a hidden system folder
--------------------------------------------------------
DECLARE @parentHierarchyKey uniqueidentifier
DECLARE @sortOrder int
DECLARE @depth int

SELECT @parentHierarchyKey = [HierarchyKey], @sortOrder = [SortOrder] + 1, @depth = [Depth] + 1 FROM [dbo].[Hierarchy] WHERE [UniformKey] = 
    (SELECT [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'System_Hidden' AND [DocumentTypeCode] = 'FOL')

UPDATE [dbo].[Hierarchy]
   SET [ParentHierarchyKey] = @parentHierarchyKey, [SortOrder] = @sortOrder, [Depth] = @depth
 WHERE [HierarchyKey] = 'B8A49A8C-A998-4381-A4EB-94A19A2CD40F'
GO

-----------------------------------------------------
-- Remove Name_AlternateId from UD_Table
-----------------------------------------------------
DELETE FROM [dbo].[UD_Table] WHERE [TABLE_NAME] = 'Name_AlternateId'
GO


-----------------------------------------------------
-- Rename controller for common code changes
-----------------------------------------------------
UPDATE c
    SET c.[AssemblyName] = 'Asi.V10', c.[TypeName] = 'Asi.Business.Common.GroupRoleControllerV10'
    FROM [dbo].[ComponentRegistry] c
        WHERE c.[Name] = 'GroupRoleRef' AND c.[InterfaceName] = 'BusinessController';
GO

-----------------------------------------------------
-- Hide unused MemorialTribute folder with licensing
-----------------------------------------------------
DECLARE @licenseKey uniqueidentifier
SELECT @licenseKey = [LicenseKey] FROM [dbo].[License] WHERE [LicenseName] = 'ISABETA'
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = @licenseKey AND [UniformKey] = '8AB9D3B5-3025-4A3C-A984-4D91B52B97D8')
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey])
    VALUES (@licenseKey, '8AB9D3B5-3025-4A3C-A984-4D91B52B97D8')
END
GO

-----------------------------------------------------
-- Hide unused CRA documents with different licensing
-----------------------------------------------------
IF  EXISTS (SELECT * FROM [dbo].[UniformLicense] where UniformKey = '032ABED1-15A2-4BEC-9443-6ACCC19BC16F')
UPDATE [dbo].[UniformLicense] SET LicenseKey = '0BD59CCC-9AB5-442A-81E3-12FD8B38FA15' WHERE UniformKey = '032ABED1-15A2-4BEC-9443-6ACCC19BC16F'
GO

-----------------------------------------------------
-- Secure All IQA queries
-----------------------------------------------------
-- Get the new Access Key to use
DECLARE @newAccessKey uniqueidentifier
SELECT @newAccessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Authenticated Users Full Control'
-- Set all IQA Query documents to use the new Access Key
UPDATE [dbo].[DocumentMain]
SET [AccessKey] = @newAccessKey
WHERE [DocumentTypeCode] = 'IQD' AND [DocumentStatusCode] = 40 
GO

----------------------------------------------------------
-- Set public view events queries to everyone access
----------------------------------------------------------
DECLARE @everyoneFullControl uniqueidentifier
SELECT @everyoneFullControl = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
UPDATE [dbo].[DocumentMain]
SET [AccessKey] = @everyoneFullControl
WHERE [DocumentTypeCode] = 'IQD' AND [DocumentStatusCode] = 40 AND ([DocumentName] = 'Public' or [DocumentName] = 'ViewAll' or [DocumentName] = 'Registrant Search') 
GO