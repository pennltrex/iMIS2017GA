DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = 'bce5ea52-4be6-4878-a03a-96196c21cf1d'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'd6de08d4-e941-4208-b232-7923ce5519f9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bce5ea52-4be6-4878-a03a-96196c21cf1d' 
go

