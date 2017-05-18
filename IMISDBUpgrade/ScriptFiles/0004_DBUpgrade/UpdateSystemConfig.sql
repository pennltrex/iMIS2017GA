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

-----------------------------------------------------------------------------------------------------------
--- Do not remove when rebasing.
--- PBI 48486:  Always Delete the Contacts Search systemconfig entries so that all contacts get re-indexed.
--- This setting is recreated when any contact search info is indexed; upgrades should ensure
--- all contact are reindexed.
-----------------------------------------------------------------------------------------------------------
DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] LIKE 'ContactsPublishing-%'
GO


-------------------------------------------------------------
-- PBI 41602 - Rearrange the Settings section
-------------------------------------------------------------

-- Create new System Config Pages (Part of PBI 41602)
-------------------------------------------------------------
-- Add ContactsGeneral
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = 'C8A81136-E7C4-46CE-B364-292E6BA9EA38')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('C8A81136-E7C4-46CE-B364-292E6BA9EA38', 'ContactsGeneral', 'Contact Settings')
END
GO

-- Add ContactSecurity
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = 'A61DD46B-630C-42DD-B15F-62EC086062D7')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('A61DD46B-630C-42DD-B15F-62EC086062D7', 'ContactSecurity', 'Contact Security Settings')
END
GO

-- Add CommerceGeneral
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('9555733A-B2B2-4416-854B-BBAC4E8568CD', 'CommerceGeneral', 'Commerce Settings')
END
GO

-- Add TranslationSettings
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = 'AD966E20-944C-43B0-85A4-D598CACE84DA')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('AD966E20-944C-43B0-85A4-D598CACE84DA', 'TranslationSettings', 'Language Translation Settings')
END
GO

-- Rename old config pages to match new page names (Part of PBI 41602)
-------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Page Builder Settings'
 WHERE [SystemConfigPageKey] = 'C3643FB0-D7B3-41AA-8A56-8D67A1428D5A' -- ContentDesigner
 
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'RiSE Settings'
 WHERE [SystemConfigPageKey] = '817C4E23-5ABE-4FF4-9A33-0AA6C37C0310' -- ContentManager.QuickSetup
 
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'RiSE Workflow Settings'
 WHERE [SystemConfigPageKey] = '2EB971CA-3519-463D-9E27-705E48E5164B' -- ContentWorkflow
 
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Site Builder Settings'
 WHERE [SystemConfigPageKey] = '4EDD55F7-36C1-4B41-89FD-8F5C233E94F5' -- NavigationDesigner
 
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Search Settings'
 WHERE [SystemConfigPageKey] = '240AF2A3-B3F2-4D6F-8AAF-9821027719B2' -- Search
GO

