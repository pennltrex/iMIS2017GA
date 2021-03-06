----------------------------------------------------------
-- Unlock All IQA queries
----------------------------------------------------------
DECLARE @newAccessKey uniqueidentifier
SELECT @newAccessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Authenticated Users Full Control'
DECLARE @everyoneFullControl uniqueidentifier
SELECT @everyoneFullControl = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
UPDATE [dbo].[DocumentMain]
SET [AccessKey] = @everyoneFullControl
WHERE [DocumentTypeCode] = 'IQD' AND [DocumentStatusCode] = 40 AND [AccessKey] = @newAccessKey