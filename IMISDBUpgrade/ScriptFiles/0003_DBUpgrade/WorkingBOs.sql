
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoices','AutoPayInvoicesDues','AutoPayInvoicesFundraising','AutoPayPaymentsDue','BillingCycles','ContactSocialNetwork','ContentFilter','DataVaultAttemptStatusRef','DataVaultBatchSummary','DataVaultLog','DataVaultLogAttempt','DataVaultLogDetail','DataVaultStatusRef','DiscountableItem','DiscountableItemClass','EventRegistrantsReport','PaymentMethodSet','RecurringDonationPaymentAttemptsExceeded','SocialNetworkRef') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('Address','CertificationModule','CertificationModuleRegistration','CertificationProgramRegistration','ContactBiography','CsContact','CsEvent','CsFunction','CustomerExperience','CustomerExperienceStatusChange','Document','DocumentType','ExperienceCountSummary','ExperienceRoster','InvoiceSummary','Offering','ParticipantRoster','Program','RegistrationStatusChange') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