-- Updates which options are included on the ContactsGeneral page (Part of PBI 41602)
-------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'C8A81136-E7C4-46CE-B364-292E6BA9EA38', 
       [SortOrder] = 10
 WHERE [ParameterName] = 'SystemDefaultCountry' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page
 
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'C8A81136-E7C4-46CE-B364-292E6BA9EA38', 
       [SortOrder] = 20
 WHERE [ParameterName] = 'AllowUsersToLinkToOrg' AND [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8' -- Move from SystemSettings page

UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'C8A81136-E7C4-46CE-B364-292E6BA9EA38', 
       [SortOrder] = 30
 WHERE [ParameterName] = 'AllowAllUsersToBillToOrg' AND [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8' -- Move from SystemSettings page

UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'C8A81136-E7C4-46CE-B364-292E6BA9EA38', 
       [SortOrder] = 40
 WHERE [ParameterName] = 'Contact.Email.RegularExpression' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Regular expression to validate email addresses' 
 WHERE [PropertyDefinitionKey] = '52E3BFE5-B181-43F4-BEE9-FCA7604018BA' -- Contact.Email.RegularExpression

 UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Regular expression to validate email addresses'
 WHERE [SystemConfigKey] = '9D28EEC9-FE9A-402A-9608-B5099D2ABF81' -- Contact.Email.RegularExpression
GO
  
-- Updates which options are included on the ContactSecurity page (Part of PBI 41602)
-------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'A61DD46B-630C-42DD-B15F-62EC086062D7', 
       [SortOrder] = 10
 WHERE [ParameterName] = 'AllUsersAccessQuery' AND [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8' -- Move from SystemSettings page

UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'A61DD46B-630C-42DD-B15F-62EC086062D7', 
       [SortOrder] = 20
 WHERE [ParameterName] = 'AuthenticatedUsersAccessQuery' AND [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8' -- Move from SystemSettings page
 
 UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'A61DD46B-630C-42DD-B15F-62EC086062D7', 
       [SortOrder] = 30
 WHERE [ParameterName] = 'MemberAccessQuery' AND [SystemConfigPageKey] = '818E1A88-AB8B-4A3F-AE51-6ECCF33B1AB8' -- Move from SystemSettings page

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = '<span class="HelperText">Changes to these settings or to the source queries will not take effect for search results until the search index for contacts is rebuilt.</span><br/><br/>All website visitors can view contacts included in this query.' 
 WHERE [PropertyDefinitionKey] = 'D437981F-D3D5-4F7B-B0EC-7B6E502452D8' -- AllUsersAccessQuery

UPDATE [dbo].[SystemConfig]
   SET [Description] = '<span class="HelperText">Changes to these settings or to the source queries will not take effect for search results until the search index for contacts is rebuilt.</span><br/><br/>All website visitors can view contacts included in this query.' 
 WHERE [SystemConfigKey] = 'A3350DB1-E6FD-49A2-A5F7-A3547A291826' -- AllUsersAccessQuery
GO
  
-- Updates which options are included on the CommerceGeneral page (Part of PBI 41602)
-------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD', 
       [SortOrder] = 10
 WHERE [ParameterName] = 'DefaultCurrencyCode' AND [SystemConfigPageKey] = '817C4E23-5ABE-4FF4-9A33-0AA6C37C0310' -- Move from ContentManager.QuickSetup page
 

-- See insert of BatchMode below for placement of this new parameter in the CommerceGeneral page and this setting is being added
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD',
       [SortOrder] = 20
 WHERE [ParameterName] = 'BatchMode' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page


UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD', 
       [SortOrder] = 30
 WHERE [ParameterName] = 'Asi.Billing.AllowAutomaticPayments' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page
 
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD', 
       [SortOrder] = 40
 WHERE [ParameterName] = 'Asi.Fundraising.AllowRecurringDonations' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page


-- See insert of DataVault.DataVaultServiceAddress later on for placement of this new parameter in the CommerceGeneral page and this setting is being added
UPDATE [dbo]. [SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '9555733A-B2B2-4416-854B-BBAC4E8568CD',
       [SortOrder] = 50
 WHERE [ParameterName] = 'DataVault.DataVaultServiceAddress' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page
 

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Automatic payments for billing renewals' 
 WHERE [PropertyDefinitionKey] = 'DC09FBEE-B404-4757-B936-A2C58C6A821D' -- Asi.Billing.AllowAutomaticPayments

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Automatic payments for billing renewals' 
 WHERE [SystemConfigKey] = '54F41444-0BC9-4F7B-8A49-8AFFEDA2B0B1' -- Asi.Billing.AllowAutomaticPayments
   
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'AutoPay service address' 
 WHERE [PropertyDefinitionKey] = '5C9F53EA-DDAB-4F16-8BFD-4C94ED00724E' -- DataVault.DataVaultServiceAddress

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'AutoPay service address' 
 WHERE [SystemConfigKey] = 'AEB053D1-32B2-4131-9719-EC56BF4A4EEA' -- DataVault.DataVaultServiceAddress
GO

-- Updates which options are included on the ContentManager.QuickSetup AND ContentDesigner pages (Part of PBI 41602)
-------------------------------------------------------------      
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SortOrder] = 90
 WHERE [ParameterName] = 'CM.EmailAFriendConfirmationMessage'

UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SortOrder] = 100
 WHERE [ParameterName] = 'CM.EmailAFriendSubject'

UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SortOrder] = 110
 WHERE [ParameterName] = 'CM.EmailAFriendTemplate'

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = '<div class="SectionTitle">Email a Friend</div><br />The confirmation message displayed after sending Email a Friend emails.' 
 WHERE [PropertyDefinitionKey] = '8C039A87-B0C8-4B6A-8673-278A8200CE3D' -- CM.EmailAFriendConfirmationMessage

UPDATE [dbo].[SystemConfig]
   SET [Description] = '<div class="SectionTitle">Email a Friend</div><br />The confirmation message displayed after sending Email a Friend emails.' 
 WHERE [SystemConfigKey] = '82267B49-DF8F-42C3-BE50-1F67B6A928D3' -- CM.EmailAFriendConfirmationMessage
GO

-- Updates which options are included on the TranslationSettings page (Part of PBI 41602)
-------------------------------------------------------------
--
-- See inserts of TranslationMode, LanguageTranslationID, LanguageTranslationPassword later on for placement 
-- of these new parameters in the TranslationSettings page if these settings are being added
UPDATE [dbo]. [SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'AD966E20-944C-43B0-85A4-D598CACE84DA',
       [SortOrder] = 10
 WHERE [ParameterName] = 'TranslationMode' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page

UPDATE [dbo]. [SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'AD966E20-944C-43B0-85A4-D598CACE84DA',
       [SortOrder] = 20
 WHERE [ParameterName] = 'LanguageTranslationID' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page
 
UPDATE [dbo]. [SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = 'AD966E20-944C-43B0-85A4-D598CACE84DA',
       [SortOrder] = 30
 WHERE [ParameterName] = 'LanguageTranslationPassword' AND [SystemConfigPageKey] = '4DE64304-E410-4F83-98BF-AD6750C6124F' -- Move from General page
GO



-------------------------------------------------------------
-- PBI 47420 - Add missing system settings to Staff
-------------------------------------------------------------

-- Add AccountManagementRiSE
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('80648043-4772-4D84-86B1-223E28795870', 'AccountManagementRiSE', 'Account Management Settings')
END
GO

-- Add CommunitySettings
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'CommunitySettings', 'Community Settings')
END
GO

-- Add OrderConfirmations
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageRef] ([SystemConfigPageKey],[SystemConfigPageName],[SystemConfigPageDesc])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderConfirmations', 'Order Confirmation Settings')
END
GO


-- Add options to AccountManagementRiSE page (Part of PBI 47420)
-------------------------------------------------------------
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870', --AccountManagementRiSE
       [SortOrder] = 10
 WHERE [ParameterName] = 'PasswordRequirementsText'
 
UPDATE [dbo].[SystemConfigPageParameterRef]
   SET [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870', --AccountManagementRiSE
       [SortOrder] = 20
 WHERE [ParameterName] = 'SignInFailedMessageSystemText'
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870' AND [ParameterName] = 'LogonChangesEmailFrom')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('80648043-4772-4D84-86B1-223E28795870', 'LogonChangesEmailFrom', 30)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870' AND [ParameterName] = 'LogonInformationRequestMessage')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('80648043-4772-4D84-86B1-223E28795870', 'LogonInformationRequestMessage', 40)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870' AND [ParameterName] = 'PasswordResetRequestMessage')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('80648043-4772-4D84-86B1-223E28795870', 'PasswordResetRequestMessage', 50)
END
GO


-- Add options to CommunitySettings page (Part of PBI 47420)
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'CommunityNotificationSubjectTemplate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'CommunityNotificationSubjectTemplate', 10)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'CommunityNotificationBodyTemplate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'CommunityNotificationBodyTemplate', 20)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'CommunityNotificationFooterTemplate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'CommunityNotificationFooterTemplate', 30)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'ReportInappropriateOffensiveCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'ReportInappropriateOffensiveCCField', 40)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'ReportInappropriateOffensiveBCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'ReportInappropriateOffensiveBCCField', 50)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'ReportInappropriateOffensiveSubjectTemplate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'ReportInappropriateOffensiveSubjectTemplate', 60)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = 'AF78C8B9-43AD-4C46-A8F5-65FAAC902A41' AND [ParameterName] = 'ReportInappropriateOffensiveBodyTemplate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('AF78C8B9-43AD-4C46-A8F5-65FAAC902A41', 'ReportInappropriateOffensiveBodyTemplate', 70)
END
GO

