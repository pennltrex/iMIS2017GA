------------------------------------
-- Update data in existing tables --
------------------------------------
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

-- Add new row to GenTables, add 'List_As' as Salutation type
DECLARE @tablename nvarchar(30)
SET @tablename = 'SALUTATION_CODE'
IF NOT EXISTS (SELECT 1 FROM [dbo].[Gen_Tables] WHERE [TABLE_NAME] = @tablename AND [CODE] = 'LIST_AS' )
BEGIN
	INSERT INTO Gen_Tables(TABLE_NAME,CODE,SUBSTITUTE,UPPER_CODE,[DESCRIPTION])
	VALUES (@tablename,'LIST_AS','','LIST_AS','Donation List As')
END
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

SET NOCOUNT OFF
GO
