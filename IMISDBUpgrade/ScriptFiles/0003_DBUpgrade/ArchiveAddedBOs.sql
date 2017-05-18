
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoices','AutoPayInvoicesDues','AutoPayInvoicesFundraising','AutoPayPaymentsDue','BillingCycles','ContactSocialNetwork','ContentFilter','DataVaultAttemptStatusRef','DataVaultBatchSummary','DataVaultLog','DataVaultLogAttempt','DataVaultLogDetail','DataVaultStatusRef','DiscountableItem','DiscountableItemClass','EventRegistrantsReport','PaymentMethodSet','RecurringDonationPaymentAttemptsExceeded','SocialNetworkRef') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

