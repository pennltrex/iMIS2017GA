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

-- Update the name of the Component Registry entry from "ContentFile" to "Content File"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content File'
 WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentFile'
GO

-- Update the name of the Component Registry entry from "AdvancedSearch" to "Advanced Search"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Advanced Search'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'AdvancedSearch'
GO

-- Update the name of the Component Registry entry from "ContentHtml" to "Content Html"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content Html'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentHtml'
GO

-- Update the name of the Component Registry entry from "ContentLink" to "Content Link"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content Link'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentLink'
GO

-- Update the name of the Component Registry entry from "ContentPageBreak" to "Content Page Break"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content Page Break'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentPageBreak'
GO

-- Update the name of the Component Registry entry from "ContentReference" to "Content Reference"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content Reference'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentReference'
GO

-- Update the name of the Component Registry entry from "ContentTaggedList" to "Content Tagged List"
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Content Tagged List'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentTaggedList'
GO

-- Update the Component Registry entry for "Donation Creator" DLL to be "Asi.Web.iParts.Fundraising"
UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Fundraising'
WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Donation Creator'
GO

-- Add new row to GenTables, add 'List_As' as Salutation type
DECLARE @tablename nvarchar(30)
SET @tablename = 'SALUTATION_CODE'
IF NOT EXISTS (SELECT 1 FROM [dbo].[Gen_Tables] WHERE [TABLE_NAME] = @tablename AND [CODE] = 'LIST_AS' )
BEGIN
    INSERT INTO Gen_Tables(TABLE_NAME,CODE,SUBSTITUTE,UPPER_CODE,[DESCRIPTION])
    VALUES (@tablename,'LIST_AS','','LIST_AS','Donation List As')
END
GO

--------------------------------------------------------------------
-- Update certain records which may have a member type that no longer
-- exists in the Member_Types table.  Change their member type to 
-- registered member.  If the member type is valid, leave it alone.
--------------------------------------------------------------------
UPDATE [dbo].[Name] 
    SET [MEMBER_TYPE]='M' 
    WHERE [ID] IN ('107', '115', '152', '153') 
      AND [MEMBER_TYPE] NOT IN (SELECT [MEMBER_TYPE] FROM [dbo].[Member_Types])
GO

--> Adding BODs to ObjectMetaData to support 5 new Panel Editor iPart instances on the MyAccount page on the i15 MBR site
-- CsContact BOD
IF NOT EXISTS (SELECT 1 FROM ObjectMetaData WHERE ObjectName = 'CsContact')
BEGIN
      INSERT INTO ObjectMetaData(ObjectName, RelatedToEntity, IsUserDefined, IsMultiInstance)
      VALUES ('CsContact','Party',0,0)
END
GO
-- CsNameFin BOD
IF NOT EXISTS (SELECT 1 FROM ObjectMetaData WHERE ObjectName = 'CsNameFin')
BEGIN
      INSERT INTO ObjectMetaData(ObjectName, RelatedToEntity, IsUserDefined, IsMultiInstance)
      VALUES ('CsNameFin','Party',0,0)
END
GO

--> Delete these 5 panels then recreate below with new panel XML definitions
DELETE FROM	PanelDefinition WHERE Name IN ('PersonalInformation','Preferences','Membership','Financial','VAT')

--> Adding PanelDefinition data to support 5 new Panel Editor iPart instances on the My Account page on the i15 MBR site
-- PersonalInformation Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'PersonalInformation')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('E64DD2C5-71C9-485C-9671-8CC0852C9E9E','PersonalInformation','','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>PersonalInformation</Name><PanelDefinitionId>e64dd2c5-71c9-485c-9671-8cc0852c9e9e</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>PersonalInformation</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Work phone</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>WorkPhone</PropertyName></PanelFieldData><PanelFieldData><Caption>Home phone</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>HomePhone</PropertyName></PanelFieldData><PanelFieldData><Caption>Fax</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Fax</PropertyName></PanelFieldData><PanelFieldData><Caption>Toll free</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TollFree</PropertyName></PanelFieldData><PanelFieldData><Caption>Email</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Email</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>Functional title</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FunctionalTitle</PropertyName></PanelFieldData><PanelFieldData><Caption>Date of birth</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BirthDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Gender</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Gender</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO
-- Preferences Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'Preferences')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('1FEC7D36-2271-4DD9-979D-2AD4B8920E1A','Preferences','Preferences','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Preferences</Description><Name>Preferences</Name><PanelDefinitionId>1fec7d36-2271-4dd9-979d-2ad4b8920e1a</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Preferences</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Exclude directory</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ExcludeDirectory</PropertyName></PanelFieldData><PanelFieldData><Caption>Exclude mail</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ExcludeMail</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO
-- Membership Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'Membership')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('FBEE0A7C-FD89-49E4-BCFC-7AEECA33653E','Membership','Membership','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Membership</Description><Name>Membership</Name><PanelDefinitionId>fbee0a7c-fd89-49e4-bcfc-7aeeca33653e</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Membership</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>iMIS ID</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Member type</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>MemberType</PropertyName></PanelFieldData><PanelFieldData><Caption>Billing category</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Category</PropertyName></PanelFieldData><PanelFieldData><Caption>Chapter</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Chapter</PropertyName></PanelFieldData><PanelFieldData><Caption>Renewed</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>MemberStatusDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Last updated by</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>UpdatedBy</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Major key</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>MajorKey</PropertyName></PanelFieldData><PanelFieldData><Caption>Status</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Status</PropertyName></PanelFieldData><PanelFieldData><Caption>Paid through</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PaidThrough</PropertyName></PanelFieldData><PanelFieldData><Caption>Member since</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>JoinDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Last update</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LastUpdated</PropertyName></PanelFieldData><PanelFieldData><Caption>Date added</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DateAdded</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO
-- Financial Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'Financial')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('28C05F2C-24CB-48F4-8CC7-05D7DAFBC665','Financial','Financial','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Financial</Description><Name>Financial</Name><PanelDefinitionId>28c05f2c-24cb-48f4-8cc7-05d7dafbc665</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Financial</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>No statements</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>NO_STATEMENTS</PropertyName></PanelFieldData><PanelFieldData><Caption>Default tax</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TAX_AUTHOR_DEFAULT</PropertyName></PanelFieldData><PanelFieldData><Caption>Tax exempt</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TAX_EXEMPT</PropertyName></PanelFieldData><PanelFieldData><Caption>Credit limit</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CREDIT_LIMIT</PropertyName></PanelFieldData><PanelFieldData><Caption>Renewed through</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>RENEWED_THRU</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Default terms code</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TERMS_CODE</PropertyName></PanelFieldData><PanelFieldData><Caption>Bill to ID</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BT_ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Renew months</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>RENEW_MONTHS</PropertyName></PanelFieldData><PanelFieldData><Caption>Backorders</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BACKORDERS</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsNameFin</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO
-- VAT Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'VAT')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('CC27E180-341B-4FBB-BDB3-05E112896490','VAT','','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>VAT</Name><PanelDefinitionId>cc27e180-341b-4fbb-bdb3-05e112896490</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>VAT</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>VAT exempt</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>USE_VAT_TAXATION</PropertyName></PanelFieldData><PanelFieldData><Caption>VAT reg number</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>VAT_REG_NUMBER</PropertyName></PanelFieldData><PanelFieldData><Caption>VAT country</Caption><EntityName>CsNameFin</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>VAT_COUNTRY</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsNameFin</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO

--> Adding PanelDefinition data to support new Call History Panel Editor iPart instance on the My Account page on the i15 MBR site
-- Call History Panel Definition
IF NOT EXISTS (SELECT 1 FROM PanelDefinition WHERE Name = 'CallHistory')
BEGIN
      INSERT INTO PanelDefinition(PanelDefinitionId, Name, [Description], RelatedEntityName, SerializedPanelDefinition)
      VALUES ('A0A867C2-7A69-4897-8AD3-B45F8E4FC915','CallHistory','Contact call history panel','Party','<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Contact call history panel</Description><Name>CallHistory</Name><PanelDefinitionId>a0a867c2-7a69-4897-8ad3-b45f8e4fc915</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>CallHistory</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Transaction Date</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TRANSACTION_DATE</PropertyName></PanelFieldData><PanelFieldData><Caption>Assigned to</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SOURCE_CODE</PropertyName></PanelFieldData><PanelFieldData><Caption>Action(s)</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ACTION_CODES</PropertyName></PanelFieldData><PanelFieldData><Caption>Note</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>NOTE</PropertyName></PanelFieldData><PanelFieldData><Caption>Follow Up Date</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TICKLER_DATE</PropertyName></PanelFieldData><PanelFieldData><Caption>Follow Up</Caption><EntityName>Activity-CALL</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>NOTE_2</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Activity-CALL</a:string></SelectedEntityNames></PanelDefinitionData>')
END
GO


--> Cleanup possible data corruption caused by missing logic in the name trigger
DECLARE @instituteTypeKey uniqueidentifier
DECLARE @individualTypeKey uniqueidentifier
SELECT @instituteTypeKey = [ContactTypeKey] FROM [dbo].[ContactTypeRef] WHERE [ContactTypeDesc] = 'Company'
SELECT @individualTypeKey = [ContactTypeKey] FROM [dbo].[ContactTypeRef] WHERE [IsInstitute] = 0
    
UPDATE [dbo].[ContactMain] SET [ContactTypeKey] = @individualTypeKey 
WHERE [IsInstitute] = 0 AND [ContactTypeKey] = @instituteTypeKey

UPDATE [dbo].[ContactMain] SET [ContactTypeKey] = @instituteTypeKey 
WHERE [IsInstitute] = 1 AND [ContactTypeKey] = @individualTypeKey
GO

-- add missing Australian state/provinces
IF NOT EXISTS (SELECT 1 FROM [dbo].[StateProvinceRef] WHERE [StateProvinceCode] = 'NT' AND [CountryCode] = 'AU')
BEGIN
    DECLARE @now datetime
    DECLARE @creatorKey uniqueidentifier

    SET @now = GETDATE()
    SELECT @creatorKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    INSERT INTO StateProvinceRef (StateProvinceCode, CountryCode, StateProvinceDesc, ChapterGroupKey, 
                                  IsActive, IsHandModified, UpdatedByUserKey, UpdatedOn)
    VALUES ('NT', 'AU', 'Northern Territory', NULL,
             1, 0, @creatorKey, @now)
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[StateProvinceRef] WHERE [StateProvinceCode] = 'WA' AND [CountryCode] = 'AU')
BEGIN
    DECLARE @now datetime
    DECLARE @creatorKey uniqueidentifier

    SET @now = GETDATE()
    SELECT @creatorKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    INSERT INTO StateProvinceRef (StateProvinceCode, CountryCode, StateProvinceDesc, ChapterGroupKey, 
                                  IsActive, IsHandModified, UpdatedByUserKey, UpdatedOn)
    VALUES ('WA', 'AU', 'Western Australia', NULL,
             1, 0, @creatorKey, @now)
