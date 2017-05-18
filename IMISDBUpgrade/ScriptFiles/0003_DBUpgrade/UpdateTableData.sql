------------------------------------
-- Update data in existing tables --
------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script

-----------------------------------------------------------------------------------------
-- Correct Named Shared ACL permissions
-----------------------------------------------------------------------------------------
-- Fix CA+Everyone Read/Write/Add/Delete 
DECLARE @everyoneRole uniqueidentifier
SELECT @everyoneRole = [RoleKey] FROM [dbo].[RoleMain] WHERE [Name] = 'Everyone'
UPDATE [dbo].[AccessItem] 
   SET [Permission] = 30 
 WHERE [AccessKey] = '00000000-0000-0000-CA00-000000000E1E' AND [Grantee] = @everyoneRole
   AND [Permission] <> 30
   
-- Fix Full Staff Full Control
UPDATE [dbo].[AccessItem]
   SET [GroupKey] = '6E52226C-89E7-4682-A7E9-B691C42E4664'
 WHERE [AccessKey] = '00000000-0000-0000-0000-000000000CF1' AND [Grantee] = '6E52226C-89E7-4682-A7E9-B691C42E4664'
   AND [GroupKey] <> '6E52226C-89E7-4682-A7E9-B691C42E4664'

-- Fix CA+Full Staff Full Control
UPDATE [dbo].[AccessItem]
   SET [GroupKey] = '6E52226C-89E7-4682-A7E9-B691C42E4664'
 WHERE [AccessKey] = '00000000-0000-0000-CA00-000000000CF1' AND [Grantee] = '6E52226C-89E7-4682-A7E9-B691C42E4664'
   AND [GroupKey] <> '6E52226C-89E7-4682-A7E9-B691C42E4664'

-- CA+Segmentation Job Default Access
DECLARE @contentAdminRole uniqueidentifier
SELECT @contentAdminRole = [RoleKey] FROM [dbo].[RoleMain] WHERE [Name] = 'Content Administrator'
IF NOT EXISTS (SELECT 1 FROM [dbo].[AccessItem] WHERE [AccessKey] = '00000000-0000-0000-CA00-D04E00000002' AND [Grantee] = @contentAdminRole)
BEGIN
    INSERT INTO [dbo].[AccessItem] (AccessKey, Grantee, Permission, GroupKey, RoleKey, UserKey)
    VALUES ('00000000-0000-0000-CA00-D04E00000002', @contentAdminRole, 1, NULL, @contentAdminRole, NULL)
END

 -- CA+Everyone Read/Write/Add/Delete   
 UPDATE [dbo].AccessItem
    SET Permission = 30 
  WHERE AccessKey = '00000000-0000-0000-CA00-000000000E1E'
    AND Grantee = '93D4477A-465E-4179-ADA9-6B854DA9BDB6'
GO

-----------------------------------------------------------------------------------------
--> SBT 40838 Adding new BO to ObjectMetaData to allow editing of AutoPay Instructions
-----------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM ObjectMetaData WHERE ObjectName = 'AutoPayInstructionDetail')
BEGIN
      INSERT INTO ObjectMetaData(ObjectName, RelatedToEntity, IsUserDefined, IsMultiInstance)
      VALUES ('AutoPayInstructionDetail','Party',0,1)
END
GO

-----------------------------------------------------------------------------------------
-- PBI 31845 Remove ASIINTERNAL license key from Staff, Donor and Admin Console websites
-----------------------------------------------------------------------------------------
-- Staff Website and Webroot
DELETE FROM [dbo].[UniformLicense]
WHERE LicenseKey='0BD59CCC-9AB5-442A-81E3-12FD8B38FA15'
AND UniformKey in ('4243D9E2-E91E-468C-97C2-2046D70C1E1A','91A25E8D-4FD2-4329-A472-D30DC9C7842A')

-- iMISDonor Website, Webroot and Content Folder
DELETE FROM [dbo].[UniformLicense] 
WHERE LicenseKey='0BD59CCC-9AB5-442A-81E3-12FD8B38FA15'
AND UniformKey in ('60B993C6-6608-4D34-89E6-E8CFE0234E3E','679F087B-5DD5-4E3D-9932-9268600CD8F1','E05BA4BE-14C8-4AD0-B864-4A8E81EB0DFB')

-- CS2 Website and Webroot
DELETE FROM [dbo].[UniformLicense] 
WHERE LicenseKey='0BD59CCC-9AB5-442A-81E3-12FD8B38FA15' 
AND UniformKey in ('FAD2FD17-7E27-4C96-BABE-3291ECDE4822','EBABDBBB-A7DA-45D7-88AE-6AE2A087917E')
GO

-----------------------------------------------------------------------------------------
-- PBI 35065 Change name of some communities content types
-----------------------------------------------------------------------------------------
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'Discussion Forum Home', [Description] = 'The "home view" for a discussion forum. By default, this 2-column view includes recent activity.' WHERE [Name] = 'Forum Home'
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'Discussion Forum Configuration', [Description] = 'The edit screen for a discussion forum.' WHERE [Name] = 'Forum Configuration'
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'Discussion Forum List', [Description] = 'The list of discussion forums for a given community.' WHERE [Name] = 'Forum List'
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'Discussion Forum List Item', [Description] = 'A single discussion forum in a discussion forum listing.' WHERE [Name] = 'Forum List Item'
GO

-----------------------------------------------------------------------------------------
--  SBT34914 This script is for fixing an issue that would cause incorrect calculations 
--  of the FirstGiftDate and LastGiftDate if the GiftReport.DateReceived is NULL
-----------------------------------------------------------------------------------------
SET ANSI_WARNINGS OFF

-- Get the IDs to be updated
DECLARE @idsToProcess TABLE (ID varchar(10) NOT NULL)
INSERT INTO @idsToProcess
    SELECT DISTINCT([ID]) 
      FROM [dbo].[GiftReport] 
     WHERE [DateReceived] IS NULL AND SourceSystem = 'MEETING' 
     ORDER BY [ID]

