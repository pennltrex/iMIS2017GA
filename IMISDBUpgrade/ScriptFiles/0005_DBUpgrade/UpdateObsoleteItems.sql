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


------------------------------------------------------------------------
--Bootstrap asi_DocumentDelete updates to ensure proper document cleanup
------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentDeleteDocument]') AND type IN (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_DocumentDeleteDocument]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- Deletes a document that is either a leaf node in a hierarchy, or a document not participating
-- in a hierarchy (a stand alone document).  This procedure takes into account any custom access
-- control, as well as whether the document is versioned or not.  This Stored Procedure should not
-- be called directly; it is called by asi_DocumentDelete or asi_DocumentDeleteHierarchy.
CREATE PROCEDURE [dbo].[asi_DocumentDeleteDocument] 
    @documentVersionKey uniqueidentifier,
    @purgeVersions bit = 0
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @documentKey uniqueidentifier
    DECLARE @accessKey uniqueidentifier
    DECLARE @isVersioned bit
    DECLARE @publishedVersionExists bit

    SET @publishedVersionExists = 1
    SELECT @documentKey = d.[DocumentKey], @accessKey = d.[AccessKey], @isVersioned = t.[TrackVersionsFlag]
      FROM [dbo].[DocumentMain] d INNER JOIN [dbo].[DocumentTypeRef] t ON d.[DocumentTypeCode] = t.[DocumentTypeCode]
     WHERE d.[DocumentVersionKey] = @documentVersionKey AND d.[DocumentStatusCode] IN (40,60)

    IF @documentKey IS NULL -- Could not find a published version
    BEGIN
        SET @publishedVersionExists = 0
        IF EXISTS (SELECT 1 FROM [dbo].[DocumentMain] d WHERE d.[DocumentVersionKey] = @documentVersionKey)
        BEGIN
            SET @isVersioned = 1
        END
    END

    IF @isVersioned = 1
    BEGIN
        IF @purgeVersions = 0
        BEGIN
            -- Versioned document... just Recycle it
            UPDATE [dbo].[DocumentMain] 
               SET [DocumentStatusCode] = 80,
                   [StatusUpdatedOn] = GETDATE()
             WHERE [DocumentKey] = @documentKey
        END
        ELSE
        BEGIN
            -- Versioned document... purge all versions
            DECLARE @documents TABLE (DocumentKey uniqueidentifier NOT NULL)
            INSERT INTO @documents
                SELECT [DocumentKey] FROM [dbo].[DocumentMain] d WHERE d.[DocumentVersionKey] = @documentVersionKey
            DECLARE @accessKeys TABLE (AccessKey uniqueidentifier NOT NULL)
            INSERT INTO @accessKeys
                SELECT DISTINCT AccessKey FROM [dbo].[DocumentMain] d WHERE d.[DocumentVersionKey] = @documentVersionKey
                
            DELETE FROM [dbo].[Hierarchy] WHERE [UniformKey] = @documentVersionKey
            DELETE prd FROM @documents d INNER JOIN [dbo].[PublishRequestDetail] prd ON d.[DocumentKey] = prd.[ContentDocumentKey]
            DELETE dm FROM @documents d INNER JOIN [dbo].[DocumentMain] dm ON d.[DocumentKey] = dm.[DocumentKey]
            WHILE EXISTS (SELECT 1 FROM @accessKeys)
            BEGIN
                SELECT TOP 1 @accessKey = AccessKey FROM @accessKeys;
                EXEC [dbo].[asi_AccessKeyDelete] @accessKey;
                DELETE FROM @accessKeys WHERE AccessKey = @accessKey;
            END
            DELETE FROM [dbo].[UniformTag] WHERE [UniformKey] = @documentVersionKey;
            DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentVersionKey;
            DELETE u FROM @documents d INNER JOIN [dbo].[UniformRegistry] u ON d.[DocumentKey] = u.[UniformKey];
            DELETE FROM [dbo].[UniformLicense] WHERE [UniformKey] = @documentVersionKey;
        END
    END
    ELSE IF @documentKey IS NOT NULL
    BEGIN
        -- Non-versioned document... delete all references
        DELETE FROM [dbo].[Hierarchy] WHERE [UniformKey] = @documentVersionKey
        DELETE FROM [dbo].[PublishRequestDetail] WHERE [ContentDocumentKey] = @documentKey
        DELETE FROM [dbo].[DocumentMain] WHERE [DocumentVersionKey] = @documentVersionKey
        EXEC [dbo].[asi_AccessKeyDelete] @accessKey
        DELETE FROM [dbo].[UniformTag] WHERE [UniformKey] = @documentVersionKey
        DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentKey
        DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentVersionKey
        DELETE FROM [dbo].[UniformLicense] WHERE [UniformKey] = @documentVersionKey
    END
    
    SET NOCOUNT OFF
END

GO

----------------------------------------------------------------
-- Fix cross-linked private ACLs that can cause upgrade failures
----------------------------------------------------------------
IF EXISTS(SELECT 1 FROM DocumentMain d WHERE DocumentStatusCode = 40 AND AccessKey IN (
            SELECT d.AccessKey FROM DocumentMain d INNER JOIN AccessMain a ON d.AccessKey = a.AccessKey
             WHERE d.DocumentStatusCode = 40 AND a.AccessScope = 'Local'
             GROUP BY d.AccessKey
             HAVING COUNT(d.AccessKey) > 1)
         )
