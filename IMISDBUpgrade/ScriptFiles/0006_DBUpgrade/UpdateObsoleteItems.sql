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

--------------------------------------------------------------------------------
-- Bootstrap a required function that is referenced before functions are updated
--------------------------------------------------------------------------------
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


-- Drop unused procedure
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CopyIDRow]') AND type IN (N'P', N'PC'))
    DROP PROCEDURE [dbo].[CopyIDRow]
GO

-- Drop an index that has proved troublesome in the field
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccessItem]') AND name = N'IX_AccessItem_Grantee')
    DROP INDEX [IX_AccessItem_Grantee] ON [dbo].[AccessItem] WITH ( ONLINE = OFF )
GO


-- Clean out any corrupt provider keys
UPDATE [dbo].[UserMain]
   SET [ProviderKey] = NULL
 WHERE [ProviderKey] = '';
GO

-- Clean out any orphaned aspnet rows
DECLARE @applicationId uniqueidentifier;
SELECT @applicationId = [ApplicationId]
  FROM aspnet_Applications
 WHERE [LoweredApplicationName] = 'imis'
 
IF (@applicationId IS NOT NULL) AND EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE [TABLE_NAME] = 'UserMain')
BEGIN
    -- Delete memberships that have no corresponding row in UserMain
    DELETE FROM aspnet_Membership 
     WHERE [ApplicationId] = @applicationId
       AND [UserId] IN (
        SELECT [UserId] FROM aspnet_Users
         WHERE [UserName] NOT IN (SELECT [UserId] FROM [dbo].[UserMain]) 
     )
     
    -- Delete profiles that have no corresponding row in UserMain
    DELETE FROM aspnet_Profile 
     WHERE [UserId] IN (
        SELECT [UserId] FROM aspnet_Users
         WHERE [UserName] NOT IN (SELECT [UserId] FROM [dbo].[UserMain]) 
     )

    -- Delete users that have no corresponding row in UserMain
    DELETE FROM aspnet_Users
     WHERE [UserName] NOT IN (SELECT [UserId] FROM [dbo].[UserMain]) 
END
GO 

-- Drop primary key on the query cache table
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE [TABLE_NAME] = 'DataServerCache')
BEGIN
    -- Clear the query cache
    TRUNCATE TABLE [dbo].[DataServerCache];
    DECLARE @sql nvarchar(max);
    SET @sql = 'ALTER TABLE [dbo].[DataServerCache] DROP CONSTRAINT |ConstraintName| ';

    SET @sql = REPLACE(@sql, '|ConstraintName|', ( SELECT [name]
                                                     FROM sys.objects
                                                    WHERE [type] = 'PK' AND [parent_object_id] = OBJECT_ID('[dbo].[DataServerCache]')
                                                 )
                      );
    EXEC (@sql);
END
GO


-- PBI 69741 Eliminate schema bound indexed view that contains a cross-join
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyEventAvailabilityBase]'))
    DROP VIEW [dbo].[vSoaPartyEventAvailabilityBase]
GO



------------------------------------------------------------------------
-- PBI 34913 - Deleting obsolete business objects
------------------------------------------------------------------------

--Deleting the BOD, DBS,BUS documents

--ContactFundraising
EXEC dbo.asi_DocumentDelete 'B14C6C1B-56CE-4032-9144-D9E947E3156C', 1
EXEC dbo.asi_DocumentDelete '0D678304-01DF-4F5A-907C-A018A16FB6F6', 1
EXEC dbo.asi_DocumentDelete '9730AD01-461F-44DF-A61B-8603AB047659', 1

--Fund
EXEC dbo.asi_DocumentDelete '9D42F17B-25D3-4281-B41A-7CDF91091F15', 1
EXEC dbo.asi_DocumentDelete '2D7DFEAD-593F-4729-AAFF-4E1A95B7638A', 1
EXEC dbo.asi_DocumentDelete 'B8334C12-94D4-4405-88CE-632F12A641A7', 1

--FundFamilyRef
EXEC dbo.asi_DocumentDelete 'A6E92950-3368-407E-93B5-A968D1FA8A8D', 1
EXEC dbo.asi_DocumentDelete '526E4BE2-A04F-4B85-8F9D-2D14D7CB90F6', 1
EXEC dbo.asi_DocumentDelete '89200B1B-AA02-400D-B809-31ECCF3482AC', 1

