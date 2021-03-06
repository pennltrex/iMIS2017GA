SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentMain' AND COLUMN_NAME = 'SystemKey')
BEGIN
    ALTER TABLE [dbo].[DocumentMain] ADD [SystemKey] uniqueidentifier NULL
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMainByPath]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentMainByPath]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/*
Gets the document data for the document at the given path INCLUDING the blob. Security IS checked. The first 
segment of the documentPath should be the DocumentRoot name. The last segment should be the DocumentName
Individual segments are separated by the forward slash (/) 
*/
CREATE PROC [dbo].[asi_DocumentMainByPath]
   @documentPath nvarchar(2000),
   @organizationKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000', -- if this is empty, we assume the user is not logged in
   @publishedOnly bit = 0,
   @ignoreLicensing bit = 0
AS
BEGIN
   DECLARE 
      @rootHierarchyKey uniqueidentifier,
      @hierarchyKey uniqueidentifier,
      @documentVersionKey uniqueidentifier,
      @documentKey uniqueidentifier

   EXEC asi_DocumentKeysByPath @documentPath, @organizationKey, @userKey, @loggedInUserGroupKey, @ignoreLicensing, @rootHierarchyKey out, @hierarchyKey out, @documentVersionKey out, @documentKey out

   IF @documentVersionKey IS NOT NULL
      SELECT TOP 1
             a.Blob,
             a.DocumentKey,
             a.DocumentVersionKey,
             a.DocumentStatusCode,
             a.DocumentName,
             a.AlternateName,
             a.DocumentDescription,
             a.DocumentTypeCode,
             a.IsSystem,
             a.ContainsChildrenFlag,
             a.AccessKey,
             a.DefaultChildAccessKey,
             a.StatusUpdatedOn,
             a.StatusUpdatedByUserKey,
             a.CreatedOn,
             a.CreatedByUserKey,
             a.UpdatedOn,
             a.UpdatedByUserKey,
             b.DocumentTypeName, 
             b.DocumentTypeDesc,
             b.DocumentIconURL,
             @hierarchyKey AS HierarchyKey
        FROM DocumentMain a INNER JOIN DocumentTypeRef b on a.DocumentTypeCode = b.DocumentTypeCode
       WHERE a.DocumentVersionKey = @documentVersionKey
         AND (a.DocumentStatusCode IN (40,60) OR @publishedOnly = 0)
         AND EXISTS(
             SELECT 1 
               FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
              WHERE AccessItem.AccessKey = a.AccessKey 
                AND UserToken.UserKey = @userKey)
       ORDER BY a.CreatedOn DESC
END


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentKeysByPath]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentKeysByPath]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/*
Given a document tree path, starting with the root, returns the RootHierarchyKey, HierarchyKey and DocumentKey of the 
end node as out parameters. Security IS checked. The parts of the path must be separated by the forward slash (/).
NOTE: The documentKey returned will be that of the latest version
*/
CREATE PROC [dbo].[asi_DocumentKeysByPath]
   @documentPath nvarchar(2000),
   @organizationKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000', -- if this is empty, we assume the user is not logged in
   @ignoreLicensing bit = 0,
   @rootHierarchyKey uniqueidentifier OUT,
   @hierarchyKey uniqueidentifier OUT,
   @documentVersionKey uniqueidentifier OUT,
   @documentKey uniqueidentifier OUT
