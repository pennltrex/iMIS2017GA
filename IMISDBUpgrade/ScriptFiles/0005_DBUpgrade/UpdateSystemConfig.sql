-------------------------------
-- Update System Config data --
-------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-----------------------------------------------------------------------------------------------------------
--- Do not remove when rebasing.
--- PBI 48486:  Always Delete the Contacts Search SystemConfig entries so that all contacts get re-indexed.
--- This setting is recreated when any contact search info is indexed; upgrades should ensure
--- all contact are re-indexed.
-----------------------------------------------------------------------------------------------------------
DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] LIKE 'ContactsPublishing-%'
GO
-- Beginning of script ------------------------------------------------------------------------------------


-- PBI 48133 FlowCompanyId SysConfig var
    -- Update Description of the FlowCompanyId SysConfig var and reorder it.
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Determine if the Company ID field should flow from the main user.<br/>0 = do not flow, 1 = flow from user.' 
 WHERE [PropertyDefinitionKey] = '15810DDF-ABA5-49D1-BBF4-2A9DAB9663C6' -- FlowCompanyId
GO

    -- Reorder (delete/insert) the Events Configuration page that the FlowCompanyId SysConfig var is on.
DELETE 
  FROM [dbo].[SystemConfigPageParameterRef] 
 WHERE SystemConfigPageKey = 'EB306E8B-0144-490E-B338-4B12BBF6DE0A'
GO

IF EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = 'EB306E8B-0144-490E-B338-4B12BBF6DE0A')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AddCoworkerButtonText', 16)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AllowCreateAccountFromEventRegistration', 20)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AlreadyRegisteredMessage', 36)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AltEventMeetingType', 39)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AltEventRegistrantLocation', 40)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'AltEventSummaryLocation', 41)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'CalendarNextDisplay', 14)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'CalendarPreviousDisplay', 15)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'CalendarYearsAfter', 12)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'CalendarYearsBefore', 11)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'EventFunctionGroupsExpandAll', 153)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'EventRegistrationSetupWelcomeText', 1)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'EventsCalendarColorCode', 13)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'EventsRegistrationRequiredQuestionText', 5)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowAddress', 22)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowCompany', 23)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowCompanyId', 0)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowFax', 25)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowHomePhone', 27)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FlowWorkPhone', 26)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'FullFunctionErrorMessage', 35)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'IncompleteCartMessage', 38)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'MaxRegistrantsMessage', 33)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'NoGuestBadgesFoundMessage', 37)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'WaitListedFunctionMessage', 34)
    INSERT INTO [dbo].[SystemConfigPageParameterRef] (SystemConfigPageKey, ParameterName, SortOrder)
    VALUES ('EB306E8B-0144-490E-B338-4B12BBF6DE0A',	'WebBatchOption', NULL)
END
GO

------------------------------------------------------
-- Create new variable for Asi.Orders.WebOrderType
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommerceGeneral', 'MANAGER',
     '58DEC294-6AFE-48CB-B48A-037FB4384BB5',
     'Asi.Orders.WebOrderType',
     '9E776DE0-CC5B-4E81-8942-B53D791AE2E2',
     7, 1, null,
     'Web order type',
     null
GO     
    
------------------------------------------------------
-- Configure Asi.Orders.WebOrderType to use an IQA values list
------------------------------------------------------
UPDATE [dbo].[PropertyDefinition]
   SET [ValueListQueryDocumentVersionKey] = 'EC7173AC-3117-446F-9AF1-4F124ED4E84F',
       [ValueListQueryDisplayColumn] = 'Description',
       [ValueListQueryPersistColumn] = 'Code',
       [IsRequired] = 1
WHERE [PropertyDefinitionKey] = '9E776DE0-CC5B-4E81-8942-B53D791AE2E2'
GO

------------------------------------------------------
-- Migrate WebOrderType parameter from System_Params to SystemConfig
------------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[System_Params] WHERE [ParameterName] = 'Order_Control.WebOrderType')
BEGIN
      UPDATE [dbo].[SystemConfig]
         SET [ParameterValue] = 
             (SELECT [ShortValue]
                FROM [dbo].[System_Params]
               WHERE [ParameterName] = 'Order_Control.WebOrderType')
      WHERE [ParameterName] = 'Asi.Orders.WebOrderType'
      DELETE FROM [dbo].[System_Params] WHERE [ParameterName] = 'Order_Control.WebOrderType'
END
GO