BEGIN
    -- Get the list of documents that have cross-linked access keys
    IF OBJECT_ID('tempdb..#docs') IS NOT NULL DROP TABLE #docs;
    CREATE TABLE #docs (DocumentVersionKey uniqueidentifier, AccessKey uniqueidentifier, Instance int, NewAccessKey uniqueidentifier NULL)
    INSERT INTO #docs
       SELECT DocumentVersionKey, d.AccessKey, ROW_NUMBER() OVER (PARTITION BY d.AccessKey ORDER BY d.AccessKey), d.AccessKey
         FROM DocumentMain d
        WHERE DocumentStatusCode = 40 AND AccessKey IN (
            SELECT d.AccessKey
              FROM DocumentMain d
                   INNER JOIN AccessMain a ON d.AccessKey = a.AccessKey
             WHERE d.DocumentStatusCode = 40 AND a.AccessScope = 'Local'
             GROUP BY d.AccessKey
             HAVING COUNT(d.AccessKey) > 1
        ) ORDER BY d.AccessKey
        
    CREATE NONCLUSTERED INDEX IX_docs_DocumentVersionKey ON #docs (DocumentVersionKey) INCLUDE (NewAccessKey, Instance) WHERE Instance <> 1 
    CREATE NONCLUSTERED INDEX IX_docs_AccessKey ON #docs (AccessKey) INCLUDE (NewAccessKey, Instance) WHERE Instance <> 1
    CREATE NONCLUSTERED INDEX IX_docs_Instance ON #docs (Instance) INCLUDE (DocumentVersionKey, AccessKey, NewAccessKey) WHERE Instance <> 1
     
    -- Create a new AccessKey for all the duplicates
    UPDATE #docs
       SET NewAccessKey = NEWID()
     WHERE Instance <> 1
    
    -- Make a copy of all the AccessMain rows for a given document's access key using the new AccessKey
    INSERT INTO [dbo].[AccessMain] (AccessKey, AccessScope, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
        SELECT d.NewAccessKey, am.AccessScope, am.CreatedByUserKey, GETDATE(), am.UpdatedByUserKey, GETDATE()
          FROM #docs d
               INNER JOIN AccessMain am ON d.AccessKey = am.AccessKey
         WHERE d.Instance <> 1
         
    -- Make a copy of all the AccessItem rows for a given documents' access key using the new AccessKey
    INSERT INTO [dbo].[AccessItem] (AccessKey, Grantee, Permission, GroupKey, RoleKey, UserKey)
        SELECT d.NewAccessKey, ai.Grantee, ai.Permission, ai.GroupKey, ai.RoleKey, ai.UserKey
          FROM #docs d
               INNER JOIN AccessItem ai ON d.AccessKey = ai.AccessKey
         WHERE d.Instance <> 1           

    -- Update the documents to reference their new AccessKeys
    UPDATE dm
       SET dm.[AccessKey] = d.NewAccessKey
      FROM [dbo].[DocumentMain] dm
           INNER JOIN #docs d ON dm.DocumentVersionKey = d.DocumentVersionKey
     WHERE dm.DocumentStatusCode = 40 
       AND dm.AccessKey = d.AccessKey 
       AND d.Instance <> 1
    -- Clean up   
    IF OBJECT_ID('tempdb..#docs') IS NOT NULL DROP TABLE #docs;
END
GO

---------------------------------------------------
-- PBI 52837 - Staff user control
---------------------------------------------------
-- Delete the now-redundant My Account link from the Staff site
EXEC dbo.asi_DocumentDelete '77F4285E-7688-4CCC-8C0C-1E4BCBB2A765', 1
GO

----------------------------------------------
--SBT 53397 Remove unused table
----------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuplicatePartyGroup')
BEGIN
    DROP TABLE [dbo].[DuplicatePartyGroup]
END
GO


----------------------------------------------
-- PBI 52197 - Staff site navigation
----------------------------------------------
-- Remove the obsolete "Manage my community preferences" link
EXEC asi_DocumentDelete 'A4C94640-377F-491C-8443-41182100622C', 1
GO

----------------------------------------------
-- PBI 53767 - Certification inactive enrollments bug
----------------------------------------------
-- Remove the obsolete query
EXEC dbo.asi_DocumentDelete '5E524EE1-DE7A-47F4-9919-43A0B4F3ECE9', 1
GO

-------------------------
-- PBI 54255:v10/v100 Licensing - Cleanup existing license table and code
-------------------------

-- Delete from Uniform License table the Document version key from LicenseRef object
DELETE FROM [dbo].[UniformLicense] WHERE [UniformKey] IN (SELECT [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'License' AND [DocumentTypeCode] IN ('BOD','BUS','DBS'))


-- Delete the BOD and other documents associated with License, LicenseMap, LicenseMapMaster, LicenseTypeRef tables

--License
EXEC dbo.asi_DocumentDelete '8605F814-E474-4E2C-8000-0D99903C9B4A', 1 -- BUS
EXEC dbo.asi_DocumentDelete '2AF2E273-90B6-4D24-ACE6-3232FE92C619', 1 -- DBS
EXEC dbo.asi_DocumentDelete '53A1BB26-B81B-486C-A323-8B133045C6E2', 1 -- BOD

--LicenseMap
EXEC dbo.asi_DocumentDelete '57FF4341-F100-4239-B7D4-F9691D38304D', 1 -- BUS
EXEC dbo.asi_DocumentDelete 'C1C9476F-C56A-49E2-9EDE-688AEBC5B951', 1 -- DBS
EXEC dbo.asi_DocumentDelete '9F65B9E8-38E8-4520-B2A4-C05D37D40A1E', 1 -- BOD


--LicenseMapMaster
EXEC dbo.asi_DocumentDelete '56C98F60-6F21-4D9C-8913-4B8E3B5AE000', 1 -- BUS
EXEC dbo.asi_DocumentDelete '5E04CC06-2B35-4F1C-BF05-7CFA8BD323CC', 1 -- DBS
EXEC dbo.asi_DocumentDelete '2DF5551E-173C-48D2-9E3B-00EC03FCFBEF', 1 -- BOD


--LicenseTypeRef
EXEC dbo.asi_DocumentDelete '0AFDBC64-2EB6-4010-A5DB-22862E18848E', 1 -- BUS
EXEC dbo.asi_DocumentDelete 'BCCFA3F3-7CE4-408D-BBED-913923DDD0A5', 1 -- DBS
EXEC dbo.asi_DocumentDelete '74CFD7FF-3C89-4283-B2E4-91157EBA0FA3', 1 -- BOD
GO


-- Drop the views associated with the Business objects

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='vBoLicense'
    AND TABLE_TYPE='VIEW')
BEGIN
    DROP VIEW [dbo].[vBoLicense]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='vBoLicenseMap'
    AND TABLE_TYPE='VIEW')
BEGIN
    DROP VIEW [dbo].[vBoLicenseMap]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='vBoLicenseMapMaster'
    AND TABLE_TYPE='VIEW')
BEGIN
    DROP VIEW [dbo].[vBoLicenseMapMaster]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='vBoLicenseTypeRef'
    AND TABLE_TYPE='VIEW')
BEGIN
    DROP VIEW [dbo].[vBoLicenseTypeRef]
END
GO

-- Drop LicneseMap, LicenseMapMaster and LicenseTypeRef tables
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMap' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LicenseMap]
END
GO 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMapMaster' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LicenseMapMaster]
END
GO 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseTypeRef' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LicenseTypeRef]
END
GO

-- Delete from Component Registry the mappings for old table

DELETE FROM [dbo].ComponentRegistry WHERE [Name] = 'LicenseMap'

DELETE FROM [dbo].ComponentRegistry WHERE [Name] = 'LicenseMapMaster'

DELETE FROM [dbo].ComponentRegistry WHERE [Name] = 'LicenseTypeRef'

-- Delete from System Config Checksums related to LicenseMap, LicenseMapMaster, LicneseTypeRef

DELETE FROM [dbo].SystemConfig WHERE [ParameterName] = 'LicenseMapChecksum'

DELETE FROM [dbo].SystemConfig WHERE [ParameterName] = 'LicenseMapMasterChecksum'

DELETE FROM [dbo].SystemConfig WHERE [ParameterName] = 'LicenseTypeRefChecksum'
GO

-------------------------------------------------------------------------------------
-- Delete the data from LicenseMaster, LicenseOrganizationVersion and LicenseOrganization tables on an upgrade
-------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM SystemConfig 
                WHERE ParameterName='DoNotTruncateLicenseTables')
BEGIN
    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND TABLE_TYPE = 'BASE TABLE')
    BEGIN

        DELETE FROM [dbo].[LicenseMaster]
    END

    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseOrganizationVersion' AND TABLE_TYPE = 'BASE TABLE')
    BEGIN

        DELETE FROM [dbo].[LicenseOrganizationVersion]
    END

    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseOrganization' AND TABLE_TYPE = 'BASE TABLE')
    BEGIN

        DELETE FROM [dbo].[LicenseOrganization]
    END
END
GO

---------------------------------------------------------------------
--PBI 54700 v10: Remove help site links from old staff web view \Admin
----------------------------------------------------------------------
--break point contacts nav
EXEC dbo.asi_DocumentDelete '35D30692-0BA4-4339-8D8B-2966D2F16361', 1

