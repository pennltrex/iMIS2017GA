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

---------------------------------------------------------
-- Change length of Batch.CREATED_BY to be 60 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch' AND COLUMN_NAME = 'CREATED_BY')
    BEGIN
        ALTER TABLE [dbo].[Batch] ALTER COLUMN [CREATED_BY] varchar(60) NOT NULL
    END
END
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

---------------------------------------------------------------------------------------
-- Drop Name_Address.TIME_STAMP column to allow columns to be appended to end
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Name_Address] DROP COLUMN [TIME_STAMP]
    END
END
GO


-- PBI 33488
---------------------------------------------------------------------------------------
-- Drop Meet_Master.TIME_STAMP column to allow columns to be appended to Activity
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
-- Add new NULL text column to Meet_Master
---------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT * FROM sys.columns 
                WHERE Name = 'WEB_DESC' and Object_ID = Object_ID('Meet_Master'))    
    BEGIN
       ALTER TABLE Meet_Master
       ADD WEB_DESC text NULL
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


---------------------------------------------------------------------------------------
-- Drop Meet_Master.TIME_STAMP column to allow columns to be appended to Meet_Master
--------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Meet_Master.ALLOW_REG_EDIT NOT NULL column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'ALLOW_REG_EDIT')
    BEGIN
        ALTER TABLE [dbo].Meet_Master ADD ALLOW_REG_EDIT bit 
              CONSTRAINT False DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Meet_Master.REG_EDIT_CUTOFF column with a default of (NULL)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'REG_EDIT_CUTOFF')
    BEGIN
        ALTER TABLE [dbo].Meet_Master ADD REG_EDIT_CUTOFF datetime NULL
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


------------------------------------------------------------------
-- Add new Name_Address.INFORMAL NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address' AND COLUMN_NAME = 'INFORMAL')
    BEGIN
        ALTER TABLE [dbo].[Name_Address] ADD [INFORMAL] varchar(20) 
              CONSTRAINT DF_Name_Address_INFORMAL DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Name_Address.TITLE NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address' AND COLUMN_NAME = 'TITLE')
    BEGIN
        ALTER TABLE [dbo].[Name_Address] ADD [TITLE] varchar(80) 
              CONSTRAINT DF_Name_Address_TITLE DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Name_Address.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name_Address' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Name_Address] ADD [TIME_STAMP] timestamp NULL
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

---------------------------------------------------------
-- Change length of Name.LAST_FIRST to 70 characters
---------------------------------------------------------
--       drop iNameLAST_FIRST
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Name]') AND name = N'iNameLAST_FIRST')
DROP INDEX [iNameLAST_FIRST] ON [dbo].[Name] WITH ( ONLINE = OFF )
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Name_LAST_FIRST]') AND type = 'D')
ALTER TABLE [dbo].[Name] DROP CONSTRAINT [DF_Name_LAST_FIRST]
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'LAST_FIRST')
    BEGIN
        ALTER TABLE [dbo].Name ALTER COLUMN LAST_FIRST varchar(70) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Name_LAST_FIRST]') AND type = 'D')
ALTER TABLE [dbo].[Name] ADD  CONSTRAINT [DF_Name_LAST_FIRST]  DEFAULT ('') FOR [LAST_FIRST]
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

------------------------------------------------------------------------
-- Add new Orders.FREIGHT_TAX column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'FREIGHT_TAX')
    BEGIN     
        ALTER TABLE [dbo].[Orders] ADD [FREIGHT_TAX] money
              CONSTRAINT DF_Orders_FREIGHT_TAX DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Orders.HANDLING_TAX column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'HANDLING_TAX')
    BEGIN     
        ALTER TABLE [dbo].[Orders] ADD [HANDLING_TAX] money
              CONSTRAINT DF_Orders_HANDLING_TAX DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Orders.TAX_RATE_FH column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'TAX_RATE_FH')
    BEGIN     
        ALTER TABLE [dbo].[Orders] ADD [TAX_RATE_FH] numeric(15,4)
              CONSTRAINT DF_Orders_TAX_RATE_FH DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------
