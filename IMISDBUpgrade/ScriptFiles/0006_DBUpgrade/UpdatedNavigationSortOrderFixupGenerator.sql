
DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '23279ca8-aa23-49d4-adc2-29bf7bbfb6b0'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '91a25e8d-4fd2-4329-a472-d30dc9c7842a'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '061ba79b-aef5-47c3-a6d3-db396b78b64e'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '182f0d28-190a-4a87-826a-a0141f3d4611'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '8744e453-61c5-44cd-ab7a-52d61c37fb45'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2bbf4221-39c7-4d25-a87f-f6764ddb6c44'
SET @rootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '836d7088-382b-46c4-846c-6bf01cc5b7f0'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'dd900b72-470d-4ec9-88e7-d3da07eecddb'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0c56f244-f19e-44e4-a578-0820dcdb01f2'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e9774411-732b-44db-aec1-da12816720fe'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4495f673-bea2-4c18-ab26-1cc88f7fbc09'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '94e31001-ce5a-4963-97ee-39cf39b6633a'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '49f060a2-8bb7-4d6b-813a-f6af4702c71a'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'dd28f2db-a8f5-47ac-995c-6b110c6db25e'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'bdf5b94b-c2c8-49f0-b609-4594b2dd516b'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c110217d-01b7-4ff5-a57f-2e65ff638757'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '700a1a34-3c20-43b1-817c-7743401a7671'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f5b8b7da-0903-4678-b863-d7a0f51b72e8'
SET @rootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '129d6ad2-a69d-4d34-a50c-572d167ebd52'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f5bc1801-515a-4e97-bf1e-2ae3f743055d'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '365f9e45-4a0d-423c-bd68-290a0e20205b'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '51a26d6b-6997-4028-9db7-4b735e91a84c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '32216f6f-4af0-4e65-a1e6-28ea0fcb4519'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0026133b-32fd-4866-89e6-e3c7490e57f5'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '01edaa0d-3555-445d-aac6-2f2e6617d9f8'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9defb847-2feb-4eae-91cd-f474ceb0eec8'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6fba54ba-7f73-4f46-8c89-2ca5b593e04b'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5c9c521e-771e-4734-b127-1281755788ed'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '46e483c7-d55f-4431-8f92-52df89022f75'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e3c787e9-c54e-4e4e-b8ae-a8c0e906de2c'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0f95b57e-0874-4d08-bccd-b90b861c9a67'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7f61dc0a-a4a9-49d0-96d4-0c2bca46b3c8'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '64889e26-a69a-45f6-979a-482b55e3e9eb'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0d5e8d7b-0bb4-4e08-a47f-92836a4ada37'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '225fd0fc-9d7f-48d8-a809-55d88108de02'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'be62478f-d245-4588-a762-6d01de29ae24'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0a775ae9-569e-4ac9-a7a5-9885caca326d'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'af7226c0-27e7-4fd7-908e-29859ed59a49'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '12e7ef18-dfde-4fc4-96bb-8e78c317fdba'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '278acec6-700c-408c-9fb6-d5c69d0cdd51'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0dbe82d4-4dec-4bc0-8a5a-56f45d155c33'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '850d30a2-450d-42c5-9e7f-97e999a56abe'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a625a106-c4a9-48e0-83f9-90785f66c0a1'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b3871008-3fc7-473d-8fa5-ac38a2434a34'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '3898550a-2e77-4733-8d11-07eab2e50d2c'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1de7e1ac-d75c-4cd8-9743-d98faa80a134'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fd49eec1-0757-4309-9ab9-f593a05aaf47'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '71394bad-3650-4f1c-9a18-52ae3c37538d'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a8b22f4e-3dce-44e7-a55e-6e10c2f35390'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f76d9807-fd5f-40fd-a8c1-7129c20694c0'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6cf63900-8fb3-44e9-a52a-e89125cf8a44'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c0fe87e5-7d9d-45b8-979e-89a039f4d1a1'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '3f9829ab-6d75-4059-bd1c-d6f23449ff17'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6e6319a9-f85f-4132-8cc7-d3fa045037c5'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '588c5c55-bb54-40e2-af35-85d7462486b7'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '44c97ddc-52c5-4c6b-96ee-5977425d663e'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5b0aab4a-adb3-4401-acdc-bd9c22e582fe'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '670be00e-c8e8-4f60-b149-0e8017852837'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd6750c51-18d9-4e08-905c-7e991fa05078'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] 
 WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO
