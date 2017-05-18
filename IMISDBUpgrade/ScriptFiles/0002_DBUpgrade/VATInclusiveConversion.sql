-- Convert order amounts to be tax inclusive for VAT systems if the conversion has not been run yet
IF EXISTS (SELECT 1 FROM [dbo].[Org_Control] WHERE [DefaultFlag] = 1 AND [UseVATTaxation] = 1)
AND NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'VatInclusiveConversionCompleted' OR [SystemConfigKey] = '7DC556AF-C026-454A-96CB-35DC551AE8FB')
BEGIN

    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders_BAK]') AND type in (N'U'))
        SELECT * INTO Orders_BAK FROM Orders

    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_Lines_BAK]') AND type in (N'U'))
        SELECT * INTO Order_Lines_BAK FROM Order_Lines

    -- Clear tax code and tax rate for VAT exempt registrations
    UPDATE [dbo].[Order_Lines]
       SET [TAX_AUTHORITY] = '', 
           [TAX_RATE] = 0
     WHERE [TAX_AUTHORITY] != '' AND [TAX_RATE] != 0 AND [TAX_1] = 0 AND [EXTENDED_AMOUNT] != 0

    DECLARE @Orders_VAT TABLE (
        [ORDER_NUMBER] [numeric](15, 2) NOT NULL PRIMARY KEY,
        [LINE_TOTAL] [money] NOT NULL,
        [LINE_TAXABLE] [money] NOT NULL,
        [UNDISCOUNTED_TOTAL] [money] NOT NULL,
        [VAT_TAX_CODE_FH] [varchar](31) NULL,
        [TAX_RATE_FH] [numeric](15, 4) NOT NULL,
        [FH_TAX] [money] NOT NULL,
        [FREIGHT_TAX] [money] NOT NULL, 
        [HANDLING_TAX] [money] NOT NULL,
        [FREIGHT_1] [money] NOT NULL,
        [FREIGHT_2] [money] NOT NULL,
        [HANDLING_1] [money] NOT NULL,
        [HANDLING_2] [money] NOT NULL)
    
    DECLARE @Order_Lines_VAT TABLE(
        [ORDER_NUMBER] [numeric](15, 2) NOT NULL,
        [LINE_NUMBER] [numeric](15, 2) NOT NULL,
        [QUANTITY_ORDERED] [numeric](15, 6) NOT NULL,
        [UNIT_PRICE] [money] NOT NULL,
        [UNIT_COST] [money] NOT NULL,
        [UNDISCOUNTED_PRICE] [money] NOT NULL,
        [EXTENDED_AMOUNT] [money] NOT NULL,
        [EXTENDED_COST] [money] NOT NULL,
        [UNDISCOUNTED_EXTENDED_AMOUNT] [money] NOT NULL,
        [TAX_RATE] [numeric](15, 4) NOT NULL,
        [TAX_1] [numeric](15, 4) NOT NULL,
        [KIT_ITEM_TYPE] [tinyint] NOT NULL,
        [MANUAL_PRICE] [numeric](15, 2) NOT NULL,
        [UNIT_TAX_AMOUNT] [numeric](15, 4) NOT NULL, 
        [PRICE_FROM_COMPONENTS] [bit] NOT NULL,
        PRIMARY KEY ([ORDER_NUMBER], [LINE_NUMBER]))
 
    -- Insert Orders info into a table variable
    -- NOTE: FH_TAX = Orders.TAX_1 - Order_Lines.TAX_1
    INSERT INTO @Orders_VAT ([ORDER_NUMBER], [LINE_TOTAL], [LINE_TAXABLE], [UNDISCOUNTED_TOTAL], 
                             [VAT_TAX_CODE_FH], [TAX_RATE_FH], [FH_TAX], [FREIGHT_TAX], [HANDLING_TAX] ,
                             [FREIGHT_1], [FREIGHT_2], [HANDLING_1], [HANDLING_2])
    SELECT o.[ORDER_NUMBER], o.[LINE_TOTAL], o.[LINE_TAXABLE], o.[UNDISCOUNTED_TOTAL],
           o.[VAT_TAX_CODE_FH], 0, o.[TAX_1] - lines.[TAX_1], 0, 0, 
           o.[FREIGHT_1], o.[FREIGHT_2], o.[HANDLING_1], o.[HANDLING_2]
      FROM [dbo].[Orders] o INNER JOIN
            (SELECT [ORDER_NUMBER], COUNT(*) AS LINE_COUNT, 
                    ROUND(SUM([TAX_1]), 2) AS TAX_1
               FROM [dbo].[Order_Lines] 
              WHERE ([KIT_ITEM_TYPE] != 1 OR [PRICE_FROM_COMPONENTS] != 1)
              GROUP BY [ORDER_NUMBER]) lines
         ON o.[ORDER_NUMBER] = lines.[ORDER_NUMBER]
     WHERE lines.[LINE_COUNT] > 0 AND o.[TAX_1] != 0
     
    -- Put the associated order lines in another table variable
    INSERT INTO @Order_Lines_VAT
    SELECT [ORDER_NUMBER], [LINE_NUMBER], [QUANTITY_ORDERED], [UNIT_PRICE], [UNIT_COST],  [UNDISCOUNTED_PRICE], [EXTENDED_AMOUNT], [EXTENDED_COST],
           [UNDISCOUNTED_EXTENDED_AMOUNT], [TAX_RATE], [TAX_1], [KIT_ITEM_TYPE], [MANUAL_PRICE], [UNIT_TAX_AMOUNT], [PRICE_FROM_COMPONENTS] 
      FROM [dbo].[Order_Lines] WHERE [ORDER_NUMBER] IN (SELECT [ORDER_NUMBER] FROM @Orders_VAT) OR ([TAX_RATE] != 0 AND [TAX_1] != 0)
     
    -----------------------------
    -- First piece of kit updates
    -----------------------------

    -- Update kit order lines unit tax amount where the price comes from the components
    -- We cannot simply add the line unit tax amounts later, because sometimes they don't add up due to rounding
     UPDATE kit
        SET kit.[UNIT_TAX_AMOUNT] = comp.[UNIT_TAX_AMOUNT]
       FROM @Order_Lines_VAT kit INNER JOIN
            (SELECT [ORDER_NUMBER], COUNT(*) AS LINE_COUNT, 
                    SUM(ROUND(([QUANTITY_ORDERED] * [UNIT_PRICE] * [TAX_RATE])/100, 2)) AS UNIT_TAX_AMOUNT
               FROM @Order_Lines_VAT 
              WHERE [LINE_NUMBER] > 1
              GROUP BY [ORDER_NUMBER]
              HAVING MAX([TAX_RATE]) != 0 AND SUM([TAX_1]) != 0) comp
         ON kit.[ORDER_NUMBER] = comp.[ORDER_NUMBER]
      WHERE kit.[KIT_ITEM_TYPE] = 1 AND kit.[PRICE_FROM_COMPONENTS] = 1 AND comp.[LINE_COUNT] > 0
     
     ------------------------------
    -- Update standard order lines
    ------------------------------
    
    -- Update UNIT_PRICE, UNDISCOUNTED_PRICE, UNIT_TAX_AMOUNT, EXTENDED_AMOUNT and UNDISCOUNTED_EXTENDED_AMOUNT
    UPDATE @Order_Lines_VAT 
       SET [UNIT_PRICE] = ROUND([UNIT_PRICE] + ([UNIT_PRICE] * [TAX_RATE])/100, 2),
           [UNIT_TAX_AMOUNT] = ROUND(([UNIT_PRICE] * [TAX_RATE])/100, 2),
           [EXTENDED_AMOUNT] = ROUND([EXTENDED_AMOUNT] + [TAX_1], 2)
     WHERE [TAX_RATE] != 0 AND [TAX_1] != 0
     
    UPDATE @Order_Lines_VAT 
       SET [UNDISCOUNTED_PRICE] = ROUND([UNDISCOUNTED_PRICE] * (1 + ([TAX_RATE]/100)), 2)
     WHERE [TAX_RATE] != 0 AND [TAX_1] != 0 AND [UNDISCOUNTED_PRICE] != 0
     
    UPDATE @Order_Lines_VAT 
       SET [UNDISCOUNTED_EXTENDED_AMOUNT] = ROUND([UNDISCOUNTED_EXTENDED_AMOUNT] + [TAX_1], 2)
     WHERE [TAX_RATE] != 0 AND [TAX_1] != 0 AND [UNDISCOUNTED_EXTENDED_AMOUNT] != 0
    
    -- Update UNIT_PRICE and MANUAL_PRICE
    UPDATE @Order_Lines_VAT 
       SET [MANUAL_PRICE] = ROUND([MANUAL_PRICE] + ([MANUAL_PRICE] * [TAX_RATE]/100), 2) 
     WHERE [TAX_RATE] != 0 AND [MANUAL_PRICE] != 0 
     
    ------------------------------
    -- Second piece of kit updates
    ------------------------------
    
    -- Update the rest of the kit order lines where the price comes from the components
     UPDATE kit
        SET kit.[UNIT_PRICE] = comp.[UNIT_PRICE],
            kit.[UNIT_COST] = comp.[UNIT_COST],
            kit.[UNDISCOUNTED_PRICE] = comp.[UNDISCOUNTED_PRICE],
            kit.[EXTENDED_AMOUNT] = comp.[EXTENDED_AMOUNT],
            kit.[EXTENDED_COST] = comp.[EXTENDED_COST],
            kit.[UNDISCOUNTED_EXTENDED_AMOUNT] = comp.[UNDISCOUNTED_EXTENDED_AMOUNT]
       FROM @Order_Lines_VAT kit INNER JOIN
            (SELECT [ORDER_NUMBER], COUNT(*) AS LINE_COUNT, 
                    ROUND(SUM([QUANTITY_ORDERED] * [UNIT_PRICE]), 2) AS UNIT_PRICE,
                    ROUND(SUM([UNIT_COST]), 2) AS UNIT_COST,
                    ROUND(SUM([QUANTITY_ORDERED] * [UNDISCOUNTED_PRICE]), 2) AS UNDISCOUNTED_PRICE,
                    ROUND(SUM([EXTENDED_AMOUNT]), 2) AS EXTENDED_AMOUNT,
                    ROUND(SUM([EXTENDED_COST]), 2) AS EXTENDED_COST,
                    ROUND(SUM([UNDISCOUNTED_EXTENDED_AMOUNT]), 2) AS UNDISCOUNTED_EXTENDED_AMOUNT
               FROM @Order_Lines_VAT 
              WHERE [LINE_NUMBER] > 1
              GROUP BY [ORDER_NUMBER]
              HAVING MAX([TAX_RATE]) != 0 AND SUM([TAX_1]) != 0) comp
         ON kit.[ORDER_NUMBER] = comp.[ORDER_NUMBER]
      WHERE kit.[KIT_ITEM_TYPE] = 1 AND kit.[PRICE_FROM_COMPONENTS] = 1 AND comp.[LINE_COUNT] > 0
      
    --------------------
    -- Order Updates
    --------------------
    
    -- LINE_TOTAL and UNDISCOUNTED_TOTAL
    UPDATE o
       SET o.[LINE_TOTAL] = lines.[EXTENDED_AMOUNT],
           o.[UNDISCOUNTED_TOTAL] = lines.[UNDISCOUNTED_EXTENDED_AMOUNT]
      FROM @Orders_VAT o INNER JOIN
            (SELECT [ORDER_NUMBER], COUNT(*) AS LINE_COUNT, 
                    ROUND(SUM([EXTENDED_AMOUNT]), 2) AS EXTENDED_AMOUNT,
                    ROUND(SUM([UNDISCOUNTED_EXTENDED_AMOUNT]), 2) AS [UNDISCOUNTED_EXTENDED_AMOUNT]
               FROM @Order_Lines_VAT
              WHERE ([KIT_ITEM_TYPE] != 1 OR [PRICE_FROM_COMPONENTS] != 1)
              GROUP BY [ORDER_NUMBER]) lines
         ON o.[ORDER_NUMBER] = lines.[ORDER_NUMBER]
     WHERE lines.[LINE_COUNT] > 0
     
    -- Update LINE_TAXABLE by summing all order lines with a tax rate and tax amount not equal to zero
    UPDATE o
       SET o.[LINE_TAXABLE] = lines.[EXTENDED_AMOUNT]
      FROM @Orders_VAT o INNER JOIN
            (SELECT [ORDER_NUMBER], COUNT(*) AS LINE_COUNT, 
                    ROUND(SUM([EXTENDED_AMOUNT]), 2) AS EXTENDED_AMOUNT
               FROM @Order_Lines_VAT 
              WHERE [TAX_RATE] != 0 AND [TAX_1] != 0
              GROUP BY [ORDER_NUMBER]) lines
         ON o.[ORDER_NUMBER] = lines.[ORDER_NUMBER]
     WHERE lines.[LINE_COUNT] > 0

    -- FH_TAX - Fill out the tax rate, freight tax and handling tax amount
    -- based on the current rate of the defined Freight and Handling Tax authority
    UPDATE o 
       SET o.[TAX_RATE_FH] = tax.[TAX_RATE],
           o.[FREIGHT_TAX] = ROUND(((o.[FREIGHT_1] + o.[FREIGHT_2]) * [TAX_RATE])/100, 2),   -- round tax rate * freight
           o.[HANDLING_TAX] = ROUND(((o.[HANDLING_1] + o.[HANDLING_2]) * [TAX_RATE])/100, 2) -- round tax rate * handling
    FROM @Orders_VAT o INNER JOIN
        (SELECT [TAX_RATE], SUBSTRING([PRODUCT_CODE], 5, LEN([PRODUCT_CODE]) - 4) AS TAX_CODE FROM [dbo].[Product_Tax]) AS tax
      ON o.[VAT_TAX_CODE_FH] = tax.[TAX_CODE]
    
    -- If the calculated freight and handling tax does not add up to the combined, wipe it out so we can calculate it again
    UPDATE @Orders_VAT 
       SET [TAX_RATE_FH] = 0,
           [FREIGHT_TAX] = 0,
           [HANDLING_TAX] = 0
     WHERE [FREIGHT_TAX] + [FREIGHT_TAX] != [FH_TAX]
     
    -- On the orders where calculating freight and handling tax did not add up
    -- reset the TAX_RATE_FH, calculate the FREIGHT_TAX and subtract it from the total FH_TAX to get the HANDLING_TAX 
    -- pro-rate (e.g. f = 40% & h = %60 of total f & h, then take 40% of fh_tax as f_tax 
    --   and subtract this amount from the total fh_tax to get the h_tax) this insures f_tax + h_tax = fh_tax
    UPDATE @Orders_VAT
       SET [TAX_RATE_FH] = ([FH_TAX]/([FREIGHT_1] + [FREIGHT_2] + [HANDLING_1] + [HANDLING_2]) * 100),
           [FREIGHT_TAX] = ROUND((([FREIGHT_1] + [FREIGHT_2])/([FREIGHT_1] + [FREIGHT_2] + [HANDLING_1] + [HANDLING_2])) * [FH_TAX], 2),
           [HANDLING_TAX] = [FH_TAX] - ROUND((([FREIGHT_1] + [FREIGHT_2])/([FREIGHT_1] + [FREIGHT_2] + [HANDLING_1] + [HANDLING_2])) * [FH_TAX], 2)
     WHERE [TAX_RATE_FH] = 0 AND [FREIGHT_TAX] = 0 AND [HANDLING_TAX] = 0
            AND ([FREIGHT_1] + [FREIGHT_2] + [HANDLING_1] + [HANDLING_2]) != 0  -- Make sure not to divide by zero
     
    -- Add the freight tax to the freight amount
    -- Add the handling tax to the handling amount
    UPDATE @Orders_VAT SET [FREIGHT_1] = [FREIGHT_1] + [FREIGHT_TAX] WHERE [FREIGHT_1] != 0
    UPDATE @Orders_VAT SET [FREIGHT_2] = [FREIGHT_2] + [FREIGHT_TAX] WHERE [FREIGHT_2] != 0
    UPDATE @Orders_VAT SET [HANDLING_1] = [HANDLING_1] + [HANDLING_TAX] WHERE [HANDLING_1] != 0
    UPDATE @Orders_VAT SET [HANDLING_2] = [HANDLING_2] + [HANDLING_TAX] WHERE [HANDLING_2] != 0
     
     
    BEGIN TRANSACTION  
    
    -- Now that the calculations are complete, do a bulk update.
    -- Put it all in a transaction so we can roll back if there is an error partway through
    
    UPDATE l
       SET l.[UNIT_PRICE] = vat.[UNIT_PRICE], 
           l.[UNIT_COST] = vat.[UNIT_COST],
           l.[UNDISCOUNTED_PRICE] = vat.[UNDISCOUNTED_PRICE],
           l.[UNIT_TAX_AMOUNT] = vat.[UNIT_TAX_AMOUNT],
           l.[EXTENDED_AMOUNT] = vat.[EXTENDED_AMOUNT],
           l.[EXTENDED_COST] = vat.[EXTENDED_COST],
           l.[UNDISCOUNTED_EXTENDED_AMOUNT] = vat.[UNDISCOUNTED_EXTENDED_AMOUNT],
           l.[MANUAL_PRICE] = vat.[MANUAL_PRICE]
      FROM [dbo].[Order_Lines] l INNER JOIN @Order_Lines_VAT vat 
        ON l.[ORDER_NUMBER] = vat.[ORDER_NUMBER] AND l.[LINE_NUMBER] = vat.[LINE_NUMBER]

    UPDATE o
       SET o.[LINE_TOTAL] = vat.[LINE_TOTAL],
           o.[LINE_TAXABLE] = vat.[LINE_TAXABLE],
           o.[UNDISCOUNTED_TOTAL] = vat.[UNDISCOUNTED_TOTAL],
           o.[TAX_RATE_FH] = vat.[TAX_RATE_FH],
           o.[FREIGHT_TAX] = vat.[FREIGHT_TAX],
           o.[HANDLING_TAX] = vat.[HANDLING_TAX],
           o.[FREIGHT_1] = vat.[FREIGHT_1],
           o.[FREIGHT_2] = vat.[FREIGHT_2],
           o.[HANDLING_1] = vat.[HANDLING_1],
           o.[HANDLING_2] = vat.[HANDLING_2]
      FROM [dbo].[Orders] o INNER JOIN
           @Orders_VAT vat ON o.[ORDER_NUMBER] = vat.[ORDER_NUMBER]
            
    COMMIT TRANSACTION