-- Add new Orders.DISCOUNT_CODE NOT NULL column with a default of ('')
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'DISCOUNT_CODE')
    BEGIN
        ALTER TABLE [dbo].[Orders] ADD [DISCOUNT_CODE] varchar(50) CONSTRAINT DF_Orders_DISCOUNT_CODE DEFAULT ('') NOT NULL
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
-- Drop Order_Lines.TIME_STAMP column to allow columns to be appended to Order_Lines
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Order_Lines.UNIT_TAX_AMOUNT NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'UNIT_TAX_AMOUNT')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [UNIT_TAX_AMOUNT] numeric(15,4)
              CONSTRAINT [DF_Order_Lines_UNIT_TAX_AMOUNT] DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Order_Lines.PRICE_FROM_COMPONENTS NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'PRICE_FROM_COMPONENTS')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [PRICE_FROM_COMPONENTS] bit
              CONSTRAINT [DF_Order_Lines_PRICE_FROM_COMPONENTS] DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Order_Lines.QUANTITY_PER_KIT NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'QUANTITY_PER_KIT')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [QUANTITY_PER_KIT] numeric(15,6)
              CONSTRAINT [DF_Order_Lines_QUANTITY_PER_KIT] DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Order_Lines.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Lines' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Lines] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Add Product.PRICE_FROM_COMPONENTS
-- Requires manipulation of some existing columns in the Product table
---------------------------------------------------------------------------------------
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
            INSERT INTO @productKeyMap SELECT [PRODUCT_CODE], [ProductKey] FROM Product
            IF OBJECT_ID('AK_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [AK_Product_ProductKey]
            END
            IF OBJECT_ID('DF_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ProductKey]
            END        
            ALTER TABLE [dbo].Product DROP COLUMN [ProductKey]
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
            ALTER TABLE [dbo].Product DROP COLUMN [TIME_STAMP]
        END
    END

    ------------------------------------------------------------------
    -- Add new Product.PRICE_FROM_COMPONENTS NOT NULL column with a default of (0)
    ------------------------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'PRICE_FROM_COMPONENTS')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [PRICE_FROM_COMPONENTS] bit 
                  CONSTRAINT DF_Product_PRICE_FROM_COMPONENTS DEFAULT (0) NOT NULL
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
                UPDATE [Product] SET [ProductKey]=pkm.[ProductKey]
                  FROM [Product]
                  JOIN @productKeyMap pkm ON [Product].[PRODUCT_CODE]=pkm.[PRODUCT_CODE]
            END
        END
    END

END
GO

---------------------------------------------------------------------------------------
-- Drop Product_Kit.TIME_STAMP column to allow columns to be appended to Product_Kit
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Kit] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Kit.PRICE_1 NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit' AND COLUMN_NAME = 'PRICE_1')
    BEGIN
        ALTER TABLE [dbo].[Product_Kit] ADD [PRICE_1] money
              CONSTRAINT [DF_Product_Kit_PRICE_1] DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Kit.PRICE_2 NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit' AND COLUMN_NAME = 'PRICE_2')
    BEGIN
        ALTER TABLE [dbo].[Product_Kit] ADD [PRICE_2] money
              CONSTRAINT [DF_Product_Kit_PRICE_2] DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new Product_Kit.TAX_AUTHORITY NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit' AND COLUMN_NAME = 'TAX_AUTHORITY')
    BEGIN
        ALTER TABLE [dbo].[Product_Kit] ADD [TAX_AUTHORITY] varchar(15)
              CONSTRAINT [DF_Product_Kit_TAX_AUTHORITY] DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Product_Kit.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Kit' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Kit] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Rpt_InvoiceTbl.TIME_STAMP column to allow columns to be appended to Rpt_InvoiceTbl
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Rpt_InvoiceTbl.INVOICE_DESC column with a default of ('')
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'INVOICE_DESC')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD [INVOICE_DESC] varchar(100) 
              CONSTRAINT DF_Rpt_InvoiceTbl_INVOICE_DESC DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add new Rpt_InvoiceTbl.ORIGINAL_INVOICE column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'ORIGINAL_INVOICE')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD [ORIGINAL_INVOICE] int 
              CONSTRAINT DF_Rpt_InvoiceTbl_ORIGINAL_INVOICE DEFAULT (0) NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of Rpt_InvoiceTbl.TITLE to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'TITLE')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ALTER COLUMN [TITLE] varchar(80) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Rpt_InvoiceTbl.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD [TIME_STAMP] timestamp NULL
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

