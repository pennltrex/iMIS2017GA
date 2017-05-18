SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO

-----------------------------------------------------------------------------
--Update all the sites to have UniformType='NavigationItem' so sitemap order is preserved
-----------------------------------------------------------------------------
-- 'Member Mobile'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'BED63250-4172-4027-96DC-FB9F5A559774')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = 'BED63250-4172-4027-96DC-FB9F5A559774'
END
GO
--'Donor Sample'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '37430F7C-5B73-48E4-BC9D-57DA9841F50A')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = '37430F7C-5B73-48E4-BC9D-57DA9841F50A'
END
GO
--'Administrative Console'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '3F0EC164-23FE-4A49-9C3A-D075C1A390F8')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = '3F0EC164-23FE-4A49-9C3A-D075C1A390F8'
END
GO
--'Staff'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'A5105C73-FB1D-4E25-A877-1D2C7700B39B')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = 'A5105C73-FB1D-4E25-A877-1D2C7700B39B'
END
GO
--'Annual Conference'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'EB587DD5-2020-4394-8DE1-61A495816B41')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = 'EB587DD5-2020-4394-8DE1-61A495816B41'
END
GO
--'Annual Conference Mobile'
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'B4FF3233-0478-4634-89A4-D75028AF3BDF')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [UniformType] = 'NavigationItem' WHERE [RootHierarchyKey] = 'B4FF3233-0478-4634-89A4-D75028AF3BDF'
END
GO

----------------------------------
-- Add Member Mobile site hierarchy root
----------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'BED63250-4172-4027-96DC-FB9F5A559774')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('BED63250-4172-4027-96DC-FB9F5A559774', '~', 'Member Mobile', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

--------------------------------
-- Add Member Mobile Perspective entry
--------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Member Mobile' OR PerspectiveKey = '5625EB60-3F3A-4DBE-A63E-6E4FA304A4C4')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('5625EB60-3F3A-4DBE-A63E-6E4FA304A4C4', 'Member Mobile', 'A9EF00FE-F87F-42A6-8150-3F3775861973', 'BED63250-4172-4027-96DC-FB9F5A559774', NULL, '102EBC8F-D775-4AB9-A13C-B4ED78D9F4EF')
END
GO

-----------------------------------------------------------------------------
-- SBT 31014 -  Add Admin Console hierarchy root
-----------------------------------------------------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '3F0EC164-23FE-4A49-9C3A-D075C1A390F8')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('3F0EC164-23FE-4A49-9C3A-D075C1A390F8', '~', 'Administrative Console', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

-----------------------------------------------------------------------------
-- SBT 31014 -  Add Admin Console Perspective entry
-----------------------------------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Administrative Console' OR PerspectiveKey = 'CDAFDB44-325E-4767-9F5D-30AB2E75224E')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('CDAFDB44-325E-4767-9F5D-30AB2E75224E', 'Administrative Console', 'FAD2FD17-7E27-4C96-BABE-3291ECDE4822', '3F0EC164-23FE-4A49-9C3A-D075C1A390F8', NULL, '27EECB4E-1A62-4EB8-A1FD-4DBE1186C0D0')
END
GO

------------------------------------------------------------------------------
-- PBI 24463 -  Rework desktop to support multiple URLs (for Administrative Console support)
------------------------------------------------------------------------------
UPDATE [dbo].[Perspective] 
SET [HomePageHierarchyKey] = '16C3E3BE-34D7-41D1-B5F1-3F31F3D38CBE'
WHERE [PerspectiveName] = 'iMIS Desktop View'
GO

UPDATE [dbo].[Perspective] 
SET [HomePageHierarchyKey] = '27EECB4E-1A62-4EB8-A1FD-4DBE1186C0D0'
WHERE [PerspectiveName] = 'Administrative Console'
GO

 
-- Sync disabled flag on Users with IsDisabled on UserMain
UPDATE u
   SET [Disabled] = 1
  FROM Users u INNER JOIN UserMain um ON u.UserId = um.UserId 
 WHERE um.IsDisabled = 1 AND u.Disabled = 0
GO

 
-----------------------------------------------------------------------------
-- PBI 28338 -  Add Staff website hierarchy root
-----------------------------------------------------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'A5105C73-FB1D-4E25-A877-1D2C7700B39B')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('A5105C73-FB1D-4E25-A877-1D2C7700B39B', '~', 'Staff', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

----------------------------------------------------------------------------------------------
-- PBI 28338 -  Add Staff website Perspective entry or Update it to have the correct home page
----------------------------------------------------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Staff' OR PerspectiveKey = '8D22E78D-5E61-48A4-9264-D3522A7D8F7F')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('8D22E78D-5E61-48A4-9264-D3522A7D8F7F', 'Staff', '4243D9E2-E91E-468C-97C2-2046D70C1E1A', 'A5105C73-FB1D-4E25-A877-1D2C7700B39B', NULL, 'CEA5F613-2240-448A-81C9-CF0DC487A55F')
END
ELSE
BEGIN
    UPDATE [dbo].[Perspective] 
       SET [HomePageHierarchyKey] = 'CEA5F613-2240-448A-81C9-CF0DC487A55F' 
     WHERE [PerspectiveName] = 'Staff' OR [PerspectiveKey] = '8D22E78D-5E61-48A4-9264-D3522A7D8F7F'
END
GO

 
-----------------------------------------------------------------------------
-- PBI 29526 -  Add Donor website hierarchy root
-----------------------------------------------------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '37430F7C-5B73-48E4-BC9D-57DA9841F50A')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('37430F7C-5B73-48E4-BC9D-57DA9841F50A', '~', 'Donor Sample', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

-----------------------------------------------------------------------------
-- PBI 29526 -  Rename Donor website hierarchy root to Donor Sample
-----------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '37430F7C-5B73-48E4-BC9D-57DA9841F50A' AND [HierarchyRootDescription] = 'Donor')
BEGIN
   UPDATE [dbo].[HierarchyRoot] SET [HierarchyRootDescription] = 'Donor Sample' WHERE [RootHierarchyKey] = '37430F7C-5B73-48E4-BC9D-57DA9841F50A'
