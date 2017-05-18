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

-- Fix up some column lengths and ordinal positions potentially caused by previous baseline upgrade issues
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

---------------------------------------------------------------------------------------
-- Drop Product_Cat.TIME_STAMP column to allow repositioning to the end
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Cat')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Cat' AND COLUMN_NAME = 'TIME_STAMP'
                 AND ORDINAL_POSITION <> (SELECT MAX(ORDINAL_POSITION) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Cat')
              )
    BEGIN
        ALTER TABLE [dbo].[Product_Cat] DROP COLUMN [TIME_STAMP]
    END
END
GO
------------------------------------------------
-- Restore NULL column Product_Cat.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Cat')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Cat' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Cat] ADD [TIME_STAMP] timestamp NULL
    END
END
GO
---------------------------------------------------------------------------------------
-- Drop Name_Security.TIME_STAMP column to allow repositioning to the end
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Security')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Security' AND COLUMN_NAME = 'TIME_STAMP'
                 AND ORDINAL_POSITION <> (SELECT MAX(ORDINAL_POSITION) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Security')
              )
    BEGIN
        ALTER TABLE [dbo].[Name_Security] DROP COLUMN [TIME_STAMP]
    END
END
GO
------------------------------------------------
-- Restore NULL column Name_Security.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Security')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Security' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Name_Security] ADD [TIME_STAMP] timestamp NULL
    END
END
GO



------------------------------------------------------------------
-- PBI 57172 Add new CertificationProgramRegistration.CompletionDate NULL column 
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration' AND COLUMN_NAME = 'CompletionDate')
    BEGIN
        ALTER TABLE [dbo].[CertificationProgramRegistration] ADD [CompletionDate] datetime NULL           
    END
END
GO

------------------------------------------------------------------
-- PBI 60967 -  Add new EnagementScore.IsEnabled NOT NULL column with a default of (1)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementScore')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementScore' AND COLUMN_NAME = 'IsEnabled')
    BEGIN
        ALTER TABLE [dbo].[EngagementScore] ADD [IsEnabled] bit 
              CONSTRAINT DF_EngagementScore_IsEnabled DEFAULT (1) NOT NULL
    END
END
GO

----------------------------------------------------------------------------------------------------
-- iMISMain10 PBI:55490 Adding a new column Template_State_Code to Meet_Master table.
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
-- Add TEMPLATE_STATE_CODE
---------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TEMPLATE_STATE_CODE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD TEMPLATE_STATE_CODE INT NOT NULL CONSTRAINT DF_Meet_Master_Template_State_Code DEFAULT(0)
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
-- PBI 47644 - Conflict Codes 
------------------------------------------------
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

----------------------------------------------------
-- Add a new column Meet_Master.ENABLE_TIME_CONFLICTS
----------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'ENABLE_TIME_CONFLICTS')
    BEGIN
        ALTER TABLE [dbo].Meet_Master ADD [ENABLE_TIME_CONFLICTS] bit
            CONSTRAINT DF_Meet_Master_Enable_Time_Conflicts DEFAULT (0) NOT NULL
    END
END
GO

--------------------------------------------------------
-- Add a new column Meet_Master.ALLOW_REGISTRANT_CONFLICTS
--------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'ALLOW_REGISTRANT_CONFLICTS')
    BEGIN
        ALTER TABLE [dbo].Meet_Master ADD [ALLOW_REGISTRANT_CONFLICTS] bit 
            CONSTRAINT DF_Meet_Master_Allow_Registrant_Conflicts DEFAULT (0) NOT NULL
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

---------------------------------------------------------------------------------------
-- Drop Product_Function.TIME_STAMP column to allow columns to be appended to Product_Function
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

----------------------------------------------------
-- Add a new column Product_Function.ENABLE_TIME_CONFLICTS
----------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'ENABLE_TIME_CONFLICTS')
    BEGIN
        ALTER TABLE [dbo].Product_Function ADD [ENABLE_TIME_CONFLICTS] bit 
        CONSTRAINT DF_Product_Function_Enable_Time_Conflicts DEFAULT (0) NOT NULL
    END
END
GO
    
----------------------------------------------------
-- Add a new column Product_Function.WEB_CONFLICT_CODES
----------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'WEB_CONFLICT_CODES')
    BEGIN
        ALTER TABLE [dbo].Product_Function ADD [WEB_CONFLICT_CODES] varchar(255) NULL
    END
END
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
-- PBI 54699: Add a new NULL column ScoreComponent.LastRunOn
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ScoreComponent')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ScoreComponent' AND COLUMN_NAME = 'LastRunOn')
    BEGIN
        ALTER TABLE [dbo].[ScoreComponent] ADD [LastRunOn] datetime NULL
    END