--FundFundType
EXEC dbo.asi_DocumentDelete '1E7266B1-1A0B-4803-96B4-DFD5D3CB627B', 1
EXEC dbo.asi_DocumentDelete '0AE8CF85-AD09-400A-B63C-FD979B88DCCE', 1
EXEC dbo.asi_DocumentDelete 'CAFBD805-D1D1-4652-86B7-2FC95FA61A34', 1

--FundType
EXEC dbo.asi_DocumentDelete '2FF1894B-3472-4E68-8D64-58A7588D75B9', 1
EXEC dbo.asi_DocumentDelete '2C315AB9-EC1C-4BC8-B031-B7A54AC9E62E', 1
EXEC dbo.asi_DocumentDelete '0090BED7-C42C-4E85-BA7C-C5E49C566C76', 1

--MatchingGift
EXEC dbo.asi_DocumentDelete '89F0CA43-54A5-401D-9356-5DAFA170EC7C', 1
EXEC dbo.asi_DocumentDelete '29D80C18-0035-4C65-A92C-E260F8BBC7B7', 1
EXEC dbo.asi_DocumentDelete 'C514F605-DB0B-427F-96C8-5E7C39BB6271', 1

--MatchingGiftPlan
EXEC dbo.asi_DocumentDelete '0F87ED46-8936-4AC8-851C-164DB822C3D9', 1
EXEC dbo.asi_DocumentDelete 'DBC4C5A3-09FE-4A91-B405-E9E3F74B7F97', 1
EXEC dbo.asi_DocumentDelete '095ABA61-FC59-4009-A7B2-516700E69221', 1

--MatchingGiftPlanFundType
EXEC dbo.asi_DocumentDelete '4F9789B3-135B-41DC-B090-1A6FA3C464FB', 1
EXEC dbo.asi_DocumentDelete '7754C65F-2D24-443B-9722-C4D8E17838AC', 1
EXEC dbo.asi_DocumentDelete 'D5B63AB1-45F2-4740-B27B-0C21EA9FB7CA', 1

--MatchingGiftPlanRelationship
EXEC dbo.asi_DocumentDelete 'CB0E3849-386F-4B30-95D9-D5F2D36E087A', 1
EXEC dbo.asi_DocumentDelete '66412078-E4A8-4916-9C0D-C2AB8EC7C747', 1
EXEC dbo.asi_DocumentDelete '30973554-AB96-4BC5-9F4C-95BAED3C1415', 1

--MatchingGiftPlanRule
EXEC dbo.asi_DocumentDelete '147B59DC-89CF-4943-9EA9-4A5E2115CE27', 1
EXEC dbo.asi_DocumentDelete '40B4E271-2934-4E9D-B0ED-873EE0903DC3', 1
EXEC dbo.asi_DocumentDelete '131EB3DB-2C3B-4D89-A01C-80BBCCCAD8A0', 1

--MemorialTribute
EXEC dbo.asi_DocumentDelete '00DFB1D4-1E95-4C13-A065-66EF492F3B41', 1
EXEC dbo.asi_DocumentDelete 'B62988DA-0400-4FE3-9B47-6CC09D28CFB4', 1
EXEC dbo.asi_DocumentDelete '6D5E765B-5B0A-486C-9C64-7B597A280B7D', 1

--MemorialTributeCodeRef
EXEC dbo.asi_DocumentDelete '4E6F57D8-5DD1-4F8E-8E39-FDD1703103A6', 1
EXEC dbo.asi_DocumentDelete 'DC46A1A9-709C-4FB8-B4B6-26C2EAE46FD9', 1
EXEC dbo.asi_DocumentDelete '6FC71CDB-A64B-4645-B00D-2330EB2793CA', 1

--PotentialMatchingGift
EXEC dbo.asi_DocumentDelete 'CB50EC71-5113-4AB9-8D7D-082B1D5E23A7', 1
EXEC dbo.asi_DocumentDelete '619D5AAD-4EF7-427C-ACF7-69C6ED6BD172', 1
EXEC dbo.asi_DocumentDelete '495ABB24-14DB-4862-ABED-5649B86E02D0', 1

