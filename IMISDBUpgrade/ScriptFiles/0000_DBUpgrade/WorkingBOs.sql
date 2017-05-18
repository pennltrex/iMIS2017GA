
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('GroupInfo') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('CsSubscriptions','OpportunityType') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