END
GO

-----------------------------------------------------------------------------
-- PBI 29526 -  Add Donor website Perspective entry
-----------------------------------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Donor Sample' OR [PerspectiveKey] = '14C95828-5D7C-4482-8D77-36BF7E38C3B2')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('14C95828-5D7C-4482-8D77-36BF7E38C3B2', 'Donor Sample', '60B993C6-6608-4D34-89E6-E8CFE0234E3E', '37430F7C-5B73-48E4-BC9D-57DA9841F50A', NULL, '44BA0F78-7A92-431F-8D09-F8C3171CA46C')
END
GO

-----------------------------------------------------------------------------
-- PBI 29526 -  Rename existing "Donor" Perspective entry to "Donor Sample"
-----------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE [PerspectiveKey] = '14C95828-5D7C-4482-8D77-36BF7E38C3B2' AND [PerspectiveName] = 'Donor')
BEGIN
    UPDATE [dbo].[Perspective] SET [PerspectiveName] = 'Donor Sample' WHERE [PerspectiveKey] = '14C95828-5D7C-4482-8D77-36BF7E38C3B2'
END
GO

----------------------------------
-- Add Annual Conference site hierarchy root
----------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'EB587DD5-2020-4394-8DE1-61A495816B41')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('EB587DD5-2020-4394-8DE1-61A495816B41', '~', 'Annual Conference', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

--------------------------------
-- Add Annual Conference Perspective entry
--------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Annual Conference' OR PerspectiveKey = '287CD27F-A7D6-4D77-A9F6-466C77FB4D21')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('287CD27F-A7D6-4D77-A9F6-466C77FB4D21', 'Annual Conference', '77C6BF57-1505-456C-A3E9-8473532388EA', 'EB587DD5-2020-4394-8DE1-61A495816B41', NULL, '2C72C1EC-467E-4EE9-ADE9-D08FACF16CAB')
END
GO










----------------------------------
-- Add Annual Conference Mobile site hierarchy root
----------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier
SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'SYSTEM'
IF @userKey IS NULL SELECT @userKey = UserKey FROM UserMain WHERE UserId = 'MANAGER'
SET @now = GETDATE()

IF NOT EXISTS(SELECT 1 FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = 'B4FF3233-0478-4634-89A4-D75028AF3BDF')
BEGIN
    INSERT INTO [dbo].[HierarchyRoot] (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType,
                                       CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('B4FF3233-0478-4634-89A4-D75028AF3BDF', '~', 'Annual Conference Mobile', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-CA00-000000000E1F', 'NavigationItem', 
            @now, @userKey, @now, @userKey, NULL)
END
GO

--------------------------------
-- Add Annual Conference MObile Perspective entry
--------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Perspective] WHERE PerspectiveName = 'Annual Conference Mobile' OR PerspectiveKey = 'CBE7DBEB-ACD1-4189-9F14-8CC4A9A14D00')
BEGIN
    INSERT INTO [dbo].[Perspective] (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('CBE7DBEB-ACD1-4189-9F14-8CC4A9A14D00', 'Annual Conference Mobile', 'A39D90DD-AFAE-4F98-85E3-EF34FEAF63CC', 'B4FF3233-0478-4634-89A4-D75028AF3BDF', NULL, '589BEAE4-2185-4765-B196-93974870EC26')









END
GO