--Receipt
EXEC dbo.asi_DocumentDelete 'DF238BA4-916C-4B0F-8CF1-B4154FB8084B', 1
EXEC dbo.asi_DocumentDelete '07A33C70-E2F2-4B21-BA99-46852DC4DA14', 1
EXEC dbo.asi_DocumentDelete 'BAFC50B7-95C9-4B2B-8B33-F476CADDB272', 1

--ReceiptLine
EXEC dbo.asi_DocumentDelete 'A2C92FCE-A351-4B75-867C-6BB7E1CCF504', 1
EXEC dbo.asi_DocumentDelete '89C9DB22-9D30-4C4D-8F4E-3586ABA9FAE2', 1
EXEC dbo.asi_DocumentDelete '9397AF4A-5C56-472D-83DF-AE84C925FD71', 1

--ReceiptType
EXEC dbo.asi_DocumentDelete '88405988-7BD5-4D38-9110-A9CF854EA1E9', 1
EXEC dbo.asi_DocumentDelete '68A495BB-0FDA-4E09-A6D4-C37D26971189', 1
EXEC dbo.asi_DocumentDelete '254B46C5-8A05-4128-9A93-665B648F18A9', 1

--SalesHistoryMemorialTribute
EXEC dbo.asi_DocumentDelete 'EAD1E1C8-36BE-441A-85CB-277392350EF2', 1
EXEC dbo.asi_DocumentDelete '933FA18E-1F09-4041-9E5D-F3A71A2C5A79', 1
EXEC dbo.asi_DocumentDelete 'C2D289DC-8CA3-42E5-8574-A81C5B56FFA3', 1

--SalesHistorySoftCredit
EXEC dbo.asi_DocumentDelete '4D821A12-41D0-4D30-A8B4-DA510AE4A63B', 1
EXEC dbo.asi_DocumentDelete '21463E3F-0A99-4A38-87C2-3A9537F01CDD', 1
EXEC dbo.asi_DocumentDelete '4C389A39-194F-4D8E-AB8A-9D519119666D', 1


--Drop associated views
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactFundraising]'))
DROP VIEW [dbo].[vBoContactFundraising]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFund]'))
DROP VIEW [dbo].[vBoFund]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundFamilyRef]'))
DROP VIEW [dbo].[vBoFundFamilyRef]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundFundType]'))
DROP VIEW [dbo].[vBoFundFundType]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundType]'))
DROP VIEW [dbo].[vBoFundType]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGift]'))
DROP VIEW [dbo].[vBoMatchingGift]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlan]'))
DROP VIEW [dbo].[vBoMatchingGiftPlan]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanFundType]'))
DROP VIEW [dbo].[vBoMatchingGiftPlanFundType]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanRelationship]'))
DROP VIEW [dbo].[vBoMatchingGiftPlanRelationship]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanRule]'))
DROP VIEW [dbo].[vBoMatchingGiftPlanRule]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMemorialTribute]'))
DROP VIEW [dbo].[vBoMemorialTribute]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMemorialTributeCodeRef]'))
DROP VIEW [dbo].[vBoMemorialTributeCodeRef]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPotentialMatchingGift]'))
DROP VIEW [dbo].[vBoPotentialMatchingGift]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceipt]'))
DROP VIEW [dbo].[vBoReceipt]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceiptLine]'))
DROP VIEW [dbo].[vBoReceiptLine]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceiptType]'))
DROP VIEW [dbo].[vBoReceiptType]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistoryMemorialTribute]'))
DROP VIEW [dbo].[vBoSalesHistoryMemorialTribute]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistorySoftCredit]'))
DROP VIEW [dbo].[vBoSalesHistorySoftCredit]
GO

--Delete asspciated component registry rows
IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ContactFundraising')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ContactFundraising'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'Fund')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'Fund'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundFamilyRef')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundFamilyRef'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundFundType')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundFundType'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundType')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'FundType'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGift')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGift'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlan')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlan'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanFundType')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanFundType'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanRelationship')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanRelationship'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanRule')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MatchingGiftPlanRule'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MemorialTribute')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MemorialTribute'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MemorialTributeCodeRef')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'MemorialTributeCodeRef'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'PotentialMatchingGift')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'PotentialMatchingGift'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'Receipt')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'Receipt'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ReceiptLine')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ReceiptLine'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ReceiptType')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'ReceiptType'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'SalesHistoryMemorialTribute')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'SalesHistoryMemorialTribute'
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'SalesHistorySoftCredit')
BEGIN
    DELETE [dbo].[ComponentRegistry] 
    WHERE [InterfaceName] = 'BusinessController' AND [Name] = 'SalesHistorySoftCredit'