END
GO

    -- Update the Individual record portion of a combo record
    UPDATE i
       SET PrefixCode = c.PrefixCode,
           SuffixCode = d.SuffixCode,
           FirstName = a.FIRST_NAME,
           MiddleName = a.MIDDLE_NAME,
           LastName = a.LAST_NAME,
           Designation = a.DESIGNATION,
           Informal = a.INFORMAL,
           Gender = a.GENDER,
           BirthDate = a.BIRTH_DATE,
           PrimaryInstituteName = a.COMPANY,
           PrimaryInstituteTitle = a.TITLE,
           PrimaryInstituteContactKey = e.ContactKey
      FROM Name a
           INNER JOIN ContactMain cm ON a.ID = cm.SyncContactID AND cm.IsInstitute = 0
           INNER JOIN Individual i ON cm.ContactKey = i.ContactKey
           INNER JOIN ContactMain inst ON a.ID = cm.SyncContactID AND cm.IsInstitute = 1 AND cm.UpdatedOn < inst.UpdatedOn
           LEFT OUTER JOIN PrefixRef c ON a.PREFIX = c.PrefixCode
           LEFT OUTER JOIN SuffixRef d ON a.SUFFIX = d.SuffixCode
           LEFT OUTER JOIN ContactMain e ON a.COMPANY = e.FullName AND e.IsInstitute = 1
    GO

    -- Update the P ID record in ContactMain for combo records
    -- This may be out of sync due to a previous bug
    UPDATE ind
       SET ContactStatusCode = inst.ContactStatusCode,
           UpdatedByUserKey = inst.UpdatedByUserKey,
           UpdatedOn = inst.UpdatedOn,
           FullName = n.FULL_NAME,
           SortName = n.LAST_FIRST,
           NoSolicitationFlag = n.EXCLUDE_MAIL
      FROM [dbo].[ContactMain] ind 
           INNER JOIN [dbo].[ContactMain] inst ON ind.[SyncContactID] = inst.[SyncContactID]
           INNER JOIN [dbo].[Name] n ON ind.[SyncContactID] = n.[ID]
     WHERE ind.[IsInstitute] = 0
           AND inst.[IsInstitute] = 1 AND ind.UpdatedOn < inst.UpdatedOn
    GO



--------------------------------------------------------------------------------------------------------------------------
-- PBI 27827 Add product types to support Join Now
-- This script populates the Product_Type table with Product Types for each of the Billing Item Sets that don't 
-- already exist (i.e., CHAPT, SEC, SUB, VOL, and MISC). This is not intended to generate new Activity Types for 
-- actual Activity Records that will be created. But, rather, is to allow for easy configuration of the Title 
-- displayed in the General Product Display iPart
--------------------------------------------------------------------------------------------------------------------------

-- First, disable the Triggers on Product_Type
DISABLE TRIGGER ALL ON [dbo].[Product_Type]
GO

-- Insert the MEMBERSHIP Product Type into the Product_Type table
IF NOT EXISTS (SELECT 1 FROM [dbo].[Product_Type] WHERE PROD_TYPE = 'MEMBERSHIP' )
BEGIN
INSERT INTO [dbo].[Product_Type] ([PROD_TYPE], [DESCRIPTION]) 
VALUES ('MEMBERSHIP','Membership')
END

GO