------------------------------------------------------------------------
-- Add new Trans.PRICE_ADJ column with a default of (0)
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'PRICE_ADJ')
    BEGIN
        ALTER TABLE [dbo].[Trans] ADD [PRICE_ADJ] bit 
              CONSTRAINT DF_Trans_PRICE_ADJ DEFAULT (0) NOT NULL
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


---------------------------------------------------------
-- Change length of Orders.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Orders] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of Activity.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Activity] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO


---------------------------------------------------------
-- Change length of Name.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Name' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Name] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of Product.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Product] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO


---------------------------------------------------------
-- Change length of Activity_Attach.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity_Attach')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Activity_Attach' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Activity_Attach] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO


---------------------------------------------------------
-- Change length of Meet_Master.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO


---------------------------------------------------------
-- Change length of Batch.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Batch' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Batch] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of Subscriptions.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Subscriptions' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Subscriptions] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of Service_Request.INTENT_TO_EDIT to be 80 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Service_Request')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Service_Request' AND COLUMN_NAME = 'INTENT_TO_EDIT')
    BEGIN
        ALTER TABLE [dbo].[Service_Request] ALTER COLUMN [INTENT_TO_EDIT] varchar(80) NOT NULL
    END
END
GO

-----------------------------------------------------------------------------
-- Change ContactMain.SyncContactID and UserMain.ContactMaster to be varchar, 
-- to match Name.ID, the column with which they are frequently JOINED
-----------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContactMain]') AND name = N'IX_ContactMain_SyncContactID')
    DROP INDEX [IX_ContactMain_SyncContactID] ON [dbo].[ContactMain] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContactMain]') AND name = N'IX_ContactMain_IsInstitute')
    DROP INDEX [IX_ContactMain_IsInstitute] ON [dbo].[ContactMain] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'IX_ContactMaster')
    DROP INDEX [IX_ContactMaster] ON [dbo].[UserMain] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserMain_ContactMaster]') AND type = 'D')
    ALTER TABLE [dbo].[UserMain] DROP CONSTRAINT [DF_UserMain_ContactMaster]
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactMain')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactMain' AND COLUMN_NAME = 'SyncContactID')
    BEGIN
        ALTER TABLE [dbo].[ContactMain] ALTER COLUMN [SyncContactID] varchar(20) NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain' AND COLUMN_NAME = 'ContactMaster')
    BEGIN
        ALTER TABLE [dbo].[UserMain] ALTER COLUMN [ContactMaster] varchar(50) NULL
    END
END
ALTER TABLE [dbo].[UserMain] ADD  CONSTRAINT [DF_UserMain_ContactMaster]  DEFAULT ('') FOR [ContactMaster]
GO
 
---------------------------------------------------------------------------------------
-- Drop VAT_Trans.TIME_STAMP column to allow columns to be appended to VAT_Trans
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].VAT_Trans DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- part of Drop VAT_Trans.TIME_STAMP column to allow columns to be appended to VAT_Trans
-- Add new VAT_Trans.TaxOnShipTo NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'TaxOnShipTo')
    BEGIN
        ALTER TABLE [dbo].VAT_Trans ADD TaxOnShipTo bit 
              CONSTRAINT DF_VAT_Trans_TaxOnShipTo DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new VAT_Trans.IsVatTaxableOrder NULL column
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'IsVatTaxableOrder')
    BEGIN
        ALTER TABLE [dbo].[VAT_Trans] ADD [IsVatTaxableOrder] bit NULL
    END
END
GO

------------------------------------------------------------------
-- Add new VAT_Trans.ZeroRatedAuthority NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'ZeroRatedAuthority')
    BEGIN
        ALTER TABLE [dbo].[VAT_Trans] ADD [ZeroRatedAuthority] varchar(15) 
              CONSTRAINT DF_VAT_Trans_ZeroRatedAuthority DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------------