------------------------------------------------------
-- Create new variable for Asi.Orders.AdvanceNonInventoryToInvoiceStage
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommerceGeneral', 'MANAGER',
     '6BA84C37-DF90-4B02-83C0-B83217E96BC7',
     'Asi.Orders.AdvanceNonInventoryToInvoiceStage',
     '026B216B-A908-452C-9B5A-10058D88A8E5',
     2, 0, null,
     'Set order stage to INVOICE if order does not contain inventory items - Standard order types only',
     'False'
GO

-------------------------------------------------------------------
-- PBI 55079 - v10/v100 Automation: Cleanup Process Automation logs
-------------------------------------------------------------------
--Insert into SystemConfigPageRef table
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = '175277FE-9582-433C-8ECA-089EA4316B4E')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey], [SystemConfigPageName], [SystemConfigPageDesc])
    VALUES('175277FE-9582-433C-8ECA-089EA4316B4E', 'ProcessAutomation', 'Set Automated tasks settings')
END
GO
--Run the stored procedure to insert into all the required Config tables
EXEC [dbo].[asi_InsertSystemConfig]
     'Content', 
     'ProcessAutomation', 
     'MANAGER',
     'BE152C16-6869-4836-9283-25398B373EC6',
     'DeleteSuccessLogsAfter',
     '2B248CB3-D095-43F3-8B9D-3B9382661DAC',
     6, 
     20, 
     null,
     'Number of days to retain successful task logs',
     '30'
GO

EXEC [dbo].[asi_InsertSystemConfig]
     'Content', 
     'ProcessAutomation', 
     'MANAGER',
     '72E061CF-87FC-40B3-97FC-AA926BEE7BB3',
     'DeleteFailedLogsAfter',
     '4F0868E4-05C5-43C2-9015-FBA2D8FC19F3',
     6, 
     20, 
     null,
     'Number of days to retain failed task logs',
     '90'
GO

EXEC [dbo].[asi_InsertSystemConfig]
     'Content', 
     'ProcessAutomation', 
     'MANAGER',
     '4C32F8B2-0D1F-4BE2-A8A3-F7AA619C8EB0',
     'DeleteCompletedLogsAfter',
     'CBAB05D5-22F6-48E8-BEA1-F039C2AD1C46',
     6, 
     20, 
     null,
     'Number of days to retain completed task logs',
     '1'
GO

------------------------------------------------------
-- Create new variable for Asi.Orders.SplitOrdersByInventoryStatus
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommerceGeneral', 'MANAGER',
     'ED36015E-34D1-4358-9DDF-C528164B99E7',
     'Asi.Orders.SplitOrdersByInventoryStatus',
     '39DD7AE7-48DE-40DC-95F8-43B2FCDE1F86',
     2, 0, null,
     'Split orders with both inventory and non-inventory items into separate orders',
     'False'
GO

------------------------------------------------------------------
-- PBI 56137 - Add system config for iMIS Information Service URL
------------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Get the default organization for the system config variable
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
-- gets the system entity key for the system (module)
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = '4223D6FF-9BE9-482D-9CC9-2CF0930634CD')
INSERT INTO [dbo].[SystemConfig]
           ([SystemConfigKey],
           [ParameterName],
           [ParameterValue],
           [Description],
           [CreatedByUserKey],
           [CreatedOn],
           [UpdatedByUserKey],
           [UpdatedOn],
           [OrganizationKey],
           [SystemEntityKey])
     VALUES
           ('4223D6FF-9BE9-482D-9CC9-2CF0930634CD',
           'InformationServerUrl',
           'https://informationservice.imis.com/api',
           'iMIS information service URL',
           @userKey,
           @now,
           @userKey,
           @now,
           @organizationKey,
           @systemEntityKey)
GO


------------------------------------------------------
-- PBI 56148 - Update desktop help links
------------------------------------------------------
UPDATE SystemConfig
   SET ParameterValue = 'http://help.imis.com'
 WHERE SystemConfigKey = 'B297990F-9EAC-48B2-9A36-956FE3E02A42'
GO

------------------------------------------------------
-- PBI 55099 - Delete Public View specific System Config
------------------------------------------------------
DECLARE @propertyDefinitionKeys table( [PropertyDefinitionKey] uniqueidentifier)