-- Insert the other new Product Types into the Product_Type table (if not already there)
INSERT Product_Type(PROD_TYPE
           ,DESCRIPTION
           ,SALES_ITEM
           ,DUES_SUB_ITEM
           ,PROFILE_SORT
           ,SUBTYPE_PROMPT
           ,DESCRIPTION_PROMPT
           ,EFF_DATE_PROMPT
           ,THRU_DATE_PROMPT
           ,SOURCE_PROMPT
           ,AMOUNT_PROMPT
           ,TICKLER_PROMPT
           ,ACTION_PROMPT
           ,CEU_TYPE_PROMPT
           ,UNITS_PROMPT
           ,USER_EDIT
           ,RETAIN_MONTHS
           ,FOLLOW_UP_PROMPT
           ,NOTE_PROMPT
           ,EXTENDED_DEMO
           ,UF_1_PROMPT
           ,UF_2_PROMPT
           ,UF_3_PROMPT
           ,UF_4_PROMPT
           ,UF_5_PROMPT
           ,UF_6_PROMPT
           ,UF_7_PROMPT
           ,CO_ID_PROMPT
           ,OTHER_CODE_PROMPT
           ,ACCESS_KEYWORDS
           ,CREATE_HISTORY_TAB
           ,HISTORY_TAB_TITLE)
SELECT  ndt.ProductType AS PROD_TYPE,
        ndt.ProductTypeDescription AS DESCRIPTION,
        0 AS SALES_ITEM,
        1 AS DUES_SUB_ITEM,
        2 AS PROFILE_SORT,
        '' AS SUBTYPE_PROMPT,
        'Type' AS DESCRIPTION_PROMPT,
        'Begin Date' AS EFF_DATE_PROMPT,
        'Thru' AS THRU_DATE_PROMPT,
        '' AS SOURCE_PROMPT,
        'Amount' AS AMOUNT_PROMPT,
        '' AS TICKLER_PROMPT,
        '' AS ACTION_PROMPT,
        '' AS CEU_TYPE_PROMPT,
        '' AS UNITS_PROMPT,
        0 AS USER_EDIT,
        36 AS RETAIN_MONTHS,
        '' AS FOLLOW_UP_PROMPT,
        '' AS NOTE_PROMPT,
        0 AS EXTENDED_DMO,
        '' AS UF_1_PROMPT,
        '' AS UF_2_PROMPT,
        '' AS UF_3_PROMPT,
        '' AS UF_4_PROMPT,
        '' AS UF_5_PROMPT,
        '' AS UF_6_PROMPT,
        '' AS UF_7_PROMPT,
        '' AS CO_ID_PROMPT,
        '' AS OTHER_CODE_PROMPT,
        '' AS ACCESS_KEYWORDS,
        0 AS CREATE_HISTORY_TAB,
        '' AS HISTORY_TAB_TITLE
FROM (SELECT MAX(p.PROD_TYPE) as ProductType,
CASE
  WHEN p.PROD_TYPE = 'CHAPT' THEN 'Chapter Membership Fees'
  WHEN p.PROD_TYPE = 'SEC' THEN 'Optional Sections'
  WHEN p.PROD_TYPE = 'SUB' THEN 'Subscriptions and Journals'
  WHEN p.PROD_TYPE = 'VOL' THEN 'Voluntary Contributions'
  WHEN p.PROD_TYPE = 'MISC' THEN 'Miscellaneous Items'
  ELSE ' '
END as ProductTypeDescription
FROM [dbo].[Product] p
WHERE p.PROD_TYPE in ('CHAPT','SEC','SUB','VOL','MISC')
AND NOT EXISTS (SELECT 1 FROM [dbo].[Product_Type] t WHERE t.PROD_TYPE = p.PROD_TYPE )
GROUP BY p.PROD_TYPE) ndt 

GO

-- Now, re-enable the triggers for Product_Type
ENABLE TRIGGER ALL ON [dbo].[Product_Type]

GO

--Enable the DUES, MEETINGS, FUNDR, FUNDRAISING license keys for CsOrders, CsOrderLines, CSOrderType, and CsOrderHistory business objects.  
--NOTE: FUNDR and FUNDRAISING are synonymous as they share the same LicenseKey in LicenseLegacyMap.
--MEETINGS
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = 'E3AB636F-D90E-49A1-AADA-0AB6435C86F9' AND UniformKey = '3A36B62F-35EC-4075-9438-9FFF064643EA')
BEGIN
    INSERT INTO [UniformLicense] VALUES('E3AB636F-D90E-49A1-AADA-0AB6435C86F9','3A36B62F-35EC-4075-9438-9FFF064643EA') --CsOrderHistory
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = 'E3AB636F-D90E-49A1-AADA-0AB6435C86F9' AND UniformKey = '3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F')
BEGIN
    INSERT INTO [UniformLicense] VALUES('E3AB636F-D90E-49A1-AADA-0AB6435C86F9','3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F') --CsOrderLines
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = 'E3AB636F-D90E-49A1-AADA-0AB6435C86F9' AND UniformKey = 'ED3960C9-6BD0-4535-9F22-CAAC7EF55302')
BEGIN
    INSERT INTO [UniformLicense] VALUES('E3AB636F-D90E-49A1-AADA-0AB6435C86F9','ED3960C9-6BD0-4535-9F22-CAAC7EF55302') --CsOrders
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = 'E3AB636F-D90E-49A1-AADA-0AB6435C86F9' AND UniformKey = 'AD7B60A4-C432-4996-9BC4-A2A029F50EE6')
BEGIN
    INSERT INTO [UniformLicense] VALUES('E3AB636F-D90E-49A1-AADA-0AB6435C86F9','AD7B60A4-C432-4996-9BC4-A2A029F50EE6') --CsOrderType
END
GO
--DUES
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '34D1022D-0B24-4F69-9023-63CA297F8D9C' AND UniformKey = '3A36B62F-35EC-4075-9438-9FFF064643EA')
BEGIN
    INSERT INTO [UniformLicense] VALUES('34D1022D-0B24-4F69-9023-63CA297F8D9C','3A36B62F-35EC-4075-9438-9FFF064643EA') --CsOrderHistory
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '34D1022D-0B24-4F69-9023-63CA297F8D9C' AND UniformKey = '3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F')
BEGIN
    INSERT INTO [UniformLicense] VALUES('34D1022D-0B24-4F69-9023-63CA297F8D9C','3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F') --CsOrderLines
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '34D1022D-0B24-4F69-9023-63CA297F8D9C' AND UniformKey = 'ED3960C9-6BD0-4535-9F22-CAAC7EF55302')
BEGIN
    INSERT INTO [UniformLicense] VALUES('34D1022D-0B24-4F69-9023-63CA297F8D9C','ED3960C9-6BD0-4535-9F22-CAAC7EF55302') --CsOrders
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '34D1022D-0B24-4F69-9023-63CA297F8D9C' AND UniformKey = 'AD7B60A4-C432-4996-9BC4-A2A029F50EE6')
BEGIN
    INSERT INTO [UniformLicense] VALUES('34D1022D-0B24-4F69-9023-63CA297F8D9C','AD7B60A4-C432-4996-9BC4-A2A029F50EE6') --CsOrderType
