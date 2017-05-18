
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
 WHERE [DocumentVersionKey] IN (NULL) 
   AND [DocumentTypeCode] IN ('APC', 'APP', 'CFL', 'CON', 'NAV', 'TCT', 'WEB') AND [DocumentStatusCode] = 40

go