AS
BEGIN
   DECLARE 
      @parent uniqueidentifier,
      @relatedDocumentVersionKey uniqueidentifier,
      @relatedDocumentKey uniqueidentifier,
      @relatedHierarchyKey uniqueidentifier,
      @documentRootName nvarchar(100),
      @documentName nvarchar(100),
      @ptr int,
      @documentPathWorking nvarchar(2000)
    
   SET @ptr = CHARINDEX(N'/', @documentPath)
   IF @ptr > 0
   BEGIN
      --First segment contains the root name
      SET @documentRootName = SUBSTRING(@documentPath, 1, @ptr - 1)
      SET @documentPath = SUBSTRING(@documentPath, @ptr + 1, LEN(@documentPath) - @ptr)
   END
   ELSE
   BEGIN
      -- See if it's the name of a root; if not, default to $
      IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE HierarchyRootName = @documentPath)
      BEGIN
          SET @documentRootName = @documentPath
          SET @documentPath = ''
      END
      ELSE
      BEGIN
          --No root specified so use absolute root name
          SET @documentRootName = N'$'
          IF @documentPath = N'$'
             SET @documentPath = ''
      END
   END
   -- check to make sure the root exists and the user has rights to it
   -- Updated to handle multiple roots with the same name
   DECLARE @HierarchyRoots TABLE (
       RootHierarchyKey uniqueidentifier,
       HierarchyKey uniqueidentifier,
       UniformKey uniqueidentifier,
       DocumentKey uniqueidentifier,
       Checked bit
   )
   INSERT INTO @HierarchyRoots
   SELECT a.RootHierarchyKey,
          b.HierarchyKey,
          b.UniformKey,
          c.DocumentKey,
          0
     FROM HierarchyRoot a inner join Hierarchy b on a.RootHierarchyKey = b.HierarchyKey
          left join DocumentMain c ON b.UniformKey = c.DocumentVersionKey AND c.DocumentStatusCode IN (40,60)
    WHERE a.HierarchyRootName = @documentRootName
      AND a.OrganizationKey = @organizationKey
      AND (@rootHierarchyKey IS NULL OR @rootHierarchyKey = '00000000-0000-0000-0000-000000000000' OR a.RootHierarchyKey = @rootHierarchyKey)
      AND EXISTS(
          SELECT 1 
            FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
           WHERE AccessItem.AccessKey = a.AccessKey 
             AND UserToken.UserKey = @userKey 
             AND (AccessItem.Permission&3)>0)

   WHILE @hierarchyKey IS NULL AND @documentVersionKey IS NULL AND @documentKey IS NULL AND EXISTS (SELECT 1 FROM @HierarchyRoots WHERE Checked = 0)
   BEGIN
       SET @documentPathWorking = @documentPath

       SELECT @rootHierarchyKey = RootHierarchyKey,
              @hierarchyKey = HierarchyKey,
              @documentVersionKey = UniformKey,
              @documentKey = DocumentKey
         FROM @HierarchyRoots
        WHERE Checked = 0

       -- if we can get to the root, lets go inside the path
       IF @rootHierarchyKey IS NOT NULL
       BEGIN
          UPDATE @HierarchyRoots SET Checked = 1 WHERE RootHierarchyKey = @rootHierarchyKey

          SET @hierarchyKey = @rootHierarchyKey
          SET @parent = @rootHierarchyKey
          -- loop thru the path components
          WHILE LEN(@documentPathWorking) > 0
          BEGIN
             -- separate the next part of the path from the rest
             SET @ptr = CHARINDEX(N'/', @documentPathWorking)
             IF @ptr > 0
             BEGIN
                SET @documentName = SUBSTRING(@documentPathWorking, 1, @ptr - 1)
                SET @documentPathWorking = SUBSTRING(@documentPathWorking, @ptr + 1, LEN(@documentPathWorking) - @ptr)
             END
             ELSE
             BEGIN
                SET @documentName = @documentPathWorking
                SET @documentPathWorking = N''
             END

             -- if there is still path parts left, documentName contains a folder name. Get its HierarchyKey
             IF LEN(@documentName) > 0
             BEGIN
                SET @documentKey = null
                SET @documentVersionKey = null
                SET @hierarchyKey = null

                SELECT TOP 1 @parent = Hierarchy.ParentHierarchyKey,
                       @hierarchyKey = Hierarchy.HierarchyKey,
                       @documentVersionKey = DocumentMain.DocumentVersionKey,
                       @documentKey = DocumentMain.DocumentKey,
                       @relatedDocumentVersionKey = DocumentMain.RelatedDocumentVersionKey
                  FROM Hierarchy INNER JOIN DocumentMain ON Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
                 WHERE Hierarchy.RootHierarchyKey = @rootHierarchyKey
                   AND Hierarchy.ParentHierarchyKey = @parent
                   AND DocumentMain.DocumentName = @documentName
                   AND EXISTS(
                       SELECT 1 
                         FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
                        WHERE AccessItem.AccessKey = DocumentMain.AccessKey 
                          AND UserToken.UserKey = @userKey 
                          AND (AccessItem.Permission&3)>0)
                    AND (@ignoreLicensing = 1 
                       OR NOT EXISTS (SELECT 1 FROM UniformLicense WHERE UniformKey = DocumentMain.DocumentVersionKey)
                         OR EXISTS(
                          SELECT 1 
                            FROM [dbo].[UniformLicense] INNER JOIN [dbo].[LicenseLegacyList] l ON UniformLicense.LicenseKey = l.LicenseLegacyKey
                           WHERE UniformLicense.UniformKey = DocumentMain.DocumentVersionKey))
                 ORDER BY DocumentMain.CreatedOn DESC

                IF @@ROWCOUNT = 0
                BEGIN
                   SET @parent = NULL
                   SET @documentPathWorking = NULL
                END
                ELSE
                BEGIN
                   IF (@hierarchyKey IS NOT NULL)
                      SET @parent = @hierarchyKey
                   -- get related document info if there
                   IF (@relatedDocumentVersionKey IS NOT NULL)
                   BEGIN
                      SELECT top 1 @relatedHierarchyKey = HierarchyKey, @relatedDocumentKey = DocumentMain.DocumentKey
                        FROM Hierarchy INNER JOIN DocumentMain ON Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
                       WHERE Hierarchy.RootHierarchyKey = @rootHierarchyKey
                         AND DocumentMain.DocumentVersionKey = @relatedDocumentVersionKey
                         AND EXISTS(
                             SELECT 1 
                               FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
                              WHERE AccessItem.AccessKey = DocumentMain.AccessKey 
                                AND UserToken.UserKey = @userKey 
                                AND (AccessItem.Permission&3)>0)
                        AND (@ignoreLicensing = 1 
                           OR NOT EXISTS (SELECT 1 FROM UniformLicense WHERE UniformKey = DocumentMain.DocumentVersionKey)
                             OR EXISTS(
                              SELECT 1 
                                FROM [dbo].[UniformLicense] INNER JOIN [dbo].[LicenseLegacyList] l ON UniformLicense.LicenseKey = l.LicenseLegacyKey
                               WHERE UniformLicense.UniformKey = DocumentMain.DocumentVersionKey))
                       ORDER BY DocumentMain.CreatedOn DESC

                      IF @@ROWCOUNT = 1 AND @relatedHierarchyKey IS NOT NULL
                      BEGIN
                         SET @parent = @relatedHierarchyKey
                         SET @documentKey = @relatedDocumentKey
                      END
                   END
                END
             END
          END -- WHILE LEN(@documentPathWorking) > 0
       END -- IF @rootHierarchyKey IS NOT NULL
   END -- WHILE Checked = 0END
