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

--------------------------------------------
-- Remove "CreditCardAuthCodeEnabled" variable
-- System Setup > Set up commerce web components > Credit card label configuration > Show the Credit card security code (CSC) field
--------------------------------------------
DECLARE @ParameterName nvarchar(255)
DECLARE @PropertyDefinitionKey uniqueidentifier

SET @ParameterName = 'CreditCardAuthCodeEnabled'

SELECT @PropertyDefinitionKey = PropertyDefinitionKey
  FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = @ParameterName

DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [Label] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey
GO

--------------------------------------------
-- Remove "CreditCardAuthCodeRequired" variable
-- System Setup > Set up commerce web components > Credit card label configuration > Require a value in the Credit card security code (CSC) field
--------------------------------------------
DECLARE @ParameterName nvarchar(255)
DECLARE @PropertyDefinitionKey uniqueidentifier

SET @ParameterName = 'CreditCardAuthCodeRequired'

SELECT @PropertyDefinitionKey = PropertyDefinitionKey
  FROM [dbo].[SystemConfigParameterRef]
 WHERE [ParameterName] = @ParameterName

DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [Label] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey
GO

----------------------------------------------------------
-- Create new Role: OnBehalfOf, used in OnBehalfOf control 
----------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[RoleMain] WHERE [Name] = 'OnBehalfOf')
BEGIN
    DECLARE @userKey uniqueidentifier
    DECLARE @now datetime

    SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @now = GETDATE()

    INSERT INTO [dbo].[RoleMain]
           ([RoleKey]
           ,[Name]
           ,[Description]
           ,[IsSystem]
           ,[UpdatedByUserKey]
           ,[UpdatedOn]
           ,[MarkedForDeleteOn])
     VALUES
           ('3DB6074D-7BC4-4D89-93A1-A2B83D972F4C'
           ,'OnBehalfOf'
           ,'Members of this role can perform commerce transactions on behalf of other contacts '
           ,0
           ,@userKey
           ,@now
           ,NULL)
END
GO

----------------------------
-- Update UI Parameter Value
---------------------------- 
UPDATE  [dbo].[SystemConfig]
   SET  [ParameterValue] = 'Username'
 WHERE  [ParameterName] = 'UserNameLabel'
GO

----------------------------
-- Add config parameter
---------------------------- 
IF NOT EXISTS (SELECT 1 FROM [dbo].[System_Params] WHERE [ParameterName] = 'AR_Control.TaxOnShipTo')
BEGIN
    INSERT INTO [dbo].[System_Params] ([ParameterName], [ShortValue])
        VALUES('AR_Control.TaxOnShipTo', 'YES')
END

----------------------------------------------------------------------------------------
-- Remove CreateAccountDefaultSecurityGroup parameter from Organization configuration
----------------------------------------------------------------------------------------
DELETE FROM SystemConfigPageParameterRef WHERE ParameterName = 'CreateAccountDefaultSecurityGroup'

GO

----------------------------
-- Update The description of our SSL options to explain that they only work in old iMIS sites, not new WCM iPart sites
----------------------------
UPDATE SystemConfigParameterRef
	SET [Description] = 'Use SSL security for logon (only applies to non-iPart based websites)'
WHERE ParameterName = 'EnableLoginSSL'
GO

UPDATE SystemConfigParameterRef
	SET [Description] = 'Use SSL security for checkout (only applies to non-iPart based websites)'
WHERE ParameterName = 'EnableCheckoutSSL'
GO

----------------------------------------------------------------
-- Create new UI Config option: Asi.Content.SiteMapNeedsRebuild
-- Will be used to identify when a content item which requires a sitemap rebuild has been updated
----------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'Asi.Content.SiteMapNeedsRebuild')
BEGIN
    EXEC [dbo].[asi_InsertSystemConfig] 
         'System', 'ContentDesigner', 'MANAGER', '250FCAFF-E5DF-47B3-ABFC-3D5A024DA810',
         'Asi.Content.SiteMapNeedsRebuild', '3D9C080F-1E41-46D5-8971-1FCF8E3D6143',
         3, 0, null, 
         'Lets iMIS know that the sitemap needs to be rebuilt (i.e. content has changed). To rebuild sitemap set to date/time after the sitemap was last rebuilt',
         '1753-01-01 00:00:00.000', 5
END
GO


-------------------------------------------------------------
-- Update OnBehalfOf role to be IsSystem
-------------------------------------------------------------
UPDATE [dbo].[RoleMain]
   SET [IsSystem] = 1
 WHERE [RoleKey] = '3DB6074D-7BC4-4D89-93A1-A2B83D972F4C'