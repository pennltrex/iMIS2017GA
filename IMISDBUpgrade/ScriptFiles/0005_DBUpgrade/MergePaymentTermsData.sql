SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM PaymentTerms WHERE PaymentTermsKey = '76d99aa9-ebbf-4eb1-90c4-7ccc4e700db0')
BEGIN
    UPDATE PaymentTerms SET PaymentTermsName = 'Net 30', PaymentTermsDesc = 'Payment in full due 30 days after invoice.', EarlyDiscountDays = NULL, EarlyDiscountPercent = NULL, PaymentIntervalTypeCode = 4, PaymentIntervalSize = 0, PaymentIntervalCount = 0, FirstPaymentDateTypeCode = 0, FirstPaymentDateOffset = 30, IsFirstPaymentDateAdjustable = 0, IsSystem = 1, CreatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', CreatedOn = '20150813 18:50:52', UpdatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', UpdatedOn = '20150813 18:50:52', SystemEntityKey = 'b7e90438-1a98-452f-a6a2-37efc8119f05', MarkedForDeleteOn = NULL
    WHERE PaymentTermsKey = '76d99aa9-ebbf-4eb1-90c4-7ccc4e700db0'
END
ELSE
BEGIN
    INSERT INTO PaymentTerms (PaymentTermsKey, PaymentTermsName, PaymentTermsDesc, EarlyDiscountDays, EarlyDiscountPercent, PaymentIntervalTypeCode, PaymentIntervalSize, PaymentIntervalCount, FirstPaymentDateTypeCode, FirstPaymentDateOffset, IsFirstPaymentDateAdjustable, IsSystem, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, SystemEntityKey, MarkedForDeleteOn)
    VALUES ('76d99aa9-ebbf-4eb1-90c4-7ccc4e700db0', 'Net 30', 'Payment in full due 30 days after invoice.', NULL, NULL, 4, 0, 0, 0, 30, 0, 1, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', 'b7e90438-1a98-452f-a6a2-37efc8119f05', NULL)
END
GO

IF EXISTS (SELECT 1 FROM PaymentTerms WHERE PaymentTermsKey = '6e088cd3-2438-4c57-acac-857400c025f6')
BEGIN
    UPDATE PaymentTerms SET PaymentTermsName = 'Quarterly', PaymentTermsDesc = 'Payment due quarterly.', EarlyDiscountDays = NULL, EarlyDiscountPercent = NULL, PaymentIntervalTypeCode = 1, PaymentIntervalSize = 1, PaymentIntervalCount = 4, FirstPaymentDateTypeCode = 1, FirstPaymentDateOffset = 0, IsFirstPaymentDateAdjustable = 0, IsSystem = 1, CreatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', CreatedOn = '20150813 18:50:52', UpdatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', UpdatedOn = '20150813 18:50:52', SystemEntityKey = 'b7e90438-1a98-452f-a6a2-37efc8119f05', MarkedForDeleteOn = NULL
    WHERE PaymentTermsKey = '6e088cd3-2438-4c57-acac-857400c025f6'
END
ELSE
BEGIN
    INSERT INTO PaymentTerms (PaymentTermsKey, PaymentTermsName, PaymentTermsDesc, EarlyDiscountDays, EarlyDiscountPercent, PaymentIntervalTypeCode, PaymentIntervalSize, PaymentIntervalCount, FirstPaymentDateTypeCode, FirstPaymentDateOffset, IsFirstPaymentDateAdjustable, IsSystem, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, SystemEntityKey, MarkedForDeleteOn)
    VALUES ('6e088cd3-2438-4c57-acac-857400c025f6', 'Quarterly', 'Payment due quarterly.', NULL, NULL, 1, 1, 4, 1, 0, 0, 1, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', 'b7e90438-1a98-452f-a6a2-37efc8119f05', NULL)
END
GO

IF EXISTS (SELECT 1 FROM PaymentTerms WHERE PaymentTermsKey = 'f5357185-db9e-4844-bf57-93865dcf6cf0')
BEGIN
    UPDATE PaymentTerms SET PaymentTermsName = 'Monthly', PaymentTermsDesc = 'Payment due monthly.', EarlyDiscountDays = NULL, EarlyDiscountPercent = NULL, PaymentIntervalTypeCode = 2, PaymentIntervalSize = 1, PaymentIntervalCount = 12, FirstPaymentDateTypeCode = 1, FirstPaymentDateOffset = 0, IsFirstPaymentDateAdjustable = 0, IsSystem = 1, CreatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', CreatedOn = '20150813 18:50:52', UpdatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', UpdatedOn = '20150813 18:50:52', SystemEntityKey = 'b7e90438-1a98-452f-a6a2-37efc8119f05', MarkedForDeleteOn = NULL
    WHERE PaymentTermsKey = 'f5357185-db9e-4844-bf57-93865dcf6cf0'
END
ELSE
BEGIN
    INSERT INTO PaymentTerms (PaymentTermsKey, PaymentTermsName, PaymentTermsDesc, EarlyDiscountDays, EarlyDiscountPercent, PaymentIntervalTypeCode, PaymentIntervalSize, PaymentIntervalCount, FirstPaymentDateTypeCode, FirstPaymentDateOffset, IsFirstPaymentDateAdjustable, IsSystem, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, SystemEntityKey, MarkedForDeleteOn)
    VALUES ('f5357185-db9e-4844-bf57-93865dcf6cf0', 'Monthly', 'Payment due monthly.', NULL, NULL, 2, 1, 12, 1, 0, 0, 1, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', 'b7e90438-1a98-452f-a6a2-37efc8119f05', NULL)
END
GO

IF EXISTS (SELECT 1 FROM PaymentTerms WHERE PaymentTermsKey = '121eeafb-327a-449f-8cb6-d585874cccd4')
BEGIN
    UPDATE PaymentTerms SET PaymentTermsName = 'Annually', PaymentTermsDesc = 'Payment due annually.', EarlyDiscountDays = NULL, EarlyDiscountPercent = NULL, PaymentIntervalTypeCode = 0, PaymentIntervalSize = 1, PaymentIntervalCount = 11, FirstPaymentDateTypeCode = 1, FirstPaymentDateOffset = 0, IsFirstPaymentDateAdjustable = 0, IsSystem = 1, CreatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', CreatedOn = '20150813 18:50:52', UpdatedByUserKey = '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', UpdatedOn = '20150813 18:50:52', SystemEntityKey = 'b7e90438-1a98-452f-a6a2-37efc8119f05', MarkedForDeleteOn = NULL
    WHERE PaymentTermsKey = '121eeafb-327a-449f-8cb6-d585874cccd4'
END
ELSE
BEGIN
    INSERT INTO PaymentTerms (PaymentTermsKey, PaymentTermsName, PaymentTermsDesc, EarlyDiscountDays, EarlyDiscountPercent, PaymentIntervalTypeCode, PaymentIntervalSize, PaymentIntervalCount, FirstPaymentDateTypeCode, FirstPaymentDateOffset, IsFirstPaymentDateAdjustable, IsSystem, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, SystemEntityKey, MarkedForDeleteOn)
    VALUES ('121eeafb-327a-449f-8cb6-d585874cccd4', 'Annually', 'Payment due annually.', NULL, NULL, 0, 1, 11, 1, 0, 0, 1, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150813 18:50:52', 'b7e90438-1a98-452f-a6a2-37efc8119f05', NULL)
END
GO

SET NOCOUNT OFF

