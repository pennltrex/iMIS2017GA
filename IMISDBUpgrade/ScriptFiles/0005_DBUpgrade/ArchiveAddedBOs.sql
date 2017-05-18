
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('CertificationProgramRegistrationWithStatus','CommunicationLogEventTypeRef','CommunicationLogStatusRef','DynamicGroup','FormDefinitionFieldData','FormFieldResponseData','GroupUpdateInstruction','InteractionLogEvent','InteractionLogEventSummary','LicenseOrganizationVersion','LicenseRef','PartyDuplicateData','ScheduleFrequencyRef','UserData') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

