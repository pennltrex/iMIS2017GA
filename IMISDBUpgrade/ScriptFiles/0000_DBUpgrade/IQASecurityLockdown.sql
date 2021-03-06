
-----------------------------------------------------
-- Secure All IQA queries
-----------------------------------------------------
-- Get the new Access Key to use
DECLARE @newAccessKey uniqueidentifier
SELECT @newAccessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Authenticated Users Full Control'
-- Set all IQA Query documents to use the new Access Key
UPDATE [dbo].[DocumentMain]
SET [AccessKey] = @newAccessKey
WHERE [DocumentTypeCode] = 'IQD' AND [DocumentStatusCode] = 40 

----------------------------------------------------------
-- Set public view events queries to everyone access
----------------------------------------------------------
DECLARE @everyoneFullControl uniqueidentifier
SELECT @everyoneFullControl = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
UPDATE [dbo].[DocumentMain]
SET [AccessKey] = @everyoneFullControl
WHERE [DocumentTypeCode] = 'IQD' AND [DocumentStatusCode] = 40 AND ([DocumentName] = 'Public' or [DocumentName] = 'ViewAll') 