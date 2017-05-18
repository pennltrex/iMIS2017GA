----------------------------------
-- Modify Existing Table Schema --
----------------------------------
SET NOCOUNT ON
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF

---------------------------------------------------------------------------------------
-- Drop Activity.TIME_STAMP column to allow columns to be appended to Activity
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Activity] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Activity.MEM_TRIB_CODE NOT NULL column with a default of ('')
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity' AND COLUMN_NAME = 'MEM_TRIB_CODE')
    BEGIN
        ALTER TABLE [dbo].[Activity] ADD [MEM_TRIB_CODE] varchar(10) 
              CONSTRAINT DF_Activity_MEM_TRIB_CODE DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Activity.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Activity] ADD [TIME_STAMP] timestamp NULL
    END
END
GO



SET NOCOUNT OFF
GO


------------------------------------------------------------------------------------------------
-- Change length of CFID, CFTOKEN in Basket_Order, Basket_Meeting, Basket_Dues from 50 to 60 characters
------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Order')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Order' AND COLUMN_NAME = 'CFID')
    BEGIN
        ALTER TABLE [dbo].[Basket_Order] ALTER COLUMN [CFID] varchar(60) NOT NULL
END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Order' AND COLUMN_NAME = 'CFTOKEN')
    BEGIN
        ALTER TABLE [dbo].[Basket_Order] ALTER COLUMN [CFTOKEN] varchar(60) NOT NULL
    END

END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Meeting')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Meeting' AND COLUMN_NAME = 'CFID')
    BEGIN
        ALTER TABLE [dbo].[Basket_Meeting] ALTER COLUMN [CFID] varchar(60) NOT NULL
END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Meeting' AND COLUMN_NAME = 'CFTOKEN')
    BEGIN
        ALTER TABLE [dbo].[Basket_Meeting] ALTER COLUMN [CFTOKEN] varchar(60) NOT NULL
    END

END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Dues')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Dues' AND COLUMN_NAME = 'CFID')
    BEGIN
        ALTER TABLE [dbo].[Basket_Dues] ALTER COLUMN [CFID] varchar(60) NOT NULL
END
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Basket_Dues' AND COLUMN_NAME = 'CFTOKEN')
    BEGIN
        ALTER TABLE [dbo].[Basket_Dues] ALTER COLUMN [CFTOKEN] varchar(60) NOT NULL
    END

END
GO

------------------------------------------
-- Add a new NULL column EventFunction.EarlyCutoffDate
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EventFunction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EventFunction' AND COLUMN_NAME = 'EarlyCutoffDate')
    BEGIN
        ALTER TABLE [dbo].[EventFunction] ADD [EarlyCutoffDate] [datetime] NULL
    END
END

------------------------------------------
-- Add a new NULL column EventFunction.RegularCutoffDate
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EventFunction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EventFunction' AND COLUMN_NAME = 'RegularCutoffDate')
    BEGIN
        ALTER TABLE [dbo].[EventFunction] ADD [RegularCutoffDate] [datetime] NULL
    END
END

GO
-----------------------------------------------
--- Add 3 new columns to GiftReport for PBI 24966
-----------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                  WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'MemorialTributeType')
    BEGIN              
       ALTER TABLE [dbo].[GiftReport] ADD [MemorialTributeType] varchar(10) 
             CONSTRAINT DF_GiftReport_MemorialTributeType DEFAULT ('') NOT NULL
    END 
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                  WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'MemorialTributeMessage')
    BEGIN              
       ALTER TABLE [dbo].[GiftReport] ADD [MemorialTributeMessage] text 
         CONSTRAINT DF_GiftReport_MemorialTributeMessage DEFAULT ('') NOT NULL
    END 
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                  WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GiftReport' AND COLUMN_NAME = 'TributeNotificationContactID')
    BEGIN              
       ALTER TABLE [dbo].[GiftReport] ADD [TributeNotificationContactID] varchar(10) 
         CONSTRAINT DF_GiftReport_TributeNotificationContactID DEFAULT ('') NOT NULL
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
-- Add new Meet_Master.REG_CLASS_STORED_PROC NOT NULL column default ''
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'REG_CLASS_STORED_PROC')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [REG_CLASS_STORED_PROC] varchar(100)
			CONSTRAINT DF_Meet_Master_REG_CLASS_STORED_PROC DEFAULT ('') NOT NULL
    END
END
GO

--------------------------------------------------------------------------
-- Add new Meet_Master.WEB_REG_CLASS_METHOD NOT NULL column default ''
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'WEB_REG_CLASS_METHOD')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [WEB_REG_CLASS_METHOD] int
			CONSTRAINT DF_Meet_Master_WEB_REG_CLASS_METHOD DEFAULT (0) NOT NULL
    END
END
GO

--------------------------------------------------------------------------
-- Add new Meet_Master.REG_OTHERS NOT NULL column default 0
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'REG_OTHERS')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [REG_OTHERS] bit
			CONSTRAINT DF_Meet_Master_REG_OTHERS DEFAULT (0) NOT NULL
    END
END
GO
--------------------------------------------------------------------------
-- Add new Meet_Master.ADD_GUESTS NOT NULL column default 0
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'ADD_GUESTS')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [ADD_GUESTS] bit
			CONSTRAINT DF_Meet_Master_ADD_GUESTS DEFAULT (0) NOT NULL
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

---------------------------------------------------------------------------------------
-- Drop Trans.TIME_STAMP column to allow columns to be appended to Trans
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Trans] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Trans.TAX_AUTHORITY column with a default of ('')
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'TAX_AUTHORITY')
    BEGIN
        ALTER TABLE [dbo].[Trans] ADD [TAX_AUTHORITY] varchar(15) 
              CONSTRAINT DF_Trans_TAX_AUTHORITY DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Trans.TAX_RATE column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'TAX_RATE')
    BEGIN     
        ALTER TABLE [dbo].[Trans] ADD [TAX_RATE] numeric(15,4)
              CONSTRAINT DF_Trans_TAX_RATE DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Trans.TAX_1 column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'TAX_1')
    BEGIN     
        ALTER TABLE [dbo].[Trans] ADD [TAX_1] numeric(15,4)
              CONSTRAINT DF_Trans_TAX_1 DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Trans.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Trans] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Orders.TIME_STAMP column to allow columns to be appended to Orders
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Orders] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Orders.ORIGINATING_TRANS_NUM column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ORIGINATING_TRANS_NUM')
    BEGIN     
        ALTER TABLE [dbo].[Orders] ADD [ORIGINATING_TRANS_NUM] int
              CONSTRAINT DF_Orders_ORIGINATING_TRANS_NUM DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Orders.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Orders] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Org_Control.TIME_STAMP column to allow columns to be appended to Org_Control
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Org_Control DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Org_Control.VATInclusive NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control' AND COLUMN_NAME = 'VATInclusive')
    BEGIN
        ALTER TABLE [dbo].Org_Control ADD VATInclusive bit 
              CONSTRAINT DF_Org_Control_VATInclusive DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Org_Control.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Org_Control' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Org_Control ADD [TIME_STAMP] timestamp NULL
    END
END
GO
