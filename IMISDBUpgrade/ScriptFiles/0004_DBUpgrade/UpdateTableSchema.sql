----------------------------------
-- Modify Existing Table Schema --
----------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script

-------------------------------------------------------------
-- Add a new NULL PublishServerCode column to PublishQueue
-------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue' AND COLUMN_NAME = 'PublishServerCode')
    BEGIN
        ALTER TABLE [dbo].[PublishQueue] ADD [PublishServerCode] nchar(1) NULL
    END
END
GO
-- Ensure there is at least one row in PublishServerRef Table
DECLARE @now datetime;
DECLARE @userKey uniqueidentifier;
IF (SELECT COUNT(1) FROM [dbo].[PublishServerRef]) = 0
BEGIN
    SET @now = GETDATE();
    SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    INSERT INTO [dbo].[PublishServerRef] ([PublishServerCode], [PublishServerDesc], [Frequency], [PublishingSpeed], 
                                          [UseServiceRequest], [IsDefault], [LocalPublishPath], [LocalProtectedPath], 
                                          [CreatedOn], [CreatedByUserKey], [UpdatedOn], [UpdatedByUserKey])
    VALUES('D', 'Demo - Delete Me', 30, 100, 1, 1,
           'C:\ASI\IMIS\net', 'C:\ASI\IMIS\IndexServiceProtected', @now, @userKey, @now, @userKey);
END
GO
-- Populate the new non-null column
DECLARE @publishCode nchar(1)
SELECT TOP 1 @publishCode = [PublishServerCode] FROM [dbo].[PublishServerRef] WHERE [IsDefault]= 1
UPDATE [dbo].[PublishQueue]
   SET [PublishServerCode] = @publishCode
 WHERE [PublishServerCode] IS NULL
GO
-- Finally, make the column NOT NULL
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue' AND COLUMN_NAME = 'PublishServerCode')
    BEGIN
        ALTER TABLE [dbo].[PublishQueue] ALTER COLUMN  [PublishServerCode] nchar(1) NOT NULL
    END
END
GO


------------------------------------------
--PBI 44333 Rename CommunicationReasonRef.CommunicationReasonDesc to CommunicationReasonRef.CommunicationReasonName
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef' AND COLUMN_NAME = 'CommunicationReasonName')
    BEGIN
            EXEC sp_rename 'CommunicationReasonRef.[CommunicationReasonDesc]', 'CommunicationReasonName', 'COLUMN'  
      END
END
GO
------------------------------------------
--PBI 44333 Add new column CommunicationReasonRef.IsSystem
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef' AND COLUMN_NAME = 'IsSystem')
    BEGIN
        ALTER TABLE [dbo].[CommunicationReasonRef] ADD [IsSystem] bit
                  CONSTRAINT DF_CommunicationReasonRef_IsSystem DEFAULT (0) NOT NULL
    END
END
GO
------------------------------------------
--PBI 44333 Add new column CommunicationReasonRef.Status
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef' AND COLUMN_NAME = 'Status')
    BEGIN
        ALTER TABLE [dbo].[CommunicationReasonRef] ADD [Status] bit
                  CONSTRAINT DF_CommunicationReasonRef_Status DEFAULT (0) NOT NULL
    END
END
GO
------------------------------------------
--PBI 44333 Add new column CommunicationReasonRef.CommunicationReasonDesc
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationReasonRef' AND COLUMN_NAME = 'CommunicationReasonDesc')
    BEGIN
        ALTER TABLE [dbo].[CommunicationReasonRef] ADD [CommunicationReasonDesc] nvarchar(500)
    END
END
GO

------------------------------------------
--PBI 45882 Make TranslatedPhrase column in [LocalizationVersionPhrase] nullable
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase' AND COLUMN_NAME = 'TranslatedPhrase')
    BEGIN
        ALTER TABLE [dbo].LocalizationVersionPhrase ALTER COLUMN TranslatedPhrase nvarchar(4000) NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column ContactSocialNetwork.SocialNetworkToken
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork' AND COLUMN_NAME = 'SocialNetworkToken')
    BEGIN
        ALTER TABLE [dbo].[ContactSocialNetwork] ADD [SocialNetworkToken] nvarchar(255) NULL
    END
END
GO
------------------------------------------
-- PBI 44335 - Add a new NULL column ContactCommunicationReasonPreferences.OptInFlag
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactCommunicationReasonPreferences')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactCommunicationReasonPreferences' AND COLUMN_NAME = 'OptInFlag')
    BEGIN
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ADD [OptInFlag] bit NULL
    END