END
GO
--FUNDRAISING/FUNDR
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND UniformKey = '3A36B62F-35EC-4075-9438-9FFF064643EA')
BEGIN
    INSERT INTO [UniformLicense] VALUES('0B332C8A-FF57-4F59-96EF-68551A699E18','3A36B62F-35EC-4075-9438-9FFF064643EA') --CsOrderHistory
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND UniformKey = '3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F')
BEGIN
    INSERT INTO [UniformLicense] VALUES('0B332C8A-FF57-4F59-96EF-68551A699E18','3ACAA99D-7EB5-4C83-92CB-293CA74D2D5F') --CsOrderLines
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND UniformKey = 'ED3960C9-6BD0-4535-9F22-CAAC7EF55302')
BEGIN
    INSERT INTO [UniformLicense] VALUES('0B332C8A-FF57-4F59-96EF-68551A699E18','ED3960C9-6BD0-4535-9F22-CAAC7EF55302') --CsOrders
END
GO
IF NOT EXISTS (SELECT 1 FROM [UniformLicense] WHERE LicenseKey = '0B332C8A-FF57-4F59-96EF-68551A699E18' AND UniformKey = 'AD7B60A4-C432-4996-9BC4-A2A029F50EE6')
BEGIN
    INSERT INTO [UniformLicense] VALUES('0B332C8A-FF57-4F59-96EF-68551A699E18','AD7B60A4-C432-4996-9BC4-A2A029F50EE6') --CsOrderType
END
GO


-- Clean up freight and handling that may have gotten out of sync
UPDATE [dbo].[Orders] SET [FREIGHT_1] = [FREIGHT_1] + [FREIGHT_2], [FREIGHT_2] = 0 WHERE [AUTO_CALC_FREIGHT] = 0 AND [FREIGHT_2] <> 0
UPDATE [dbo].[Orders] SET [FREIGHT_2] = [FREIGHT_1] + [FREIGHT_2], [FREIGHT_1] = 0 WHERE [AUTO_CALC_FREIGHT] = 1 AND [FREIGHT_1] <> 0
UPDATE [dbo].[Orders] SET [HANDLING_1] = [HANDLING_1] + [HANDLING_2], [HANDLING_2] = 0 WHERE [AUTO_CALC_HANDLING] = 0 AND [HANDLING_2] <> 0
UPDATE [dbo].[Orders] SET [HANDLING_2] = [HANDLING_1] + [HANDLING_2], [HANDLING_1] = 0 WHERE [AUTO_CALC_HANDLING] = 1 AND [HANDLING_1] <> 0
GO


----------------------------------------------------------------------------
-- Reduce default contact salutations and remove unneeded salutation entries
----------------------------------------------------------------------------
DECLARE @salutationKey uniqueidentifier
SELECT @salutationKey = SalutationKey FROM SalutationRef WHERE SalutationDesc = 'Formal'
UPDATE SalutationRef SET AutoCreateFlag = 0 WHERE SalutationKey <> @salutationKey
DELETE FROM ContactSalutation WHERE SalutationKey <> @salutationKey
GO

------------------------------------------------------------------------------
-- SBT 28350 - Add individual records for combo records where they are missing
------------------------------------------------------------------------------
EXEC dbo.asi_SyncNetContacts
GO

------------------------------------------------------------------------------
-- PBI 29073 - Make root content folder non-system
------------------------------------------------------------------------------
UPDATE [dbo].[DocumentMain] SET [IsSystem]=0 WHERE [DocumentVersionKey]='925EF7AE-CAE2-41C3-BB4D-B13C17EBD928' AND [DocumentStatusCode] = 40
GO

------------------------------------------------------------------------------
-- PBI 30340 - Add CsContactController to make sure edits to CsContact via
-- the Panel Editor use iBO.NET
------------------------------------------------------------------------------
DECLARE @componentKey uniqueidentifier
SET @componentKey = '9CBA854C-D749-48B9-9D3A-8D801313B31C' -- 'generated component key'    
IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [Name] = 'CsContact'
               AND [InterfaceName] = 'BusinessController')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName],
                                           [TypeName], [AssemblyName], [IsTyped], [IsBusinessItem])
    VALUES (@componentKey, 'CsContact', 'CsContact Controller', 'BusinessController',
            'Asi.Business.Contact.V10.CsContactController', 'Asi.Business.Contact.V10', 1, 1)
END
ELSE
BEGIN
    UPDATE [dbo].[ComponentRegistry] SET [TypeName] = 'Asi.Business.Contact.V10.CsContactController',
                                         [AssemblyName] = 'Asi.Business.Contact.V10',
                                         [IsTyped] = 1, [IsBusinessItem] = 1
    WHERE [Name] = 'CsContact' AND [InterfaceName] = 'BusinessController'
END
GO

----Add BODs to ObjectMetadata table used in 'Profile' & 'DonorData'panel definitions
IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'Profile_Page') 
BEGIN
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('Profile_Page', 'Party', 1, 0) 
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'CsName_Staff') 
BEGIN
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('CsName_Staff', 'Party', 0, 0) 
END
ELSE
BEGIN
    UPDATE [dbo].[ObjectMetaData] SET [IsUserDefined] = 0 WHERE [ObjectName] = 'CsName_Staff'
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'FundraisingProfileDonorData') 
BEGIN
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('FundraisingProfileDonorData', 'Party', 0, 0) 
END
GO

---- Add Contact_Profile_Page Panel definition used in contact profile
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Contact_Profile_Page') 
BEGIN
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('36E47F1C-BB0E-4536-999F-88021ACC087C', 'Contact_Profile_Page', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Contact_Profile_Page</Name><PanelDefinitionId>36e47f1c-bb0e-4536-999f-88021acc087c</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Contact_Profile_Page</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Current Position</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CurrentPosition</PropertyName></PanelFieldData><PanelFieldData><Caption>Past Experience</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PastExperience</PropertyName></PanelFieldData><PanelFieldData><Caption>Education</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Education</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>LinkedIn</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LinkedIn</PropertyName></PanelFieldData><PanelFieldData><Caption>Facebook</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Facebook</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
END
GO

----Add Organization_Profile_Page Panel definition used in org profile
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Organization_Profile_Page') 
BEGIN
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('A27EA058-2C88-4227-99C4-9723B93B2D86', 'Organization_Profile_Page', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Organization_Profile_Page</Name><PanelDefinitionId>a27ea058-2c88-4227-99c4-9723b93b2d86</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Organization_Profile_Page</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Type</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Type</PropertyName></PanelFieldData><PanelFieldData><Caption>Company Size</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CompanySize</PropertyName></PanelFieldData><PanelFieldData><Caption>Founded</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Founded</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>LinkedIn</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LinkedIn</PropertyName></PanelFieldData><PanelFieldData><Caption>Facebook</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Facebook</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
END
GO

--Update Donor Data panel definition
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'DonorData') 
BEGIN
    UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition]='<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>DonorData</Description><Name>DonorData</Name><PanelDefinitionId>503ca4f2-5b4e-437f-ab3b-baf5bc3b09e6</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorData</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Do not phone</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_PHONE</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not email</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_EMAIL</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not sell name</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SELL</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a volunteer</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IS_VOLUNTEER</PropertyName></PanelFieldData><PanelFieldData><Caption>Hours per week</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>HOURS_PER_WEEK</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Do not solicit</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SOLICIT</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt interval</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData><PanelFieldData><Caption>Moves manager</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SOLICITOR_ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a moves manager</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IS_SALESMAN</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>FundraisingProfileDonorData</a:string><a:string>CsName_Staff</a:string></SelectedEntityNames></PanelDefinitionData>' 
    WHERE [Name] = 'DonorData' 
END
GO

