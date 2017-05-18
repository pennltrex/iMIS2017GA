
-- Fix up any missing ContactMaster IDs in UserMain Records
UPDATE u
   SET u.[ContactMaster] = c.[SyncContactID]
  FROM [dbo].[UserMain] u
       INNER JOIN [dbo].[ContactMain] c ON u.[UserKey] = c.[ContactKey]
 WHERE u.[ContactMaster] = '' AND c.SyncContactID <> ''

-- Unlink and release all UserMain records with no provider keys
UPDATE um
   SET [IsDisabled] = 1,
       [UserId] = '',
       [ProviderKey] = NULL
  FROM [dbo].[UserMain] um
 WHERE ([ProviderKey] IS NULL OR [ProviderKey] = '') AND [UserId] NOT IN ('SYSTEM', 'GUEST', 'ADMINISTRATOR', '')
 
-- Clear out any disabled UserMain records whose user ID duplicates an enabled user's ID
UPDATE um
   SET [UserId] = '',
       [ProviderKey] = NULL
  FROM [dbo].[UserMain] um
 WHERE [UserId] IN (SELECT [UserId] 
                      FROM [dbo].[UserMain] 
                     WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '' AND IsDisabled = 0)
       AND IsDisabled = 1
GO
       
-- Log duplicate active users
IF EXISTS (SELECT 1 FROM [dbo].[UserMain] WHERE [UserId] IN (SELECT [UserId] FROM [dbo].[UserMain] WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '' AND [IsDisabled] = 0 GROUP BY [UserId] HAVING COUNT([UserId]) > 1))
BEGIN
    PRINT 'The following Contact IDs have duplicate logins.  Logins are being removed and will need to be re-added as necessary'
END
SELECT '  ID: ' + ContactMaster + ', LOGIN: ' + [UserId] 
  FROM [dbo].[UserMain] 
 WHERE [UserId] IN (SELECT [UserId] 
                      FROM [dbo].[UserMain] 
                     WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '' AND [IsDisabled] = 0 GROUP BY [UserId] HAVING COUNT([UserId]) > 1)
 ORDER BY ContactMaster, UserId

-- Clean them out completely
UPDATE um
   SET [UserId] = '',
       [ProviderKey] = NULL
  FROM [dbo].[UserMain] um
 WHERE um.[UserId] IN (SELECT [UserId] 
                         FROM [dbo].[UserMain] 
                        WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '' AND [IsDisabled] = 0 GROUP BY [UserId] HAVING COUNT([UserId]) > 1)
GO

-- Clean out orphaned aspnet records
DECLARE @appId uniqueidentifier
SELECT @appId = [ApplicationId] FROM aspnet_Applications WHERE [LoweredApplicationName] = 'imis'
DELETE FROM [aspnet_Profile]
 WHERE [UserId] NOT IN (SELECT CAST([ProviderKey] AS uniqueidentifier) 
                              FROM [dbo].[UserMain] 
                             WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '');
DELETE FROM [aspnet_Membership]
 WHERE [ApplicationId] = @appId 
       AND [UserId] NOT IN (SELECT CAST([ProviderKey] AS uniqueidentifier) 
                              FROM [dbo].[UserMain] 
                             WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '');
DELETE FROM [aspnet_Users]
 WHERE [ApplicationId] = @appId 
       AND [UserId] NOT IN (SELECT CAST([ProviderKey] AS uniqueidentifier) 
                              FROM [dbo].[UserMain] 
                             WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> '');
GO

