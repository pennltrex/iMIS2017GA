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

-----------------------------------------------------------------------------------------------------------
-- Add the FUNDR/FUNDRAISING license key to the CS2 site ~/Home/Commerce and ~/Home/Commerce/Gift nav items
-----------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] 
                WHERE [LicenseKey] = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND [UniformKey] = 'EF25142B-EAEF-4AE3-8DBD-74937BA3B17C')
BEGIN
    INSERT INTO [UniformLicense] ([LicenseKey], [UniformKey]) 
VALUES ('0B332C8A-FF57-4F59-96EF-68551A699E18','EF25142B-EAEF-4AE3-8DBD-74937BA3B17C')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] 
                WHERE [LicenseKey] = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND [UniformKey] = '18381582-AE92-4748-BA85-B2FB85019FF5')
BEGIN
    INSERT INTO [UniformLicense] ([LicenseKey], [UniformKey]) 
    VALUES ('0B332C8A-FF57-4F59-96EF-68551A699E18','18381582-AE92-4748-BA85-B2FB85019FF5')
END	
GO
------------------------------------------------------------------------------------
-- Remove ORDER and W_WORDER license key from CS2 site ~/Home/Commerce/Gift nav item
------------------------------------------------------------------------------------
DELETE FROM [dbo].[UniformLicense] WHERE [LicenseKey] = 'A59F033B-3E3A-45C4-AA10-0218C4CBE188' and [UniformKey] = '18381582-AE92-4748-BA85-B2FB85019FF5'
DELETE FROM [dbo].[UniformLicense] WHERE [LicenseKey] = 'F7E24111-D323-47B8-8EF7-34F61E26ED42' and [UniformKey] = '18381582-AE92-4748-BA85-B2FB85019FF5'
GO

------------------------------------------------------------------------------------
--  Remove Delivery Preference Field from DonorProfile Panel 
------------------------------------------------------------------------------------
UPDATE [dbo].[PanelDefinition] 
   SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Member information for the donor account pages</Description><Name>DonorProfile</Name><PanelDefinitionId>14e63bd1-ebaa-45ce-b750-06af5814b2c7</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorProfile</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Full Name</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FullName</PropertyName></PanelFieldData><PanelFieldData><Caption>Full Address</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FullAddress</PropertyName></PanelFieldData><PanelFieldData><Caption>LinkedIn</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LinkedIn</PropertyName></PanelFieldData><PanelFieldData><Caption>Do Not Email</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_EMAIL</PropertyName></PanelFieldData><PanelFieldData><Caption>Do Not Phone</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_PHONE</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>Facebook</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Facebook</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt _ Interval</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string><a:string>FundraisingProfileDonorData</a:string></SelectedEntityNames></PanelDefinitionData>' 
 WHERE [PanelDefinitionId] = '14E63BD1-EBAA-45CE-B750-06AF5814B2C7'
GO

------------------------------------------
--PBI 44333 Update IsSystem to true for all Existing Communication Types
------------------------------------------
UPDATE CommunicationReasonRef SET IsSystem=1 WHERE CommunicationReasonName IN ('Shipping', 'Billing', 'Primary')
GO
---------------------------------
--PBI 44333 Create Marketing Communication Type
---------------------------------
DECLARE @componentKey uniqueidentifier
DECLARE @communicationReasonKey uniqueidentifier = NEWID();
IF EXISTS (SELECT 1 FROM ComponentRegistry WHERE Name='CommunicationReasonRef' AND AssemblyName='Asi.Business.Contact')
BEGIN
      SELECT TOP 1 @componentKey=ComponentKey FROM [dbo].[ComponentRegistry] WHERE Name='CommunicationReasonRef' AND AssemblyName='Asi.Business.Contact';
      INSERT INTO [dbo].[UniformRegistry] ([UniformKey], [ComponentKey]) VALUES (@CommunicationReasonKey, @componentKey);
      IF NOT EXISTS (SELECT 1 FROM [dbo].[CommunicationReasonRef] WHERE [CommunicationReasonName] = 'Marketing')
      BEGIN
            INSERT INTO [dbo].[CommunicationReasonRef] ([CommunicationReasonKey], [CommunicationReasonName], [Formula], [IsDefaultType],
                                                                     [DefaultOptOutFlag], [Status], [IsSystem], [CommunicationReasonDesc]) 
            VALUES (@communicationReasonKey, 'Marketing', '{[AdditionalLine1]<n>}[FullName]<n>[FormattedAddress]', 0, 0, 1, 0, 'Promotional Communication');
      END
END
GO
------------------------------------------
--PBI 44333 Update Status to true for all Existing Communication Types
------------------------------------------
UPDATE CommunicationReasonRef SET Status=1 WHERE CommunicationReasonName IN ('Shipping', 'Billing', 'Primary')
GO
------------------------------------------
--PBI 44333 Delete unnecessary Communication Reasons (Donations, Very Big Donations andTEst)
------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[AddressToUse] WHERE [CommunicationReasonKey] = 'bb1b4b70-cbda-48e6-80fe-73f952619717')
    AND NOT EXISTS (SELECT 1 FROM [dbo].[ContactCommunicationReasonPreferences] WHERE [CommunicationReasonKey] = 'bb1b4b70-cbda-48e6-80fe-73f952619717')