--Or create Donor Data definition if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'DonorData') 
BEGIN
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('503CA4F2-5B4E-437F-AB3B-BAF5BC3B09E6', 'DonorData', 'DonorData', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>DonorData</Description><Name>DonorData</Name><PanelDefinitionId>503ca4f2-5b4e-437f-ab3b-baf5bc3b09e6</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorData</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Do not phone</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_PHONE</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not email</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_EMAIL</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not sell name</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SELL</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a volunteer</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IS_VOLUNTEER</PropertyName></PanelFieldData><PanelFieldData><Caption>Hours per week</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>HOURS_PER_WEEK</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Do not solicit</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SOLICIT</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt interval</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData><PanelFieldData><Caption>Moves manager</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SOLICITOR_ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a moves manager</Caption><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IS_SALESMAN</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>FundraisingProfileDonorData</a:string><a:string>CsName_Staff</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
END
GO

-- Add "DonorProfile" Panel Definition 
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'DonorProfile') 
BEGIN
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('14E63BD1-EBAA-45CE-B750-06AF5814B2C7', 'DonorProfile', 'Member information for the donor account pages', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Member information for the donor account pages</Description><Name>DonorProfile</Name><PanelDefinitionId>14e63bd1-ebaa-45ce-b750-06af5814b2c7</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorProfile</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Full Name</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FullName</PropertyName></PanelFieldData><PanelFieldData><Caption>Full Address</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FullAddress</PropertyName></PanelFieldData><PanelFieldData><Caption>LinkedIn</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>LinkedIn</PropertyName></PanelFieldData><PanelFieldData><Caption>Delivery Preference</Caption><EntityName>Name_FRProfile</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Deliv_Pref</PropertyName></PanelFieldData><PanelFieldData><Caption>Do Not Phone</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_PHONE</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>Facebook</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Facebook</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt _ Interval</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData><PanelFieldData><Caption>Do Not Email</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_EMAIL</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>CsContact</a:string><a:string>FundraisingProfileDonorData</a:string><a:string>Name_FRProfile</a:string></SelectedEntityNames></PanelDefinitionData>'); 
END
GO

-- PBI23002 FaceBook and twitter 
IF NOT EXISTS (SELECT 1 FROM [dbo].[ExternalNetwork] WHERE [ExternalNetworkId] = '83678141-860B-4093-A58E-C9CB6DB459DB')
BEGIN
    INSERT INTO [dbo].[ExternalNetwork] 
    VALUES('83678141-860B-4093-A58E-C9CB6DB459DB','Facebook','http://www.facebook.com','http://www.facebook.com/srch.php');
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[ExternalNetwork] WHERE [ExternalNetworkId] = '7373766E-102B-434F-86E3-B172A81C2AED')
BEGIN
    INSERT INTO [dbo].[ExternalNetwork] 
    VALUES('7373766E-102B-434F-86E3-B172A81C2AED','Twitter','https://twitter.com','https://twitter.com/search/');
END

-- PBI23002 metadata needed for BO 
IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE ObjectName = 'IndividualExternalNetworks')
BEGIN
    INSERT INTO [dbo].[ObjectMetaData] (ObjectName, RelatedToEntity, IsUserDefined, IsMultiInstance) 
    VALUES ('IndividualExternalNetworks', 'Party', 0, 0)
END
GO

-- Update fundraising and gift history information
-- -- 2013-04-22 JHS 
-- -- Skipping this step to avoid issues on upgrading FR databases. 
-- -- Note that this will leave the new GiftHistorySummary table unpopulated.
--EXEC dbo.asi_RecalculateGiftHistorySummary @RebuildAll = 1
--GO

-----------------------------------------------------------------------------
-- BUG 31423 - Lower ACL restriction on navigation with module authorization
--   it will now be anded with module authorization instead of ored
-----------------------------------------------------------------------------
UPDATE [dbo].[DocumentMain] SET [AccessKey] = '00000000-0000-0000-CA00-000000000CA1' 
WHERE [DocumentTypeCode] = 'NAV' 
AND   [DocumentStatusCode] = 40 
AND   [AccessKey] IN ('00000000-0000-0000-CA00-000000000CF1' ,'00000000-0000-0000-CA00-000000000A01') -- full staff or administrators
-- this next piece parses the blob contents to identify whether any legacy security roles are defined
AND CONVERT(VARCHAR(MAX),CONVERT(VARBINARY(MAX), [Blob])) LIKE '%<LegacySecurityRoles xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>%' 

----------------------------------------------
-- Update shortcuts to the new iCore location
----------------------------------------------

-- All Websites, Member and Mobile Add Contact
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/SimpleAccountCreator', TargetDocumentVersionKey = '78b79c30-5044-4ecc-aa0b-162e87383c04' 
WHERE URLMappingKey IN ('F249B8B9-190B-47A6-8B79-3C6CF7C90E96','C61DA557-8FDD-4241-AE6A-A1B4E378CF57','49632193-6272-4BB8-8B77-8C9F6983DF3B')
AND URL = '@/iMIS/ContactManagement/SimpleAccountCreator' AND TargetDocumentVersionKey = 'F3B3A6B5-CC30-453D-892F-DC447233728C'

-- All Websites and Member Cart
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Store/StoreLayouts/Cart_Home', TargetDocumentVersionKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086' 
WHERE URLMappingKey IN ('3622779E-C473-410C-99F9-88DBB69009E8','BD86BD93-75BA-4F03-82EA-3DD596E03361')
AND URL = '@/iMIS/Store/StoreLayouts/Cart_Home' AND TargetDocumentVersionKey = 'A216D586-A0E4-452F-BA9F-C33107029964'

-- All Websites and Member Create Account
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/CreateAccount', TargetDocumentVersionKey = '6606964d-abde-4159-98dd-11acec31d83a' 
WHERE URLMappingKey IN ('C6293753-51F7-4F78-A148-37837FE25F87','382D192F-E59B-42AD-BC61-A9DEDF1B4B7F')
AND URL = '@/iMIS/ContactManagement/CreateAccount' AND TargetDocumentVersionKey = '94C4820C-B449-411A-ACDD-D37A5A41C60A'

-- Member Mobile Create Account
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/Create_Account', TargetDocumentVersionKey = '0C1D07CC-FDB2-40B0-8C2A-1BAAD1A37076' 
WHERE URLMappingKey = '87BF7CE6-BF48-43CD-A081-3B8420C8809D'

-- All Websites and Member EventDetail
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Events/Event_Display', TargetDocumentVersionKey = '7aaa2571-9e50-4473-b894-1174ec66d004' 
WHERE URLMappingKey IN ('6AB0CAC2-B30C-4931-B0E5-695980DA175A','F86EDF52-809A-4B41-ABCB-9B47967EF3EA')
AND URL = '@/iMIS/Events/Event_Display' AND TargetDocumentVersionKey = 'ADEC52B4-232A-4598-859D-2CBC08268804'

-- Member Mobile EventDetail
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Event_Display', TargetDocumentVersionKey = '4C20C6BC-4B35-41C9-8A5E-9F4A2C2726F3' 
WHERE URLMappingKey = 'B0133811-7A15-49D0-AC22-7BEBEEBC17BD'

