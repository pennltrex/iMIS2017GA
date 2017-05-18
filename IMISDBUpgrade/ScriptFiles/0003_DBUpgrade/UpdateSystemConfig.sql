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
-- Beginning of script

-- PBI 34181 - Add DOCX and XLSX to CM.ShowFileTypes
UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = CASE WHEN PATINDEX(N'%XLSX%', [ParameterValue]) = 0 AND PATINDEX(N'%XLS%', [ParameterValue]) > 0
                          THEN N'XLSX,' + [Parametervalue]
                          ELSE [Parametervalue]
                          END
WHERE [ParameterName] = 'CM.ShowFileTypes'

UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = CASE WHEN PATINDEX(N'%DOCX%', [ParameterValue]) = 0 AND PATINDEX(N'%DOC%', [ParameterValue]) > 0
                          THEN N'DOCX,' + [Parametervalue]
                          ELSE [Parametervalue]
                          END
WHERE [ParameterName] = 'CM.ShowFileTypes'

-- PBI 35672 - Update help website url to i20
IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'HelpURL' AND [ParameterValue] = 'http://docs.imis.com/15.2')
BEGIN
   UPDATE [dbo].[SystemConfig] 
      SET [ParameterValue] = 'http://docs.imis.com/20.0' 
    WHERE [ParameterName] = 'HelpURL'
END

-- SBT 35755 - Update Search Hints
DECLARE @CR nchar(2);
SET @CR = NCHAR(10) + NCHAR(13);
UPDATE PropertyDefinition
   SET ValueList = N'0,0' + @CR + CAST(ValueList AS nvarchar(max)),
       IsRequired = 1
WHERE PropertyDefinitionKey IN ('22F314CF-B6D0-4493-8F24-503540259CB7',
                                 'E2D58EF1-69F4-46C3-BFA2-81E58A669747',
                                 '3CA20D7F-2DA7-4A86-A5D7-9F1D0561B4BB',
                                 '36CF3BE0-AD13-4284-B8A0-9F7466759B81')
   AND CHARINDEX(N'0,0' + @CR, ValueList) = 0

-- PBI 38655 - Turn unauthenticated web caching on as the automatic default in v10 and v100
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='DE8F4671-DE4A-434D-ABF9-8BB1AE1A040D')
BEGIN
EXEC [dbo].[asi_InsertSystemConfig]
     'Content', 'ContentDesigner', 'MANAGER',
     'DE8F4671-DE4A-434D-ABF9-8BB1AE1A040D',
     'CM.CacheDurationDefault',
     '4976D594-C7C1-4B96-A78B-CE5FBFA08121',
     7, 1, 40,
     'Any content record with a Cache duration of "Default" will use this value. ',
     'Long',
     36

DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] = N'None,DoNotCache' + @crlf + N'Short,Short' + @crlf + N'Medium,Medium' + @crlf + N'Long,Long',
       [IsRequired] = 1
WHERE [PropertyDefinitionKey] = '4976D594-C7C1-4B96-A78B-CE5FBFA08121'
 
INSERT INTO [dbo].[SystemConfigPageParameterRef]
           ([SystemConfigPageKey]
           ,[ParameterName]
           ,[SortOrder])
     VALUES
           ('817C4E23-5ABE-4FF4-9A33-0AA6C37C0310'
           ,'CM.CacheDurationDefault'
           ,80)
END
GO