END
GO

------------------------------------------------------------------------------------------
-- PBI 57925 - Delete old Content workflow stored procedure and 
-- delete Content Worflow System Config that has been replaced by a communication template
------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetCMNotificationsDue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_GetCMNotificationsDue]
GO

DECLARE @propertyDefinitionKeys table( [PropertyDefinitionKey] uniqueidentifier)

-- Delete SystemConfig entries                                 
DELETE 
  FROM [dbo].[SystemConfig] 
 WHERE [ParameterName] IN ('ND.ExpirationEmailFromAddr', 'ND.ExpirationSubjectText', 'ND.ExpirationOpeningText', 'ND.ExpirationWarningText',
                                          'ND.ExpirationNoticeText', 'ND.AddExpNoticeText', 'ND.ExpirationTableHeader', 'ND.ExpirationTableRow', 
                                          'CM.ExpirationEmailFromAddr', 'CM.ExpirationSubjectText', 'CM.ExpirationOpeningText',
                                          'CM.ExpirationWarningText', 'CM.ExpirationNoticeText', 'CM.AddExpNoticeText',
                                          'CM.ExpirationTableHeader', 'CM.ExpirationTableRow')
         
-- Determine which property definitions need to go       
INSERT INTO @propertyDefinitionKeys
SELECT [PropertyDefinitionKey] 
  FROM [dbo].[SystemConfigParameterRef] 
WHERE [ParameterName] IN ('ND.ExpirationEmailFromAddr', 'ND.ExpirationSubjectText', 'ND.ExpirationOpeningText', 'ND.ExpirationWarningText',
                                          'ND.ExpirationNoticeText', 'ND.AddExpNoticeText', 'ND.ExpirationTableHeader', 'ND.ExpirationTableRow', 
                                          'CM.ExpirationEmailFromAddr', 'CM.ExpirationSubjectText', 'CM.ExpirationOpeningText',
                                          'CM.ExpirationWarningText', 'CM.ExpirationNoticeText', 'CM.AddExpNoticeText',
                                          'CM.ExpirationTableHeader', 'CM.ExpirationTableRow')
  
-- Delete the parameter-page details
DELETE 
  FROM [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] IN ('ND.ExpirationEmailFromAddr', 'ND.ExpirationSubjectText', 'ND.ExpirationOpeningText', 'ND.ExpirationWarningText',
                                          'ND.ExpirationNoticeText', 'ND.AddExpNoticeText', 'ND.ExpirationTableHeader', 'ND.ExpirationTableRow', 
                                          'CM.ExpirationEmailFromAddr', 'CM.ExpirationSubjectText', 'CM.ExpirationOpeningText',
                                          'CM.ExpirationWarningText', 'CM.ExpirationNoticeText', 'CM.AddExpNoticeText',
                                          'CM.ExpirationTableHeader', 'CM.ExpirationTableRow')

-- Delete the SystemConfigParameterRef
DELETE
  FROM [dbo].[SystemConfigParameterRef] 
 WHERE [PropertyDefinitionKey] IN (SELECT [PropertyDefinitionKey] FROM @propertyDefinitionKeys) 
       AND [ParameterName] NOT IN (SELECT [ParameterName] FROM [dbo].[SystemConfigPageParameterRef])

-- Delete the Property Definition
DELETE
  FROM [dbo].[PropertyDefinition] 
 WHERE [PropertyDefinitionKey] IN (SELECT [PropertyDefinitionKey] FROM @propertyDefinitionKeys)
GO

------------------------------------------------------------------------------------------
-- SBT - 60606 - Delete 'Tribute Notification' communication template
------------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'BDD475D5-54D9-44F2-BBFD-393785497DE4', 1
GO