END
GO
------------------------------------------
-- Add a new NOT NULL column ContactSocialNetwork.UseSocialNetworkProfilePhoto
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork' AND COLUMN_NAME = 'UseSocialNetworkProfilePhoto')
    BEGIN
        ALTER TABLE [dbo].[ContactSocialNetwork] ADD [UseSocialNetworkProfilePhoto] BIT 
              CONSTRAINT DF_ContactSocialNetwork_UseSocialNetworkProfilePhoto DEFAULT (0) NOT NULL
    END
END
GO

--------------------------------------------------------------------------------------------------------
-- Update columns to match their lengths to Name.FULL_NAME
--------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl' AND COLUMN_NAME = 'BT_NAME')
    BEGIN
        ALTER TABLE [dbo].[Rpt_WorkingTbl] ALTER COLUMN [BT_NAME] varchar(70) NOT NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'NAME_FULL_NAME')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ALTER COLUMN [NAME_FULL_NAME] varchar(70) NOT NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'ORDERS_FULL_NAME')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ALTER COLUMN [ORDERS_FULL_NAME] varchar(70) NOT NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Duplicate')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Duplicate' AND COLUMN_NAME = 'FULL_NAME')
    BEGIN
        ALTER TABLE [dbo].[Duplicate] ALTER COLUMN [FULL_NAME] varchar(70) NULL
    END
END
GO



---------------------------------------------------------------------
-- iMISMain10 PBI 47138 Modify table schema for table "ContactCommunicationReasonPreferences"
---------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactCommunicationReasonPreferences')
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' 
                      AND TABLE_NAME = 'ContactCommunicationReasonPreferences' AND COLUMN_NAME = 'CreatedByUserKey')
    BEGIN
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ADD CreatedByUserKey uniqueidentifier NULL
        CONSTRAINT [FK_ContactCommunicationReasonPreferences_CreatedBy] REFERENCES [UserMain] ([UserKey]);
    END
    IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' 
                      AND TABLE_NAME = 'ContactCommunicationReasonPreferences' AND COLUMN_NAME = 'CreatedOn')
    BEGIN
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ADD [CreatedOn] datetime 
        CONSTRAINT DF_ContactCommunicationReasonPreferences_CreatedOn DEFAULT (GETDATE()) NOT NULL;
    END
    IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' 
                      AND TABLE_NAME = 'ContactCommunicationReasonPreferences' AND COLUMN_NAME = 'UpdatedByUserKey')
    BEGIN
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ADD [UpdatedByUserKey] uniqueidentifier NULL
        CONSTRAINT [FK_ContactCommunicationReasonPreferences_UpdatedBy] REFERENCES [UserMain] ([UserKey]);
    END
    IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' 
                      AND TABLE_NAME = 'ContactCommunicationReasonPreferences' AND COLUMN_NAME = 'UpdatedOn')
    BEGIN
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ADD [UpdatedOn] datetime 
        CONSTRAINT DF_ContactCommunicationReasonPreferences_UpdatedOn DEFAULT (GETDATE()) NOT NULL;
    END
END   
GO 

DECLARE @managerKey uniqueidentifier;
SET @managerKey = (SELECT [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER');    
IF @managerKey IS NOT NULL
BEGIN
    IF (SELECT COLUMNPROPERTY(OBJECT_ID('[ContactCommunicationReasonPreferences]', 'U'), 'CreatedByUserKey', 'AllowsNull')) = 1
    BEGIN 
        UPDATE [dbo].[ContactCommunicationReasonPreferences] 
           SET [CreatedByUserKey] = @managerKey
         WHERE [CreatedByUserKey] IS NULL;
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ALTER COLUMN CreatedByUserKey uniqueidentifier NOT NULL;
    END
    
    IF (SELECT COLUMNPROPERTY(OBJECT_ID('[ContactCommunicationReasonPreferences]', 'U'), 'UpdatedByUserKey', 'AllowsNull')) = 1
    BEGIN
        UPDATE [dbo].[ContactCommunicationReasonPreferences] 
           SET [UpdatedByUserKey] = @managerKey
         WHERE [UpdatedByUserKey] IS NULL;
        ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] ALTER COLUMN UpdatedByUserKey uniqueidentifier NOT NULL;
   END
END

----------------------------------------------------------------------------------------------------
-- iMISMain10 PBI: 47785 SBT:48386  Adding a new column IS_GROUOP_ADMIN to Subscriptions table.
-----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
-- Drop Subscriptions.TIME_STAMP column to allow columns to be appended to Activity
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Subscriptions] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Subscriptions.IS_GROUP_ADMIN NOT NULL column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions' AND COLUMN_NAME = 'IS_GROUP_ADMIN')
    BEGIN
        ALTER TABLE [dbo].[Subscriptions] ADD [IS_GROUP_ADMIN] bit 
              CONSTRAINT DF_Subscriptions_IS_GROUP_ADMIN DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Subscriptions.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Subscriptions] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Batch.TIME_STAMP column to allow columns to be appended to Batch
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Batch] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Batch.WEB_BATCH NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch' AND COLUMN_NAME = 'WEB_BATCH')
    BEGIN
        ALTER TABLE [dbo].[Batch] ADD [WEB_BATCH] bit 
              CONSTRAINT DF_Batch_WEB_BATCH DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Batch.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Batch] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

----------------------------------------------------------------------------------------------------------
-- SBT48707 Change length of SystemConfigXml.SystemConfigXmlCode to be 100 characters
----------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'SystemConfigXml')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'SystemConfigXml' AND COLUMN_NAME = 'SystemConfigXmlCode')
    BEGIN
        ALTER TABLE [dbo].[SystemConfigXml] ALTER COLUMN [SystemConfigXmlCode] nvarchar(100) NOT NULL
    END
END
GO

------------------------------------------
-- SBT 52032 Add a new NULL column CommunicationLogEvent.EventDateTime
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogEvent')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogEvent' AND COLUMN_NAME = 'EventDateTime')
    BEGIN
        ALTER TABLE [dbo].[CommunicationLogEvent] ADD [EventDateTime] datetime NULL
    END
END
GO

------------------------------------------
-- PBI49062 Add a new NULL column CommunicationLogRecipient.DataSources
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient' AND COLUMN_NAME = 'DataSources')
    BEGIN
        ALTER TABLE [dbo].[CommunicationLogRecipient] ADD [DataSources] nvarchar(max) NULL
    END
END
GO

------------------------------------------
-- SBT 52032 Add a new NULL column CommunicationLogRecipient.LastEventDateTime
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient' AND COLUMN_NAME = 'LastEventDateTime')
    BEGIN
        ALTER TABLE [dbo].[CommunicationLogRecipient] ADD [LastEventDateTime] datetime NULL
    END
END
GO

-------------------------------------------------------------
-- SBT 51832 Add a new NULL column CommunicationLogRecipient.MessageId
-------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CommunicationLogRecipient' AND COLUMN_NAME = 'MessageId')
    BEGIN
        ALTER TABLE [dbo].[CommunicationLogRecipient] ADD [MessageId] nvarchar(10) NULL
    END
END
GO

----------------------------------------------------------------------------------------------------
-- iMISMain10 PBI: 41788 SBT:49499  Adding a new column DEFAULT_PROGRAMITEM_DISPLAYMODE to Meet_Master table.
-----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
-- Drop Meet_Master.TIME_STAMP column to allow columns to be appended to Meet_Master
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Meet_Master DROP COLUMN [TIME_STAMP]
    END
END
GO

---------------------------------------------------------------------------------------
-- Add DEFAULT_PROGRAMITEM_DISPLAYMODE
---------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'DEFAULT_PROGRAMITEM_DISPLAYMODE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [DEFAULT_PROGRAMITEM_DISPLAYMODE] INT NOT NULL CONSTRAINT DF_Meet_Master_DEFAULT_PROGRAMITEM_DISPLAYMODE DEFAULT(0)
    END
END
GO

------------------------------------------------
-- Add a new NULL column Meet_Master.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Meet_Master ADD [TIME_STAMP] timestamp NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column ObjectMetaData.Version to support V2 virtual tables
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ObjectMetaData')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ObjectMetaData' AND COLUMN_NAME = 'Version')
    BEGIN
        ALTER TABLE [ObjectMetaData] ADD Version nvarchar(50) NULL
    END
END
GO

---------------------------------------------------------
-- PBI43706 Change length of LocalizationVersionPhrase.Phrase to be 4000 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase' AND COLUMN_NAME = 'Phrase')
    BEGIN
        ALTER TABLE [dbo].LocalizationVersionPhrase ALTER COLUMN [Phrase] nvarchar(4000) NOT NULL
    END