-------------------------------------------------------
-- PBI 38966 - Add DataVaultId for EFT Gateway details
-------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'DataVault.CustomerId')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('7E34F920-0AFF-405B-A085-44772226F922', 'DataVault.CustomerId', '',
            'CustomerId registered within the Data Vault', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO


-----------------------------------------------------------------------------
-- PBI 39677 - Add AutoPay Asi.Billing.AllowAutomaticPayments config option for Billing Renewals
-- for use with Automatic Payment Instructions Creator iPart (3 steps)
-----------------------------------------------------------------------------
------------------------------------------------------
-- 1. Update existing system configuration 
-- Asi.Billing.AllowAutomaticPayments 
------------------------------------------------------
UPDATE SC
SET   SystemEntityKey = '49839AC9-43B5-42C0-AF9B-ABE5FA90F534'
       , [Description] = 'Allow Automatic Payments for Billing Renewals'
-- SELECT     *
FROM   SystemConfig SC
WHERE  SystemConfigKey = '54F41444-0BC9-4F7B-8A49-8AFFEDA2B0B1'
AND           (SystemEntityKey <> '49839AC9-43B5-42C0-AF9B-ABE5FA90F534'
       OR     [Description] <> 'Allow Automatic Payments for Billing Renewals')
GO
------------------------------------------------------
-- 2. Add system configuration to UI (and to SystemConfig table
-- if it doesn’t already exist)
-- Asi.Billing.AllowAutomaticPayments 
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET',
     'General',
     'MANAGER',
     '5FEC49EC-687B-4C0B-8CAF-9E99B85820B6',
     'Asi.Billing.AllowAutomaticPayments',
     'DC09FBEE-B404-4757-B936-A2C58C6A821D',
     7,
     1,
     40,
    'Allow Automatic Payments for Billing Renewals',
     'Disabled',
     12
GO
------------------------------------------------------
-- 3. Add system configuration drop down list to UI
-- Asi.Billing.AllowAutomaticPayments 
------------------------------------------------------
DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] = N'Allow users to enable,DefaultOff'
                     + @crlf + N'Disabled,Disabled'
                     + @crlf + N'Enabled by default,DefaultOn'
                     + @crlf + N'Required,Required'
WHERE [PropertyDefinitionKey] = 'DC09FBEE-B404-4757-B936-A2C58C6A821D'
GO

-----------------------------------------------------------------------------
-- PBI 39677 - Add AutoPay Asi.Fundraising.AllowRecurringDonations config option 
-- for Fundraising Items (2 steps)
-----------------------------------------------------------------------------
------------------------------------------------------
-- Create new System Configuration UI item
-- Asi.Fundraising.AllowRecurringDonations
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET',
     'General',
     'MANAGER',
     'C61BF09E-F05C-43E3-A901-190DF2911FD0',
     'Asi.Fundraising.AllowRecurringDonations',
     'C1641BC0-10FE-441B-B272-B20703CEE9C7',
     7,
     1,
     40,
     'Recurring donations',
     'Disabled',
     13
GO
------------------------------------------------------
-- 2. Add system configuration drop down list to UI
-- Asi.Fundraising.AllowRecurringDonations 
------------------------------------------------------
DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] = N'Allow users to enable,DefaultOff'
                     + @crlf + N'Disabled,Disabled'
                     + @crlf + N'Enabled by default,DefaultOn'
WHERE [PropertyDefinitionKey] = 'C1641BC0-10FE-441B-B272-B20703CEE9C7'
GO

-----------------------------------------------------------------------------
-- PBI 37293
-- Create new variable for Language Translation in General Config
-----------------------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'General', 'MANAGER',
     'D04A15E4-B59E-4DA5-A1F3-EFE20B666564',
     'LanguageTranslationEnabled',
     'C40BFC41-F5D2-4EFF-9BB6-F0E0AC820563',
     2, 0, 80,
     'Language Translation',
     0,
     2
GO

------------------------------------------------------
-- PBI 39746
-- Create new variable for allowing linking to organizations in General Config
-- Defaults to 'true'
------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] = 'SystemSettings')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey], [SystemConfigPageName], [SystemConfigPageDesc])
    VALUES ('818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8', 'SystemSettings',
            'System settings configuration (Variable names in parentheses)')
END
GO

IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='8569098A-FC55-4A8C-9CBA-185DF3398C64')
BEGIN
   UPDATE [dbo].[SystemConfigPageParameterRef] SET [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8', [SortOrder] = 0 WHERE [ParameterName] = 'AllowUsersToLinkToOrg'
END
GO

--deals with empty database settings to correct settings
UPDATE [SystemConfigParameterRef] 
SET [DefaultParameterValue] = 'False' 
WHERE [ParameterName] = 'AllowUsersToLinkToOrg' AND [DefaultParameterValue] = '0'

UPDATE [SystemConfig] 
SET [ParameterValue] = 'False' 
WHERE [ParameterName] = 'AllowUsersToLinkToOrg' AND [ParameterValue] = '0'

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='8569098A-FC55-4A8C-9CBA-185DF3398C64')
BEGIN
EXEC [dbo].[asi_InsertSystemConfig]
     'Content', 'SystemSettings', 'MANAGER',
     '8569098A-FC55-4A8C-9CBA-185DF3398C64',
     'AllowUsersToLinkToOrg',
     '0399D4F6-899F-4D48-92B1-7D2F3FDBF0C5',
     2, 0, 1,
     'Allow all users to link to an organization.',
     'True'