END
GO

-------------------------------------
-- PBI 54669 - Drop the now-obsolete ScoreDate column 
-------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ScoreDate')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] DROP COLUMN [ScoreDate]
    END
END
GO

------------------------------------------------------------------
-- PBI 54669 - Add new CalculatedEngagementScore.ScoreYear, ScoreMonth, and ScoreWeek NULL columns
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ScoreYear')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] ADD [ScoreYear] int NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ScoreMonth')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] ADD [ScoreMonth] int NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ScoreWeek')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] ADD [ScoreWeek] int NULL
    END
END
GO

----------------------------------
-- PBI 54669 - Make CalculatedEngagementScore.ContactKey nullable
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ContactKey')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] ALTER COLUMN [ContactKey] uniqueidentifier NULL
    END
END
GO

-----------------------------------------------------------------------------------------------------------------------
-- Convert the RowID in Panel Editor tables to be varchar, consistent with other ID columns to make for efficient joins
-----------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'UserDefinedSingleInstanceProperty' AND COLUMN_NAME = N'RowID' AND DATA_TYPE = 'nvarchar')
BEGIN
    IF  EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_TableID')
    BEGIN
        DROP INDEX [IX_UserDefinedSingleInstanceProperty_TableID] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
    END
    IF  EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedSingleInstanceProperty_TableProperty')
    BEGIN
        DROP INDEX [IX_UserDefinedSingleInstanceProperty_TableProperty] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
    END
    IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'PK_UserDefinedSingleInstanceProperty')
    BEGIN
        ALTER TABLE [dbo].[UserDefinedSingleInstanceProperty] DROP CONSTRAINT [PK_UserDefinedSingleInstanceProperty]
    END
    ALTER TABLE [dbo].[UserDefinedSingleInstanceProperty] ALTER COLUMN [RowID] varchar(16) NOT NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'UserDefinedMultiInstanceProperty' AND COLUMN_NAME = N'RowID' AND DATA_TYPE = 'nvarchar')
BEGIN
    IF  EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_TableID')
    BEGIN
        DROP INDEX [IX_UserDefinedMultiInstanceProperty_TableID] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
    END
    IF  EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_TableProperty')
    BEGIN
        DROP INDEX [IX_UserDefinedMultiInstanceProperty_TableProperty] ON [dbo].[UserDefinedMultiInstanceProperty] WITH ( ONLINE = OFF )
    END
    IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND name = N'PK_UserDefinedMultiInstanceProperty')
    BEGIN
        ALTER TABLE [dbo].[UserDefinedMultiInstanceProperty] DROP CONSTRAINT [PK_UserDefinedMultiInstanceProperty]
    END
    ALTER TABLE [dbo].[UserDefinedMultiInstanceProperty] ALTER COLUMN [RowID] varchar(16) NOT NULL
END


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'UserDefinedTableStorage' AND COLUMN_NAME = N'RowID' AND DATA_TYPE = 'nvarchar')
BEGIN
    IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedTableStorage]') AND name = N'PK_UserDefinedTableStorage')
    BEGIN
        ALTER TABLE [dbo].[UserDefinedTableStorage] DROP CONSTRAINT [PK_UserDefinedTableStorage]
    END
    ALTER TABLE [dbo].[UserDefinedTableStorage] ALTER COLUMN [RowID] varchar(16) NOT NULL
END
GO

---------------------------------------------------------------------------------------------
-- PBI 60135 - Delete query that finds notify contacts with both an email and mailing address
---------------------------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '9D0C6450-029A-4C18-AECD-0995E30326FB', 1
GO