-- All Websites and Member FullAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', TargetDocumentVersionKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423' 
WHERE URLMappingKey IN ('2F5E940E-32AF-4449-BAC1-BC82DFED54EB','3F49BFAD-FEB6-4EE7-8178-838A8FA03A6A')
AND URL = '@/iMIS/ContactManagement/ContactLayouts/Account_Page_Staff' AND TargetDocumentVersionKey = 'B28C6860-08F8-458C-A887-B91CEB252C5E'

-- All Websites, Member and Mobile FunctionDetail
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Events/Function_Display', TargetDocumentVersionKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8' 
WHERE URLMappingKey IN ('12968E64-FADA-472A-8701-BD1FC52460C1','E479D10C-21C6-4D6A-A586-60098123A111','60F5D5B4-AA97-454B-AE68-C31BF7250AB9')
AND URL = '@/iMIS/Events/Function_Display' AND TargetDocumentVersionKey = 'A7C64460-A8B3-4D5B-BDBB-2CDAB224B8A0'

-- All Websites, Member and Mobile GiftDetail
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Fundraising/Gift_Detail', TargetDocumentVersionKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c' 
WHERE URLMappingKey IN ('1094D687-1C5B-45DB-BC5A-06E737472291','7FCD378A-8065-4770-806D-A9F44725A9E1','6178B22F-3205-48C8-9741-58A696ED3C2E')
AND URL = '@/iMIS/Fundraising/Gift_Detail' AND TargetDocumentVersionKey = '4FCDEA62-C309-4021-9192-C6D3CFD2DA3A'

-- All Websites GiveNow
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Fundraising/Donate_Now', TargetDocumentVersionKey = '991d8973-6ade-4ac5-aef3-c34945a8641a' 
WHERE URLMappingKey = '633C6F74-B7DC-4AFD-8308-846B43F427CC'
AND URL = '@/iCore/Fundraising/Donate_Now' AND TargetDocumentVersionKey = 'B47025FC-E427-459D-9D0F-814AE0ECDB8F'

-- All Websites, Member and Mobile ItemDetail
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Store/StoreLayouts/Item_Detail', TargetDocumentVersionKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af' 
WHERE URLMappingKey IN ('E6CF5AD7-38B4-4239-946E-26145BC99911','553BE1ED-C824-4070-B970-37961C2ADB55','A3D563E5-0FB1-4978-94AB-A5A484913B86')
AND URL = '@/iMIS/Store/StoreLayouts/Item_Detail' AND TargetDocumentVersionKey = '8D9A36AC-E4BF-405D-BEF6-509E77728C78'

-- All Websites and Member MemberHome (only the URL was wrong)
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Member/MemberHome'
WHERE URLMappingKey IN ('8708B97D-EB7C-4441-94C1-653B1D2956E1','D0E292B7-7B83-4066-A491-62EBAFA0E583')
AND URL = '@/Member/MemberHome' AND TargetDocumentVersionKey = '6B014AAF-790E-4999-9B5F-7FCC9E71F65F'

-- All Websites and Member MyAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/ContactLayouts/AccountPage', TargetDocumentVersionKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9' 
WHERE URLMappingKey IN ('ED4C3B18-149A-4051-92DF-6409281A558A','37A77887-D4E2-4B61-9ED0-AF8414CBA927')
AND URL = '@/iMIS/ContactManagement/ContactLayouts/AccountPage' AND TargetDocumentVersionKey = '5A590900-E45D-40A6-BD8E-2A94548599A6'

-- Member Mobile MyAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/My Account', TargetDocumentVersionKey = '2B7E0AE5-F207-49A0-9215-1013627C490A' 
WHERE URLMappingKey = 'FF26025D-0C48-4C27-9719-E2A4A6C27C22'

-- All Websites and Member Organization
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', TargetDocumentVersionKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5' 
WHERE URLMappingKey IN ('42850316-3E88-418D-AC1E-7D9524E53DA2','EB956B52-6658-4855-A4E8-6DACDA84F607')
AND URL = '@/iMIS/ContactManagement/OrganizationLayouts/Organization_Profile' AND TargetDocumentVersionKey = '277F6075-6D75-4054-BAA7-51F54C3505E6'

-- All Websites and Member OrganizationAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/OrganizationLayouts/Account_Page', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001' 
WHERE URLMappingKey IN ('5576D388-7AD5-4CB1-BA29-055DF4FE3A1B','2666E59D-672F-4BE9-8911-A67870F4D9B6')
AND URL = '@/iMIS/ContactManagement/OrganizationLayouts/Account_Page' AND TargetDocumentVersionKey = '290CEB93-39F7-4F6B-A5B7-7820BE270AC3'

-- All Websites, Member and Mobile ProductDisplay
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Store/Product_Display', TargetDocumentVersionKey = '6066a460-b09a-444d-91e7-93e98db225d4' 
WHERE URLMappingKey IN ('FA83859C-EDC5-413F-876F-B8F499610395','39CA65C5-F7F6-403A-9482-FE237CA0029E','B1D775A3-B133-4275-A5F3-4AFBE09C856C')
AND URL = '@/iMIS/Store/Product_Display' AND TargetDocumentVersionKey = '53ACDE64-6496-4ECE-8938-D630827425EF'

-- All Websites and Member Profile
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/ContactLayouts/Profile', TargetDocumentVersionKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd' 
WHERE URLMappingKey IN ('1D83C348-DA2B-4C29-B6E8-F4DA47B9850E','E7608AC3-FF4D-40B3-97DE-4F97410091AD')
AND URL = '@/iMIS/ContactManagement/ContactLayouts/Profile' AND TargetDocumentVersionKey = '20A4D3F2-951D-4367-925B-620610DB1DC2'

-- All Websites and Member SignIn
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/Sign_In', TargetDocumentVersionKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a' 
WHERE URLMappingKey IN ('2974407E-23FE-4B11-831E-B7CD079C64CD','A76B7991-DBF9-41F6-84B7-1773DBFB4EB6')
AND URL = '@/iMIS/ContactManagement/Sign_In' AND TargetDocumentVersionKey = 'BC4DB1CC-B613-42F5-8CF5-15DE352D3C8A'

-- Member Mobile SignIn
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/Sign_In', TargetDocumentVersionKey = '7809FB90-F560-462F-8355-E9A1DE3D0C63' 
WHERE URLMappingKey = '989C9068-7D38-42BB-BE0C-0BE137D70D16'

-- All Websites, Member and Mobile SignInCreateAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/Create_Account_no_Sign_In', TargetDocumentVersionKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363' 
WHERE URLMappingKey IN ('565ABC73-BBE2-4559-9101-779B41E8950F','CB08407F-407B-46E7-9889-6B9CAA20F53F','C1D9C662-F500-41F4-8F16-1C638E38C006')
AND URL = '@/iMIS/ContactManagement/Create_Account_no_Sign_In' AND TargetDocumentVersionKey = '01E58865-B546-4364-8FC8-4D8C01023C1A'

-- Staff SignIn
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/Staff_Sign_In', TargetDocumentVersionKey = '21160AD6-13CB-4919-A4EC-E9F2DC4AED24', URLMappingTypeCode = 20
WHERE URLMappingKey = '8506E936-4D31-430F-93E2-69AB46255D5E'

-- Mobile Cart (only the URL was wrong)
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Store/Cart_Home' WHERE URLMappingKey = 'ACFB7C1E-88ED-4E29-9577-5B7ED576E074'

