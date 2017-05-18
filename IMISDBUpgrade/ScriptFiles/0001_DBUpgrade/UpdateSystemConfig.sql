-------------------------------
-- Update System Config data --
-------------------------------

----------------------------------------------------------------
-- Create new UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig] 
     'Commerce', 'Billing', 'MANAGER', 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D',
     'BillingEnableAccrualOnWeb', 'EED5BB48-F110-4E18-84A9-078185CE8C30',
     2, 0, null, 
     'Allow customers to make accrual dues payments on the web',
     'True', 5
GO

----------------------------------------------------------------
-- Update UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
-- Change value to 'True' from '1'
-- Make sure correct value is applied, as a previous update
--  may have input a value of "1".
----------------------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = 'True'
 WHERE [SystemConfigKey] = 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D'
GO

UPDATE [dbo].[SystemConfigParameterRef]
   SET [DefaultParameterValue] = 'True'
 WHERE [PropertyDefinitionKey] = 'EED5BB48-F110-4E18-84A9-078185CE8C30'
GO

----------------------------------------------------------------
-- Update UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
-- Modify the Description to be less wordy
-- Make sure correct value is applied, as a previous update
--  may have input a more wordy Description.
----------------------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Allow customers to make accrual dues payments on the web'
 WHERE [SystemConfigKey] = 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D'
GO

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Allow customers to make accrual dues payments on the web'
 WHERE [PropertyDefinitionKey] = 'EED5BB48-F110-4E18-84A9-078185CE8C30'
GO

----------------------------------------------------------------
-- Create new UI Config option: AccountTypeLabel
-- Set up customer web components > Create account configuration
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccount', 'MANAGER',
     '6699E3F5-415F-41A3-9DEC-61AB9570881E',
     'AccountTypeLabel',
     '980015DF-7B01-4FD9-B0EE-331FC94C7419',
     7, 6, 40,
     'Account Type Label',
     'Account Type',
     1
GO

----------------------------------------------------------------
-- Create new UI Config option: IndividualLabel
-- Set up customer web components > Create account configuration
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccount', 'MANAGER',
     '9FEC00AB-00C1-4641-9A2D-870DD3A7BA6F',
     'IndividualLabel',
     '77021C67-576B-4C45-AE67-E5D02CB75432',
     7, 6, 40,
     'Individual Label',
     'Individual',
     2
GO

----------------------------------------------------------------
-- Create new UI Config option: NonIndividualLabel
-- Set up customer web components > Create account configuration
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccount', 'MANAGER',
     '6A0EAC16-68F7-48A6-B87D-E8CDF2E0F418',
     'NonIndividualLabel',
     '1E2C5B64-F6DE-43BE-8F4B-80D936C7E8E7',
     7, 6, 40,
     'Non-Individual Label',
     'Company',
     3
GO

---------------------------------------------------------------
-- Change sort order for UI Config option: CompanySearchEnabled
-- Set up customer web components > Create account search
---------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef] 
   SET [SortOrder] = 0
 WHERE [SystemConfigPageKey] = '7AF59166-367C-461D-A528-6E34D58FC131' AND [ParameterName] = 'CompanySearchEnabled' 
 
UPDATE [dbo].[SystemConfigPageParameterRef] 
   SET [SortOrder] = ISNULL([SortOrder],0) + 1
 WHERE [SystemConfigPageKey] = '7AF59166-367C-461D-A528-6E34D58FC131' AND [ParameterName] != 'CompanySearchEnabled'
GO

---------------------------------------------------------------
-- Change Value for UI Config option: CompanySearchFinalMessage
-- Value is only changed if it is still set to the default
-- Set up customer web components > Create account search
---------------------------------------------------------------
UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'Select the organization.'
 WHERE [ParameterName] = 'CompanySearchFinalMessage'
       AND UPPER(LTRIM(RTRIM([ParameterValue]))) LIKE UPPER('Click in the Selected Company column next to your company''s information and then click Next.')
GO

----------------------------------------------------------------
-- Change Description for UI Config option: BaseCurrencyValue
-- Set up web components > General configuration
----------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Set the System''s Base Currency Code'
 WHERE [ParameterName] = 'BaseCurrencyCode'
 
-----------------------------------------------------------------------
-- Change default Value for UI Config option: CompanySearchFinalMessage
-- Set up customer web components > Create account search
-----------------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [DefaultParameterValue] = 'Select the organization.'
 WHERE [ParameterName] = 'CompanySearchFinalMessage'
GO

