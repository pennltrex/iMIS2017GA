----------------------------------------------------------------
-- Create new UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
----------------------------------------------------------------
EXEC [dbo].[asi_InsertSystemConfig] 
     'Commerce', 'Billing', 'MANAGER', 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D',
     'BillingEnableAccrualOnWeb', 'EED5BB48-F110-4E18-84A9-078185CE8C30',
     2, 0, null, 
     'Allow customers to make accrual dues payments on the web',
     'True', 5
GO

----------------------------------------------------------------
-- Update UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
-- Change value to 'True' from '1'
-- Make sure correct value is applied, as a previous update
--  may have input a value of "1".
----------------------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [ParameterValue] = 'True'
 WHERE [SystemConfigKey] = 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D'
GO

UPDATE [dbo].[SystemConfigParameterRef]
   SET [DefaultParameterValue] = 'True'
 WHERE [PropertyDefinitionKey] = 'EED5BB48-F110-4E18-84A9-078185CE8C30'
 GO

 ----------------------------------------------------------------
-- Update UI Config option: BillingEnableAccrualOnWeb
-- Set up customer web components > Billing configuration
-- Modify the Description to be less wordy
-- Make sure correct value is applied, as a previous update
--  may have input a more wordy Description.
----------------------------------------------------------------
UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Allow customers to make accrual dues payments on the web'
 WHERE [SystemConfigKey] = 'EF92F6C4-7D6F-4EC9-B656-1AFD7D17442D'
GO

UPDATE [dbo].[SystemConfigParameterRef]
   SET [Description] = 'Allow customers to make accrual dues payments on the web'
 WHERE [PropertyDefinitionKey] = 'EED5BB48-F110-4E18-84A9-078185CE8C30'
GO