-- Mobile FullAccount (only the URL was wrong)
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/My Account' WHERE URLMappingKey = 'BA7AE93D-683C-4F7C-9D52-CF7363827589'

-- Mobile Organization and Organization Account (0nly the URL was wrong)
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/Organization_Profile' 
WHERE URLMappingKey IN ('233F3959-CFF8-4823-AE58-D2E86097DA79','3404077B-022C-46CD-93A3-50E08B5489C9')

-- Member GiveNow
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Fundraising/GiveNow', TargetDocumentVersionKey = 'fb2a3e56-ef20-4107-aa2f-57c118f0084f' 
WHERE URLMappingKey = 'ED517075-DD22-4B11-B10E-14066EE7CB68'

-- Mobile Profile (only the URL was wrong)
UPDATE [dbo].[URLMapping] SET URL = '@/iSamples/Mobile/Contact_Management/Profile' WHERE URLMappingKey = 'FBDEA79A-968E-48CC-B10B-852B03BAE5E1'

-- Donor MyAccount
UPDATE [dbo].[URLMapping] SET URL = '@/iCore/Contacts/ContactLayouts/Donor/About_Me', TargetDocumentVersionKey = 'e203e629-80f5-4557-b028-060c3e08639e' WHERE URLMappingKey = '5062F290-DC05-4ACF-9FBA-35E6D098F3EF'


--Update Personal Information panel definition
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'PersonalInformation') 
BEGIN
    UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition]='<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>PersonalInformation</Name><PanelDefinitionId>e64dd2c5-71c9-485c-9671-8cc0852c9e9e</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>PersonalInformation</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Work phone</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>WorkPhone</PropertyName></PanelFieldData><PanelFieldData><Caption>Home phone</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>HomePhone</PropertyName></PanelFieldData><PanelFieldData><Caption>Fax</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Fax</PropertyName></PanelFieldData><PanelFieldData><Caption>Toll free</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TollFree</PropertyName></PanelFieldData><PanelFieldData><Caption>Email</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Email</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Website</PropertyName></PanelFieldData><PanelFieldData><Caption>Functional title</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FunctionalTitle</PropertyName></PanelFieldData><PanelFieldData><Caption>Date of birth</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BirthDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Gender</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Gender</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string></SelectedEntityNames></PanelDefinitionData>'
    WHERE [Name] = 'PersonalInformation' 
END
GO

-- Remove content codes from the old iMIS content and put them on iCore content
UPDATE DocumentMain SET DocumentCode = '' WHERE DocumentKey IN
('8D71CF85-1914-4E39-A563-F440D1F7098A','C2FDD46A-B90B-4B3E-AFF7-E2F07DE89A98','B08294A0-A8EB-4C9C-BFF7-10EB8EA8EC91',
'BD58BB21-006C-4DA4-8A7A-1D88E09240B2','A84D78D3-4F8E-439D-B5EC-FE88CC4EDC8F','441C04EE-D796-4214-9594-ECD3D30F60CC',
'1CE3C33C-1B1B-4093-A445-9BBD1384BF53','E6F13D0E-3AAD-46D0-A3A9-1015C52A12C3','898A7389-0929-4C97-924B-B893DEB48D70',
'29F3BA57-0531-45F9-BA34-BE6E55980304','E3199C96-1FAF-43BD-9ABA-9ED42759E03D','8AE317BF-2E36-4E80-BA5A-68A7A24E794B',
'5B766FC7-02CC-4DF9-B4CB-36C89CB891B1','D450EE45-31D8-417D-9AEE-A286C69393D3','168474E0-A63C-4023-B49E-12EADFD27067',
'67D33CDE-8FCA-4FC2-A8DD-57F24F59BF72','5ACF5D7D-7D08-4E6D-BC86-D282B3572504')
UPDATE DocumentMain SET DocumentCode = 'BlogHome' WHERE DocumentVersionKey = '086b46a1-cd35-48d8-9109-2599313a2c3c' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'BlogList' WHERE DocumentVersionKey = '605c94b0-4285-4462-a390-8491b07adf0f' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'CommunityDefault' WHERE DocumentVersionKey = '2723f4b3-83a5-4374-902f-62d3a38800cc' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'CommunityDescription' WHERE DocumentVersionKey = 'ffd73063-5d78-4f4c-818e-5b44fde0e5ab' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'CommunityPostSummary' WHERE DocumentVersionKey = 'f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'EntryDefault' WHERE DocumentVersionKey = '172a10cf-f2da-44ad-95dc-bd1540f33b43' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'ForumHome' WHERE DocumentVersionKey = 'ed1c0843-b946-4dcb-8cbb-2be5027c8fe2' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'ForumList' WHERE DocumentVersionKey = 'd8503f8d-d076-44e0-9d5c-b70e1814e18a' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'RosterList' WHERE DocumentVersionKey = '84089ea5-2e78-4683-83ac-98aa7aacb241' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'TopicDefault' WHERE DocumentVersionKey = '460b2349-b498-4739-b2ee-a1f7955e84f7' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'WikiHome' WHERE DocumentVersionKey = '2365202c-3323-4e46-9153-05681f3d3f48' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'WikiList' WHERE DocumentVersionKey = '2b738e07-e61e-43e1-a8e4-75071ca430a1' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'User.AuthUserCreate' WHERE DocumentVersionKey = '03a6560f-4ca4-4fbc-962b-49d627e92461' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'Search.ResultsRow' WHERE DocumentVersionKey = 'c40616b3-9935-477f-97e7-189fa8e45684' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'OM.Opportunity' WHERE DocumentVersionKey = '6686bd23-b86a-43da-9e45-47e5ce83d4f4' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'OrderConfirmation' WHERE DocumentVersionKey = '909af5a8-3e03-41be-b428-db552bb8c28e' AND DocumentStatusCode = 40
UPDATE DocumentMain SET DocumentCode = 'BSA.WorkflowDesigner.WorkItemConsole' WHERE DocumentVersionKey = '3a64b20a-080e-4f79-9287-5988b74972d8' AND DocumentStatusCode = 40
GO