-- ReportInappropriateOffensiveCCField
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to CC on Community Report Inappropriate or Offensive emails'
 WHERE [PropertyDefinitionKey] = '6AAF56B6-85F6-4B14-AC0D-6C3B93864D1D' -- ReportInappropriateOffensiveCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to CC on Community Report Inappropriate or Offensive emails'
 WHERE [SystemConfigKey] = '84497826-1377-4AB5-A23C-FEA5DDEC9701' -- ReportInappropriateOffensiveCCField
 
-- ReportInappropriateOffensiveCCField
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to BCC on Community Report Inappropriate or Offensive emails'
 WHERE [PropertyDefinitionKey] = 'DD07C9D9-8C4A-44BE-9833-306852DF7B22' -- ReportInappropriateOffensiveBCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to BCC on Community Report Inappropriate or Offensive emails'
 WHERE [SystemConfigKey] = 'E5EEE4C6-37A3-40C3-8E21-FA95596B38D4' -- ReportInappropriateOffensiveBCCField
GO


-- Add options to OrderConfirmations page (Part of PBI 47420)
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'OrderWebmaster')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderWebmaster', 10)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'ProductSaleEmailTo')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'ProductSaleEmailTo', 20)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'OrderConfirmationCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderConfirmationCCField', 30)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'OrderConfirmationBCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderConfirmationBCCField', 40)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'OrderConfirmationResendCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderConfirmationResendCCField', 50)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '3DB4D618-06FC-4D19-9056-D10AA0D10194' AND [ParameterName] = 'OrderConfirmationResendBCCField')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey],[ParameterName],[SortOrder])
    VALUES ('3DB4D618-06FC-4D19-9056-D10AA0D10194', 'OrderConfirmationResendBCCField', 60)
