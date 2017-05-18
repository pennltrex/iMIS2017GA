
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

------------------------------------------------------
-- PBI 51795
-- Create new variable Asi.Orders.WebOrderStage
-- Map value from Asi.Orders.AdvanceNonInventoryToInvoiceStage to Asi.Orders.WebOrderStage
-- Remove Asi.Orders.AdvanceNonInventoryToInvoiceStage from parameter pages
------------------------------------------------------
DECLARE @sortOrder int
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[SystemConfigPageParameterRef]
WHERE [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD'
       AND [ParameterName] = 'Asi.Orders.AdvanceNonInventoryToInvoiceStage'
SET @sortOrder = COALESCE(@sortOrder,-1)

EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommerceGeneral', 'MANAGER',
     '694C97FE-620B-4ECA-BFF5-C4D3579C0014',
     'Asi.Orders.WebOrderStage',
     'EC4B6A9C-0E46-4FB4-9B99-3F9557B081F6',
     7, 1, null,
     'Order stage if order does not contain inventory items - Standard order types only',
     '', @sortOrder

DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] =
    N'Default per order type settings,' + 
    @crlf + N'Ready for invoice printing,INVOICE' + 
    @crlf + N'Completed,COMPLETED',
       [IsRequired] = 0
WHERE [PropertyDefinitionKey] = 'EC4B6A9C-0E46-4FB4-9B99-3F9557B081F6'

DECLARE @oldSetting nvarchar(max)
SELECT @oldSetting = [ParameterValue] 
  FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'Asi.Orders.AdvanceNonInventoryToInvoiceStage'
IF UPPER(COALESCE(@oldSetting,'False')) = 'TRUE'
BEGIN
    UPDATE [dbo].[SystemConfig]
       SET [ParameterValue] = 'INVOICE'
     WHERE [ParameterName] = 'Asi.Orders.WebOrderStage' 
END

DELETE FROM [dbo].[SystemConfigPageParameterRef]
      WHERE [ParameterName] = 'Asi.Orders.AdvanceNonInventoryToInvoiceStage'
GO

-----------------------------------------------------------------------------------------
-- PBI 61426 - Remove 'Asi.Billing.AllowAutomaticPayments' from UI config page 
-----------------------------------------------------------------------------------------
DELETE From [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] = 'Asi.Billing.AllowAutomaticPayments'

-----------------------------------------------------------------------------------------
-- PBI 61426 - Add 'Asi.Fundraising.AllowDonorChangeDonationAmount' config option 
-----------------------------------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.Fundraising.AllowDonorChangeDonationAmount')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('1272B6FC-9128-4129-B5B2-702C25EA73C0', 'Asi.Fundraising.AllowDonorChangeDonationAmount', 'False', 'Allow donors to modify their donation amount',
    @systemUserKey, @now, @systemUserKey, @now,@organizationKey, @systemEntityKey)
END
GO

-----------------------------------------------------------------------------------------
-- PBI 61426 - Remove 'Asi.Fundraising.AllowRecurringDonations' from UI config page 
-----------------------------------------------------------------------------------------
DELETE From [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] = 'Asi.Fundraising.AllowRecurringDonations'

-----------------------------------------------------------------------------------------
-- PBI 63838 - Add 'Asi.Fundraising.DonationAllowCustomCollectionDate' config option 
-- PBI 63838 - Add 'Asi.Fundraising.DonationCollectionDateWindow' config option 
-----------------------------------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE() 

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.Fundraising.DonationAllowCustomCollectionDate')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('758E5DEF-2690-4304-A3FB-2E9F0881B4BC', 'Asi.Fundraising.DonationAllowCustomCollectionDate', 'False', 'Allow donors to select their collection date',
    @systemUserKey, @now, @systemUserKey, @now,@organizationKey, @systemEntityKey)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.Fundraising.DonationCollectionDateWindow')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('E8D1DAC1-2CC8-4D0D-BFC9-9C822273374A', 'Asi.Fundraising.DonationCollectionDateWindow', '1or15', 'Collection Date window period for donations',
    @systemUserKey, @now, @systemUserKey, @now,@organizationKey, @systemEntityKey)
