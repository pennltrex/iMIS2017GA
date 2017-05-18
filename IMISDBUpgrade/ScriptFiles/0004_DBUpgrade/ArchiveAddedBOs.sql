
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('BatchSummary','CommunicationMessageTypeRef','EducationInProgress','EngagementMeasure','InteractionLog','SoaGroup','SoaGroupMember','SoaGroupMemberDetail','TransactionDetail','TransactionSummary') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