END
GO

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address that order confirmations are sent from'
 WHERE [PropertyDefinitionKey] = 'AE28389D-99D1-4ACA-8913-7A3C8F3DF646' -- OrderWebmaster

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address that order confirmations are sent from'
 WHERE [SystemConfigKey] = '70080BE7-ED13-46D7-82E9-BF7E730E7604' -- OrderWebmaster
 
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to CC on order confirmations'
 WHERE [PropertyDefinitionKey] = '51179400-789A-4E74-A084-0640EF9AF203' -- OrderConfirmationCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to CC on order confirmations'
 WHERE [SystemConfigKey] = 'C2D088E7-DBF6-42EA-8DA6-BE18EEB63E90' -- OrderConfirmationCCField
 
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to BCC on order confirmations'
 WHERE [PropertyDefinitionKey] = '9AEB4F6F-EF56-40E8-B529-78DE96C51E1F' -- OrderConfirmationBCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to BCC on order confirmations'
 WHERE [SystemConfigKey] = '3D86B246-A600-4D5D-A06D-2C50C460DF4F' -- OrderConfirmationBCCField
 
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to CC on order confirmation resends'
 WHERE [PropertyDefinitionKey] = '42EF1496-243B-4B37-BE8F-7AC33AE31390' -- OrderConfirmationResendCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to CC on order confirmation resends'
 WHERE [SystemConfigKey] = 'EBBF0F2E-418D-4604-82E8-92C78446DE58' -- OrderConfirmationResendCCField
 
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Email address to BCC on order confirmation resends'
 WHERE [PropertyDefinitionKey] = '9620C5D5-1262-48DB-9F9B-59BE5AE585F8' -- OrderConfirmationResendBCCField

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email address to BCC on order confirmation resends'
 WHERE [SystemConfigKey] = 'C626622F-52DE-4AC9-86AE-4EAB61A4F50F' -- OrderConfirmationResendBCCField
GO

--------------------------------------------------------------------------------
-- PBI 47847 - Update wording on email settings to match modern languaging
--------------------------------------------------------------------------------
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'The email address from which password reset and username requests should be sent.'
 WHERE [PropertyDefinitionKey] = '07ED7493-E16F-4AD4-A9A6-ED31D8EC40B4' -- LogonChangesEmailFrom

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'The email address from which password reset and username requests should be sent.'
 WHERE [SystemConfigKey] = 'F435A598-2266-4DE6-9C34-9B7E56B28C8E' -- LogonChangesEmailFrom

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'The body of the email sent to a user when they fill out the "Forgot my username" form. The special values [UserId], [ContactId], [Email], and [LogonUrl] can be used in the message to insert the appropriate values. HTML is permitted.',
       [DefaultParameterValue] = '<p>We received a request for the username associated with this email address. Based on the information provided, your username is:</p><p>[UserId]</p><p>Please click the link below to return to our website and sign in:</p><p>[LogonUrl]</p><p>If clicking the link does not work, you can copy and paste it into your browser''s address window.'
 WHERE [PropertyDefinitionKey] = 'D4425B19-442A-442A-9FA4-FABC3A1C360D' -- LogonInformationRequestMessage

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'The body of the email sent to a user when they fill out the "Forgot my username" form. The special values [UserId], [ContactId], [Email], and [LogonUrl] can be used in the message to insert the appropriate values. HTML is permitted.'
 WHERE [SystemConfigKey] = 'D5A68433-7675-49BC-B6D4-E4B36EB9100D' -- LogonInformationRequestMessage
 
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'The body of the email sent to a user when they fill out the "Forgot my password" form. The special values [UserId], [ContactId], [Email], and [LogonUrl] can be used in the message to insert the appropriate values. HTML is permitted.',
       [DefaultParameterValue] = '<p>Password reset request for username <b>[UserId]</b></p><p>We received a request to reset the password for the username referenced above. If you made this request, please click the link shown below to reset your password.</p><p>If you did not request to have your password reset, you can safely ignore this email.</p>Please click the link below to reset your password:</p><p>[LogonUrl]</p><p>If clicking on the link does not work, you can copy and paste the link into your browser''s address window.</p>'
 WHERE [PropertyDefinitionKey] = 'AB5761ED-BFF0-4B34-8A1F-68DF37528A8D' -- PasswordResetRequestMessage

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'The body of the email sent to a user when they fill out the "Forgot my password" form. The special values [UserId], [ContactId], [Email], and [LogonUrl] can be used in the message to insert the appropriate values. HTML is permitted.'
 WHERE [SystemConfigKey] = '247A10FA-4BD1-4F54-A155-0051DA22EBE9' -- PasswordResetRequestMessage
