SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

-------------------------------------------------------------------------------
-- Ensure required Name_Fin, Name_Security, and Name_Security_Groups rows exist
-------------------------------------------------------------------------------
INSERT INTO Name_Fin (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Fin b ON a.ID = b.ID
WHERE b.ID IS NULL
GO
INSERT INTO Name_Security (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Security b ON a.ID = b.ID
WHERE b.ID IS NULL
GO
INSERT INTO Name_Security_Groups (ID)
SELECT a.ID FROM Name a LEFT OUTER JOIN Name_Security_Groups b ON a.ID = b.ID
WHERE b.ID IS NULL
GO

-----------------------------------------
-- Add SYSTEM user if not already present
-- and Update it if already exists
-----------------------------------------
DECLARE @now datetime
DECLARE @creatorKey uniqueidentifier
DECLARE @contactTypeKey uniqueidentifier
DECLARE @accessKey uniqueidentifier
DECLARE @contactKey uniqueidentifier
DECLARE @componentKey uniqueidentifier
DECLARE @defaultDepartmentGroupKey uniqueidentifier
DECLARE @defaultPerspectiveKey uniqueidentifier
DECLARE @id nvarchar(12)

SET @now = GETDATE()
SET @id = 'ASISystem'
SELECT @creatorKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @contactTypeKey = [ContactTypeKey] FROM [dbo].[ContactTypeRef] WHERE [ContactTypeDesc] = 'Individual'
SELECT @accessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
SELECT @componentKey = [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'Individual' AND [InterfaceName] = 'BusinessController'
SELECT @defaultDepartmentGroupKey = [GroupKey]
  FROM [dbo].[GroupMain] gm INNER JOIN [dbo].[GroupTypeRef] gt ON gm.GroupTypeKey = gt.GroupTypeKey
 WHERE gm.[Name] = 'Administrative' AND gt.[GroupTypeName] = 'Department'
SELECT @defaultPerspectiveKey = [PerspectiveKey] FROM [dbo].[Perspective] WHERE [PerspectiveName] = 'Staff'

IF NOT EXISTS (SELECT 1 FROM [dbo].[ContactMain] WHERE [FullName] = 'System' OR [ContactKey] = '209935B1-C94E-472A-94CE-8C3F1526D4A5')
BEGIN
    SET @contactKey = '209935B1-C94E-472A-94CE-8C3F1526D4A5'
    INSERT INTO [dbo].[UniformRegistry] (UniformKey, ComponentKey) VALUES (@contactKey, @componentKey)
    INSERT INTO [dbo].[ContactMain] (ContactKey, ContactStatusCode, FullName, SortName, IsInstitute, NoSolicitationFlag, 
                                     SyncContactID, IsIDEditable, ID, PreferredAddressCategoryCode, IsSortNameOverridden,
                                     AccessKey, TextOnlyEmailFlag, ContactTypeKey, OptOutFlag,
                                     CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES (@contactKey, 1, 'System', 'SYSTEM', 0, 0, '', 1, @id, 1, 0, @accessKey, 0, @contactTypeKey, 0,
            @creatorKey, @now, @creatorKey, @now)             
END
ELSE
BEGIN
    SELECT @contactKey = [ContactKey] FROM [dbo].[ContactMain] WHERE [FullName] = 'System'
    IF (@contactKey IS NULL) SET @contactKey = '209935B1-C94E-472A-94CE-8C3F1526D4A5'
    UPDATE [dbo].[ContactMain] 
       SET [SyncContactID] = '', [ID] = 'ASISystem', [FullName] = 'System'
     WHERE [ContactKey] = @contactKey
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Individual] WHERE [FirstName] = 'System' OR [ContactKey] = '209935B1-C94E-472A-94CE-8C3F1526D4A5')
BEGIN
    INSERT INTO [dbo].[Individual] (ContactKey, FirstName, MiddleName, LastName, Informal, PrimaryInstituteName, PrimaryInstituteTitle)
    VALUES (@contactKey, 'System', '', '', '', 'ASI', 'ASI System') 
END
ELSE
BEGIN
    SELECT @contactKey = [ContactKey] FROM [dbo].[Individual] WHERE [FirstName] = 'System'
    IF (@contactKey IS NULL) SET @contactKey = '209935B1-C94E-472A-94CE-8C3F1526D4A5'
    UPDATE [dbo].[Individual]
       SET [Gender] = NULL, 
           [FirstName] = 'System', [MiddleName] = '', [LastName] = '',
           [PrimaryInstituteName] = 'ASI',
           [PrimaryInstituteTitle] = 'ASI System'
     WHERE [ContactKey] = @contactKey
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM')
BEGIN
    IF NOT EXISTS (SELECT 1 FROM [dbo].[UserMain] WHERE UserKey = '209935B1-C94E-472A-94CE-8C3F1526D4A5')
    BEGIN
        INSERT INTO [dbo].[UserMain] ([UserKey], [ContactMaster], [UserId], [IsDisabled], 
                                      [EffectiveDate], [ExpirationDate], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], 
                                      [DefaultDepartmentGroupKey], [DefaultPerspectiveKey]) 
        VALUES (@contactKey, '', 'SYSTEM', 1, '20041230 00:00:00.000', NULL,
                @creatorKey, @now, @creatorKey, @now, @defaultDepartmentGroupKey, @defaultPerspectiveKey)
    END
    ELSE
    BEGIN
        UPDATE [dbo].[UserMain]
           SET [UserId] = 'SYSTEM', [ContactMaster] = '', [IsDisabled] = 1, [ExpirationDate] = NULL,
               [DefaultDepartmentGroupKey] = @defaultDepartmentGroupKey, [DefaultPerspectiveKey] = @defaultPerspectiveKey
         WHERE [UserKey] = '209935B1-C94E-472A-94CE-8C3F1526D4A5'
    END        
END
ELSE
BEGIN
    UPDATE [dbo].[UserMain]
       SET [ContactMaster] = '', [IsDisabled] = 1, [ExpirationDate] = NULL,
           [DefaultDepartmentGroupKey] = @defaultDepartmentGroupKey, [DefaultPerspectiveKey] = @defaultPerspectiveKey
     WHERE [UserId] = 'SYSTEM'
END
GO


-- Create GUEST account if one doesn't already exist
DECLARE @tempID int
DECLARE @tempAddressNum int
DECLARE @now datetime

SET @now = GETDATE()

IF NOT EXISTS (SELECT 1 FROM Name_Security WHERE WEB_LOGIN = 'GUEST')
BEGIN
    SET @tempID = NULL
    SELECT @tempID = ContactMaster FROM UserMain WHERE UserId = 'GUEST'
    IF @tempID IS NULL
    BEGIN
        EXEC sp_asi_GetCounter Name
        SELECT @tempID = LAST_VALUE from Counter where COUNTER_NAME = 'Name'
    END
    EXEC sp_asi_GetCounter Name_Address
    SELECT @tempAddressNum = LAST_VALUE from Counter where COUNTER_NAME = 'Name_Address'
    
    INSERT INTO [dbo].[Name] 
           ([ID], [LAST_FIRST], [FIRST_NAME], [FULL_NAME], [MEMBER_TYPE], [STATUS], 
            [MAIL_ADDRESS_NUM], [BILL_ADDRESS_NUM], [SHIP_ADDRESS_NUM],
            [JOIN_DATE], [DATE_ADDED], [LAST_UPDATED], [UPDATED_BY])
    VALUES (CAST(@tempID AS varchar(10)), 'GUEST', 'GUEST', 'GUEST', 'NM', 'A', 
            @tempAddressNum, @tempAddressNum, @tempAddressNum,
            @now, @now, @now, 'MANAGER')

    INSERT Name_Address (ID, ADDRESS_NUM, PURPOSE, PREFERRED_MAIL, PREFERRED_BILL, PREFERRED_SHIP)
    VALUES (CAST(@tempID AS varchar(10)), @tempAddressNum, 'Address', 1, 1, 1)

    INSERT Name_Security (ID, WEB_LOGIN, PASSWORD)
    VALUES (CAST(@tempID AS varchar(10)), 'GUEST', '')

    INSERT Name_Fin (ID) 
    VALUES (CAST(@tempID AS varchar(10)))
END

DECLARE @contactKey uniqueidentifier
DECLARE @contactStatusCode int
DECLARE @managerKey uniqueidentifier 
DECLARE @addressCategoryCode int
DECLARE @accessKey uniqueidentifier 
DECLARE @contactTypeKey uniqueidentifier 
DECLARE @defaultDepartmentGroupKey uniqueidentifier
DECLARE @defaultPerspectiveKey uniqueidentifier
DECLARE @componentKey uniqueidentifier

-- Look-up some required values
SELECT @contactKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'GUEST'
IF (@contactKey IS NULL) 
BEGIN
    SELECT @contactKey = [ContactKey] from [dbo].[ContactMain] WHERE [FullName] = 'GUEST'
    IF (@contactKey IS NULL)
    BEGIN
        IF EXISTS (SELECT 1 FROM [dbo].[ContactMain] WHERE [ContactKey] = '8650EB42-3034-471C-B8F2-9E79313E5C95')
            SET @contactKey = newid()
        ELSE
            SET @contactKey = '8650EB42-3034-471C-B8F2-9E79313E5C95'
    END
END
SELECT @contactStatusCode = [ContactStatusCode] FROM [dbo].[ContactStatusRef] WHERE [ContactStatusDesc] = 'Active'
SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
SELECT @addressCategoryCode = [AddressCategoryCode] from [dbo].[AddressCategoryRef] WHERE [AddressCategoryName] = 'Mail'
SELECT @accessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
SELECT @contactTypeKey = [ContactTypeKey] FROM [dbo].[ContactTypeRef] WHERE [ContactTypeDesc] = 'Individual'
SELECT @defaultDepartmentGroupKey = [GroupKey]
  FROM [dbo].[GroupMain] gm INNER JOIN [dbo].[GroupTypeRef] gt ON gm.GroupTypeKey = gt.GroupTypeKey
 WHERE gm.[Name] = 'Administrative' AND gt.[GroupTypeName] = 'Department'
SELECT @defaultPerspectiveKey = [PerspectiveKey] FROM [dbo].[Perspective] WHERE [PerspectiveName] = 'Staff'
SELECT @componentKey = [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'Individual' AND [InterfaceName] = 'BusinessController'

-- Insert into ContactMain if not present
IF NOT EXISTS (SELECT 1 FROM [dbo].[ContactMain] WHERE [FullName] = 'GUEST' OR [ContactKey] = @contactKey)
BEGIN
    INSERT INTO [dbo].[UniformRegistry] (UniformKey, ComponentKey) VALUES (@contactKey, @componentKey)
    INSERT INTO [dbo].[ContactMain]
                ([ContactKey], [ContactStatusCode], [FullName], [SortName], [IsInstitute], [NoSolicitationFlag], 
                 [SyncContactID], [UpdatedOn], [UpdatedByUserKey], [IsIDEditable], [ID], [PreferredAddressCategoryCode],
                 [IsSortNameOverridden], [AccessKey], [CreatedByUserKey], [CreatedOn], [TextOnlyEmailFlag],
                 [ContactTypeKey], [OptOutFlag])
    VALUES (@contactKey, @contactStatusCode, 'GUEST', 'GUEST', 0, 0, 
            @tempID, @now, @managerKey, 0, @tempID, @addressCategoryCode, 
            0, @accessKey, @managerKey, @now, 0,
            @contactTypeKey, 0)
END
ELSE
BEGIN
    UPDATE [dbo].[ContactMain] 
       SET [FullName] = 'GUEST'
     WHERE [ContactKey] = @contactKey
END

-- Insert into Individual if not present
IF NOT EXISTS (SELECT 1 FROM [dbo].[Individual] WHERE [FirstName] = 'GUEST' OR [ContactKey] = @contactKey)
BEGIN
    INSERT INTO [dbo].[Individual]
                ([ContactKey], [PrefixCode], [FirstName], [MiddleName], [LastName], [SuffixCode], [Designation],
                 [Informal], [Gender])
    VALUES (@contactKey, '', 'GUEST', '', '', '', '', '', '')
END
ELSE
BEGIN
    UPDATE [dbo].[Individual]
       SET [Gender] = NULL, 
           [FirstName] = 'GUEST', [MiddleName] = '', [LastName] = '',
           [PrimaryInstituteName] = 'ASI'
     WHERE [ContactKey] = @contactKey
END

-- Insert into UserMain if not present
IF NOT EXISTS (SELECT 1 FROM [dbo].[UserMain] WHERE [UserId] = 'GUEST' OR UserKey = @contactKey)
BEGIN
    INSERT INTO [dbo].[UserMain]
                ([UserKey], [ContactMaster], [UserId], [IsDisabled], [EffectiveDate], [ExpirationDate],
                 [UpdatedByUserKey], [UpdatedOn], [CreatedByUserKey], [CreatedOn], 
                 [DefaultDepartmentGroupKey], [DefaultPerspectiveKey], [ProviderKey])
    VALUES (@contactKey, @tempID, 'GUEST', 0, '20000101 00:00:00', NULL, @managerKey, @now, @managerKey, @now,
            @defaultDepartmentGroupKey, @defaultPerspectiveKey, NULL)
END
GO

-- Create IMISLOG account if one doesn't already exist
DECLARE @tempID int
DECLARE @tempAddressNum int
DECLARE @now datetime
DECLARE @userID nvarchar(60)

SET @now = GETDATE()
SET @userID = 'IMISLOG'

IF NOT EXISTS (SELECT 1 FROM Name_Security WHERE WEB_LOGIN = @userID)
BEGIN
    SET @tempID = NULL
    SELECT @tempID = ContactMaster FROM UserMain WHERE UserId = @userID
    IF @tempID IS NULL
    BEGIN
        EXEC sp_asi_GetCounter Name
        SELECT @tempID = LAST_VALUE from Counter where COUNTER_NAME = 'Name'
    END
    EXEC sp_asi_GetCounter Name_Address
    SELECT @tempAddressNum = LAST_VALUE from Counter where COUNTER_NAME = 'Name_Address'
    
    -- Before inserting into Name, Name_Address, etc. create the ContactMain and Individual rows
    -- so we can try to use a well known ContactKey    
    DECLARE @contactKey uniqueidentifier
    DECLARE @contactStatusCode int
    DECLARE @managerKey uniqueidentifier 
    DECLARE @addressCategoryCode int
    DECLARE @accessKey uniqueidentifier 
    DECLARE @contactTypeKey uniqueidentifier 
    DECLARE @defaultDepartmentGroupKey uniqueidentifier
    DECLARE @defaultPerspectiveKey uniqueidentifier
    DECLARE @componentKey uniqueidentifier

    -- Look-up some required values
    SELECT @contactKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'IMISLOG'
    IF (@contactKey IS NULL) 
    BEGIN
        SELECT @contactKey = [ContactKey] from [dbo].[ContactMain] WHERE [FullName] = @userID
        IF (@contactKey IS NULL)
        BEGIN
            IF EXISTS (SELECT 1 FROM [dbo].[ContactMain] WHERE [ContactKey] = '498601F3-E217-4FCA-89D0-74F151253224')
                SET @contactKey = newid()
            ELSE
                SET @contactKey = '498601F3-E217-4FCA-89D0-74F151253224'
        END
    END
    SELECT @contactStatusCode = [ContactStatusCode] FROM [dbo].[ContactStatusRef] WHERE [ContactStatusDesc] = 'Active'
    SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @addressCategoryCode = [AddressCategoryCode] from [dbo].[AddressCategoryRef] WHERE [AddressCategoryName] = 'Mail'
    SELECT @accessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
    SELECT @contactTypeKey = [ContactTypeKey] FROM [dbo].[ContactTypeRef] WHERE [ContactTypeDesc] = 'Individual'
    SELECT @defaultDepartmentGroupKey = [GroupKey]
      FROM [dbo].[GroupMain] gm INNER JOIN [dbo].[GroupTypeRef] gt ON gm.GroupTypeKey = gt.GroupTypeKey
     WHERE gm.[Name] = 'Administrative' AND gt.[GroupTypeName] = 'Department'
    SELECT @defaultPerspectiveKey = [PerspectiveKey] FROM [dbo].[Perspective] WHERE [PerspectiveName] = 'Staff'
    SELECT @componentKey = [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'Individual' AND [InterfaceName] = 'BusinessController'

    -- Insert into ContactMain if not present
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ContactMain] WHERE [FullName] = @userID OR [ContactKey] = @contactKey)
    BEGIN
        INSERT INTO [dbo].[UniformRegistry] (UniformKey, ComponentKey) VALUES (@contactKey, @componentKey)
        INSERT INTO [dbo].[ContactMain]
                    ([ContactKey], [ContactStatusCode], [FullName], [SortName], [IsInstitute], [NoSolicitationFlag], 
                     [SyncContactID], [UpdatedOn], [UpdatedByUserKey], [IsIDEditable], [ID], [PreferredAddressCategoryCode],
                     [IsSortNameOverridden], [AccessKey], [CreatedByUserKey], [CreatedOn], [TextOnlyEmailFlag],
                     [ContactTypeKey], [OptOutFlag])
        VALUES (@contactKey, @contactStatusCode, @userID, @userID, 0, 0, 
                @tempID, @now, @managerKey, 0, @tempID, @addressCategoryCode, 
                0, @accessKey, @managerKey, @now, 0,
                @contactTypeKey, 0)
    END
    ELSE
    BEGIN
        UPDATE [dbo].[ContactMain] 
           SET [FullName] = @userID
         WHERE [ContactKey] = @contactKey
    END

    -- Insert into Individual if not present
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Individual] WHERE [FirstName] = @userID OR [ContactKey] = @contactKey)
    BEGIN
        INSERT INTO [dbo].[Individual]
                    ([ContactKey], [PrefixCode], [FirstName], [MiddleName], [LastName], [SuffixCode], [Designation],
                     [Informal], [Gender])
        VALUES (@contactKey, '', @userID, '', '', '', '', '', '')
    END
    ELSE
    BEGIN
        UPDATE [dbo].[Individual]
           SET [Gender] = NULL, 
               [FirstName] = @userID, [MiddleName] = '', [LastName] = '',
               [PrimaryInstituteName] = 'ASI'
         WHERE [ContactKey] = @contactKey
    END

    -- Insert into UserMain if not present
    IF NOT EXISTS (SELECT 1 FROM [dbo].[UserMain] WHERE [UserId] = @userID OR UserKey = @contactKey)
    BEGIN
        INSERT INTO [dbo].[UserMain]
                    ([UserKey], [ContactMaster], [UserId], [IsDisabled], [EffectiveDate], [ExpirationDate],
                     [UpdatedByUserKey], [UpdatedOn], [CreatedByUserKey], [CreatedOn], 
                     [DefaultDepartmentGroupKey], [DefaultPerspectiveKey], [ProviderKey])
        VALUES (@contactKey, @tempID, @userID, 0, '20000101 00:00:00', NULL, 
                @managerKey, @now, @managerKey, @now,
                @defaultDepartmentGroupKey, @defaultPerspectiveKey, NULL)
    END
    
    INSERT INTO [dbo].[Name] 
           ([ID], [LAST_FIRST], [FIRST_NAME], [FULL_NAME], [MEMBER_TYPE], [STATUS], 
            [MAIL_ADDRESS_NUM], [BILL_ADDRESS_NUM], [SHIP_ADDRESS_NUM],
            [JOIN_DATE], [DATE_ADDED], [LAST_UPDATED], [UPDATED_BY])
    VALUES (CAST(@tempID AS varchar(10)), @userID, @userID, @userID, 'NM', 'A', 
            @tempAddressNum, @tempAddressNum, @tempAddressNum,
            @now, @now, @now, 'MANAGER')

    INSERT Name_Address (ID, ADDRESS_NUM, PURPOSE, PREFERRED_MAIL, PREFERRED_BILL, PREFERRED_SHIP)
    VALUES (CAST(@tempID AS varchar(10)), @tempAddressNum, 'Address', 1, 1, 1)

    INSERT Name_Security (ID, WEB_LOGIN, PASSWORD)
    VALUES (CAST(@tempID AS varchar(10)), @userID, '')

    INSERT Name_Fin (ID) 
    VALUES (CAST(@tempID AS varchar(10)))
END

--------------------------
-- Create provider entries
--------------------------
DECLARE @applicationKey uniqueidentifier
DECLARE @providerKey uniqueidentifier
DECLARE @beginningOfTime datetime

SET @beginningOfTime = '17540101 00:00:00.000'

SELECT @applicationKey = [ApplicationId] FROM [dbo].[aspnet_Applications] WHERE [ApplicationName] = 'iMIS'
SELECT @providerKey = [UserId] FROM [dbo].[aspnet_Users] WHERE [UserName] = @userID
IF (@providerKey IS NULL)
    SET @providerKey = '5A4AC0B4-C8E1-443E-9CA7-A05AABAFE445'
   

IF NOT EXISTS (SELECT 1 FROM [dbo].[aspnet_Users] WHERE [UserName] = @userID)
    INSERT INTO [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate])
    VALUES (@applicationKey, @providerKey, @userID, LOWER(@userID), NULL, 0, @now)

IF NOT EXISTS (SELECT 1 FROM [dbo].[aspnet_Membership] WHERE [UserId] = @providerKey)
    INSERT INTO [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], 
                                           [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate],
                                           [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart])
    VALUES (@applicationKey, @providerKey, 'tnQvoHO1vEpl3Von8jhG/7tlhx0=', 1, 'dH6mEjQq6q6l+/TqIJekqg==', 
            1, 0, @now, @now, @now, @beginningOfTime, 0, @beginningOfTime, 0, @beginningOfTime)

UPDATE [dbo].[UserMain] 
   SET [ProviderKey] = LOWER(@providerKey)
 WHERE [UserId] = @userID

GO



GO