END 
GO

-- This system configuration item needs to be here so that the SystemSettings page exists check happens before we try creating the new system configuration item
    ------------------------------------------------------
    -- PBI 27030
    -- Create new variable for Password Requirements in System Settings Config
    ------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='10893ec7-1223-4ffa-a7d3-f35c54626508')
    BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content', 'SystemSettings', 'MANAGER',
         '10893ec7-1223-4ffa-a7d3-f35c54626508',
         'PasswordRequirementsText',
         'e9b778f0-1c44-49fa-8843-e5d4feddf167',
         7, 7, 100,
         'Password requirements text.',
         'The password must be at least {0} characters long.',
         15
    END 
    GO

------------------------------------------------------
-- PBI 41786 - Create new variable for Invalid Sign In message in System Settings Config
------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='3BFB0986-A0DF-4526-9E62-0F2DE2832839')
BEGIN
    EXEC [dbo]. [asi_InsertSystemConfig]
         'Content', -- systemKeyword
         'SystemSettings', -- systemConfigPageName
         'MANAGER', -- userId
         '3BFB0986-A0DF-4526-9E62-0F2DE2832839' , -- systemConfigKey
         'SignInFailedMessageSystemText', -- parameterName
         '80C83ECD-9360-4416-B0E8-EDD0B18A4D86' , --propertyDefinitionKey
         7 , -- dataTypeCode
         7 , -- hiControlTypeCode
         100 , -- hiControlWidth
         'Default message if sign in fails.', -- description
         'The username or password you entered is incorrect.' , -- defaultParameterValue
         20  -- sortOrder
END
GO


------------------------------------------------------------------------------------------
-- PBI 38633 - Allow for public users to choose their organization as the Bill To contact
------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='FF8F9D37-0BD8-4536-8A58-0FFC1A614E98')
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Commerce', 'SystemSettings', 'MANAGER',
         'FF8F9D37-0BD8-4536-8A58-0FFC1A614E98',
         'AllowAllUsersToBillToOrg',
         '25F0BDC0-1FD9-4E44-943E-EAC1BD697A98',
         7, 1, 40,
         'Users who can bill to their organization.',
         'CompanyAdminsOnly',
         10
END
ELSE
BEGIN
    UPDATE dbo.[SystemConfig]
       SET [Description] = 'Users who can bill to their organization.', [ParameterValue] = 'CompanyAdminsOnly', [UpdatedOn] = getdate()
     WHERE [SystemConfigKey] = 'FF8F9D37-0BD8-4536-8A58-0FFC1A614E98'
     
    UPDATE dbo.[SystemConfigParameterRef]
       SET [Description] = 'Users who can bill to their organization.', [DefaultParameterValue] = 'CompanyAdminsOnly'
     WHERE [PropertyDefinitionKey] = '25F0BDC0-1FD9-4E44-943E-EAC1BD697A98'
END

DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] = N'Company administrators only,CompanyAdminsOnly' + @crlf + N'All users,AllUsers' + @crlf + N'All users - organization selected by default,AllUsersPrimaryOrgIsDefault',
       [IsRequired] = 1
 WHERE [PropertyDefinitionKey] = '25F0BDC0-1FD9-4E44-943E-EAC1BD697A98'

GO

-------------------------------------------------------------------------------------
-- PBI 39956/SMR 301855 - Only Staff should be allowed to have the On Behalf Of role
-------------------------------------------------------------------------------------
-- Add a security token to the SystemConfig table
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @oboRoleKey uniqueidentifier
DECLARE @now datetime

SELECT @oboRoleKey = [RoleKey] FROM [dbo].[RoleMain] WHERE [Name] = 'OnBehalfOf'
SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Security.Token.OnBehalfOfRoleKey')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('BBEE7DF2-57D2-4FE5-89C6-C20EBF7C5A36', 'Security.Token.OnBehalfOfRoleKey', @oboRoleKey,
            '', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