-- This will correct any existing records in the GiftReport table that were populated with DateReceived = NULL
UPDATE [dbo].[GiftReport] 
   SET [DateReceived] = [TransactionDate] 
 WHERE [DateReceived] IS NULL
   AND [SourceSystem] = 'MEETING'

-- Now recalculate the gift history summary for each ID updated
DECLARE @LastCustomerID varchar(10)
SELECT @LastCustomerID = ''

-- define the customer ID to be handled now
DECLARE @CustomerIDToHandle varchar(10)

-- select the next customer to handle    
SELECT TOP 1 @CustomerIDToHandle = [ID] FROM @idsToProcess WHERE [ID] > @LastCustomerID ORDER BY [ID]

-- as long as we have customers......    
WHILE @CustomerIDToHandle IS NOT NULL
BEGIN
    PRINT @CustomerIDToHandle
    EXEC asi_RecalculateGiftHistorySummary @DonorId = @CustomerIDToHandle

    -- set the last customer handled to the one we just handled
    SET @LastCustomerID = @CustomerIDToHandle
    SET @CustomerIDToHandle = NULL

    -- select the next customer to handle    
    SELECT TOP 1 @CustomerIDToHandle = [ID] FROM @idsToProcess WHERE [ID] > @LastCustomerID ORDER BY [ID]
END

SET ANSI_WARNINGS ON
GO

-------------------------------------------
-- PBI 36014 - Update broken iCore content
-------------------------------------------

-- The old '@/iCore/Fundraising/Donate_Now' content record has been replaced
-- Update all navigation using it to point to the new Content Record
UPDATE [dbo].[DocumentMain] SET [RelatedDocumentVersionKey] = '991D8973-6ADE-4AC5-AEF3-C34945A8641A' 
WHERE [RelatedDocumentVersionKey] = 'B47025FC-E427-459D-9D0F-814AE0ECDB8F'
AND [DocumentTypeCode] = 'NAV' AND [DocumentStatusCode] = 40

-- The old '@/iCore/Store/StoreLayouts/Cart_Home' content record has been replaced
-- Update all navigation using it to point to the new Content Record
UPDATE [dbo].[DocumentMain] SET [RelatedDocumentVersionKey] = '13A311EE-4BE3-4A28-93ED-73EBE8CA5086' 
WHERE [RelatedDocumentVersionKey] = 'E5E1B4BB-8EF1-4D61-A5E2-6D8EE3F23362'
AND [DocumentTypeCode] = 'NAV' AND [DocumentStatusCode] = 40
GO

---------------------------------------------
--- PBI 33891 - Create Public default payment method set
---------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PaymentMethodSet] WHERE [PaymentMethodSetId]='0DEF34DE-865B-4488-B1A3-EC92341F7FE7')
INSERT INTO [dbo].[PaymentMethodSet] ([PaymentMethodSetId], [PaymentMethodSetName], [PaymentMethodSetDesc], [ContextId], [IsDefault], [IsSystem])
     VALUES ('0DEF34DE-865B-4488-B1A3-EC92341F7FE7', 'Public', 'Standard payment methods for non-staff users', '00000000-0000-0000-0000-000000000000', 1, 1)
GO

--------------------------------------------
--- PBI 33891 - Create Staff default payment method set
--------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PaymentMethodSet] WHERE [PaymentMethodSetId]='AFE43BBD-097A-42E9-AFC6-3017D1AD0048')
INSERT INTO [dbo].[PaymentMethodSet] ([PaymentMethodSetId], [PaymentMethodSetName], [PaymentMethodSetDesc], [ContextId], [IsDefault], [IsSystem])
     VALUES ('AFE43BBD-097A-42E9-AFC6-3017D1AD0048', 'Staff', 'Standard payment methods for staff users', '00000000-0000-0000-0000-000000000000', 0, 1)
GO

-----------------------------------------------------------------------
---PBI 33891 - Populate the payment method details for 'Public' payment method set
---PBI 33891 - And the payment method details for 'Staff' payment method set
-----------------------------------------------------------------------
DECLARE @prefix varchar(10)  --get the prefix
DECLARE @allowPO varchar(10) --check if we add 'Bill Me'
DECLARE @publicSetKey uniqueIdentifier
DECLARE @staffSetKey uniqueIdentifier
DECLARE @tmpTable TABLE (idx smallint PRIMARY KEY IDENTITY(1,1), PaymentMethodSetId uniqueIdentifier, PaymentMethodId varchar(10), Name varchar(40))

SET @prefix = (select ParameterValue from SystemConfig where ParameterName='iMISCreditCardPrefix')
SET @allowPO = (select UPPER(ParameterValue) from SystemConfig where ParameterName='AllowPurchaseOrders')
SET @publicSetKey = '0DEF34DE-865B-4488-B1A3-EC92341F7FE7'
SET @staffSetKey = 'AFE43BBD-097A-42E9-AFC6-3017D1AD0048'

-----Loop thru and insert each payment method detail for 'Public' and 'Staff'
INSERT INTO @tmpTable 
    SELECT CASE WHEN PaymentMethodId like @prefix+'%' AND PaymentType <> 'Cash' THEN @publicSetKey --public
                WHEN PaymentMethodId NOT LIKE @prefix+'%' AND PaymentType <> 'Other' THEN @staffSetKey --staff
                ELSE '00000000-0000-0000-0000-000000000000'
           END AS PaymentMethodSetId,
           PaymentMethodId, Name FROM [dbo].[vSoaPaymentMethod]
           
--here we check if we need to add 'Bill Me' payment method             
IF (@allowPO = '1' OR @allowPO ='TRUE') 
   AND NOT EXISTS (SELECT 1 FROM @tmpTable WHERE PaymentMethodSetId = @publicSetKey AND PaymentMethodId = 'BillMe')
BEGIN
    INSERT @tmpTable SELECT @publicSetKey AS PaymentMethodSetId, PaymentMethodId, Name FROM [dbo].[vSoaPaymentMethod] WHERE PaymentMethodId='BillMe'
END