-- Delete SystemConfig entries not being used by other pages                                 
DELETE 
  FROM [dbo].[SystemConfig] 
 WHERE [ParameterName] IN 
       (SELECT p.[ParameterName] 
          FROM [dbo].[SystemConfigPageParameterRef] p INNER JOIN [dbo].[SystemConfigPageRef] page ON p.[SystemConfigPageKey] = page.[SystemConfigPageKey] 
         WHERE page.[SystemConfigPageName] IN ('General', 'Setup', 'Admin', 'SSLConfiguration', 'Contact', 'OrderConfirmations',
                                               'LabelPersonal', 'LabelAddress', 'LabelProduct', 'LabelCreditCard', 'Label',
                                               'LabelMisc', 'Images', 'EmailTemplates', 'MaintenanceMode', 
                                               'AccountManagement', 'Address', 'PersonalInformation', 'CreateAccount', 
                                               'CreateAccountTitles', 'CreateAccountSearch', 'CreateAccountSettings', 
                                               'Login', 'FindMe', 'ResetPassword', 'Committee', 'RosterManagement', 'Events')
              AND [ParameterName] NOT IN ('OrderWebmaster', 'OrganizationAbbrev', 'OrganizationName', 'Webmaster', 'LogonChangesEmailFrom', 
                                          'ProductSaleEmailTo', 'EnableLoginSSL', 'CartLabel', 'ReportInappropriateOffensiveCCField', 
                                          'ReportInappropriateOffensiveBCCField', 'ReportInappropriateOffensiveSubjectTemplate', 
                                          'ReportInappropriateOffensiveBodyTemplate', 'CommunityNotificationSubjectTemplate', 
                                          'CommunityNotificationBodyTemplate', 'CommunityNotificationFooterTemplate', 
                                          'MaintenanceModeStatus', 'MaintenanceModeWarning', 'LogonInformationRequestMessage', 
                                          'PasswordResetRequestMessage', 'PasswordResetRequestSentMessage', 'CreateAccountDefaultExpirationDate',
                                          'LoginShowCreateAccountLink', 'LoginShowFindMeLink', 'LoginShowResetPasswordLink', 'WebBatchOption'))
         
-- Determine which property defintions need to go       
INSERT INTO @propertyDefinitionKeys
SELECT p.[PropertyDefinitionKey] 
  FROM [dbo].[SystemConfigParameterRef] p 
       INNER JOIN [SystemConfigPageParameterRef] p2 ON p.[ParameterName] = p2.[ParameterName] 
       INNER JOIN [dbo].[SystemConfigPageRef] page ON p2.[SystemConfigPageKey] = page.[SystemConfigPageKey]
WHERE page.[SystemConfigPageName] IN ('General', 'Setup', 'Admin', 'SSLConfiguration', 'Contact', 'OrderConfirmations',
                                               'LabelPersonal', 'LabelAddress', 'LabelProduct', 'LabelCreditCard', 'Label',
                                               'LabelMisc', 'Images', 'EmailTemplates', 'MaintenanceMode', 
                                               'AccountManagement', 'Address', 'PersonalInformation', 'CreateAccount', 
                                               'CreateAccountTitles', 'CreateAccountSearch', 'CreateAccountSettings', 
                                               'Login', 'FindMe', 'ResetPassword', 'Committee', 'RosterManagement', 'Events')
              AND p.[ParameterName] NOT IN ('OrderWebmaster', 'OrganizationAbbrev', 'OrganizationName', 'Webmaster', 'LogonChangesEmailFrom', 
                                          'ProductSaleEmailTo', 'EnableLoginSSL', 'CartLabel', 'ReportInappropriateOffensiveCCField', 
                                          'ReportInappropriateOffensiveBCCField', 'ReportInappropriateOffensiveSubjectTemplate', 
                                          'ReportInappropriateOffensiveBodyTemplate', 'CommunityNotificationSubjectTemplate', 
                                          'CommunityNotificationBodyTemplate', 'CommunityNotificationFooterTemplate', 
                                          'MaintenanceModeStatus', 'MaintenanceModeWarning', 'LogonInformationRequestMessage', 
                                          'PasswordResetRequestMessage', 'PasswordResetRequestSentMessage', 'CreateAccountDefaultExpirationDate',
                                          'LoginShowCreateAccountLink', 'LoginShowFindMeLink', 'LoginShowResetPasswordLink', 'WebBatchOption')
  
-- Delete the parameter-page details
DELETE p
  FROM [dbo].[SystemConfigPageParameterRef] p INNER JOIN [dbo].[SystemConfigPageRef] page ON p.[SystemConfigPageKey] = page.[SystemConfigPageKey]
WHERE page.[SystemConfigPageName] IN ('General', 'Setup', 'Admin', 'SSLConfiguration', 'Contact', 'OrderConfirmations',
                                               'LabelPersonal', 'LabelAddress', 'LabelProduct', 'LabelCreditCard', 'Label',
                                               'LabelMisc', 'Images', 'EmailTemplates', 'MaintenanceMode', 
                                               'AccountManagement', 'Address', 'PersonalInformation', 'CreateAccount', 
                                               'CreateAccountTitles', 'CreateAccountSearch', 'CreateAccountSettings', 
                                               'Login', 'FindMe', 'ResetPassword', 'Committee', 'RosterManagement', 'Events')

