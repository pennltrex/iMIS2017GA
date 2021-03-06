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

-----------------------------------------------------------------------------------
-- PBI 52917 - Hide the Manage Duplicates documents with the DUPMERGE license key
-----------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1EE98303-5562-42B2-B535-8CAFF809A077' AND [UniformKey] = '572B535F-034A-485F-92A2-B21AB2A3E52C')
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey])
    VALUES ('1EE98303-5562-42B2-B535-8CAFF809A077', '572B535F-034A-485F-92A2-B21AB2A3E52C') -- nav item
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1EE98303-5562-42B2-B535-8CAFF809A077' AND [UniformKey] = 'A3AE5570-AA35-4E45-8331-F428AD838129')
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey])
    VALUES ('1EE98303-5562-42B2-B535-8CAFF809A077', 'A3AE5570-AA35-4E45-8331-F428AD838129') -- content record
END
GO

------------------------------------------
-- PBI 54255:v10/v100 Licensing - Cleanup existing license table and code
------------------------------------------

-- Secure new LicenseRef BO with the ISABETA license key
DECLARE @DocumentVersionKey uniqueidentifier;
SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'LicenseRef' AND [DocumentTypeCode] = 'BOD'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'LicenseRef' AND [DocumentTypeCode] = 'BUS'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM DocumentMain WHERE DocumentName = 'LicenseRef' AND [DocumentTypeCode] = 'DBS'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

------------------------------------------------------------------------------------------------------------------------------------------
-- Fix some document sort orders by forcing their order relative to each other (PBI 48136)
------------------------------------------------------------------------------------------------------------------------------------------
-- Grab all the existing siblings
DECLARE @siblingOrder TABLE ([HierarchyKey] uniqueidentifier, [DocumentVersionKey] uniqueidentifier, [SortOrder] int, [NewSortOrder] int);
INSERT INTO @siblingOrder ([HierarchyKey], [DocumentVersionKey], [SortOrder], [NewSortOrder])
    SELECT [HierarchyKey], [DocumentVersionKey], [SortOrder], 0 
    FROM [dbo].[Hierarchy] h
        INNER JOIN [dbo].[DocumentMain] d ON h.[UniformKey] = d.[DocumentVersionKey] AND [DocumentStatusCode] = 40
    WHERE [ParentHierarchyKey] = '236E11D1-4328-4676-8153-AD7B73C4FCBF'
    ORDER BY [SortOrder];
-- Get the current sort order range and step sizes     
DECLARE @minSortOrder int;
DECLARE @maxSortOrder int;
DECLARE @siblingCount int;
DECLARE @siblingStep int;
SELECT @minSortOrder = MIN(SortOrder), @maxSortOrder = MAX(SortOrder), @siblingCount = COUNT(1) FROM @siblingOrder;
SET @siblingStep = (@maxSortOrder - @minSortOrder) / CASE WHEN (@siblingCount > 2) THEN (@siblingCount - 1) ELSE 1 END;
-- Force the order (first)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 0)
 WHERE [DocumentVersionKey] = 'C00E4B7D-C2E5-46A8-8A95-9C679C9517A0';
-- Force the order (second)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 1)
 WHERE [DocumentVersionKey] = '4688D0AD-9375-460E-A676-632A2806F87A';
-- Force the order (third)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 2)
 WHERE [DocumentVersionKey] = '35E21BBB-2F52-4C08-ABCE-5F8116785035';
-- Force the order (fourth)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 3)
 WHERE [DocumentVersionKey] = 'F50B3D15-15E6-4987-80C0-E1F319B338B5';
-- Force the order (fifth)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 4)
 WHERE [DocumentVersionKey] = 'CADB7140-4FE6-40F1-8441-8D0860993EF3';
-- Send any remaining to the end
WITH RemainingRows AS (
    SELECT [HierarchyKey], [DocumentVersionKey], [SortOrder], [NewSortOrder], ROW_NUMBER() OVER (ORDER BY [SortOrder]) AS [RowCount]
      FROM @siblingOrder
     WHERE [NewSortOrder] = 0
)
UPDATE so
   SET so.[SortOrder] = @maxSortOrder + (rr.[RowCount] * 2)
  FROM RemainingRows rr
       INNER JOIN @siblingOrder so ON rr.HierarchyKey = so.HierarchyKey