GO

--------------------------------------------------------------------------------
-- PBI 44447 - Allow staff user to specify the location of the DataVault Service
--------------------------------------------------------------------------------
DECLARE @systemConfigKey AS uniqueidentifier;
DECLARE @propertyDefinitionKey AS uniqueidentifier;
SET @systemConfigKey = 'AEB053D1-32B2-4131-9719-EC56BF4A4EEA';
SET @propertyDefinitionKey = '5C9F53EA-DDAB-4F16-8BFD-4C94ED00724E';

IF NOT EXISTS ( SELECT  1
                FROM    [dbo].[SystemConfig]
                WHERE   [ParameterName] = 'DataVault.DataVaultServiceAddress' )
    BEGIN
        EXEC [dbo].[asi_InsertSystemConfig] 'eSeriesNET', 'CommerceGeneral', 'MANAGER',
            @systemConfigKey, 'DataVault.DataVaultServiceAddress',
            @propertyDefinitionKey, 7, 6, 100, 'AutoPay service address',
            'https://payments.advsol.com/DataVaultLive/Asi.Services.DataVaultService.DataVault.svc',
            50
    END
GO

--------------------------------------------------------------------------------
-- PBI 44736 - Add LanguageTranslationPassword and LanguageTranslationID config options, remove unused options
--------------------------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'TranslationMode')  -- PBI 51028 Only attempt to add it if it doesn't exist
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig] 
       @systemKeyword = 'Organization'
      ,@systemConfigPageName = 'TranslationSettings'
      ,@userId = 'MANAGER'
      ,@systemConfigKey = 'BA4F8FD4-3797-4F01-9301-4A94B09AF216'
      ,@parameterName = 'TranslationMode'
      ,@propertyDefinitionKey = 'CF0CD956-AE2B-442B-A132-D81C507F7044'
      ,@dataTypeCode = 7
      ,@hiControlTypeCode = 1 
      ,@hiControlWidth = 0
      ,@description = 'Translation Mode'
      ,@defaultParameterValue = 'None'
      ,@sortOrder = 2;
END
GO

DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] =
    @crlf + N'Learn only,LearnOnly' + 
    @crlf + N'Translate only,TranslateOnly' +
    @crlf + N'Learn and translate known phrases,LearnAndTranslateKnown' +
    @crlf + N'Learn and translate using Microsoft&reg; Translator,LearnAndTranslateMachine',
       [IsRequired] = 0
 WHERE [PropertyDefinitionKey] = 'CF0CD956-AE2B-442B-A132-D81C507F7044'
GO
 
DELETE FROM [dbo].[SystemConfig]
 WHERE [ParameterName] = 'LanguageTranslationEnabled'
GO

DELETE FROM [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] = 'LanguageTranslationEnabled'
GO

DELETE FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = 'LanguageTranslationEnabled'
GO

DELETE FROM [dbo].[PropertyDefinition] 
 WHERE [Label] = 'LanguageTranslationEnabled'
GO

DELETE FROM [dbo].[SystemConfig]
 WHERE [ParameterName] = 'TranslateWCMReadOnly'
GO

DELETE FROM [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] = 'TranslateWCMReadOnly'
GO

DELETE FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = 'TranslateWCMReadOnly'
GO

DELETE FROM [dbo].[PropertyDefinition] 
 WHERE [Label] = 'TranslateWCMReadOnly'
GO

DELETE FROM [dbo].[SystemConfig]
 WHERE [ParameterName] = 'TranslateAPIReadOnly'