---------------------------------------------------------------------
-- SBT60599 - prep Trans and Orders for AES Encryption
---------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'ENCRYPT_CC_NUMBER')
    BEGIN
        IF COL_LENGTH ( 'Trans' , 'ENCRYPT_CC_NUMBER' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Trans] ALTER COLUMN [ENCRYPT_CC_NUMBER] varchar(150) NOT NULL
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'ENCRYPT_CC_EXPIRE')
    BEGIN
        IF COL_LENGTH ( 'Trans' , 'ENCRYPT_CC_EXPIRE' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Trans] ALTER COLUMN ENCRYPT_CC_EXPIRE varchar(150) NOT NULL
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'ENCRYPT_CSC')
    BEGIN
        IF COL_LENGTH ( 'Trans' , 'ENCRYPT_CSC' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Trans] ALTER COLUMN ENCRYPT_CSC varchar(150) NOT NULL
        END
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ENCRYPT_PAY_NUMBER')
    BEGIN
        IF COL_LENGTH ( 'Orders' , 'ENCRYPT_PAY_NUMBER' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Orders] ALTER COLUMN [ENCRYPT_PAY_NUMBER] varchar(150) NOT NULL
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ENCRYPT_CREDIT_CARD_EXPIRES')
    BEGIN
        IF COL_LENGTH ( 'Orders' , 'ENCRYPT_CREDIT_CARD_EXPIRES' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Orders] ALTER COLUMN ENCRYPT_CREDIT_CARD_EXPIRES varchar(150) NOT NULL
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ENCRYPT_CSC')
    BEGIN
        IF COL_LENGTH ( 'Orders' , 'ENCRYPT_CSC' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Orders] ALTER COLUMN ENCRYPT_CSC varchar(150) NOT NULL
        END
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PciAuditLog')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PciAuditLog' AND COLUMN_NAME = 'ENCRYPT_CC_NUMBER')
    BEGIN
        IF COL_LENGTH ( 'PciAuditLog' , 'ENCRYPT_CC_NUMBER' ) < 101
        BEGIN
          ALTER TABLE [dbo].[PciAuditLog] ALTER COLUMN [ENCRYPT_CC_NUMBER] varchar(150)  
        END
    END
END

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments' AND COLUMN_NAME = 'ENCRYPT_PAY_NUMBER')
    BEGIN
        IF COL_LENGTH ( 'Order_Payments' , 'ENCRYPT_PAY_NUMBER' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Order_Payments] ALTER COLUMN [ENCRYPT_PAY_NUMBER] varchar(150) NOT NULL 
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments' AND COLUMN_NAME = 'ENCRYPT_CREDIT_CARD_EXPIRES')
    BEGIN
        IF COL_LENGTH ( 'Order_Payments' , 'ENCRYPT_CREDIT_CARD_EXPIRES' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Order_Payments] ALTER COLUMN [ENCRYPT_CREDIT_CARD_EXPIRES] varchar(150) NOT NULL 
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Payments' AND COLUMN_NAME = 'ENCRYPT_CSC')
    BEGIN
        IF COL_LENGTH ( 'Order_Payments' , 'ENCRYPT_CSC' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Order_Payments] ALTER COLUMN [ENCRYPT_CSC] varchar(150) NOT NULL 
        END
    END
END

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Payment')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Payment' AND COLUMN_NAME = 'ENCRYPT_PAY_NUMBER')
    BEGIN
        IF COL_LENGTH ( 'Basket_Payment' , 'ENCRYPT_PAY_NUMBER' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Basket_Payment] ALTER COLUMN [ENCRYPT_PAY_NUMBER] varchar(150) NOT NULL 
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Payment' AND COLUMN_NAME = 'ENCRYPT_CREDIT_CARD_EXPIRES')
    BEGIN
        IF COL_LENGTH ( 'Basket_Payment' , 'ENCRYPT_CREDIT_CARD_EXPIRES' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Basket_Payment] ALTER COLUMN [ENCRYPT_CREDIT_CARD_EXPIRES] varchar(150) NOT NULL 
        END
    END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Payment' AND COLUMN_NAME = 'ENCRYPT_CSC')
    BEGIN
        IF COL_LENGTH ( 'Basket_Payment' , 'ENCRYPT_CSC' ) < 101
        BEGIN
          ALTER TABLE [dbo].[Basket_Payment] ALTER COLUMN [ENCRYPT_CSC] varchar(150) NOT NULL 
        END
    END
END

GO

---------------------------------------------------------------------------------------------
-- PBI 60457 - Add SEQN and NOTIFICATION_SENT_ON columns to Trans_Notify
---------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify')
BEGIN

    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'NOTIFICATION_SENT_ON') 
    OR NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'SEQN')
    BEGIN

        ---------------------------------------------------------------------------------------
        -- Drop Trans_Notify.TIME_STAMP column to allow columns to be appended to Trans_Notify
        ---------------------------------------------------------------------------------------
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Trans_Notify] DROP COLUMN [TIME_STAMP]
        END

        ------------------------------------------
        -- Add a new NULL column Trans_Notify.NOTIFICATION_SENT_ON
        ------------------------------------------
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'NOTIFICATION_SENT_ON')
        BEGIN
            ALTER TABLE [dbo].[Trans_Notify] ADD [NOTIFICATION_SENT_ON] datetime NULL
        END

        ------------------------------------------
        -- Add a new identity column Trans_Notify.SEQN
        ------------------------------------------
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'SEQN')
        BEGIN
            ALTER TABLE [dbo].[Trans_Notify] ADD [SEQN] int IDENTITY(1,1) NOT NULL
        END

        ------------------------------------------------
        -- Add a new NULL column Trans_Notify.TIME_STAMP
        ------------------------------------------------
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans_Notify' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Trans_Notify] ADD [TIME_STAMP] timestamp NULL
        END
        
    END