INSERT INTO [dbo].[PaymentMethodSetDetail] ([PaymentMethodSetId], [PaymentMethodId], [DisplayName], [IsDefault], [SortOrder])
    SELECT tt.PaymentMethodSetId, tt.PaymentMethodId, tt.Name, 0, tt.idx
      FROM @tmpTable tt
     WHERE tt.[PaymentMethodId] <> '' AND tt.[PaymentMethodSetId] <> '00000000-0000-0000-0000-000000000000'
       AND NOT EXISTS (SELECT 1 FROM [dbo].[PaymentMethodSetDetail] pmsd 
                        WHERE pmsd.[PaymentMethodSetId] = tt.[PaymentMethodSetId] AND pmsd.[PaymentMethodId] = tt.[PaymentMethodId])
GO

----------------------------------------
-- PBI 37833 - Update RiSE terminology
----------------------------------------
-- Update the AlternateName of the Sample Sites website folder to be Quick Start Sites
UPDATE [dbo].[DocumentMain]
   SET [AlternateName] = N'Quick Start Sites'
 WHERE [DocumentVersionKey] = 'E7642BD0-A424-4DED-B5AC-D1FD131B6741'
   AND [DocumentStatusCode] = 40
GO

------------------------------------------
-- PBI 38494 - Clean up event dashboards
------------------------------------------
-- Update incorrect URLs for Event Dashboard
UPDATE [dbo].[URLMapping] 
   SET URL = '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard' 
 WHERE TargetDocumentVersionKey = 'A8AB6743-9DDA-41F7-9AA2-7A681A203082'
GO

-------------------------------------------------------
-- PBI 38854 - Rename Content Management terminiology 
-------------------------------------------------------
-- Content Management -> RiSE
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'RiSE configuration (Variable names in parentheses)'
WHERE [SystemConfigPageKey] = '817C4E23-5ABE-4FF4-9A33-0AA6C37C0310'

-- Site Designer -> Site Builder
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Site Builder configuration (Variable names in parentheses)'
WHERE [SystemConfigPageKey] = '4EDD55F7-36C1-4B41-89FD-8F5C233E94F5'

-- Content Designer -> Page Builder
UPDATE [dbo].[SystemConfigPageRef]
   SET [SystemConfigPageDesc] = 'Page Builder configuration (Variable names in parentheses)'
WHERE [SystemConfigPageKey] = 'C3643FB0-D7B3-41AA-8A56-8D67A1428D5A'

-- Content Management workflow -> RiSE workflow
UPDATE [dbo].[SystemConfigPageRef]
  SET [SystemConfigPageDesc] = 'RiSE workflow configuration (Variable names in parentheses)'
WHERE [SystemConfigPageKey] = '2EB971CA-3519-463D-9E27-705E48E5164B'

-- Remove a label's reference to Content Designer
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'The path where the Image Manager should store images used in RiSE. The path should begin with ~/ and be a relative path from the website''s root folder.'
 WHERE [PropertyDefinitionKey] = 'FAD29406-2F3B-4378-BEC0-DD0664F79D4D'

-- Remove a label's reference to Site Designer
UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Document System path to the folder containing the website objects managed by Site Builder.'
 WHERE [PropertyDefinitionKey] = '9FB4F5FA-96DF-4D83-B249-D55FF0453886'

-- Rename 'Content Layout Definition' to 'Layout Definition'
UPDATE [dbo].[DocumentTypeRef]
   SET [DocumentTypeDesc] = 'Layout Definition'
 WHERE [DocumentTypeCode] = 'LAY'
GO

-- Change the display verbiage of the BillMe payment option to 'Pay Later'
UPDATE [PaymentMethodSetDetail]
   SET [DisplayName] = 'Pay Later'
 WHERE [PaymentMethodId] = 'BillMe'
 GO

---------------------------------------------------------
-- PBI 38628 - Mark relevant Billing Cycles for Join Now
---------------------------------------------------------
UPDATE [dbo].[DuesCycles]
   SET [IS_FOR_JOIN] = 1
 WHERE [CYCLE_NAME] LIKE 'Join Now%'
GO

--------------------------------------------------------------------------------------------------------------------------------
-- Force Publish Service polling frequency to every 30 seconds to relieve pressure from the service & SQL Server
-- Customers may set this value lower after upgrade if they wish, but each upgrade will reset to 30 if it's less than 30 seconds
--------------------------------------------------------------------------------------------------------------------------------
UPDATE [dbo].[PublishServerRef]
   SET [Frequency] = 30
 WHERE [Frequency] < 30
GO

------------------------------------------------------------------------------
-- PBI 39956 - Only Full users should be allowed to have the On Behalf Of role
------------------------------------------------------------------------------
DECLARE @oboRoleKey uniqueidentifier
SELECT @oboRoleKey = [RoleKey] FROM [dbo].[RoleMain] WHERE [Name] = 'OnBehalfOf'
-- Since only and all staff are in the Users table, 
-- remove anyone from the OBO role who is not in the Users table
DELETE r
  FROM [UserRole] r
       INNER JOIN [UserMain] m ON r.[UserKey] = m.[UserKey]
 WHERE r.[RoleKey] = @oboRoleKey
   AND m.[UserId] NOT IN (SELECT [UserId] from [Users])

-- Now remove anyone from the OBO role who is marked as a Casual user
DELETE r
  FROM [UserRole] r
       INNER JOIN [UserMain] m ON r.[UserKey] = m.[UserKey]
       INNER JOIN [Users] u ON m.[UserId] = u.[UserId]
 WHERE r.[RoleKey] = @oboRoleKey
   AND u.[IsCasualUser] = 1
GO

--------------------------------------------------
-- Correct some existing Canadian Province entries
IF EXISTS (SELECT 1 FROM [dbo].[State_Codes] WHERE STATE_PROVINCE = 'PQ')
BEGIN
    IF EXISTS (SELECT 1 FROM [dbo].[State_Codes] WHERE STATE_PROVINCE = 'QC')
    BEGIN
        DELETE FROM [dbo].[State_Codes]
         WHERE STATE_PROVINCE = 'PQ'
    END
    ELSE
    BEGIN
        UPDATE [dbo].[State_Codes]
           SET STATE_PROVINCE = 'QC'
         WHERE STATE_PROVINCE = 'PQ'
    END
END

