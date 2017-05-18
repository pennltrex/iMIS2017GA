----------------------------
-- Modify Existing Tables --
----------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

------------------------------------------
-- Add a new NULL column CartBilling.ID
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CartBilling')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CartBilling' AND COLUMN_NAME = 'ID')
    BEGIN
        ALTER TABLE [dbo].[CartBilling] ADD [ID] varchar(10) NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Cart.CreatedBy
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart' AND COLUMN_NAME = 'CreatedBy')
    BEGIN
        ALTER TABLE [dbo].[Cart] ADD [CreatedBy] nvarchar(50) NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Cart.CreatedOn
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart' AND COLUMN_NAME = 'CreatedOn')
    BEGIN
        ALTER TABLE [dbo].[Cart] ADD [CreatedOn] datetime NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Cart.UpdatedBy
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart' AND COLUMN_NAME = 'UpdatedBy')
    BEGIN
        ALTER TABLE [dbo].[Cart] ADD [UpdatedBy] nvarchar(50) NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Cart.UpdatedOn
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Cart' AND COLUMN_NAME = 'UpdatedOn')
    BEGIN
        ALTER TABLE [dbo].[Cart] ADD [UpdatedOn] datetime NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Meet_Master.TIME_STAMP column to allow columns to be appended to Meet_Master
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] DROP COLUMN [TIME_STAMP]
    END
END
GO

--------------------------------------------------------------------------
-- Add new Meet_Master.VAT_RULESET NOT NULL column with a default of ('')
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'VAT_RULESET')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [VAT_RULESET] varchar(10) 
              CONSTRAINT DF_Meet_Master_VAT_RULESET DEFAULT ('') NOT NULL
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
        ALTER TABLE [dbo].[Meet_Master] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

--------------------------------------------------------------------
-- Change length of Perspective.PerspectiveName to be 100 characters
--------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Perspective')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Perspective' AND COLUMN_NAME = 'PerspectiveName')
    BEGIN
        ALTER TABLE [dbo].[Perspective] ALTER COLUMN  [PerspectiveName] nvarchar(100) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Drop Product_Function.TIME_STAMP
------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Function.EVENT_TRACK NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'EVENT_TRACK')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [EVENT_TRACK] varchar(255) 
              CONSTRAINT DF_Product_Function_EVENT_TRACK DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Function.EVENT_CATEGORY NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'EVENT_CATEGORY')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [EVENT_CATEGORY] varchar(255) 
              CONSTRAINT DF_Product_Function_EVENT_CATEGORY DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Function.IS_EVENT_REGISTRATION_OPTION NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'IS_EVENT_REGISTRATION_OPTION')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [IS_EVENT_REGISTRATION_OPTION] bit 
              CONSTRAINT DF_Product_Function_IS_EVENT_REGISTRATION_OPTION DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Re-add Product_Function.TIME_STAMP
------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [TIME_STAMP] TIMESTAMP
    END
END
GO

-----------------------------------------------------
-- Add field for common code work
-----------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE TABLE_NAME = 'GroupTypeRef' AND COLUMN_NAME = 'LandingPageContentKey')
BEGIN
ALTER TABLE [dbo].[GroupTypeRef] 
      ADD   [LandingPageContentKey] uniqueidentifier NULL
END
GO

-----------------------------------------
-- Drop the now-obsolete IsRequired field
-----------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserDefinedFieldRef')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserDefinedFieldRef' AND COLUMN_NAME = 'IsRequired')
    BEGIN
        ALTER TABLE [dbo].[UserDefinedFieldRef] DROP COLUMN [IsRequired]
    END
END
GO

---------------------------------------------------------
-- Expand Name_Log text field from 255 to 8000 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Name_Log')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Name_Log' AND COLUMN_NAME = 'LOG_TEXT' AND CHARACTER_MAXIMUM_LENGTH <> 8000)
    BEGIN
        IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Name_Log_LOG_TEXT]') AND type = 'D')
        BEGIN
            ALTER TABLE [dbo].[Name_Log] DROP CONSTRAINT [DF_Name_Log_LOG_TEXT]
        END
        ALTER TABLE [dbo].[Name_Log] ALTER COLUMN [LOG_TEXT] varchar(8000) NOT NULL
        ALTER TABLE [dbo].[Name_Log] ADD CONSTRAINT [DF_Name_Log_LOG_TEXT] DEFAULT ('') FOR [LOG_TEXT]
    END
END
GO