-- part of Drop VAT_Trans.TIME_STAMP column to allow columns to be appended to VAT_Trans
-- Add a new NULL column VAT_Trans.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].VAT_Trans ADD [TIME_STAMP] timestamp NULL
    END
END
GO

------------------------------------------------------------------
-- PBI 23467 Refactor UOM business object and all referring code
------------------------------------------------------------------
-- Changing CertificationProgram.UomKey to ExperienceUnitKey
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgram')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CertificationProgram' AND COLUMN_NAME = 'UomKey')
    BEGIN
        EXEC sp_rename 'CertificationProgram.UomKey','ExperienceUnitKey','COLUMN'
    END
END
-- Changing Program.UomKey to ExperienceUnitKey
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Program')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Program' AND COLUMN_NAME = 'UomKey')
    BEGIN
        EXEC sp_rename 'Program.UomKey','ExperienceUnitKey','COLUMN'
    END
END
GO
-- Populate ExperienceUnitKey with any orphaned UomKey values
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ExperienceUnitKey')
BEGIN

    DECLARE @table TABLE (keyValue uniqueidentifier, intValue int IDENTITY(1,1))
    DECLARE @i int;
    SET @i = 0;

    ;WITH ExpKeys AS (
        SELECT DISTINCT(ExperienceUnitKey) FROM Program
        UNION 
        SELECT DISTINCT(ExperienceUnitKey) FROM CertificationProgram
    )
    INSERT INTO @table 
        SELECT Distinct(ExperienceUnitKey) FROM ExpKeys
        WHERE ExperienceUnitKey IS NOT NULL

    INSERT INTO ExperienceUnit (ExperienceUnitKey, ExperienceUnitName, ExperienceUnitDesc)
        SELECT t.keyValue, 'UnitName' + CAST(t.intValue AS VARCHAR(10)), 'UnitDesc' + CAST(t.intValue AS VARCHAR(10))
        FROM @table t
            LEFT OUTER JOIN ExperienceUnit e ON t.keyValue = e.ExperienceUnitKey
        WHERE e.ExperienceUnitKey IS NULL
END
GO

---------------------------------------------------------
-- Change length of Rpt_WorkingTbl.LAST_FIRST to 70 characters
---------------------------------------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_WorkingTbl_LAST_FIRST]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_WorkingTbl] DROP CONSTRAINT [DF_Rpt_WorkingTbl_LAST_FIRST]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl' AND COLUMN_NAME = 'LAST_FIRST')
    BEGIN
        ALTER TABLE [dbo].Rpt_WorkingTbl ALTER COLUMN LAST_FIRST varchar(70) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_WorkingTbl_LAST_FIRST]') AND type = 'D')
ALTER TABLE [dbo].[Rpt_WorkingTbl] ADD  CONSTRAINT [DF_Rpt_WorkingTbl_LAST_FIRST]  DEFAULT ('') FOR [LAST_FIRST]
GO

---------------------------------------------------------
-- Change length of Rpt_WorkingTbl.CHAPT_ADDRESS to text from varchar(255)
---------------------------------------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_WorkingTbl_CHAPT_ADDRESS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_WorkingTbl] DROP CONSTRAINT [DF_Rpt_WorkingTbl_CHAPT_ADDRESS]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_WorkingTbl' AND COLUMN_NAME = 'CHAPT_ADDRESS')
    BEGIN
        ALTER TABLE [dbo].Rpt_WorkingTbl ALTER COLUMN CHAPT_ADDRESS text NULL
    END
END
GO
-- no default to create on a text field

-------------------------------------------------------------------------------------------------------
-- Add new URLMapping.IsSystem and URLMapping.IsReference NOT NULL columns with a default of (0)
-------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'IsSystem')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [IsSystem] bit 
              CONSTRAINT DF_URLMapping_IsSystem DEFAULT (0) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'IsReference')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [IsReference] bit 
              CONSTRAINT DF_URLMapping_IsReference DEFAULT (0) NOT NULL
    END
END
GO

-------------------------------------------------------------
-- Add a new NULL column URLMapping.TargetDocumentVersionKey
-------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'TargetDocumentVersionKey')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [TargetDocumentVersionKey] uniqueidentifier NULL
    END
