
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('AdvancedEmailNinetyDaysEvents','AdvancedEmailTwelveMonthsDeliveredByDate','AdvancedEmailTwelveMonthsTotals','AutoPayAccount','AutoPayMemberInstructionDetail','BillingLogByParty','CMNotificationsDue','CommunicationLogSummary','CsAddressFormats','CsContactBasic','CsFreightDollar','CsFreightQuantity','CsProductLocation','CsTaxCategory','CsTransNotify','DataVaultAttemptSummary','DayOfTheWeekRef','EngagementCategory','EngagementScoreCurrentData','EngagementScoreFormula','EngagementScoreMonthlyData','EngagementScoreResult','EngagementScoreYearlyData','ExpiredMemberUpdateDetailLog','FirstNotifyContactPerGift','GiftSummary','GLBatchTransactionData','GLDailyTransactionData','GLDetailDueToDueFromTransactionData','GLDetailTransactionData','GLDueToDueFromTransactionData','GLExportFormatTypeRef','GLMonthlyTransactionData','GLTransactionData','GroupPriceSheet','MemorialTributeTypeRef','NetContactBasic','PercentileRanking','PriceSheet','ProductPriceSheet','ProfileDocuments','Promotion','ReferenceDate','SystemParamInt','VolunteerAvailability','VolunteerHistory','VolunteerInformation','VolunteerSkills') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('Address','AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoices','AutoPayInvoicesDues','AutoPayInvoicesFundraising','CertificationModule','CertificationProgram','CertificationProgramRegistration','Contact','ContactCommunicationReasonPreferences','ContentWorkflow','CsAddress','CsCommitteeMember','CsCommitteePosition','CsContact','CsCountryNames','CsEvent','CsFunction','CsGeneralLookupTables','CsName_Demo','CsOrderLines','CsOrders','CsRegFunctions','CsRegistration','CsRelationshipTypes','CsStateProvinceCodes','CsTerms','CultivatingFor','CustomerExperienceView','DataVaultLogAttempt','DataVaultLogDetail','GiftHistory','GiftsReceived','InvoiceSummary','NavigationWorkflow','NetContact','Offering','Opportunity','SourceCode','TransactionDetail','User','UserData') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