END

---------------------------------------------------------------------------------------
-- Drop GiftReport.TIME_STAMP column and re-add it to the end if it's not already at the end
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
    
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'TIME_STAMP' AND ORDINAL_POSITION = (SELECT MAX(ORDINAL_POSITION) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GiftReport'))
        BEGIN
            ALTER TABLE [dbo].[GiftReport] DROP COLUMN [TIME_STAMP]
            
            ALTER TABLE [dbo].[GiftReport] ADD [TIME_STAMP] timestamp NULL
        END
    END
END

GO

----------------------------------
-- PBI 60205 - Make CalculatedEngagementScore.ScoreComponentKey nullable
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CalculatedEngagementScore' AND COLUMN_NAME = 'ScoreComponentKey')
    BEGIN
        ALTER TABLE [dbo].[CalculatedEngagementScore] ALTER COLUMN [ScoreComponentKey] uniqueidentifier NULL
    END
END
GO

----------------------------------------------------------------------------------------------------------------------------
-- SBT 60302 DEV - DV is holding an InternalInstruction for iATS and SecurePay DD, but we need this info in iMIS
-- Add a new NULL column DataVaultAttempt.AuthorizationCode
-- Add a new NULL column DataVaultAttempt.GatewayTransactionId
----------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultAttempt')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultAttempt' AND COLUMN_NAME = 'AuthorizationCode')
    BEGIN
        ALTER TABLE [dbo].[DataVaultAttempt] ADD [AuthorizationCode] nvarchar(255) NULL
    END

    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultAttempt' AND COLUMN_NAME = 'GatewayTransactionId')
    BEGIN
        ALTER TABLE [dbo].[DataVaultAttempt] ADD [GatewayTransactionId] nvarchar(50) NULL
    END
END
GO

------------------------------------------------------------------
-- PBI 61330 Add new ScoreComponent.IsSampled NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ScoreComponent')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ScoreComponent' AND COLUMN_NAME = 'IsSampled')
    BEGIN
        ALTER TABLE [dbo].[ScoreComponent] ADD [IsSampled] bit 
              CONSTRAINT DF_ScoreComponent_IsSampled DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------
-- SBT 61616 Add a new NULL column PasswordHistory.ID
------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PasswordHistory')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PasswordHistory' AND COLUMN_NAME = 'ID')
    BEGIN
        ALTER TABLE [dbo].[PasswordHistory] ADD [ID] varchar(10) NOT NULL
    END
END

GO

------------------------------------------------------
-- SBT 62446 Add a new NULL column LocalizationCulture.LocalizationCultureDisplayName
------------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = N'LocalizationCultureDisplayName' AND [object_id] = Object_ID(N'LocalizationCulture'))
BEGIN
    ALTER TABLE [dbo].[LocalizationCulture] 
            ADD LocalizationCultureDisplayName nvarchar(50) NULL 
END

GO

---------------------------------------------------------
-- PBI 61860 Change EngagementCategory.Color from int to 50 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementCategory')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementCategory' AND COLUMN_NAME = 'Color' AND DATA_TYPE = 'int')
    BEGIN
        ALTER TABLE [dbo].[EngagementCategory] ALTER COLUMN [Color] nvarchar(50) NULL
    END
END
GO


---------------------------------------------------------------------------------------------------------
-- PBI 62397 Add NCODE column to Gen_Tables to keep an nvarchar copy of the CODE column for use in joins
---------------------------------------------------------------------------------------------------------

-- Drop Gen_Tables.TIME_STAMP column to allow columns to be appended 
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Gen_Tables')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Gen_Tables' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Gen_Tables] DROP COLUMN [TIME_STAMP]
    END
END
GO

-- Add new NCODE column
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Gen_Tables' AND COLUMN_NAME = 'NCODE')
BEGIN
    ALTER TABLE [dbo].[Gen_Tables] ADD NCODE nvarchar(60) NULL;
END
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Gen_Tables' AND COLUMN_NAME = 'NCODE' AND IS_NULLABLE = 'YES')
BEGIN
    UPDATE [dbo].[Gen_Tables]
       SET [NCODE] = CAST([CODE] AS nvarchar(60));
    ALTER TABLE [dbo].[Gen_Tables] ALTER COLUMN NCODE nvarchar(60) NOT NULL;