BEGIN
    DELETE FROM [dbo].[CommunicationReasonRef] WHERE [CommunicationReasonKey] = 'bb1b4b70-cbda-48e6-80fe-73f952619717'
    DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = 'bb1b4b70-cbda-48e6-80fe-73f952619717'
END
GO
IF NOT EXISTS(SELECT 1 FROM [dbo].[AddressToUse] WHERE [CommunicationReasonKey] = '3c227ab5-f72d-418d-83c1-bf0c8e75efe2')
    AND NOT EXISTS (SELECT 1 FROM [dbo].[ContactCommunicationReasonPreferences] WHERE [CommunicationReasonKey] = '3c227ab5-f72d-418d-83c1-bf0c8e75efe2')
BEGIN
    DELETE FROM [dbo].[CommunicationReasonRef] WHERE [CommunicationReasonKey] = '3c227ab5-f72d-418d-83c1-bf0c8e75efe2'
    DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = '3c227ab5-f72d-418d-83c1-bf0c8e75efe2'
END
GO
IF NOT EXISTS(SELECT 1 FROM [dbo].[AddressToUse] WHERE [CommunicationReasonKey] ='6a778126-cefd-461f-82d8-f71e6ce8391e')
    AND NOT EXISTS (SELECT 1 FROM [dbo].[ContactCommunicationReasonPreferences] WHERE [CommunicationReasonKey] ='6a778126-cefd-461f-82d8-f71e6ce8391e')
BEGIN
    DELETE FROM [dbo].[CommunicationReasonRef] WHERE [CommunicationReasonKey] = '6a778126-cefd-461f-82d8-f71e6ce8391e'
    DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = '6a778126-cefd-461f-82d8-f71e6ce8391e'
END
GO
------------------------------------------
--PBI 45699 Social media integration
------------------------------------------	
IF NOT EXISTS (SELECT 1 FROM [dbo].[PicturePurposeRef] WHERE [PicturePurposeKey] = '5ab1d158-d1de-4836-b109-a6b4b96b48d5')
BEGIN    
    INSERT INTO [dbo].[PicturePurposeRef] ([PicturePurposeKey], [PicturePurposeDesc])
    VALUES ('5ab1d158-d1de-4836-b109-a6b4b96b48d5', 'Facebook')
END
GO

------------------------------------------
--PBI 46211 Update component registry for Advanced Accounting Console
------------------------------------------
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'Advanced Accounting Console' WHERE [ComponentKey] = 'B63EE63B-A28D-4327-96DD-F927BCBBEF4A'
GO
----------------------------------------------
-- SBT 47480 - Add Panel definition to i20-10
----------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'RecurringTransactionInstructionDetail') 
BEGIN
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('C0FE97A6-D7AE-43C1-9E29-3AF2687DC6F5', 'RecurringTransactionInstructionDetail', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>RecurringTransactionInstructionDetail</Name><PanelDefinitionId>c0fe97a6-d7ae-43c1-9e29-3af2687dc6f5</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>RecurringTransactionInstructionDetail</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Payment Amount</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AuthorizedPaymentAmount</PropertyName></PanelFieldData><PanelFieldData><Caption>Status</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Status</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Payment Summary</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PaymentMethodSummary</PropertyName></PanelFieldData><PanelFieldData><Caption>Cancelled On</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancelledOn</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Frequency</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IntervalTypeName</PropertyName></PanelFieldData><PanelFieldData><Caption>Cancellation Reason</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancellationReason</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>AutoPayInstructionDetail</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
END
GO
---------------------------------
--SBT: 47734 Create Relationship_Types
---------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship_Types] WHERE [RELATION_TYPE] = 'EVTGUEST')
BEGIN
    INSERT INTO [dbo].[Relationship_Types] ([RELATION_TYPE], [DESCRIPTION], [RECIPROCAL_TYPE], 
                                           [USE_TITLE], [USE_DATES]) 
    VALUES ('EVTGUEST', 'Event Guest', 'EVTGUESTOF',
            0, 1)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship_Types] WHERE [RELATION_TYPE] = 'EVTGUESTOF')
BEGIN
    INSERT INTO [dbo].[Relationship_Types] ([RELATION_TYPE], [DESCRIPTION], [RECIPROCAL_TYPE], 
                                           [USE_TITLE], [USE_DATES]) 
    VALUES ('EVTGUESTOF', 'Event Guest of', 'EVTGUEST',
            0, 1)