----------------------------------------------------------------------------------
-- PBI 60457 - Drop the now-obsolete columns field GiftReport.TributeNotificationContactID 
-- and GiftReport.TributeNotificationSentOn (These fields exists on Trans_Notify)
----------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'TributeNotificationContactID')
    BEGIN
        IF OBJECT_ID('DF_GiftReport_TributeNotificationContactID') IS NOT NULL
        BEGIN
            ALTER TABLE [dbo].[GiftReport] DROP CONSTRAINT [DF_GiftReport_TributeNotificationContactID]
        END
        ALTER TABLE [dbo].[GiftReport] DROP COLUMN [TributeNotificationContactID]
    END
    
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'TributeNotificationSentOn')
    BEGIN
        ALTER TABLE [dbo].[GiftReport] DROP COLUMN [TributeNotificationSentOn]
    END
    
END
GO

-- Remove unnecessary FK constraint
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventDetails_Meet_Master_Meeting]') 
AND parent_object_id = OBJECT_ID(N'[dbo].[EventDetails]'))
    ALTER TABLE [dbo].[EventDetails] DROP CONSTRAINT [FK_EventDetails_Meet_Master_Meeting]
GO

----------------------------------------------------------------------------------
-- PBI 59230 Remove Certification NAV Items that each display a list of Crystal Reports
----------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '49FED7B1-AF0E-4C4F-9104-682EA0F21B30', 1 -- ~/Continuum/Campaign_reports
EXEC dbo.asi_DocumentDelete 'B65C05E0-75BF-4D5C-85CA-E74816A79AB1', 1 -- ~/Continuum/Segmentation_reports
EXEC dbo.asi_DocumentDelete '11370A46-E44B-483C-A14C-39FAA4BE831E', 1 -- ~/Continuum/RFM_reports
EXEC dbo.asi_DocumentDelete '48EF86AC-E0BD-4F96-8473-0321A4A932B2', 1 -- ~/Continuum/Process_Manager_reports

----------------------------------------------------------------------------------------------
-- PBI55783 Drop table "Template" which is no longer needed for event cloning
----------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Template' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[Template]
END
GO

----------------------------------------------------------------------------------------------
--PBI55783 Drop table "TemplateTypeRef" which is no longer needed for event cloning
----------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TemplateTypeRef' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[TemplateTypeRef]
END
GO

----------------------------------------------------------------------------------------------
--PBI 61209 Drop trigger DocumentMain_Insert_Update_Delete, we now have 2 separate triggers: 1 for delete and another for insert/update
----------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.triggers 
            WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMain_Insert_Update_Delete]'))
BEGIN
    DROP TRIGGER [dbo].[asi_DocumentMain_Insert_Update_Delete]
END
GO

----------------------------------------------------------------------------------------------
--PBI 61186 Drop trigger ContactMain_Insert_Update_Delete, we now have 3 separate triggers
----------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM sys.triggers 
            WHERE object_id = OBJECT_ID(N'[dbo].[asi_ContactMain_Insert_Update_Delete]'))
BEGIN
    DROP TRIGGER [dbo].[asi_ContactMain_Insert_Update_Delete]
END
GO

-- Drop the now-obsolete column indexes 
-- IX_AutoPayInstruction_PaymentToken
-- IX_AutoPayInstruction_CustomerId_PaymentToken
------------------------------------------------------------------------------------
-- Drop Index IX_AutoPayInstruction_PaymentToken
IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_PaymentToken') 
    IF OBJECTPROPERTY(OBJECT_ID('IX_AutoPayInstruction_PaymentToken'), 'IsConstraint') = 1
        ALTER TABLE [dbo].[AutoPayInstruction] DROP CONSTRAINT [IX_AutoPayInstruction_PaymentToken]
    ELSE
        DROP INDEX [dbo].[AutoPayInstruction].[IX_AutoPayInstruction_PaymentToken]
GO
-- Drop Index IX_AutoPayInstruction_CustomerId_PaymentToken
IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_CustomerId_PaymentToken') 
    IF OBJECTPROPERTY(OBJECT_ID('IX_AutoPayInstruction_CustomerId_PaymentToken'), 'IsConstraint') = 1
        ALTER TABLE [dbo].[AutoPayInstruction] DROP CONSTRAINT [IX_AutoPayInstruction_CustomerId_PaymentToken]
    ELSE
        DROP INDEX [dbo].[AutoPayInstruction].[IX_AutoPayInstruction_CustomerId_PaymentToken]