END
GO

-- Restore the Gen_Tables.TIME_STAMP column
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Gen_Tables')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Gen_Tables' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Gen_Tables] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

----------------------------------------------------------------------------------------
-- PBI 63060 Fix up nullability issue so following SQL executes correctly with correct assumptions
----------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'AutoPayAccountKey' AND IS_NULLABLE = 'YES')
   AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentToken')
BEGIN
    ALTER TABLE AutoPayInstruction
        ALTER COLUMN AutoPayAccountKey UNIQUEIDENTIFIER NOT NULL
END;
GO

--------------------------------------------------------------
-- PBI 62561 Add new nullable column with an FK to AutoPayInstruction
--------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'AutoPayAccountKey')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] ADD [AutoPayAccountKey] uniqueidentifier NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------- 
--- PBI 62561 Move data from AutoPayInstruction table to new AutoPayAccount table:
--------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'AutoPayAccountKey' AND IS_NULLABLE = 'YES')
BEGIN

    -- Clean up any existing temp table, should it already exist                                    
    IF OBJECT_ID('tempdb..#tempAutoPayAccount') IS NOT NULL
        DROP TABLE #tempAutoPayAccount 

     -- Create a tmp table                         
    CREATE TABLE #tempAutoPayAccount ([AutoPayAccountKey] [uniqueidentifier] NULL, 
                                      [AutoPayInstructionKey] [uniqueidentifier] NULL,
                                      [AutoPayAccountStatusCode] [nvarchar](10) NULL,
                                      [CustomerId] [varchar](10) NOT NULL,
                                      [PaymentMethodId] [varchar](10) NOT NULL,
                                      [PaymentMethodSummary] [varchar](50) NOT NULL,
                                      [PaymentToken] [uniqueidentifier] NOT NULL,
                                      [PaymentTokenExpirationDate] [datetime] NULL,
                                      [CreatedByUserKey] [uniqueidentifier] NOT NULL,
                                      [CreatedOn] [datetime] NOT NULL,
                                      [UpdatedByUserKey] [uniqueidentifier] NOT NULL,
                                      [UpdatedOn] [datetime] NOT NULL)

    DECLARE @sql nvarchar(max);
    SET @sql =
    'INSERT INTO #tempAutoPayAccount ([AutoPayAccountKey], [AutoPayInstructionKey], [AutoPayAccountStatusCode], [CustomerId], [PaymentMethodId], [PaymentMethodSummary], 
                                     [PaymentToken], [PaymentTokenExpirationDate], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn])
        SELECT NEWID(), [InstructionId], CASE WHEN [Status] = ''Cancelled'' THEN ''Inactive'' ELSE [Status] END, [CustomerId], [PaymentMethodId], [PaymentMethodSummary], 
               [PaymentToken], [PaymentTokenExpirationDate], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn]
            FROM [dbo].[AutoPayInstruction]';
    EXEC(@sql);

    INSERT INTO [dbo].[AutoPayAccount] ([AutoPayAccountKey], [AutoPayAccountStatusCode], [CustomerId], [PaymentMethodId], [PaymentMethodSummary], 
                                        [PaymentToken], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [PaymentTokenExpirationDate])
        SELECT [AutoPayAccountKey], [AutoPayAccountStatusCode], [CustomerId], [PaymentMethodId], [PaymentMethodSummary], 
               [PaymentToken], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [PaymentTokenExpirationDate]
            FROM #tempAutoPayAccount

    -- Create an index to optimize the update      
    CREATE NONCLUSTERED INDEX [IX_#tmpAutoPayAccount_AutoPayInstructionId] ON #tempAutoPayAccount ([AutoPayInstructionKey] ASC) INCLUDE ([AutoPayAccountKey]);

    -- Copy the generated key back to the parent table
    UPDATE i
        SET [AutoPayAccountKey] = a.[AutoPayAccountKey]
        FROM [dbo].[AutoPayInstruction] i
            INNER JOIN #tempAutoPayAccount a ON i.[InstructionId] = a.[AutoPayInstructionKey]
       
    -- Clean up the temp table                                    
    IF OBJECT_ID('tempdb..#tempAutoPayAccount') IS NOT NULL
        DROP TABLE #tempAutoPayAccount 

    ALTER TABLE [dbo].[AutoPayInstruction]
        ALTER COLUMN [AutoPayAccountKey] uniqueidentifier NOT NULL

END
GO

---------------------------------------------------------------------------------------------------------
-- PBI 62561 Delete fields from AutoPayInstruction table:
---------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- Drop the now-obsolete column indexes and fields:
-- PaymentMethodId, PaymentMethodSummary, PaymentToken, PaymentTokenExpirationDate
------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    -- PaymentMethodId
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentMethodId')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] DROP COLUMN [PaymentMethodId]
    END
    -- PaymentMethodSummary
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentMethodSummary')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] DROP COLUMN [PaymentMethodSummary]
    END
    -- PaymentToken
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentToken')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] DROP COLUMN [PaymentToken]
    END
    -- PaymentTokenExpirationDate
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentTokenExpirationDate')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] DROP COLUMN [PaymentTokenExpirationDate]
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 62935 Change length of PhysicalAddress.BarCode to be 40 characters
---------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress' AND COLUMN_NAME = 'BarCode')
    BEGIN
        ALTER TABLE [dbo].[PhysicalAddress] ALTER COLUMN [BarCode] nvarchar(40) NULL
    END
END
GO

------------------------------------------
-- PBI 62601 Add a new NULL column PhysicalAddress.BarcodeSortPlanNumber
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress' AND COLUMN_NAME = 'BarcodeSortPlanNumber')
    BEGIN
        ALTER TABLE [dbo].[PhysicalAddress] ADD [BarcodeSortPlanNumber] nvarchar(10) NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 62998 Change length of Name_Address.MAIL_CODE to be 10 characters
---------------------------------------------------------------------------------------------------------
-- First drop the default contstraint
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Name_Address_MAIL_CODE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Name_Address] DROP CONSTRAINT [DF_Name_Address_MAIL_CODE]
END
GO
-- Extend the column
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address' AND COLUMN_NAME = 'MAIL_CODE')
    BEGIN
        ALTER TABLE [dbo].[Name_Address] ALTER COLUMN [MAIL_CODE] varchar(10) NOT NULL
    END
