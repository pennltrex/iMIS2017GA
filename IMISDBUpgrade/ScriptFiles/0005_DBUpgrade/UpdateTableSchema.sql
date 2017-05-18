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

---------------------------------------------------------------------------
-- PBI 51476: Null out and eliminate OwnerAccessKey from GroupMain table
---------------------------------------------------------------------------
IF OBJECT_ID('tempdb..#OwnerAccessKeys') IS NOT NULL
    DROP TABLE #OwnerAccessKeys;
CREATE TABLE #OwnerAccessKeys ([OwnerAccessKey] uniqueidentifier PRIMARY KEY);
INSERT INTO #OwnerAccessKeys
    SELECT DISTINCT g.[OwnerAccessKey] 
      FROM [dbo].[GroupMain] g
     WHERE g.[OwnerAccessKey] IS NOT NULL 
       AND NOT EXISTS (SELECT 1 FROM [dbo].[AccessArea] a WHERE a.[ProtectedAccessKey] = g.[OwnerAccessKey])
DELETE ai
  FROM #OwnerAccessKeys oak
       INNER JOIN [dbo].[AccessItem] ai ON oak.[OwnerAccessKey] = ai.[AccessKey];
UPDATE [dbo].[GroupMain]
   SET [OwnerAccessKey] = NULL;
DELETE am
  FROM #OwnerAccessKeys oak
       INNER JOIN [dbo].[AccessMain] am ON oak.[OwnerAccessKey] = am.[AccessKey];
IF OBJECT_ID('tempdb..#OwnerAccessKeys') IS NOT NULL
    DROP TABLE #OwnerAccessKeys;
GO

------------------------------------------------------------------
-- PBI 54526:  Add new GroupMain.IsMember NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupMain')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupMain' AND COLUMN_NAME = 'IsMember')
    BEGIN
        ALTER TABLE [dbo].[GroupMain] ADD [IsMember] bit 
              CONSTRAINT DF_GroupMain_IsMember DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new GroupTypeRef.ExtendActiveMembershipTermFlag NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupTypeRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupTypeRef' AND COLUMN_NAME = 'ExtendActiveMembershipTermFlag')
    BEGIN
        ALTER TABLE [dbo].[GroupTypeRef] ADD [ExtendActiveMembershipTermFlag] bit 
              CONSTRAINT DF_GroupTypeRef_ExtendActiveMembershipTermFlag DEFAULT (0) NOT NULL
    END
END
GO


------------------------------------------------------------------
-- PBI 47647:  Add column indicating whether a registration option
-- is available to a registrant and/or guest.
------------------------------------------------------------------
---------------------------------------------------------------------------------------
-- Drop MyTable.TIME_STAMP column to allow columns to be appended to Product_Function
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] DROP COLUMN [TIME_STAMP]
    END
END
GO


