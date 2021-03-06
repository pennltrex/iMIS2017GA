
IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_AppealMain_Delete]'))
    DROP TRIGGER [dbo].[asi_AppealMain_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_AppealMain_Delete] 
	ON [dbo].[AppealMain] 
	FOR DELETE 
AS
UPDATE cp1 SET	cp1.TotalRevenue = cp1.TotalRevenue - deleted.TotalRevenue
	FROM CampaignMain cp1 INNER JOIN vBoAppeal ap1 ON cp1.CampaignKey = ap1.CampaignKey 
	                      INNER JOIN deleted ON ap1.AppealKey = deleted.AppealKey

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_AppealMain_Insert_Update]'))
    DROP TRIGGER [dbo].[asi_AppealMain_Insert_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_AppealMain_Insert_Update] 
	ON [dbo].[AppealMain] 
	FOR INSERT, UPDATE 
AS
UPDATE cp1 SET	cp1.TotalRevenue = Coalesce(
		(SELECT	Sum(ap2.TotalRevenue)
		 FROM	CampaignMain cp2
				INNER JOIN vBoAppeal ap2 ON cp2.CampaignKey = ap2.CampaignKey
		 WHERE	cp2.CampaignKey = cp1.CampaignKey), 0)
FROM CampaignMain cp1 INNER JOIN vBoAppeal ap1 ON cp1.CampaignKey = ap1.CampaignKey 
                      INNER JOIN inserted ON ap1.AppealKey = inserted.AppealKey

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_CampaignMain_Delete]'))
    DROP TRIGGER [dbo].[asi_CampaignMain_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_CampaignMain_Delete]
	ON  [dbo].[CampaignMain]
	FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Campaign WHERE CAMPAIGN_CODE IN (SELECT LegacyCampaignCode FROM deleted)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_CampaignMain_Insert]'))
    DROP TRIGGER [dbo].[asi_CampaignMain_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_CampaignMain_Insert]
	ON  [dbo].[CampaignMain]
	FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Campaign (CAMPAIGN_CODE, TITLE, DESCRIPTION, DEFAULT_FUND,
	                      GOAL, BEGINS_DATE, ENDS_DATE, IS_PERPETUAL)
	SELECT [LegacyCampaignCode], [Name], IsNULL([Description],''), '',
           TargetRevenue, StartDate, EndDate, 0 
	FROM inserted
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_CampaignMain_Update]'))
    DROP TRIGGER [dbo].[asi_CampaignMain_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_CampaignMain_Update]
    ON  [dbo].[CampaignMain]
    FOR UPDATE
AS 
BEGIN

    SET NOCOUNT ON;

    UPDATE Campaign
    SET 
        TITLE = i.[Name],
        DESCRIPTION = IsNull(i.Description,''),
        GOAL = i.TargetRevenue,
        BEGINS_DATE = i.StartDate,
        ENDS_DATE = i.EndDate,
        CAMPAIGN_CODE = i.LegacyCampaignCode
    FROM inserted i INNER JOIN deleted d ON i.CampaignKey = d.CampaignKey
    WHERE CAMPAIGN_CODE = d.LegacyCampaignCode

    UPDATE Appeal
    SET CAMPAIGN_CODE = i.LegacyCampaignCode
    FROM inserted i INNER JOIN deleted d ON i.CampaignKey = d.CampaignKey
    WHERE CAMPAIGN_CODE = d.LegacyCampaignCode

END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_CampaignParticipation_Insert]'))
    DROP TRIGGER [dbo].[asi_CampaignParticipation_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_CampaignParticipation_Insert]
	ON  [dbo].[CampaignParticipation]
	FOR INSERT
AS
BEGIN
	SET NOCOUNT ON;
	-- Fail the transaction if any inserted key is not in 
	-- either the ContactMain or Prospect tables
	IF EXISTS(SELECT CampaignParticipationKey from inserted)
	   AND NOT EXISTS(SELECT cm.ContactKey from ContactMain cm INNER JOIN inserted i ON cm.ContactKey=i.RespondentUserKey)
	   AND NOT EXISTS(SELECT p.ProspectKey from Prospect p INNER JOIN inserted i ON p.ProspectKey=i.RespondentUserKey)
	BEGIN
		RAISERROR(N'One or more CampaignParticipation.RespondentUserKeys in being inserted reference neither a ContactKey nor a ProspectKey', 16, 1)
		ROLLBACK TRAN
	END
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_CampaignParticipation_Update]'))
    DROP TRIGGER [dbo].[asi_CampaignParticipation_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_CampaignParticipation_Update]
	ON  [dbo].[CampaignParticipation]
	FOR UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF NOT UPDATE(RespondentUserKey)
	RETURN
	-- Fail the transaction if any inserted key is not in 
	-- either the ContactMain or Prospect tables
	IF NOT EXISTS(SELECT cm.ContactKey from ContactMain cm INNER JOIN inserted i ON cm.ContactKey=i.RespondentUserKey)
	   AND NOT EXISTS(SELECT p.ProspectKey from Prospect p INNER JOIN inserted i ON p.ProspectKey=i.RespondentUserKey)
	BEGIN
		RAISERROR(N'One or more CampaignParticipation.RespondentUserKeys in being inserted reference neither a ContactKey nor a ProspectKey', 16, 1)
		ROLLBACK TRAN
	END
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Content_File_Insert]'))
    DROP TRIGGER [dbo].[asi_Content_File_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =============================================
-- This trigger sets OriginalContentFileID to the ID of the content file inserted.
-- =============================================
CREATE TRIGGER [dbo].[asi_Content_File_Insert]
	ON [dbo].[Content_File]
	FOR INSERT 
AS 
BEGIN
	UPDATE Content_File SET OriginalContentFileID = ContentFileID
	WHERE ContentFileID IN (SELECT ContentFileID FROM inserted
	                        WHERE OriginalContentFileID IS NULL)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Content_Insert]'))
    DROP TRIGGER [dbo].[asi_Content_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =============================================
-- This trigger sets OriginalContentID to the ID of the content inserted.
-- And sets SortOrder for the Content record if not specified.
-- =============================================
CREATE TRIGGER [dbo].[asi_Content_Insert]
	ON [dbo].[Content]
	FOR INSERT 
AS 
BEGIN
	-- Store OriginalContentID
	UPDATE [Content] SET OriginalContentID = ContentID
	WHERE ContentID IN (SELECT ContentID FROM inserted
						WHERE OriginalContentID IS NULL)

	UPDATE [Content] SET SortOrder = (SELECT IsNull(Max(SortOrder),0) + 1 FROM [Content] x
	                                WHERE x.NavMenuID = [Content].NavMenuID)
	WHERE ContentID IN (SELECT ContentID FROM inserted
						WHERE SortOrder IS NULL)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Content_Update]'))
    DROP TRIGGER [dbo].[asi_Content_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- ======================================================================
-- 06/27/2003  E.Tatsui  Trigger on Content table to set frequency in
--                       Publish_Request_Detail table.
-- ======================================================================
CREATE  TRIGGER [dbo].[asi_Content_Update]
	ON [dbo].[Content]
	FOR UPDATE
AS 
BEGIN
	DECLARE
	@ContentID numeric,
	@PublishFrequency int

	IF UPDATE(PublishFrequency) 
	BEGIN
		DECLARE c_Contents CURSOR FOR 
		SELECT a.ContentID, IsNull(a.PublishFrequency,0) FROM inserted a, deleted b
		WHERE a.ContentID = b.ContentID
		   AND IsNull(a.PublishFrequency,0) <> IsNull(b.PublishFrequency,0)
		   AND IsNull(b.PublishFrequency,0) <> 0

		OPEN c_Contents
		FETCH NEXT FROM c_Contents
		INTO @ContentID, @PublishFrequency             

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			IF @PublishFrequency > 0
				UPDATE Publish_Request_Detail
				   SET Frequency = @PublishFrequency * 60 * 60
				 WHERE ContentID = @ContentID
				   AND PublishRegenerateInd = 'P'
				   AND Frequency > 0
			ELSE
				DELETE FROM Publish_Request_Detail
				 WHERE ContentID = @ContentID
				   AND PublishRegenerateInd = 'P'
				   AND Frequency > 0

			FETCH NEXT FROM c_Contents
			INTO @ContentID, @PublishFrequency          
		END
		CLOSE c_Contents
		DEALLOCATE c_Contents
	END
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMain_Update]'))
    DROP TRIGGER [dbo].[asi_DocumentMain_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_DocumentMain_Update] 
	ON [dbo].[DocumentMain] 
	FOR UPDATE 
AS
   UPDATE ComponentRegistry
      SET Name = inserted.DocumentName,
          AssemblyName = REPLACE(inserted.DocumentName, ' ', '') + 'Rules'
     FROM ComponentRegistry INNER JOIN deleted 
       ON ComponentRegistry.Name = deleted.DocumentName AND ComponentRegistry.TypeName = 'Asi.Business.BusinessItem'
          INNER JOIN inserted ON inserted.DocumentKey = deleted.DocumentKey
    WHERE inserted.DocumentTypeCode = 'BOD'

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_ExternalNetwork_Insert_Update_Delete]'))
    DROP TRIGGER [dbo].[asi_ExternalNetwork_Insert_Update_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_ExternalNetwork_Insert_Update_Delete]
   ON  [dbo].[ExternalNetwork]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @nl CHAR(2);
	SET @nl = CHAR(13) + CHAR(10);
	DECLARE @sql VARCHAR(MAX);
	DECLARE @externalNetworkId uniqueidentifier;
	
	SET @sql = 'IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N''[dbo].[vIndividualExternalNetworkLogin]''))' + @nl;
    SET @sql = @sql + 'DROP VIEW [dbo].[vIndividualExternalNetworkLogin]'
    EXECUTE (@sql);
    
    SET @sql = 'CREATE VIEW [dbo].[vIndividualExternalNetworkLogin]' + @nl;
    SET @sql = @sql + 'AS' + @nl;
    SET @sql = @sql + 'SELECT [dbo].[Name].[ID] ';
    SELECT @sql = @sql + ', (SELECT REPLACE(LoginName,'''''''','''''''''''') FROM [dbo].[IndividualExternalNetwork] WHERE [ExternalNetworkId] = ''' + CONVERT(VARCHAR(50), [ExternalNetworkId]) + '''  AND [ID] = [dbo].[Name].[ID]) AS ' + [Name] + '_Login' + @nl
      FROM [dbo].[ExternalNetwork]    
    SET @sql = @sql + 'FROM [dbo].[Name]'	
    EXECUTE (@sql);

	SET @sql = 'CREATE TRIGGER asi_vIndividualExternalNetworkLogin ON vIndividualExternalNetworkLogin' + @nl;
    SET @sql = @sql + 'INSTEAD OF INSERT, UPDATE' + @nl;
    SET @sql = @sql + 'AS' + @nl;
    SET @sql = @sql + 'BEGIN' + @nl;
    SET @sql = @sql + 'SET NOCOUNT ON' + @nl;
    SET @sql = @sql + 'DECLARE @externalNetworkId uniqueidentifier' + @nl + @nl;
    SELECT @sql = @sql + 'SET @externalNetworkId = ''' + CONVERT(VARCHAR(50),[ExternalNetworkId]) + ''' -- ' + REPLACE([Name],' ','_') + @nl +
                        'UPDATE IndividualExternalNetwork ' + @nl +
                        '   SET ExternalNetworkId = @externalNetworkId, '+ @nl +
                        '       [LoginName] = i.' + REPLACE([Name],' ','_') + '_Login' + @nl +
                        '  FROM inserted i' + @nl +
                        ' WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID ' + @nl +
                        '   AND i.' + REPLACE([Name],' ','_') + '_Login IS NOT NULL AND i.' + REPLACE([Name],' ','_') + '_Login != ''''' + @nl +
                        'INSERT INTO IndividualExternalNetwork (ExternalNetworkId, ID, LoginName)' + @nl +
                        'SELECT @externalNetworkId, i.ID, i.' + REPLACE([Name],' ','_') + '_Login' + @nl +
                        '  FROM inserted i' + @nl +
                        ' WHERE NOT EXISTS (SELECT 1 FROM IndividualExternalNetwork n WHERE n.ExternalNetworkId = @externalNetworkId AND i.ID = n.ID)' + @nl +
                        '   AND i.' + REPLACE([Name],' ','_') + '_Login IS NOT NULL AND i.' + REPLACE([Name],' ','_') + '_Login != ''''' + @nl +
                        'DELETE IndividualExternalNetwork' + @nl +
                        '  FROM inserted i' + @nl +
                        ' WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID' + @nl +
                        '   AND (i.' + REPLACE([Name],' ','_') + '_Login IS NULL OR i.' + REPLACE([Name],' ','_') + '_Login = '''')    ' + @nl 
                        FROM [dbo].[ExternalNetwork]
    SET @sql = @sql + 'END' + @nl;                        
    EXECUTE (@sql)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_MemberTypes_Delete]'))
    DROP TRIGGER [dbo].[asi_MemberTypes_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_MemberTypes_Delete]
   ON  [dbo].[Member_Types] 
   FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    DECLARE @groups TABLE ([GroupKey] uniqueidentifier, [Name] nvarchar(65), [Description] nvarchar(250))
    DECLARE @groupTypeKey uniqueidentifier
    SET @groupTypeKey = '636A1E55-38BC-4A8F-AC8D-A6873D697F18'
    
    INSERT INTO @groups ([GroupKey], [Name], [Description])
        SELECT COALESCE(gm.[GroupKey], NEWID()), mt.[DESCRIPTION], NULL
          FROM deleted mt LEFT OUTER JOIN [dbo].[GroupMain] gm ON gm.[Name] = mt.[DESCRIPTION] AND gm.[GroupTypeKey] = @groupTypeKey
    DELETE m 
      FROM [dbo].[GroupMember] m INNER JOIN @groups g ON m.[GroupKey] = g.[GroupKey]
    DELETE gm
      FROM [dbo].[GroupMain] gm INNER JOIN @groups g ON gm.[GroupKey] = g.[GroupKey]
    DELETE ur
      FROM [dbo].[UniformRegistry] ur INNER JOIN @groups g ON ur.[UniformKey] = g.[GroupKey]
    SET NOCOUNT OFF
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_MemberTypes_Insert]'))
    DROP TRIGGER [dbo].[asi_MemberTypes_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_MemberTypes_Insert]
   ON  [dbo].[Member_Types] 
   FOR INSERT
AS 
BEGIN
    SET NOCOUNT ON
    DECLARE @now datetime
    DECLARE @userKey uniqueidentifier
    DECLARE @accessKey uniqueidentifier
    DECLARE @groupTypeKey uniqueidentifier
    DECLARE @systemEntityKey uniqueidentifier
    DECLARE @groupComponentKey uniqueidentifier
    DECLARE @groups TABLE ([GroupKey] uniqueidentifier, [Name] nvarchar(65), [Description] nvarchar(250))

    SELECT @now = GETDATE()
    SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM'
    IF @userKey IS NULL SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @accessKey = [ProtectedAccessKey] FROM [dbo].[AccessArea] WHERE [Name] = 'Everyone Full Control'
    SET @groupTypeKey = '636A1E55-38BC-4A8F-AC8D-A6873D697F18'
    SELECT @systemEntityKey = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'
    SELECT @groupComponentKey = [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'Group' AND [InterfaceName] = 'BusinessController'

    -- Create a new Member Type Security group for each member type being inserted
    INSERT INTO @groups ([GroupKey], [Name], [Description])
        SELECT COALESCE(gm.[GroupKey], NEWID()), mt.[DESCRIPTION], 'Security Group for ' + mt.[DESCRIPTION] + ' users'
          FROM inserted mt LEFT OUTER JOIN [dbo].[GroupMain] gm ON gm.[Name] = mt.[DESCRIPTION]

    INSERT INTO [dbo].[UniformRegistry] ([UniformKey], [ComponentKey])
        SELECT g.[GroupKey], @groupComponentKey 
          FROM @groups g LEFT OUTER JOIN [dbo].[UniformRegistry] ur ON ur.[UniformKey] = g.[GroupKey] AND ur.[ComponentKey] = @groupComponentKey
         WHERE  ur.[UniformKey] IS NULL

    INSERT INTO [dbo].[GroupMain] ([GroupKey], [Name], [Description], [UpdatedByUserKey], [UpdatedOn], [IsSystem], [IsAutoGenerated], 
                                   [GroupTypeKey], [Priority], [OwnerAccessKey], [OverrideOwnerGroupKey], [AccessKey], 
                                   [CreatedByUserKey], [CreatedOn], [SystemEntityKey],
                                   [IsInvitationOnly], [GroupStatusCode], [IsSimpleGroup], [InheritRolesFlag], [IsSingleRole])
        SELECT g.[GroupKey], g.[Name], g.[Description], @userKey, @now, 1, 1,
               @groupTypeKey, NULL, NULL, NULL, @accessKey, @userKey, @now, @systemEntityKey, 0, 'A', 1, 0, 0
          FROM @groups g
         WHERE NOT EXISTS (SELECT 1 FROM [dbo].[GroupMain] gm WHERE g.[Name] = gm.[Name] AND gm.[GroupTypeKey] = @groupTypeKey)


    -- Populate the new Security Groups
    INSERT INTO [dbo].[GroupMember] ([GroupMemberKey], [GroupKey], [MemberContactKey], [IsActive],
                                     [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                     [DropDate], [JoinDate], [MarkedForDeleteOn])
        SELECT NEWID(), g.[GroupKey], cm.[ContactKey], 1, @userKey, @now, @userKey, @now, NULL, NULL, NULL  
          FROM [dbo].[Name] n INNER JOIN inserted mt ON n.[MEMBER_TYPE] = mt.[MEMBER_TYPE]
                              INNER JOIN [dbo].[ContactMain] cm ON n.[ID] = cm.[SyncContactID]
                              INNER JOIN [dbo].[UserMain] um ON um.[UserKey] = cm.[ContactKey]
                              INNER JOIN [dbo].[GroupMain] g ON g.[Name] = mt.[DESCRIPTION]
         WHERE NOT EXISTS (SELECT 1 FROM [dbo].[GroupMember] gm WHERE gm.[GroupKey] = g.[GroupKey] AND gm.[MemberContactKey] = um.UserKey)
    SET NOCOUNT OFF
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_MemberTypes_Update]'))
    DROP TRIGGER [dbo].[asi_MemberTypes_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_MemberTypes_Update]
   ON  [dbo].[Member_Types] 
   FOR UPDATE
AS 
BEGIN
    SET NOCOUNT ON
    DECLARE @groupTypeKey uniqueidentifier
    SET @groupTypeKey = '636A1E55-38BC-4A8F-AC8D-A6873D697F18'
    
    -- Synchronize group name with member type description
    UPDATE g
       SET g.[Name] = i.[DESCRIPTION]
      FROM [dbo].[GroupMain] g INNER JOIN deleted d ON g.[Name] = d.[DESCRIPTION] AND g.[GroupTypeKey] = @groupTypeKey
                               INNER JOIN inserted i ON d.[MEMBER_TYPE] = i.[MEMBER_TYPE]
     WHERE g.[Name] = d.[DESCRIPTION] AND g.[GroupTypeKey] = @groupTypeKey
     
    SET NOCOUNT OFF
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_Delete]'))
    DROP TRIGGER [dbo].[asi_Name_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Name_Delete]
   ON  [dbo].[Name] 
   FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON

	DECLARE @entityKey uniqueidentifier
	DECLARE @defaultOrganizationKey uniqueidentifier
    DECLARE @adminUserKey uniqueidentifier
    DECLARE @now datetime

	SELECT @entityKey = SystemEntityKey FROM SystemEntity WHERE SystemKeyword = 'Organization'
	SELECT @defaultOrganizationKey = OrganizationKey FROM OrganizationMain WHERE IsDefault = 1
	SELECT @adminUserKey = ParameterValue from SystemConfig 
		WHERE ParameterName = 'Security.Token.AdministratorUserKey'
			and SystemEntityKey = @entityKey and OrganizationKey = @defaultOrganizationKey
    SET @now = getdate()

    -- Mark any associatd 'User' record as disabled
    UPDATE um
       SET [IsDisabled] = 1,
       um.[ContactMaster] = '',
       um.[UserId] = ''
      FROM deleted d INNER JOIN [dbo].[ContactMain] cm ON d.[ID] = cm.[SyncContactID]
                     INNER JOIN [dbo].[UserMain] um ON cm.[ContactKey] = um.[UserKey]

    -- Mark associated Contact as deleted
    UPDATE [ContactMain]
    SET [ContactStatusCode] = cs.[ContactStatusCode],
        [UpdatedByUserKey] = @adminUserKey,
        [UpdatedOn] = @now,
        [SyncContactID] = NULL  -- Have to remove SyncContactID since C/S can reuse IDs
    FROM deleted d INNER JOIN [ContactStatusRef] cs ON cs.[ContactStatusDesc] = 'Delete' AND cs.[IsSystem] = 1
    WHERE [ContactMain].[SyncContactID] = d.ID

	SET NOCOUNT OFF
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_Insert_Update]'))
    DROP TRIGGER [dbo].[asi_Name_Insert_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE TRIGGER [dbo].[asi_Name_Insert_Update]
   ON  [dbo].[Name] 
   FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON
    
    -- Maintain aspnet_membership.Email (and LoweredEmail) with Name.EMAIL --
    IF EXISTS(SELECT 1 FROM inserted i INNER JOIN deleted d ON i.ID = d.ID INNER JOIN UserMain u ON u.ContactMaster = i.ID WHERE i.EMAIL <> d.EMAIL)
    BEGIN
        UPDATE a
           SET a.Email = i.EMAIL,
               a.LoweredEmail = LOWER(i.EMAIL)
          FROM inserted i
               INNER JOIN deleted d ON i.ID = d.ID
               INNER JOIN UserMain u ON u.ContactMaster = i.ID
               INNER JOIN aspnet_Membership a ON CAST(a.UserId as nvarchar(200)) = u.ProviderKey
         WHERE i.EMAIL <> d.EMAIL
    END
    
    -- Bail out if nothing to do
    IF NOT EXISTS (SELECT 1 
                     FROM inserted i 
                          LEFT OUTER JOIN deleted d ON i.ID = d.ID
                          LEFT OUTER JOIN ContactMain c ON i.ID = c.SyncContactID
                    WHERE i.[LAST_FIRST] <> d.[LAST_FIRST] OR i.[COMPANY_RECORD] <> d.[COMPANY_RECORD] OR
                          i.[COMPANY] <> d.[COMPANY] OR i.[PREFIX] <> d.[PREFIX] OR
                          i.[SUFFIX] <> d.[SUFFIX] OR i.[BIRTH_DATE] <> d.[BIRTH_DATE] OR
                          i.[STATUS] <> d.[STATUS] OR i.[EXCLUDE_MAIL] <> d.[EXCLUDE_MAIL] OR
                          i.[FIRST_NAME] <> d.[FIRST_NAME] OR i.[MIDDLE_NAME] <> d.[MIDDLE_NAME] OR
                          i.[LAST_NAME] <> d.[LAST_NAME] OR i.[FULL_NAME] <> d.[FULL_NAME] OR
                          i.[DESIGNATION] <> d.[DESIGNATION] OR
                          i.[INFORMAL] <> d.[INFORMAL] OR i.[GENDER] <> d.[GENDER] OR
                          i.[MEMBER_TYPE] <> d.[MEMBER_TYPE] OR i.[CO_ID] <> d.[CO_ID] OR
                          d.[ID] IS NULL OR c.SyncContactID IS NULL
                   ) AND (SELECT COUNT(1) FROM inserted) > 0
    BEGIN
        RETURN
    END

    DECLARE @defaultOrganizationKey uniqueidentifier
    DECLARE @adminUserKey uniqueidentifier
    DECLARE @adminRoleKey uniqueidentifier
    DECLARE @everyoneRoleKey uniqueidentifier
    DECLARE @instituteTypeKey uniqueidentifier
    DECLARE @groupTypeKey uniqueidentifier
    DECLARE @individualTypeKey uniqueidentifier
    DECLARE @systemEntityKey uniqueidentifier
    DECLARE @primaryGroupRoleKey uniqueidentifier
    DECLARE @primaryDefaultMemberStatusCode nvarchar(4)
    DECLARE @groupRoleKey uniqueidentifier
    DECLARE @defaultMemberStatusCode nvarchar(4)
    DECLARE @now datetime
    DECLARE @createdByUserKey uniqueidentifier
    DECLARE @updatedByUserId varchar(60)

    -- Get some constant values we need
    SELECT @defaultOrganizationKey = OrganizationKey FROM [dbo].[OrganizationMain] WHERE IsDefault = 1

    SELECT @systemEntityKey = SystemEntityKey FROM [dbo].[SystemEntity]
     WHERE IsDefault = 1 AND SystemKeyword = N'Organization'   

    SELECT @adminUserKey = ParameterValue FROM [dbo].[SystemConfig] 
     WHERE ParameterName = N'Security.Token.AdministratorUserKey'
       and SystemEntityKey = @systemEntityKey and OrganizationKey = @defaultOrganizationKey

    SELECT @adminRoleKey = ParameterValue FROM [dbo].[SystemConfig] 
     WHERE ParameterName = N'Security.Token.AdministratorsRoleKey'

    SELECT @everyoneRoleKey = ParameterValue FROM [dbo].[SystemConfig] 
     WHERE ParameterName = N'Security.Token.EveryoneRoleKey'

    SELECT @instituteTypeKey = ContactTypeKey, 
           @groupTypeKey = GroupTypeKey 
      FROM [dbo].[ContactTypeRef]
     WHERE ContactTypeDesc = N'Company'

    SELECT @individualTypeKey = ContactTypeKey FROM [dbo].[ContactTypeRef] 
     WHERE IsInstitute = 0

    SELECT @primaryGroupRoleKey = a.GroupRoleKey, 
           @primaryDefaultMemberStatusCode = a.DefaultMemberStatusCode
      FROM [dbo].[GroupTypeRole] a 
           INNER JOIN [dbo].[GroupRoleRef] b ON a.GroupRoleKey = b.GroupRoleKey
     WHERE b.GroupRoleDesc = N'Primary Contact' 
       AND a.IsSystem = 1
 
    SELECT @groupRoleKey = GroupRoleKey, 
           @defaultMemberStatusCode = DefaultMemberStatusCode
      FROM [dbo].[GroupTypeRole] 
     WHERE GroupTypeKey = @groupTypeKey
       AND IsDefault = 1

    SET	@now = GETDATE()

    -- Get createdBy/updatedBy user key
    SELECT @updatedByUserId = MIN(REPLACE(UPDATED_BY, '-IBO', '')) FROM inserted WHERE LEN(REPLACE(UPDATED_BY, '-IBO', '')) > 0

    SELECT @createdByUserKey = UserKey
      FROM [dbo].[UserMain]
     WHERE UserId = @updatedByUserId

    SET @createdByUserKey = ISNULL(@createdByUserKey, @adminUserKey)

    -- make sure any reference data used is in the ref tables
    DECLARE @Prefixes TABLE (Prefix nvarchar(25))

    INSERT INTO @Prefixes
    SELECT DISTINCT CAST(a.PREFIX AS nvarchar(25))
      FROM inserted a 
           LEFT OUTER JOIN PrefixRef b ON CAST(a.PREFIX AS nvarchar(25)) = b.PrefixCode
     WHERE b.PrefixCode IS NULL

    INSERT INTO PrefixRef (PrefixCode, PrefixDesc, SyncPrefixCode, PrefixKey)
    SELECT Prefix, Prefix, Prefix, NEWID()
      FROM @Prefixes

    DECLARE @Suffixes TABLE (Suffix varchar(10))

    INSERT INTO @Suffixes
    SELECT DISTINCT a.SUFFIX
      FROM inserted a 
           LEFT OUTER JOIN SuffixRef b ON a.SUFFIX = b.SuffixCode
     WHERE b.SuffixCode IS NULL

    INSERT INTO SuffixRef (SuffixCode, SuffixDesc, SyncSuffixCode, SuffixKey)
    SELECT Suffix, Suffix, Suffix, NEWID()
      FROM @Suffixes

    -- create the temp table variables we'll be using
    DECLARE @UpdateIDs TABLE (ID varchar(10), ContactKey uniqueidentifier, PRIMARY KEY (ID, ContactKey))

    DECLARE @InsertKeyMap TABLE (
        ID varchar(10), 
        IsInstitute bit, 
        ContactKey uniqueidentifier, 
        GroupKey uniqueidentifier, 
        OwnerAccessKey uniqueidentifier, 
        GroupMemberKey uniqueidentifier,
        IsPrimary bit,
        PRIMARY KEY (ID, IsInstitute),
        UNIQUE(ContactKey) )

    -- Before we do anything else, handle any Member Type changes by updating the Member Type Groups accordingly
    IF EXISTS (SELECT 1 FROM inserted i INNER JOIN deleted d on i.[ID] = d.[ID] WHERE i.[MEMBER_TYPE] <> d.[MEMBER_TYPE])
    BEGIN
        -- remove from deleted member type security group
        DELETE gm
          FROM inserted i 
               INNER JOIN deleted d ON i.[ID] = d.[ID]
               INNER JOIN [dbo].[ContactMain] cm ON d.ID = cm.SyncContactID
               INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = d.[MEMBER_TYPE]
               INNER JOIN [dbo].[GroupTypeRef] gt ON gt.[GroupTypeName] = N'Member Type Security'
               INNER JOIN [dbo].[GroupMain] g ON g.[GroupTypeKey] = gt.[GroupTypeKey] AND g.[Name] = mt.[DESCRIPTION]
               INNER JOIN [dbo].[GroupMember] gm ON gm.[MemberContactKey] = cm.ContactKey 
         WHERE i.[MEMBER_TYPE] <> d.[MEMBER_TYPE] AND gm.[GroupKey] = g.[GroupKey]
 
        -- add to inserted member type security group
        INSERT INTO [dbo].[GroupMember] ([GroupMemberKey], [GroupKey], [MemberContactKey], [IsActive],
                                         [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                         [DropDate], [JoinDate], [MarkedForDeleteOn])
            SELECT NEWID(), g.GroupKey, u.UserKey, 1, @adminUserKey, @now, @adminUserKey, @now, NULL, NULL, NULL  
              FROM inserted i 
                   INNER JOIN deleted d ON i.[ID] = d.[ID]
                   INNER JOIN [dbo].[ContactMain] cm ON i.[ID] = cm.[SyncContactID]
                   INNER JOIN [dbo].[UserMain] u ON u.[UserKey] = cm.[ContactKey]
                   INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = i.[MEMBER_TYPE]
                   INNER JOIN [dbo].[GroupTypeRef] gt ON gt.[GroupTypeName] = N'Member Type Security'
                   INNER JOIN [dbo].[GroupMain] g ON g.[GroupTypeKey] = gt.[GroupTypeKey] AND g.[Name] = mt.[DESCRIPTION]
             WHERE i.[MEMBER_TYPE] <> d.[MEMBER_TYPE]
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[GroupMember] gm WHERE gm.[GroupKey] = g.[GroupKey] AND gm.[MemberContactKey] = cm.[ContactKey])
    END

    -- create the list of contacts to be updated (i.e., they exist in ContactMain already)
    INSERT INTO @UpdateIDs (ID, ContactKey)
    SELECT a.ID, b.ContactKey
      FROM inserted a 
           INNER JOIN [dbo].[ContactMain] b ON a.ID = b.ID
	 WHERE b.IsInstitute = 1

    INSERT INTO @UpdateIDs (ID, ContactKey)
    SELECT a.ID, b.ContactKey
      FROM inserted a 
           INNER JOIN [dbo].[ContactMain] b ON a.ID = b.ID
		   LEFT OUTER JOIN @UpdateIDs c ON a.ID = c.ID
	 WHERE b.IsInstitute = 0
	       AND c.ID IS NULL

	-- if the record is changing from Individual to Insititute and LAST_FIRST is not set
	-- 1. Change the UniformType in UniformRegistry
	-- 2. Change the IsInstitute flag and ContactTypeKey in ContactMain
	-- 3. Delete the individual record
	-- 4. Delete the Salutations for the individual
	-- 5. Add the institute record, group, access, salutations, etc
	UPDATE a
	   SET ComponentKey = b.ComponentKey 
      FROM UniformRegistry a
	       INNER JOIN ContactMain c ON a.UniformKey = c.ContactKey
		   INNER JOIN inserted d ON c.ID = d.ID
		   INNER JOIN deleted e ON c.ID = e.ID
		   LEFT OUTER JOIN Institute f ON c.ContactKey = f.ContactKey, ComponentRegistry b
     WHERE b.Name = N'Institute' 
           AND b.InterfaceName = N'BusinessController'
	       AND f.ContactKey IS NULL
	       AND ISNULL(d.LAST_FIRST, '') = ''	

	-- step 2
	UPDATE a
	   SET IsInstitute = 1, ContactTypeKey = @instituteTypeKey
	  FROM ContactMain a 
	       INNER JOIN inserted b ON a.ID = b.ID
		   INNER JOIN deleted c ON a.ID = c.ID
		   LEFT OUTER JOIN Institute d ON a.ContactKey = d.ContactKey
	 WHERE d.ContactKey IS NULL
	       AND ISNULL(b.LAST_FIRST, '') = ''	

	-- step 3
	DELETE a
	  FROM Individual a 
	       INNER JOIN ContactMain b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
		   INNER JOIN deleted d ON b.ID = d.ID
		   LEFT OUTER JOIN Institute e ON a.ContactKey = e.ContactKey
	 WHERE e.ContactKey IS NULL
	   AND ISNULL(c.LAST_FIRST, '') = ''	

	-- step 4
	DELETE a
	  FROM ContactSalutation a 
	       INNER JOIN ContactMain b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
		   INNER JOIN deleted d ON b.ID = d.ID
		   LEFT OUTER JOIN Institute e ON b.ContactKey = e.ContactKey
	 WHERE e.ContactKey IS NULL
	   AND ISNULL(c.LAST_FIRST, '') = ''	

	-- step 5
    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT b.ID, 1, a.ContactKey, newid(), newid(), newid(), 0
	  FROM [dbo].[ContactMain] a 
	       INNER JOIN inserted b ON a.ID = b.ID
		   INNER JOIN deleted c ON a.ID = c.ID
		   LEFT OUTER JOIN Institute d ON a.ContactKey = d.ContactKey
	 WHERE ISNULL(b.LAST_FIRST, '') = ''	
	   AND d.ContactKey IS NULL

	-- if the record is changing from Individual to Insititute, but still have first and last name, we have to:
	-- 1. Create a new Institute record with all the security and group stuff
	-- 2. Change the existing Individual record to have a P in the front of the ID
	-- 3. Add the old individual record to the new Institute group as the primary contact (this is at the end of the trigger)
    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT b.ID, 1, newid(), newid(), newid(), newid(), 0
	  FROM [dbo].[ContactMain] a 
	       INNER JOIN inserted b ON a.ID = b.ID
	 WHERE b.COMPANY_RECORD = 1
	       AND a.IsInstitute = 0
	       AND ISNULL(b.LAST_FIRST, '') <> ''

	-- step 2
	UPDATE a
	   SET ID = N'P' + CAST(a.ID AS nvarchar(10))
	  FROM [dbo].[ContactMain] a 
	       INNER JOIN inserted b ON a.ID = CAST(b.ID AS nvarchar(10))
	 WHERE b.COMPANY_RECORD = 1
	      AND a.IsInstitute = 0
	      AND ISNULL(b.LAST_FIRST, '') <> ''	

	-- If first and last name is being added to an existing Company record
	-- 1. Create a new Individual record, using P + ID
	-- 2. Make the individual the primary contact for the company

    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT a.ID, 0, newid(), null, null, newid(), 1
      FROM inserted a 
           LEFT OUTER JOIN [dbo].[ContactMain] b ON a.ID = b.SyncContactID AND a.COMPANY_RECORD = 1 AND b.IsInstitute = 0
           INNER JOIN deleted c ON a.ID = c.ID
     WHERE b.SyncContactID IS NULL
           AND ISNULL(a.LAST_FIRST, '') <> ''
           AND ISNULL(c.LAST_FIRST, '') = ''
           AND a.COMPANY_RECORD = 1
           AND c.COMPANY_RECORD = 1

	-- If a Company record is changed to an Individual record
	-- 1. Change the UniformType in UniformRegistry
	-- 2. Delete the Group, GroupMember, GroupMemberDetail, Access stuff, and old salutations
	-- 3. Delete the institute record
	-- 4. Delete the P style Individual record, and all of its stuff, if one exists
	-- 5. Add the individual record, salutations,etc.
	-- 6. Change the IsInstitute flag and ContactTypeKey in ContactMain
	UPDATE a
	   SET ComponentKey = b.ComponentKey 
      FROM [dbo].[UniformRegistry] a
	       INNER JOIN [dbo].[ContactMain] c ON a.UniformKey = c.ContactKey
		   INNER JOIN inserted d ON c.ID = d.ID, [dbo].[ComponentRegistry] b
     WHERE b.Name = N'Individual' 
           AND b.InterfaceName = N'BusinessController'
	       AND d.COMPANY_RECORD = 0
	       AND c.IsInstitute = 1
           AND ISNULL(d.LAST_FIRST, '') <> ''

	-- step 2
	-- delete the institute's group's Access records
	DECLARE @DeleteAccessKey TABLE (AccessKey uniqueidentifier)
	INSERT INTO @DeleteAccessKey
	SELECT e.OwnerAccessKey
	  FROM Institute a 
	       INNER JOIN [dbo].[ContactMain] b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
		   INNER JOIN [dbo].[GroupMain] e ON a.InstituteGroupKey = e.GroupKey
		   INNER JOIN [dbo].[AccessMain] m ON e.OwnerAccessKey = m.AccessKey
	 WHERE c.COMPANY_RECORD = 0
	       AND b.IsInstitute = 1
           AND ISNULL(c.LAST_FIRST, '') <> ''
           AND m.AccessScope = 'Local'

	DECLARE @DeleteGroups TABLE (GroupKey uniqueidentifier)
	INSERT INTO @DeleteGroups
	    SELECT a.InstituteGroupKey
	      FROM [dbo].[Institute] a 
	           INNER JOIN [dbo].[ContactMain] b ON a.ContactKey = b.ContactKey
		       INNER JOIN inserted c ON b.ID = c.ID
	     WHERE c.COMPANY_RECORD = 0
	           AND b.IsInstitute = 1
               AND ISNULL(c.LAST_FIRST, '') <> ''

	-- delete the institute's group member details
	DELETE a
	  FROM [dbo].[GroupMemberDetail] a 
	       INNER JOIN [dbo].[GroupMember] b ON a.GroupMemberKey = b.GroupMemberKey
		   INNER JOIN @DeleteGroups c ON b.GroupKey = c.GroupKey

	-- delete the institute's group members
	DELETE a
	  FROM [dbo].[GroupMember] a 
	       INNER JOIN @DeleteGroups b ON a.GroupKey = b.GroupKey

	-- delete the institute's salutations
	DELETE a
	  FROM [dbo].[ContactSalutation] a 
	       INNER JOIN [dbo].[ContactMain] b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
	 WHERE c.COMPANY_RECORD = 0
	       AND b.IsInstitute = 1
           AND ISNULL(c.LAST_FIRST, '') <> ''

	-- step 3
	UPDATE e
	   SET PrimaryInstituteContactKey = NULL
	  FROM [dbo].[Institute] a 
	       INNER JOIN [dbo].[ContactMain] b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
		   INNER JOIN deleted d ON b.ID = d.ID
		   INNER JOIN [dbo].[Individual] e ON e.PrimaryInstituteContactKey = a.ContactKey
	 WHERE c.COMPANY_RECORD = 0
	       AND b.IsInstitute = 1
           AND ISNULL(c.LAST_FIRST, '') <> ''

	DELETE a
	  FROM [dbo].[Institute] a 
	       INNER JOIN [dbo].[ContactMain] b ON a.ContactKey = b.ContactKey
		   INNER JOIN inserted c ON b.ID = c.ID
		   INNER JOIN deleted d ON b.ID = d.ID
	 WHERE c.COMPANY_RECORD = 0
	       AND b.IsInstitute = 1
           AND ISNULL(c.LAST_FIRST, '') <> ''

	-- now, delete the groups and the security
	UPDATE a
	   SET GroupKey = NULL
	  FROM [dbo].[AccessItem] a 
	       INNER JOIN @DeleteGroups b ON a.GroupKey = b.GroupKey

	DELETE a
	  FROM [dbo].[GroupMain] a 
	       INNER JOIN @DeleteGroups b ON a.GroupKey = b.GroupKey

	DELETE a
	  FROM [dbo].[UniformRegistry] a 
	       INNER JOIN @DeleteGroups b ON a.UniformKey = b.GroupKey

	DELETE a
	  FROM AccessItem a 
	       INNER JOIN @DeleteAccessKey b ON a.AccessKey = b.AccessKey

	DELETE a
	  FROM AccessMain a 
	       INNER JOIN @DeleteAccessKey b ON a.AccessKey = b.AccessKey

	-- step 4
    UPDATE a
       SET ContactStatusCode = d.ContactStatusCode,
           UpdatedByUserKey = @adminUserKey,
           UpdatedOn = @now,
           SyncContactID = NULL,  -- Have to remove SyncContactID and ID since C/S can reuse IDs
   	  	   ID = NULL
	  FROM [dbo].[ContactMain] a 
		   INNER JOIN inserted b ON a.SyncContactID = b.ID AND a.ID <> b.ID
		   INNER JOIN [dbo].[ContactStatusRef] d ON d.ContactStatusDesc = N'Delete' AND d.IsSystem = 1
	 WHERE b.COMPANY_RECORD = 0
	   AND a.IsInstitute = 1
       AND ISNULL(b.LAST_FIRST, '') <> ''

	-- step 5
    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT b.ID, 0, a.ContactKey, newid(), newid(), newid(), 0
	  FROM [dbo].[ContactMain] a 
	       INNER JOIN inserted b ON a.ID = b.ID
		   INNER JOIN deleted c ON a.ID = c.ID
	 WHERE b.COMPANY_RECORD = 0
	   AND a.IsInstitute = 1
       AND ISNULL(b.LAST_FIRST, '') <> ''

	-- step 6
	UPDATE a
	   SET IsInstitute = 0, ContactTypeKey = @individualTypeKey
	  FROM [dbo].[ContactMain] a 
	       INNER JOIN inserted b ON a.ID = b.ID
	 WHERE b.COMPANY_RECORD = 0
	   AND a.IsInstitute = 1
       AND ISNULL(b.LAST_FIRST, '') <> ''

	-- If the first and last name are removed from an existing Company record
	-- 1. Set the PrimaryContact on the Institute to null
	-- 2. Delete the Individual, Salutations, GroupMember, and GroupMemberDetail records for the Individual
	-- 3. Mark the ContactMain for the individual for delete
	UPDATE d
	   SET PrimaryContactKey = NULL
      FROM ContactMain a 
           INNER JOIN inserted b ON a.SyncContactID = b.ID
	       INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN [dbo].[Institute] d ON a.ContactKey = d.ContactKey
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 1
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

	DELETE e
      FROM ContactMain a 
           INNER JOIN inserted b ON a.SyncContactID = b.ID
	       INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN [dbo].[GroupMember] d ON a.ContactKey = d.MemberContactKey
		   INNER JOIN [dbo].[GroupMemberDetail] e ON d.GroupMemberKey = e.GroupMemberKey
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 0
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

	DELETE d
      FROM [dbo].[ContactMain] a 
           INNER JOIN inserted b ON a.SyncContactID = b.ID
	       INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN [dbo].[GroupMember] d ON a.ContactKey = d.MemberContactKey
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 0
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

	DELETE d
      FROM [dbo].[ContactMain] a 
           INNER JOIN inserted b ON a.SyncContactID = b.ID
	       INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN Individual d ON a.ContactKey = d.ContactKey
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 0
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

	DELETE d
      FROM [dbo].[ContactMain] a 
           INNER JOIN inserted b ON a.SyncContactID = b.ID
	       INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN [dbo].[ContactSalutation] d ON a.ContactKey = d.ContactKey
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 0
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

    UPDATE a
       SET ContactStatusCode = d.ContactStatusCode,
           UpdatedByUserKey = @adminUserKey,
           UpdatedOn = @now,
           SyncContactID = NULL,  -- Have to remove SyncContactID and ID since C/S can reuse IDs
   	  	   ID = NULL
       FROM [dbo].[ContactMain] a 
            INNER JOIN inserted b ON a.SyncContactID = b.ID
		    INNER JOIN deleted c ON a.SyncContactID = c.ID
		    INNER JOIN [dbo].[ContactStatusRef] d ON d.ContactStatusDesc = N'Delete' AND d.IsSystem = 1
	 WHERE b.COMPANY_RECORD = 1
	   AND c.COMPANY_RECORD = 1
	   AND a.IsInstitute = 0
       AND ISNULL(b.LAST_FIRST, '') = ''
       AND ISNULL(c.LAST_FIRST, '') <> ''

    /******************* This section for INSERTING into the .NET tables ***********************/

    -- create the keys to use for inserting the contacts, groups, etc. for records that don't already exist in ContactMain
    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT a.ID, a.COMPANY_RECORD, ISNULL(c.UserKey, newid()), newid(), newid(), newid(), 0
      FROM inserted a 
           LEFT OUTER JOIN ContactMain b ON a.ID = b.SyncContactID --AND a.COMPANY_RECORD = b.IsInstitute
           LEFT OUTER JOIN UserMain c ON a.ID = c.ContactMaster
     WHERE b.SyncContactID IS NULL
     
    -- fix up the problem records where a contact record is actually a company.  i.e., it has a company name
    -- but no contact name yet is marked as a contact rather than a company
    UPDATE a
       SET a.IsInstitute = 1
      FROM @InsertKeyMap a 
           INNER JOIN inserted b ON a.ID = b.ID
     WHERE b.COMPANY_RECORD = 0
       AND LTRIM(RTRIM(ISNULL(b.LAST_FIRST, ''))) = ''
       AND LTRIM(RTRIM(ISNULL(b.COMPANY, ''))) <> ''

    -- then add in additional rows where the Name record represents both a company AND a contact
    -- Also - added a check to not build the extra contact if there is already a contact with the same name
    -- attached to the company.  Not the best solution, but then we don't have great data in this case.
    INSERT INTO @InsertKeyMap (ID, IsInstitute, ContactKey, GroupKey, OwnerAccessKey, GroupMemberKey, IsPrimary)
    SELECT a.ID, 0, newid(), null, null, newid(), 1
      FROM inserted a 
           LEFT OUTER JOIN ContactMain b ON a.ID = b.SyncContactID AND a.COMPANY_RECORD = 1 AND b.IsInstitute = 0
           INNER JOIN @InsertKeyMap c ON a.ID = c.ID AND c.IsInstitute <> 0
		   LEFT OUTER JOIN deleted d ON a.ID = d.ID AND ISNULL(d.LAST_FIRST, '') <> '' AND d.COMPANY_RECORD = 1
     WHERE b.SyncContactID IS NULL
       AND ISNULL(a.LAST_FIRST, '') <> ''
       AND a.COMPANY_RECORD = 1

    -- create the UniformRegistry entries for the individual records
    DECLARE @individualComponentKey uniqueidentifier
    SELECT @individualComponentKey = ComponentKey
      FROM [dbo].[ComponentRegistry]
     WHERE [Name] = N'Individual' AND [InterfaceName] = N'BusinessController'
    INSERT INTO [dbo].[UniformRegistry] (UniformKey, ComponentKey)
    SELECT a.ContactKey, @individualComponentKey 
      FROM @InsertKeyMap a 
           LEFT OUTER JOIN UniformRegistry b ON a.ContactKey = b.UniformKey
     WHERE b.UniformKey IS NULL AND a.IsInstitute = 0
    
    -- create the UniformRegistry entries for the company records
    DECLARE @instituteComponentKey uniqueidentifier
    SELECT @instituteComponentKey = ComponentKey
      FROM [dbo].[ComponentRegistry]
     WHERE [Name] = N'Institute' AND [InterfaceName] = N'BusinessController'
    INSERT UniformRegistry (UniformKey, ComponentKey)
    SELECT a.ContactKey, @instituteComponentKey 
      FROM @InsertKeyMap a 
           LEFT OUTER JOIN UniformRegistry b ON a.ContactKey = b.UniformKey
     WHERE b.UniformKey IS NULL AND a.IsInstitute = 1
    
    -- create the UniformRegistry entries for the company Group records
    DECLARE @groupComponentKey uniqueidentifier
    SELECT @groupComponentKey = ComponentKey
      FROM [dbo].[ComponentRegistry]
     WHERE [Name] = N'Group' AND [InterfaceName] = N'BusinessController'
    INSERT UniformRegistry (UniformKey, ComponentKey)
    SELECT a.GroupKey, @groupComponentKey 
      FROM @InsertKeyMap a
     WHERE a.IsInstitute = 1

    -- Create the group owner access set (for items owned by the group)
    INSERT INTO [dbo].[AccessMain] (AccessKey, AccessScope, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    SELECT	OwnerAccessKey, N'Local', @createdByUserKey, @now, @createdByUserKey, @now
      FROM @InsertKeyMap
     WHERE IsInstitute = 1

    -- Grant Administrators role full control permission
    INSERT INTO [dbo].[AccessItem] (AccessKey, Grantee, Permission, RoleKey)
    SELECT OwnerAccessKey, @adminRoleKey, 1, @adminRoleKey
      FROM @InsertKeyMap
     WHERE IsInstitute = 1

    -- Grant Everyone role read permission
    INSERT INTO [dbo].[AccessItem] (AccessKey, Grantee, Permission, RoleKey)
    SELECT OwnerAccessKey, @everyoneRoleKey, 2, @everyoneRoleKey
      FROM @InsertKeyMap
     WHERE IsInstitute = 1

    -- create the ContactMain entries for all
    INSERT INTO [dbo].[ContactMain]
               (ContactKey, ContactStatusCode, FullName, SortName, IsInstitute, NoSolicitationFlag, 
                SyncContactID, ID, IsIDEditable, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, PreferredAddressCategoryCode, 
                IsSortNameOverridden, AccessKey, TextOnlyEmailFlag, ContactTypeKey, OptOutFlag)
    SELECT b.ContactKey,
           CASE WHEN a.STATUS LIKE 'A%' THEN N'1'
                WHEN a.STATUS LIKE 'I%' THEN N'2'
                WHEN a.STATUS LIKE 'D%' THEN N'3'
                WHEN a.STATUS LIKE 'S%' THEN N'4'
                ELSE N'1' END,
           CASE WHEN b.IsInstitute = 0 THEN CAST(a.FULL_NAME AS nvarchar(110)) ELSE CAST(a.COMPANY AS nvarchar(110)) END,
           CASE WHEN b.IsInstitute = 1 AND DATALENGTH(a.COMPANY_SORT) > 0 THEN CAST(a.COMPANY_SORT AS nvarchar(110)) ELSE CAST(a.LAST_FIRST AS nvarchar(110)) END,
           b.IsInstitute, a.EXCLUDE_MAIL, CAST(a.ID AS nvarchar(10)),
           CASE WHEN b.IsInstitute = 0 AND b.IsPrimary = 1 THEN N'P' + CAST(a.ID AS nvarchar(10)) ELSE CAST(a.ID AS nvarchar(10)) END,
           0, @createdByUserKey, @now, @createdByUserKey, @now, 1, 0, '00000000-0000-0000-0000-000000000E1F', 0,
           CASE WHEN b.IsInstitute = 0 THEN @individualTypeKey ELSE @instituteTypeKey END,
           0           
      FROM inserted a 
           INNER JOIN @InsertKeyMap b ON a.ID = b.ID 
           LEFT OUTER JOIN [dbo].[ContactMain] c ON b.ContactKey = c.ContactKey
	 WHERE c.ContactKey IS NULL

    -- Create a new group for each company
    INSERT INTO [dbo].[GroupMain] 
           (GroupKey, [Name], Description, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, 
            IsSystem, IsAutoGenerated, GroupTypeKey, AccessKey, SystemEntityKey, IsInvitationOnly,
            GroupStatusCode, IsSimpleGroup, InheritRolesFlag, IsSingleRole, OwnerAccessKey)
    SELECT b.GroupKey, LEFT(a.COMPANY,65), N'Group for ' + CAST(a.COMPANY AS nvarchar(80)) + N' Company', 
           @createdByUserKey, @now, @createdByUserKey, @now,
           0, 1, @groupTypeKey, '00000000-0000-0000-0000-000000000E02', @systemEntityKey, c.IsInvitationOnly, N'A', c.IsSimpleGroup,
           c.InheritRolesFlag, c.IsSingleRole, b.OwnerAccessKey
      FROM inserted a 
           INNER JOIN @InsertKeyMap b ON a.ID = b.ID, [dbo].[GroupTypeRef] c
     WHERE b.IsInstitute = 1
       AND c.GroupTypeKey = @groupTypeKey

    -- Give the groups full control to items protected by their owner access keys
    INSERT INTO [dbo].[AccessItem] (AccessKey, Grantee, Permission, GroupKey)
    SELECT OwnerAccessKey, GroupKey, 1, GroupKey
      FROM @InsertKeyMap
     WHERE IsInstitute = 1

    -- Create an institute for each company
    INSERT INTO [dbo].[Institute] (ContactKey, InstituteName, InstituteGroupKey)
    SELECT b.ContactKey, a.COMPANY, b.GroupKey
      FROM inserted a 
           INNER JOIN @InsertKeyMap b ON a.ID = b.ID
     WHERE b.IsInstitute = 1

    -- Create new Individual records for those that are not companies
    INSERT INTO [dbo].[Individual]
           (ContactKey, PrefixCode, FirstName, MiddleName, LastName, SuffixCode, Designation, Informal, 
            Gender, BirthDate, PrimaryInstituteContactKey, PrimaryInstituteName, PrimaryInstituteTitle)
    SELECT b.ContactKey, a.PREFIX, a.FIRST_NAME, a.MIDDLE_NAME, a.LAST_NAME, a.SUFFIX, a.DESIGNATION, a.INFORMAL,
           a.GENDER, a.BIRTH_DATE, c.ContactKey, a.COMPANY, a.TITLE
      FROM inserted a 
           INNER JOIN @InsertKeyMap b ON a.ID = b.ID
           LEFT OUTER JOIN ContactMain c ON a.CO_ID = c.SyncContactID AND c.IsInstitute = 1
     WHERE b.IsInstitute = 0

    -- Add the primary contacts into their company's group
    INSERT INTO [dbo].[GroupMember] 
           (GroupMemberKey, GroupKey, MemberContactKey, IsActive, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    SELECT a.GroupMemberKey, c.InstituteGroupKey, a.ContactKey, 1, @createdByUserKey, @now, @createdByUserKey, @now
      FROM @InsertKeyMap a 
           INNER JOIN ContactMain b ON a.ID = b.SyncContactID
           INNER JOIN Institute c ON b.ContactKey = c.ContactKey
     WHERE a.IsInstitute = 0 AND a.IsPrimary = 1
    
    INSERT INTO [dbo].[GroupMemberDetail] 
           (GroupMemberDetailKey, GroupMemberKey, GroupKey, GroupRoleKey, EffectiveDate, 
            CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, GroupMemberStatusCode, IsActive)
    SELECT newid(), a.GroupMemberKey, c.InstituteGroupKey, @primaryGroupRoleKey, @now, 
            @createdByUserKey, @now, @createdByUserKey, @now, @primaryDefaultMemberStatusCode, 1
      FROM @InsertKeyMap a 
           INNER JOIN ContactMain b ON a.ID = b.SyncContactID
           INNER JOIN Institute c ON b.ContactKey = c.ContactKey
     WHERE a.IsInstitute = 0
       AND a.IsPrimary = 1

    -- update the Institute to set the primary contact key
    UPDATE c
       SET PrimaryContactKey = a.ContactKey
      FROM @InsertKeyMap a 
           INNER JOIN [dbo].[ContactMain] b ON a.ID = b.SyncContactID
           INNER JOIN [dbo].[Institute] c ON b.ContactKey = c.ContactKey
     WHERE a.IsInstitute = 0
       AND a.IsPrimary = 1

    -- Handle the Salutations.  To make this fast when the salutation formulas haven't changed, hard
    -- code the formula work here IF nothing has changed
    DECLARE @salutationFormulaCount int, @canCreateHere bit

    SET @canCreateHere = 0

    SELECT @salutationFormulaCount = COUNT(1)
      FROM SalutationRef
     WHERE (SalutationDesc = N'Formal' AND IndividualFormula = N'{[PrefixCode] }{[FirstName] }[LastName]' AND InstituteFormula = N'[InstituteName]' AND AutoCreateFlag = 1)

    IF @salutationFormulaCount = 1
    BEGIN
        SET @canCreateHere = 1

        -- Individual Formal
        DECLARE @formalSalutationKey uniqueidentifier
        SELECT @formalSalutationKey = SalutationKey
          FROM [dbo].[SalutationRef]
         WHERE SalutationDesc = N'Formal'
         
        INSERT INTO [dbo].[ContactSalutation] (ContactSalutationKey, IsOverridden, SalutationText, ContactKey, SalutationKey, IsDeletable)
        SELECT NEWID(), 0, 
               RTRIM( CASE WHEN LEN(b.PREFIX) > 0 THEN b.PREFIX + ' ' ELSE '' END +
                      CASE WHEN LEN(b.FIRST_NAME) > 0 THEN b.FIRST_NAME + ' ' ELSE '' END +
                      CASE WHEN LEN(b.LAST_NAME) > 0 THEN b.LAST_NAME ELSE '' END),
               a.ContactKey, @formalSalutationKey, 1
          FROM @InsertKeyMap a 
               INNER JOIN inserted b ON a.ID = b.ID
         WHERE a.IsInstitute = 0
        
        -- Institute Formal
        INSERT ContactSalutation (ContactSalutationKey, IsOverridden, SalutationText, ContactKey, SalutationKey, IsDeletable)
        SELECT NEWID(), 0, b.COMPANY, a.ContactKey, c.SalutationKey, 1
          FROM @InsertKeyMap a 
               INNER JOIN inserted b ON a.ID = b.ID,
               SalutationRef c
         WHERE c.Salutationkey = @formalSalutationKey AND a.IsInstitute = 1
    END

    /******************* This section for UPDATING the .NET tables for existing records ***********************/
    -- Update ContactMain for institutes, individuals, and primary contacts
    UPDATE cm
       SET ContactStatusCode = CASE WHEN b.STATUS LIKE 'A%' THEN N'1'
                                    WHEN b.STATUS LIKE 'I%' THEN N'2'
                                    WHEN b.STATUS LIKE 'D%' THEN N'3'
                                    WHEN b.STATUS LIKE 'S%' THEN N'4'
                                    ELSE N'1' END,
           UpdatedByUserKey = @createdByUserKey,
           UpdatedOn = @now,
           FullName = CASE WHEN cm.IsInstitute = 0 THEN b.FULL_NAME ELSE b.COMPANY END,
           SortName = CASE WHEN cm.IsInstitute = 0 THEN b.LAST_FIRST ELSE b.COMPANY_SORT END,
           NoSolicitationFlag = b.EXCLUDE_MAIL
      FROM @UpdateIDs a 
		   INNER JOIN ContactMain cm ON a.ID = cm.SyncContactID 
           INNER JOIN inserted b ON a.ID = b.ID 

    -- Update Individual records
    UPDATE i
       SET PrefixCode = c.PrefixCode,
           SuffixCode = d.SuffixCode,
           FirstName = b.FIRST_NAME,
           MiddleName = b.MIDDLE_NAME,
           LastName = b.LAST_NAME,
           Designation = b.DESIGNATION,
           Informal = b.INFORMAL,
           Gender = b.GENDER,
           BirthDate = b.BIRTH_DATE,
           PrimaryInstituteName = b.COMPANY,
           PrimaryInstituteTitle = b.TITLE,
           PrimaryInstituteContactKey = e.ContactKey
      FROM @UpdateIDs a 
           INNER JOIN inserted b ON a.ID = b.ID
           INNER JOIN ContactMain cm ON a.ID = cm.SyncContactID
           INNER JOIN Individual i ON cm.ContactKey = i.ContactKey
           LEFT OUTER JOIN PrefixRef c ON b.PREFIX = c.PrefixCode
           LEFT OUTER JOIN SuffixRef d ON b.SUFFIX = d.SuffixCode
		   LEFT OUTER JOIN ContactMain e ON b.COMPANY = e.FullName AND e.IsInstitute = 1

    -- Update company records
    UPDATE Institute
       SET InstituteName = b.COMPANY
      FROM @UpdateIDs a INNER JOIN inserted b ON a.ID = b.ID
     WHERE Institute.ContactKey = a.ContactKey 
           AND Institute.InstituteName <> b.COMPANY

	-- If the record is changing from Individual to Insititute, but still have first and last name
	-- Step 3 from way above. Add the old individual record to the new Institutes group as the primary contact
	-- add the old individual record to the new Institutes group
    INSERT INTO GroupMember 
           (GroupMemberKey, GroupKey, MemberContactKey, IsActive, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    SELECT newid(), e.InstituteGroupKey, a.ContactKey, 1, @createdByUserKey, @now, @createdByUserKey, @now
	  FROM ContactMain a 
	       INNER JOIN inserted b ON a.SyncContactID = b.ID
		   INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN ContactMain d ON d.SyncContactID = c.ID
		   INNER JOIN Institute e ON d.ContactKey = e.ContactKey
	 WHERE b.COMPANY_RECORD = 1
	       AND c.COMPANY_RECORD = 0
	       AND ISNULL(b.LAST_FIRST, '') <> ''
	       AND a.IsInstitute = 0
	       AND d.IsInstitute = 1

    INSERT INTO GroupMemberDetail 
           (GroupMemberDetailKey, GroupMemberKey, GroupKey, GroupRoleKey, EffectiveDate, 
            CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, GroupMemberStatusCode, IsActive)
    SELECT newid(), f.GroupMemberKey, e.InstituteGroupKey, @primaryGroupRoleKey, @now, 
            @createdByUserKey, @now, @createdByUserKey, @now, @defaultMemberStatusCode, 1
	  FROM ContactMain a 
	       INNER JOIN inserted b ON a.SyncContactID = b.ID 
		   INNER JOIN deleted c ON a.SyncContactID = c.ID 
		   INNER JOIN ContactMain d ON d.SyncContactID = c.ID 
		   INNER JOIN Institute e ON d.ContactKey = e.ContactKey 
		   INNER JOIN GroupMember f ON e.InstituteGroupKey = f.GroupKey
	 WHERE b.COMPANY_RECORD = 1
	       AND c.COMPANY_RECORD = 0
	       AND ISNULL(b.LAST_FIRST, '') <> ''
	       AND a.IsInstitute = 0
	       AND d.IsInstitute = 1

	-- set the primary contact on the new institute to the old individual
	UPDATE e
	   SET PrimaryContactKey = a.ContactKey
	  FROM ContactMain a 
	       INNER JOIN inserted b ON a.SyncContactID = b.ID
		   INNER JOIN deleted c ON a.SyncContactID = c.ID
		   INNER JOIN ContactMain d ON d.SyncContactID = c.ID
		   INNER JOIN Institute e ON d.ContactKey = e.ContactKey
	 WHERE b.COMPANY_RECORD = 1
	       AND c.COMPANY_RECORD = 0
	       AND ISNULL(b.LAST_FIRST, '') <> ''
	       AND a.IsInstitute = 0
	       AND d.IsInstitute = 1

	-- get rid of company contacts that WERE on the company record but are not anymore
	-- leave the contacts in the system, just disconnect them from the company
	DELETE h 
	  FROM @UpdateIDs a 
		   INNER JOIN inserted b on a.ID = b.ID
		   INNER JOIN deleted c ON a.ID = c.ID
		   INNER JOIN ContactMain d ON a.ID = d.SyncContactID AND d.IsInstitute = 0
		   INNER JOIN ContactMain e ON a.ID = e.SyncContactID AND e.IsInstitute = 1
		   INNER JOIN Institute f ON e.ContactKey = f.ContactKey
		   INNER JOIN GroupMember g ON f.InstituteGroupKey = g.GroupKey AND d.ContactKey = g.MemberContactKey
		   INNER JOIN GroupMemberDetail h ON g.GroupMemberKey = h.GroupMemberKey
	 WHERE b.COMPANY_RECORD = 1
	       AND LTRIM(RTRIM(ISNULL(b.LAST_FIRST, ''))) = ''
	       AND LTRIM(RTRIM(ISNULL(c.LAST_FIRST, ''))) <> ''

	DELETE g 
	  FROM @UpdateIDs a 
		   INNER JOIN inserted b on a.ID = b.ID
		   INNER JOIN deleted c ON a.ID = c.ID
		   INNER JOIN ContactMain d ON a.ID = d.SyncContactID AND d.IsInstitute = 0
		   INNER JOIN ContactMain e ON a.ID = e.SyncContactID AND e.IsInstitute = 1
		   INNER JOIN Institute f ON e.ContactKey = f.ContactKey
		   INNER JOIN GroupMember g ON f.InstituteGroupKey = g.GroupKey AND d.ContactKey = g.MemberContactKey
	 WHERE b.COMPANY_RECORD = 1
	       AND LTRIM(RTRIM(ISNULL(b.LAST_FIRST, ''))) = ''
	       AND LTRIM(RTRIM(ISNULL(c.LAST_FIRST, ''))) <> ''

    -- Fix up the problem caused by converting a "CM" record with two ContactMain records
    -- to a "M" record, which leaves two Individual records associated with the same Name record
    DECLARE @ids TABLE (id varchar(10) NOT NULL)
    DECLARE @idCount int
    DECLARE @fixID varchar(10)
    INSERT INTO @ids (id)
        SELECT DISTINCT i.ID FROM inserted i INNER JOIN deleted d ON i.ID = d.ID 
                                             INNER JOIN Member_Types m1 ON i.MEMBER_TYPE = m1.MEMBER_TYPE
                                             INNER JOIN Member_Types m2 ON d.MEMBER_TYPE = m2.MEMBER_TYPE
            WHERE (i.MEMBER_TYPE <> d.MEMBER_TYPE AND (m1.MEMBER_RECORD <> m2.MEMBER_RECORD OR m1.COMPANY_RECORD <> m2.COMPANY_RECORD))
                  OR i.COMPANY_RECORD <> d.COMPANY_RECORD OR i.MEMBER_RECORD <> d.MEMBER_RECORD
    SELECT @idCount = COUNT(1) FROM @ids	
    IF @idCount > 0
    BEGIN
        IF @idCount = 1
        BEGIN
            -- Optimization to avoid cursor in most common case
            SELECT @fixID = id FROM @ids
            EXEC [dbo].[asi_FixDuplicateIndividualRowsById] @fixID
        END
        ELSE
        BEGIN
            -- Handle batch operation
            DECLARE c CURSOR LOCAL FAST_FORWARD READ_ONLY FOR
                SELECT id FROM @ids
            
            OPEN c
            FETCH NEXT FROM c INTO @fixID
            WHILE @@FETCH_STATUS = 0
            BEGIN
                EXEC [dbo].[asi_FixDuplicateIndividualRowsById] @fixID
                FETCH NEXT FROM c INTO @fixID
            END
        END
    END
        
    SET NOCOUNT OFF
END



GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_FR_Insert_Update_Delete]'))
    DROP TRIGGER [dbo].[asi_Name_FR_Insert_Update_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER asi_Name_FR_Insert_Update_Delete ON Name_FR
AFTER UPDATE, INSERT, DELETE
AS 
    DECLARE @UpdateType VARCHAR(1)
    DECLARE @InsertFlag BIT
    DECLARE @DeleteFlag BIT 

    IF (TRIGGER_NESTLEVEL( object_ID('asi_Name_Salutation_Insert_Update_Delete')) > 0)
        RETURN;
            
    -- check what we are doing
    
    SET @UpdateType='X';
    SET @InsertFlag = 0;
    SET @DeleteFlag = 0;
    
    IF EXISTS (SELECT 1 FROM INSERTED) 
        SET @InsertFlag = 1;
        
    IF EXISTS (SELECT 1 FROM DELETED)
        SET @DeleteFlag = 1;
        
    IF @InsertFlag=1 AND @DeleteFlag=0
        SET @UpdateType = 'I'; -- INSERTING
        
    IF @InsertFlag=1 AND @DeleteFlag=1
        SET @UpdateType = 'U'; -- UPDATING
        
    IF @InsertFlag=0 AND @DeleteFlag=1
        SET @UpdateType = 'D' -- DELETING
        
    IF @InsertFlag=0 AND @DeleteFlag=0
        RETURN; -- DO NOTHING
    
    IF @UpdateType='U'
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM inserted i INNER JOIN deleted d ON i.ID = d.ID WHERE i.LIST_AS <> d.LIST_AS)
        BEGIN
            -- There are no actual updates to LIST_AS, so quit out
            RETURN;
        END
    END;
    
    SET NOCOUNT ON
    
    -- if inserting or updating
    IF @UpdateType='I' OR @UpdateType='U'		
    BEGIN	
        UPDATE [dbo].[Name_Salutation]
            SET [Name_Salutation].[SALUTATION_TEXT]=i.[LIST_AS]
            FROM [INSERTED] i
            WHERE i.[ID]=[Name_Salutation].[ID]
            AND [Name_Salutation].[SALUTATION_TYPE]='LIST_AS'
            AND [Name_Salutation].[SALUTATION_TEXT]<>i.[LIST_AS];

        INSERT INTO [dbo].[Name_Salutation] 
            ( [ID] ,
              [SALUTATION_TYPE] ,
              [SALUTATION_TEXT]
            )
            SELECT i.[ID] , -- ID - varchar(10)
            'LIST_AS' , -- SALUTATION_TYPE - varchar(60)
            i.[LIST_AS] -- SALUTATION_TEXT - varchar(255)
            FROM [INSERTED] i 
            WHERE NOT EXISTS (SELECT 1 FROM [dbo].[Name_Salutation] n
                    WHERE n.[ID]=i.[ID] 
                      AND n.[SALUTATION_TYPE]='LIST_AS');
                      
            
    END;
    ELSE IF @UpdateType='D'
    BEGIN
        -- the Name_FR row has been deleted, delete the Name_Salutation row as well
        DELETE FROM [dbo].[Name_Salutation] 
            WHERE [Name_Salutation].[SALUTATION_TYPE]='LIST_AS'
            AND EXISTS (SELECT 1 FROM [DELETED] d WHERE d.[ID]=[Name_Salutation].[ID]);
    END;
    

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_Salutation_Insert_Update_Delete]'))
    DROP TRIGGER [dbo].[asi_Name_Salutation_Insert_Update_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER asi_Name_Salutation_Insert_Update_Delete ON Name_Salutation
AFTER UPDATE, INSERT, DELETE
AS 
    DECLARE @UpdateType VARCHAR(1)
    DECLARE @InsertedFlag BIT 
    DECLARE @DeletedFlag BIT 

    IF (TRIGGER_NESTLEVEL( object_ID('asi_Name_FR_Insert_Update_Delete')) > 0)
        RETURN;

    SET @DeletedFlag = 0;
    SET @InsertedFlag = 0;
    
    IF EXISTS (SELECT 1 FROM INSERTED)
        SET @InsertedFlag=1;
    
    IF EXISTS (SELECT 1 FROM DELETED)
        SET @DeletedFlag=1;
    
    SET @UpdateType='X'
    -- check what we are doing
    IF @InsertedFlag=1 AND @DeletedFlag=0
        SET @UpdateType = 'I'; -- INSERTING

    IF @InsertedFlag=1 AND @DeletedFlag=1
        SET @UpdateType = 'U'; -- UPDATING

    IF @InsertedFlag=0 AND @DeletedFlag=1
        SET @UpdateType = 'D' -- DELETING
    
    IF @InsertedFlag=0 AND @DeletedFlag=0
        RETURN; -- DO NOTHING
    
    SET NOCOUNT ON
    
    -- If inserting or updating
    IF @UpdateType='I' OR @UpdateType='U'
    BEGIN
        -- Update the Name_FR table where the row already exists
        UPDATE [dbo].[Name_FR]
            SET [Name_FR].LIST_AS=i.[SALUTATION_TEXT]
            FROM [INSERTED] i
            WHERE i.[SALUTATION_TYPE]='LIST_AS'
              AND [Name_FR].[ID]=i.[ID] AND [Name_FR].[LIST_AS]<>i.[SALUTATION_TEXT];

        -- insert into Name_FR where the row doesn't already exist
        INSERT INTO [dbo].[Name_FR]
            ( ID ,
              SOLICITOR_ID ,
              DO_NOT_PHONE ,
              DO_NOT_EMAIL ,
              LIST_AS ,
              MATCH_DESCRIP ,
              MATCH_PCT ,
              MIN_EMPL_CONTRIB ,
              MAX_EMPL_CONTRIB ,
              VALID_FROM ,
              VALID_THRU ,
              PREFERRED_DIST_CODE ,
              Receipt_Interval ,
              Last_Receipt_Printed_Date ,
              DO_NOT_SELL ,
              DO_NOT_SOLICIT 
            )
        SELECT  i.[ID] , -- ID - varchar(10)
          '' , -- SOLICITOR_ID - varchar(10)
          0 , -- DO_NOT_PHONE - bit
          0 , -- DO_NOT_EMAIL - bit
          i.[SALUTATION_TEXT] , -- LIST_AS - varchar(255)
          '' , -- MATCH_DESCRIP - varchar(255)
          0 , -- MATCH_PCT - tinyint
          0 , -- MIN_EMPL_CONTRIB - money
          0 , -- MAX_EMPL_CONTRIB - numeric
          NULL , -- VALID_FROM - datetime
          NULL , -- VALID_THRU - datetime
          '' , -- PREFERRED_DIST_CODE - varchar(15)
          0 , -- Receipt_Interval - tinyint
          NULL , -- Last_Receipt_Printed_Date - datetime
          0 , -- DO_NOT_SELL - bit
          0  -- DO_NOT_SOLICIT - bit
        FROM [INSERTED] i
            WHERE i.[SALUTATION_TYPE]='LIST_AS' 
            AND NOT EXISTS (SELECT 1 FROM [dbo].[Name_FR] WHERE [Name_FR].[ID]=i.[ID]);
                    

    END;
    ELSE IF @UpdateType='D'
    BEGIN	
        -- the row was deleted from Name_Salutation, so clear the value from Name_FR
        -- if it already exists
        UPDATE [Name_FR]
            SET [Name_FR].[LIST_AS]=''
            FROM [DELETED] d
            WHERE d.[SALUTATION_TYPE]='LIST_AS'
              AND [Name_FR].[ID]=d.[ID] AND [Name_FR].[LIST_AS]<>'';
    END;


GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_Security_Delete]'))
    DROP TRIGGER [dbo].[asi_Name_Security_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [dbo].[asi_Name_Security_Delete]
	ON [dbo].[Name_Security]
	FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON
	UPDATE um 
       SET um.[IsDisabled] = 1,
           um.[UserId] = ''
      FROM deleted d 
           INNER JOIN [dbo].[UserMain] um ON d.[WEB_LOGIN] = um.[UserId]
     WHERE d.[WEB_LOGIN] <> ''
	SET NOCOUNT OFF
END


GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Name_Security_Update]'))
    DROP TRIGGER [dbo].[asi_Name_Security_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Name_Security_Update]
   ON  [dbo].[Name_Security] 
   FOR UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i JOIN deleted d ON i.ID = d.ID 
                WHERE i.[LOGIN_DISABLED] <> d.[LOGIN_DISABLED] OR i.[EXPIRATION_DATE] <> d.[EXPIRATION_DATE]
                      OR (i.[EXPIRATION_DATE] IS NULL AND d.[EXPIRATION_DATE] IS NOT NULL)
                      OR (i.[EXPIRATION_DATE] IS NOT NULL AND d.[EXPIRATION_DATE] IS NULL))
    BEGIN
        UPDATE u
           SET u.[ExpirationDate] = i.[EXPIRATION_DATE],
               u.[IsDisabled] = i.[LOGIN_DISABLED],
               u.[UpdatedOn] = GETDATE()
          FROM [dbo].[UserMain] u INNER JOIN inserted i ON u.[ContactMaster] = i.[ID]
    END    
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_NavMenu_Insert]'))
    DROP TRIGGER [dbo].[asi_NavMenu_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =============================================
-- Trigger on Nav_Menu to set...
--    - DirectoryName for new Nav_Menu records.
--
-- Modifications
-- 08/22/2003     E.Tatsui   Created
-- =============================================

CREATE TRIGGER [dbo].[asi_NavMenu_Insert]
	ON [dbo].[Nav_Menu]
	FOR INSERT
	AS 
BEGIN
	DECLARE
	@NavMenuID numeric

	-- Get all the new records without DirectoryName, and set DirectoryName for each one.
	DECLARE c_NewNavMenu CURSOR FOR
		SELECT NavMenuID FROM inserted
		WHERE DirectoryName IS NULL

	OPEN c_NewNavMenu
	FETCH NEXT FROM c_NewNavMenu
		INTO @NavMenuID

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		EXEC amsp_CMGetUniqueDirectoryName @NavMenuID, 1, NULL 
		FETCH NEXT FROM c_NewNavMenu
			INTO @NavMenuID
	END
	CLOSE c_NewNavMenu
	DEALLOCATE c_NewNavMenu
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_NavMenu_Update]'))
    DROP TRIGGER [dbo].[asi_NavMenu_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =============================================
-- Trigger on Nav_Menu table to set directory name and file path.
-- 
-- 10/11/2003    E.Tatsui    Created
-- =============================================

CREATE TRIGGER [dbo].[asi_NavMenu_Update]
	ON [dbo].[Nav_Menu]
	FOR UPDATE
AS
BEGIN
	DECLARE @NavMenuID numeric

	-- Get all the Nav_Menu records whose directory name has changed.
	IF UPDATE(DirectoryName) 
	BEGIN
		DECLARE c_NavMenuUpdated CURSOR FOR
		 SELECT a.NavMenuID
		   FROM inserted a, deleted b
		  WHERE a.NavMenuID = b.NavMenuID
			AND a.DirectoryName <> b.DirectoryName

		OPEN c_NavMenuUpdated
		FETCH NEXT FROM c_NavMenuUpdated
			INTO @NavMenuID

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			EXEC amsp_CMUpdateNavProperties @NavMenuID

			FETCH NEXT FROM c_NavMenuUpdated
				INTO @NavMenuID
		END

		CLOSE c_NavMenuUpdated
		DEALLOCATE c_NavMenuUpdated
	END

	-- Set PreviousWebsiteKey when Website is changed, so that we can delete content from file system.
	IF UPDATE (WebsiteKey) 
	BEGIN
		UPDATE Nav_Menu
		   SET PreviousWebsiteKey = b.WebsiteKey
		  FROM inserted a, deleted b
		 WHERE Nav_Menu.NavMenuID = a.NavMenuID
		   AND a.NavMenuID = b.NavMenuID
		   AND a.WebsiteKey <> b.WebsiteKey
		   AND a.PreviousWebsiteKey IS NULL

		UPDATE Nav_Menu
		   SET PreviousWebsiteKey = NULL
		  FROM inserted a
		 WHERE a.WebsiteKey = a.PreviousWebsiteKey
		   AND Nav_Menu.NavMenuID = a.NavMenuID
	END
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_PackageItem_Insert_Update]'))
    DROP TRIGGER [dbo].[asi_PackageItem_Insert_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_PackageItem_Insert_Update] 
	ON [dbo].[PackageItem] 
	FOR INSERT, UPDATE 
AS
BEGIN
	UPDATE	pm1
	SET	pm1.Cost = 
		(SELECT	COALESCE(Sum(sm2.Cost), 0)
		 FROM PackageMain pm2
			INNER JOIN PackageItem pi2 on pm2.PackageKey = pi2.PackageKey
			INNER JOIN SupplementMain sm2 on pi2.SupplementKey = sm2.SupplementKey
		 WHERE pm2.PackageKey = pm1.PackageKey)
	FROM PackageMain pm1
		INNER JOIN inserted on pm1.PackageKey = inserted.PackageKey
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_PciAuditLog_Delete]'))
    DROP TRIGGER [dbo].[asi_PciAuditLog_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
--add delete trigger to PciAuditLog table
CREATE TRIGGER [dbo].[asi_PciAuditLog_Delete]
 ON [dbo].[PciAuditLog]
INSTEAD OF DELETE
AS
    INSERT INTO PciAuditLog ([EventType], [Result], [OriginationCode]) VALUES ('DeleteLog',0,100)

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_PciAuditLog_Insert]'))
    DROP TRIGGER [dbo].[asi_PciAuditLog_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
--add insert trigger to PciAuditLog table
CREATE TRIGGER [dbo].[asi_PciAuditLog_Insert]
 ON [dbo].[PciAuditLog]
 INSTEAD OF INSERT
AS
BEGIN 
      INSERT INTO [dbo].[PciAuditLog] 
      ([UserId],[UserKey],[EventType],[Result],[OriginationCode],[CC_LAST4],[ENCRYPT_CC_NUMBER])
      SELECT [UserId],[UserKey],[EventType],[Result],[OriginationCode],[CC_LAST4],[ENCRYPT_CC_NUMBER]
      FROM inserted i 
      WHERE NOT EXISTS(SELECT 1 FROM [dbo].[PciAuditLog] t WHERE i.[SqlLogin]=t.[SqlLogin]
                        AND isnull(i.[UserId],'')=isnull(t.[UserId],'')  
                        AND ((i.[UserKey]=t.[UserKey]) OR (i.[UserKey] is null AND t.[UserKey] is null))
                        AND i.[EventType]=t.[EventType] 
                        AND (i.[EventTimestamp]-0.0007)<t.[EventTimestamp]
                        AND i.[Result]=t.[Result] 
                        AND i.[OriginationCode]=t.[OriginationCode] 
                        AND i.[CC_LAST4]=t.[CC_LAST4] 
                        AND i.[ENCRYPT_CC_NUMBER]=t.[ENCRYPT_CC_NUMBER])
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_PciAuditLog_Update]'))
    DROP TRIGGER [dbo].[asi_PciAuditLog_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
--add update trigger to PciAuditLog table
CREATE TRIGGER [dbo].[asi_PciAuditLog_Update]
 ON [dbo].[PciAuditLog]
INSTEAD OF UPDATE
AS
    INSERT INTO PciAuditLog ([EventType], [Result], [OriginationCode]) VALUES ('UpdateLog',0,100)

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Product_Type_Delete]'))
    DROP TRIGGER [dbo].[asi_Product_Type_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Product_Type_Delete]
	ON [dbo].[Product_Type]
	FOR DELETE 
AS
BEGIN
	DELETE Security_Tables
	WHERE TABLE_NAME = (SELECT 'Activity_' + PROD_TYPE FROM deleted)

	DELETE Security_Filters
	WHERE TABLE_NAME = (SELECT 'Activity_' + PROD_TYPE FROM deleted)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Product_Type_Insert]'))
    DROP TRIGGER [dbo].[asi_Product_Type_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Product_Type_Insert] 
	ON [dbo].[Product_Type]
	FOR INSERT 
AS
BEGIN
	INSERT Security_Tables(MENU_NAME,TABLE_NAME)
	SELECT 'Activity - ' + PROD_TYPE, 'Activity_' + PROD_TYPE 
	FROM inserted

	INSERT Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT sg.SECURITY_GROUP,'BROWSE', 'Activity_' + i.PROD_TYPE
	FROM inserted i,  Security_Groups sg

	INSERT Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT sg.SECURITY_GROUP,'EDIT', 'Activity_' + i.PROD_TYPE
	FROM inserted i,  Security_Groups sg

	INSERT Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT sg.SECURITY_GROUP,'INSERT', 'Activity_' + i.PROD_TYPE
	FROM inserted i,  Security_Groups sg

	INSERT Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT sg.SECURITY_GROUP,'DELETE', 'Activity_' + i.PROD_TYPE
	FROM inserted i,  Security_Groups sg

	UPDATE Security_Filters SET TABLE_ACCESSIBLE = 1
	WHERE SECURITY_GROUP = 'Administrator'
		  AND TABLE_NAME = (SELECT 'Activity_' + i.PROD_TYPE FROM inserted i)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Security_Groups_Delete]'))
    DROP TRIGGER [dbo].[asi_Security_Groups_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Security_Groups_Delete]
ON [dbo].[Security_Groups]
FOR DELETE 
AS
BEGIN
	DELETE Security_Filters
	WHERE SECURITY_GROUP = (SELECT d.SECURITY_GROUP FROM deleted d)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Security_Groups_Insert]'))
    DROP TRIGGER [dbo].[asi_Security_Groups_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_Security_Groups_Insert]
ON [dbo].[Security_Groups]
FOR INSERT AS
BEGIN
	INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT	i.SECURITY_GROUP,'BROWSE', st.TABLE_NAME
	FROM	inserted i,  Security_Tables st

	INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT	i.SECURITY_GROUP,'DELETE',  st.TABLE_NAME
	FROM	inserted i,  Security_Tables st

	INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT	i.SECURITY_GROUP,'EDIT',  st.TABLE_NAME
	FROM	inserted i,  Security_Tables st

	INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT	i.SECURITY_GROUP,'SEARCH',  st.TABLE_NAME
	FROM	inserted i,  Security_Tables st

	INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
	SELECT	i.SECURITY_GROUP,'INSERT',  st.TABLE_NAME
	FROM	inserted i,  Security_Tables st
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SolicitationMain_Delete]'))
    DROP TRIGGER [dbo].[asi_SolicitationMain_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_SolicitationMain_Delete] 
	ON [dbo].[SolicitationMain] 
	FOR DELETE 
AS
UPDATE	ap1
 SET	ap1.TotalRevenue = ap1.TotalRevenue - deleted.TotalRevenue
 FROM	AppealMain ap1
	INNER JOIN vBoSolicitation sm1 ON ap1.AppealKey = sm1.AppealKey 
	INNER JOIN deleted ON sm1.SolicitationKey = deleted.SolicitationKey

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SolicitationMain_Insert_Update]'))
    DROP TRIGGER [dbo].[asi_SolicitationMain_Insert_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_SolicitationMain_Insert_Update] 
	ON [dbo].[SolicitationMain] 
	FOR INSERT, UPDATE 
AS
UPDATE	ap1
   SET	ap1.TotalRevenue = Coalesce(
		(SELECT	Sum(sm2.TotalRevenue)
		 FROM	AppealMain ap2
				INNER JOIN vBoSolicitation sm2 ON ap2.AppealKey = sm2.AppealKey
		 WHERE	ap2.AppealKey = ap1.AppealKey), 0)
  FROM	AppealMain ap1
		INNER JOIN vBoSolicitation sm1 ON ap1.AppealKey = sm1.AppealKey 
		INNER JOIN inserted ON sm1.SolicitationKey = inserted.SolicitationKey

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SourceCodeDelete]'))
    DROP TRIGGER [dbo].[asi_SourceCodeDelete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_SourceCodeDelete]
   ON  [dbo].[SourceCode]
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Gen_Tables
	WHERE CODE IN (Select Code From deleted)
	AND TABLE_NAME = 'SOURCE_CODE'
	
	
	-- This is an Appeal too
	DELETE Appeal 
	WHERE APPEAL_CODE IN (SELECT Code from deleted)
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SourceCodeInsert]'))
    DROP TRIGGER [dbo].[asi_SourceCodeInsert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_SourceCodeInsert]
   ON  [dbo].[SourceCode]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Gen_Tables (CODE,UPPER_CODE,DESCRIPTION,TABLE_NAME)
	SELECT Code,Code,IsNULL(Description,''),'SOURCE_CODE' FROM inserted
	
	-- This is an Appeal too

	INSERT INTO Appeal (APPEAL_CODE,TITLE,DESCRIPTION,APPEAL_TYPE,CAMPAIGN_CODE)
	SELECT i.Code,i.Code,IsNULL(i.Description,''),'',c.LegacyCampaignCode
	FROM inserted i 
	INNER JOIN SourceCodeTypeRef sctr ON i.SourceCodeTypeCode = sctr.SourceCodeTypeCode
	INNER JOIN SolicitationMain s ON i.SolicitationKey = s.SolicitationKey
	INNER JOIN AppealMain a ON s.AppealKey = a.AppealKey
	INNER JOIN CampaignMain c ON a.CampaignKey = c.CampaignKey
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SourceCodeRevenueDelete]'))
    DROP TRIGGER [dbo].[asi_SourceCodeRevenueDelete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_SourceCodeRevenueDelete] 
    ON [dbo].[SourceCode] 
    FOR DELETE 
AS
BEGIN
UPDATE	sm1
   SET	sm1.TotalRevenue = sm1.TotalRevenue - deleted.TotalRevenue
  FROM	SolicitationMain sm1
	INNER JOIN vBoSourceCode sc1 ON sm1.SolicitationKey = sc1.SolicitationKey 
	INNER JOIN deleted ON sc1.SourceCodeKey = deleted.SourceCodeKey
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SourceCodeRevenueUpdate]'))
    DROP TRIGGER [dbo].[asi_SourceCodeRevenueUpdate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  TRIGGER [dbo].[asi_SourceCodeRevenueUpdate] 
    ON [dbo].[SourceCode] 
    FOR INSERT, UPDATE 
AS
BEGIN
UPDATE	sm1
   SET	sm1.TotalRevenue = Coalesce(
		(SELECT	Sum(sc2.TotalRevenue)
		 FROM	SolicitationMain sm2
				INNER JOIN vBoSourceCode sc2 ON sm2.SolicitationKey = sc2.SolicitationKey
		 WHERE	sm2.SolicitationKey = sm1.SolicitationKey), 0)
  FROM	SolicitationMain sm1
		INNER JOIN vBoSourceCode sc1 ON sm1.SolicitationKey = sc1.SolicitationKey 
		INNER JOIN inserted ON sc1.SourceCodeKey = inserted.SourceCodeKey
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SourceCodeUpdate]'))
    DROP TRIGGER [dbo].[asi_SourceCodeUpdate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_SourceCodeUpdate]
   ON  [dbo].[SourceCode]
   AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
    IF (UPDATE (Code) OR UPDATE (Description))
    BEGIN
	   UPDATE Gen_Tables
	   SET CODE = i.Code,
	   	   UPPER_CODE = i.Code,
		   DESCRIPTION = ISNULL(i.Description, '')
	     FROM inserted i, deleted d
	     WHERE Gen_Tables.CODE = d.Code AND (Gen_Tables.TABLE_NAME = 'SOURCE_CODE')
	
	   UPDATE Appeal
	   Set APPEAL_CODE = i.Code,
	       TITLE = i.Code,
	       DESCRIPTION = ISNULL(i.Description, ''),
	       APPEAL_TYPE = '' ,
	       CAMPAIGN_CODE = c.LegacyCampaignCode
	       FROM inserted i, deleted d
	         INNER JOIN SourceCodeTypeRef sctr ON d.SourceCodeTypeCode = sctr.SourceCodeTypeCode
	         INNER JOIN SolicitationMain s ON d.SolicitationKey = s.SolicitationKey
	         INNER JOIN AppealMain a ON s.AppealKey = a.AppealKey
	         INNER JOIN CampaignMain c ON a.CampaignKey = c.CampaignKey
	       WHERE APPEAL_CODE = d.Code
    END
	
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_SupplementMain_Insert_Update]'))
    DROP TRIGGER [dbo].[asi_SupplementMain_Insert_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_SupplementMain_Insert_Update] 
	ON [dbo].[SupplementMain] 
	FOR INSERT, UPDATE 
AS
UPDATE	pm1
   SET	pm1.Cost = Coalesce(
		(SELECT	Sum(sm2.Cost)
		   FROM	PackageMain pm2
				INNER JOIN PackageItem pi2 ON pm2.PackageKey = pi2.PackageKey
				INNER JOIN SupplementMain sm2 ON pi2.SupplementKey = sm2.SupplementKey
		  WHERE	pm2.PackageKey = pm1.PackageKey), 0)
  FROM	PackageMain pm1
		INNER JOIN PackageItem pi1 ON pm1.PackageKey = pi1.PackageKey 
		INNER JOIN inserted ON pi1.SupplementKey = inserted.SupplementKey

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_System_Params_InsertUpdate]'))
    DROP TRIGGER [dbo].[asi_System_Params_InsertUpdate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER asi_System_Params_InsertUpdate
   ON  [dbo].[System_Params]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM inserted WHERE [ParameterName] = 'System_Control.LicensedProducts')
	BEGIN
		-- script to parse licensed products string
		DECLARE @products varchar(4000)
		DECLARE @licenseKey uniqueidentifier

		TRUNCATE TABLE [dbo].[LicenseLegacyList]

		SELECT @products =  CASE WHEN DATALENGTH(ShortValue) > 0 THEN ShortValue ELSE LongValue END
		  FROM [dbo].[System_Params]
		 WHERE [ParameterName] = 'System_Control.LicensedProducts'

		-- assume comma delimiter for all products, and eliminate the special case of the last license key
		SET @products = REPLACE(@products, '/', ',')  -- just in case; there may be some slash-delimited CS licenses
		SET @products = @products + ','

		DECLARE @token varchar(50)
		WHILE (DATALENGTH (@products) > 0)
		BEGIN
			SET @token = SUBSTRING (@products, 1, CHARINDEX (',', @products) - 1)
			SET @products = SUBSTRING (@products, CHARINDEX (',', @products) + 1, 4000) 

			IF (DATALENGTH(@token) > 0 and @token <> ',')
			BEGIN
				IF (CHARINDEX ('ECMADV', @token) <> 0) BEGIN SET @token = 'ECMADV' END
				IF (CHARINDEX ('ECMSIM', @token) <> 0) BEGIN SET @token = 'ECMSIM' END
				IF (CHARINDEX ('CASUAL', @token) <> 0) BEGIN SET @token = 'CASUAL' END
				IF (CHARINDEX ('ACCU',   @token) <> 0) BEGIN SET @token = 'ACCU'   END
				IF (CHARINDEX ('PROS',   @token) <> 0) BEGIN SET @token = 'PROS'   END
                IF (CHARINDEX ('CERTIFICATION', @token) <> 0) BEGIN SET @token = 'CERT' END
                IF (CHARINDEX ('RELATIONSHIPS', @token) <> 0) BEGIN SET @token = 'RELATION' END

				SET @licenseKey = NULL
				SELECT @licenseKey = LicenseKey FROM [dbo].[LicenseLegacyMap] WHERE [LegacyLicenseCode] = @token

                IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyList] WHERE [LegacyLicenseCode] = @token)
                BEGIN
				    INSERT INTO [dbo].[LicenseLegacyList] ([LicenseLegacyKey], [LegacyLicenseCode])
				    VALUES (ISNULL(@licenseKey, NEWID()), @token)
                END
			END
		END
	END
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Trans_FundraisingInsertUpdateDelete]'))
    DROP TRIGGER [dbo].[asi_Trans_FundraisingInsertUpdateDelete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE TRIGGER [dbo].[asi_Trans_FundraisingInsertUpdateDelete]
    ON [dbo].[Trans]
    FOR INSERT, UPDATE, DELETE
AS
BEGIN

    -- Create a Temp Table with all values to be passed to the StoredProcedure
    CREATE TABLE #TransTemp(TransNum int, InvoiceNum int, DonorId varchar(10))

    -- Populate Temp Table with the values to be passed to the Stored Procedure
    INSERT #TransTemp(TransNum, InvoiceNum, DonorId)
    SELECT DISTINCT a.TRANS_NUMBER, a.INVOICE_REFERENCE_NUM, a.ST_ID
    FROM (  SELECT TRANS_NUMBER, INVOICE_REFERENCE_NUM, ST_ID
            FROM deleted
            WHERE IS_FR_ITEM = 1
          UNION
            SELECT TRANS_NUMBER, INVOICE_REFERENCE_NUM, ST_ID
            FROM inserted
            WHERE IS_FR_ITEM = 1
          UNION
            SELECT Invoice.ORIGINATING_TRANS_NUM, deleted.INVOICE_REFERENCE_NUM, Invoice.ST_ID
            FROM deleted INNER JOIN Invoice ON deleted.INVOICE_REFERENCE_NUM = Invoice.REFERENCE_NUM
            WHERE IS_FR_ITEM = 1
          UNION 
            SELECT Invoice.ORIGINATING_TRANS_NUM, inserted.INVOICE_REFERENCE_NUM, Invoice.ST_ID
            FROM inserted INNER JOIN Invoice ON inserted.INVOICE_REFERENCE_NUM = Invoice.REFERENCE_NUM 
            WHERE IS_FR_ITEM = 1
         ) a 
              LEFT JOIN #TransTemp ON a.TRANS_NUMBER = #TransTemp.TransNum AND
                             a.INVOICE_REFERENCE_NUM = #TransTemp.InvoiceNum
    WHERE #TransTemp.TransNum IS NULL

    EXEC dbo.asi_UpdateFundraisingViewTables 
        
    DECLARE @CountDonors int, @Donor varchar(10)
    SELECT @CountDonors = COUNT(DISTINCT(DonorId)) FROM #TransTemp
    
    IF @CountDonors > 1
      BEGIN
        SELECT @Donor = MAX(DonorId) FROM #TransTemp 
        EXEC dbo.asi_RecalculateGiftHistorySummary @Donor
      END
    ELSE
      BEGIN
        DECLARE @keyTable TABLE (RowId int NOT NULL primary key identity(1,1), DonorId varchar(10))
        INSERT @keyTable (DonorId)
        SELECT DISTINCT(DonorId) FROM #TransTemp
        
        DECLARE @currentRow int 
        SET @currentRow=0 
        WHILE @currentRow < @CountDonors
          BEGIN 
            SET @currentRow = @currentRow + 1 
            SELECT @Donor = DonorId  
              FROM @keyTable 
             WHERE RowId = @currentRow 
             EXEC dbo.asi_RecalculateGiftHistorySummary @Donor
          END 
      END

    DROP TABLE #TransTemp 
    
END


GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UD_WindowFields_Delete]'))
    DROP TRIGGER [dbo].[asi_UD_WindowFields_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UD_WindowFields_Delete] 
    ON [dbo].[UD_WindowFields]
    FOR DELETE 
AS
BEGIN
    DELETE Security_Tables
      FROM Security_Tables, deleted
     WHERE UPPER(Security_Tables.TABLE_NAME) = UPPER(REPLACE(REPLACE(deleted.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(deleted.FIELD_NAME, '-', '_'), ' ', '_'))

    DELETE Security_Filters
      FROM Security_Filters, deleted
     WHERE UPPER(Security_Filters.TABLE_NAME) = UPPER(REPLACE(REPLACE(deleted.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(deleted.FIELD_NAME, '-', '_'), ' ', '_'))
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UD_WindowFields_Insert]'))
    DROP TRIGGER [dbo].[asi_UD_WindowFields_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UD_WindowFields_Insert] 
    ON [dbo].[UD_WindowFields] 
    FOR INSERT 
AS
BEGIN
    INSERT  Security_Tables(TABLE_NAME,MENU_NAME)
    SELECT 	UPPER(REPLACE(REPLACE(WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(FIELD_NAME, '-', '_'), ' ', '_')),
	        UPPER(WINDOW_NAME) + ' ' + UPPER(FIELD_NAME)
      FROM	inserted

    INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT  sg.SECURITY_GROUP,'BROWSE', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(i.FIELD_NAME, '-', '_'), ' ', '_'))
      FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'DELETE', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(i.FIELD_NAME, '-', '_'), ' ', '_'))
      FROM	inserted i,  Security_Groups sg 

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'EDIT', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(i.FIELD_NAME, '-', '_'), ' ', '_'))
      FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'INSERT', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(i.FIELD_NAME, '-', '_'), ' ', '_'))
      FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'SEARCH', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(i.FIELD_NAME, '-', '_'), ' ', '_'))
      FROM	inserted i,  Security_Groups sg

    UPDATE 	Security_Filters
       SET 	TABLE_ACCESSIBLE = 1
      FROM	Security_Filters,inserted
     WHERE 	Security_Filters.SECURITY_GROUP = 'Administrator' and 
            Security_Filters.TABLE_NAME = UPPER(REPLACE(REPLACE(inserted.WINDOW_NAME, '-', '_'), ' ', '_')) + '.' + UPPER(REPLACE(REPLACE(inserted.FIELD_NAME, '-', '_'), ' ', '_'))
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UD_WindowHeader_Delete]'))
    DROP TRIGGER [dbo].[asi_UD_WindowHeader_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UD_WindowHeader_Delete] 
    ON [dbo].[UD_WindowHeader] 
    FOR DELETE 
AS
BEGIN
    DELETE 	Security_Tables
      FROM	Security_Tables,deleted
     WHERE 	UPPER(Security_Tables.TABLE_NAME) = UPPER(REPLACE(REPLACE(deleted.WINDOW_NAME, '-', '_'), ' ', '_'))

    DELETE 	Security_Filters
      FROM	Security_Filters,deleted
     WHERE 	UPPER(Security_Filters.TABLE_NAME) = UPPER(REPLACE(REPLACE(deleted.WINDOW_NAME, '-', '_'), ' ', '_'))
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UD_WindowHeader_Insert]'))
    DROP TRIGGER [dbo].[asi_UD_WindowHeader_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UD_WindowHeader_Insert] 
    ON [dbo].[UD_WindowHeader] 
    FOR INSERT 
AS
BEGIN
    INSERT  Security_Tables(TABLE_NAME,MENU_NAME)
    SELECT	UPPER(REPLACE(REPLACE(WINDOW_NAME, '-', '_'), ' ', '_')), UPPER(WINDOW_NAME)
     FROM	inserted

    INSERT  Security_Filters (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'Browse', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_'))
     FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'Delete', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_'))
     FROM	inserted i,  Security_Groups sg 

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'Edit', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_'))
     FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'Insert', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_'))
     FROM	inserted i,  Security_Groups sg

    INSERT  Security_Filters(SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
    SELECT	sg.SECURITY_GROUP,'Search', UPPER(REPLACE(REPLACE(i.WINDOW_NAME, '-', '_'), ' ', '_'))
     FROM	inserted i,  Security_Groups sg

    UPDATE 	Security_Filters
     SET 	TABLE_ACCESSIBLE = 1
     FROM	Security_Filters,inserted
     WHERE 	Security_Filters.SECURITY_GROUP = 'Administrator' AND
            Security_Filters.TABLE_NAME = UPPER(REPLACE(REPLACE(inserted.WINDOW_NAME, '-', '_'), ' ', '_'))
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UserMain_Delete]'))
    DROP TRIGGER [dbo].[asi_UserMain_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UserMain_Delete]
   ON [dbo].[UserMain]
   FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    DECLARE @groupTypeKey uniqueidentifier
    SET @groupTypeKey = '636A1E55-38BC-4A8F-AC8D-A6873D697F18'
    DELETE gm
      FROM deleted d INNER JOIN [dbo].[ContactMain] cm ON d.[UserKey] = cm.[ContactKey]
                     INNER JOIN [dbo].[Name] n ON cm.[SyncContactID] = n.[ID] 
                     INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = n.[MEMBER_TYPE]
                     INNER JOIN [dbo].[GroupMain] g ON g.[Name] = mt.[DESCRIPTION] AND g.[GroupTypeKey] = @groupTypeKey
                     INNER JOIN [dbo].[GroupMember] gm ON gm.[GroupKey] = g.[GroupKey] AND gm.[MemberContactKey] = cm.[ContactKey] 

    SET NOCOUNT OFF
END


GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UserMain_Insert]'))
    DROP TRIGGER [dbo].[asi_UserMain_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [dbo].[asi_UserMain_Insert]
   ON [dbo].[UserMain]
   FOR INSERT
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE @now datetime
    DECLARE @userKey uniqueidentifier
    
    SELECT @now = GETDATE()
    SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM'
    IF @userKey IS NULL SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

    INSERT INTO [dbo].[GroupMember] ([GroupMemberKey], [GroupKey], [MemberContactKey], [IsActive],
                                     [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn])
        SELECT NEWID(), g.GroupKey, cm.ContactKey, 1, @userKey, @now, @userKey, @now  
          FROM inserted i 
               INNER JOIN [dbo].[ContactMain] cm ON i.[UserKey] = cm.[ContactKey]
               INNER JOIN [dbo].[Name] n ON cm.[SyncContactID] = n.[ID] 
               INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = n.[MEMBER_TYPE]
               INNER JOIN [dbo].[GroupTypeRef] gt ON gt.[GroupTypeName] = 'Member Type Security'
               INNER JOIN [dbo].[GroupMain] g ON g.[GroupTypeKey] = gt.[GroupTypeKey] AND g.[Name] = mt.[DESCRIPTION]
           AND NOT EXISTS (SELECT 1 FROM [dbo].[GroupMember] gm WHERE gm.GroupKey = g.GroupKey AND gm.[MemberContactKey] = cm.[ContactKey])

    SET NOCOUNT OFF
END


GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_UserMain_Update]'))
    DROP TRIGGER [dbo].[asi_UserMain_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER [dbo].[asi_UserMain_Update]
   ON [dbo].[UserMain]
   FOR UPDATE
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @groupTypeKey uniqueidentifier
    SET @groupTypeKey = '636A1E55-38BC-4A8F-AC8D-A6873D697F18'
    
    -- Delete MemberType security record if User is being disabled
    IF EXISTS (SELECT 1 FROM inserted i INNER JOIN deleted d ON i.[UserKey] = d.[UserKey] WHERE i.[IsDisabled] = 1 AND d.[IsDisabled] = 0)
    BEGIN
        DELETE gm
          FROM deleted d INNER JOIN inserted i ON d.[UserKey] = i.[UserKey]
                         INNER JOIN [dbo].[ContactMain] cm ON i.[UserKey] = cm.[ContactKey]
                         INNER JOIN [dbo].[Name] n ON cm.[SyncContactID] = n.[ID] 
                         INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = n.[MEMBER_TYPE]
                         INNER JOIN [dbo].[GroupMain] g ON g.[Name] = mt.[DESCRIPTION] AND g.[GroupTypeKey] = @groupTypeKey
                         INNER JOIN [dbo].[GroupMember] gm ON gm.[GroupKey] = g.[GroupKey] AND gm.[MemberContactKey] = cm.[ContactKey]
         WHERE i.[IsDisabled] = 1 AND d.[IsDisabled] = 0
    END
    
    -- Insert MemberType security record if User is being enabled
    IF EXISTS (SELECT 1 FROM inserted i INNER JOIN deleted d ON i.[UserKey] = d.[UserKey] WHERE i.[IsDisabled] = 0 AND d.[IsDisabled] = 1)
    BEGIN
        DECLARE @now datetime
        DECLARE @userKey uniqueidentifier
        SELECT @now = GETDATE()
        SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM'
        IF @userKey IS NULL SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

        INSERT INTO [dbo].[GroupMember] ([GroupMemberKey], [GroupKey], [MemberContactKey], [IsActive],
                                         [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                         [DropDate], [JoinDate], [MarkedForDeleteOn])
            SELECT NEWID(), g.GroupKey, i.UserKey, 1, @userKey, @now, @userKey, @now, NULL, NULL, NULL  
              FROM inserted i INNER JOIN deleted d ON i.[UserKey] = d.[UserKey]
                              INNER JOIN [dbo].[ContactMain] cm ON i.[UserKey] = cm.[ContactKey]
                              INNER JOIN [dbo].[Name] n ON cm.[SyncContactID] = n.[ID] 
                              INNER JOIN [dbo].[Member_Types] mt ON mt.[MEMBER_TYPE] = n.[MEMBER_TYPE]
                              INNER JOIN [dbo].[GroupMain] g ON g.[Name] = mt.[DESCRIPTION] AND g.[GroupTypeKey] = @groupTypeKey
             WHERE i.[IsDisabled] = 0 AND d.[IsDisabled] = 1
               AND NOT EXISTS (SELECT 1 FROM [dbo].[GroupMember] gm WHERE gm.GroupKey = g.GroupKey AND gm.MemberContactKey = cm.ContactKey)
    END
    
    SET NOCOUNT OFF
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_vIndividualExternalNetworkLogin]'))
    DROP TRIGGER [dbo].[asi_vIndividualExternalNetworkLogin]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE TRIGGER asi_vIndividualExternalNetworkLogin ON vIndividualExternalNetworkLogin
INSTEAD OF INSERT, UPDATE
AS
BEGIN
SET NOCOUNT ON
DECLARE @externalNetworkId uniqueidentifier

SET @externalNetworkId = '7373766E-102B-434F-86E3-B172A81C2AED' -- Twitter
UPDATE IndividualExternalNetwork 
   SET ExternalNetworkId = @externalNetworkId, 
       [LoginName] = i.Twitter_Login
  FROM inserted i
 WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID 
   AND i.Twitter_Login IS NOT NULL AND i.Twitter_Login != ''
INSERT INTO IndividualExternalNetwork (ExternalNetworkId, ID, LoginName)
SELECT @externalNetworkId, i.ID, i.Twitter_Login
  FROM inserted i
 WHERE NOT EXISTS (SELECT 1 FROM IndividualExternalNetwork n WHERE n.ExternalNetworkId = @externalNetworkId AND i.ID = n.ID)
   AND i.Twitter_Login IS NOT NULL AND i.Twitter_Login != ''
DELETE IndividualExternalNetwork
  FROM inserted i
 WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID
   AND (i.Twitter_Login IS NULL OR i.Twitter_Login = '')    
SET @externalNetworkId = '83678141-860B-4093-A58E-C9CB6DB459DB' -- Facebook
UPDATE IndividualExternalNetwork 
   SET ExternalNetworkId = @externalNetworkId, 
       [LoginName] = i.Facebook_Login
  FROM inserted i
 WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID 
   AND i.Facebook_Login IS NOT NULL AND i.Facebook_Login != ''
INSERT INTO IndividualExternalNetwork (ExternalNetworkId, ID, LoginName)
SELECT @externalNetworkId, i.ID, i.Facebook_Login
  FROM inserted i
 WHERE NOT EXISTS (SELECT 1 FROM IndividualExternalNetwork n WHERE n.ExternalNetworkId = @externalNetworkId AND i.ID = n.ID)
   AND i.Facebook_Login IS NOT NULL AND i.Facebook_Login != ''
DELETE IndividualExternalNetwork
  FROM inserted i
 WHERE ExternalNetworkId = @externalNetworkId AND i.ID = IndividualExternalNetwork.ID
   AND (i.Facebook_Login IS NULL OR i.Facebook_Login = '')    
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Users_Insert_Update_Delete]'))
    DROP TRIGGER [dbo].[Users_Insert_Update_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =============================================
-- Author:		Paul Bradshaw
-- Create date: 23-Aug-2012
-- Description:	Keep Staff Group(s) up to date
-- =============================================
CREATE TRIGGER Users_Insert_Update_Delete
   ON  [dbo].[Users] 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

    DECLARE @now datetime
    DECLARE @managerKey uniqueidentifier

    SELECT @now = GETDATE()
    SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

    -- Add new Staff to ALL Staff Group
    INSERT INTO [dbo].[GroupMember] ([GroupMemberKey],[GroupKey],[MemberContactKey],[IsActive],
                                     [CreatedByUserKey],[CreatedOn],[UpdatedByUserKey],[UpdatedOn])
        SELECT NEWID(), '3BAF4ED8-ADA2-4F8E-913D-82C6BC809A63', um.UserKey, 1,
               @managerKey, @now, @managerKey, @now
          FROM inserted i
               LEFT OUTER JOIN deleted d ON i.UserId = d.UserId
               INNER JOIN [dbo].[Users] u on i.UserId = u.UserId
               INNER JOIN [dbo].[UserMain] um ON u.UserId = um.UserId
               LEFT OUTER JOIN [dbo].[GroupMember] gm ON um.[UserKey] = gm.[MemberContactKey] AND gm.[GroupKey] = '3BAF4ED8-ADA2-4F8E-913D-82C6BC809A63'
         WHERE d.UserId IS NULL AND um.IsDisabled = 0 AND gm.[MemberContactKey] IS NULL

    -- Remove old Staff from All Staff Group
    DELETE gm
      FROM deleted d
           LEFT OUTER JOIN inserted i ON d.UserId = i.UserId
           INNER JOIN [dbo].[UserMain] um ON d.UserId = um.UserId
           INNER JOIN [dbo].[GroupMember] gm ON um.UserKey = gm.[MemberContactKey] AND gm.GroupKey = '3BAF4ED8-ADA2-4F8E-913D-82C6BC809A63'
     WHERE i.UserId IS NULL AND um.IsDisabled = 0

    -- Casual Staff
    INSERT INTO [dbo].[GroupMember] ([GroupMemberKey],[GroupKey],[MemberContactKey],[IsActive],
                                     [CreatedByUserKey],[CreatedOn],[UpdatedByUserKey],[UpdatedOn])
        SELECT NEWID(), '35D9A69C-0E0D-416C-A59D-9A948F6EBBAB', um.UserKey, 1,
               @managerKey, @now, @managerKey, @now
          FROM inserted i
               LEFT OUTER JOIN deleted d ON i.UserId = d.UserId
               INNER JOIN [dbo].[Users] u on i.UserId = u.UserId
               INNER JOIN [dbo].[UserMain] um ON u.UserId = um.UserId
               LEFT OUTER JOIN [dbo].[GroupMember] gm ON um.[UserKey] = gm.[MemberContactKey] AND gm.[GroupKey] = '35D9A69C-0E0D-416C-A59D-9A948F6EBBAB'
         WHERE d.UserId IS NULL AND u.IsCasualUser = 1 AND um.IsDisabled = 0 AND gm.[MemberContactKey] IS NULL

    -- Remove old Staff from Casual Staff Group
    DELETE gm
      FROM deleted d
           LEFT OUTER JOIN inserted i ON d.UserId = i.UserId
           INNER JOIN [dbo].[UserMain] um ON d.UserId = um.UserId
           INNER JOIN [dbo].[GroupMember] gm ON um.UserKey = gm.[MemberContactKey] AND gm.GroupKey = '35D9A69C-0E0D-416C-A59D-9A948F6EBBAB'
     WHERE i.UserId IS NULL AND d.IsCasualUser = 1 AND um.IsDisabled = 0

    -- Full Staff
    INSERT INTO [dbo].[GroupMember] ([GroupMemberKey],[GroupKey],[MemberContactKey],[IsActive],
                                     [CreatedByUserKey],[CreatedOn],[UpdatedByUserKey],[UpdatedOn])
        SELECT NEWID(), '6E52226C-89E7-4682-A7E9-B691C42E4664', um.UserKey, 1,
               @managerKey, @now, @managerKey, @now
          FROM inserted i
               LEFT OUTER JOIN deleted d ON i.UserId = d.UserId
               INNER JOIN [dbo].[Users] u on i.UserId = u.UserId
               INNER JOIN [dbo].[UserMain] um ON u.UserId = um.UserId
               LEFT OUTER JOIN [dbo].[GroupMember] gm ON um.[UserKey] = gm.[MemberContactKey] AND gm.[GroupKey] = '6E52226C-89E7-4682-A7E9-B691C42E4664'
         WHERE d.UserId IS NULL AND u.IsCasualUser = 0 AND um.IsDisabled = 0 AND gm.[MemberContactKey] IS NULL

    -- Remove old Staff from Full Staff Group
    DELETE gm
      FROM deleted d
           LEFT OUTER JOIN inserted i ON d.UserId = i.UserId
           INNER JOIN [dbo].[UserMain] um ON d.UserId = um.UserId
           INNER JOIN [dbo].[GroupMember] gm ON um.UserKey = gm.[MemberContactKey] AND gm.GroupKey = '6E52226C-89E7-4682-A7E9-B691C42E4664'
     WHERE i.UserId IS NULL AND d.IsCasualUser = 0 AND um.IsDisabled = 0

END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCsName_Staff_Delete]'))
    DROP TRIGGER [dbo].[vUDBOCsName_Staff_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCsName_Staff_Delete]
ON [dbo].[vUDBOCsName_Staff]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'CsName_Staff'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCsName_Staff_Insert]'))
    DROP TRIGGER [dbo].[vUDBOCsName_Staff_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCsName_Staff_Insert]
ON [dbo].[vUDBOCsName_Staff]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert HoursPerWeek
    IF UPDATE([HoursPerWeek])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyIntValue])
            SELECT 'CsName_Staff', 'HoursPerWeek', [ContactKey], '00000000-0000-0000-0000-000000000000', [HoursPerWeek]
              FROM inserted

    -- Insert Title
    IF UPDATE([Title])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CsName_Staff', 'Title', [ContactKey], '00000000-0000-0000-0000-000000000000', [Title]
              FROM inserted

    -- Insert IsVolunteer
    IF UPDATE([IsVolunteer])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'CsName_Staff', 'IsVolunteer', [ContactKey], '00000000-0000-0000-0000-000000000000', [IsVolunteer]
              FROM inserted

    -- Insert IsSalesman
    IF UPDATE([IsSalesman])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'CsName_Staff', 'IsSalesman', [ContactKey], '00000000-0000-0000-0000-000000000000', [IsSalesman]
              FROM inserted

    -- Insert Description
    IF UPDATE([Description])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CsName_Staff', 'Description', [ContactKey], '00000000-0000-0000-0000-000000000000', [Description]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCsName_Staff_Update]'))
    DROP TRIGGER [dbo].[vUDBOCsName_Staff_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCsName_Staff_Update]
ON [dbo].[vUDBOCsName_Staff]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([HoursPerWeek])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyIntValue] = i.[HoursPerWeek]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'HoursPerWeek' AND i.[HoursPerWeek] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyIntValue])
            SELECT 'CsName_Staff', 'HoursPerWeek', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[HoursPerWeek]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[HoursPerWeek] IS NOT NULL AND d.[HoursPerWeek] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CsName_Staff' AND s.[PropertyName] = 'HoursPerWeek' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'HoursPerWeek' AND i.[HoursPerWeek] IS NULL
    END

    IF UPDATE([Title])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Title]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'Title' AND i.[Title] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CsName_Staff', 'Title', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Title]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Title] IS NOT NULL AND d.[Title] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CsName_Staff' AND s.[PropertyName] = 'Title' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'Title' AND i.[Title] IS NULL
    END

    IF UPDATE([IsVolunteer])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[IsVolunteer]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'IsVolunteer' AND i.[IsVolunteer] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'CsName_Staff', 'IsVolunteer', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[IsVolunteer]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[IsVolunteer] IS NOT NULL AND d.[IsVolunteer] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CsName_Staff' AND s.[PropertyName] = 'IsVolunteer' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'IsVolunteer' AND i.[IsVolunteer] IS NULL
    END

    IF UPDATE([IsSalesman])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[IsSalesman]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'IsSalesman' AND i.[IsSalesman] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'CsName_Staff', 'IsSalesman', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[IsSalesman]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[IsSalesman] IS NOT NULL AND d.[IsSalesman] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CsName_Staff' AND s.[PropertyName] = 'IsSalesman' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'IsSalesman' AND i.[IsSalesman] IS NULL
    END

    IF UPDATE([Description])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Description]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'Description' AND i.[Description] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CsName_Staff', 'Description', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Description]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Description] IS NOT NULL AND d.[Description] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CsName_Staff' AND s.[PropertyName] = 'Description' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CsName_Staff' AND t.[PropertyName] = 'Description' AND i.[Description] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCultivatingFor_Delete]'))
    DROP TRIGGER [dbo].[vUDBOCultivatingFor_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCultivatingFor_Delete]
ON [dbo].[vUDBOCultivatingFor]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'CultivatingFor'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCultivatingFor_Insert]'))
    DROP TRIGGER [dbo].[vUDBOCultivatingFor_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCultivatingFor_Insert]
ON [dbo].[vUDBOCultivatingFor]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert Quality
    IF UPDATE([Quality])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'Quality', [ContactKey], '00000000-0000-0000-0000-000000000000', [Quality]
              FROM inserted

    -- Insert EstimatedValue
    IF UPDATE([EstimatedValue])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyDecimalValue])
            SELECT 'CultivatingFor', 'EstimatedValue', [ContactKey], '00000000-0000-0000-0000-000000000000', [EstimatedValue]
              FROM inserted

    -- Insert GiftType
    IF UPDATE([GiftType])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'GiftType', [ContactKey], '00000000-0000-0000-0000-000000000000', [GiftType]
              FROM inserted

    -- Insert Note
    IF UPDATE([Note])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'Note', [ContactKey], '00000000-0000-0000-0000-000000000000', [Note]
              FROM inserted

    -- Insert PlannedAskDate
    IF UPDATE([PlannedAskDate])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyDateTimeValue])
            SELECT 'CultivatingFor', 'PlannedAskDate', [ContactKey], '00000000-0000-0000-0000-000000000000', [PlannedAskDate]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCultivatingFor_Update]'))
    DROP TRIGGER [dbo].[vUDBOCultivatingFor_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOCultivatingFor_Update]
ON [dbo].[vUDBOCultivatingFor]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([Quality])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Quality]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'Quality' AND i.[Quality] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'Quality', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Quality]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Quality] IS NOT NULL AND d.[Quality] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivatingFor' AND s.[PropertyName] = 'Quality' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'Quality' AND i.[Quality] IS NULL
    END

    IF UPDATE([EstimatedValue])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyDecimalValue] = i.[EstimatedValue]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'EstimatedValue' AND i.[EstimatedValue] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyDecimalValue])
            SELECT 'CultivatingFor', 'EstimatedValue', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[EstimatedValue]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[EstimatedValue] IS NOT NULL AND d.[EstimatedValue] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivatingFor' AND s.[PropertyName] = 'EstimatedValue' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'EstimatedValue' AND i.[EstimatedValue] IS NULL
    END

    IF UPDATE([GiftType])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[GiftType]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'GiftType' AND i.[GiftType] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'GiftType', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[GiftType]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[GiftType] IS NOT NULL AND d.[GiftType] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivatingFor' AND s.[PropertyName] = 'GiftType' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'GiftType' AND i.[GiftType] IS NULL
    END

    IF UPDATE([Note])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Note]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'Note' AND i.[Note] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'CultivatingFor', 'Note', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Note]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Note] IS NOT NULL AND d.[Note] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivatingFor' AND s.[PropertyName] = 'Note' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'Note' AND i.[Note] IS NULL
    END

    IF UPDATE([PlannedAskDate])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyDateTimeValue] = i.[PlannedAskDate]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'PlannedAskDate' AND i.[PlannedAskDate] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyDateTimeValue])
            SELECT 'CultivatingFor', 'PlannedAskDate', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[PlannedAskDate]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[PlannedAskDate] IS NOT NULL AND d.[PlannedAskDate] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivatingFor' AND s.[PropertyName] = 'PlannedAskDate' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'CultivatingFor' AND t.[PropertyName] = 'PlannedAskDate' AND i.[PlannedAskDate] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOName_FR_Delete]'))
    DROP TRIGGER [dbo].[vUDBOName_FR_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOName_FR_Delete]
ON [dbo].[vUDBOName_FR]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'Name_FR'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOName_FR_Insert]'))
    DROP TRIGGER [dbo].[vUDBOName_FR_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOName_FR_Insert]
ON [dbo].[vUDBOName_FR]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert DO_NOT_SOLICT
    IF UPDATE([DO_NOT_SOLICT])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_SOLICT', [ContactKey], '00000000-0000-0000-0000-000000000000', [DO_NOT_SOLICT]
              FROM inserted

    -- Insert DO_NOT_SELL
    IF UPDATE([DO_NOT_SELL])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_SELL', [ContactKey], '00000000-0000-0000-0000-000000000000', [DO_NOT_SELL]
              FROM inserted

    -- Insert DO_NOT_EMAIL
    IF UPDATE([DO_NOT_EMAIL])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_EMAIL', [ContactKey], '00000000-0000-0000-0000-000000000000', [DO_NOT_EMAIL]
              FROM inserted

    -- Insert DO_NOT_PHONE
    IF UPDATE([DO_NOT_PHONE])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_PHONE', [ContactKey], '00000000-0000-0000-0000-000000000000', [DO_NOT_PHONE]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOName_FR_Update]'))
    DROP TRIGGER [dbo].[vUDBOName_FR_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOName_FR_Update]
ON [dbo].[vUDBOName_FR]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([DO_NOT_SOLICT])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[DO_NOT_SOLICT]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_SOLICT' AND i.[DO_NOT_SOLICT] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_SOLICT', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[DO_NOT_SOLICT]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[DO_NOT_SOLICT] IS NOT NULL AND d.[DO_NOT_SOLICT] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Name_FR' AND s.[PropertyName] = 'DO_NOT_SOLICT' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_SOLICT' AND i.[DO_NOT_SOLICT] IS NULL
    END

    IF UPDATE([DO_NOT_SELL])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[DO_NOT_SELL]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_SELL' AND i.[DO_NOT_SELL] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_SELL', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[DO_NOT_SELL]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[DO_NOT_SELL] IS NOT NULL AND d.[DO_NOT_SELL] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Name_FR' AND s.[PropertyName] = 'DO_NOT_SELL' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_SELL' AND i.[DO_NOT_SELL] IS NULL
    END

    IF UPDATE([DO_NOT_EMAIL])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[DO_NOT_EMAIL]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_EMAIL' AND i.[DO_NOT_EMAIL] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_EMAIL', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[DO_NOT_EMAIL]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[DO_NOT_EMAIL] IS NOT NULL AND d.[DO_NOT_EMAIL] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Name_FR' AND s.[PropertyName] = 'DO_NOT_EMAIL' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_EMAIL' AND i.[DO_NOT_EMAIL] IS NULL
    END

    IF UPDATE([DO_NOT_PHONE])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[DO_NOT_PHONE]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_PHONE' AND i.[DO_NOT_PHONE] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Name_FR', 'DO_NOT_PHONE', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[DO_NOT_PHONE]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[DO_NOT_PHONE] IS NOT NULL AND d.[DO_NOT_PHONE] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Name_FR' AND s.[PropertyName] = 'DO_NOT_PHONE' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Name_FR' AND t.[PropertyName] = 'DO_NOT_PHONE' AND i.[DO_NOT_PHONE] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOProfile_Page_Delete]'))
    DROP TRIGGER [dbo].[vUDBOProfile_Page_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOProfile_Page_Delete]
ON [dbo].[vUDBOProfile_Page]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'Profile_Page'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOProfile_Page_Insert]'))
    DROP TRIGGER [dbo].[vUDBOProfile_Page_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOProfile_Page_Insert]
ON [dbo].[vUDBOProfile_Page]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert Type
    IF UPDATE([Type])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Type', [ContactKey], '00000000-0000-0000-0000-000000000000', [Type]
              FROM inserted

    -- Insert CompanySize
    IF UPDATE([CompanySize])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'CompanySize', [ContactKey], '00000000-0000-0000-0000-000000000000', [CompanySize]
              FROM inserted

    -- Insert Founded
    IF UPDATE([Founded])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Founded', [ContactKey], '00000000-0000-0000-0000-000000000000', [Founded]
              FROM inserted

    -- Insert Facebook
    IF UPDATE([Facebook])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Facebook', [ContactKey], '00000000-0000-0000-0000-000000000000', [Facebook]
              FROM inserted

    -- Insert LinkedIn
    IF UPDATE([LinkedIn])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'LinkedIn', [ContactKey], '00000000-0000-0000-0000-000000000000', [LinkedIn]
              FROM inserted

    -- Insert Education
    IF UPDATE([Education])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Education', [ContactKey], '00000000-0000-0000-0000-000000000000', [Education]
              FROM inserted

    -- Insert PastExperience
    IF UPDATE([PastExperience])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'PastExperience', [ContactKey], '00000000-0000-0000-0000-000000000000', [PastExperience]
              FROM inserted

    -- Insert CurrentPosition
    IF UPDATE([CurrentPosition])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'CurrentPosition', [ContactKey], '00000000-0000-0000-0000-000000000000', [CurrentPosition]
              FROM inserted

    -- Insert About
    IF UPDATE([About])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'About', [ContactKey], '00000000-0000-0000-0000-000000000000', [About]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOProfile_Page_Update]'))
    DROP TRIGGER [dbo].[vUDBOProfile_Page_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOProfile_Page_Update]
ON [dbo].[vUDBOProfile_Page]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([Type])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Type]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Type' AND i.[Type] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Type', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Type]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Type] IS NOT NULL AND d.[Type] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'Type' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Type' AND i.[Type] IS NULL
    END

    IF UPDATE([CompanySize])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[CompanySize]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'CompanySize' AND i.[CompanySize] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'CompanySize', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[CompanySize]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[CompanySize] IS NOT NULL AND d.[CompanySize] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'CompanySize' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'CompanySize' AND i.[CompanySize] IS NULL
    END

    IF UPDATE([Founded])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Founded]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Founded' AND i.[Founded] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Founded', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Founded]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Founded] IS NOT NULL AND d.[Founded] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'Founded' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Founded' AND i.[Founded] IS NULL
    END

    IF UPDATE([Facebook])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Facebook]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Facebook' AND i.[Facebook] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Facebook', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Facebook]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Facebook] IS NOT NULL AND d.[Facebook] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'Facebook' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Facebook' AND i.[Facebook] IS NULL
    END

    IF UPDATE([LinkedIn])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[LinkedIn]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'LinkedIn' AND i.[LinkedIn] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'LinkedIn', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[LinkedIn]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[LinkedIn] IS NOT NULL AND d.[LinkedIn] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'LinkedIn' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'LinkedIn' AND i.[LinkedIn] IS NULL
    END

    IF UPDATE([Education])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Education]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Education' AND i.[Education] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'Education', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Education]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[Education] IS NOT NULL AND d.[Education] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'Education' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'Education' AND i.[Education] IS NULL
    END

    IF UPDATE([PastExperience])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[PastExperience]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'PastExperience' AND i.[PastExperience] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'PastExperience', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[PastExperience]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[PastExperience] IS NOT NULL AND d.[PastExperience] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'PastExperience' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'PastExperience' AND i.[PastExperience] IS NULL
    END

    IF UPDATE([CurrentPosition])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[CurrentPosition]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'CurrentPosition' AND i.[CurrentPosition] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'CurrentPosition', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[CurrentPosition]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[CurrentPosition] IS NOT NULL AND d.[CurrentPosition] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'CurrentPosition' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'CurrentPosition' AND i.[CurrentPosition] IS NULL
    END

    IF UPDATE([About])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[About]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'About' AND i.[About] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'Profile_Page', 'About', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[About]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[About] IS NOT NULL AND d.[About] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'Profile_Page' AND s.[PropertyName] = 'About' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'Profile_Page' AND t.[PropertyName] = 'About' AND i.[About] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOSocialNetworkLinks_Delete]'))
    DROP TRIGGER [dbo].[vUDBOSocialNetworkLinks_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOSocialNetworkLinks_Delete]
ON [dbo].[vUDBOSocialNetworkLinks]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'SocialNetworkLinks'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOSocialNetworkLinks_Insert]'))
    DROP TRIGGER [dbo].[vUDBOSocialNetworkLinks_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOSocialNetworkLinks_Insert]
ON [dbo].[vUDBOSocialNetworkLinks]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert FacebookId
    IF UPDATE([FacebookId])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'SocialNetworkLinks', 'FacebookId', [ContactKey], '00000000-0000-0000-0000-000000000000', [FacebookId]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOSocialNetworkLinks_Update]'))
    DROP TRIGGER [dbo].[vUDBOSocialNetworkLinks_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOSocialNetworkLinks_Update]
ON [dbo].[vUDBOSocialNetworkLinks]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([FacebookId])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[FacebookId]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'SocialNetworkLinks' AND t.[PropertyName] = 'FacebookId' AND i.[FacebookId] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'SocialNetworkLinks', 'FacebookId', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[FacebookId]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[FacebookId] IS NOT NULL AND d.[FacebookId] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'SocialNetworkLinks' AND s.[PropertyName] = 'FacebookId' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'SocialNetworkLinks' AND t.[PropertyName] = 'FacebookId' AND i.[FacebookId] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOVolunteersInterests_Delete]'))
    DROP TRIGGER [dbo].[vUDBOVolunteersInterests_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOVolunteersInterests_Delete]
ON [dbo].[vUDBOVolunteersInterests]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedSingleInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE t.[TableName] = 'VolunteersInterests'
    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOVolunteersInterests_Insert]'))
    DROP TRIGGER [dbo].[vUDBOVolunteersInterests_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOVolunteersInterests_Insert]
ON [dbo].[vUDBOVolunteersInterests]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    -- Insert EmergencyContact
    IF UPDATE([EmergencyContact])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'EmergencyContact', [ContactKey], '00000000-0000-0000-0000-000000000000', [EmergencyContact]
              FROM inserted

    -- Insert CarMakeAndModel
    IF UPDATE([CarMakeAndModel])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'CarMakeAndModel', [ContactKey], '00000000-0000-0000-0000-000000000000', [CarMakeAndModel]
              FROM inserted

    -- Insert FridayAM
    IF UPDATE([FridayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'FridayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [FridayAM]
              FROM inserted

    -- Insert FridayPM
    IF UPDATE([FridayPM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'FridayPM', [ContactKey], '00000000-0000-0000-0000-000000000000', [FridayPM]
              FROM inserted

    -- Insert LicensePlateNumber
    IF UPDATE([LicensePlateNumber])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'LicensePlateNumber', [ContactKey], '00000000-0000-0000-0000-000000000000', [LicensePlateNumber]
              FROM inserted

    -- Insert MondayAM
    IF UPDATE([MondayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'MondayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [MondayAM]
              FROM inserted

    -- Insert MondayPM
    IF UPDATE([MondayPM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'MondayPM', [ContactKey], '00000000-0000-0000-0000-000000000000', [MondayPM]
              FROM inserted

    -- Insert SaturdayAM
    IF UPDATE([SaturdayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'SaturdayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [SaturdayAM]
              FROM inserted

    -- Insert SundayAM
    IF UPDATE([SundayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'SundayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [SundayAM]
              FROM inserted

    -- Insert ThursdayAM
    IF UPDATE([ThursdayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'ThursdayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [ThursdayAM]
              FROM inserted

    -- Insert ThursdayPM
    IF UPDATE([ThursdayPM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'ThursdayPM', [ContactKey], '00000000-0000-0000-0000-000000000000', [ThursdayPM]
              FROM inserted

    -- Insert TuesdayAM
    IF UPDATE([TuesdayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'TuesdayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [TuesdayAM]
              FROM inserted

    -- Insert TuesdayPM
    IF UPDATE([TuesdayPM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'TuesdayPM', [ContactKey], '00000000-0000-0000-0000-000000000000', [TuesdayPM]
              FROM inserted

    -- Insert WednesdayAM
    IF UPDATE([WednesdayAM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'WednesdayAM', [ContactKey], '00000000-0000-0000-0000-000000000000', [WednesdayAM]
              FROM inserted

    -- Insert WednesdayPM
    IF UPDATE([WednesdayPM])
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'WednesdayPM', [ContactKey], '00000000-0000-0000-0000-000000000000', [WednesdayPM]
              FROM inserted

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOVolunteersInterests_Update]'))
    DROP TRIGGER [dbo].[vUDBOVolunteersInterests_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDBOVolunteersInterests_Update]
ON [dbo].[vUDBOVolunteersInterests]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([EmergencyContact])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[EmergencyContact]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'EmergencyContact' AND i.[EmergencyContact] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'EmergencyContact', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[EmergencyContact]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[EmergencyContact] IS NOT NULL AND d.[EmergencyContact] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'EmergencyContact' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'EmergencyContact' AND i.[EmergencyContact] IS NULL
    END

    IF UPDATE([CarMakeAndModel])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[CarMakeAndModel]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'CarMakeAndModel' AND i.[CarMakeAndModel] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'CarMakeAndModel', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[CarMakeAndModel]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[CarMakeAndModel] IS NOT NULL AND d.[CarMakeAndModel] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'CarMakeAndModel' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'CarMakeAndModel' AND i.[CarMakeAndModel] IS NULL
    END

    IF UPDATE([FridayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[FridayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'FridayAM' AND i.[FridayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'FridayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[FridayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[FridayAM] IS NOT NULL AND d.[FridayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'FridayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'FridayAM' AND i.[FridayAM] IS NULL
    END

    IF UPDATE([FridayPM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[FridayPM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'FridayPM' AND i.[FridayPM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'FridayPM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[FridayPM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[FridayPM] IS NOT NULL AND d.[FridayPM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'FridayPM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'FridayPM' AND i.[FridayPM] IS NULL
    END

    IF UPDATE([LicensePlateNumber])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[LicensePlateNumber]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'LicensePlateNumber' AND i.[LicensePlateNumber] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyStringValue])
            SELECT 'VolunteersInterests', 'LicensePlateNumber', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[LicensePlateNumber]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[LicensePlateNumber] IS NOT NULL AND d.[LicensePlateNumber] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'LicensePlateNumber' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'LicensePlateNumber' AND i.[LicensePlateNumber] IS NULL
    END

    IF UPDATE([MondayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[MondayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'MondayAM' AND i.[MondayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'MondayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[MondayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[MondayAM] IS NOT NULL AND d.[MondayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'MondayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'MondayAM' AND i.[MondayAM] IS NULL
    END

    IF UPDATE([MondayPM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[MondayPM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'MondayPM' AND i.[MondayPM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'MondayPM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[MondayPM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[MondayPM] IS NOT NULL AND d.[MondayPM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'MondayPM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'MondayPM' AND i.[MondayPM] IS NULL
    END

    IF UPDATE([SaturdayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[SaturdayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'SaturdayAM' AND i.[SaturdayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'SaturdayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[SaturdayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[SaturdayAM] IS NOT NULL AND d.[SaturdayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'SaturdayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'SaturdayAM' AND i.[SaturdayAM] IS NULL
    END

    IF UPDATE([SundayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[SundayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'SundayAM' AND i.[SundayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'SundayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[SundayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[SundayAM] IS NOT NULL AND d.[SundayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'SundayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'SundayAM' AND i.[SundayAM] IS NULL
    END

    IF UPDATE([ThursdayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[ThursdayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'ThursdayAM' AND i.[ThursdayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'ThursdayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[ThursdayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[ThursdayAM] IS NOT NULL AND d.[ThursdayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'ThursdayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'ThursdayAM' AND i.[ThursdayAM] IS NULL
    END

    IF UPDATE([ThursdayPM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[ThursdayPM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'ThursdayPM' AND i.[ThursdayPM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'ThursdayPM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[ThursdayPM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[ThursdayPM] IS NOT NULL AND d.[ThursdayPM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'ThursdayPM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'ThursdayPM' AND i.[ThursdayPM] IS NULL
    END

    IF UPDATE([TuesdayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[TuesdayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'TuesdayAM' AND i.[TuesdayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'TuesdayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[TuesdayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[TuesdayAM] IS NOT NULL AND d.[TuesdayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'TuesdayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'TuesdayAM' AND i.[TuesdayAM] IS NULL
    END

    IF UPDATE([TuesdayPM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[TuesdayPM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'TuesdayPM' AND i.[TuesdayPM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'TuesdayPM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[TuesdayPM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[TuesdayPM] IS NOT NULL AND d.[TuesdayPM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'TuesdayPM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'TuesdayPM' AND i.[TuesdayPM] IS NULL
    END

    IF UPDATE([WednesdayAM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[WednesdayAM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'WednesdayAM' AND i.[WednesdayAM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'WednesdayAM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[WednesdayAM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[WednesdayAM] IS NOT NULL AND d.[WednesdayAM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'WednesdayAM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'WednesdayAM' AND i.[WednesdayAM] IS NULL
    END

    IF UPDATE([WednesdayPM])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyBooleanValue] = i.[WednesdayPM]
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'WednesdayPM' AND i.[WednesdayPM] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedSingleInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [PropertyBooleanValue])
            SELECT 'VolunteersInterests', 'WednesdayPM', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[WednesdayPM]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey]
             WHERE i.[WednesdayPM] IS NOT NULL AND d.[WednesdayPM] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedSingleInstanceProperty] s
                                    WHERE s.[TableName] = 'VolunteersInterests' AND s.[PropertyName] = 'WednesdayPM' AND s.[RowID] = i.[ContactKey])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedSingleInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey]
         WHERE t.[TableName] = 'VolunteersInterests' AND t.[PropertyName] = 'WednesdayPM' AND i.[WednesdayPM] IS NULL
    END

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDMBOCultivationActivity_Delete]'))
    DROP TRIGGER [dbo].[vUDMBOCultivationActivity_Delete]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDMBOCultivationActivity_Delete]
ON [dbo].[vUDMBOCultivationActivity]
INSTEAD OF DELETE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION
    DELETE t
      FROM deleted d
           INNER JOIN [dbo].[UserDefinedMultiInstanceProperty] t ON d.[ContactKey] = t.[RowID]
     WHERE d.[Ordinal] = t.[RowSequence]  AND t.[TableName] = 'CultivationActivity'
    COMMIT TRANSACTION
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDMBOCultivationActivity_Insert]'))
    DROP TRIGGER [dbo].[vUDMBOCultivationActivity_Insert]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDMBOCultivationActivity_Insert]
ON [dbo].[vUDMBOCultivationActivity]
INSTEAD OF INSERT
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    DECLARE @seq TABLE (
        [ContactKey] nvarchar(16),
        [SequenceBase] int
    )
    DECLARE @ins TABLE (
        [ContactKey] nvarchar(16),
        [Ordinal] int,
        [FollowUpNote] nvarchar(400),
        [FollowUpDate] datetime,
        [Note] nvarchar(400),
        [Date] datetime,
        [TypeOfActivity] nvarchar(80)
    )

    -- Get the sequence base in case additional rows are being added
    INSERT INTO @seq([ContactKey], [SequenceBase])
        SELECT i.[ContactKey], CASE WHEN MAX(t.[RowSequence]) IS NULL THEN 0 ELSE MAX(t.[RowSequence]) END
          FROM inserted i
               LEFT OUTER JOIN [dbo].[UserDefinedMultiInstanceProperty] t ON i.[ContactKey] = t.[RowID]
                                                                          AND t.TableName = 'CultivationActivity' OR t.TableName IS NULL
         GROUP BY i.[ContactKey]

    -- Grab inserted table and assign new sequence ordinals (primary keys MUST be specified by caller)
    INSERT INTO @ins ([ContactKey], [Ordinal], [FollowUpNote], [FollowUpDate], [Note], [Date], [TypeOfActivity])
        SELECT i.[ContactKey], s.[SequenceBase] + ROW_NUMBER() OVER (PARTITION BY i.[ContactKey] ORDER BY i.Ordinal),
               [FollowUpNote], [FollowUpDate], [Note], [Date], [TypeOfActivity]
          FROM inserted i
               INNER JOIN @seq s ON i.[ContactKey] = s.[ContactKey]
         ORDER BY i.Ordinal

    -- Insert FollowUpNote
    IF UPDATE([FollowUpNote])
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'FollowUpNote', [ContactKey], '00000000-0000-0000-0000-000000000000', [Ordinal], [FollowUpNote]
              FROM @ins

    -- Insert FollowUpDate
    IF UPDATE([FollowUpDate])
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyDateTimeValue])
            SELECT 'CultivationActivity', 'FollowUpDate', [ContactKey], '00000000-0000-0000-0000-000000000000', [Ordinal], [FollowUpDate]
              FROM @ins

    -- Insert Note
    IF UPDATE([Note])
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'Note', [ContactKey], '00000000-0000-0000-0000-000000000000', [Ordinal], [Note]
              FROM @ins

    -- Insert Date
    IF UPDATE([Date])
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyDateTimeValue])
            SELECT 'CultivationActivity', 'Date', [ContactKey], '00000000-0000-0000-0000-000000000000', [Ordinal], [Date]
              FROM @ins

    -- Insert TypeOfActivity
    IF UPDATE([TypeOfActivity])
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'TypeOfActivity', [ContactKey], '00000000-0000-0000-0000-000000000000', [Ordinal], [TypeOfActivity]
              FROM @ins

    COMMIT TRANSACTION
    SET ANSI_WARNINGS ON
END

GO


IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[vUDMBOCultivationActivity_Update]'))
    DROP TRIGGER [dbo].[vUDMBOCultivationActivity_Update]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE TRIGGER [vUDMBOCultivationActivity_Update]
ON [dbo].[vUDMBOCultivationActivity]
INSTEAD OF UPDATE
AS
BEGIN
    SET ANSI_WARNINGS OFF -- Required for some strange reason
    SET NOCOUNT ON
    BEGIN TRANSACTION

    IF UPDATE([FollowUpNote])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[FollowUpNote]
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'FollowUpNote' AND i.[FollowUpNote] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'FollowUpNote', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Ordinal], i.[FollowUpNote]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey] AND i.[Ordinal] = d.[Ordinal]
             WHERE i.[FollowUpNote] IS NOT NULL AND d.[FollowUpNote] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedMultiInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivationActivity' AND s.[PropertyName] = 'FollowUpNote' AND 
                                          s.[RowID] = i.[ContactKey] AND s.[RowSequence] = i.[Ordinal])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'FollowUpNote' AND i.[FollowUpNote] IS NULL
    END

    IF UPDATE([FollowUpDate])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyDateTimeValue] = i.[FollowUpDate]
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'FollowUpDate' AND i.[FollowUpDate] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyDateTimeValue])
            SELECT 'CultivationActivity', 'FollowUpDate', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Ordinal], i.[FollowUpDate]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey] AND i.[Ordinal] = d.[Ordinal]
             WHERE i.[FollowUpDate] IS NOT NULL AND d.[FollowUpDate] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedMultiInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivationActivity' AND s.[PropertyName] = 'FollowUpDate' AND 
                                          s.[RowID] = i.[ContactKey] AND s.[RowSequence] = i.[Ordinal])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'FollowUpDate' AND i.[FollowUpDate] IS NULL
    END

    IF UPDATE([Note])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[Note]
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'Note' AND i.[Note] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'Note', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Ordinal], i.[Note]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey] AND i.[Ordinal] = d.[Ordinal]
             WHERE i.[Note] IS NOT NULL AND d.[Note] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedMultiInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivationActivity' AND s.[PropertyName] = 'Note' AND 
                                          s.[RowID] = i.[ContactKey] AND s.[RowSequence] = i.[Ordinal])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'Note' AND i.[Note] IS NULL
    END

    IF UPDATE([Date])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyDateTimeValue] = i.[Date]
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'Date' AND i.[Date] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyDateTimeValue])
            SELECT 'CultivationActivity', 'Date', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Ordinal], i.[Date]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey] AND i.[Ordinal] = d.[Ordinal]
             WHERE i.[Date] IS NOT NULL AND d.[Date] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedMultiInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivationActivity' AND s.[PropertyName] = 'Date' AND 
                                          s.[RowID] = i.[ContactKey] AND s.[RowSequence] = i.[Ordinal])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'Date' AND i.[Date] IS NULL
    END

    IF UPDATE([TypeOfActivity])
    BEGIN
        -- Update row if it exists and setting to non-null
        UPDATE t
           SET t.[PropertyStringValue] = i.[TypeOfActivity]
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'TypeOfActivity' AND i.[TypeOfActivity] IS NOT NULL
        -- Insert row where property doesn't exist and setting to non-null
        INSERT INTO [dbo].[UserDefinedMultiInstanceProperty] ([TableName], [PropertyName], [RowID], [RowKey], [RowSequence], [PropertyStringValue])
            SELECT 'CultivationActivity', 'TypeOfActivity', i.[ContactKey], '00000000-0000-0000-0000-000000000000', i.[Ordinal], i.[TypeOfActivity]
              FROM inserted i INNER JOIN deleted d ON i.[ContactKey] = d.[ContactKey] AND i.[Ordinal] = d.[Ordinal]
             WHERE i.[TypeOfActivity] IS NOT NULL AND d.[TypeOfActivity] IS NULL
                   AND NOT EXISTS (SELECT 1 FROM [dbo].[UserDefinedMultiInstanceProperty] s
                                    WHERE s.[TableName] = 'CultivationActivity' AND s.[PropertyName] = 'TypeOfActivity' AND 
                                          s.[RowID] = i.[ContactKey] AND s.[RowSequence] = i.[Ordinal])
        -- Delete row if setting to null
        DELETE t
          FROM [dbo].[UserDefinedMultiInstanceProperty] t
               INNER JOIN inserted i ON t.[RowID] = i.[ContactKey] AND t.[RowSequence] = i.[Ordinal]
         WHERE t.[TableName] = 'CultivationActivity' AND t.[PropertyName] = 'TypeOfActivity' AND i.[TypeOfActivity] IS NULL
    END

    COMMIT TRANSACTION
END

GO