UPDATE [dbo].[State_Codes]
   SET [TITLE] = 'Northwest Territories'
 WHERE STATE_PROVINCE = 'NT'

-- Delete an entry that is completely incorrect
DELETE FROM [dbo].[State_Codes]
 WHERE STATE_PROVINCE = 'NF'

-- Add several missing Canadian Provinces
IF NOT EXISTS (SELECT 1 FROM [dbo].[State_Codes] WHERE STATE_PROVINCE = 'NL')
BEGIN
    INSERT INTO [dbo].[State_Codes] (STATE_PROVINCE, TITLE)
    VALUES ('NL', 'Newfoundland and Labrador')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[State_Codes] WHERE STATE_PROVINCE = 'NU')
BEGIN
    INSERT INTO [dbo].[State_Codes] (STATE_PROVINCE, TITLE)
    VALUES ('NU', 'Nunavut')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[State_Codes] WHERE STATE_PROVINCE = 'YT')
BEGIN
    INSERT INTO [dbo].[State_Codes] (STATE_PROVINCE, TITLE)
    VALUES ('YT', 'Yukon')
END
GO

--- PBI40159 -- do a one-time reset of event add-guest to "no"
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'EventsAllowGuestsSettingWasUpdated')
BEGIN
    DECLARE @parameterKey AS uniqueidentifier;
    DECLARE @userKey AS uniqueidentifier;
    DECLARE @currDate AS datetime;
    DECLARE @contentKey AS uniqueidentifier;

    SET @parameterKey = 'EEAA55F8-46D3-402E-86A7-8C0EE4D4EF85';
    SET @userKey = (SELECT [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER');
    SET @currDate = GETDATE();
    SET @contentKey = (SELECT [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE SystemKeyword = 'Content');

    UPDATE [dbo].[Meet_Master] SET [ADD_GUESTS] = 0;
    
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES (@parameterKey, 'EventsAllowGuestsSettingWasUpdated', '0',
            @userKey, @currDate, @userKey, @currDate,
            '673A2ED2-EC66-4E5A-8453-D16844186C71', @contentKey );   
 END;
 GO
--- PBI40159-- end ----------------------------------------------

--------------------------------------------------------------------------
-- Ensure COUNTRY_CODE and MAIL_GROUP are set in order for SOA 
-- persistence to process them correctly.
--------------------------------------------------------------------------
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AF', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Afghanistan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AX', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Aland Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AL', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Albania' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DZ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Algeria' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AS', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'American Samoa' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AD', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Andorra' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AO', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Angola' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AI', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Anguilla' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AQ', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Antarctica' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AG', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Antigua and Barbuda' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AR', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Argentina' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AM', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Armenia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AW', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Aruba' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AU', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Australia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AT', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Austria' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AZ', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Azerbaijan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BS', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Bahamas' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BH', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Bahrain' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BD', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Bangladesh' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BB', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Barbados' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BY', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Belarus' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BE', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Belgium' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BZ', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Belize' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BJ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Benin' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BM', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Bermuda' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BT', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Bhutan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BO', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Bolivia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BA', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Bosnia and Herzegovina' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BW', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Botswana' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BV', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Bouvet Island' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BR', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Brazil' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IO', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'British Indian Ocean Terr' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BN', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Brunei Darussalam' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BG', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Bulgaria' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BF', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Burkina Faso' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'BI', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Burundi' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KH', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Cambodia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CM', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Cameroon' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CA', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Canada' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CV', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Cape Verde' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KY', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Cayman Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CF', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Central African Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TD', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Chad' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CL', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Chile' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CN', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'China' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CX', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Christmas Island' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CC', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Cocos (Keeling) Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CO', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Colombia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KM', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Comoros' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Congo' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CD', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Congo, The Dem Rep Of The' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CK', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Cook Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CR', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Costa Rica' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CI', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Cote d''Ivoire' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HR', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Croatia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CU', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Cuba' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CY', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Cyprus' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CZ', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Czech Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DK', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Denmark' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DJ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Djibouti' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DM', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Dominica' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DO', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Dominican Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'EC', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Ecuador' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'EG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Egypt' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SV', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'El Salvador' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GQ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Equatorial Guinea' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ER', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Eritrea' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'EE', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Estonia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ET', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Ethiopia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FK', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Falkland Is (Malvinas)' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FO', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Faroe Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FJ', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Fiji' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FI', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Finland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FR', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'France' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GF', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'French Guiana' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PF', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'French Polynesia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TF', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'French Southern Terr' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GA', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Gabon' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GM', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Gambia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GE', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Georgia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'DE', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Germany' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GH', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Ghana' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GI', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Gibraltar' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GR', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Greece' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GL', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Greenland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GD', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Grenada' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GP', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Guadeloupe' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GU', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Guam' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GT', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Guatemala' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GN', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Guinea' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GW', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Guinea-Bissau' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GY', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Guyana' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HT', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Haiti' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HM', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Heard Is and McDonald Is' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VA', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Holy See (Vatican City)' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HN', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Honduras' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HK', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Hong Kong' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'HU', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Hungary' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IS', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Iceland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IN', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'India' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ID', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Indonesia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IR', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Iran, Islamic Republic of' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IQ', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Iraq' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IE', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Ireland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IL', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Israel' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'IT', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Italy' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'JM', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Jamaica' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'JP', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Japan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'JO', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Jordan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KZ', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Kazakhstan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KE', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Kenya' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KI', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Kiribati' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KP', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Korea, Dem People''s Rep' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KR', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Korea, Rebublic Of' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KW', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Kuwait' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KG', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Kyrgyzstan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LA', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Lao People''s Dem Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LV', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Latvia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LB', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Lebanon' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LS', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Lesotho' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LR', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Liberia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LY', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Libyan Arab Jamahiriya' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LI', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Liechtenstein' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LT', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Lithuania' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LU', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Luxembourg' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MO', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Macao' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MK', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Macedonia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Madagascar' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MW', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Malawi' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MY', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Malaysia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MV', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Maldives' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ML', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Mali' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MT', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Malta' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MH', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Marshall Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MQ', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Martinique' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MR', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Mauritania' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MU', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Mauritius' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'YT', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Mayotte' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MX', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Mexico' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'FM', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Micronesia, Fed States Of' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MD', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Moldova, Republic Of' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MC', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Monaco' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MN', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Mongolia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MS', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Montserrat' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MA', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Morocco' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MZ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Mozambique' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MM', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Myanmar' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NA', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Namibia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NR', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Nauru' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NP', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Nepal' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NL', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Netherlands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AN', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Netherlands Antilles' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NC', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'New Caledonia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NZ', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'New Zealand' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NI', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Nicaragua' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NE', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Niger' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Nigeria' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NU', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Niue' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NF', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Norfolk Island' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'MP', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Northern Mariana Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'NO', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Norway' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'OM', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Oman' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PK', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Pakistan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PW', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Palau' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PS', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Palestinian Territory' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PA', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Panama' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PG', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Papua New Guinea' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PY', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Paraguay' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PE', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Peru' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PH', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Philippines' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PN', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Pitcairn' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PL', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Poland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PT', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Portugal' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PR', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Puerto Rico' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'QA', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Qatar' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'RE', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Reunion' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'RO', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Romania' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'RU', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Russian Federation' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'RW', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Rwanda' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SH', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Saint Helena' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'KN', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Saint Kitts and Nevis' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LC', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Saint Lucia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'PM', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Saint Pierre and Miquelon' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'WS', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Samoa' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SM', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'San Marino' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ST', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Sao Tome and Principe' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SA', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Saudi Arabia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SN', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Senegal' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CS', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Serbia and Montenegro' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SC', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Seychelles' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SL', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Sierra Leone' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SG', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Singapore' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SK', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Slovakia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SI', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Slovenia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SB', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Solomon Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SO', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Somalia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ZA', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'South Africa' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GS', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'South Georgia and the SSI' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ES', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Spain' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'LK', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Sri Lanka' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VC', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'St Vincent and Grenadines' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SD', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Sudan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SR', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Suriname' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SJ', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Svalbard and Jan Mayen' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SZ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Swaziland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SE', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Sweden' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'CH', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Switzerland' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'SY', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Syrian Arab Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TW', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Taiwan, Province of China' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TJ', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Tajikistan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TZ', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Tanzania, United Republic' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TH', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Thailand' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TL', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Timor-Leste' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Togo' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TK', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Tokelau' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TO', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Tonga' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TT', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Trinidad and Tobago' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TN', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Tunisia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TR', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Turkey' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TM', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Turkmenistan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TC', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Turks and Caicos Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'TV', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Tuvalu' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'UG', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Uganda' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'UA', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'Ukraine' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'AE', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'United Arab Emirates' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'GB', [MAIL_GROUP] = 'EU' WHERE [COUNTRY] = 'United Kingdom' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'US', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'United States' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'UY', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Uruguay' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'UM', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'US Minor Outlying Islands' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'UZ', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Uzbekistan' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VU', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Vanuatu' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VE', [MAIL_GROUP] = 'SA' WHERE [COUNTRY] = 'Venezuela' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VN', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Viet Nam' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VG', [MAIL_GROUP] = 'WICA' WHERE [COUNTRY] = 'Virgin Islands, British' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'VI', [MAIL_GROUP] = 'WICU' WHERE [COUNTRY] = 'Virgin Islands, US' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'WF', [MAIL_GROUP] = 'OC' WHERE [COUNTRY] = 'Wallis and Futuna' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'EH', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Western Sahara' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'YE', [MAIL_GROUP] = 'ASIA' WHERE [COUNTRY] = 'Yemen' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ZM', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Zambia' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
UPDATE [dbo].[Country_Names] SET [COUNTRY_CODE] = 'ZW', [MAIL_GROUP] = 'AF' WHERE [COUNTRY] = 'Zimbabwe' AND ([COUNTRY_CODE] = '' OR [MAIL_GROUP] = '')
GO

-- PBI (BUG) 41578 - Add Donor Site 'About Me' panel to upgrade
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'DonorAccountProfile') 
INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
VALUES('3513EFE1-A18F-4526-8CB7-B4CC38C57604', 'DonorAccountProfile', 'Profile information for the donor site''s account pages', 'Party', 
'<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Profile information for the donor site''s account pages</Description><Name>DonorAccountProfile</Name><PanelDefinitionId>3513efe1-a18f-4526-8cb7-b4cc38c57604</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorAccountProfile</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>Facebook</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Facebook</PropertyName></PanelFieldData><PanelFieldData><Caption>LinkedIn</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LinkedIn</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Date of Birth</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BirthDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt interval</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string><a:string>FundraisingProfileDonorData</a:string><a:string>Profile_Page</a:string></SelectedEntityNames></PanelDefinitionData>')
GO

-----------------------------------------------------------------------------------------------------------
--- PBI 39852 -  Migrate Social Profiles, Related to 34221
-----------------------------------------------------------------------------------------------------------
-- Migrate data to the new SocialNetworkRef table from the existing ExternalNetwork table (which will be deleted)
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ExternalNetwork')
BEGIN     
    INSERT INTO [dbo].[SocialNetworkRef] (SocialNetworkKey, SocialNetworkName, BaseURL) 
        SELECT en.ExternalNetworkId, en.Name, en.BaseURL 
          FROM [dbo].[ExternalNetwork] en 
        WHERE en.[ExternalNetworkId] NOT IN (SELECT [SocialNetworkKey] FROM [dbo].[SocialNetworkRef])
END
ELSE
BEGIN
    -- If we can no longer copy from ExternalNetwork, add Facebook Social network
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'SocialNetworkRef')
        AND NOT EXISTS (SELECT [SocialNetworkKey] FROM [dbo].[SocialNetworkRef] WHERE [SocialNetworkKey] = '83678141-860B-4093-A58E-C9CB6DB459DB')
    BEGIN     
        INSERT INTO [dbo].[SocialNetworkRef] (SocialNetworkKey, SocialNetworkName, BaseURL) 
            VALUES('83678141-860B-4093-A58E-C9CB6DB459DB', 'Facebook', 'http://www.facebook.com')
    END

    -- If we can no longer copy from ExternalNetwork, add Twitter Social network
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'SocialNetworkRef')
        AND NOT EXISTS (SELECT [SocialNetworkKey] FROM [dbo].[SocialNetworkRef] WHERE [SocialNetworkKey] = '7373766E-102B-434F-86E3-B172A81C2AED')
    BEGIN     
        INSERT INTO [dbo].[SocialNetworkRef] (SocialNetworkKey, SocialNetworkName, BaseURL) 
            VALUES('7373766E-102B-434F-86E3-B172A81C2AED', 'Twitter', 'https://twitter.com')
    END