END
GO

-------------------------------------------------------------
-- Add a new not null column URLMapping.URLMappingDesc
-------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'URLMappingDesc')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [URLMappingDesc] nvarchar (250) NULL 
    END
END
GO

-------------------------------------------------------------------------
-- Ensure UserMain.DefaultDepartment/Perspective columns are NOT NULL
-------------------------------------------------------------------------

-- Drop indexes in preparation of schema changes
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'IX_UserMain_DefaultDepartmentGroupKey')
DROP INDEX [IX_UserMain_DefaultDepartmentGroupKey] ON [dbo].[UserMain] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'IX_UserMain_DefaultPerspectiveKey')
DROP INDEX [IX_UserMain_DefaultPerspectiveKey] ON [dbo].[UserMain] WITH ( ONLINE = OFF )
GO
-- Make Default Department and Perspective columns NOT NULL
DECLARE @defaultPerspectiveKey uniqueidentifier
DECLARE @defaultDepartmentKey uniqueidentifier
DECLARE @departmentGroupTypeKey uniqueidentifier
SELECT @defaultPerspectiveKey = PerspectiveKey FROM Perspective WHERE PerspectiveName = 'iMIS Web View'
SELECT @departmentGroupTypeKey = GroupTypeKey FROM GroupTypeRef WHERE GroupTypeName = 'Department'
SELECT @defaultDepartmentKey = GroupKey FROM GroupMain WHERE GroupTypeKey = @departmentGroupTypeKey AND Name = 'iMIS 15'
UPDATE [dbo].[UserMain]
   SET [DefaultDepartmentGroupKey] = @defaultDepartmentKey
 WHERE [DefaultDepartmentGroupKey] IS NULL
UPDATE [dbo].[UserMain]
   SET [DefaultPerspectiveKey] = @defaultPerspectiveKey
 WHERE [DefaultPerspectiveKey] IS NULL
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain' AND COLUMN_NAME = 'DefaultDepartmentGroupKey')
BEGIN
    ALTER TABLE [dbo].[UserMain] ALTER COLUMN [DefaultDepartmentGroupKey] uniqueidentifier NOT NULL
END
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain' AND COLUMN_NAME = 'DefaultPerspectiveKey')
BEGIN
    ALTER TABLE [dbo].[UserMain] ALTER COLUMN [DefaultPerspectiveKey] uniqueidentifier NOT NULL
END
GO

----------------------------------------------------------
-- Change UserId to be varchar on i15 instead of nvarchar 
----------------------------------------------------------

-- Drop index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'IX_UserMain_UserId')
DROP INDEX [IX_UserMain_UserId] ON [dbo].[UserMain] WITH ( ONLINE = OFF )
GO

-- Drop default
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserMain_UserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserMain] DROP CONSTRAINT [DF_UserMain_UserId]
END

GO

-- Change type of UserMain.UserId to varchar from nvarchar
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserMain' AND COLUMN_NAME = 'UserId')
    BEGIN
        ALTER TABLE [dbo].[UserMain] ALTER COLUMN [UserId] varchar(60) NOT NULL
    END
END
GO

-- Restore default
ALTER TABLE [dbo].[UserMain] ADD  CONSTRAINT [DF_UserMain_UserId]  DEFAULT ('') FOR [UserId]
GO

---------------------------------------------------------------------------------------
-- Drop Vat_Rule.TIME_STAMP column to allow columns to be appended to Vat_Rule
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Vat_Rule DROP COLUMN [TIME_STAMP]
    END
END
GO
 
------------------------------------------------------------------
-- Add new Vat_Rule.TAX_CODE_SUB NOT NULL column with a default of ('') - PBI 29155
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule' AND COLUMN_NAME = 'TAX_CODE_SUB')
    BEGIN
        ALTER TABLE [dbo].[Vat_Rule] ADD [TAX_CODE_SUB] varchar(15)
              CONSTRAINT [DF_Vat_Rule_TAX_CODE_SUB] DEFAULT ('') NOT NULL
    END
END
GO
 
