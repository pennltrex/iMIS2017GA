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