END
GO

-- Add LinkedIn Social network
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'SocialNetworkRef')
    AND NOT EXISTS (SELECT [SocialNetworkKey] FROM [dbo].[SocialNetworkRef] WHERE [SocialNetworkKey] = '359B00D6-49DF-4F13-9905-7CF5F949BA80')
BEGIN     
    INSERT INTO [dbo].[SocialNetworkRef] (SocialNetworkKey, SocialNetworkName, BaseURL) 
        VALUES('359B00D6-49DF-4F13-9905-7CF5F949BA80', 'LinkedIn', 'http://www.linkedin.com')
END
GO

-- Migrate data to the new ContactSocialNetwork table from the existing IndividualExternalNetworkId table (which should eventually be deleted)
-- We don't have entries for LinkedIn or Skype because there weren't entries for those profiles in IndividualExternalNetwork
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'IndividualExternalNetwork')
BEGIN     
    -- Twitter (for records where http is NOT already in LoginName)
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, ContactKey, SocialNetworkUserName) 
        SELECT ien.IndividualExternalNetworkId, ien.ExternalNetworkId, (SELECT um.[ContactKey] FROM [dbo].[ContactMain] um WHERE um.[ID] = ien.ID), 'https://twitter.com/' + ien.LoginName 
            FROM [dbo].[IndividualExternalNetwork] ien 
        WHERE ien.IndividualExternalNetworkId NOT IN (SELECT [ContactSocialNetworkKey] FROM [dbo].[ContactSocialNetwork])
            AND ien.[ExternalNetworkId] = '7373766E-102B-434F-86E3-B172A81C2AED'
            AND NOT ((ien.[LoginName] LIKE '%http:%') OR (ien.[LoginName] LIKE '%https:%'))
    -- Twitter (for records where http is already in LoginName)
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, ContactKey, SocialNetworkUserName) 
        SELECT ien.IndividualExternalNetworkId, ien.ExternalNetworkId, (SELECT um.[ContactKey] FROM [dbo].[ContactMain] um WHERE um.[ID] = ien.ID), ien.LoginName 
            FROM [dbo].[IndividualExternalNetwork] ien 
        WHERE ien.IndividualExternalNetworkId NOT IN (SELECT [ContactSocialNetworkKey] FROM [dbo].[ContactSocialNetwork])
            AND ien.[ExternalNetworkId] = '7373766E-102B-434F-86E3-B172A81C2AED'
            AND ((ien.[LoginName] LIKE '%http:%') OR (ien.[LoginName] LIKE '%https:%'))
    -- Facebook (for records where http is NOT already in LoginName)
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, ContactKey, SocialNetworkUserName) 
        SELECT ien.IndividualExternalNetworkId, ien.ExternalNetworkId, (SELECT um.[ContactKey] FROM [dbo].[ContactMain] um WHERE um.[ID] = ien.ID), 'http://www.facebook.com/' + ien.LoginName 
            FROM [dbo].[IndividualExternalNetwork] ien 
        WHERE ien.IndividualExternalNetworkId NOT IN (SELECT [ContactSocialNetworkKey] FROM [dbo].[ContactSocialNetwork])
            AND ien.[ExternalNetworkId] = '83678141-860B-4093-A58E-C9CB6DB459DB'
            AND NOT ((ien.[LoginName] LIKE '%http:%') OR (ien.[LoginName] LIKE '%https:%'))
    -- Facebook (for records where http is already in LoginName)
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, ContactKey, SocialNetworkUserName) 
        SELECT ien.IndividualExternalNetworkId, ien.ExternalNetworkId, (SELECT um.[ContactKey] FROM [dbo].[ContactMain] um WHERE um.[ID] = ien.ID), ien.LoginName 
            FROM [dbo].[IndividualExternalNetwork] ien 
        WHERE ien.IndividualExternalNetworkId NOT IN (SELECT [ContactSocialNetworkKey] FROM [dbo].[ContactSocialNetwork])
            AND ien.[ExternalNetworkId] = '83678141-860B-4093-A58E-C9CB6DB459DB'
            AND ((ien.[LoginName] LIKE '%http:%') OR (ien.[LoginName] LIKE '%https:%'))
