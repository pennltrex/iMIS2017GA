-- Get list of UserMain rows with null or empty provider keys
DECLARE @noProviderKey TABLE ([UserKey] uniqueidentifier, [UserId] nvarchar(60), [IsDisabled] bit, [ExpirationDate] datetime, [ProviderKey] uniqueidentifier)
INSERT INTO @noProviderKey ([UserKey], [UserId], [IsDisabled], [ExpirationDate])
    SELECT [UserKey], [UserId], [IsDisabled], [ExpirationDate]
      FROM [dbo].[UserMain]
     WHERE (UserId IS NOT NULL AND UserId <> '') AND (ProviderKey IS NULL OR ProviderKey = '')
-- Get a list of Provider Keys referenced by UserMain     
DECLARE @providerKeysInUse TABLE ([ProviderKey] uniqueidentifier)
INSERT INTO @providerKeysInUse ([ProviderKey])
    SELECT DISTINCT(CAST([ProviderKey] AS uniqueidentifier))
      FROM [dbo].[UserMain]
     WHERE [ProviderKey] IS NOT NULL AND [ProviderKey] <> ''
-- Get a list of orphaned aspnet_User rows
DECLARE @orphanedAspnetUser TABLE ([UserId] uniqueidentifier, [UserName] nvarchar(256), [LoweredUserName] nvarchar(256))
INSERT INTO @orphanedAspnetUser ([UserId], [UserName], [LoweredUserName])
    SELECT [UserId], [UserName], [LoweredUserName]
      FROM [dbo].[aspnet_Users] aspu
           LEFT OUTER JOIN @providerKeysInUse pkiu ON aspu.UserId = pkiu.ProviderKey
     WHERE pkiu.ProviderKey IS NULL
-- Link up any rows that can be linked up
UPDATE npk
   SET npk.[ProviderKey] = aspu.[UserId]
  FROM @noProviderKey npk
       INNER JOIN [dbo].[aspnet_Users] aspu ON LOWER(npk.[UserId]) = aspu.[LoweredUserName]
DECLARE @usersAffected nvarchar(max)
SET @usersAffected = ''
SELECT @usersAffected = @usersAffected + '        ID:' + CAST(COALESCE(um.ContactMaster, '--') AS nvarchar(10)) + ', Login: ' + um.UserId + CHAR(10)
  FROM UserMain um
       INNER JOIN @noProviderKey npk ON um.[UserKey] = npk.[UserKey]
 WHERE npk.[ProviderKey] IS NOT NULL
 ORDER BY um.UserId
 
IF LEN(@usersAffected) > 0
BEGIN
    PRINT '  INFO: The following User(s) have been restored as Public Users:'
    PRINT @usersAffected
    PRINT '  INFO: Please be sure to verify the user(s) are correct after upgrade.'
END
ELSE
    PRINT '  INFO: No orphaned public users found'
    
-- Now update UserMain with the correct links
UPDATE um
   SET um.[ProviderKey] = LOWER(CAST(npk.[ProviderKey] AS nvarchar(100)))
  FROM UserMain um
       INNER JOIN @noProviderKey npk ON um.[UserKey] = npk.[UserKey]
 WHERE npk.[ProviderKey] IS NOT NULL
-- Now remove any associated rows in Users
DELETE u
  FROM Users u
       INNER JOIN @noProviderKey npk ON u.UserId = npk.UserId
 WHERE npk.[ProviderKey] IS NOT NULL