END


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMainListByParentHierarchyKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentMainListByParentHierarchyKey]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
Retrieves a list of Documents under a particular folder by the folder's HierarchyKey. Security IS enforced.

Returns:
Everything from the DocumentMain table except the blob. Also includes DocumentTypeName, DocumentTypeDesc, 
and DocumentIconURL from DocumentTypeRef and HierarchyKey from the Hierarchy element representing the document.
*/
CREATE PROC [dbo].[asi_DocumentMainListByParentHierarchyKey]
   @parentHierarchyKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000', -- if this is empty, we assume the user is not logged in
   @publishedOnly bit = 0,
   @ignoreLicensing bit = 0
AS
BEGIN
   SELECT a.HierarchyKey,
          b.DocumentKey,
          b.DocumentVersionKey,
          b.DocumentStatusCode,
          b.DocumentName,
          b.AlternateName,
          b.DocumentDescription,
          b.DocumentTypeCode,
          b.IsSystem,
          b.ContainsChildrenFlag,
          b.RelatedDocumentVersionKey,
          b.AccessKey,
          b.DefaultChildAccessKey,
          b.StatusUpdatedOn,
          b.StatusUpdatedByUserKey,
          b.CreatedOn,
          b.CreatedByUserKey,
          b.UpdatedOn,
          b.UpdatedByUserKey,
          c.DocumentTypeName, 
          c.DocumentTypeDesc,
          c.DocumentIconURL,
          d.DocumentKey AS RelatedDocumentKey,
          d.DocumentTypeCode AS RelatedDocumentTypeCode,
          d.DocumentName AS RelatedDocumentName,
          d.AlternateName AS RelatedAlternateName,
          d.DocumentDescription AS RelatedDocumentDescription,
          e.DocumentTypeName AS RelatedDocumentTypeName, 
          e.DocumentTypeDesc AS RelatedDocumentTypeDesc,
          e.DocumentIconURL AS RelatedDocumentIconURL,
          e.ShortcutIconURL AS RelatedShortcutIconURL
     FROM [dbo].[Hierarchy] a INNER JOIN [dbo].[DocumentMain] b ON a.UniformKey = b.DocumentVersionKey
      INNER JOIN [dbo].[DocumentTypeRef] c ON b.DocumentTypeCode = c.DocumentTypeCode
          LEFT OUTER JOIN [dbo].[DocumentMain] d ON b.RelatedDocumentVersionKey = d.DocumentVersionKey
          LEFT OUTER JOIN [dbo].[DocumentTypeRef] e ON d.DocumentTypeCode = e.DocumentTypeCode
    WHERE a.ParentHierarchyKey = @parentHierarchyKey
      AND ((b.DocumentStatusCode IN (10,20,30,70) AND @publishedOnly = 0)
       OR (b.DocumentStatusCode IN (40,60) 
      AND (@publishedOnly = 1
       OR NOT EXISTS (
          SELECT 1
            FROM [dbo].[DocumentMain] f
           WHERE f.DocumentVersionKey = b.DocumentVersionKey
             AND f.DocumentStatusCode IN (10,20,30,70)))))
      AND ((d.DocumentStatusCode IN (10,20,30,70) AND @publishedOnly = 0)
       OR d.DocumentStatusCode IS NULL
       OR (d.DocumentStatusCode IN (40,60) 
      AND (@publishedOnly = 1
       OR NOT EXISTS (
          SELECT 1
            FROM [dbo].[DocumentMain] g
           WHERE g.DocumentVersionKey = d.DocumentVersionKey
             AND g.DocumentStatusCode IN (10,20,30,70)))))
      AND EXISTS(
          SELECT 1 
            FROM [dbo].[AccessItem] INNER JOIN [dbo].[UserToken] ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
           WHERE AccessItem.AccessKey = b.AccessKey 
             AND UserToken.UserKey=@userKey 
             AND (AccessItem.Permission&3)>0)
      AND (@ignoreLicensing = 1
       OR NOT EXISTS (SELECT 1 FROM UniformLicense WHERE UniformKey = b.DocumentVersionKey)
         OR EXISTS(
          SELECT 1 
            FROM [dbo].[UniformLicense] INNER JOIN [dbo].[LicenseLegacyList] l ON UniformLicense.LicenseKey = l.LicenseLegacyKey
           WHERE UniformLicense.UniformKey = b.DocumentVersionKey))
    ORDER BY a.SortOrder, b.DocumentName
