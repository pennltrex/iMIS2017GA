-- Add UniformRegistry entries for DocumentMain
INSERT INTO UniformRegistry (UniformKey, ComponentKey) 
SELECT DocumentKey, (SELECT ComponentKey FROM ComponentRegistry WHERE Name = 'Document' AND InterfaceName = 'BusinessController') 
FROM DocumentMain WHERE DocumentKey NOT IN (SELECT UniformKey from UniformRegistry)
GO

-- Add UniformRegistry entries for DocumentVersion
INSERT INTO UniformRegistry (UniformKey, ComponentKey) 
SELECT DISTINCT(DocumentVersionKey), (SELECT ComponentKey FROM ComponentRegistry WHERE Name = 'DocumentVersion' AND InterfaceName = 'BusinessController') 
FROM DocumentMain WHERE DocumentVersionKey NOT IN (SELECT UniformKey from UniformRegistry)
GO

-- Update any existing createdBy and updatedBy keys for table DocumentMain 
SET NOCOUNT ON 
DECLARE @managerId uniqueidentifier 
DECLARE @sql nvarchar(1000) 
SELECT @managerId = UserKey from UserMain where UserId = 'MANAGER' 
IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'CreatedByUserKey' AND TABLE_NAME = 'DocumentMain' ) 
BEGIN 
    SET @sql = 'UPDATE t1 SET CreatedByUserKey = @managerKey FROM [DocumentMain] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.CreatedByUserKey = t2.UserKey WHERE t2.UserKey IS NULL' 
    EXEC sp_executesql @sql, N'@managerKey uniqueidentifier', @managerKey = @managerId 
END 
IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'UpdatedByUserKey' AND TABLE_NAME = 'DocumentMain' )  
BEGIN 
    SET @sql = 'UPDATE t1 SET UpdatedByUserKey = @managerKey FROM [DocumentMain] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.UpdatedByUserKey = t2.UserKey WHERE t2.UserKey IS NULL' 
    EXEC sp_executesql @sql, N'@managerKey uniqueidentifier', @managerKey = @managerId  
END 
IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'StatusCreatedByUserKey' AND TABLE_NAME = 'DocumentMain' )  
BEGIN 
    SET @sql = 'UPDATE t1 SET StatusCreatedByUserKey = @managerKey FROM [DocumentMain] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.StatusCreatedByUserKey = t2.UserKey WHERE t2.UserKey IS NULL' 
    EXEC sp_executesql @sql, N'@managerKey uniqueidentifier', @managerKey = @managerId  
END 
IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'StatusUpdatedByUserKey' AND TABLE_NAME = 'DocumentMain' )  
BEGIN 
    SET @sql = 'UPDATE t1 SET StatusUpdatedByUserKey = @managerKey FROM [DocumentMain] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.StatusUpdatedByUserKey = t2.UserKey WHERE t2.UserKey IS NULL' 
    EXEC sp_executesql @sql, N'@managerKey uniqueidentifier', @managerKey = @managerId  
END 
GO 