------------------------------------------------
-- part of Drop Vat_Rule.TIME_STAMP column to allow columns to be appended to Vat_Rule
-- Add a new NULL column Vat_Rule.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Vat_Rule' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].Vat_Rule ADD [TIME_STAMP] timestamp NULL
    END
END
GO

----------------------------------------------------------------------------
-- change VAT_Trans.REFERENCE_NUMBER from varchar to numeric, to match orders.ORDER_NUMBER
----------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VAT_Trans_REFERENCE_NUMBER]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VAT_Trans] DROP CONSTRAINT [DF_VAT_Trans_REFERENCE_NUMBER]
END
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[PK_VAT_Trans]') AND type = 'K')
BEGIN
ALTER TABLE [dbo].[VAT_Trans] DROP CONSTRAINT [PK_VAT_Trans]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VAT_Trans' AND COLUMN_NAME = 'REFERENCE_NUMBER')
    BEGIN
        DELETE FROM [dbo].[VAT_Trans] WHERE ISNUMERIC([REFERENCE_NUMBER])=0
        ALTER TABLE [dbo].VAT_Trans ALTER COLUMN [REFERENCE_NUMBER] numeric(15,2) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VAT_Trans_REFERENCE_NUMBER]') AND type = 'D')
      ALTER TABLE [dbo].[VAT_Trans] ADD  CONSTRAINT [DF_VAT_Trans_REFERENCE_NUMBER]  DEFAULT ('') FOR [REFERENCE_NUMBER]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[PK_VAT_Trans]') AND type = 'K')
      ALTER TABLE [dbo].[VAT_Trans] ADD CONSTRAINT [PK_VAT_Trans] PRIMARY KEY CLUSTERED ([REFERENCE_NUMBER])
GO

----------------------------------------------------------------------------------------------
-- Add new GroupTypeRef.IsRelationshipGroup NOT NULL column with a default of (0)
----------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupTypeRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'GroupTypeRef' AND COLUMN_NAME = 'IsRelationshipGroup')
    BEGIN
        ALTER TABLE [dbo].[GroupTypeRef] ADD [IsRelationshipGroup] [bit] 
         CONSTRAINT DF_GroupTypeRef_IsRelationshipGroup DEFAULT (0) NOT NULL             
    END
END
GO

--------------------------------------------------------------------
-- Change length of Invoice.CUSTOMER_REFERENCE to be 40 characters
--------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Invoice')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Invoice' AND COLUMN_NAME = 'CUSTOMER_REFERENCE')
    BEGIN
        ALTER TABLE [dbo].[Invoice] ALTER COLUMN [CUSTOMER_REFERENCE] varchar(40) NOT NULL
    END
END
GO

---------------------------------------------------------------------------
-- Add new GroupMemberDetail.RecurringTransactionInstructionKey NULL column
---------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'GroupMemberDetail')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'GroupMemberDetail' 
        AND COLUMN_NAME = 'RecurringTransactionInstructionKey')
    BEGIN
        ALTER TABLE [dbo].[GroupMemberDetail] ADD [RecurringTransactionInstructionKey] uniqueidentifier NULL
    END
END



---------------------------------------------------------------------------------------
-- Add new Order_Badge.ADDRESS_NUM
-- Drop Order_Badge.TIME_STAMP column to allow columns to be appended to Order_Badge
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Badge] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------------
-- Add new Order_Badge.ADDRESS_NUM int column with a default of 0
------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge' AND COLUMN_NAME = 'ADDRESS_NUM')
    BEGIN
        ALTER TABLE [dbo].[Order_Badge] ADD [ADDRESS_NUM] int
              CONSTRAINT DF_Order_Badge_ADDRESS_NUM DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add new Order_Badge.ADDRESS_NUM
