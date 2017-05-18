
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
SET @navItemKey = 'bcb6497b-858a-4f5a-9131-c2f4fa4f8601'
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
SET @navItemKey = 'b1576b8a-bdf5-43a8-a59f-fd5416048031'
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
SET @navItemKey = '5d03a8d5-5db2-47c2-b948-7269dfada94a'
SET @rootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf'

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
SET @navItemKey = '58e8b2c7-2a75-4a91-b715-80268f322c08'
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
SET @navItemKey = '5c454f7f-1752-42a0-a57f-f517c0b732e7'
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
SET @navItemKey = 'e61f66ff-decc-40b1-90d6-f7cc2aa1decd'
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
SET @navItemKey = '3696b84e-fc55-4f53-a0a2-73293425188e'
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
SET @navItemKey = '2d2c5f87-a9c1-4cc1-83a0-7f3659512f48'
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
SET @navItemKey = '8edbd333-a1bc-4502-ace8-a4235a987f24'
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
SET @navItemKey = '2fbc85cf-9ab0-44c1-a0db-1ebb4e22b32f'
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
SET @navItemKey = '658489a8-fee4-489d-b27e-da84b4d99dad'
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
SET @navItemKey = '7807a4bd-a038-4492-a115-0335e8d4dc2c'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ae87f7d9-0e2b-48c7-b89e-c5074a14e829'
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
SET @navItemKey = '58b38eae-4bbe-434d-b837-90924c2899f7'
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
SET @navItemKey = 'dd44d2ad-9cb5-4f52-ba44-5bd04d342912'
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
SET @navItemKey = '93a05893-fbfb-4cf8-ae8f-e7cf927037bf'
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
SET @navItemKey = '0c9f727a-5a98-44d4-a5b7-c65b4b8e6957'
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
SET @navItemKey = '888adaf0-77e2-4329-b6f3-161c1b2bc464'
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
SET @navItemKey = '2dc80eb4-7c5c-430f-955b-7d7953651f5c'
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
SET @navItemKey = '45db5da6-904e-4a3f-86ad-166d24dfd8db'
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
SET @navItemKey = '321b0c4f-032e-477f-ae17-6811fe3d7127'
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
SET @navItemKey = '3fc92aaa-7daa-4a36-8bbb-f1c4759eb7e0'
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
SET @navItemKey = '4344d668-293f-4de5-80cb-8e96643ed3e1'
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
SET @navItemKey = 'ea236186-2fe6-4b1d-9024-c646b528f6e4'
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
SET @navItemKey = 'f7ddd28d-9524-4988-bde5-744f4eda99ed'
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
SET @navItemKey = 'e041bf02-a145-4103-ba38-0f48bead36ff'
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
SET @navItemKey = '1fccb879-c4ef-41a5-bc3a-9792bfb06c1c'
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
SET @navItemKey = '51473c22-1a5f-42bb-a022-335f0ded0a29'
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
SET @navItemKey = '21ac2a76-e548-41af-9d40-f2b1db0e4917'
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
SET @navItemKey = '44a2556b-043e-4a52-8bea-fcddc255fb09'
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
SET @navItemKey = 'a1297d54-ca84-49d8-9711-90f274912eba'
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
SET @navItemKey = '3ef06daf-84ad-44a8-95e8-772f1459b519'
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
SET @navItemKey = '5f41f8fa-22f3-40f1-80bd-9f635d201f53'
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
SET @navItemKey = '042501da-e7b5-4810-a23e-bfd89314b213'
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
SET @navItemKey = '99ad059f-5909-4a3c-af37-ee8e1d83a98f'
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
SET @navItemKey = '54469351-9557-4292-9b7a-cf23eb997d88'
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
SET @navItemKey = '886e4a55-c54f-4c51-98fb-90f2735e5d45'
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
SET @navItemKey = 'c071afce-6e3b-40db-82ad-71d5b1a5ac28'
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
SET @navItemKey = '5ed62239-9cce-45ac-b00c-53529a55ad2e'
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
SET @navItemKey = '25475bc2-9c11-4d21-866f-9d7e9df95196'
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
SET @navItemKey = 'b5c2f777-08b9-4e4d-8d35-0e3737ea0cd6'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'cccfc693-3231-46d5-8a94-3ab3336a3a45'
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
SET @navItemKey = '7e91e9d9-7a81-4bde-af75-1cd53cbd3bf6'
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
SET @navItemKey = 'f10d8cee-5eea-4cb4-8991-98e98c4a2b2b'
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
SET @navItemKey = 'f91ec6a6-fe0a-4c66-a06a-845f4f90cc4d'
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
SET @navItemKey = '96b19bcc-6e26-4034-a093-f773bc9c07ef'
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
SET @navItemKey = '2c9e2892-1be5-45cd-bdb2-58f3e5fe3202'
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
SET @navItemKey = 'e486dcb8-a5c9-40b4-9eb1-84fd1c4d5d08'
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
SET @navItemKey = 'fab6cf25-1ed4-44ca-bb7a-b7827875754b'
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
SET @navItemKey = 'e261bac5-cb2e-49fd-a2e4-f81994ddeb30'
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
SET @navItemKey = '6bf118a3-3273-4bff-a66d-5d06ea410c87'
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
SET @navItemKey = '95bc17e4-c7a9-4e17-80c3-4434d0c93629'
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
SET @navItemKey = 'c7f5133e-2df5-4866-a4cb-1c0a64cc3d6e'
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
SET @navItemKey = 'eaa22610-6417-417a-88e0-d7f83d9b4486'
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
SET @navItemKey = 'e81f040b-02b8-4c1d-86de-bdf489325411'
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
SET @navItemKey = '0d8de77f-8f55-42ec-9f4f-81e2c2840b75'
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
SET @navItemKey = '84ac5dbb-186b-4289-9dae-7ee20560dc24'
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
SET @navItemKey = '00b7852c-d655-49af-98e3-c97ac113af00'
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
SET @navItemKey = '664e65af-2f90-4a03-b045-42f687923faa'
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
SET @navItemKey = 'e5e3c87e-617b-40bd-a7e2-60c6248c6680'
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
SET @navItemKey = '48ef86ac-e0bd-4f96-8473-0321a4a932b2'
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
SET @navItemKey = 'f9f1845a-df13-4f45-9307-b478eaa60b52'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '096f8b6f-8925-445c-9e3a-b28cd828edff'
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
SET @navItemKey = '23f03ae0-4641-4fcf-a3d7-f1304ed96ab7'
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
SET @navItemKey = 'd2f8a071-ca8e-4254-9831-fd6bb9536dfd'
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
SET @navItemKey = '7b14f450-37f3-4634-a51b-5d7ec3a0c24e'
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
SET @navItemKey = '254ecc51-2634-4bf5-b4ce-9218ea210a79'
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
SET @navItemKey = 'd4ab4a2b-54b1-497d-8ef7-a2c389018e0f'
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
SET @navItemKey = '54c287a3-b7a2-44f4-8128-567c66f58c6f'
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
SET @navItemKey = 'fc51957e-99f5-468f-95ef-988f8fc2add5'
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
SET @navItemKey = 'c78dabf7-ebd0-4611-8b62-900a4e565c8b'
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
SET @navItemKey = '524d548e-b9b7-44f8-9fef-a997138cd289'
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
SET @navItemKey = 'c29b192a-7f56-46e9-860d-d1603593aa44'
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
SET @navItemKey = '76271b34-ed8c-45bb-8bf4-05282b5328ae'
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
SET @navItemKey = '9280eaa7-bd38-45b1-9502-c9297c14b0e0'
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
SET @navItemKey = 'f6c646e6-dce8-4997-bd74-de975a97aca4'
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
SET @navItemKey = '05df6ecc-0087-410d-86b9-fa891764e2ab'
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
SET @navItemKey = '97463c5f-a07d-463c-8681-8c4ac4cba0f8'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ed6843b2-6e37-4a94-ac76-3a01f2716fa2'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9d61677c-87c9-4702-89d9-109e3630ee27'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6164dfb5-6a8d-47b8-a8ae-cdb72ad187c6'
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
SET @navItemKey = '9675dcd3-73aa-459f-b133-53a81e9ffb12'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '380a4709-6105-4e68-a2f9-e87d2b0ad6d7'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '91895b13-2822-41ad-8860-22f61833a7c6'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4edc2cae-8ec3-454c-b427-ddb5c2e44e80'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '856cb347-45e3-445e-8d91-5fd0e05360be'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'dee621d6-cc5b-45d4-a42c-090d85b3e8d3'
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

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a05bad8f-cd65-4103-ba0e-212a2275458b'
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