END
GO
-- Re-add the default constraint
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Name_Address_MAIL_CODE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Name_Address] ADD  CONSTRAINT [DF_Name_Address_MAIL_CODE]  DEFAULT ('') FOR [MAIL_CODE]
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 63201 Change length of Name.MAIL_CODE to be 10 characters
---------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'MAIL_CODE')
    BEGIN
        ALTER TABLE [dbo].[Name] ALTER COLUMN [MAIL_CODE] varchar(10) NOT NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 63201 Change length of Orders.MAIL_CODE to be 10 characters
---------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'MAIL_CODE')
    BEGIN
        ALTER TABLE [dbo].[Orders] ALTER COLUMN [MAIL_CODE] varchar(10) NOT NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 63201 Change length of Subscriptions.MAIL_CODE to be 10 characters
---------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions' AND COLUMN_NAME = 'MAIL_CODE')
    BEGIN
        ALTER TABLE [dbo].[Subscriptions] ALTER COLUMN [MAIL_CODE] varchar(10) NOT NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- SBI 63201 Change length of Rpt_WorkingTbl.MAIL_CODE to be 10 characters
---------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl' AND COLUMN_NAME = 'MAIL_CODE')
    BEGIN
        ALTER TABLE [dbo].[Rpt_WorkingTbl] ALTER COLUMN [MAIL_CODE] varchar(10) NOT NULL
    END
END
GO

---------------------------------------------------------------------------------------------------------
-- PBI 62595 Engagement Scoring: Provide Overall engagement formula on install and upgrade
---------------------------------------------------------------------------------------------------------

--Create new SystemTypeRef table
IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemTypeRef] (
    [SystemTypeCode] int NOT NULL,
    [SystemTypeName] nvarchar(30) NOT NULL,
    [SystemTypeRefDesc] nvarchar(256) NULL,
    CONSTRAINT [PK_SystemTypeRef] PRIMARY KEY  CLUSTERED      ([SystemTypeCode] ) 
)
END
GO

-- Alter EngagementScore and add new SystemTypeCode column
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementScore')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementScore' AND COLUMN_NAME = 'SystemTypeCode')
    BEGIN
        ALTER TABLE [dbo].[EngagementScore] ADD [SystemTypeCode] int NULL           
    END
END
GO

-- Update the existing EngagementScore line(s) if NULL and set as (20) 'Editable'
IF EXISTS (SELECT 1 FROM [dbo].[EngagementScore])
BEGIN
    UPDATE [dbo].[EngagementScore] SET [SystemTypeCode] = 20
    WHERE [SystemTypeCode] IS NULL
END

-- Alter EngagementScore.SystemTypeCode to NOT NULL
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EngagementScore' AND COLUMN_NAME = 'SystemTypeCode' 
        AND IS_NULLABLE = 'YES')
