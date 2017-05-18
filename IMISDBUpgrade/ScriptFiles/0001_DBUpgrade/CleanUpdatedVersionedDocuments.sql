DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '2937c055-5204-4e96-96d8-229005a816b3'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '68a39d24-c5e9-4956-9592-1c8ef267a1c0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2937c055-5204-4e96-96d8-229005a816b3' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '9224aecf-8779-4400-9289-ce9a38181d81'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'ee54217c-a489-4ae2-80ce-511abb4edcc5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9224aecf-8779-4400-9289-ce9a38181d81' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '371a9e41-951f-446a-a5ae-58e9f686579d'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '31e04df5-6163-4529-82cc-5271fe093554' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '371a9e41-951f-446a-a5ae-58e9f686579d' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = '67068bcd-b2fd-4ce5-8d14-68e3a1f30f41'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = 'd3cf4142-11fa-472f-a02d-8293d297756d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '67068bcd-b2fd-4ce5-8d14-68e3a1f30f41' 
go

DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentKey 
 WHERE d.DocumentKey = 'c9851350-3686-4c23-ac4f-8621d1d88c88'
DELETE h FROM [dbo].[Hierarchy] h INNER JOIN [dbo].[DocumentMain] d ON h.UniformKey = d.DocumentVersionKey 
 WHERE d.DocumentVersionKey = '12f6ca9e-f4c8-4558-aed5-d15ccc50c4fb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c9851350-3686-4c23-ac4f-8621d1d88c88' 
go

