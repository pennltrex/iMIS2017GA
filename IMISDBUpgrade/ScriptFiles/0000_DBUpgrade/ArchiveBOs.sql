
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('CsSubscriptions','OpportunityType') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