-- Now apply the new sort orders
UPDATE h
   SET h.[SortOrder] = so.[NewSortOrder]
  FROM [dbo].[Hierarchy] h
       INNER JOIN @siblingOrder so ON h.HierarchyKey = so.HierarchyKey;
GO

------------------------------------------------------------------------------------------------------------------------------------------
-- Fix some document sort orders by forcing their order relative to each other (PBI 56091)
------------------------------------------------------------------------------------------------------------------------------------------
-- Grab all the existing siblings
DECLARE @siblingOrder TABLE ([HierarchyKey] uniqueidentifier, [DocumentVersionKey] uniqueidentifier, [SortOrder] int, [NewSortOrder] int);
INSERT INTO @siblingOrder ([HierarchyKey], [DocumentVersionKey], [SortOrder], [NewSortOrder])
    SELECT [HierarchyKey], [DocumentVersionKey], [SortOrder], 0 
    FROM [dbo].[Hierarchy] h
        INNER JOIN [dbo].[DocumentMain] d ON h.[UniformKey] = d.[DocumentVersionKey] AND [DocumentStatusCode] = 40
    WHERE [ParentHierarchyKey] = 'F254FCA0-C422-415A-AB74-99B780FC2A1E'
    ORDER BY [SortOrder];
-- Get the current sort order range and step sizes     
DECLARE @minSortOrder int;
DECLARE @maxSortOrder int;
DECLARE @siblingCount int;
DECLARE @siblingStep int;
SELECT @minSortOrder = MIN(SortOrder), @maxSortOrder = MAX(SortOrder), @siblingCount = COUNT(1) FROM @siblingOrder;
SET @siblingStep = (@maxSortOrder - @minSortOrder) / CASE WHEN (@siblingCount > 2) THEN (@siblingCount - 1) ELSE 1 END;
-- Force the order (first)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 0)
 WHERE [DocumentVersionKey] = '042501DA-E7B5-4810-A23E-BFD89314B213';
-- Force the order (second)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 1)
 WHERE [DocumentVersionKey] = '886E4A55-C54F-4C51-98FB-90F2735E5D45';
-- Force the order (third)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 2)
 WHERE [DocumentVersionKey] = 'C7F5133E-2DF5-4866-A4CB-1C0A64CC3D6E';
-- Force the order (fourth)
UPDATE @siblingOrder 
   SET [NewSortOrder] = @minSortOrder + (@siblingStep * 3)
 WHERE [DocumentVersionKey] = 'E81F040B-02B8-4C1D-86DE-BDF489325411';
-- Send any remaining to the end
WITH RemainingRows AS (
    SELECT [HierarchyKey], [DocumentVersionKey], [SortOrder], [NewSortOrder], ROW_NUMBER() OVER (ORDER BY [SortOrder]) AS [RowCount]
      FROM @siblingOrder
     WHERE [NewSortOrder] = 0
)
UPDATE so
   SET so.[SortOrder] = @maxSortOrder + (rr.[RowCount] * 2)
  FROM RemainingRows rr
       INNER JOIN @siblingOrder so ON rr.HierarchyKey = so.HierarchyKey
-- Now apply the new sort orders
UPDATE h
   SET h.[SortOrder] = so.[NewSortOrder]
  FROM [dbo].[Hierarchy] h
       INNER JOIN @siblingOrder so ON h.HierarchyKey = so.HierarchyKey;

----------------------------------------------------------------------------------------------------------------------
-- PBI 65891 - Add New GreatBarrierReef_Responsive theme
----------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM [dbo].[Theme] WHERE [ThemeName] = 'GreatBarrierReef_Responsive' 
   OR [ThemeKey] = 'FFA9875D-5687-45B2-B401-34A448BA7596' )
BEGIN
    INSERT INTO [dbo].[Theme] ([ThemeKey], [ThemeName], [ThemeDesc], [MasterPageFileName], [IsResponsive], [IsUltrawaveBased]) 
    VALUES ('FFA9875D-5687-45B2-B401-34A448BA7596', 'GreatBarrierReef_Responsive','GreatBarrierReef Responsive','WST-NaturalHeritageSitesResponsive.master','1','1');
END

-------------------------
-- End of script
SET NOCOUNT OFF
GO