----------------------------------------------------------------
-- Change Description for UI Config option: CompanySearchMessage
-- Set up customer web components > Create account search
----------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [Description] = 'Title of the Company Search page for individuals'
 WHERE [ParameterName] = 'CompanySearchMessage'
GO

----------------------------------------------------------
-- Create new UI Config option: CompanySearchMessageNonInd
-- Set up customer web components > Create account search
----------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccountSearch', 'MANAGER',
     'A02B58DC-A397-48A4-88D0-60E577462748',
     'CompanySearchMessageNonInd',
     '3568BA87-B894-4701-99C1-330E0F07AD21',
     7, 6, 40,
     'Title of the Company Search page for non-individuals',
     'Search for your parent organization and select it from the list.',
     303
GO

---------------------------------------------------------
-- Create new UI Config option: CompanySearchSkipText
-- Set up customer web components > Create account search
---------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccountSearch', 'MANAGER',
     'DE1534FC-7970-47B5-A09C-567017D3AFFD',
     'CompanySearchSkipText',
     'D972138F-CEFC-48CE-909F-AD7DEC6757BD',
     7, 6, 40,
     'Text of the link which allows company selection to be skipped',
     'Skip this step',
     305
GO

----------------------------------------------------------------
-- Create new UI Config option: CompanySearchDisplayAddress3
-- Set up customer web components > Create account search
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'CreateAccountSearch', 'MANAGER',
     'B8BEE484-B038-4DAF-B80D-363699B7C3CA',
     'CompanySearchDisplayAddress3',
     'CF673C94-CACB-4BA2-B75A-43CBD03D0A18',
     2, 0, 40,
     'Show Address line 3 in company search results',
     '0',
     316
GO

----------------------------------------------------------
-- Create new Config option: DefaultOrganizationMemberType
----------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'DefaultOrganizationMemberType')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('2309602C-DF50-4E60-802C-6E43A1CDBBDB', 'DefaultOrganizationMemberType', '',
            '', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

-----------------------------------------------------------------
-- Change Value for UI Config option: FindMeRecordNotDisplayed
-- Value is only changed if it is still set to the default
-- Set up web components > Forgot logon or password configuration
-----------------------------------------------------------------
UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'No match - continue'
 WHERE [ParameterName] = 'FindMeRecordNotDisplayed'
       AND UPPER(LTRIM(RTRIM([ParameterValue]))) LIKE UPPER('My record is not listed')
GO

----------------------------------------------------------------------
-- Change default Value for UI Config option: FindMeRecordNotDisplayed
-- Set up web components > Forgot logon or password configuration
----------------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [DefaultParameterValue] = 'No match - continue'
 WHERE [ParameterName] = 'FindMeRecordNotDisplayed'
GO

-----------------------------------------------------------------
-- Change Value for UI Config option: FindMeRecordNotDisplayed2
-- Value is only changed if it is still set to the default
-- Set up web components > Forgot logon or password configuration
-----------------------------------------------------------------
UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'No match - continue'
 WHERE [ParameterName] = 'FindMeRecordNotDisplayed2'
       AND UPPER(LTRIM(RTRIM([ParameterValue]))) LIKE UPPER('My record is not listed')
GO

-----------------------------------------------------------------------
-- Change default Value for UI Config option: FindMeRecordNotDisplayed2
-- Set up web components > Forgot logon or password configuration
-----------------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [DefaultParameterValue] = 'No match - continue'
 WHERE [ParameterName] = 'FindMeRecordNotDisplayed2'
GO

----------------------------------------------------------
-- Create new Config option: InvalidEventMessage
----------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'InvalidEventMessage')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('9047DF5B-FE1B-4CAB-9CAD-CF3769745913', 'InvalidEventMessage', ' is no longer available.  Please remove it from your cart to continue.',
            '', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

--------------------------------------------
-- Remove unused LoginCreateAccountText variable
--------------------------------------------
DECLARE @parameterName nvarchar(255)
DECLARE @propertyDefinitionKey uniqueidentifier

SET @parameterName = 'LoginCreateAccountText'

SELECT @propertyDefinitionKey = PropertyDefinitionKey
  FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = @parameterName

DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] = @parameterName
DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = @parameterName
DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @parameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [Label] = @parameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey
GO

----------------------------------
-- Update Forgot my logon message
----------------------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [Description] = 'Show the <b>Forgot my logon</b> link '
 WHERE [ParameterName] = 'LoginShowFindMeLink'
GO

