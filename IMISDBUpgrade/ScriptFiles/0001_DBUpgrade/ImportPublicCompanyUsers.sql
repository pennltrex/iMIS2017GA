-- Begin import
DECLARE @asiTempNameSecUsers TABLE ([ID] varchar(12) PRIMARY KEY, [IdKey] uniqueidentifier)
DECLARE @defaultDepartmentGroupKey UNIQUEIDENTIFIER
DECLARE @defaultPerspectiveKey UNIQUEIDENTIFIER
DECLARE @userKey UNIQUEIDENTIFIER
DECLARE @now DATETIME
DECLARE @aspnetExists BIT
DECLARE @holdID VARCHAR(12)

-- Get some constants we need
SELECT @aspnetExists = COUNT (1) FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type = 'U'
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @defaultDepartmentGroupKey = [DefaultDepartmentGroupKey] FROM [OrganizationMain] WHERE [IsDefault] = 1
SELECT @defaultPerspectiveKey = [PerspectiveKey] FROM [GroupPerspective] WHERE [GroupKey] = @defaultDepartmentGroupKey AND [IsDefaultFlag] = 1
SET @now = GETDATE()
SET @holdID = ''

-- Process the non-company records
SET ROWCOUNT 5000
WHILE (1=1)
BEGIN
    BEGIN TRANSACTION

    INSERT INTO @asiTempNameSecUsers ([ID], [IdKey]) 
        SELECT a.[ID], c.[ContactKey]
			FROM [dbo].[Name] a 
                 INNER JOIN [dbo].[Name_Security] b ON a.[ID] = b.[ID] 
                 INNER JOIN [dbo].[ContactMain] c ON a.[ID] = c.[SyncContactID]
                 LEFT OUTER JOIN [dbo].[UserMain] d ON c.[ContactKey] = d.[UserKey]
			WHERE a.[ID] > @holdID 
			  AND b.[WEB_LOGIN] <> '' 
              AND c.[IsInstitute] = 1 
              AND d.[UserKey] IS NULL
              AND NOT EXISTS (select * from ContactMain cm where cm.SyncContactID = c.SyncContactID AND cm.IsInstitute = 0)
            ORDER BY a.[ID]
 
    IF @@ROWCOUNT = 0
    BEGIN
        COMMIT TRANSACTION
        BREAK
    END

    SELECT @holdID = MAX(ID) FROM @asiTempNameSecUsers

	-- Display info on conflicting login ids that will be skipped
    SELECT CAST('WARNING: ID ' +  b.[ID] + '''s logon (''' + UPPER(c.[WEB_LOGIN]) + ''') conflicts with existing logon' AS nvarchar(256))
    FROM @asiTempNameSecUsers a 
         INNER JOIN [dbo].[Name] b ON a.[ID] = b.[ID]
         INNER JOIN [dbo].[Name_Security] c ON b.[ID] = c.[ID]
         LEFT OUTER JOIN [dbo].[UserMain] d ON c.[WEB_LOGIN] = d.[UserId]
    WHERE LEN(c.[WEB_LOGIN]) BETWEEN 1 AND 60 AND d.[UserId] IS NOT NULL
    
    -- Import the new records for the Public users
    INSERT INTO [dbo].[UserMain] ([UserKey], [ContactMaster], [UserId], [IsDisabled], 
                                  [EffectiveDate], [ExpirationDate], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], 
                                  [DefaultDepartmentGroupKey], [DefaultPerspectiveKey]) 
        SELECT [IdKey], b.[ID], UPPER(c.[WEB_LOGIN]), c.[LOGIN_DISABLED],
               COALESCE(b.[DATE_ADDED], '19000101 00:00:00'), c.[EXPIRATION_DATE], @userKey, @now, @userKey, @now, @defaultDepartmentGroupKey, @defaultPerspectiveKey
        FROM @asiTempNameSecUsers a 
             INNER JOIN [dbo].[Name] b ON a.[ID] = b.[ID]
             INNER JOIN [dbo].[Name_Security] c ON b.[ID] = c.[ID]
			 LEFT OUTER JOIN [dbo].[UserMain] d ON c.[WEB_LOGIN] = d.[UserId]
        WHERE LEN(c.[WEB_LOGIN]) BETWEEN 1 AND 60 AND d.[UserId] IS NULL

    -- if the aspnet_ tables exist, try to locate the ProviderKey for the new users; the rows will already have been created by CreateProviderUsers
    IF @aspnetExists = 1
		UPDATE [dbo].[UserMain]
		SET [ProviderKey] = LOWER(CAST([aspnet_Users].[UserId] AS NVARCHAR(100)))
		FROM [dbo].[UserMain] INNER JOIN [dbo].[aspnet_Users] ON LOWER([UserMain].[UserId]) = [aspnet_Users].[LoweredUserName]
		LEFT OUTER JOIN [dbo].[UserMain] u2 ON LOWER(CAST([aspnet_Users].[UserId] AS NVARCHAR(100))) = u2.[ProviderKey]
		WHERE u2.[ProviderKey] is null
		AND [UserMain].[UserKey] IN (SELECT [IdKey] FROM @asiTempNameSecUsers)

    COMMIT TRANSACTION
    DELETE FROM @asiTempNameSecUsers
END