--contacts help nav
EXEC dbo.asi_DocumentDelete '74A6E970-9E6E-4ADC-B3F0-72C758BBF589', 1

--Donations break nav
EXEC dbo.asi_DocumentDelete '8237FB6A-5742-4098-A96F-CF2C7358B3DD', 1

--Donations help nav
EXEC dbo.asi_DocumentDelete 'C2F7E1BD-A101-4CBA-A186-6AA8F2E3F559', 1

--Marketing break nav
EXEC dbo.asi_DocumentDelete '5FBF639E-26B4-426E-B961-94F58FC42153', 1

--Marketing help nav
EXEC dbo.asi_DocumentDelete 'DA2E77CA-081E-4D5F-BA63-416D0186D0FA', 1

--Process Mgr break nav
EXEC dbo.asi_DocumentDelete 'E2CA8865-F244-45AF-9E99-F05384CAEC5B', 1

--Process Mgr help nav
EXEC dbo.asi_DocumentDelete '60CD6EDE-DD06-4A04-A489-2E84EFFB2299', 1

--Communities break nav
EXEC dbo.asi_DocumentDelete '2D9E3E93-104D-49EE-9009-4D7570BE8765', 1

--Communities help nav
EXEC dbo.asi_DocumentDelete '6708C0DE-5D44-448E-BACB-463598238B36', 1

--System Setup break nav
EXEC dbo.asi_DocumentDelete '6CBF2A3C-8C56-4C44-B59A-1371C7280E40', 1

--System Setup help nav
EXEC dbo.asi_DocumentDelete 'B1CA04A5-B6A8-492F-9B43-4389E1E47945', 1

--Tools break nav
EXEC dbo.asi_DocumentDelete '8F458EEC-33C9-40F3-84A1-64DCC757AA17', 1

--Tools help nav
EXEC dbo.asi_DocumentDelete 'B60D86FC-44B9-4936-8113-94E5974EFAA4', 1

--Content Management break nav
EXEC dbo.asi_DocumentDelete 'ED206C14-88E5-4511-89DE-C163E2CC4C5D', 1

--Content Management help nav
EXEC dbo.asi_DocumentDelete 'FD6EA3A9-87C4-4C32-8567-5270B48128F7', 1
GO


--------------------------------------------------------------------------------------------------------------------------------
--PBI 55145 Remove the task queue clean up task & asi_CleanTaskQueue from both branches
--------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME='asi_CleanTaskQueue'
    AND ROUTINE_TYPE='PROCEDURE')
BEGIN
      DROP PROCEDURE [dbo].[asi_CleanTaskQueue]
END
GO

----------------------------------------------
-- PBI 55167 - Remove AAC Help links
----------------------------------------------
-- Remove the obsolete help links and related [break]s from the Advanced Accounting Console
EXEC asi_DocumentDelete 'A964F06A-36B1-498B-9FC0-E108DFAFD55A', 1 -- AR/Cash
EXEC asi_DocumentDelete 'DA6CB7DA-F00E-4E5D-8AA1-A131443A34DD', 1 -- AR/Cash

EXEC asi_DocumentDelete '3028D3DF-6A5A-4927-A94D-B60BDB3AAAF9', 1 -- Commerce
EXEC asi_DocumentDelete '43971A95-ADA2-4153-AED5-FAB7C563ED7A', 1 -- Commerce

EXEC asi_DocumentDelete '43EBB400-76AF-4D69-886B-CB86A28A4CC7', 1 -- Continuum
EXEC asi_DocumentDelete 'DB02E58F-06F3-4A53-8DF4-70D639016A07', 1 -- Continuum

EXEC asi_DocumentDelete '65EC8CD7-C619-4D04-B097-195468329718', 1 -- Customer Service
EXEC asi_DocumentDelete 'A288F52A-EF90-4A22-9903-457D0F25591B', 1 -- Customer Service

EXEC asi_DocumentDelete 'E99CC2ED-4418-49E5-BC07-00CCC0ED54A6', 1 -- Events
EXEC asi_DocumentDelete '2486917A-6F48-47CE-998F-E71CF7E1D0D1', 1 -- Events

EXEC asi_DocumentDelete '29414BB0-776D-4B3B-A0C6-B139A2640869', 1 -- Fundraising
EXEC asi_DocumentDelete '4CA0DA06-01A5-425C-B707-164BEAF7EE7D', 1 -- Fundraising

EXEC asi_DocumentDelete 'B1E3C6C6-F1A5-4382-BDC8-E17FDCBE8900', 1 -- Membership
EXEC asi_DocumentDelete '3B44CE3D-FC96-4035-8787-A18B17FCE416', 1 -- Membership

EXEC asi_DocumentDelete '16F9170C-DCFB-4DF3-8DD9-A09E388521F0', 1 -- Settings
EXEC asi_DocumentDelete 'D8B998DC-72FE-4653-B4E2-391B0C6E855E', 1 -- Settings

EXEC asi_DocumentDelete '0CC59B9D-98E3-4000-A807-EEA44B537C27', 1 -- System admin
EXEC asi_DocumentDelete 'B3944827-125B-4581-BC03-43E85E24A882', 1 -- System admin

GO

--------------------------------------------------------------------------------------------------------------------------------
--PBI 55080 Delete old PublishQueue table and new old TaskQueue tables if they do not match the new schema (it will be re-added automatically later)
--------------------------------------------------------------------------------------------------------------------------------
-- Drop triggers that call asi_AddToPublishQueue - these will be recreated later
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_ContactMain_Insert_Update_Delete]'))
DROP TRIGGER [dbo].[asi_ContactMain_Insert_Update_Delete]
GO

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMain_Insert_Update_Delete]'))
DROP TRIGGER [dbo].[asi_DocumentMain_Insert_Update_Delete]
GO

---Delete FK constraint, we drop this table after migrating contents to TaskQueuePublishDetail
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishQueue' AND [CONSTRAINT_NAME] = 'FK_PublishQueue_PublishServerRef')
    ALTER TABLE [dbo].[PublishQueue] DROP CONSTRAINT [FK_PublishQueue_PublishServerRef]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublishQueue]') AND type in (N'U'))
    DROP TABLE [dbo].[PublishQueue]
GO

-- This table is replaced with 2 detail tables specific to the functions they are need for (TaskQueuePublishDetail and TaskQueueTriggerDetail)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskQueueDetail]') AND type in (N'U'))
    DROP TABLE [dbo].[TaskQueueDetail]