END
GO

---------------------------------------------------------------------
--PBI 60221 Modify the password reset email body text if it has not
--modified
---------------------------------------------------------------------
UPDATE [dbo].[systemConfig] 
   SET [ParameterValue] = '<p>We received a request to reset the password for the username ''[UserId]''. If you made this request, <a href="[LogonUrl]">go to the password reset page</a>. This link is valid for [ValidResetDuration] minutes after the time it was requested.</p><p>If you did not request to have your password reset, you can safely ignore this email.</p><p>If clicking on the link does not work, you can copy and paste the following link into your browser''s address window.</p><p><small>[LogonUrl]</small></p>'
 WHERE [ParameterName] = 'PasswordResetRequestMessage'
   AND [ParameterValue] = '<p>Password reset request for logon: [UserId]</p><p>We received a request to reset the password for the Logon referenced above. If you made this request, please click the link shown below to reset your password.</p><p>If you did not request to have your password reset, you can safely ignore this email.</p>Please click the link below to reset your password:</p><p>[LogonUrl]</p><p>If clicking on the link does not work, you can copy and paste the link into your browser''s address window.</p>'

GO

---------------------------------------------------------------------
--PBI 61335 Prepare for password expiration policy required by PCI
---------------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.PasswordExpireDaysSysAdmin')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('33036E3B-97A0-4A19-A54C-5CD860D457E1', 'PCI.PasswordExpireDaysSysAdmin', '0',
            'Number of days before system administrator password expires.', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.PasswordExpireDays')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('6CA5CC2E-7862-473F-A1B7-F7B46533DBB8', 'PCI.PasswordExpireDays', '0',
            'Number of days before all non-system administrator passwords expire.', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END

GO

--------------------------------------------------
-- Add 'PasswordHistoryCountSysAdmin' - PBI 48300
--------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.PasswordHistoryCountSysAdmin')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('077BED1D-F660-461B-9977-EA145EE2B7F2', 'PCI.PasswordHistoryCountSysAdmin', '0',
            'Number of passwords we keep in history, preventing system administrators from reusing when resetting their passwords', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

---------------------------------------------
-- Add 'PasswordHistoryCount' - PBI 48300
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.PasswordHistoryCount')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('D4872EC2-5C41-474E-9712-D4EC3F21E314', 'PCI.PasswordHistoryCount', '0',
            'Number of passwords we keep in history, preventing non-system administrators from reusing when resetting their passwords', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO


---------------------------------------------
-- Add 'EnabledPublishHelpers' v10 PBI 61181
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'EnabledPublishHelpers')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('51EA31F0-247D-4051-81DF-FB65E4271A42', 'EnabledPublishHelpers', 'ContactPublishHelperLucene,EventPublishHelperLucene,PostPublishHelperLucene,ProductPublishHelperLucene,ContentPublishHelper,CommunityPublishHelperLucene',
            'List of all enabled publish helpers that will determine what item categories to index.', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

---------------------------------------------
-- Add 'SessionTimeoutMinutesSysAdmin'
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.SessionTimeoutMinutesSysAdmin')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('2F0EB826-9BB8-4442-A4D8-BA3CE396F62A', 'PCI.SessionTimeoutMinutesSysAdmin', '0',
            'Number of minutes of idle time before session times out for system administrators', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

---------------------------------------------
-- Add 'SessionTimeoutMinutes'
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.SessionTimeoutMinutes')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('4687A718-5A61-4F2C-9F24-EAE1FAFDDD2D', 'PCI.SessionTimeoutMinutes', '0',
            'Number of minutes of idle time before session times out for non-system administrators', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

------------------------------------------------------
-- PBI 62222 Create new variable for enabling auto creation of user accounts
------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'eSeriesNET', 'AccountManagementRiSE', 'MANAGER',
     '880BC594-BB2C-4289-ADAD-BE40DCE5E1A6',
     'AutoCreateUserAccount',
     '546DD059-5D40-4880-944D-2830B9CAFF0F',
     2, 0, null,
     'Allow "Forgot my username" to automatically create user credentials for existing contacts',
     '0', 31
GO

---------------------------------------------------------------------------------------------------
-- SBT 63683: Create a setting in the UI to set the number of days before credit card data deleted
-------------------------------------------------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommerceGeneral', 'MANAGER',
     '52657500-A603-4593-A919-7E7B1160DC87',
     'PCI.CCardRetentionDays',
     'FB2154E0-C0C2-4A15-B815-9082F3066D82',
     6, 14, 80,
     'Number of days before credit card deletion',
     '0',51
GO

-------------------------------------------------------------------------------------------------
--  SMR 67266 - Create new variable 'CM.OverrideItemUpdatedTextForTranslation' for community subscibed item updated email template to allow translation
-------------------------------------------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'CommunitySettings', 'MANAGER',
     '1292F1F4-CAFD-41F8-9A98-C453AD043CB7',
     'CM.OverrideItemUpdatedTextForTranslation',
     '27906CC2-B2EB-4868-AA41-C075745C1960',
     7, 6, 200,
     'Notification message when a subscribed community item is updated.',
     'An item to which you have subscribed has been updated.'
GO

----------------------------------------------------------------------------------------------------------
--  PBI55081 Create a setting to determine number of rows we will process when clearing CC info
----------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.CCardRetentionRowLimit')
BEGIN
    DECLARE @systemUserKey uniqueidentifier;
    DECLARE @organizationKey uniqueidentifier;
    DECLARE @systemEntityKey uniqueidentifier;
    DECLARE @now datetime;

    SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER';
    SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization';
    SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1;
    SELECT @now = GETDATE();

    INSERT INTO [dbo].[SystemConfig]([SystemConfigKey],
                                     [ParameterName],
                                     [ParameterValue],
                                     [Description],
                                     [CreatedByUserKey],
                                     [CreatedOn],
                                     [UpdatedByUserKey],
                                     [UpdatedOn],
                                     [OrganizationKey],
                                     [SystemEntityKey])
    VALUES('919E9804-BC72-43A6-ABDB-4833B3F0935A',
           'PCI.CCardRetentionRowLimit',
           '5000',
           'Number of rows to be processed per task',
           @systemUserKey,
           @now,
           @systemUserKey,
           @now,
           @organizationKey,
           @systemEntityKey);
END
GO

----------------------------------------------------------------------------------------------------------
--  PBI61677 New system config entries for Key encryption key work
----------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Systemconfig] WHERE [Parametername] = 'KEKLength')
BEGIN
  DECLARE @systemUserKey uniqueidentifier
  DECLARE @organizationKey uniqueidentifier
  DECLARE @systemEntityKey uniqueidentifier
  DECLARE @now datetime

  SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
  SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
  SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
  SELECT @now = GETDATE()

  INSERT INTO [dbo].[SystemConfig]([SystemConfigKey],
                                   [ParameterName],
                                   [ParameterValue],
                                   [Description],
                                   [CreatedByUserKey],
                                   [CreatedOn],
                                   [UpdatedByUserKey],
                                   [UpdatedOn],
                                   [OrganizationKey],
                                   [SystemEntityKey])
  VALUES('7CFF86E2-EB5D-4BE5-83D5-0961644ADB2D',
          'KEKLength',
          '16',
          'Length of KEK in KEK file',
          @systemUserKey,
          @now,
          @systemUserKey,
          @now,
          @organizationKey,
          @systemEntityKey)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Systemconfig] WHERE [Parametername] = 'KEKStartingLocation')
BEGIN
    DECLARE @systemUserKey uniqueidentifier
    DECLARE @organizationKey uniqueidentifier
    DECLARE @systemEntityKey uniqueidentifier
    DECLARE @now datetime

    SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
    SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
    SELECT @now = GETDATE()

    INSERT INTO [dbo].[SystemConfig]([SystemConfigKey],
                                   [ParameterName],
                                   [ParameterValue],
                                   [Description],
                                   [CreatedByUserKey],
                                   [CreatedOn],
                                   [UpdatedByUserKey],
                                   [UpdatedOn],
                                   [OrganizationKey],
                                   [SystemEntityKey])
  VALUES('E47BBDC6-2246-44BB-BBF8-62778D34755E',
          'KEKStartingLocation',
          '1',
          'Location that KEK starts in KEK file',
          @systemUserKey,
          @now,
          @systemUserKey,
          @now,
          @organizationKey,
          @systemEntityKey)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Systemconfig] WHERE [Parametername] = 'KEKFilePath')
