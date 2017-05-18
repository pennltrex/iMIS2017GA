
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('ContactBiography','ContactEducation','CsContact','CsProduct','CsSubscriptions','Document','GLExport','GroupTypeRef','Hierarchy','InventoryLocation','Opportunity','Perspective','Uom','UserDefinedField') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