GO
-- If the table(s) exists with the old Primary Key column, drop it and it's foreign key
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskQueuePublishDetail]') AND type in (N'U'))
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TaskQueuePublishDetail' AND COLUMN_NAME = 'TaskQueueKey')
    BEGIN
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaskQueuePublishDetail_TaskQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaskQueuePublishDetail]'))
        ALTER TABLE [dbo].[TaskQueuePublishDetail] DROP CONSTRAINT [FK_TaskQueuePublishDetail_TaskQueue]

        DROP TABLE [dbo].[TaskQueuePublishDetail]
    END
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskQueueTriggerDetail]') AND type in (N'U'))
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TaskQueueTriggerDetail' AND COLUMN_NAME = 'TaskQueueKey')
    BEGIN
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaskQueueDetail_TaskQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaskQueueTriggerDetail]'))
        ALTER TABLE [dbo].[TaskQueueTriggerDetail] DROP CONSTRAINT [FK_TaskQueueDetail_TaskQueue]

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaskQueueDetail_TaskQueueChangeTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaskQueueTriggerDetail]'))
        ALTER TABLE [dbo].[TaskQueueTriggerDetail] DROP CONSTRAINT [FK_TaskQueueDetail_TaskQueueChangeTypeRef]

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaskQueueDetail_TaskQueueStatusRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaskQueueTriggerDetail]'))
        ALTER TABLE [dbo].[TaskQueueTriggerDetail] DROP CONSTRAINT [FK_TaskQueueDetail_TaskQueueStatusRef]

        DROP TABLE [dbo].[TaskQueueTriggerDetail]
    END
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskQueue]') AND type in (N'U'))
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TaskQueue' AND COLUMN_NAME = 'TaskQueueKey')
    BEGIN
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaskQueue_TaskQueueTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaskQueue]'))
        ALTER TABLE [dbo].[TaskQueue] DROP CONSTRAINT [FK_TaskQueue_TaskQueueTypeRef]
        
        DROP TABLE [dbo].[TaskQueue]
    END
END
GO


