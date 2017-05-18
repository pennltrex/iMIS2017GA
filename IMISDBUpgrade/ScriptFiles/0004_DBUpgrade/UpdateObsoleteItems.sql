---------------------------------------------------
-- Drop or delete any obsolete DB schema or rows --
---------------------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script

-----------------------------------------------------------------------------
-- Boot strap some functions that are relied on by utilities during upgrade 
-----------------------------------------------------------------------------
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetDatabaseTimeZoneIdentifier]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DECLARE @sql nvarchar(max);

SET @sql = N'

-- =============================================
-- Author:		Stacey Tarr
-- Create date: 29 JAN 2014
-- Description:	Get DB Time Zone Identifier
-- =============================================
CREATE FUNCTION [dbo].[asi_GetDatabaseTimeZoneIdentifier]() 
RETURNS VARCHAR(50)
AS
BEGIN
	
	DECLARE @TZName VARCHAR(50)

	EXEC [master].[dbo].xp_regread ''HKEY_LOCAL_MACHINE'', ''SYSTEM\CurrentControlSet\Control\TimeZoneInformation'', ''TimeZoneKeyName'',@TZName OUT;

	RETURN @TZName

END

';

EXEC(@sql);
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetAppDatetime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DECLARE @sql nvarchar(max);

SET @sql = N'
-- ===================================================================================
-- Author:      Paul Bradshaw
-- Create date: 03-Aug-2016
-- Description: Return the current datetime value offset by configured timezone offset 
-- ===================================================================================
CREATE FUNCTION [dbo].[asi_GetAppDatetime]()
RETURNS datetime
AS
BEGIN
    DECLARE @offset int; -- timezone offset from UTC in minutes
    SELECT @offset = [ParameterValue] FROM [dbo].[SystemConfig] WHERE [ParameterName] = N''System.Database.TimeZoneOffset'';
    IF (@offset IS NULL) SELECT @offset = DATEDIFF(MINUTE, GETUTCDATE(), GETDATE());
    RETURN DATEADD(minute, @offset, GETUTCDATE());
END

';

EXEC(@sql);
END
GO


--------------------------------------------------------------------------------
-- Clean up orphaned navigation hierarchy (must be first thing in this script)
--------------------------------------------------------------------------------
DELETE h
  FROM [dbo].[Hierarchy] h
 WHERE h.UniformType = N'NavigationItem'
       AND NOT EXISTS (SELECT 1 FROM DocumentMain d WHERE d.DocumentVersionKey = h.UniformKey)
       AND NOT EXISTS (SELECT * FROM HierarchyRoot r WHERE r.RootHierarchyKey = h.HierarchyKey)
go

--------------------------------------------------------------------------------
-- PBI 44278 - Duplicate Profile_Page panel source
--------------------------------------------------------------------------------
-- Need to delete the extra panel source, which is causing problems

EXEC dbo.asi_DocumentDelete 'AF4424B1-B177-46CF-8CAB-7ECA06783C17', 1
GO

--------------------------------------------------------------------------------
-- PBI 43144 Remove non-functional Full site link from Responsive website
--------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '92765523-3F05-412F-B264-AE6CCC2B3F39', 1
GO

--------------------------------------------------------------------------------
-- PBI 44683 - Remove object browser functionality from Desktop/AAC
--------------------------------------------------------------------------------
-- Remove never-released Education module from Desktop
EXEC dbo.asi_DocumentDelete '343EE562-8B69-47CE-ABB8-D1A7FBF064B9', 1

--------------------------------------------------------------------------------
-- PBI 44749 - Remove invalid/obsolete panel named "Contact_Profile"
--------------------------------------------------------------------------------
DELETE FROM [dbo].[PanelDefinition] WHERE [PanelDefinitionId] = 'B52E2AB0-B748-43AE-B793-0F34D625BB98'
GO

--------------------------------------------------------------------------------
-- PBI 44758 - Remove obsolete navigation item from the Annual Conference website
--------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'E84627FB-01E4-4758-90D4-989FA9B3D475', 1
GO

--------------------------------------------------------------------------------
-- PBI 44334 - Remove unwanted communication objects
--------------------------------------------------------------------------------

-- these are junk "My Communication" files
EXEC asi_DocumentDelete '74D0A888-4E14-4FB0-8062-13FC3A2D5849', 1
EXEC asi_DocumentDelete '64660CDA-F443-489A-A1DD-48319FFE7374', 1
EXEC asi_DocumentDelete 'E5C4C7E5-067F-47DF-AC0E-70F241B8C870', 1
EXEC asi_DocumentDelete 'A094F5C9-14E6-4BD0-A059-A6BB852D7233', 1

-- delete extra "Templates" folder, but only if there is nothing in it.
IF NOT EXISTS (
    SELECT 1 
      FROM [dbo].[Hierarchy]
     WHERE [ParentHierarchyKey] = 'AC6D93B8-E756-4958-96D6-416A5876C6CA'
     )