END
GO
------------------------------------------------------------------------------------------------
--iMISMain10 SBT: 47736 One time conversion script to add Event Guests to Relationship table.
-------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship] WHERE [RELATION_TYPE] = 'EVTGUEST')
BEGIN
    INSERT INTO [dbo].[Relationship] (ID, RELATION_TYPE, TARGET_ID, TARGET_RELATION_TYPE,EFFECTIVE_DATE, DATE_ADDED, LAST_UPDATED, UPDATED_BY, SEQN)
        SELECT o1.st_id AS ID,
               'EVTGUEST' AS RELATION_TYPE,
               o2.ST_ID AS TARGET_ID,
               'EVTGUESTOF' AS TARGET_RELATION_TYPE,
               o2.ENTERED_DATE_TIME AS EFFECTIVE_DATE,
               o2.ENTERED_DATE_TIME AS DATE_ADDED,
               o2.ENTERED_DATE_TIME AS LAST_UPDATED,
               o2.ENTERED_BY AS UPDATED_BY,
               (ROW_NUMBER() OVER (ORDER BY o2.ST_ID) + (SELECT COALESCE(MAX(SEQN), 0) FROM Relationship)) AS SEQN
          FROM [dbo].[Order_Meet] AS om
               INNER JOIN [dbo].[Orders] AS o1 ON o1.[ORDER_NUMBER] = om.[PARENT_ORDER_NUMBER]
               INNER JOIN [dbo].[Orders] AS o2 ON o2.[ORDER_NUMBER] = om.[ORDER_NUMBER]
         WHERE om.[PARENT_ORDER_NUMBER] IS NOT NULL;

    EXEC dbo.asi_RebuildCounters
END
GO
------------------------------------------------------------------------------------------------------
-- SBT 47915 - Amend the RecurringtransactionInstructionDetail panel editor to have status as required
------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'RecurringTransactionInstructionDetail') 
UPDATE [dbo].[PanelDefinition] 
SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>RecurringTransactionInstructionDetail</Name><PanelDefinitionId>c0fe97a6-d7ae-43c1-9e29-3af2687dc6f5</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>RecurringTransactionInstructionDetail</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Payment Amount</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AuthorizedPaymentAmount</PropertyName></PanelFieldData><PanelFieldData><Caption>Status</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Status</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Payment Summary</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PaymentMethodSummary</PropertyName></PanelFieldData><PanelFieldData><Caption>Cancelled On</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancelledOn</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Frequency</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IntervalTypeName</PropertyName></PanelFieldData><PanelFieldData><Caption>Cancellation Reason</Caption><EntityName>AutoPayInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancellationReason</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>AutoPayInstructionDetail</a:string></SelectedEntityNames></PanelDefinitionData>'
WHERE [PanelDefinitionId] = 'C0FE97A6-D7AE-43C1-9E29-3AF2687DC6F5'
GO
------------------------------------------------------------------------------------------------------
-- SBT 47878 - Remove the default DV URL from iMIS in settings in GOLD
------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE ParameterName = 'DataVault.DataVaultServiceAddress' AND ParameterValue = 'https://payments.advsol.com/DataVaultCI/Asi.Services.DataVaultService.DataVault.svc')
UPDATE [dbo].[SystemConfig] 
SET ParameterValue = ' ' 
WHERE ParameterName = 'DataVault.DataVaultServiceAddress'
GO

------------------------------------------------------
-- PBI 47721 - Add Committee Administrator position --
------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Committee_Position] WHERE [POSITION_CODE] = '_ADMIN')
INSERT INTO [dbo].[Committee_Position] ([POSITION_CODE], [TITLE], [RANK])
     VALUES ('_ADMIN', 'Committee Administrator', 5)
GO

------------------------------------------------------
-- PBI 47721 - Add new GROUPADMIN license keyword
------------------------------------------------------
DECLARE @licenseKey UNIQUEIDENTIFIER
SET @licenseKey = 'E35D578F-9348-4B8F-A0CF-36879C41EAA7'

IF NOT EXISTS (SELECT 1 FROM [dbo].[License] WHERE [LicenseKey] = @licenseKey)
INSERT INTO [dbo].[License] ([LicenseKey], [LicenseName], [LicenseDesc])
VALUES (@licenseKey, 'Group Administration', 'Grant group membership administration privileges to specific group members.')

DECLARE @legacyKeyword NVARCHAR(50)
SET @legacyKeyword = 'GROUPADMIN'
IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyMap] WHERE [LicenseKey] = @licenseKey AND [LegacyLicenseCode] = @legacyKeyword)
INSERT INTO [dbo].[LicenseLegacyMap] ([LicenseKey], [LegacyLicenseCode])
VALUES (@licenseKey, @legacyKeyword)
GO

------------------------------------------------------
-- PBI 48283 - disallow opt-out of Shipping reason
------------------------------------------------------
UPDATE [dbo].[CommunicationReasonRef] 
     SET [CannotOptOutFlag] = 1 
   WHERE [CommunicationReasonName] = 'Shipping'
GO

---------------------------------------------------------------------------------------------------------------------------
-- PBI 47898 - Add a system relationship type of _ORG-ADMIN to allow contacts to be administrators of more than one company
---------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship_Types] WHERE [RELATION_TYPE] = '_ORG-ADMIN')
BEGIN
    INSERT [dbo].[Relationship_Types] ([RELATION_TYPE], [DESCRIPTION], [RECIPROCAL_TYPE], [USE_TITLE], [USE_DATES]) 
    VALUES ('_ORG-ADMIN', 'Company Administrator', '', 1, 0)
END
GO

