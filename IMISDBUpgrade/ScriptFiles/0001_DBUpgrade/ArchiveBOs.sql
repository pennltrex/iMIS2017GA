
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('ContactBiography','ContactEducation','CsContact','CsProduct','CsSubscriptions','Document','GLExport','GroupTypeRef','Hierarchy','InventoryLocation','Opportunity','Perspective','Uom','UserDefinedField') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