END

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'VatInclusiveConversionCompleted' OR [SystemConfigKey] = '7DC556AF-C026-454A-96CB-35DC551AE8FB')
BEGIN

    ---------------------------------------------------------------------------------------------------------------
    -- Add 'VatInclusiveConversionCompleted' to indicate the conversion has been completed and should not run again
    ---------------------------------------------------------------------------------------------------------------
    DECLARE @systemUserKey uniqueidentifier
    DECLARE @organizationKey uniqueidentifier
    DECLARE @systemEntityKey uniqueidentifier
    DECLARE @now datetime

    SELECT @systemUserKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
    SELECT @organizationKey = [OrganizationKey] FROM [dbo].[OrganizationMain] WHERE [IsDefault] = 1
    SELECT @now = GETDATE()

     
    INSERT INTO [dbo].[SystemConfig] ([SystemConfigKey], [ParameterName], [ParameterValue],
                                      [Description],
                                      [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                      [OrganizationKey], [SystemEntityKey])
    VALUES ('7DC556AF-C026-454A-96CB-35DC551AE8FB', 'VatInclusiveConversionCompleted', 'true', 
            'System indicator that Order and Order_Lines have been updated to show VAT inclusive prices',
            @systemUserKey, @now, @systemUserKey, @now,
            @organizationKey, @systemEntityKey)
        
END