GO

----------------------------------------------------------------------------------------------
--PBI 59320 Remove unwanted indexes
----------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CalculatedEngagementScore]') AND [name] = N'IX_CalculatedEngagementScore_EngagementScoreKey_ContactKey')
BEGIN
  DROP  INDEX IX_CalculatedEngagementScore_EngagementScoreKey_ContactKey ON [dbo].[CalculatedEngagementScore]
END

IF  EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CalculatedEngagementScore]') AND [name] = N'IX_CalculatedEngagementScore_EngagementScoreKey_ScoreComponentKey')
BEGIN
  DROP  INDEX IX_CalculatedEngagementScore_EngagementScoreKey_ScoreComponentKey ON [dbo].[CalculatedEngagementScore]
END

IF  EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CalculatedEngagementScore]') AND [name] = N'IX_CalculatedEngagementScore_EngagementScoreKey_ScoreMonth_ScoreComponentKey_ScoreYear')
BEGIN
  DROP  INDEX IX_CalculatedEngagementScore_EngagementScoreKey_ScoreMonth_ScoreComponentKey_ScoreYear ON [dbo].[CalculatedEngagementScore] 
END

IF  EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CalculatedEngagementScore]') AND [name] = N'IX_CalculatedEngagementScore_EngagementScoreKey_ScoreYear_ScoreComponentKey')
BEGIN
  DROP  INDEX IX_CalculatedEngagementScore_EngagementScoreKey_ScoreYear_ScoreComponentKey ON [dbo].[CalculatedEngagementScore]
END
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionBase]') AND name = N'IX_vSoaGroupMemberDestilSubscriptionBase_GroupRoleId')
    DROP INDEX [IX_vSoaGroupMemberDestilSubscriptionBase_GroupRoleId] ON [dbo].[vSoaGroupMemberDetailSubscriptionBase] WITH ( ONLINE = OFF )
GO

----------------------------------------------------------------------------------------------
--PBI 61677 Deleting unused AES encryption key parameter from System_Params
----------------------------------------------------------------------------------------------
DELETE FROM [dbo].[System_Params]
WHERE [ParameterName] = 'IBO_Control.AESEncryptionKey';
GO

------------------------------------------------------------------------------------------------------
-- PBI 63712 - Delete ContactMain trigger (the functionality is being moved to the Name table trigger)
------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.triggers 
            WHERE object_id = OBJECT_ID(N'[dbo].[asi_ContactMain_Update]'))
BEGIN
    DROP TRIGGER [dbo].[asi_ContactMain_Update]
END
GO

----------------------------------------------------------------------------------------------------
-- SBT 64569 - removing triggers 
----------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1
             FROM [sys].[triggers]
            WHERE object_id = OBJECT_ID(N'[dbo].[asi_PciAuditLog_Insert]')
          )
BEGIN
    DROP TRIGGER [dbo].[asi_PciAuditLog_Insert];
END;
GO

IF EXISTS (SELECT 1
             FROM [sys].[triggers]
            WHERE object_id = OBJECT_ID(N'[dbo].[asi_PciAuditLog_Update]')
          )
BEGIN
    DROP TRIGGER [dbo].[asi_PciAuditLog_Update];
END;
GO

-- Drop an unnecessary and potentially problem-causing index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContactOfferingRef]') AND name = N'AK_ContactOfferingRef_ContactOfferingDesc')
    ALTER TABLE [dbo].[ContactOfferingRef] DROP CONSTRAINT [AK_ContactOfferingRef_ContactOfferingDesc]
GO


------------------------------------------------------------------------------------------------------
--  PBI 67785 - SMR: (State/Province list) Debate of the status of island countries addressable through the United States
------------------------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '6C45C8FB-BF78-4193-B681-002395133980', 1
GO

------------------------------------------------------------------------------------------------------
--  PBI 68882 - Delete obsolete Campaign Management Reports nav from desktop
------------------------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'FEBA6EAB-0836-4A99-B6A0-40CACBE51ECA', 1
GO
-- End of script

SET NOCOUNT OFF
GO
