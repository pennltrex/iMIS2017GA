DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '32037fae-6bb3-4622-b857-04177e7b82c2'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '67b02e5a-4a44-4d91-8c76-f253f9ba0f05' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32037fae-6bb3-4622-b857-04177e7b82c2' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = 'c8e8b2d5-5adc-4cb1-b5c5-2e058ac207b8'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'd675e2e4-8a9c-4a8d-9293-e6103816dc4f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c8e8b2d5-5adc-4cb1-b5c5-2e058ac207b8' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '1ef2e5b7-ca44-480f-bc4d-6a7ba91d1753'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'd7b7de41-617c-4474-9486-868394a8a172' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1ef2e5b7-ca44-480f-bc4d-6a7ba91d1753' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '95b68b28-2397-4da4-bebd-8bdd119ec6de'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '62a91270-6108-42e4-892e-14c9f4cfd107' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '95b68b28-2397-4da4-bebd-8bdd119ec6de' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '8753cb5c-93ec-4d46-a35c-a253d6f8d22c'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'a7af3f85-acb0-4971-a17c-007df1cd9dd5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8753cb5c-93ec-4d46-a35c-a253d6f8d22c' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = 'ed57c06c-97d5-419b-b87b-b0c8cfeab6d9'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'ac19b3ed-49e1-45ba-9ca4-72f91c451716' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ed57c06c-97d5-419b-b87b-b0c8cfeab6d9' 
go


DELETE FROM [dbo].[RuleSourcePublish] WHERE RuleName IN ('CsSubscriptions','OpportunityType')
go