BEGIN
    DECLARE @systemUserKey uniqueidentifier;
    DECLARE @organizationKey uniqueidentifier;
    DECLARE @systemEntityKey uniqueidentifier;
    DECLARE @now datetime;
    SELECT @systemUserKey = [Userkey]
      FROM [Dbo].[Usermain]
     WHERE [Userid] = 'MANAGER';
    SELECT @systemEntityKey = [Systementitykey]
      FROM [Dbo].[Systementity]
     WHERE [Systemkeyword] = 'Organization';
    SELECT @organizationKey = [Organizationkey]
      FROM [Dbo].[Organizationmain]
     WHERE [Isdefault] = 1;
    SELECT @now = GETDATE();
    INSERT INTO [Dbo].[Systemconfig] ([Systemconfigkey],
                                      [Parametername],
                                      [Parametervalue],
                                      [Description],
                                      [Createdbyuserkey],
                                      [Createdon],
                                      [Updatedbyuserkey],
                                      [Updatedon],
                                      [Organizationkey],
                                      [Systementitykey]
                                     )
    VALUES ('69B75303-0E46-4A0C-8705-FBD0F604B521',
            'KEKFilePath',
            '~/App_Data/kek.txt',
            'Location of KEK file used to encrypt AESEncryptionKey',
            @systemUserKey,
            @now,
            @systemUserKey,
            @now,
            @organizationKey,
            @systemEntityKey
           );
END;
GO

---------------------------------------------
-- PBI 63882 - Add 'DB.TimeZoneId'
---------------------------------------------
IF NOT EXISTS (
               SELECT 1
                 FROM [dbo].[SystemConfig]
                WHERE [SystemConfig].[ParameterName] = 'System.Database.TimeZoneId'
)
BEGIN
    DECLARE @tzName varchar(50);
    EXEC [Master].[Dbo].[xp_regread]
         'HKEY_LOCAL_MACHINE',
         'SYSTEM\CurrentControlSet\Control\TimeZoneInformation',
         'TimeZoneKeyName',
         @tzName OUT;
    EXEC [dbo].[asi_InsertSystemConfig]
         'Organization', -- eSeriesNET?  Content?
         'ContentManager.QuickSetup',
         'MANAGER',
         '105EB205-AB4F-486C-A291-A0E15A65C9A2', -- SystemConfigKey
         'System.Database.TimeZoneId',
         '116137EC-C2E4-41EF-82D5-0D2D7BF05369', -- PropertyDefinitionKey
         7, -- string
         26, -- HIControlType: TimeZone
         120, -- HIControlWidth
         'Time zone',
         @tzName,
         85;     -- Sort Order
END;
GO

---------------------------------------------
-- PBI 63882 - Add 'DB.TimeZoneOffset'
---------------------------------------------
IF NOT EXISTS (
               SELECT 1
                 FROM [dbo].[SystemConfig]
                WHERE [SystemConfig].[ParameterName] = 'System.Database.TimeZoneOffset'
)
BEGIN
    DECLARE @systemUserKey uniqueidentifier;
    DECLARE @organizationKey uniqueidentifier;
    DECLARE @systemEntityKey uniqueidentifier;
    DECLARE @now datetime;
    SELECT @systemUserKey = [UserMain].[UserKey]
      FROM [dbo].[UserMain]
     WHERE [UserMain].[UserId] = 'MANAGER';
    SELECT @systemEntityKey = [SystemEntity].[SystemEntityKey]
      FROM [dbo].[SystemEntity]
     WHERE [SystemEntity].[SystemKeyword] = 'Organization';
    SELECT @organizationKey = [OrganizationMain].[OrganizationKey]
      FROM [dbo].[OrganizationMain]
     WHERE [OrganizationMain].[IsDefault] = 1;
    SELECT @now = GETDATE();
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey],
                                      [ParameterName],
                                      [ParameterValue],
                                      [Description],
                                      [CreatedByUserKey],
                                      [CreatedOn],
                                      [UpdatedByUserKey],
                                      [UpdatedOn],
                                      [OrganizationKey],
                                      [SystemEntityKey]
                                     )
    VALUES ('08D28564-232E-408F-A17F-065E8ED55E04',
            'System.Database.TimeZoneOffset',
            DATEPART([TZoffset], SYSDATETIMEOFFSET()),
            'The offset in minutes from GMT for the current DB.TimeZone selection',
            @systemUserKey,
            @now,
            @systemUserKey,
            @now,
            @organizationKey,
            @systemEntityKey
           );