-- Drop all of the BAE Stored Procedures
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEAccountPendingDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEAccountPendingDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEAccountPendingGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEAccountPendingGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEAccountPendingInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEAccountPendingInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEAccountPendingLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEAccountPendingLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEAccountPendingUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEAccountPendingUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEActivityTypeGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEActivityTypeGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEActivityTypeGetFundraising' AND [type] = 'P') DROP PROCEDURE dbo.BAEActivityTypeGetFundraising;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingBillingCategories' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingBillingCategories;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingMembershipSignupCheck' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingMembershipSignupCheck;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingMemberTypes' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingMemberTypes;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingSetupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingSetupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingSetupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingSetupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingSetupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingSetupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingSetupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingSetupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEBillingSetupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEBillingSetupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingGetAllByUser' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingGetAllByUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartBillingUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartBillingUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionGetAllForEvent' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionGetAllForEvent;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionGetForUserByFunctionCode' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionGetForUserByFunctionCode;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventFunctionUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventFunctionUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventGetAllForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventGetAllForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventGetForUserByEventCode' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventGetForUserByEventCode;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartEventUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartEventUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetBestShippingRate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetBestShippingRate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetCartUsers' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetCartUsers;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetCCAuthAccountInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetCCAuthAccountInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetFlatRateHandling' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetFlatRateHandling;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingChargeType' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingChargeType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingMaxChargeOfFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingMaxChargeOfFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingMaxChargeOfTotal' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingMaxChargeOfTotal;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingMinChargeOfFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingMinChargeOfFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingMinChargeOfTotal' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingMinChargeOfTotal;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingMinOrder' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingMinOrder;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingPercentOfFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingPercentOfFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetHandlingPercentOfTotal' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetHandlingPercentOfTotal;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetMaxAutoFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetMaxAutoFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetMinAutoFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetMinAutoFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartGetZoneCode' AND [type] = 'P') DROP PROCEDURE dbo.BAECartGetZoneCode;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemGetAllForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemGetAllForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartItemUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartItemUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderGetAllForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderGetAllForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderGetForUserByProductCode' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderGetForUserByProductCode;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECartOrderUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAECartOrderUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEChangeLogGetByType' AND [type] = 'P') DROP PROCEDURE dbo.BAEChangeLogGetByType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECheckIfStoredProcExists' AND [type] = 'P') DROP PROCEDURE dbo.BAECheckIfStoredProcExists;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECompanyContactLoginValidation' AND [type] = 'P') DROP PROCEDURE dbo.BAECompanyContactLoginValidation;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECompanySearch' AND [type] = 'P') DROP PROCEDURE dbo.BAECompanySearch;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustom_GetUserInfoForFormLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAECustom_GetUserInfoForFormLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustomerFindPendingRecord' AND [type] = 'P') DROP PROCEDURE dbo.BAECustomerFindPendingRecord;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustomerFindRecord' AND [type] = 'P') DROP PROCEDURE dbo.BAECustomerFindRecord;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustomerGetDirectory' AND [type] = 'P') DROP PROCEDURE dbo.BAECustomerGetDirectory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustomerValidateLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAECustomerValidateLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAECustomerValidateWebLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAECustomerValidateWebLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEDisplayGetSelectiveContent' AND [type] = 'P') DROP PROCEDURE dbo.BAEDisplayGetSelectiveContent;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEErrorDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEErrorDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEErrorGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEErrorGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEErrorInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEErrorInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEErrorLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEErrorLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEErrorUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEErrorUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventAddGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventAddGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventAddRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventAddRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventAddRegistrantAnswer' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventAddRegistrantAnswer;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventCheckRegistrantStatus' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventCheckRegistrantStatus;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventDeleteGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventDeleteGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventDeleteRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventDeleteRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventDeleteRegistrationAnswer' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventDeleteRegistrationAnswer;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetAllLinkedFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetAllLinkedFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetAutoEnrollFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetAutoEnrollFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetCoupons' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetCoupons;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetCoworkers' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetCoworkers;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetDetails' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetDetails;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetFunction' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetFunction;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetFunctionPricing' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetFunctionPricing;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetFunctionRegistrationCount' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetFunctionRegistrationCount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetFunctionRegistrationCounts' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetFunctionRegistrationCounts;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetGuestBadgeList' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetGuestBadgeList;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetGuests' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetGuests;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetLinkedFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetLinkedFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetList' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetList;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetRegistrantAnswer' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetRegistrantAnswer;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetRegistrantAnswers' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetRegistrantAnswers;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetRegistrants' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetRegistrants;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventGetRegistrationAnswersByQuestionId' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventGetRegistrationAnswersByQuestionId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSearch' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSearch;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddFunctionGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddFunctionGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddGeneralInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddGeneralInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddLabel' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddLabel;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddQuestion' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddQuestion;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddQuestionChoice' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddQuestionChoice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupAddRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupAddRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupCheckMemberStatus' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupCheckMemberStatus;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupCheckMemberType' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupCheckMemberType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupCheckRegistrantClasses' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupCheckRegistrantClasses;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupClone' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupClone;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupCloneAlt' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupCloneAlt;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetAvailFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetAvailFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetChosenFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetChosenFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetFunction' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetFunction;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetFunctionQuestions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetFunctionQuestions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetFunctionsByGroupName' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetFunctionsByGroupName;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetGeneralInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetGeneralInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetGroups' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetGroups;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetLabel' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetLabel;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetQuestion' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetQuestion;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetQuestionChoice' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetQuestionChoice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetQuestionChoices' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetQuestionChoices;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetQuestions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetQuestions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupGetRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupGetRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupMoveFunctionDown' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupMoveFunctionDown;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupMoveFunctionUp' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupMoveFunctionUp;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupMoveQuestionDown' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupMoveQuestionDown;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupMoveQuestionUp' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupMoveQuestionUp;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveFunctionGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveFunctionGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveGeneralInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveGeneralInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveGuest' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveGuest;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveLabel' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveLabel;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveQuestion' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveQuestion;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveQuestionChoice' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveQuestionChoice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupRemoveRegistrant' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupRemoveRegistrant;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventSetupUpdateQuestion' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventSetupUpdateQuestion;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventValidateRegistrantFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventValidateRegistrantFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEEventValidateRegistrantQuestions' AND [type] = 'P') DROP PROCEDURE dbo.BAEEventValidateRegistrantQuestions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignGetAllByNoSection' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignGetAllByNoSection;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignGetAllBySectionName' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignGetAllBySectionName;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignGetAllByTableName' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignGetAllByTableName;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignSectionLookupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignSectionLookupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignSectionLookupGetAllByTable' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignSectionLookupGetAllByTable;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignSectionLookupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignSectionLookupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignSectionLookupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignSectionLookupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignSectionLookupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignSectionLookupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldDesignUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldDesignUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionLoadSectionName' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionLoadSectionName;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFieldSectionUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEFieldSectionUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFinalizePOForOrder' AND [type] = 'P') DROP PROCEDURE dbo.BAEFinalizePOForOrder;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFindProductsWithCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAEFindProductsWithCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEFixEventStatus' AND [type] = 'P') DROP PROCEDURE dbo.BAEFixEventStatus;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetAddressPurpose' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetAddressPurpose;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetAllEvents' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetAllEvents;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetCommitteeMembers' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetCommitteeMembers;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetCommittees' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetCommittees;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetExistingLineTotal' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetExistingLineTotal;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetExistingShippingCost' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetExistingShippingCost;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetFundraisingSources' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetFundraisingSources;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetImisLoginInformation' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetImisLoginInformation;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetPrefixLabels' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetPrefixLabels;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetSuffixLabels' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetSuffixLabels;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetSuperProductAttributes' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetSuperProductAttributes;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetSuperProductAttributeValueForProductViewFromCartView' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetSuperProductAttributeValueForProductViewFromCartView;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetSuperProductAttributeValuesForProductView' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetSuperProductAttributeValuesForProductView;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetUserAccessRights' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetUserAccessRights;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEGetUserBasic' AND [type] = 'P') DROP PROCEDURE dbo.BAEGetUserBasic;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryAdd' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryAdd;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEHistoryUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEHistoryUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisActivityGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisActivityGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisActivityGetAllByUserIdActivityType' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisActivityGetAllByUserIdActivityType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisActivityGetAllByUserIdActivityTypeDate' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisActivityGetAllByUserIdActivityTypeDate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisActivityLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisActivityLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCashAccountsGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCashAccountsGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCashAccountsLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCashAccountsLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCCAuthAcctGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCCAuthAcctGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCCAuthAcctGetByCashAccount' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCCAuthAcctGetByCashAccount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCCAuthAcctLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCCAuthAcctLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCountry_NamesGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCountry_NamesGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisCountry_NamesLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisCountry_NamesLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisDuesProductGetSourceFieldFromNameAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisDuesProductGetSourceFieldFromNameAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisDuesUpdatePrice' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisDuesUpdatePrice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisExchangeRateLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisExchangeRateLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetCustomTableColumn' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetCustomTableColumn;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetMeetMaster' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetMeetMaster;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetMemberType' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetMemberType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetNameAddress' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetNameAddress;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetProduct' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetProduct;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetProductFunction' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetProductFunction;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetProductFunctions' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetProductFunctions;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisGetProductPrice' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisGetProductPrice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisIsoCurrencyCodesGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisIsoCurrencyCodesGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisIsoCurrencyCodesGetAllWithExchangeRate' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisIsoCurrencyCodesGetAllWithExchangeRate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisMemberTypesGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisMemberTypesGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGet' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGet;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetAllForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetAllForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetByPurpose' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetByPurpose;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetPreferredBill' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetPreferredBill;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetPreferredMail' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetPreferredMail;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetPurposes' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetPurposes;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameAddressGetPurposesForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameAddressGetPurposesForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameFinGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameFinGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameFinGetTaxAuthor' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameFinGetTaxAuthor;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameFinGetTaxExemption' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameFinGetTaxExemption;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameFinLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameFinLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameGet' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameGet;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameGetAddressNumAndPurposeForUser' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameGetAddressNumAndPurposeForUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameGetAllByCompanyId' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameGetAllByCompanyId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameGetAllByMemberType' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameGetAllByMemberType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityAdd' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityAdd;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGet' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGet;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGetByWebLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGetByWebLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGroupsAdd' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGroupsAdd;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGroupsDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGroupsDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGroupsGet' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGroupsGet;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGroupsGetAllBySecurityGroup' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGroupsGetAllBySecurityGroup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecurityGroupsSave' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecurityGroupsSave;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisNameSecuritySave' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisNameSecuritySave;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderbadgeInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderbadgeInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderbadgeUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderbadgeUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderEventGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderEventGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderEventLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderEventLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderGuestGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderGuestGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderGuestLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderGuestLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderLineGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderLineGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrderLineLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrderLineLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersGet' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersGet;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersGetAllByUser' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersGetAllByUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersGetAllUsersByDateRange' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersGetAllUsersByDateRange;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisOrdersSearch' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisOrdersSearch;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductFunctionGetRegistrationCount' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductFunctionGetRegistrationCount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductGetAllBilling' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductGetAllBilling;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductGetAllByType' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductGetAllByType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductGetProductTaxExemption' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductGetProductTaxExemption;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductKitGetAllChildren' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductKitGetAllChildren;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductKitLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductKitLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductPriceLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductPriceLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisProductTaxGetTaxRatio' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisProductTaxGetTaxRatio;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSecurityGroupsDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSecurityGroupsDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSecurityGroupsGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSecurityGroupsGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSecurityGroupsInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSecurityGroupsInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSecurityGroupsLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSecurityGroupsLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisState_CodesGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisState_CodesGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisState_CodesLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisState_CodesLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSubscriptionsGetAllByUser' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSubscriptionsGetAllByUser;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSubscriptionsGetSubscription' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSubscriptionsGetSubscription;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSubscriptionsGetSubscriptionByMemberType' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSubscriptionsGetSubscriptionByMemberType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSystemParamsGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSystemParamsGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSystemParamsGetTaxToFreight' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSystemParamsGetTaxToFreight;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSystemParamsGetTaxToHandling' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSystemParamsGetTaxToHandling;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSystemParamsLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSystemParamsLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisSystemParamsWebSalesCityAndState' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisSystemParamsWebSalesCityAndState;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisTransGetAllByShipToId' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisTransGetAllByShipToId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisTransGetAllByTransNumber' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisTransGetAllByTransNumber;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisTransGetAllByUserId' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisTransGetAllByUserId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisTransGetAllByUserIdAndProductCode' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisTransGetAllByUserIdAndProductCode;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisTransGetAllByUserIdAndSourceSystem' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisTransGetAllByUserIdAndSourceSystem;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisUdFieldGetAllByTableName' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisUdFieldGetAllByTableName;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisUdFieldGetMultiSelectValues' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisUdFieldGetMultiSelectValues;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisUDFieldLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisUDFieldLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisUDTableGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisUDTableGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisUDTableLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisUDTableLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEImisZipCodeGetUserCounty' AND [type] = 'P') DROP PROCEDURE dbo.BAEImisZipCodeGetUserCounty;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEInsertError' AND [type] = 'P') DROP PROCEDURE dbo.BAEInsertError;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEMember_TypesLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEMember_TypesLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAENCookieValues' AND [type] = 'P') DROP PROCEDURE dbo.BAENCookieValues;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAENSGCookieValues' AND [type] = 'P') DROP PROCEDURE dbo.BAENSGCookieValues;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAnswerDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAnswerDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAnswerGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAnswerGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAnswerInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAnswerInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAnswerLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAnswerLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAnswerUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAnswerUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeCheckForChildProducts' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeCheckForChildProducts;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeGetAllForProduct' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeGetAllForProduct;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeGetAllForProductCount' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeGetAllForProductCount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeGetLastSortOrderFromLookup' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeGetLastSortOrderFromLookup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeLoadValues' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeLoadValues;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderAttributeValuesForSuperProduct' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderAttributeValuesForSuperProduct;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryGetAllChildren' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryGetAllChildren;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryLoadParent' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryLoadParent;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupGetorderCategoryParentId' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupGetorderCategoryParentId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryParentLookupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryParentLookupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCategoryUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCategoryUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCheckoutDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCheckoutDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCheckoutGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCheckoutGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCheckoutInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCheckoutInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCheckoutLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCheckoutLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderCheckoutUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderCheckoutUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductAddCrossSell' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductAddCrossSell;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCategoryLookupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCategoryLookupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCategoryLookupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCategoryLookupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCategoryLookupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCategoryLookupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCategoryLookupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCategoryLookupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCategoryLookupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCategoryLookupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCrossSellLookupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCrossSellLookupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCrossSellLookupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCrossSellLookupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCrossSellLookupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCrossSellLookupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCrossSellLookupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCrossSellLookupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductCrossSellLookupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductCrossSellLookupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllByCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllByCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllChildren' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllChildren;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllChildrenCount' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllChildrenCount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllInCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllInCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllNotInCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllNotInCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllSuperProducts' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllSuperProducts;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAllSuperProductsCount' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAllSuperProductsCount;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetAvailableInventory' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetAvailableInventory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetCrossSellAvail' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetCrossSellAvail;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetCrossSellSelected' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetCrossSellSelected;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetCrossSellSelectedToDisplay' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetCrossSellSelectedToDisplay;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetFeaturedProductsByCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetFeaturedProductsByCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductGetQuantityOnHand' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductGetQuantityOnHand;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductRemoveCrossSell' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductRemoveCrossSell;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderProductUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderProductUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLookupDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLookupDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLookupGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLookupGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLookupInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLookupInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLookupLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLookupLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeLookupUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeLookupUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueDeleteFromId' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueDeleteFromId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueGetAllByOrderAttributeId' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueGetAllByOrderAttributeId;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueLoadForProduct' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueLoadForProduct;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductAttributeValueUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductAttributeValueUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductAttributeDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductAttributeDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductAttributeGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductAttributeGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductAttributeInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductAttributeInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductAttributeLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductAttributeLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductAttributeUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductAttributeUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductGetDefaultChildProductID' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductGetDefaultChildProductID;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductInsert' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductInsert;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductLoad;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductUpdate' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductUpdate;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEOrderSuperProductChildProductUpdateDefaultForPrice' AND [type] = 'P') DROP PROCEDURE dbo.BAEOrderSuperProductChildProductUpdateDefaultForPrice;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEPostCreateCleanup' AND [type] = 'P') DROP PROCEDURE dbo.BAEPostCreateCleanup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEPostUpdateWrapup' AND [type] = 'P') DROP PROCEDURE dbo.BAEPostUpdateWrapup;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEProductGetByType' AND [type] = 'P') DROP PROCEDURE dbo.BAEProductGetByType;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementAvailableRecords' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementAvailableRecords;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementAvailableRecordsDefault' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementAvailableRecordsDefault;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementCompanyContact' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementCompanyContact;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementGetRemovalReasonCodes' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementGetRemovalReasonCodes;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementMemberTypes' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementMemberTypes;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementRecordDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementRecordDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAERosterManagementSetUserActive' AND [type] = 'P') DROP PROCEDURE dbo.BAERosterManagementSetUserActive;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAESearchEvents' AND [type] = 'P') DROP PROCEDURE dbo.BAESearchEvents;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAESearchProductsWithCategory' AND [type] = 'P') DROP PROCEDURE dbo.BAESearchProductsWithCategory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAESyncImisUserDefinedTables' AND [type] = 'P') DROP PROCEDURE dbo.BAESyncImisUserDefinedTables;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateBatchInformation' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateBatchInformation;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateCreditCardStatus' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateCreditCardStatus;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateEventPOPurchase' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateEventPOPurchase;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateIMISShipMethod' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateIMISShipMethod;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateLoginTime' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateLoginTime;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateOrderEnteredBy' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateOrderEnteredBy;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateOrderInformation' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateOrderInformation;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateOrderProductInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateOrderProductInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateOrderShipping' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateOrderShipping;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateOrderTransactionsByOrderNumber' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateOrderTransactionsByOrderNumber;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateRegistrantEventOrderInfo' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateRegistrantEventOrderInfo;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEUpdateWebLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAEUpdateWebLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEValidateLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAEValidateLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEValidateWebLogin' AND [type] = 'P') DROP PROCEDURE dbo.BAEValidateWebLogin;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEVerifyUserAdded' AND [type] = 'P') DROP PROCEDURE dbo.BAEVerifyUserAdded;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEWriteHistory' AND [type] = 'P') DROP PROCEDURE dbo.BAEWriteHistory;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEZipCodesDelete' AND [type] = 'P') DROP PROCEDURE dbo.BAEZipCodesDelete;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEZipCodesGetAll' AND [type] = 'P') DROP PROCEDURE dbo.BAEZipCodesGetAll;
IF EXISTS (SELECT 1 FROM sys.objects WHERE name = N'BAEZipCodesLoad' AND [type] = 'P') DROP PROCEDURE dbo.BAEZipCodesLoad;
GO


