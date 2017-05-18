
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('Address','AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoices','AutoPayInvoicesDues','AutoPayInvoicesFundraising','CertificationModule','CertificationProgram','CertificationProgramRegistration','Contact','ContactCommunicationReasonPreferences','ContentWorkflow','CsAddress','CsCommitteeMember','CsCommitteePosition','CsContact','CsCountryNames','CsEvent','CsFunction','CsGeneralLookupTables','CsName_Demo','CsOrderLines','CsOrders','CsRegFunctions','CsRegistration','CsRelationshipTypes','CsStateProvinceCodes','CsTerms','CultivatingFor','CustomerExperienceView','DataVaultLogAttempt','DataVaultLogDetail','GiftHistory','GiftsReceived','InvoiceSummary','NavigationWorkflow','NetContact','Offering','Opportunity','SourceCode','TransactionDetail','User','UserData') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