BEGIN
    EXEC asi_DocumentDelete 'EE8854E7-F4D0-43D8-B23E-D56EDB8A6AF4', 1
END

GO

--------------------------------------------------------------------------------
-- PBI 46681 - Remove non-functional 'Update iMIS' links from Desktop and AAC
--------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '5B2F9229-4CB0-49A7-B134-2D486181FFAD', 1 -- AAC
EXEC dbo.asi_DocumentDelete 'A1EF614D-8F36-4BDA-AF07-A80AFB1426A5', 1 -- Desktop
GO


--------------------------------------------------------------------------------
-- PBI 48076 - Remove IndividualExternalNetworks BO
--------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '1A7B2BD8-5585-4017-BF3B-2D71D2A2D3C5', 1
EXEC dbo.asi_DocumentDelete 'BFE19F58-0C1B-4869-B7CD-6A31CE8194AD', 1
EXEC dbo.asi_DocumentDelete '4F2DA6C0-4A8E-4A44-BA9E-DC2DF1E2A089', 1
GO
-------------------------------------------------------------------------------------
-- PBI 48135 - Remove redundant Generate_recurring_donations NAV in Desktop and AAC
-------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'A469E761-0104-4F38-BF36-BDF44536634A', 1 -- Desktop
EXEC dbo.asi_DocumentDelete '225E4958-177C-4EFA-B26D-5BA03168F7B3', 1 -- AAC
GO 
-------------------------------------------------------------------------------------
-- PBI 48137 - Remove redundant Generate_AutoPay_donations NAV in Staff
-------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'DCE81495-3BF0-4E2C-833D-52CA00C6B5DB', 1 -- Staff
GO

-- Drop an obsolete view if it exists
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vUDBOName_FR')
BEGIN
    DROP VIEW vUDBOName_FR;
END

-------------------------------------------------------------------------------------
-- PBI 48852 - Create customizable Order Confirmation Template
-------------------------------------------------------------------------------------
-- Delete the now-obsolete Order Confirmation settings page (Staff site - Settings > Commerce > Order confirmations)
EXEC asi_DocumentDelete 'CC63EA02-E083-42DD-BFF7-5A37CE201FBC', 1 
GO

-------------------------------------------------------------------------------------
-- PBI 49781 - BUG: (FR performance) on a large db that has lots of Gift and Pledge 
-- records, clicking on Donor Tab from Staff site take a long time
-------------------------------------------------------------------------------------
-- Delete a now-obsolete (and poorly-performing) IQA Query affecting the Donor Data tab on the Staff Account Page
-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/- Giving History by Calendar Year
EXEC dbo.asi_DocumentDelete '6735742A-42D3-44DF-BFAC-6E32E3FAE427', 1
GO

-----------------------------------------------------------------------
-- PBI 50557 - remove Site_builder_configuration from navigation     --
-----------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'E41B0414-8F70-4381-BF81-B33F2F066061', 1
GO

-----------------------------------------------------------------------
-- PBI 49275:BUG: EventDashboard shortcut for the Staff site should be deleted     --
-----------------------------------------------------------------------
DELETE FROM [dbo].[URLMapping] 
 WHERE [URLMappingKey] = '5AB2B470-7578-4FBC-9FDF-A3997C26B979'
   AND [TargetDocumentVersionKey] = 'A8AB6743-9DDA-41F7-9AA2-7A681A203082'
GO

--------------------------------------------------------------------------------------------------
-- Drop unnecessary indexes that were affecting performance negatively & using too much disk space
--------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_StringValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_StringValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_IntValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_IntValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_GuidValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_GuidValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_DecimalValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_DecimalValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_DateTimeValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_DateTimeValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_BooleanValue')
    DROP INDEX [IX_UserDefinedSingleInstanceProperty_BooleanValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_StringValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_StringValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_IntValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_IntValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_GuidValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_GuidValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_DecimalValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_DecimalValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_DateTimeValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_DateTimeValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_BooleanValue')
    DROP INDEX [IX_UserDefinedMultiInstanceProperty_BooleanValue] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
GO

--------------------------------------------
-- Drop old indexes that is being renamed --
--------------------------------------------
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessItem]') AND name = N'AK_AccessItem_GroupKey')
    DROP INDEX [AK_AccessItem_GroupKey] ON [dbo].[AccessItem] WITH ( ONLINE = OFF )
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Duplicate]') AND name = N'iSEQN')
    DROP INDEX [iSEQN] ON [dbo].[Duplicate] WITH ( ONLINE = OFF )
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Duplicate_Group]') AND name = N'iSEQN')
    DROP INDEX [iSEQN] ON [dbo].[Duplicate_Group] WITH ( ONLINE = OFF )
GO

-----------------------------------------------------------------------
-- PBI 52083: BUG: Removing no longer used Certification 'Pending Approvals' nav item which was causing issues on upgrade
-----------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '5F1642EF-2716-46D7-A2A2-58E98C5032EF', 1
GO

-- End of script
SET NOCOUNT OFF
GO