END
GO

-- Migrate data to the new ContactSocialNetwork table from the existing 
--  UserDefinedSingleInstanceProperty table (which is populated from the panel editor on the Organization profile page & the Donor profile page)
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserDefinedSingleInstanceProperty')
BEGIN
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork')
BEGIN
    -- Facebook (for records where http is NOT already in [UserDefinedSingleInstanceProperty])
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, 
            ContactKey, SocialNetworkUserName) 
        SELECT NEWID(), '83678141-860B-4093-A58E-C9CB6DB459DB', 
            (SELECT contact1.[ContactKey] FROM [dbo].[ContactMain] contact1 WHERE contact1.[ID] = udsip.RowID), 'http://www.facebook.com/' + udsip.[PropertyStringValue]
            FROM [dbo].[UserDefinedSingleInstanceProperty] udsip
        WHERE udsip.[RowID] NOT IN (SELECT contact2.[ID] FROM [dbo].[ContactMain] contact2 
            LEFT JOIN [dbo].[ContactSocialNetwork] csn ON contact2.[ContactKey] = csn.[ContactKey]
            WHERE csn.[SocialNetworkKey] = '83678141-860B-4093-A58E-C9CB6DB459DB')
        AND udsip.[PropertyName] = 'Facebook' AND udsip.[TableName] = 'Profile_Page'
        AND udsip.[PropertyStringValue] IS NOT NULL
        AND NOT ((udsip.[PropertyStringValue] LIKE '%http:%') OR (udsip.[PropertyStringValue] LIKE '%https:%'))
    -- Facebook (for records where http is already in [UserDefinedSingleInstanceProperty])
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, 
            ContactKey, SocialNetworkUserName) 
        SELECT NEWID(), '83678141-860B-4093-A58E-C9CB6DB459DB', 
            (SELECT contact1.[ContactKey] FROM [dbo].[ContactMain] contact1 WHERE contact1.[ID] = udsip.RowID), udsip.[PropertyStringValue]
            FROM [dbo].[UserDefinedSingleInstanceProperty] udsip
        WHERE udsip.[RowID] NOT IN (SELECT contact2.[ID] FROM [dbo].[ContactMain] contact2 
            LEFT JOIN [dbo].[ContactSocialNetwork] csn ON contact2.[ContactKey] = csn.[ContactKey]
            WHERE csn.[SocialNetworkKey] = '83678141-860B-4093-A58E-C9CB6DB459DB')
        AND udsip.[PropertyName] = 'Facebook' AND udsip.[TableName] = 'Profile_Page'
        AND udsip.[PropertyStringValue] IS NOT NULL
        AND ((udsip.[PropertyStringValue] LIKE '%http:%') OR (udsip.[PropertyStringValue] LIKE '%https:%'))

    -- LinkedIn (for records where http is NOT already in [UserDefinedSingleInstanceProperty])
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, 
            ContactKey, SocialNetworkUserName) 
        SELECT NEWID(), '359B00D6-49DF-4F13-9905-7CF5F949BA80', 
            (SELECT contact1.[ContactKey] FROM [dbo].[ContactMain] contact1 WHERE contact1.[ID] = udsip.RowID), 'http://www.linkedin.com/' + udsip.[PropertyStringValue]
            FROM [dbo].[UserDefinedSingleInstanceProperty] udsip
        WHERE udsip.[RowID] NOT IN (SELECT contact2.[ID] FROM [dbo].[ContactMain] contact2 
            LEFT JOIN [dbo].[ContactSocialNetwork] csn ON contact2.[ContactKey] = csn.[ContactKey]
            WHERE csn.[SocialNetworkKey] = '359B00D6-49DF-4F13-9905-7CF5F949BA80')
        AND udsip.[PropertyName] = 'LinkedIn' AND udsip.[TableName] = 'Profile_Page'
        AND udsip.[PropertyStringValue] IS NOT NULL
        AND NOT ((udsip.[PropertyStringValue] LIKE '%http:%') OR (udsip.[PropertyStringValue] LIKE '%https:%'))
    -- LinkedIn (for records where http is already in [UserDefinedSingleInstanceProperty])
    INSERT INTO [dbo].[ContactSocialNetwork] (ContactSocialNetworkKey, SocialNetworkKey, 
            ContactKey, SocialNetworkUserName) 
        SELECT NEWID(), '359B00D6-49DF-4F13-9905-7CF5F949BA80', 
            (SELECT contact1.[ContactKey] FROM [dbo].[ContactMain] contact1 WHERE contact1.[ID] = udsip.RowID), udsip.[PropertyStringValue]
            FROM [dbo].[UserDefinedSingleInstanceProperty] udsip
        WHERE udsip.[RowID] NOT IN (SELECT contact2.[ID] FROM [dbo].[ContactMain] contact2 
            LEFT JOIN [dbo].[ContactSocialNetwork] csn ON contact2.[ContactKey] = csn.[ContactKey]
            WHERE csn.[SocialNetworkKey] = '359B00D6-49DF-4F13-9905-7CF5F949BA80')
        AND udsip.[PropertyName] = 'LinkedIn' AND udsip.[TableName] = 'Profile_Page'
        AND udsip.[PropertyStringValue] IS NOT NULL
        AND ((udsip.[PropertyStringValue] LIKE '%http:%') OR (udsip.[PropertyStringValue] LIKE '%https:%'))