GO

DELETE FROM [dbo].[SystemConfigPageParameterRef]
 WHERE [ParameterName] = 'TranslateAPIReadOnly'
GO

DELETE FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = 'TranslateAPIReadOnly'
GO

DELETE FROM [dbo].[PropertyDefinition] 
 WHERE [Label] = 'TranslateWCMReadOnly'
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'LanguageTranslationPassword')  -- PBI 51028 Only attempt to add it if it doesn't exist
BEGIN
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization', 'TranslationSettings', 'MANAGER',
     'B078871F-CC80-4561-B4B0-DBFBA7D69864',
     'LanguageTranslationPassword',
     '2D863B69-2C41-4026-BFC1-85323E2A463F',
     8, 6, 80,
     'Microsoft&reg; Translator Password',
     '',
     5
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'LanguageTranslationID')  -- PBI 51028 Only attempt to add it if it doesn't exist
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Organization', 'TranslationSettings', 'MANAGER',
         'E604BEF6-002B-4578-B769-7FAC96790213',
         'LanguageTranslationID',
         '9F34BAA9-A429-4B6C-A566-0B6E3BF32A38',
         8, 6, 80,
         'Microsoft&reg; Translator ID',
         '',
         5
END
GO

UPDATE dbo.[SystemConfig] 
   SET [Description] = 'Microsoft&reg; Translator ID'
 WHERE [ParameterName] = 'LanguageTranslationID'
GO
UPDATE dbo.[SystemConfig] 
   SET [Description] = 'Microsoft&reg; Translator Password'
 WHERE [ParameterName] = 'LanguageTranslationPassword'
GO
UPDATE dbo.[SystemConfigParameterRef] 
   SET [Description] = 'Microsoft&reg; Translator ID'
 WHERE [ParameterName] = 'LanguageTranslationID'
GO
UPDATE dbo.[SystemConfigParameterRef] 
   SET [Description] = 'Microsoft&reg; Translator Password'
 WHERE [ParameterName] = 'LanguageTranslationPassword'
GO

---------------------------------------------------
-- PBI 44022 - Remove duplicate SystemConfig record 
---------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = '5FEC49EC-687B-4C0B-8CAF-9E99B85820B6')
BEGIN
   IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = '54F41444-0BC9-4F7B-8A49-8AFFEDA2B0B1')
      BEGIN
         DELETE FROM [dbo].[SystemConfig]
         WHERE [SystemConfigKey] = '5FEC49EC-687B-4C0B-8CAF-9E99B85820B6'
      END
   END 
GO

---------------------------------------------
-- PBI 45777/44335 - Add 'Asi.CommunicationPreferences.Prompt'
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.CommunicationPreferences.Prompt')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('05F87BAB-22A6-4F51-9B3F-1FADA1C022E5', 'Asi.CommunicationPreferences.Prompt', 'I would like to receive:',
            'This is the default value for the communication preferences prompt', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

---------------------------------------------
-- PBI 45777/44335 - Add 'Asi.CommunicationPreferences.AdditionalInfo'
---------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.CommunicationPreferences.AdditionalInfo')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('B97B0BB7-8864-4408-A136-85746EBBA3AB', 'Asi.CommunicationPreferences.AdditionalInfo', 'You may unsubscribe from these communications at any time.',
            'This is additional information to show with the communication preferences prompt', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

-------------------------------------------------------------
-- Create new EventGuestMemberCustomerType config variable
-------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'EventGuestMemberCustomerType')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('27408C5A-5FD9-4F67-A4FC-F6C3D97606AF', 'EventGuestMemberCustomerType', null,
            'The default Customer Type for event guests added by members', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

-------------------------------------------------------------
-- Create new EventGuestMemberCustomerType config variable
-------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'EventGuestNonMemberCustomerType')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('EAF26C43-DAC7-4169-8A36-816F8E8C0FD8', 'EventGuestNonMemberCustomerType', null,
            'The default Customer Type for event guests added by non-members', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

-------------------------------------------------------------
-- PBI 45872/SBI 47004 Create new system config setting for web batch mode
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'BatchMode')  -- PBI 51028 Only attempt to add it if it doesn't exist
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig] 
       @systemKeyword = 'Organization'
      ,@systemConfigPageName = 'CommerceGeneral'
      ,@userId = 'MANAGER'
      ,@systemConfigKey = '3F3A2F94-91F7-45B7-8CEA-8266938CE38A'
      ,@parameterName = 'BatchMode'
      ,@propertyDefinitionKey = '5AEC5AE8-EACE-4C32-9B17-90CE51D42761'
      ,@dataTypeCode = 7
      ,@hiControlTypeCode = 1 
      ,@hiControlWidth = 0
      ,@description = 'Batch mode for staff web transactions'
      ,@defaultParameterValue = ''
      ,@sortOrder=20;