-- Add a new NULL column Order_Badge.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Badge' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Badge] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------
-- PBI 28419, widen columns in Rpt_InvoiceTbl to avoid truncation errors
---------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_T_DESCRIPTION]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_InvoiceTbl] DROP CONSTRAINT [DF_Rpt_InvoiceTbl_T_DESCRIPTION]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'T_DESCRIPTION')
    BEGIN
        ALTER TABLE [dbo].Rpt_InvoiceTbl ALTER COLUMN T_DESCRIPTION varchar(255) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_T_DESCRIPTION]') AND type = 'D')
ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD  CONSTRAINT [DF_Rpt_InvoiceTbl_T_DESCRIPTION]  DEFAULT ('') FOR [T_DESCRIPTION]
GO
---------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_TITLE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_InvoiceTbl] DROP CONSTRAINT [DF_Rpt_InvoiceTbl_TITLE]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'TITLE')
    BEGIN
        ALTER TABLE [dbo].Rpt_InvoiceTbl ALTER COLUMN TITLE varchar(255) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_TITLE]') AND type = 'D')
ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD  CONSTRAINT [DF_Rpt_InvoiceTbl_TITLE]  DEFAULT ('') FOR [TITLE]
GO
-----------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_OT_INVOICE_DESCRIPTION]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_InvoiceTbl] DROP CONSTRAINT [DF_Rpt_InvoiceTbl_OT_INVOICE_DESCRIPTION]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'OT_INVOICE_DESCRIPTION')
    BEGIN
        ALTER TABLE [dbo].Rpt_InvoiceTbl ALTER COLUMN OT_INVOICE_DESCRIPTION varchar(255) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_OT_INVOICE_DESCRIPTION]') AND type = 'D')
ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD  CONSTRAINT [DF_Rpt_InvoiceTbl_OT_INVOICE_DESCRIPTION]  DEFAULT ('') FOR [OT_INVOICE_DESCRIPTION]
GO
-----------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_INVOICE_DESC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Rpt_InvoiceTbl] DROP CONSTRAINT [DF_Rpt_InvoiceTbl_INVOICE_DESC]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_InvoiceTbl' AND COLUMN_NAME = 'INVOICE_DESC')
    BEGIN
        ALTER TABLE [dbo].Rpt_InvoiceTbl ALTER COLUMN INVOICE_DESC varchar(255) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Rpt_InvoiceTbl_INVOICE_DESC]') AND type = 'D')
ALTER TABLE [dbo].[Rpt_InvoiceTbl] ADD  CONSTRAINT [DF_Rpt_InvoiceTbl_INVOICE_DESC]  DEFAULT ('') FOR [INVOICE_DESC]
GO
-----------------------------
-- end of PBI 28419
-----------------------------

---------------------------
-- PBI 28584, widen ENTERED_BY in Trans, Product_Trans, Orders, and MODIFIED_BY in Product_Trans, to avoid truncation errors
---------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Trans_ENTERED_BY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product_Trans] DROP CONSTRAINT [DF_Product_Trans_ENTERED_BY]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Trans' AND COLUMN_NAME = 'ENTERED_BY')
    BEGIN
        ALTER TABLE [dbo].Product_Trans ALTER COLUMN ENTERED_BY varchar(60) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Trans_ENTERED_BY]') AND type = 'D')
ALTER TABLE [dbo].[Product_Trans] ADD  CONSTRAINT [DF_Product_Trans_ENTERED_BY]  DEFAULT ('') FOR [ENTERED_BY]
GO

-----------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Trans_MODIFIED_BY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product_Trans] DROP CONSTRAINT [DF_Product_Trans_MODIFIED_BY]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Trans' AND COLUMN_NAME = 'MODIFIED_BY')
    BEGIN
        ALTER TABLE [dbo].Product_Trans ALTER COLUMN MODIFIED_BY varchar(60) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Trans_MODIFIED_BY]') AND type = 'D')
ALTER TABLE [dbo].[Product_Trans] ADD  CONSTRAINT [DF_Product_Trans_MODIFIED_BY]  DEFAULT ('') FOR [MODIFIED_BY]
GO

-----------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_ENTERED_BY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_ENTERED_BY]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ENTERED_BY')
    BEGIN
        ALTER TABLE [dbo].Orders ALTER COLUMN ENTERED_BY varchar(60) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_ENTERED_BY]') AND type = 'D')
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ENTERED_BY]  DEFAULT ('') FOR [ENTERED_BY]
GO