------------------------------------------------------------------------------
-- BEGIN PBI 33528 Community emails stopped working since upgrade (to 15.2.15)
------------------------------------------------------------------------------
-- Update all Community items except Blogs with AuthenticatedUsersReadWriteAddDeleteAccessKey to EveryoneReadWriteAddDeleteAccessKey
-- (note: Communities themselves can have specific Security set.)
UPDATE [dbo].[DocumentMain]
   SET [AccessKey] = '00000000-0000-0000-0000-000000000E1E'
 WHERE [DocumentVersionKey] IN (
SELECT dm.DocumentVersionKey
  FROM DocumentMain dm     
       LEFT JOIN Hierarchy h on (dm.DocumentVersionKey = h.UniformKey)
       LEFT JOIN DocumentTypeRef dtr on (dm.DocumentTypeCode = dtr.DocumentTypeCode)
 WHERE dm.DocumentTypeCode = 'CTY'                
   AND dm.DocumentStatusCode = 40
   AND dm.AccessKey = '00000000-0000-0000-0000-000000000F1E'
   AND CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) > 0
   AND SUBSTRING(  CONVERT(varchar(8000),convert(varbinary(8000), dm.Blob)),
                    (CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) + 23),
                    (CHARINDEX('</CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) - 
                       (CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) + 23))
                  ) NOT IN ('Blog', 'Community')
)
GO
-- Update Community Blogs with AuthenticatedUsersReadWriteAccessKey to EveryoneReadWriteAccessKey
UPDATE [dbo].[DocumentMain]
   SET [AccessKey] = '00000000-0000-0000-0000-000000000E0A'
 WHERE [DocumentVersionKey] IN (
SELECT dm.DocumentVersionKey
  FROM DocumentMain dm     
       LEFT JOIN Hierarchy h on (dm.DocumentVersionKey = h.UniformKey)
       LEFT JOIN DocumentTypeRef dtr       on (dm.DocumentTypeCode = dtr.DocumentTypeCode)
 WHERE dm.DocumentTypeCode = 'CTY'                
   AND dm.DocumentStatusCode = 40
   AND dm.AccessKey = '00000000-0000-0000-0000-000000000F0A'
   AND CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) > 0
   AND SUBSTRING(  convert(varchar(8000),convert(varbinary(8000), dm.Blob)),
                    (CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) + 23),
                    (CHARINDEX('</CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) - 
                       (CHARINDEX('<CommunityDocumentType>',convert(varchar(8000),convert(varbinary(8000), dm.Blob))) + 23))
                  ) = 'Blog'
)
GO
------------------------------------------------------------------------------
-- END PBI 33528 Community emails stopped working since upgrade (to 15.2.15)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- BEGIN PBI 30290 Adding support for defining products in v10
------------------------------------------------------------------------------

-- All Websites, Store
UPDATE [dbo].[URLMapping] 
   SET URL = '@/iCore/Store/StoreLayouts/Store_Home', TargetDocumentVersionKey = '53EDB360-7B6B-425F-9EC3-06418C408E24' 
 WHERE URLMappingKey = '923BEFF4-ADD9-4E31-B0D6-4C54660A5200'
   AND URL = '~/iCore/Content/Search.aspx?InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99' 
GO
------------------------------------------------------------------------------
-- END PBI 30290 Adding support for defining products in v10
------------------------------------------------------------------------------

-------------------------------------------------------
-- SBT 34180 - Fix up shortcuts that were set to Custom
-------------------------------------------------------

-- All Sites Store shortcut should be editable, but not deletable
UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 20 WHERE [URLMappingKey] = '923BEFF4-ADD9-4E31-B0D6-4C54660A5200'

-- Staff Sign in shortcut should be editable, but not deletable
UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 20 WHERE [URLMappingKey] = '8506E936-4D31-430F-93E2-69AB46255D5E'

-- Annual Conference, Donor & Member shortcuts should be of type reference
UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 20 
WHERE [URLMappingKey] IN ('5062F290-DC05-4ACF-9FBA-35E6D098F3EF','8714D83C-745A-43B9-876D-717B649643D7','807D2114-4FB0-4AED-8D6A-CC6D932A9D14')
GO

-- PBI 34051 - Hide all of the Education nav items from the Staff and Member sites using the CERTETP license key. 
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '41EB0E76-CED4-4191-96E3-6A0E0D869C9A')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '41EB0E76-CED4-4191-96E3-6A0E0D869C9A')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '933765D5-30A9-4E9D-9D0A-DC25B5724195')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '933765D5-30A9-4E9D-9D0A-DC25B5724195')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '1332B346-B9B0-45A0-8195-1C6087CE7F88')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '1332B346-B9B0-45A0-8195-1C6087CE7F88')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '0A43FD56-0BD4-44F3-BBF1-2A1CAB0662C8')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '0A43FD56-0BD4-44F3-BBF1-2A1CAB0662C8')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '8F87B685-BCFD-48B2-85D7-C6C71C005A94')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '8F87B685-BCFD-48B2-85D7-C6C71C005A94')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '4AB24073-7878-4051-B10A-412322ED1967')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '4AB24073-7878-4051-B10A-412322ED1967')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'E5E3C87E-617B-40BD-A7E2-60C6248C6680')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'E5E3C87E-617B-40BD-A7E2-60C6248C6680')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'DF958984-544A-47CE-8BB3-481430C4917B')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'DF958984-544A-47CE-8BB3-481430C4917B')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'B3A5B91E-A2A2-44FD-ADCE-A964B33A80F4')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'B3A5B91E-A2A2-44FD-ADCE-A964B33A80F4')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '0D8DE77F-8F55-42EC-9F4F-81E2C2840B75')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '0D8DE77F-8F55-42EC-9F4F-81E2C2840B75')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'FB84221D-C8E3-4D0D-B27A-AB5A106EB637')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'FB84221D-C8E3-4D0D-B27A-AB5A106EB637')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '3EF06DAF-84AD-44A8-95E8-772F1459B519')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '3EF06DAF-84AD-44A8-95E8-772F1459B519')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '990BB709-B862-49DE-AC3C-8ABE02770DD3')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '990BB709-B862-49DE-AC3C-8ABE02770DD3')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '664E65AF-2F90-4A03-B045-42F687923FAA')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '664E65AF-2F90-4A03-B045-42F687923FAA')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'E81F040B-02B8-4C1D-86DE-BDF489325411')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'E81F040B-02B8-4C1D-86DE-BDF489325411')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'EAA22610-6417-417A-88E0-D7F83D9B4486')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'EAA22610-6417-417A-88E0-D7F83D9B4486')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '84AC5DBB-186B-4289-9DAE-7EE20560DC24')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '84AC5DBB-186B-4289-9DAE-7EE20560DC24')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'DE19B445-3188-475A-93B2-74BCACD551D3')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'DE19B445-3188-475A-93B2-74BCACD551D3')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '99AD059F-5909-4A3C-AF37-EE8E1D83A98F')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '99AD059F-5909-4A3C-AF37-EE8E1D83A98F')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '1E2DD2E0-6932-48E1-9A26-DF7192FCD5F2')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '1E2DD2E0-6932-48E1-9A26-DF7192FCD5F2')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '00B7852C-D655-49AF-98E3-C97AC113AF00')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '00B7852C-D655-49AF-98E3-C97AC113AF00')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '941CF3A4-BB79-43BB-9CC9-2561510F1905')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '941CF3A4-BB79-43BB-9CC9-2561510F1905')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'D0DBDDE1-B1AB-4CED-B842-862545636F4F')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'D0DBDDE1-B1AB-4CED-B842-862545636F4F')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'A257903E-AC60-41C2-B56A-047FE4E466CA')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'A257903E-AC60-41C2-B56A-047FE4E466CA')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'F7A95193-551F-48D5-8559-22D8DB014702')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'F7A95193-551F-48D5-8559-22D8DB014702')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '6FD3B8F9-1369-42CE-A1C4-FBFC5E85A181')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '6FD3B8F9-1369-42CE-A1C4-FBFC5E85A181')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = 'DB9334C3-9FA9-45B0-8872-CF67A4D6E32D')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', 'DB9334C3-9FA9-45B0-8872-CF67A4D6E32D')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1047CA17-B745-4466-9B31-753D973D8889' AND [UniformKey] = '096F8B6F-8925-445C-9E3A-B28CD828EDFF')
BEGIN
      INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('1047CA17-B745-4466-9B31-753D973D8889', '096F8B6F-8925-445C-9E3A-B28CD828EDFF')
END
GO

SET NOCOUNT OFF
GO
