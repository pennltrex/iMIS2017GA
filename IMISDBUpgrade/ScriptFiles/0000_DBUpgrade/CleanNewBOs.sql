DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '30bcdd14-1191-45c2-bab7-054c94cf8b46'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '0e66ff9f-2839-4e1d-b7d1-0b97b6b2a009' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30bcdd14-1191-45c2-bab7-054c94cf8b46' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '2c919c6d-40c6-45ea-8f77-64149dc60d65'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '746f7d5f-1fad-4f84-a0c0-7964516f1a23' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c919c6d-40c6-45ea-8f77-64149dc60d65' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = 'bb9480c3-ee13-452d-8259-c3d229a0afaa'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'b5d32ab3-e669-4dce-bea7-e193a3ebbef0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bb9480c3-ee13-452d-8259-c3d229a0afaa' 
go


DELETE FROM [dbo].[RuleSourcePublish] WHERE RuleName IN ('GroupInfo')
go