END
END
GO

-- Add ComponentRegistry entry that ties the Business Object to the Typed Business Object
IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [Name] = 'ContactSocialNetwork' AND [InterfaceName] = 'BusinessController' )
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] (ComponentKey, Name, Description, InterfaceName, TypeName, AssemblyName, IsTyped, IsBusinessItem, DeploymentPackageCode)
    VALUES ('A36C35AA-2AE2-40DE-A9E3-AD2AB339A9B2', 'ContactSocialNetwork', 'ContactSocialNetwork Controller', 'BusinessController', 'Asi.Business.Contact.ContactSocialNetworkController',
        'Asi.Business.Contact', 1, 1, 'Platform')
END        
GO  

-- Add ComponentRegistry entry that ties the Business Object to the Typed Business Object
IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [Name] = 'SocialNetworkRef' AND [InterfaceName] = 'BusinessController' )
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] (ComponentKey, Name, Description, InterfaceName, TypeName, AssemblyName, IsTyped, IsBusinessItem, DeploymentPackageCode)
    VALUES ('B934EB0A-A501-4D75-A764-E6C18148529D', 'SocialNetworkRef', 'SocialNetworkRef Controller', 'BusinessController', 'Asi.Business.Contact.SocialNetworkRefController',
        'Asi.Business.Contact', 1, 1, 'Platform')
END        
GO  

------------------------------------------------------------------------------------------------------------------------
-- Remove ExternalNetwork tables and BOs.  Logically this should go in UpdateObsoleteItems, but because that code is 
-- run before this, and because we need the old tables earlier in *this* file, the deletion is placed here.
------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS
    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'vBoIndividualExternalNetworks')
BEGIN
    DROP VIEW [dbo].[vBoIndividualExternalNetworks]
END
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS
      WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'vIndividualExternalNetworkLogin')
BEGIN
    DROP VIEW [dbo].[vIndividualExternalNetworkLogin]
END
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
      WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'IndividualExternalNetwork' AND TABLE_TYPE= 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[IndividualExternalNetwork]
END
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
      WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ExternalNetwork' AND TABLE_TYPE= 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[ExternalNetwork]
END
-- delete IndividualExternalNetworks BO
EXEC dbo.asi_DocumentDelete '58CB8303-01FD-4E7B-905B-4410308251BF', 1
EXEC dbo.asi_DocumentDelete '51587C6C-357E-47EF-98FE-B280E255CA0D', 1
EXEC dbo.asi_DocumentDelete '17C9AAE8-2019-4D50-BC1A-D4C0CC8ECCB4', 1
 