-- Delete the SystemConfigParameterRef  (any that are used on other pages should already be excluded)
DELETE
  FROM [dbo].[SystemConfigParameterRef] 
 WHERE [PropertyDefinitionKey] IN (SELECT [PropertyDefinitionKey] FROM @propertyDefinitionKeys) 
       AND [ParameterName] NOT IN (SELECT [ParameterName] FROM [dbo].[SystemConfigPageParameterRef])

-- Delete the Property Definition (any that are used on other pages should already be excluded)
DELETE
  FROM [dbo].[PropertyDefinition] 
 WHERE [PropertyDefinitionKey] IN (SELECT [PropertyDefinitionKey] FROM @propertyDefinitionKeys)

-- Delete the page definition
DELETE
  FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] IN ('General', 'Setup', 'Admin', 'SSLConfiguration', 'Contact', 'OrderConfirmations',
                                               'LabelPersonal', 'LabelAddress', 'LabelProduct', 'LabelCreditCard', 
                                               'LabelMisc', 'Images', 'EmailTemplates', 'MaintenanceMode', 
                                               'AccountManagement', 'Address', 'PersonalInformation', 'CreateAccount', 
                                               'CreateAccountTitles', 'CreateAccountSearch', 'CreateAccountSettings', 
                                               'Login', 'FindMe', 'ResetPassword', 'Committee', 'RosterManagement', 'Events')


-- Add still used SystemConfig to existing pages in the Staff site Settings
DECLARE @systemConfigPageName nvarchar(30)
DECLARE @systemConfigPageKey uniqueidentifier
DECLARE @parameterName nvarchar(255)
DECLARE @sortOrder int

-- Commerce settings
SET @systemConfigPageName = 'CommerceGeneral'
SELECT @systemConfigPageKey = [SystemConfigPageKey] FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] = @systemConfigPageName  

-- Update description to make it clear this is only used in one place
UPDATE [dbo].[SystemConfigParameterRef] SET [Description] = 'Label for Shopping Cart (only applies to the Product Display content item)' WHERE [ParameterName] = 'CartLabel'

SET @parameterName = 'CartLabel'   
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = ISNULL(MAX([SortOrder]),0) + 10 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END

SET @parameterName = 'WebBatchOption'   
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = 25

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END

-- Account settings
SET @systemConfigPageName = 'AccountManagementRiSE'
SELECT @systemConfigPageKey = [SystemConfigPageKey] FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] = @systemConfigPageName  

-- Remove text that indicated this ony applied to non-iPart based site. It actually applies to all sites
UPDATE [dbo].[SystemConfigParameterRef] SET [Description] = 'Use SSL security for logon' WHERE [ParameterName] = 'EnableLoginSSL'

SET @parameterName = 'EnableLoginSSL'    
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = ISNULL(MAX([SortOrder]),0) + 10 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END

SET @parameterName = 'LogonChangesEmailFrom'    
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = ISNULL(MAX([SortOrder]),0) + 10 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END

SET @parameterName = 'LogonInformationRequestMessage'    
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = ISNULL(MAX([SortOrder]),0) + 10 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END

SET @parameterName = 'PasswordResetRequestMessage'    
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] 
                           WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @parameterName)
BEGIN
    
    SELECT @sortOrder = ISNULL(MAX([SortOrder]),0) + 10 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey

    INSERT INTO [dbo].[SystemConfigPageParameterRef] (
                  [SystemConfigPageKey],
                  [ParameterName],
                  [SortOrder]) 
            VALUES (
                  @systemConfigPageKey, 
                  @parameterName, 
                  @sortOrder)
END
GO

---------------------------------------------------------------------------------------------------------
-- PBI 57646 - remove WebBatchOption from the UI and set the SystemConfig value to "false"
---------------------------------------------------------------------------------------------------------
DELETE [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = 'WebBatchOption'
UPDATE [dbo].[SystemConfig] SET [ParameterValue] = 'False' WHERE [ParameterName] = 'WebBatchOption'
GO

---------------------------------------------------------------------------------------------------------
-- PBI 57714 - The DefaultParameterValue for this should match the default URL 
-- of a newly installed DataVault instance (not the old shared DV system)
---------------------------------------------------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [DefaultParameterValue] = 'https://localhost/DataVault0' 
 WHERE [ParameterName] = 'DataVault.DataVaultServiceAddress'
GO


-- End of Script
SET NOCOUNT OFF
GO