------------------------------------------------------
-- Create new variable for TranslateWCMReadOnly in General Config
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'General', 'MANAGER',
     'EC3D0B50-3287-4E01-BAC5-705847D60B8A',
     'TranslateWCMReadOnly',
     'E7263285-2C90-4D8A-AF2E-323A4553AF85',
     2, 0, 80,
     'Translate WCM pages in read only mode',
     0,
     3
GO

------------------------------------------------------
-- Create new variable for TranslateAPIReadOnly in General Config
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'General', 'MANAGER',
     '2626ACD9-9EC4-4F4E-9818-AB03539092A6',
     'TranslateAPIReadOnly',
     'E853BB2C-3673-495A-9C49-4592EF600467',
     2, 0, 80,
     'Translate API in read only mode',
     0,
     4
GO

------------------------------------------------------
-- PBI 40873 - Set up a system config parameter page entry for 
-- the existing DefaultCurrencyCode row in SystemConfig
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'ContentManager.QuickSetup', 'MANAGER',
     'B2AB4967-FBEF-4D5D-8F5C-98B8335182B9',
     'DefaultCurrencyCode',
     'A33AE8FC-11A1-4146-BC86-C4872BAE0B10',
     7,  -- DateType = String
     6,  -- HIControlType = TextField
     10, -- Control width
     'Default currency code used by RiSE components.  This must be the three character ISO-4217 code.',
     'USD',
     1,   -- Make it the first setting on the page.
     0    -- Don't create the system config entry
GO

------------------------------------------------------
-- Create new variable for Public Directory Query in System Settings Config
------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = 'a3350db1-e6fd-49a2-a5f7-a3547a291826')
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         'a3350db1-e6fd-49a2-a5f7-a3547a291826',
         'PublicDirectoryQuery',
         'd437981f-d3d5-4f7b-b0ec-7b6e502452d8',
         7,
         21,
         200,
         '<div class="PanelTitle">Online directory access</div>All website visitors can view contacts included in this query.',
         '',
         25
END
GO

------------------------------------------------------
-- Create new variable for Member Only Directory Query in System Settings Config
------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = '2da65cb5-c52f-4f15-b274-57d289b8c14d')
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         '2da65cb5-c52f-4f15-b274-57d289b8c14d',
         'MemberOnlyDirectoryQuery',
         'e0207609-3161-4b1b-b6fd-1294d6198f5f',
         7,
         21,
         200,
         'Members can view contacts included in this query.',
         '',
         26
END
GO

--  Delete the Contacts Search systemconfig entries so that all contacts get re-indexed.
DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] LIKE 'ContactsPublishing-%'
GO

---------------------------------------------------
-- PBI 41757 - Update help docs URL for new release
---------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = 'http://docs.imis.com/20.1'
 WHERE [ParameterName] = 'HelpURL'
 GO

 ------------------------------------------------------
-- Create new System Configuration UI item
-- Contact.Email.RegularExpression
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET',
     'General',
     'MANAGER',
     '9D28EEC9-FE9A-402A-9608-B5099D2ABF81',
     'Contact.Email.RegularExpression',
     '52E3BFE5-B181-43F4-BEE9-FCA7604018BA',
     7,
     6,
     0,
     'Email Regular Expression',
     '\w+([-+!$%&*/=?{|}.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*',
     19
GO

-------------------------------------------------------------------------------------------------------------------------
-- SBT 43451 - Delete and recreate incorrectly named config parameters - the names should not include the word Directory
-------------------------------------------------------------------------------------------------------------------------
DECLARE @systemConfigKey uniqueidentifier
DECLARE @defaultParameterValue nvarchar(2500)
DECLARE @systemConfigPageKey uniqueidentifier
DECLARE @propertyDefinitionKey uniqueidentifier
DECLARE @oldParameterName nvarchar(255)

SELECT @systemConfigPageKey = [SystemConfigPageKey] FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] = 'SystemSettings'

SET @systemConfigKey = 'A3350DB1-E6FD-49A2-A5F7-A3547A291826'
SET @propertyDefinitionKey = 'D437981F-D3D5-4F7B-B0EC-7B6E502452D8'
SET @oldParameterName = 'PublicDirectoryQuery'

IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = @systemConfigKey AND 
                                                     ([ParameterName] = 'NonMemberAccessQuery' OR [ParameterName] = 'AllUsersAccessQuery'))
BEGIN

    SELECT @defaultParameterValue = [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey

    DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey
    DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey

    ------------------------------------------------------
    -- Create new variable for Non-Member User Access Query in System Settings Config
    ------------------------------------------------------
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         @systemConfigKey,
         'NonMemberAccessQuery',
         @propertyDefinitionKey,
         7,
         21,
         200,
         '<div class="PanelTitle">Online user access</div>All website visitors can view contacts included in this query.',
         @defaultParameterValue,
         25
END
     
SET @systemConfigKey = '2DA65CB5-C52F-4F15-B274-57D289B8C14D'
SET @propertyDefinitionKey = 'E0207609-3161-4B1B-B6FD-1294D6198F5F'
SET @oldParameterName = 'MemberOnlyDirectoryQuery'
     
IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = @systemConfigKey AND [ParameterName] = 'MemberAccessQuery')
BEGIN
    SELECT @defaultParameterValue = [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey

    DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey
    DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey

    ------------------------------------------------------
    -- Create new variable for Member Only User Access Query in System Settings Config
    ------------------------------------------------------
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         '2DA65CB5-C52F-4F15-B274-57D289B8C14D',
         'MemberAccessQuery',
         'E0207609-3161-4B1B-B6FD-1294D6198F5F',
         7,
         21,
         200,
         'Members can view contacts included in this query.',
         @defaultParameterValue,
         26
         
END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Delete and recreate incorrectly named config parameters - the names should not be named with "All Users" instead of "NonMembers"
-------------------------------------------------------------------------------------------------------------------------
DECLARE @systemConfigKey uniqueidentifier
DECLARE @defaultParameterValue nvarchar(2500)
DECLARE @systemConfigPageKey uniqueidentifier
DECLARE @propertyDefinitionKey uniqueidentifier
DECLARE @oldParameterName nvarchar(255)

SELECT @systemConfigPageKey = [SystemConfigPageKey] FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageName] = 'SystemSettings'

SET @systemConfigKey = 'A3350DB1-E6FD-49A2-A5F7-A3547A291826'
SET @propertyDefinitionKey = 'D437981F-D3D5-4F7B-B0EC-7B6E502452D8'
SET @oldParameterName = 'NonMemberAccessQuery'

IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = @systemConfigKey AND [ParameterName] = 'AllUsersAccessQuery')
BEGIN

    SELECT @defaultParameterValue = [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey

    DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = @systemConfigPageKey AND [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @oldParameterName
    DELETE FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = @systemConfigKey
    DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey

    ------------------------------------------------------
    -- Create new variable for All Users Access Query in System Settings Config
    ------------------------------------------------------
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         @systemConfigKey,
         'AllUsersAccessQuery',
         @propertyDefinitionKey,
         7,
         21,
         200,
         '<div class="PanelTitle">Online user access</div>All website visitors can view contacts included in this query.',
         @defaultParameterValue,
         25
END
GO

  -- Add a new system config for authenticated user access
  DECLARE @systemConfigKey AS UNIQUEIDENTIFIER;
  DECLARE @propertyDefinitionKey AS UNIQUEIDENTIFIER;
  SET @systemConfigKey = 'A1B1561A-643C-4A33-A74F-F42627CCE271';
  SET @propertyDefinitionKey = '1B9BDFA0-4980-48F3-87B2-88897D7333C1';
  
  IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [ParameterName] = 'AuthenticatedUsersAccessQuery')
  BEGIN
    --first change order of appearance so new entry appears in middle
    UPDATE [dbo].[SystemConfigPageParameterRef] 
    SET [SortOrder] = 35
    WHERE [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8'
    AND [ParameterName] = 'MemberAccessQuery'
    
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'SystemSettings',
         'MANAGER',
         @systemConfigKey,
         'AuthenticatedUsersAccessQuery',
         @propertyDefinitionKey,
         7,
         21,
         200,
         'Authenticated users can view contacts included in this query.',
         '$/ContactManagement/DefaultSystem/Queries/Contacts/All Contacts',
         30
  END
GO

-- End of Script
SET NOCOUNT OFF
GO