------------------------------------------------
-- Add the AVAILABLE_TO column
------------------------------------------------
IF EXISTS (SELECT 1
             FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
    BEGIN
        IF NOT EXISTS(SELECT 1
                        FROM INFORMATION_SCHEMA.COLUMNS
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'AVAILABLE_TO')
            BEGIN
                ALTER TABLE [dbo].[Product_Function] ADD [AVAILABLE_TO] int
                      CONSTRAINT DF_Product_Function_AVAILABLE_TO DEFAULT (0) NOT NULL;
            END;
    END;
GO

------------------------------------------------
-- Add a new NULL column Product_Function.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

------------------------------------------
--PBI 53513 Rename CountryRef.VATCountryCode to CountryRef.EUCountryCode
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CountryRef')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CountryRef' AND COLUMN_NAME = 'VATCountryCode')
    BEGIN
          EXEC sp_executesql N'UPDATE CountryRef SET VATCountryCode = N'''' WHERE VATCountryCode IS NULL'
      END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CountryRef' AND COLUMN_NAME = 'EUCountryCode')
    BEGIN
        EXEC sp_rename 'CountryRef.[VATCountryCode]', 'EUCountryCode', 'COLUMN';
       ALTER TABLE [dbo].[CountryRef] ADD CONSTRAINT [DF_CountryRef_EUCountryCode] DEFAULT (N'') FOR [EUCountryCode];
    END
END

GO

----------------------------------------------------------------
-- PBI 51539 Increase character limit for Description fields
----------------------------------------------------------------
----------------------------------------------------------------
-- PBI 51539 Increase character limit for Description fields
----------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CertificationModule')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CertificationModule' AND COLUMN_NAME = 'CertificationModuleDesc' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[CertificationModule] ALTER COLUMN [CertificationModuleDesc] nvarchar(1000) NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CertificationProgram')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CertificationProgram' AND COLUMN_NAME = 'CertificationProgramDescription' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[CertificationProgram] ALTER COLUMN [CertificationProgramDescription] nvarchar(1000) NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ComponentRegistry')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ComponentRegistry' AND COLUMN_NAME = 'Description' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[ComponentRegistry] ALTER COLUMN [Description] nvarchar(1000) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Program')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Program' AND COLUMN_NAME = 'ProgramDescr' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[Program] ALTER COLUMN [ProgramDescr] nvarchar(1000) NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ContactOfferingRef')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ContactOfferingRef' AND COLUMN_NAME = 'ContactOfferingDesc' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[ContactOfferingRef] ALTER COLUMN [ContactOfferingDesc] nvarchar(1000) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Offering')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Offering' AND COLUMN_NAME = 'OfferingDesc' AND CHARACTER_MAXIMUM_LENGTH <> 1000)
    BEGIN
        ALTER TABLE [dbo].[Offering] ALTER COLUMN [OfferingDesc] nvarchar(1000) NULL
    END
END
GO

-- Fix Website.PublishServerCode
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Website')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Website' AND COLUMN_NAME = 'PublishServerCode' AND DATA_TYPE <> 'char')
    BEGIN
        ALTER TABLE [dbo].[Website] ALTER COLUMN [PublishServerCode] char(1) NOT NULL
    END
END
GO

------------------------------------------------
-- PBI 43035 - Add a new column CertificationProgram.AllowCancel
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgram')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgram' AND COLUMN_NAME = 'AllowCancel')
            BEGIN
                ALTER TABLE [dbo].[CertificationProgram] ADD [AllowCancel] bit
                CONSTRAINT DF_CertificationProgram_AllowCancel DEFAULT (1) NOT NULL
            END
    END
GO

-------------------------
-- PBI 54255:v10/v100 Licensing - Cleanup existing license table and code
-------------------------

-- Add a new column LicenseMaster.GracePeriod with a default of 0
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND COLUMN_NAME = 'GracePeriod')
    BEGIN
        ALTER TABLE [dbo].[LicenseMaster] ADD [GracePeriod] INT 
            CONSTRAINT DF_LicenseMaster_GracePeriod DEFAULT (0) NOT NULL
    END
END
GO

-- Add a new column LicenseMain.GracePeriod with a default of 0
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMain')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMain' AND COLUMN_NAME = 'GracePeriod')
    BEGIN
        ALTER TABLE [dbo].[LicenseMain] ADD [GracePeriod] INT 
            CONSTRAINT DF_LicenseMain_GracePeriod DEFAULT (0) NOT NULL
    END
END
GO

-- Rename License table to LicenseRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'License')
BEGIN

    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseRef')
    BEGIN
        DROP TABLE dbo.LicenseRef;
    END

    EXEC dbo.asi_RenameTable @oldTableName = 'License' , @newTableName = 'LicenseRef'
END
GO

-------------------------------------------------------------------------------------------------
-- PBI 54255 - Add more licensing provisions to handle legacy licenses and temporary licenses
-------------------------------------------------------------------------------------------------
-- Add a new NULL column LicenseOrganization.SerialNumber (used to license v10 customers only)
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseOrganization')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseOrganization' AND COLUMN_NAME = 'SerialNumber')
    BEGIN
        ALTER TABLE [dbo].[LicenseOrganization] ADD [SerialNumber] nvarchar(20) NULL
    END
END
GO

------------------------------------------------
-- Add new non-nullable column with an FK to LicenseMaster
-- Make it nullable at first, populate it, and then make it non-nullable
------------------------------------------------
-- First make the column nullable so it won't break upgrade
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND COLUMN_NAME = 'LicenseOrganizationVersionKey')
    BEGIN        
        ALTER TABLE [dbo].[LicenseMaster] ADD [LicenseOrganizationVersionKey] uniqueidentifier NULL
    END
END
GO

-- Now insert into LicenseOrganizationVersion and populate LicenseMaster.LicenseOrganizationVersionKey
IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseOrganizationVersion])
BEGIN
    INSERT INTO [dbo].[LicenseOrganizationVersion]
           ([LicenseOrganizationVersionKey], [LicenseOrganizationKey], [IsPermanentVersion],
           [Description], [EffectiveDate], [ExpirationDate], [LicensedUsers], 
           [MaximumRecords], [LegacyLicenseCodes], [LegacyChecksum],
           [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn])
     SELECT NEWID(), [LicenseOrganizationKey], 1,  
            [Description], [CreatedOn], NULL, NULL,
            NULL, NULL, NULL, 
            [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn]
       FROM [dbo].[LicenseOrganization]
END   
GO

-- Make sure all the rows in LicenseMaster have LicenseOrganizationVersionKey populated
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster')
BEGIN
    DECLARE @sql nvarchar(1000);
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND COLUMN_NAME = 'LicenseOrganizationKey')
    BEGIN
        SET @sql = '
        UPDATE [dbo].[LicenseMaster] 
           SET [LicenseOrganizationVersionKey] = lov.[LicenseOrganizationVersionKey]
          FROM [dbo].[LicenseMaster] lm INNER JOIN [dbo].[LicenseOrganizationVersion] lov ON lm.[LicenseOrganizationKey] = lov.[LicenseOrganizationKey]
        ';
        EXEC (@sql);
    END
END

-- Make LicenseMaster.LicenseOrganizationVersionKey non-nullable
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND COLUMN_NAME = 'LicenseOrganizationVersionKey')
    BEGIN
        ALTER TABLE [dbo].[LicenseMaster] ALTER COLUMN [LicenseOrganizationVersionKey] uniqueidentifier NOT NULL
    END
END
GO 

-- Drop the now-obsolete column field LicenseMaster.LicenseOrganizationKey
-- This has been replaced with LicenseOrganizationVersionKey

-- Drop the old index first
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LicenseMaster]') AND name = N'IX_LicenseMaster_LicenseOrganizationKey')
DROP INDEX [IX_LicenseMaster_LicenseOrganizationKey] ON [dbo].[LicenseMaster] WITH ( ONLINE = OFF )
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LicenseMaster_LicenseOrganization]') AND parent_object_id = OBJECT_ID(N'[dbo].[LicenseMaster]'))
ALTER TABLE [dbo].[LicenseMaster] DROP CONSTRAINT [FK_LicenseMaster_LicenseOrganization]
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LicenseMaster' AND COLUMN_NAME = 'LicenseOrganizationKey')
    BEGIN
        ALTER TABLE [dbo].[LicenseMaster] DROP COLUMN [LicenseOrganizationKey]
    END
END
GO

------------------------------------------------------------------
-- Add new Product.RelatedContentMessage NULL column nvarchar(max)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'RelatedContentMessage')
    BEGIN
        ALTER TABLE [dbo].[Product] ADD [RelatedContentMessage] nvarchar(max) NULL
    END
END
GO

----------------------------------------------------------------------------------------------------------
--PBI 54477 Downloadable Content 1b: v10 HTML message to purchasers
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------
--Remove Product.RelatedContentMessage from Product Table
----------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'RelatedContentMessage')
    BEGIN
        ALTER TABLE [dbo].[Product] DROP COLUMN [RelatedContentMessage];
    END
END
GO
-----------------------------
-- Drop Product.TIME_STAMP 
------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product] DROP COLUMN [TIME_STAMP];
    END
END
GO
----------------------------------------------------------
--Add Product.RELATED_CONTENT_MESSAGE varchar(max) NULL
----------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'RELATED_CONTENT_MESSAGE')
    BEGIN
        ALTER TABLE [dbo].[Product] ADD [RELATED_CONTENT_MESSAGE] varchar(max) NULL;
    END
END
GO
----------------------------------------------
-- Add a new NULL column Product.TIME_STAMP
----------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

----------------------------------------------------------------------------------------------------------
--PBI 54568 Add MINIMUM_GIFT_AMOUNT column
----------------------------------------------------------------------------------------------------------

BEGIN

    DECLARE @restoreProductKey bit
    DECLARE @productKeyMap TABLE ([PRODUCT_CODE] varchar(100) PRIMARY KEY, [ProductKey] uniqueidentifier)
    SET @restoreProductKey = 0

    ALTER TABLE [dbo].[Product] DISABLE TRIGGER ALL

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
    -- Drop MyTable.TIME_STAMP column to allow columns to be appended to Activity
    ---------------------------------------------------------------------------------------
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Product] DROP COLUMN [TIME_STAMP]
        END
    END

    ----------------------------------------------------------------------------------------------------------
    --Add MINIMUM_GIFT_AMOUNT column with default monetary value of 0.00
    ----------------------------------------------------------------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'MINIMUM_GIFT_AMOUNT')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [MINIMUM_GIFT_AMOUNT] money 
                  CONSTRAINT DF_Product_MINIMUM_GIFT_AMOUNT DEFAULT (0) NOT NULL
        END
    END
    
    ------------------------------------------------
    -- Add a new NULL column MyTable.TIME_STAMP
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
                UPDATE [dbo].[Product] SET [ProductKey]=pkm.[ProductKey]
                  FROM [dbo].[Product]
                  INNER JOIN @productKeyMap pkm ON [dbo].[Product].[PRODUCT_CODE]=pkm.[PRODUCT_CODE]
            END
        END
    END

    ALTER TABLE [dbo].[Product] ENABLE TRIGGER ALL

END
GO

---------------------------------------------------------------------------------------
-- PBI 52106 - add a column to the Name table
-- Drop Name.TIME_STAMP column to allow columns to be appended to Activity
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Name] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Name.MOBILE_PHONE NOT NULL column with a default of ('')
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'MOBILE_PHONE')
    BEGIN
        ALTER TABLE [dbo].[Name] ADD [MOBILE_PHONE] varchar(25) 
              CONSTRAINT DF_Name_MOBILE_PHONE DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Name.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Name] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

-- Rename column to have correct casing
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Theme')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'Theme' AND COLUMN_NAME COLLATE SQL_Latin1_General_CP1_CS_AS = N'MasterPageFilename' COLLATE SQL_Latin1_General_CP1_CS_AS)
    BEGIN
        EXEC sp_RENAME N'Theme.MasterPageFilename' , N'MasterPageFileName', N'COLUMN';
    END
END
GO

----------------------------------------------------------------------------------------------------
--- SBT: 55367 Correct the misspelling of a DonationPremiumSetDesc col. name in DonationPremiumSet
----------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet')
BEGIN
    IF  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
         WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet' AND COLUMN_NAME = 'DonationPremumSetDesc')
    BEGIN
         EXEC sp_rename 'DonationPremiumSet.[DonationPremumSetDesc]', 'DonationPremiumSetDesc', 'COLUMN'
    END      
END
GO

----------------------------------------------------------------------------------------------------
--- SBT: 54435 Drop constraint that is no longer necessary
----------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND name = N'AK_GroupMemberRoleDate')
    ALTER TABLE [dbo].[GroupMemberDetail] DROP CONSTRAINT [AK_GroupMemberRoleDate]
GO

---------------------------------------------------------------------------------------------------
---- SBT 56348 Get rid of NOT NULL requirement for DonationPremiumSet
---------------------------------------------------------------------------------------------------
----------------------------------
-- Make DonationPremiumSet.DonationPremiumSetName nullable
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet' AND COLUMN_NAME = 'DonationPremiumSetName')
    BEGIN
        ALTER TABLE [dbo].[DonationPremiumSet] ALTER COLUMN [DonationPremiumSetName] nvarchar(65) NULL
    END
END
GO

----------------------------------
-- Make DonationPremiumSet.DonationPremiumSetDesc nullable
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet' AND COLUMN_NAME = 'DonationPremiumSetDesc')
    BEGIN
        ALTER TABLE [dbo].[DonationPremiumSet] ALTER COLUMN [DonationPremiumSetDesc] nvarchar(500) NULL
    END
END
GO    

-------------------------------------
-- Remove uneeded column
-------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DonationPremiumSet' AND COLUMN_NAME = 'DonationPremiumSetIsDefault')
    BEGIN
        ALTER TABLE [dbo].[DonationPremiumSet] DROP COLUMN [DonationPremiumSetIsDefault]
    END
END
GO

-- Convert columns to SPARSE and drop unnecessary indexes
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_IntValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_IntValue ON dbo.UserDefinedSingleInstanceProperty
ALTER TABLE dbo.UserDefinedSingleInstanceProperty ALTER COLUMN PropertyIntValue int SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_DateTimeValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_DateTimeValue ON dbo.UserDefinedSingleInstanceProperty
ALTER TABLE dbo.UserDefinedSingleInstanceProperty ALTER COLUMN PropertyDateTimeValue datetime SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_GuidValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_GuidValue ON dbo.UserDefinedSingleInstanceProperty
ALTER TABLE dbo.UserDefinedSingleInstanceProperty ALTER COLUMN PropertyGuidValue uniqueidentifier SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_DecimalValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_DecimalValue ON dbo.UserDefinedSingleInstanceProperty
ALTER TABLE dbo.UserDefinedSingleInstanceProperty ALTER COLUMN PropertyDecimalValue decimal(38,12) SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_StringValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_StringValue ON dbo.UserDefinedSingleInstanceProperty
ALTER TABLE dbo.UserDefinedSingleInstanceProperty ALTER COLUMN PropertyStringValue nvarchar(400) SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedSingleInstanceProperty_BooleanValue') DROP INDEX IX_UserDefinedSingleInstanceProperty_BooleanValue ON dbo.UserDefinedSingleInstanceProperty

-- Convert columns to SPARSE and drop unnecessary indexes
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_IntValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_IntValue ON dbo.UserDefinedMultiInstanceProperty
ALTER TABLE dbo.UserDefinedMultiInstanceProperty ALTER COLUMN PropertyIntValue int SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_DateTimeValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_DateTimeValue ON dbo.UserDefinedMultiInstanceProperty
ALTER TABLE dbo.UserDefinedMultiInstanceProperty ALTER COLUMN PropertyDateTimeValue datetime SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_GuidValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_GuidValue ON dbo.UserDefinedMultiInstanceProperty
ALTER TABLE dbo.UserDefinedMultiInstanceProperty ALTER COLUMN PropertyGuidValue uniqueidentifier SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_DecimalValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_DecimalValue ON dbo.UserDefinedMultiInstanceProperty
ALTER TABLE dbo.UserDefinedMultiInstanceProperty ALTER COLUMN PropertyDecimalValue decimal(38,12) SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_StringValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_StringValue ON dbo.UserDefinedMultiInstanceProperty
ALTER TABLE dbo.UserDefinedMultiInstanceProperty ALTER COLUMN PropertyStringValue nvarchar(400) SPARSE NULL;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_UserDefinedMultiInstanceProperty_BooleanValue') DROP INDEX IX_UserDefinedMultiInstanceProperty_BooleanValue ON dbo.UserDefinedMultiInstanceProperty
GO

---------------------------------------------------------------------------------------------------
---- SBT 56501 Add PaymentTermsKey column to AutoPayInstruction table.
---------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentTermsKey')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] ADD [PaymentTermsKey] uniqueidentifier NULL
    END
END
GO

---------------------------------------------------------
-- iMISMain10 PB55508 
-- Modify table [Trans], Change CC_AUTHORIZE Length from 10 to 40
-- Modify table [Orders], Change AUTHORIZE Length from 10 to 40
-- Modify table [Order_Payments], Change AUTHORIZE Length from 10 to 40
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'CC_AUTHORIZE')
    BEGIN
        ALTER TABLE [dbo].[Trans] ALTER COLUMN [CC_AUTHORIZE] varchar(40) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'AUTHORIZE')
    BEGIN
        ALTER TABLE [dbo].[Orders] ALTER COLUMN [AUTHORIZE] varchar(40) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments' AND COLUMN_NAME = 'AUTHORIZE')
    BEGIN
        ALTER TABLE [dbo].[Order_Payments] ALTER COLUMN [AUTHORIZE] varchar(40) NOT NULL
    END
END
GO

-- End of script
SET NOCOUNT OFF
GO