-----------------------------
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Trans_ENTERED_BY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Trans] DROP CONSTRAINT [DF_Trans_ENTERED_BY]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Trans' AND COLUMN_NAME = 'ENTERED_BY')
    BEGIN
        ALTER TABLE [dbo].Trans ALTER COLUMN ENTERED_BY varchar(60) NOT NULL
    END
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Trans_ENTERED_BY]') AND type = 'D')
ALTER TABLE [dbo].[Trans] ADD  CONSTRAINT [DF_Trans_ENTERED_BY]  DEFAULT ('') FOR [ENTERED_BY]
GO
-----------------------------
-- end of PBI 28584
-----------------------------


---------------------------------------------------------------------------------------------
-- PBI 31655 - Continuum/GPS - Phase 1 (support for new AsiGPSAnnualUpdate stored procedure)
--                         - Modifying AsiGPSData table to hold more fields to support GPS report and
--                         - its associated SPs and AsiGPSPivotData table.
---------------------------------------------------------------------------------------------
-- If AsiGPSData table already exists and RowType column does not exist, ALTER table to add RowType column
-- If not the upgrader will create the new table with the RowType column
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'AsiGPSData' AND xtype = 'U')
         AND NOT EXISTS (SELECT * FROM SYS.COLUMNS WHERE name = 'RowType' AND Object_ID = Object_ID(N'AsiGPSData'))
BEGIN
-- Add RowType column to AsiGPSData table to support GPS reporting improvements
ALTER TABLE [dbo].[AsiGPSData] ADD [RowType] [varchar](20) NULL -- 12/4/2012 JHS: Added to support reporting improvements
END
GO
-- If AsiGPSData table already exists and TotalRevenue column does not exist, ALTER table to add TotalRevenue column
-- If not the upgrader will create the new table with the RowType column
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'AsiGPSData' AND xtype = 'U')
         AND NOT EXISTS (SELECT * FROM SYS.COLUMNS WHERE name = 'TotalRevenue' AND Object_ID = Object_ID(N'AsiGPSData'))
BEGIN
-- Add TotalRevenue column to AsiGPSData table to support GPS reporting improvements
ALTER TABLE [dbo].[AsiGPSData] ADD [TotalRevenue] [decimal](18, 9) NULL -- 12/4/2012 JHS: Added to support reporting improvements
END
GO

-------------------------------------------------------------------------------------------------------
-- Add new URLMapping.URLParameters and URLMapping.URLMappingTypeCode 
-------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    -- URLParameters column
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'URLParameters')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [URLParameters] nvarchar (250) NULL
    END
    
    -- URLMappingTypeCode column
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'URLMappingTypeCode')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD [URLMappingTypeCode] int NULL
    END

END
GO

-- If the IsSystem column still exists, old URLMappings need to be converted
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'IsSystem')
    BEGIN
        UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 10 WHERE [IsSystem] = 0 AND [IsReference] = 0
        UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 20 WHERE [IsSystem] = 1 AND [IsReference] = 0
        UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 30 WHERE [IsReference] = 1
        UPDATE [dbo].[URLMapping] SET [URLMappingTypeCode] = 10 WHERE [URLMappingTypeCode] IS NULL
    END
END
GO

--------------------------------------------------
-- Make URLMapping.URLMappingTypeCode non-nullable
--------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'URLMappingTypeCode')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ALTER COLUMN [URLMappingTypeCode] int NOT NULL
    END
END
GO

-------------------------------------------
-- Drop the now-obsolete column IsSystem
-------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'IsSystem')
    BEGIN
        IF OBJECT_ID('DF_URLMapping_IsSystem') IS NOT NULL
        BEGIN
            ALTER TABLE [dbo].URLMapping DROP CONSTRAINT [DF_URLMapping_IsSystem]
        END
        ALTER TABLE [dbo].URLMapping DROP COLUMN [IsSystem]
    END
END
GO

-------------------------------------------
-- Drop the now-obsolete column IsReference
-------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'IsReference')
    BEGIN
        IF OBJECT_ID('DF_URLMapping_IsReference') IS NOT NULL
        BEGIN
            ALTER TABLE [dbo].URLMapping DROP CONSTRAINT [DF_URLMapping_IsReference]
        END
        ALTER TABLE [dbo].URLMapping DROP COLUMN [IsReference]
    END
END
GO