------------------------------------------------------------------------------------------------
-- PBI 47898 - One time conversion script to add company administrators to Relationship table.
------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship] WHERE [RELATION_TYPE] = '_ORG-ADMIN')
BEGIN
    DECLARE @now datetime
    SELECT @now = GETDATE()

    INSERT INTO [dbo].[Relationship] ([ID], [RELATION_TYPE], [TARGET_ID], [TARGET_RELATION_TYPE], [TITLE], [DATE_ADDED], [LAST_UPDATED], [UPDATED_BY], [SEQN])
         SELECT n.[CO_ID], '_ORG-ADMIN', n.[ID], '', '', @now, @now, 'MANAGER', (ROW_NUMBER() OVER (ORDER BY n.[ID]) + (SELECT COALESCE(MAX(SEQN), 0) FROM Relationship))
           FROM [dbo].[Name] AS n 
                INNER JOIN [dbo].[ContactMain] AS c ON n.[ID] = c.[SyncContactID]
                INNER JOIN [dbo].[UserRole] r ON c.[ContactKey] = r.[UserKey]
          WHERE  n.[CO_ID] != '' AND r.[RoleKey] = '4F0F93A9-00EE-40BA-BCBC-99A5BEB21179' -- Company Administrator

    EXEC dbo.asi_RebuildCounters

END
GO

----------------------------------------------------------
-- PBI 48609 - Update WEB_BATCH field in the Batch table for Autobatches
----------------------------------------------------------
UPDATE [dbo].[Batch]
   SET [WEB_BATCH] = 1  
 WHERE [CREATED_BY] IN ('AUTOBATCH', 'AUTOBATCHSTAFF', 'AUTOBATCHPUBLIC')
GO

----------------------------------------------------------
-- PBI 48702 - Add Spanish, French and Dutch Translation Cultures
----------------------------------------------------------
IF NOT EXISTS (SELECT 1
                 FROM [dbo].[LocalizationCulture]
                WHERE [LocalizationCultureID] = 'es')
BEGIN
    INSERT INTO LocalizationCulture
    VALUES ('es', 'Spanish');
END

IF NOT EXISTS (SELECT 1
                 FROM [dbo].[LocalizationCulture]
                WHERE [LocalizationCultureID] = 'fr')
BEGIN
    INSERT INTO LocalizationCulture
    VALUES ('fr', 'French');
END

IF NOT EXISTS (SELECT 1
                 FROM [dbo].[LocalizationCulture]
                WHERE [LocalizationCultureID] = 'nl')
BEGIN
    INSERT INTO LocalizationCulture
    VALUES ('nl', 'Dutch');
END
GO

--------------------------------------------------
-- SBT49119 - Add new ADVEMAIL license key  
--------------------------------------------------
DECLARE @LicenseKey uniqueidentifier
SET @LicenseKey = '02F8ED99-F648-464F-8F66-60D8B9D31A55'

IF NOT EXISTS (SELECT 1 FROM [dbo].[License] WHERE [LicenseKey] = @LicenseKey)
INSERT INTO [dbo].[License] ([LicenseKey], [LicenseName], [LicenseDesc], [MarkedForDeleteOn])
VALUES (@LicenseKey, 'ADVEMAIL', 'Advanced email module', NULL)

IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyMap] WHERE [LicenseKey] = @LicenseKey)
INSERT INTO [dbo].[LicenseLegacyMap] ([LicenseKey], [LegacyLicenseCode])
     VALUES (@LicenseKey, 'ADVEMAIL')
GO

----------------------------------------------------------
-- PBI 49029 - Add new ADVTASK license for automated task
----------------------------------------------------------
DECLARE @licenseKey uniqueidentifier
SET @licenseKey = '2C733BE3-6728-4A1E-9081-5BFD85495BDE' 

DECLARE @legacyKeyword nvarchar(50)
SET @legacyKeyword = 'ADVTASK'

IF NOT EXISTS (SELECT 1 FROM [dbo].[License] WHERE [LicenseKey] = @licenseKey)
INSERT INTO [dbo].[License] ([LicenseKey], [LicenseName], [LicenseDesc])
VALUES (@licenseKey, @legacyKeyword, 'Advanced task module')

IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyMap] WHERE [LicenseKey] = @licenseKey AND [LegacyLicenseCode] = @legacyKeyword)
INSERT INTO [dbo].[LicenseLegacyMap] ([LicenseKey], [LegacyLicenseCode])
VALUES (@licenseKey, @legacyKeyword)
GO