-----------------------
-- Update Forgot my password message
-----------------------
UPDATE [dbo].[SystemConfigParameterRef] 
   SET [Description] = 'Show the <b>Forgot my password</b> link '
 WHERE [ParameterName] = 'LoginShowResetPasswordLink'
GO

-------------------------------------------------------
-- Create new UI Config option: ParentOrganizationLabel
-- Set up web components > Personal label configuration
-------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'LabelPersonal', 'MANAGER',
     '1FC164F2-326E-4430-AA43-4270FA19047F',
     'ParentOrganizationLabel',
     'F213E1E2-BB6A-4C54-A9B0-9ADE9CE176A6',
     7, 6, 40,
     'Parent Organization',
     'Parent Organization',
     10
GO

-----------------------------------------------------------------
-- Change Value for UI Config option: PostalCodeLabel
-- Set up web components > Address label configuration
-----------------------------------------------------------------

UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = 'Postal Code'
WHERE [ParameterName] = 'PostalCodeLabel'
GO

----------------------------------------------------------------------
-- Change default Value for UI Config option: PostalCodeLabel
-- Set up web components > Address label configuration
----------------------------------------------------------------------

UPDATE [dbo].[SystemConfigParameterRef]
   SET [DefaultParameterValue] = 'Postal Code'
WHERE [ParameterName] = 'PostalCodeLabel'
GO

-----------------------------------------------------------------
-- Change Value for UI Config option: CreateAccountBaseUrl
-- Value is only changed if it is still set to the default
-- Set up customer web components > Create account configuration
-----------------------------------------------------------------

UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = 'http://www.YOUR_DOMAIN.com/YOUR_PUBLIC_SITE'
WHERE [ParameterName] = 'CreateAccountBaseUrl'
      AND UPPER(LTRIM(RTRIM([ParameterValue]))) LIKE UPPER('http://localhost/Medina')
GO


----------------------------------------------------------------------
-- Change default Value for UI Config option: CreateAccountBaseUrl
-- Set up customer web components > Create account configuration
----------------------------------------------------------------------

UPDATE [dbo].[SystemConfigParameterRef]
   SET [DefaultParameterValue] = 'http://www.YOUR_DOMAIN.com/YOUR_PUBLIC_SITE'
WHERE [ParameterName] = 'CreateAccountBaseUrl'
GO

--------------------------------------------
-- Remove old SystemDefaultCountry variable
--------------------------------------------
DELETE FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = '1CAD1E42-D4BB-4361-B426-B24CCFF9D12A'
GO

----------------------------------------------------------------
-- Create new UI Config option: SystemDefaultCountry
-- Set up web components > General configuration
----------------------------------------------------------------
EXECUTE [dbo].[asi_InsertSystemConfig] 
   @systemKeyword = 'Organization'
  ,@systemConfigPageName = 'General'
  ,@userId = 'SYSTEM'
  ,@systemConfigKey = 'F527FB4E-F7C1-4429-83B1-0E2C3DC1FB2F'
  ,@parameterName = 'SystemDefaultCountry'
  ,@propertyDefinitionKey = 'DF31D4F2-663B-4683-B6D8-3CEEBD6FE9AF'
  ,@dataTypeCode = 7
  ,@hiControlTypeCode = 1 
  ,@hiControlWidth = 0
  ,@description = 'Set the default country'
  ,@defaultParameterValue = 'US'
  ,@sortOrder = 1;
GO
 
----------------------------------------------------------------
-- Set lookup values for UI Config option: SystemDefaultCountry
-- Set up web components > General configuration
----------------------------------------------------------------
UPDATE [dbo].[PropertyDefinition]
   SET ValueListQueryDocumentVersionKey ='B2506A2E-FFA2-4ACD-A0A1-1B1315323D3A',   
   ValueListQueryDisplayColumn='CountryName',   
   ValueListQueryPersistColumn='CountryCode'  
WHERE [Label] = 'SystemDefaultCountry'
GO

----------------------------
-- Update ND.WebsiteRootFolder
-- 'ND.WebsiteRootFolder' had the wrong control type set, it was set as numeric rather than textbox
----------------------------
UPDATE [dbo].[PropertyDefinition]
    SET [HIControlTypeCode] = 6
WHERE [Label] = 'ND.WebsiteRootFolder'
GO

-----------------------
-- Update Help URL base
-----------------------
UPDATE SystemConfig 
   SET ParameterValue = 'http://docs.imis.com/15.2' 
 WHERE ParameterName = 'HelpURL'
GO