END


GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentMainListByParentPath]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentMainListByParentPath]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/*
Given a path to a folder, returns all documents in that folder. Security IS checked. The first 
segment of the documentPath should be the DocumentRoot name. The last segment should be the DocumentName of the folder
for which contents are desired. Individual segments are separated by the forward slash (/) 

Returns:
Everything from the DocumentMain table except the blob. Also includes DocumentTypeName, DocumentTypeDesc, 
and DocumentIconURL from DocumentTypeRef and HierarchyKey from the Hierarchy element representing the document.
*/
CREATE PROC [dbo].[asi_DocumentMainListByParentPath]
   @documentPath nvarchar(2000),
   @organizationKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000', -- if this is empty, we assume the user is not logged in
   @publishedOnly bit = 0,
   @ignoreLicensing bit = 0
AS
BEGIN
   DECLARE
      @rootHierarchyKey uniqueidentifier,
      @hierarchyKey uniqueidentifier,
      @documentVersionKey uniqueidentifier,
      @documentKey uniqueidentifier

   EXEC asi_DocumentKeysByPath @documentPath, @organizationKey, @userKey, @loggedInUserGroupKey, @ignoreLicensing, @rootHierarchyKey out, @hierarchyKey out, @documentVersionKey out, @documentKey out

   EXEC asi_DocumentMainListByParentHierarchyKey @hierarchyKey, @userKey, @loggedInUserGroupKey, @publishedOnly, @ignoreLicensing