END
GO

---------------------------------------------------------
-- PBI43706 Change length of LocalizationPhrase.Phrase to be 4000 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase' AND COLUMN_NAME = 'Phrase')
    BEGIN
        ALTER TABLE [dbo].LocalizationPhrase ALTER COLUMN [Phrase] nvarchar(4000) NOT NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Product_Tax.TIME_STAMP column to allow columns to be appended to Product_Tax
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Tax] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Tax.TAXCATEGORY_CODE NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax' AND COLUMN_NAME = 'TAXCATEGORY_CODE')
    BEGIN
        ALTER TABLE [dbo].[Product_Tax] ADD [TAXCATEGORY_CODE] varchar(10) 
              CONSTRAINT DF_Product_Tax_TAXCATEGORY_CODE DEFAULT ('') NOT NULL
    END	
END
GO

-----------------------------------------------------------------
-- Add new Product_Tax.COUNTRY NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax' AND COLUMN_NAME = 'COUNTRY')
    BEGIN
        ALTER TABLE [dbo].[Product_Tax] ADD [COUNTRY] varchar(25) 
              CONSTRAINT DF_Product_Tax_COUNTRY DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Product_Tax.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Tax' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Tax] ADD [TIME_STAMP] timestamp NULL
    END
END
GO


BEGIN

    DECLARE @restoreProductKey bit
    DECLARE @productKeyMap TABLE ([PRODUCT_CODE] varchar(100), [ProductKey] uniqueidentifier)
    SET @restoreProductKey = 0

    ---------------------------------------------------------------------------------------
    -- Drop Product.ProductKey column to allow columns to be appended to Product
    -- First write its values into a table variable so we can restore them later
    ---------------------------------------------------------------------------------------
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'ProductKey')
        BEGIN
            SET @restoreProductKey = 1
            INSERT INTO @productKeyMap SELECT [PRODUCT_CODE], [ProductKey] FROM [dbo].[Product]
            IF OBJECT_ID('AK_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [AK_Product_ProductKey]
            END
            IF OBJECT_ID('DF_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ProductKey]
            END        
            ALTER TABLE [dbo].[Product] DROP COLUMN [ProductKey]
        END
    END

    ---------------------------------------------------------------------------------------
    -- Drop Product.TIME_STAMP column to allow columns to be appended to Product
    ---------------------------------------------------------------------------------------
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Product] DROP COLUMN [TIME_STAMP]
        END
    END

    -----------------------------------------------------------------
    -- Add new Product.TAX_BY_LOCATION NOT NULL column with a default of (0)
    ------------------------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TAX_BY_LOCATION')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [TAX_BY_LOCATION] bit 
                  CONSTRAINT DF_Product_TAX_BY_LOCATION DEFAULT (0) NOT NULL
        END
    END

    ------------------------------------------------------------------
    -- Add new Product.TAXCATEGORY_CODE NOT NULL column with a default of ('')
    ------------------------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TAXCATEGORY_CODE')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [TAXCATEGORY_CODE] varchar(10) 
                  CONSTRAINT DF_Product_TAXCATEGORY_CODE DEFAULT ('') NOT NULL
        END 
    END

    ------------------------------------------------
    -- Restore column Product.TIME_STAMP
    ------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [TIME_STAMP] timestamp NULL
        END
    END

    ------------------------------------------------
    -- Restore column Product.ProductKey
    -- Restore its values from the table variable
    ------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'ProductKey')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [ProductKey] uniqueidentifier
                  CONSTRAINT [DF_Product_ProductKey] DEFAULT (newid())
                  CONSTRAINT [AK_Product_ProductKey] UNIQUE NONCLUSTERED
                  NOT NULL
            IF @restoreProductKey=1
            BEGIN
                ALTER TABLE [dbo].[Product] DISABLE TRIGGER ALL;
                UPDATE [dbo].[Product] SET [ProductKey]=pkm.[ProductKey]
                  FROM [dbo].[Product]
                  JOIN @productKeyMap pkm ON [dbo].[Product].[PRODUCT_CODE]=pkm.[PRODUCT_CODE]
                ALTER TABLE [dbo].[Product] ENABLE TRIGGER ALL;
            END
        END
    END

END
GO

-- End of script
SET NOCOUNT OFF
GO