BEGIN
    ALTER TABLE [dbo].[EngagementScore] ALTER COLUMN [SystemTypeCode] int NOT NULL 
END
GO
--- PBI 62966 - add new discount code column to order_lines
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] DROP COLUMN [TIME_STAMP]
    END
END
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'DISCOUNT_CODE')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [DISCOUNT_CODE] varchar(50) NULL
    END
END
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

------------------------------------------
-- Add a new NOT NULL column DataVaultLogDetail.PaymentMethodSummary -PBI 63874
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'PaymentMethodSummary')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [PaymentMethodSummary] varchar(50) CONSTRAINT DF_DataVaultLogDetail_PaymentMethodSummary DEFAULT('') NOT NULL
    END
END
GO

------------------------------------------
-- PBI 48310 Enhanced PCI Logging
------------------------------------------

IF EXISTS (SELECT 1
             FROM [INFORMATION_SCHEMA].[TABLES]
            WHERE [TABLE_SCHEMA] = 'dbo' AND [TABLE_NAME] = 'PciAuditLog'
          )
BEGIN
    IF NOT EXISTS (SELECT 1
                     FROM [INFORMATION_SCHEMA].[COLUMNS]
                    WHERE [TABLE_SCHEMA] = 'dbo' AND [TABLE_NAME] = 'PciAuditLog' AND [COLUMN_NAME] = 'Action'
                  )
    BEGIN
        ALTER TABLE [dbo].[PciAuditLog]
        ADD [Action] varchar(150) NULL;
    END;
END;

------------------------------------------
-- Add 2 new NOT NULL columns: AutoPayAccount.CustomerName & AutoPayAccount.CustomerAddress -PBI 63874
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayAccount')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayAccount' AND COLUMN_NAME = 'CustomerName')
    BEGIN
        ALTER TABLE [dbo].[AutoPayAccount] ADD [CustomerName] varchar(100) 
              CONSTRAINT DF_AutoPayAccount_CustomerName DEFAULT('') NOT NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayAccount' AND COLUMN_NAME = 'CustomerAddress')
    BEGIN
        ALTER TABLE [dbo].[AutoPayAccount] ADD [CustomerAddress] nvarchar(max) 
              CONSTRAINT DF_AutoPayAccount_CustomerAddress DEFAULT('') NOT NULL
    END
END
GO

------------------------------------------------------------------
-- PBI 65386 - Add column for Multi-factor authentication
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_SCHEMA] = 'dbo' AND [TABLE_NAME] = 'UserMain')
BEGIN
    IF NOT EXISTS (SELECT 1 FROM [INFORMATION_SCHEMA].[COLUMNS] 
                    WHERE [TABLE_SCHEMA] = 'dbo' AND [TABLE_NAME] = 'UserMain' AND [COLUMN_NAME] = 'MultiFactorInfo')
    BEGIN
        ALTER TABLE [dbo].[UserMain] ADD [MultiFactorInfo] nvarchar(MAX);
    END;
END;
GO

------------------------------------------------------------------------------------
-- PBI 64800 - Complete the Vantiv AutoUpdater connection with iMIS
-- SBT 65783 - DEV - v10 & v100 - Add columns to DataVault Attempt tables in iMIS
------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'AutoPayInstructionKey')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [AutoPayInstructionKey] uniqueidentifier NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'AutoPayAccountKey')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [AutoPayAccountKey] uniqueidentifier NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'PayorContactKey')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [PayorContactKey] uniqueidentifier NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'ReplacementPaymentToken')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [ReplacementPaymentToken] uniqueidentifier NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'ReplacementPaymentMethodSummary')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [ReplacementPaymentMethodSummary] nvarchar(50) NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'ReplacementPaymentMethodExpirationDate')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [ReplacementPaymentMethodExpirationDate] datetime NULL
    END
END
GO

---------------------------------------------------------------
-- PBI 65533 - Deprecate older themes
---------------------------------------------------------------
-- Add a new NULL column Theme.ScheduledRemovalDate
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Theme')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Theme' AND COLUMN_NAME = 'ScheduledRemovalDate')
    BEGIN
        ALTER TABLE [dbo].[Theme] ADD [ScheduledRemovalDate] datetime NULL
    END
END
GO