END


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentKeysByCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentKeysByCode]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------
-- Given a document code and RootHierarchyKey returns the HierarchyKey, 
-- DocumentVersionKey and DocumentKey of the document if it is found 
-- within the given hierarchy. Security IS checked. 
-- NOTE: The documentKey returned will be that of the latest version
-----------------------------------------------------------------------
CREATE PROC [dbo].[asi_DocumentKeysByCode]
   @documentCode nvarchar(100),
   @rootHierarchyKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000' -- if this is empty, we assume the user is not logged in
AS
BEGIN
   SELECT h.HierarchyKey,
          d.DocumentVersionKey,
          d.DocumentKey
     FROM Hierarchy h 
          INNER JOIN DocumentMain d ON h.UniformKey = d.DocumentVersionKey AND d.DocumentStatusCode IN (10,20,30,40,60)
    WHERE h.RootHierarchyKey = @rootHierarchyKey
          AND d.DocumentCode = @documentCode
          AND EXISTS(
          SELECT 1 
            FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
           WHERE AccessItem.AccessKey = d.AccessKey 
             AND UserToken.UserKey = @userKey 
             AND (AccessItem.Permission&3)>0)
    ORDER BY d.DocumentStatusCode DESC
END


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentEnsureFolder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentEnsureFolder]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/*
Given a document tree path containing only folders, starting with the root, makes sure the folder path exists by
creating any folder in the path that does not.  If all goes well, the HierarchyKey of the end folder is returned.
Null is returned if the root does not exist (it won't ALTER  roots) or if the user does not have ALTER  permission
anywhere along the way. The parts of the path must be separated by the forward slash (/) 
*/
CREATE PROC [dbo].[asi_DocumentEnsureFolder]
   @documentPath nvarchar(2000),
   @organizationKey uniqueidentifier,
   @userKey uniqueidentifier,
   @loggedInUserGroupKey uniqueidentifier = '00000000-0000-0000-0000-000000000000', -- if this is empty, we assume the user is not logged in
   @rootHierarchyKey uniqueidentifier = null