-- Handle Access Keys that aren't present in the local database by logging them and converting them to "Everyone Read"
SELECT CAST('WARNING: Access Key ''' + CAST(am.[AccessKey] AS nvarchar(40)) + ''' not found for ' + CHAR(10) + CHAR(13) + 
            ' WARN' + 'ING:   document: ' + dbo.asi_PublishedDocumentPath(d.DocumentVersionKey) AS nvarchar(256))
  FROM [dbo].[DocumentMain] d LEFT OUTER JOIN [dbo].[AccessMain] am ON d.[AccessKey] = am.[AccessKey]
 WHERE d.[DocumentStatusCode] = 40 AND am.[AccessKey] IS NULL
 ORDER BY dbo.asi_PublishedDocumentPath(d.DocumentVersionKey)
IF (@@ROWCOUNT <> 0)
BEGIN
    SELECT 'WARNING: The Above Documents have had their access reset to ''Everyone Read'''
END

UPDATE d
   SET d.AccessKey = '00000000-0000-0000-0000-000000000E02'
  FROM [dbo].[DocumentMain] d 
       LEFT OUTER JOIN [dbo].[AccessMain] am ON d.[AccessKey] = am.[AccessKey]
 WHERE am.[AccessKey] IS NULL
GO

-- Clean up any orphaned Hierarchy Keys
WHILE (1=1)
BEGIN
    DELETE a 
      FROM [dbo].[Hierarchy] a LEFT OUTER JOIN [dbo].[Hierarchy] b ON a.ParentHierarchyKey = b.HierarchyKey
     WHERE a.[ParentHierarchyKey] IS NOT NULL 
       AND b.[HierarchyKey] IS NULL
    IF @@ROWCOUNT = 0 BREAK
END
go

SET NOCOUNT ON
IF EXISTS (SELECT 1 FROM [dbo].[DocumentMain] d 
                  LEFT OUTER JOIN [dbo].[AccessMain] a ON d.[AccessKey] = a.[AccessKey]
                  INNER JOIN [dbo].[Hierarchy] h ON h.[UniformKey] = d.[DocumentVersionKey]
                  INNER JOIN [dbo].[HierarchyRoot] hr ON h.[RootHierarchyKey] = hr.[RootHierarchyKey]
            WHERE d.DocumentStatusCode = 40 AND a.[AccessKey] IS NULL)
BEGIN
    PRINT 'The following documents have had their Access Security set to "Everybody Read"'
    SELECT CAST(hr.[HierarchyRootDescription] AS nvarchar(25)) AS [Root], 
           CAST(dbo.asi_PublishedDocumentPath(d.[DocumentVersionKey]) AS nvarchar(100)) AS [DocumentPath], 
           d.[DocumentTypeCode] AS [DocumentType], d.[DocumentKey]
      FROM [dbo].[DocumentMain] d 
           LEFT OUTER JOIN [dbo].[AccessMain] a ON d.[AccessKey] = a.[AccessKey]
           INNER JOIN [dbo].[Hierarchy] h ON h.[UniformKey] = d.[DocumentVersionKey]
           INNER JOIN [dbo].[HierarchyRoot] hr ON h.[RootHierarchyKey] = hr.[RootHierarchyKey]
     WHERE d.DocumentStatusCode = 40 AND a.[AccessKey] IS NULL
    UPDATE d
       SET d.[AccessKey] = '00000000-0000-0000-0000-000000000E02'
      FROM [dbo].[DocumentMain] d 
           LEFT OUTER JOIN [dbo].[AccessMain] a ON d.[AccessKey] = a.[AccessKey]
           INNER JOIN [dbo].[Hierarchy] h ON h.[UniformKey] = d.[DocumentVersionKey]
           INNER JOIN [dbo].[HierarchyRoot] hr ON h.[RootHierarchyKey] = hr.[RootHierarchyKey]
     WHERE d.DocumentStatusCode = 40 AND a.[AccessKey] IS NULL
END
SET NOCOUNT OFF
GO

-- Restore FK Constraints
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_AccessMain')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_AccessMain]
	FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_AccessMain_DefaultChild')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_AccessMain_DefaultChild]
	FOREIGN KEY (DefaultChildAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_AccessMain_DefaultChild]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_DocumentStatusRef')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_DocumentStatusRef]
	FOREIGN KEY (DocumentStatusCode) REFERENCES [DocumentStatusRef] (DocumentStatusCode)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_DocumentStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_DocumentTypeRef')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_DocumentTypeRef]
	FOREIGN KEY (DocumentTypeCode) REFERENCES [DocumentTypeRef] (DocumentTypeCode)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_DocumentTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UniformRegistry')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UniformRegistry]
	FOREIGN KEY (DocumentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UniformRegistry_DocumentVersionKey')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UniformRegistry_DocumentVersionKey]
	FOREIGN KEY (DocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UniformRegistry_DocumentVersionKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UserMain_CreatedBy')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_CreatedBy]
	FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UserMain_LockedBy')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_LockedBy]
	FOREIGN KEY (LockedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_LockedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UserMain_StatusUpdatedBy')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_StatusUpdatedBy]
	FOREIGN KEY (StatusUpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_StatusUpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'DocumentMain' AND CONSTRAINT_NAME = 'FK_DocumentMain_UserMain_UpdatedBy')
	ALTER TABLE [DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_UpdatedBy]
	FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'Hierarchy' AND CONSTRAINT_NAME = 'FK_Hierarchy_Hierarchy_Ancestor')
	ALTER TABLE [Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_Hierarchy_Ancestor]
	FOREIGN KEY (RootHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_Hierarchy_Ancestor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'Hierarchy' AND CONSTRAINT_NAME = 'FK_Hierarchy_Hierarchy_Parent')
	ALTER TABLE [Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_Hierarchy_Parent]
	FOREIGN KEY (ParentHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_Hierarchy_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = 'Hierarchy' AND CONSTRAINT_NAME = 'FK_Hierarchy_UniformTypeRef')
	ALTER TABLE [Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_UniformTypeRef]
	FOREIGN KEY (UniformType) REFERENCES [UniformTypeRef] (UniformType)
go
ALTER TABLE [Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_UniformTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_AccessMain')
	ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_AccessMain]
	FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_Hierarchy')
	ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_Hierarchy]
	FOREIGN KEY (RootHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_Hierarchy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_Organization')
	ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_Organization]
	FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_Organization]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_ContentDocumentKey')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_ContentDocumentKey]
    FOREIGN KEY([ContentDocumentKey]) REFERENCES [dbo].[DocumentMain] ([DocumentKey])
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PublishRequestDetail_ContentDocumentKey]
go