--------------------------------------------------------------------------------------------------------------------
--PBI 55099 v10: Remove the old staff web view \Admin site and any desktop navigation pointing to public view pages
--------------------------------------------------------------------------------------------------------------------
-- Admin site
-- Delete URL Mappings for Admin
DELETE FROM [dbo].[URLMapping] WHERE [WebsiteDocumentVersionKey] = 'D30229F1-D53B-48D7-99AE-D0CE9FEA621D'
GO

-- Update Group Perspective from Admin to Staff
UPDATE [dbo].[GroupPerspective] 
   SET [PerspectiveKey] = '8D22E78D-5E61-48A4-9264-D3522A7D8F7F' 
 WHERE [PerspectiveKey] = '3391C497-FAA5-4944-B60F-9AD04C0B5B70'
GO

-- Update default user Perspective
ALTER TABLE [dbo].[UserMain] DISABLE TRIGGER ALL;
IF OBJECT_ID('tempdb..#defaultPerspectivesToUpdate') IS NOT NULL DROP TABLE #defaultPerspectivesToUpdate;
CREATE TABLE #defaultPerspectivesToUpdate (UserKey uniqueidentifier NOT NULL)
INSERT INTO #defaultPerspectivesToUpdate
    SELECT [UserKey]
      FROM [dbo].[UserMain]
     WHERE [DefaultPerspectiveKey] = '3391C497-FAA5-4944-B60F-9AD04C0B5B70'