AS
BEGIN
   DECLARE 
      @parent uniqueidentifier,
      @documentRootName nvarchar(100),
      @documentName nvarchar(100),
      @ptr int,
      @newSort int,
      @documentKey uniqueidentifier,
      @documentVersionKey uniqueidentifier,
      @accessKey uniqueidentifier,
      @hierarchyKey uniqueidentifier,
      @parentFolderDepth int,
      @parentFolderSortOrder int,
      @tmp int

   -- default accesskey to everyone full control
   SELECT @accessKey = Convert(uniqueidentifier,ParameterValue)
     FROM SystemConfig
    WHERE ParameterName = 'Security.Token.EveryoneFullControlAccessKey'
      AND OrganizationKey = @organizationKey

   SET @ptr = CHARINDEX(N'/', @documentPath)
   IF @ptr > 0
   BEGIN
      --First segment contains the root name, the rest is the path
      SET @documentRootName = SUBSTRING(@documentPath, 1, @ptr - 1)
      SET @documentPath = SUBSTRING(@documentPath, @ptr + 1, LEN(@documentPath) - @ptr)
   END
   ELSE
   BEGIN
      --No root specified so use absolute root name
      SET @documentRootName = N'$'
      IF @documentPath = N'$'
         SET @documentPath = ''
   END
   -- check to make sure the root exists and the user has rights to it
   IF @rootHierarchyKey IS NULL
   BEGIN
       SELECT @rootHierarchyKey = RootHierarchyKey
         FROM HierarchyRoot
        WHERE HierarchyRootName = @documentRootName
          AND HierarchyRoot.OrganizationKey = @organizationKey
          AND EXISTS(
              SELECT 1 
                FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
               WHERE AccessItem.AccessKey = HierarchyRoot.AccessKey 
                 AND UserToken.UserKey = @userKey 
                 AND (AccessItem.Permission&3)>0)
   END
   ELSE
   BEGIN
       SELECT @rootHierarchyKey = RootHierarchyKey
         FROM HierarchyRoot
        WHERE RootHierarchyKey = @rootHierarchyKey
          AND HierarchyRoot.OrganizationKey = @organizationKey
          AND EXISTS(
              SELECT 1 
                FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
               WHERE AccessItem.AccessKey = HierarchyRoot.AccessKey 
                 AND UserToken.UserKey = @userKey 
                 AND (AccessItem.Permission&3)>0)
   END
   -- if we can get to the root, lets go inside the path
   IF @rootHierarchyKey IS NOT NULL
   BEGIN
      SET @hierarchyKey = @rootHierarchyKey
      SET @parent = @rootHierarchyKey
      SET @parentFolderDepth = 0
      SET @parentFolderSortOrder = 0

      -- loop thru the path components
      WHILE LEN(@documentPath) > 0
      BEGIN
         -- separate the next part of the path from the rest
         SET @ptr = CHARINDEX(N'/', @documentPath)
         IF @ptr > 0
         BEGIN
            SET @documentName = SUBSTRING(@documentPath, 1, @ptr - 1)
            SET @documentPath = SUBSTRING(@documentPath, @ptr + 1, LEN(@documentPath) - @ptr)
         END
         ELSE
         BEGIN
            SET @documentName = @documentPath
            SET @documentPath = N''
         END

         -- if there is still path parts left, documentName contains a folder name. Get its HierarchyKey
         IF LEN(@documentPath) > 0
         BEGIN
            SET @documentKey = null

            SELECT @parent = Hierarchy.ParentHierarchyKey,
                   @hierarchyKey = Hierarchy.HierarchyKey,
                   @parentFolderDepth = Hierarchy.Depth,
                   @parentFolderSortOrder = Hierarchy.SortOrder,
                   @documentKey = DocumentMain.DocumentKey,
                   @accessKey = DocumentMain.AccessKey
              FROM Hierarchy INNER JOIN DocumentMain ON Hierarchy.UniformKey = DocumentMain.DocumentVersionKey AND DocumentMain.DocumentStatusCode IN (10,20,30,40,60)
             WHERE Hierarchy.RootHierarchyKey = @rootHierarchyKey
               AND Hierarchy.ParentHierarchyKey = @parent
               AND DocumentMain.DocumentName = @documentName
            IF @@ROWCOUNT = 0
            -- its not there.  Since we had control permission at the higher level, create it.
            BEGIN
               SET @documentKey = NewID()
               SET @documentVersionKey = NewID()

               -- create the UniformRegistry entry first
               INSERT INTO UniformRegistry (UniformKey, ComponentKey)
               SELECT @documentKey, ComponentKey
                 FROM ComponentRegistry
                WHERE Name = 'Document'
                  AND InterfaceName = 'BusinessController'

               -- then the UniformRegistry entry for the version key
               INSERT INTO UniformRegistry (UniformKey, ComponentKey)
               SELECT @documentVersionKey, ComponentKey
                 FROM ComponentRegistry
                WHERE Name = 'DocumentVersion'
                  AND InterfaceName = 'BusinessController'

               -- then create the folder document
               INSERT INTO DocumentMain (
                      DocumentKey,
                      DocumentTypeCode,
                      DocumentName,
                      DocumentVersionKey,
                      DocumentStatusCode,
                      AlternateName,
                      IsSystem,
                      AccessKey,
                      ContainsChildrenFlag,
                      StatusUpdatedByUserKey,
                      StatusUpdatedOn,
                      UpdatedByUserKey,
                      UpdatedOn,
                      CreatedByUserKey,
                      CreatedOn)
               VALUES (
                      @documentKey,
                      'FOL',
                      @documentName,
                      @documentVersionKey,
                      40,
                      @documentName,
                      0,
                      @accessKey,
                      0,
                      @userKey,
                      GetDate(),
                      @userKey,
                      GetDate(),
                      @userKey,
                      GetDate())

              -- then create the hierarchy element
              SET @hierarchyKey = NewID()
        
              EXEC asi_HierarchyGetFolderSortOut @parent, @rootHierarchyKey, @parentFolderSortOrder, @parentFolderDepth, @documentName, @newSort OUTPUT

              INSERT INTO Hierarchy (HierarchyKey, RootHierarchyKey, ParentHierarchyKey, SortOrder, Depth, UniformType, UniformKey, IsChildAMemberOfParent)
              SELECT @hierarchyKey, RootHierarchyKey, HierarchyKey, @newSort, Depth + 1, UniformType, @documentVersionKey, IsChildAMemberOfParent
                FROM Hierarchy
               WHERE HierarchyKey = @parent
 
               SET @parent = @hierarchyKey
               SET @parentFolderSortOrder = @newSort
               SET @parentFolderDepth = @parentFolderDepth + 1
            END
            -- it is there, check the security
            ELSE
            BEGIN
               SELECT @tmp = count(*) 
                 FROM AccessItem INNER JOIN UserToken ON AccessItem.Grantee = UserToken.Grantee OR AccessItem.Grantee = @loggedInUserGroupKey
                WHERE AccessItem.AccessKey = @accessKey 
                  AND UserToken.UserKey = @userKey 
                  AND (AccessItem.Permission&3)>0
               IF @tmp > 0 AND @hierarchyKey IS NOT NULL
               BEGIN
                  SET @parent = @hierarchyKey
               END
               ELSE
               BEGIN
                  SET @parent = NULL
                  SET @documentPath = NULL
                  SET @hierarchyKey = NULL
               END
            END
         END
      END -- WHILE LEN(@documentPath) > 0
      SELECT @hierarchyKey
   END -- IF @rootHierarchyKey IS NOT NULL
