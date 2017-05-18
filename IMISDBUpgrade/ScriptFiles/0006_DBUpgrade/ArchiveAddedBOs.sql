
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('AdvancedEmailNinetyDaysEvents','AdvancedEmailTwelveMonthsDeliveredByDate','AdvancedEmailTwelveMonthsTotals','AutoPayAccount','AutoPayMemberInstructionDetail','BillingLogByParty','CMNotificationsDue','CommunicationLogSummary','CsAddressFormats','CsContactBasic','CsFreightDollar','CsFreightQuantity','CsProductLocation','CsTaxCategory','CsTransNotify','DataVaultAttemptSummary','DayOfTheWeekRef','EngagementCategory','EngagementScoreCurrentData','EngagementScoreFormula','EngagementScoreMonthlyData','EngagementScoreResult','EngagementScoreYearlyData','ExpiredMemberUpdateDetailLog','FirstNotifyContactPerGift','GiftSummary','GLBatchTransactionData','GLDailyTransactionData','GLDetailDueToDueFromTransactionData','GLDetailTransactionData','GLDueToDueFromTransactionData','GLExportFormatTypeRef','GLMonthlyTransactionData','GLTransactionData','GroupPriceSheet','MemorialTributeTypeRef','NetContactBasic','PercentileRanking','PriceSheet','ProductPriceSheet','ProfileDocuments','Promotion','ReferenceDate','SystemParamInt','VolunteerAvailability','VolunteerHistory','VolunteerInformation','VolunteerSkills') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