ALTER TABLE #defaultPerspectivesToUpdate ADD CONSTRAINT PK_defaultPerspectivesToUpdate PRIMARY KEY (UserKey);    
UPDATE um
   SET um.[DefaultPerspectiveKey] = '8D22E78D-5E61-48A4-9264-D3522A7D8F7F' 
  FROM [dbo].[UserMain] um
       INNER JOIN #defaultPerspectivesToUpdate dp ON um.UserKey = dp.UserKey
IF OBJECT_ID('tempdb..#defaultPerspectivesToUpdate') IS NOT NULL DROP TABLE #defaultPerspectivesToUpdate;
ALTER TABLE [dbo].[UserMain] ENABLE TRIGGER ALL;
GO

-- Delete the perspective
DELETE FROM [dbo].[Perspective] WHERE [PerspectiveKey] = '3391C497-FAA5-4944-B60F-9AD04C0B5B70'
GO

-- Delete the WEB document
EXEC dbo.asi_DocumentDelete 'D30229F1-D53B-48D7-99AE-D0CE9FEA621D', 1
GO

-- Delete the Hierarchy Root
DELETE FROM [dbo].[HierarchyRoot] WHERE [RootHierarchyKey] = '6EDD071C-AECA-42F5-847E-3E7AABEA2A6B'
GO

-- Delete bad hierarchy
DELETE h
  FROM [dbo].[Hierarchy] h
       LEFT OUTER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey
 WHERE [RootHierarchyKey] = '6EDD071C-AECA-42F5-847E-3E7AABEA2A6B' AND d.DocumentVersionKey IS NULL
GO

-- Delete children of the sitemap we wish to delete
EXEC dbo.asi_DocumentDelete 'E31892CE-622D-45A2-AAC3-298DBC3103E1', 1
EXEC dbo.asi_DocumentDelete '48BC0D1B-A41D-4481-899A-5653515A6D62', 1
EXEC dbo.asi_DocumentDelete 'BAC7ECFA-C408-4703-B272-7B9C9BC991EE', 1
EXEC dbo.asi_DocumentDelete '55F87FD3-EF2A-43B9-81B8-52307CB9DE73', 1
EXEC dbo.asi_DocumentDelete 'B137B4C2-0A3A-4735-8C29-BF0D173D9603', 1
EXEC dbo.asi_DocumentDelete 'E1501AC4-7CDC-44E4-BF45-91DFAE16A713', 1
EXEC dbo.asi_DocumentDelete 'B6623395-9437-4AD5-93DC-97BCBFE5EB04', 1
EXEC dbo.asi_DocumentDelete '10891CB5-C526-4B27-8EA7-07C49A10D1D4', 1
EXEC dbo.asi_DocumentDelete 'B798BD76-EA43-4ED0-A1CD-B1AA4FFCE967', 1
EXEC dbo.asi_DocumentDelete 'A21BDB2A-1F78-48DE-BC17-6D899EDED748', 1
EXEC dbo.asi_DocumentDelete 'B1F613E7-85C8-454E-BAB0-0E22B8C9DCF0', 1
EXEC dbo.asi_DocumentDelete '87F8FA24-2C47-4B3A-A86E-66031D7F04EF', 1
EXEC dbo.asi_DocumentDelete '891C5376-643C-4315-B8E5-5ECB8F624FDA', 1
EXEC dbo.asi_DocumentDelete 'C7BD4851-20C3-40A9-B160-2AD69A5F877E', 1
EXEC dbo.asi_DocumentDelete '4E893D44-70FC-491E-B16C-6CC7C47A7820', 1
EXEC dbo.asi_DocumentDelete 'A3427992-D486-4C51-BDD9-8219CC0C0CBB', 1
EXEC dbo.asi_DocumentDelete '7DBB69DD-DF53-4D48-B757-BA2C30DCBF87', 1
EXEC dbo.asi_DocumentDelete '734DC01B-9553-4E8A-84E0-10058699880F', 1
EXEC dbo.asi_DocumentDelete '81C35753-4FA5-428D-84CD-2ABA6B9D12E8', 1
EXEC dbo.asi_DocumentDelete '0A934684-8465-4B68-B5CC-B4E994A76BF8', 1
EXEC dbo.asi_DocumentDelete 'B4EC92CC-0945-4793-AE01-8119E33534F4', 1
EXEC dbo.asi_DocumentDelete 'ED04F3DC-4428-461E-9286-6E3AE5AB11DA', 1
EXEC dbo.asi_DocumentDelete '33A889B0-4AAB-4506-910C-59094FB5925E', 1
EXEC dbo.asi_DocumentDelete '56610050-15E5-436F-B4FD-67CB1E94F50D', 1
EXEC dbo.asi_DocumentDelete '2488525E-D3E7-4427-A82E-90612531A82E', 1
EXEC dbo.asi_DocumentDelete '0749349C-4063-4A1B-AB1D-0AFEBEA90847', 1
EXEC dbo.asi_DocumentDelete 'CAB293E8-B360-410F-AB0F-09BE26FEB4BE', 1
EXEC dbo.asi_DocumentDelete '04B8A389-4F78-4661-BBAF-EC3D94AB93C5', 1
EXEC dbo.asi_DocumentDelete '9280607F-7C4B-4A50-9DA5-865E6C723ABD', 1
EXEC dbo.asi_DocumentDelete 'AA608E8D-7763-4D86-AA49-83BA40243479', 1
GO

-- Since we're deleting a root, we need to null out the Root HierarchyKey to break the 
-- circular dependencies so that the full deletion of the entire tree can succeed with
-- no Foreign Key constraint errors
DECLARE @rootHierarchyKey uniqueidentifier;
SELECT @rootHierarchyKey = [RootHierarchyKey] FROM [dbo].[Hierarchy] WHERE [UniformKey] = '35ACFAD2-9E0C-42B9-97A3-E3094018D4DB'
UPDATE Hierarchy
   SET RootHierarchyKey = NULL
 WHERE RootHierarchyKey = '6EDD071C-AECA-42F5-847E-3E7AABEA2A6B';
GO

-- Delete the sitemap
EXEC dbo.asi_DocumentDelete '35ACFAD2-9E0C-42B9-97A3-E3094018D4DB', 1
GO

-- Delete all documents referenced by hierarchy with a NULL Root HierarchyKey
DELETE d 
  FROM [dbo].[Hierarchy] h
     LEFT OUTER JOIN [dbo].[DocumentMain] d ON h.[UniformKey] = d.[DocumentVersionKey]
 WHERE [RootHierarchyKey] IS NULL
GO

-- Delete all hierarchy where the Root Hierarchy is null
DELETE FROM [dbo].[Hierarchy]
 WHERE [RootHierarchyKey] IS NULL
GO 
 