END;
GO     

----------------------------------
-- Add DefaultPurchaseOrder option to Commerce General settings page - PBI 64322
----------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef] 
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD', [SortOrder] = 80 
 WHERE [ParameterName] = 'DefaultPurchaseOrder'
GO

--------------------------------------------
-- Remove DataVault.DataVaultServiceAddress page parameter
-- from Commerce Settings UI - PBI 69563
--------------------------------------------
DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = N'DataVault.DataVaultServiceAddress'
GO


----------------------------------------------------------------------------------------------
-- Update all the default constraints for columns from GetDate() to dbo.asi_GetAppDatetime()
-- We have to do it here instead of in UpdateTableSchema because we need to ensure the new
-- asi_GetAppDatetime() function is already installed, as well as the necessary SystemConfig
-- variables before we do this.
----------------------------------------------------------------------------------------------
DECLARE @sql nvarchar(max);
SELECT @sql = N'';
SELECT @sql += 'ALTER TABLE ' + OBJECT_NAME(d.[parent_object_id]) + ' DROP CONSTRAINT ' + d.[name] + ';
ALTER TABLE ' + OBJECT_NAME(d.[parent_object_id]) + ' ADD CONSTRAINT ' + d.[name] + ' DEFAULT (dbo.asi_GetAppDatetime()) FOR ' + c.[name] + ';
'
  FROM sys.default_constraints d
       INNER JOIN sys.columns c ON d.[parent_object_id] = c.object_id AND d.[parent_column_id] = c.[column_id] 
       INNER JOIN [dbo].[IMISTable] t ON OBJECT_NAME(d.[parent_object_id]) = t.[IMISTableName]
 WHERE [definition] = '(getdate())' 
ORDER BY OBJECT_NAME(d.[parent_object_id]), c.[name];
EXEC(@sql);
GO

----------------------------------------------------------------------------------------------
-- PBI 65284: Add KEKFileHash parameter, used to compare KEK files
----------------------------------------------------------------------------------------------

DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'KEKFileHash')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('BF8E9248-F7CB-43F0-A45A-2D6CA88D9F75', 'KEKFileHash', 'XaBHxXlg8maDtBnJCVw2Fdyvn+U=',
            'Hash used to compare the contents of Key Encryption Key (KEK) files', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO
----------------------------------------------------------------------------------------------------------------
--iMisMain10 SBT 65456 add 'PCI.MultiFactorAuthentication' to SystemConfig 
---------------------------------------------------------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'PCI.MultiFactorAuthentication')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('617F5A6C-499A-4763-92FD-3C2A368D402A','PCI.MultiFactorAuthentication', '0', 'Enable or disable multi-factor authentication',
            @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

---------------------------------------------
--  PBI 66395
--  Add 'SystemConfig.AESEncryptionKeyLast'
--  Delete 'KEKStartingLocationLast' and
-- 'KEKFileHashLast'
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = dbo.asi_GetAppDatetime()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'AESEncryptionKeyLast')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('C9ED695F-C8A3-482F-A9FB-3E3A0C59925E', 'AESEncryptionKeyLast', '',
            'Last AESEncrytionKey, used for recovery', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END

DELETE FROM [dbo].[SystemConfig]
 WHERE [ParameterName] = 'KEKFileHashLast'
GO

DELETE FROM [dbo].[SystemConfig]
 WHERE [ParameterName] = 'KEKStartingLocationLast'
GO

-- End of Script ------------------------------------------------------------------------------------------

SET NOCOUNT OFF
GO