END


GO


-----------------------------------------------------------------
-- Create LicenseLegacyList table that BuildPublishBOs depends on
-----------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'LicenseLegacyList')
    DROP TABLE [dbo].[LicenseLegacyList]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LicenseLegacyList](
    [LicenseLegacyKey] [uniqueidentifier] NOT NULL,
    [LegacyLicenseCode] [nvarchar](100) NOT NULL
)

ALTER TABLE [dbo].[LicenseLegacyList] ADD CONSTRAINT
    PK_LicenseLegacyList PRIMARY KEY CLUSTERED ( [LicenseLegacyKey] )

GO
CREATE NONCLUSTERED INDEX IX_LicenseLegacyList ON [dbo].[LicenseLegacyList]
    ( [LegacyLicenseCode] )
GO

-----------------------------------
-- Populate LicenseLegacyList table
-----------------------------------
DECLARE @products varchar(4000)
DECLARE @licenseKey uniqueidentifier

IF EXISTS (SELECT 1 FROM [License] WHERE [LicenseName] = 'PROS9912')
BEGIN
    UPDATE [dbo].[License] SET [LicenseName] = 'PROS' WHERE [LicenseName] = 'PROS9912'
    UPDATE [dbo].[LicenseLegacyMap] SET [LegacyLicenseCode] = 'PROS' WHERE [LegacyLicenseCode] = 'PROS9912'