----------------------------------------------------------
-- PBI 48665 Automation: v10 Create out of the box alerts - SBT 49400 Upgrade/Install script
----------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Add TaskDefinition
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '81A688AA-25FB-47EE-92A7-03D006CB1C44')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('81A688AA-25FB-47EE-92A7-03D006CB1C44'	
    ,'Expired membership alert'	
    ,'Creates an alert if the selected contact''s membership is expired'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>8ba0c9fd-efbb-453e-85c9-4e928d212f79</DataSourceId><DataSourceName>ExpiredMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Expired members</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact''s membership is expired</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>8ba0c9fd-efbb-453e-85c9-4e928d212f79</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Expired membership alert</Name><Notifications><NotificationDefinition><DataSources><string>8ba0c9fd-efbb-453e-85c9-4e928d212f79</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Membership expired on&amp;nbsp;&lt;strong&gt;{#ExpiredMembers.PaidThrough format=m}&lt;/strong&gt;&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>2764a409-e0fb-4521-8319-429e3d6aa772</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>81a688aa-25fb-47ee-92a7-03d006cb1c44</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>81a688aa-25fb-47ee-92a7-03d006cb1c44</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>27e096d2-6133-4c4b-a9b6-3fbb645bb359</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:48:28.477</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T12:58:02.62</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey	
    ,@now	
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '5C0DCD19-CD4C-44BD-99BA-0B87EB1EABB0')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('5C0DCD19-CD4C-44BD-99BA-0B87EB1EABB0'	
    ,'Event reminder alert'	
    ,'Creates an alert if the selected contact is registered for an event occurring within 21 days.'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>d562d541-4108-451f-9981-339457671723</DataSourceId><DataSourceName>UpcomingRegistrations</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Upcoming event registrations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact is registered for an event occurring within 21 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>d562d541-4108-451f-9981-339457671723</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Event reminder alert</Name><Notifications><NotificationDefinition><DataSources><string>d562d541-4108-451f-9981-339457671723</string></DataSources><DefaultTemplate>{foreach event in UpcomingRegistrations}&#xD; &lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/alarm-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Registered for&amp;nbsp;&lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.Event_Title}&lt;/a&gt;, starting {#event.BeginDate format=m}&lt;/div&gt;&#xD; &lt;/div&gt;&#xD; {/foreach}</DefaultTemplate><NotificationDefinitionId>33acc141-c614-4ef8-81e6-a9014202b7e6</NotificationDefinitionId><PersonalizedTemplate>{foreach event in UpcomingRegistrations}&#xD; &lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/alarm-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; &lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.Event_Title}&lt;/a&gt; is coming up on&amp;nbsp;&lt;strong&gt;{#event.BeginDate format="m"}&#xD; &lt;/strong&gt;&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;&#xD; {/foreach}</PersonalizedTemplate><TaskDefinitionId>5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>d126d2e0-9ecb-42ba-bfb1-4d98b121eb5d</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:45:26.463</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T12:58:27.603</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey	
    ,@now	
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '5D970207-A95E-4882-A605-4B010F16E583')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('5D970207-A95E-4882-A605-4B010F16E583'	
    ,'VIP alert'	
    ,'Intended for staff use; Creates a VIP alert if the selected contact is a committee President or Chair.'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>5c801589-1153-41be-9104-b7b49cd756c2</DataSourceId><DataSourceName>VIPs</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/VIP contacts</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Intended for staff use; Creates a VIP alert if the selected contact is a committee President or Chair.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>5c801589-1153-41be-9104-b7b49cd756c2</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>VIP alert</Name><Notifications><NotificationDefinition><DataSources><string>5c801589-1153-41be-9104-b7b49cd756c2</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/cup-color.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; &lt;h4 class="media-heading"&gt;VIP&lt;/h4&gt;&#xD; {foreach group in VIPs}&#xD; {#group.CommitteeName} -&amp;nbsp;{#group.Position}&lt;br /&gt;&#xD; {/foreach}&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>a88bd600-0090-48f0-a0aa-b20c6eee180a</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>5d970207-a95e-4882-a605-4b010f16e583</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5d970207-a95e-4882-a605-4b010f16e583</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>eaf5d4c0-8928-4f97-8aed-ebe44edcfda1</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:24:41.64</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-02T12:33:57.797</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'E6BB9114-8528-48A2-94FD-579BEF13FA0B')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('E6BB9114-8528-48A2-94FD-579BEF13FA0B'	
    ,'Membership expires soon alert'	
    ,'Creates an alert if the selected contact''s membership will expire within 60 days'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</DataSourceId><DataSourceName>ExpiringMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Members expiring within 60 days</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact''s membership will expire within 60 days</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Membership expires soon alert</Name><Notifications><NotificationDefinition><DataSources><string>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Membership expires on&amp;nbsp;&lt;strong&gt;{#ExpiringMembers.PaidThrough format=m}&lt;/strong&gt;&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>e0362465-9431-44ef-be16-7f0f2f39154c</NotificationDefinitionId><PersonalizedTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Your membership expires on&amp;nbsp;&lt;strong&gt;{#ExpiringMembers.PaidThrough format=m}&lt;/strong&gt;&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</PersonalizedTemplate><TaskDefinitionId>e6bb9114-8528-48a2-94fd-579bef13fa0b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>e6bb9114-8528-48a2-94fd-579bef13fa0b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>55f7062d-214b-47d7-98e4-6dc4afeb594a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:49:31.787</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:47:31.48</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'D577BE59-2531-4947-B2CD-671DE991A38B')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('D577BE59-2531-4947-B2CD-671DE991A38B'	
    ,'Join now alert'	
    ,'Creates an alert if the selected contact is not a member, prompting them to join.'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</DataSourceId><DataSourceName>Non-members</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Non-members</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Join now alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; &lt;a href="[Website]/JoinNow"&gt;&lt;strong&gt;Join now&lt;/strong&gt;&lt;/a&gt; and start enjoying members-only resources, events, and learning opportunities!&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>488d7bd5-798c-47ab-8d68-0695a66fb2d7</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>f622ea0d-18a9-4473-b69c-da9bb609661a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:42:43.887</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2014-11-03T15:55:02.393</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now
    ,@userKey	
    ,@now)
END  
ELSE
BEGIN
    UPDATE [dbo].[TaskDefinition]
    SET [SerializedTaskDefinition] = '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</DataSourceId><DataSourceName>Non-members</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Non-members</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Join now alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; &lt;a href="[Website]/JoinNow"&gt;&lt;strong&gt;Join now&lt;/strong&gt;&lt;/a&gt; and start enjoying members-only resources, events, and learning opportunities!&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>488d7bd5-798c-47ab-8d68-0695a66fb2d7</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>f622ea0d-18a9-4473-b69c-da9bb609661a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:42:43.887</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2014-11-03T15:55:02.393</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
        [UpdatedByUserKey] = @userKey, [UpdatedOn] = @now
    WHERE [TaskDefinitionKey] = 'D577BE59-2531-4947-B2CD-671DE991A38B'
END  
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '6E5A7E0B-EB04-4991-84B8-7DF45ECF4AE9')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('6E5A7E0B-EB04-4991-84B8-7DF45ECF4AE9'
    ,'Major donor alert'
    ,'Intended for staff use; creates an alert if the selected contact is assigned to a Moves Manager.'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>70776c3c-db48-4f1a-b80e-60f5404c5e65</DataSourceId><DataSourceName>MajorDonors</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Major Donors</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Intended for staff use; creates an alert if the selected contact is assigned to a Moves Manager.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>70776c3c-db48-4f1a-b80e-60f5404c5e65</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Major donor alert</Name><Notifications><NotificationDefinition><DataSources><string>70776c3c-db48-4f1a-b80e-60f5404c5e65</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/donor-ribbon-grey.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; &lt;h4 class="media-heading"&gt;Major Donor&lt;/h4&gt;&#xD; Moves Manager:&amp;nbsp;&lt;a href="[~]/Party.aspx?ID={#MajorDonors.Moves_Manager_ID}"&gt;{#MajorDonors.Moves_Manager}&lt;/a&gt;&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>0df7dbe3-9209-4890-bf45-266e1982ce7c</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>37e1b987-59b0-4099-8f3c-8c00464e0a3d</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:20:32.443</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:48:41.697</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey	
    ,@now
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'AFF2B818-CC19-44ED-A921-B40B9BB7F9AC')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('AFF2B818-CC19-44ED-A921-B40B9BB7F9AC'	
    ,'Missing primary email alert'	
    ,'Creates an alert if the selected contact has no primary email.'	
    ,0	
    ,1	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4c6097f0-8771-4347-8ad3-b64f7a2f7bb2</DataSourceId><DataSourceName>MissingEmail</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Contacts with no primary email</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact has no primary email.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>4c6097f0-8771-4347-8ad3-b64f7a2f7bb2</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Missing primary email alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Primary email is missing&#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>8529fb7e-7f42-4f4b-9cf0-6c937b9517df</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>aff2b818-cc19-44ed-a921-b40b9bb7f9ac</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>aff2b818-cc19-44ed-a921-b40b9bb7f9ac</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>c88f7648-6027-4fb2-ae7f-becadae7a84c</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:40:39.5</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:48:15.29</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now	
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'CD0655EF-CE2F-4D43-8CE9-7C49F6EBF79E')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('CD0655EF-CE2F-4D43-8CE9-7C49F6EBF79E'	
    ,'New member welcome email'	
    ,'Sends out a welcome email on a weekly basis to members who have joined in the past week.'	
    ,0	
    ,0	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>a42eef4e-7293-482a-a134-48a1a8659ba2</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>e31a50a7-7e40-463c-97ed-2f9de4856aab</a:CommunicationTemplateId><a:Description>New Member Welcome Email</a:Description><a:RecipientDatasourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</DataSourceId><DataSourceName>NewMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/New members in the last 7 days</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a welcome email on a weekly basis to members who have joined in the past week.</Description><Evaluations/><Name>New member welcome email</Name><Notifications><NotificationDefinition><DataSources><string>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</string></DataSources><DefaultTemplate/><NotificationDefinitionId>3b5d8751-e9c6-413a-b7cf-93f0f0497815</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">1b9adb73-daf7-4e20-92e3-5ca70854d415</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfWeek xmlns:a="http://schemas.datacontract.org/2004/07/System"><a:DayOfWeek>Sunday</a:DayOfWeek></DaysOfWeek><Months>0</Months><ScheduleFrequency>Weekly</ScheduleFrequency><Time>0001-01-01T00:00:00</Time><Weeks>1</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T00:01:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T14:58:35.247</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T15:01:42.21</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now	
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '458C4906-D946-4A41-85A8-B62E2B63ED2A')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('458C4906-D946-4A41-85A8-B62E2B63ED2A'	
    ,'Donation thank you email'	
    ,'Sends out a thank you email to donors who have made a donation.'	
    ,0	
    ,0	
    ,0	
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>ffd474b3-7054-4643-9538-4472c1a3f65d</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>c866e389-3abd-45f6-9545-f1a9024b91c2</a:CommunicationTemplateId><a:Description>DonationThankYouTemplate</a:Description><a:RecipientDatasourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</DataSourceId><DataSourceName>Donors</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Donations received today</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a thank you email to donors who have made a donation.</Description><Evaluations/><Name>Donation thank you email</Name><Notifications><NotificationDefinition><DataSources><string>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</string></DataSources><DefaultTemplate/><NotificationDefinitionId>29dcb66a-dbca-465d-a769-dc3222e0c43d</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">6e91c1a3-3b09-4621-809d-878084021dcf</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2014-10-03T23:59:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T23:59:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T15:06:18.767</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T15:09:10.67</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now	
    ,@userKey
    ,@now)
END    
GO

-- Add NotificationSets
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '9BDCB97A-74E9-44F9-8572-662BCEBEF006')
BEGIN
    INSERT INTO [dbo].[NotificationSet] 
    ([NotificationSetKey]
    ,[NotificationSetName]
    ,[NotificationSetDesc]
    ,[NotificationSetLimitUserView]
    ,[NotificationSetIsSystem]
    ,[NotificationSetIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('9BDCB97A-74E9-44F9-8572-662BCEBEF006'	
    ,'Member alerts'	
    ,'Alerts that display to public users on the home page and on their account page'	
    ,1	
    ,0	
    ,0	
    ,@userKey	
    ,@now
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '845F59DB-52B9-4448-8209-C77B8FC1FE60')
BEGIN
    INSERT INTO [dbo].[NotificationSet] 
    ([NotificationSetKey]
    ,[NotificationSetName]
    ,[NotificationSetDesc]
    ,[NotificationSetLimitUserView]
    ,[NotificationSetIsSystem]
    ,[NotificationSetIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('845F59DB-52B9-4448-8209-C77B8FC1FE60'	
    ,'Staff account page alerts'	
    ,'Alerts that appear on the account page which staff users see'	
    ,1	
    ,0	
    ,0	
    ,@userKey	
    ,@now
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = 'D32C2CB8-44C7-4243-8B8D-35A048CCF576')
BEGIN
    INSERT INTO [dbo].[NotificationSet] 
    ([NotificationSetKey]
    ,[NotificationSetName]
    ,[NotificationSetDesc]
    ,[NotificationSetLimitUserView]
    ,[NotificationSetIsSystem]
    ,[NotificationSetIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('D32C2CB8-44C7-4243-8B8D-35A048CCF576'	
    ,'Quick Start Member alerts'	
    ,'Sample member-facing alerts for use in the Quick Start sites'	
    ,1	
    ,0	
    ,0	
    ,@userKey	
    ,@now
    ,@userKey	
    ,@now)
END    
GO

-- Add NotificationSetDetails
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '001D7319-4EB5-4ED2-BE87-220739E57101')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('001D7319-4EB5-4ED2-BE87-220739E57101'	
    ,'9BDCB97A-74E9-44F9-8572-662BCEBEF006'	
    ,'81A688AA-25FB-47EE-92A7-03D006CB1C44'	
    ,0	
    ,0	
    ,@userKey	
    ,@now
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '0F8BC33B-540B-4529-9093-7B61EA994605')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('0F8BC33B-540B-4529-9093-7B61EA994605'	
    ,'9BDCB97A-74E9-44F9-8572-662BCEBEF006'	
    ,'E6BB9114-8528-48A2-94FD-579BEF13FA0B'	
    ,1	
    ,0	
    ,@userKey	
    ,@now	
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '0479BA8B-4717-455B-9C44-15003B0CEABB')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('0479BA8B-4717-455B-9C44-15003B0CEABB'	
    ,'9BDCB97A-74E9-44F9-8572-662BCEBEF006'	
    ,'5C0DCD19-CD4C-44BD-99BA-0B87EB1EABB0'	
    ,2	
    ,0	
    ,@userKey	
    ,@now	
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '821A793E-6803-4086-8ED8-7FC1C74CB566')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('821A793E-6803-4086-8ED8-7FC1C74CB566'	
    ,'845F59DB-52B9-4448-8209-C77B8FC1FE60'	
    ,'81A688AA-25FB-47EE-92A7-03D006CB1C44'	
    ,0	
    ,0	
    ,@userKey	
    ,@now
    ,@userKey
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '226A54A0-C364-4C5F-AAE3-7839BE221249')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('226A54A0-C364-4C5F-AAE3-7839BE221249'	
    ,'845F59DB-52B9-4448-8209-C77B8FC1FE60'	
    ,'E6BB9114-8528-48A2-94FD-579BEF13FA0B'	
    ,1	
    ,0	
    ,@userKey
    ,@now
    ,@userKey	
    ,@now)
END    
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '9B85F957-811A-4248-B272-F5DC26B7A895')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('9B85F957-811A-4248-B272-F5DC26B7A895'	
    ,'845F59DB-52B9-4448-8209-C77B8FC1FE60'	
    ,'AFF2B818-CC19-44ED-A921-B40B9BB7F9AC'	
    ,2	
    ,0	
    ,@userKey
    ,@now	
    ,@userKey	
    ,@now)
END
GO 

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '4FB5CBBC-EFBD-4383-B4F0-8EAE298CB352')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('4FB5CBBC-EFBD-4383-B4F0-8EAE298CB352'	
    ,'845F59DB-52B9-4448-8209-C77B8FC1FE60'	
    ,'5C0DCD19-CD4C-44BD-99BA-0B87EB1EABB0'	
    ,3	
    ,0	
    ,@userKey
    ,@now
    ,@userKey
    ,@now)
END
GO

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '25E3D687-C25C-4955-ACF8-92044C739111')
BEGIN
    INSERT INTO [dbo].[NotificationSetDetail] 
    ([NotificationSetDetailKey]
    ,[NotificationSetKey]
    ,[TaskDefinitionKey]
    ,[NotificationSetDetailPriority]
    ,[NotificationSetDetailIsDefault]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('25E3D687-C25C-4955-ACF8-92044C739111'	
    ,'D32C2CB8-44C7-4243-8B8D-35A048CCF576'	
    ,'D577BE59-2531-4947-B2CD-671DE991A38B'	
    ,0	
    ,0	
    ,@userKey
    ,@now
    ,@userKey
    ,@now)
END        
GO

-- Fix OwnerAccessKeys that point to empty ACLs
IF OBJECT_ID('TempDB..#OwnerAccessKeys') IS NOT NULL
    DROP TABLE #OwnerAccessKeys;
CREATE TABLE #OwnerAccessKeys (OwnerAccessKey uniqueidentifier PRIMARY KEY);
INSERT INTO #OwnerAccessKeys
    SELECT DISTINCT g.OwnerAccessKey 
      FROM [dbo].[GroupMain] g
     WHERE g.OwnerAccessKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM AccessArea a WHERE a.ProtectedAccessKey = g.OwnerAccessKey)
SELECT * FROM #OwnerAccessKeys -- DEBUG
DELETE ai
  FROM #OwnerAccessKeys oak
       INNER JOIN AccessItem ai ON oak.OwnerAccessKey = ai.AccessKey;
UPDATE [dbo].[GroupMain]
   SET [OwnerAccessKey] = NULL;
DELETE am
  FROM #OwnerAccessKeys oak
       INNER JOIN AccessMain am ON oak.OwnerAccessKey = am.AccessKey;
IF OBJECT_ID('TempDB..#OwnerAccessKeys') IS NOT NULL
    DROP TABLE #OwnerAccessKeys;
GO

----------------------------------------------------------
-- PBI 51774 - Add missing system activity types
----------------------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'CHAPT')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('CHAPT', 'Chapter Membership Fees', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')

IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'MISC')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('MISC', 'Miscellaneous Items', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')

IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'SEC')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('SEC', 'Sections and Specialty Groups', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')

IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'SUB')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('SUB', 'Journals and Other Subscriptions', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')
           
IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'VOL')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('VOL', 'Voluntary Contributions', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')
           
-- DUES does exist in the empty db, but might as well add this script just in case
IF NOT EXISTS(SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'DUES')
INSERT INTO [dbo].[Product_Type]
           ([PROD_TYPE], [DESCRIPTION], [SALES_ITEM], [DUES_SUB_ITEM], [PROFILE_SORT], [SUBTYPE_PROMPT], [DESCRIPTION_PROMPT],
           [EFF_DATE_PROMPT], [THRU_DATE_PROMPT], [SOURCE_PROMPT], [AMOUNT_PROMPT], [TICKLER_PROMPT], [ACTION_PROMPT],
           [CEU_TYPE_PROMPT], [UNITS_PROMPT], [USER_EDIT], [RETAIN_MONTHS], [FOLLOW_UP_PROMPT], [NOTE_PROMPT], [EXTENDED_DEMO],
           [UF_1_PROMPT], [UF_2_PROMPT], [UF_3_PROMPT], [UF_4_PROMPT], [UF_5_PROMPT], [UF_6_PROMPT], [UF_7_PROMPT],
           [CO_ID_PROMPT], [OTHER_CODE_PROMPT], [ACCESS_KEYWORDS], [CREATE_HISTORY_TAB], [HISTORY_TAB_TITLE])
     VALUES
           ('DUES', 'Membership Fees', 0, 1, 2, '', 'Type',
           'Begin Date', 'Thru', '', 'Amount', '', '',
           '', '', 0, 36, '', '', 0,
           '', '', '', '', '', '', '',
           '', '', '', 0, '')

GO

----------------------------------------------------------
-- PBI 23027 - Build out Moves Management examples
----------------------------------------------------------
-- Added a new property to the Cultivating Donor For panel definition
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [PanelDefinitionId] = '836DACBE-C40B-4CDE-840C-3C7254AF0F4F')
    UPDATE [dbo].[PanelDefinition]
       SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Cultivating Donor For</Name><PanelDefinitionId>836dacbe-c40b-4cde-840c-3c7254af0f4f</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Cultivating Donor For</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Gift Type</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>GiftType</PropertyName></PanelFieldData><PanelFieldData><Caption>Estimated Value</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EstimatedValue</PropertyName></PanelFieldData><PanelFieldData><Caption>Planned Ask Time</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PlannedAskDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Cultivation Stage</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CultivationStage</PropertyName></PanelFieldData><PanelFieldData><Caption>Quality</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Quality</PropertyName></PanelFieldData><PanelFieldData><Caption>Note</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Note</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CultivatingFor</a:string></SelectedEntityNames></PanelDefinitionData>'
     WHERE [PanelDefinitionId] = '836DACBE-C40B-4CDE-840C-3C7254AF0F4F'
GO

-- End of script
SET NOCOUNT OFF
GO