DELETE ObjectMetaData WHERE ObjectName = 'IndividualExternalNetworks'

DELETE [dbo].[ComponentRegistry] WHERE Name = 'IndividualExternalNetworks'
GO

-----------------------------------------------------------------------------------
-- 39852 - Update the 'Profile' Panel and Source (BO), Related to 34221
-----------------------------------------------------------------------------------
-- If Contact_Profile exists, it needs to be updated to remove IndividualExternalNetwork stuff
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Contact_Profile') 
    UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Contact_Profile</Name><PanelDefinitionId>b52e2ab0-b748-43ae-b793-0f34d625bb98</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Contact_Profile</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Current Position</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CurrentPosition</PropertyName></PanelFieldData><PanelFieldData><Caption>Past Experience</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PastExperience</PropertyName></PanelFieldData><PanelFieldData><Caption>Education</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Education</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>ContactProfile</a:string></SelectedEntityNames></PanelDefinitionData>'
     WHERE [PanelDefinitionId] = 'B52E2AB0-B748-43AE-B793-0F34D625BB98'

-- Add Contact_Profile panel definition (the Source)
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Contact_Profile') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('B52E2AB0-B748-43AE-B793-0F34D625BB98', 'Contact_Profile', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Contact_Profile</Name><PanelDefinitionId>b52e2ab0-b748-43ae-b793-0f34d625bb98</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Contact_Profile</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Current Position</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CurrentPosition</PropertyName></PanelFieldData><PanelFieldData><Caption>Past Experience</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PastExperience</PropertyName></PanelFieldData><PanelFieldData><Caption>Education</Caption><EntityName>ContactProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Education</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>ContactProfile</a:string></SelectedEntityNames></PanelDefinitionData>'); 

-- If Organization_Profile_Page exists, it needs to be updated to remove IndividualExternalNetwork stuff
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Organization_Profile_Page') 
    UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Organization_Profile_Page</Name><PanelDefinitionId>a27ea058-2c88-4227-99c4-9723b93b2d86</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Organization_Profile_Page</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Type</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Type</PropertyName></PanelFieldData><PanelFieldData><Caption>Company Size</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CompanySize</PropertyName></PanelFieldData><PanelFieldData><Caption>Founded</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Founded</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>'
     WHERE [PanelDefinitionId] = 'A27EA058-2C88-4227-99C4-9723B93B2D86'
     
-- If Contact_Profile_Page exists, it needs to be updated to remove IndividualExternalNetwork stuff
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Contact_Profile_Page') 
    UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Contact_Profile_Page</Name><PanelDefinitionId>36e47f1c-bb0e-4536-999f-88021acc087c</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Contact_Profile_Page</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Past Experience</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PastExperience</PropertyName></PanelFieldData><PanelFieldData><Caption>Education</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Education</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>'
     WHERE [PanelDefinitionId] = '36E47F1C-BB0E-4536-999F-88021ACC087C'

--- PBI 39852 - END


-------------------------------------------------------------------------
-- Clean up Private ACLs for groups that should have named shared ACLs
-------------------------------------------------------------------------
DECLARE @cleanupKeys TABLE (GroupKey uniqueidentifier, 
                            OldAccessKey uniqueidentifier, 
                            NewAccessKey uniqueidentifier)
INSERT INTO @cleanupKeys
SELECT g.[GroupKey], g.[AccessKey], NULL
  FROM [dbo].[GroupMain] g
       INNER JOIN [dbo].[AccessMain] am ON g.[AccessKey] = am.[AccessKey]
WHERE am.[AccessScope] = N'Local' AND g.[IsSystem] = 1 AND g.[IsAutoGenerated] = 0

UPDATE @cleanupKeys
   SET [NewAccessKey] = '00000000-0000-0000-0000-000000000E1F'

UPDATE g
   SET g.[AccessKey] = c.[NewAccessKey]
  FROM @cleanupKeys c 
       INNER JOIN [dbo].[GroupMain] g ON c.[OldAccessKey] = g.[AccessKey]

DELETE ai
  FROM @cleanupKeys c 
       INNER JOIN [dbo].[AccessItem] ai ON c.[OldAccessKey] = ai.[AccessKey]

DELETE am
  FROM @cleanupKeys c 
       INNER JOIN [dbo].[AccessMain] am ON c.[OldAccessKey] = am.[AccessKey]
GO

-- Make access settings for security groups consistent
UPDATE [dbo].[GroupMain] 
   SET [AccessKey] = '00000000-0000-0000-0000-000000000E1F'
  WHERE GroupTypeKey = '52AAC447-3B6B-470C-9719-D5E38437D6C8'
GO


-----------------------------------------------
-- Create Publish Queue and enable the Broker
-----------------------------------------------
DECLARE @dbname sysname;
DECLARE @sql nvarchar(500);
SELECT @dbname = DB_NAME();
IF (SELECT is_broker_enabled FROM sys.databases WHERE name = @dbname) <> 1
BEGIN
    BEGIN TRY
    SET @sql = N'ALTER DATABASE ' + @dbname + N' SET ENABLE_BROKER WITH ROLLBACK IMMEDIATE';
    EXEC sp_executesql @sql;
    END TRY
    BEGIN CATCH
    SET @sql = N'ALTER DATABASE ' + @dbname + N' SET NEW_BROKER WITH ROLLBACK IMMEDIATE';
    EXEC sp_executesql @sql;
    END CATCH;
END
GO

IF EXISTS (SELECT * FROM sys.services WHERE name = N'iMISPublishService')
     DROP SERVICE iMISPublishService;
IF EXISTS (SELECT * FROM sys.service_queues WHERE name = N'iMISPublishQueue')
     DROP QUEUE iMISPublishQueue;
GO

CREATE QUEUE iMISPublishQueue;

CREATE SERVICE iMISPublishService ON QUEUE iMISPublishQueue
([http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification]);
GO


-- End of script
SET NOCOUNT OFF
GO