END

TRUNCATE TABLE LicenseLegacyList

SELECT @products =  cASE WHEN DATALENGTH(ShortValue) > 0 THEN ShortValue ELSE LongValue END
  FROM System_Params
 WHERE ParameterName = 'System_Control.LicensedProducts'

-- assume comma delimiter for all products, and eliminate the special case of the last license key
SET @products = REPLACE(@products, '/', ',')  -- just in case; there may be some slash-delimited CS licenses
SET @products = @products + ','

DECLARE @token varchar(50)

WHILE (DATALENGTH (@products) > 0)
BEGIN
    SET @token = SUBSTRING (@products, 1, CHARINDEX (',', @products) - 1)
    SET @products = SUBSTRING (@products, CHARINDEX (',', @products) + 1, 4000) 

    IF (DATALENGTH(@token) > 0 AND @token <> ',')
    BEGIN
        IF (CHARINDEX ('ECMADV', @token) <> 0) BEGIN SET @token = 'ECMADV' END
        IF (CHARINDEX ('ECMSIM', @token) <> 0) BEGIN SET @token = 'ECMSIM' END
        IF (CHARINDEX ('CASUAL', @token) <> 0) BEGIN SET @token = 'CASUAL' END
        IF (CHARINDEX ('ACCU',   @token) <> 0) BEGIN SET @token = 'ACCU'   END
        IF (CHARINDEX ('PROS',   @token) <> 0) BEGIN SET @token = 'PROS'   END
        IF (CHARINDEX ('CERTIFICATION', @token) <> 0) BEGIN SET @token = 'CERT' END
        IF (CHARINDEX ('RELATIONSHIPS', @token) <> 0) BEGIN SET @token = 'RELATION' END

        SET @licenseKey = NULL
        SELECT @licenseKey = LicenseKey FROM dbo.LicenseLegacyMap WHERE LegacyLicenseCode = @token

        IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyList] WHERE [LegacyLicenseCode] = @token)
        BEGIN
            INSERT [dbo].[LicenseLegacyList] ([LicenseLegacyKey], [LegacyLicenseCode])
            VALUES (ISNULL(@licenseKey, NEWID()), @token)
        END
    END
END

GO

---------------------
-- Upgrade AccessArea
---------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AccessArea')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AccessArea' AND COLUMN_NAME = 'IsContentACL')
    BEGIN
        ALTER TABLE [dbo].[AccessArea] ADD [IsContentACL] bit NOT NULL DEFAULT (0)
    END
END
GO

-- Fix up component registry entries
UPDATE dbo.ComponentRegistry SET TypeName = 'Asi.Business.Common.TaskItemController' WHERE [Name] = 'TaskItem' and InterfaceName = 'BusinessController'
UPDATE dbo.ComponentRegistry SET TypeName = 'Asi.Business.SegmentManagement.SegmentationJobController' WHERE [Name] = 'SegmentationJob' and InterfaceName = 'BusinessController'
UPDATE dbo.ComponentRegistry SET TypeName = 'Asi.Business.Commerce.Invoice.WorkInvoiceDistributionController' WHERE [Name] = 'WorkInvoiceDistribution' and InterfaceName = 'BusinessController'
UPDATE dbo.ComponentRegistry SET TypeName = 'Asi.Business.Commerce.Invoice.WorkInvoiceLineController' WHERE [Name] = 'WorkInvoiceLine' and InterfaceName = 'BusinessController'
GO