END      
GO

DECLARE @crlf nvarchar(2)
SET @crlf = NCHAR(10) + NCHAR(13)
UPDATE [dbo].[PropertyDefinition]
   SET [ValueList] =
    @crlf + N'Staff transactions in same batch as public transactions,AutoBatch' + 
    @crlf + N'Separate batches for staff and public transactions,StaffSeparate' +
    @crlf + N'Individual batch for each staff user per day,StaffIndividual',
    [IsRequired] = 1
WHERE [PropertyDefinitionKey] = '5AEC5AE8-EACE-4C32-9B17-90CE51D42761'
GO

-------------------------------------------------------
-- PBI 48131 - Remove <b> tags from System Config pages
-------------------------------------------------------

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Find contact configuration (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '99ED8EC6-994D-4B11-880A-321EF7090E2C' -- FindMe

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Committee configuration (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = 'CCB02362-140C-433E-9369-43D41B0639D7' -- Committee

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Reset password configuration (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '79A1E87E-37D1-4BBB-9498-4A21D875DFD6' -- ResetPassword

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Labels for the Address page under under Contact management (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = 'C8F39342-E168-4FE3-9B0C-532A9727C6DE' -- LabelAddress

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Email Templates'
 WHERE [SystemConfigPageKey] = 'FE3BE828-02E4-4A52-BE69-57AB8401935A' -- EmailTemplates

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Create account search results (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '7AF59166-367C-461D-A528-6E34D58FC131' -- CreateAccountSearch

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Create account settings (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '560031BE-5EA0-4F45-8242-763C4FD53DBB' -- CreateAccountSettings

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Create account configuration (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = 'A076228E-698D-4DA2-94C7-84C7C2F7AB33' -- CreateAccount

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Create account page titles (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '25E99D5B-008F-4C54-BF73-955ACE88E6F4' -- CreateAccountTitles

UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Labels for the Personal page under Contact management (Variable names in parentheses)'
 WHERE [SystemConfigPageKey] = '7AC443C3-5A51-4334-AE7D-F70D7F334551' -- LabelPersonal
GO

-------------------------------------------------------
-- PBI 48141 - BUG: Inconsistent label for Default sign in failed error message in upgrade/new install
-------------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Default message if sign in fails.'
 WHERE [SystemConfigKey] = '3BFB0986-A0DF-4526-9E62-0F2DE2832839' -- SignInFailedMessageSystemText

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Default message if sign in fails.'
 WHERE [PropertyDefinitionKey] = '80C83ECD-9360-4416-B0E8-EDD0B18A4D86' -- SignInFailedMessageSystemText
GO

--------------------------------------------------------------------------------------------------------
 --SBT 48998: Inserting a new value in SystemConfigXml, AdvancedEmailUrl
--------------------------------------------------------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'AdvancedEmailURL')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('4D33363E-F12E-441C-9E48-1C145A5DFC23', 'AdvancedEmailURL', 'https://corevalidation.advsol.com/CoreValidation/',
            'URL for advanced email server', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

-------------------------------------------------------
-- PBI 48852 - Create customizable Order Confirmation template
-------------------------------------------------------
-- Add a new system config to determine which template to use
DECLARE @systemConfigKey AS UNIQUEIDENTIFIER;
DECLARE @propertyDefinitionKey AS UNIQUEIDENTIFIER;
SET @systemConfigKey = '16E6393D-10BD-4FA3-BA40-7A06A650689D';
SET @propertyDefinitionKey = '05473922-33AA-40C1-AC5B-88194CCCD93F';
  
IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = @systemConfigKey)
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig]
         'Content',
         'CommerceGeneral',
         'MANAGER',
         @systemConfigKey,
         'OrderConfirmationTemplate',
         @propertyDefinitionKey,
         7,
         21,
         200,
         'Communication Template to use for Order Confirmations',
         '$/Common/Communications/Templates/Samples/Order Confirmation',
         5
    UPDATE PropertyDefinition
       SET IsRequired = 1
     WHERE PropertyDefinitionKey = '05473922-33AA-40C1-AC5B-88194CCCD93F'
END
GO

-------------------------------------------------------------------------
-- PBI 49963 - Users unable to login becuase of default 5 year expiration
-------------------------------------------------------------------------
UPDATE dbo.[SystemConfigParameterRef] 
   SET [Description] = 'Default expiration date, in years from last login' 
 WHERE [ParameterName] = 'CreateAccountDefaultExpirationDate'
 GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfigPageParameterRef] WHERE [SystemConfigPageKey] = '80648043-4772-4D84-86B1-223E28795870' AND [ParameterName] = 'CreateAccountDefaultExpirationDate')
BEGIN
    INSERT INTO [dbo].[SystemConfigPageParameterRef] ([SystemConfigPageKey], [ParameterName], [SortOrder])
    VALUES ('80648043-4772-4D84-86B1-223E28795870', 'CreateAccountDefaultExpirationDate', 60)
END
GO

--------------------------------------------------------------------------------------------------------
--- PBI 50660: Update Desktop/AAC help links
--------------------------------------------------------------------------------------------------------
UPDATE SystemConfig
   SET ParameterValue = 'http://docs.imis.com/20.2'
 WHERE ParameterName = 'HelpURL'
 GO

 -------------------------------------------------------------------------
-- PBI 50519 - BatchMode is required but has no initial default value
-------------------------------------------------------------------------
UPDATE dbo.[SystemConfig] 
   SET [ParameterValue] = 'AutoBatch' 
 WHERE [ParameterName] = 'BatchMode'     
   AND [SystemConfigKey] = '3F3A2F94-91F7-45B7-8CEA-8266938CE38A' 
   AND ([ParameterValue] IS NULL OR [ParameterValue] = '')
     
UPDATE dbo.[SystemConfigParameterRef] 
   SET [DefaultParameterValue] = 'AutoBatch' 
 WHERE [ParameterName] = 'BatchMode' 
   AND ([DefaultParameterValue] IS NULL OR [DefaultParameterValue] = '')
GO

------------------------------------------------------
-- PBI 49976 - Create new variable for non-dues subscription purchase and renewal in System Settings Config
------------------------------------------------------
DECLARE @systemConfigKey AS UNIQUEIDENTIFIER;
DECLARE @propertyDefinitionKey AS UNIQUEIDENTIFIER;
SET @systemConfigKey = '5B6EDE2A-2B84-4313-9F8F-012DB62F7DB9';
SET @propertyDefinitionKey = '354CD08B-C7FD-4FE1-998C-2305ED870275';
  
IF NOT EXISTS (SELECT 1 FROM [dbo].SystemConfig WHERE [SystemConfigKey] = @systemConfigKey)
BEGIN
EXEC [dbo].[asi_InsertSystemConfig]
     'Organization',
     'CommerceGeneral',
     'MANAGER',
     @systemConfigKey,
     'Asi.Billing.EnableNonDuesSubscription',
     @propertyDefinitionKey,
     2,
     0,
     0,
     'Enable non-dues subscription purchase and renewal',
     0,
     60
END
GO

------------------------------------------------------
-- PBI 51770 v10/v100 DataVault PCI - Setting up new DV password
------------------------------------------------------
DECLARE @systemUserKey uniqueidentifier
DECLARE @organizationKey uniqueidentifier
DECLARE @systemEntityKey uniqueidentifier
DECLARE @now datetime

SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
SELECT @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = '5DECFB2E-2BD4-45FD-B0C3-2B895E231DE1')
BEGIN
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('5DECFB2E-2BD4-45FD-B0C3-2B895E231DE1', 'DataVault.Password', '',
            'Used to verify identity of iMIS instance', @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
END
GO

------------------------------------------------------
-- PBI 51770 v10/v100 DataVault PCI - Setting up new DV password (on upgrade will populate value if needed)
------------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'DataVault.CustomerId' AND COALESCE([ParameterValue], '') <> '') AND 
   EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'DataVault.Password' AND COALESCE([ParameterValue], '') = '') AND
   EXISTS (SELECT 1 FROM [dbo].[System_Params] WHERE [ParameterName] = 'System_Control.SerialNo' AND COALESCE([ShortValue], '') <> '')
BEGIN
       UPDATE [dbo].[SystemConfig]
          SET [ParameterValue] = (SELECT [ShortValue] FROM [dbo].[System_Params] WHERE [ParameterName] = 'System_Control.SerialNo')
        WHERE [ParameterName] = 'DataVault.Password'
END

-- End of Script
SET NOCOUNT OFF
GO