---------------------------------------------------------------
-- PBI 60729 - General Ledger Interface
---------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GLExport')
BEGIN
CREATE TABLE [dbo].[GLExport] (
    [GLExportKey]              uniqueidentifier NOT NULL,
    [Name]                     nvarchar(50) NULL,
    [Description]              nvarchar(255) NULL,
    [FinancialEntityId]        varchar(5) NOT NULL,
    [RunNumber]                int NOT NULL,
    [BeginDate]                datetime NOT NULL,
    [EndDate]                  datetime NOT NULL,
    [GLExportSummaryLevelCode] int NOT NULL,
    [SystemEntityKey]          uniqueidentifier NOT NULL,
    [CreatedByUserKey]         uniqueidentifier NOT NULL,
    [CreatedOn]                datetime NOT NULL,
    [UpdatedByUserKey]         uniqueidentifier NOT NULL,
    [UpdatedOn]                datetime NOT NULL,
    [MarkedForDeleteOn]        datetime NULL,
    CONSTRAINT PK_GLExport PRIMARY KEY CLUSTERED (GLExportKey)
)
END
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GLExportItem')
BEGIN
CREATE TABLE [dbo].[GLExportItem] (
    [GLExportKey]         uniqueidentifier NOT NULL,
    [TransactionId]       int NOT NULL,
    [MarkedForDeleteOn]   datetime NULL,
    CONSTRAINT PK_GLExportItem PRIMARY KEY CLUSTERED (GLExportKey, TransactionId)
)
END
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GLExportFormatTypeRef')
BEGIN
CREATE TABLE [dbo].[GLExportFormatTypeRef] (
    [GLExportFormatTypeCode] int NOT NULL,
    [GLExportFormatTypeName] nvarchar(25) NOT NULL,
    CONSTRAINT PK_GLExportFormatTypeRef PRIMARY KEY CLUSTERED (GLExportFormatTypeCode)
)
END
GO

---------------------------------------------------------------
-- PBI 64800 - Add boolean to indicate a payment method is read only (cannot be modified)
---------------------------------------------------------------
------------------------------------------------------------------
-- Add new NULL column DataVaultLogDetail.ReplacementPaymentMethodIsReadOnly
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DataVaultLogDetail' AND COLUMN_NAME = 'ReplacementPaymentMethodIsReadOnly')
    BEGIN
        ALTER TABLE [dbo].[DataVaultLogDetail] ADD [ReplacementPaymentMethodIsReadOnly] bit NULL
    END
END

------------------------------------------------------------------
-- Add new AutoPayAccount.PaymentMethodIsReadOnly NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayAccount')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayAccount' AND COLUMN_NAME = 'PaymentMethodIsReadOnly')
    BEGIN
        ALTER TABLE [dbo].[AutoPayAccount] ADD [PaymentMethodIsReadOnly] bit 
              CONSTRAINT DF_AutoPayAccount_PaymentMethodIsReadOnly DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- PBI 46979 Change Column Name in PriceSheet and GroupPriceSheet Table
------------------------------------------------------------------
------------------------------------------------------------------
-- Change Column Names in PriceSheet
------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PriceSheet' AND COLUMN_NAME = 'Name')
BEGIN
    EXEC sp_rename 'dbo.PriceSheet.Name', 'PriceSheetName', 'COLUMN' 
END    
go

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PriceSheet' AND COLUMN_NAME = 'Description')
BEGIN
    EXEC sp_rename 'dbo.PriceSheet.Description', 'PriceSheetDesc', 'COLUMN' 
END    
go

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PriceSheet' AND COLUMN_NAME = 'CustomerTypeId')
BEGIN
    EXEC sp_rename 'dbo.PriceSheet.CustomerTypeId', 'ProductPriceCustomerTypeId', 'COLUMN' 
END    
go

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PriceSheet' AND COLUMN_NAME = 'CustomerType')
BEGIN
    EXEC sp_rename 'dbo.PriceSheet.CustomerType', 'ProductPriceCustomerType', 'COLUMN' 
END    
go

------------------------------------------------------------------
-- Change Column Names in GroupPriceSheet
------------------------------------------------------------------

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupPriceSheet' AND COLUMN_NAME = 'GroupTypeKey')
BEGIN
    EXEC sp_rename 'dbo.GroupPriceSheet.GroupTypeKey', 'GroupClassId', 'COLUMN' 
END    
go

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupPriceSheet' AND COLUMN_NAME = 'GroupKey')
BEGIN
    EXEC sp_rename 'dbo.GroupPriceSheet.GroupKey', 'GroupId', 'COLUMN' 
END    
go

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupPriceSheet' AND COLUMN_NAME = 'GroupRoleKey')
BEGIN
    EXEC sp_rename 'dbo.GroupPriceSheet.GroupRoleKey', 'GroupRoleId', 'COLUMN' 
END    
go

-- End of script
SET NOCOUNT OFF
GO