-- Desktop navigation
-- CS/Orders/Manage inventory/Manage master product attributes
EXEC dbo.asi_DocumentDelete '915d8e46-0013-48d1-9536-04bda4be7990', 1
GO
-- CS/Orders/Manage inventory/Manage master products
EXEC dbo.asi_DocumentDelete '52FC5079-7C72-45B5-BF08-B7541E142638', 1
GO
-- ~/System Setup/Set up web components	
EXEC [dbo].[asi_DocumentDelete] '02F6DE30-7EB8-49D5-A5CA-04FC0568DBE9', 1
GO
-- ~/System Setup/Set up customer web components	
EXEC [dbo].[asi_DocumentDelete] '6009418E-454F-42ED-BC43-D019D1D29819', 1
GO
-- ~/System Setup/Set up events web components	
EXEC [dbo].[asi_DocumentDelete] 'B165F30D-97C6-4754-9F2F-307B9527C3A3', 1
GO
-- ~/System Setup/Set up commerce web components	
EXEC [dbo].[asi_DocumentDelete] '51B5F8F6-8B3C-4270-BE0F-FDFDD6082CFD', 1
GO
-- ~/System Setup/[break]
EXEC [dbo].[asi_DocumentDelete] '18A322CC-3BBF-49DD-AE00-73F2438FB842', 1
GO

-- Remove public view stored procedure
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_eSeriesInitialSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_eSeriesInitialSettings]
GO

--------------------------------------------------------------------------------------------------------------------
--PBI 56148 Update desktop documentation links
--------------------------------------------------------------------------------------------------------------------
-- Remove help links for functionality that has been removed from Desktop
EXEC dbo.asi_DocumentDelete '047EA58A-C75A-419D-8F0C-75C519E3430E', 1 -- Marketing > Break
EXEC dbo.asi_DocumentDelete '680802D8-31C2-4071-901C-2B77DEAD172B', 1 -- Marketing > Marketing help
EXEC dbo.asi_DocumentDelete '8E5F70B2-6908-4DB2-BD32-E0D92B3B363F', 1 -- Process mgr > Break
EXEC dbo.asi_DocumentDelete '2B74598C-30DD-440B-ABC2-B57FFF1A6DFF', 1 -- Process mgr > Process manager help
EXEC dbo.asi_DocumentDelete 'B912076E-A8D5-48D3-8EA1-53A4CBAB1CEF', 1 -- Tools > Tools help
GO

--------------------------------------------------------------------------------------------------------------------
--PBI 56659 - Error using PromotionRule and DiscountRule BOs
--------------------------------------------------------------------------------------------------------------------
-- Deleting the documents that were forgotten
EXEC dbo.asi_DocumentDelete 'D2AF5999-2391-4140-BC9A-01CEE618BECE', 1 -- DiscountRule DBS
EXEC dbo.asi_DocumentDelete 'AE89713F-20CB-4D20-8BAA-5B2AEF978E89', 1 -- DiscountRule BUS
EXEC dbo.asi_DocumentDelete '104D9FE9-55C5-441D-936A-DE637623E911', 1 -- PromotionRule DBS
EXEC dbo.asi_DocumentDelete '311E4733-C5D8-43F6-B873-8E33E7AC8AD2', 1 -- PromotionRule BUS
GO

--------------------------------------------------------------------------------------------------------------------
-- Clean up some orphaned hierarchy rows, document rows, and uniform registry rows
--------------------------------------------------------------------------------------------------------------------
-- Delete anchor orphaned documents (community documents with invalid orphaned hierarchy paths) 
 WITH OrphanedHierarchyKeys AS (
    SELECT HierarchyKey
      FROM Hierarchy h
           LEFT OUTER JOIN DocumentMain d ON h.UniformKey = d.DocumentVersionKey
     WHERE h.UniformType = 'DocumentVersion'
       AND d.DocumentVersionKey IS NULL
)
DELETE d
  FROM Hierarchy h
       LEFT OUTER JOIN DocumentMain d ON h.UniformKey = d.DocumentVersionKey
 WHERE h.ParentHierarchyKey IN (SELECT HierarchyKey FROM OrphanedHierarchyKeys)
   AND h.HierarchyKey NOT IN (SELECT HierarchyKey FROM OrphanedHierarchyKeys)
GO
-- Delete orphaned Hierarchy Keys (hierarchy where the referenced document does not exist)
WHILE (1=1)
BEGIN
    WITH OrphanedHierarchyRows AS (
    SELECT h.*, d.DocumentVersionKey
      FROM Hierarchy h
           LEFT OUTER JOIN DocumentMain d ON h.UniformKey = d.DocumentVersionKey
     WHERE h.UniformType = 'DocumentVersion'
       AND d.DocumentVersionKey IS NULL
    )
    DELETE h 
      FROM OrphanedHierarchyRows o
           INNER JOIN Hierarchy h ON o.HierarchyKey = h.HierarchyKey
     WHERE o.HierarchyKey NOT IN (SELECT ParentHierarchyKey FROM Hierarchy)
    IF @@ROWCOUNT = 0 BREAK
END
GO
-- Delete tags referencing non-existent documents
WITH OrphanUniformRegistry AS (
SELECT ur.*
  FROM UniformRegistry ur
       INNER JOIN ComponentRegistry cr ON ur.ComponentKey = cr.ComponentKey
       LEFT OUTER JOIN DocumentMain d ON ur.UniformKey = d.DocumentVersionKey
 WHERE cr.Name = 'DocumentVersion'
   AND d.DocumentVersionKey IS NULL
)
DELETE ut
  FROM UniformTag ut
       INNER JOIN OrphanUniformRegistry o ON ut.UniformKey = o.UniformKey
GO
-- Delete orphaned Uniform Registry rows
DELETE ur
  FROM UniformRegistry ur
       INNER JOIN ComponentRegistry cr ON ur.ComponentKey = cr.ComponentKey
       LEFT OUTER JOIN DocumentMain d ON ur.UniformKey = d.DocumentVersionKey
 WHERE cr.Name = 'DocumentVersion'
   AND d.DocumentVersionKey IS NULL
DELETE ur
  FROM UniformRegistry ur
       INNER JOIN ComponentRegistry cr ON ur.ComponentKey = cr.ComponentKey
       LEFT OUTER JOIN DocumentMain d ON ur.UniformKey = d.DocumentKey
 WHERE cr.Name = 'Document'
   AND d.DocumentKey IS NULL
GO

-----------------------------------------------------------------
-- PBI 56880 Remove the PaymentTerms crafted class reference
-----------------------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'PaymentTerms')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'PaymentTerms'
END
GO
IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'PaymentTerms')
BEGIN
    DELETE [dbo].[AtomPanelWebsite] 
    WHERE [AtomPanelKey] IN 
          (SELECT [AtomPanelKey] FROM [dbo].[AtomPanel]
            WHERE [ComponentKey] IN 
                  (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry]
                    WHERE [InterfaceName] = 'IAtom' AND [Name] = 'PaymentTerms'))
    
    DELETE [dbo].[AtomPanel] 
    WHERE [ComponentKey] IN 
          (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry]
            WHERE [InterfaceName] = 'IAtom' AND [Name] = 'PaymentTerms')
    
    DELETE [dbo].[ComponentRegistryCategory] 
    WHERE [ComponentKey] IN 
          (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry]
            WHERE [InterfaceName] = 'IAtom' AND [Name] = 'PaymentTerms')
    
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'IAtom' AND [Name] = 'PaymentTerms'
END
GO


-- End of script
SET NOCOUNT OFF
GO
