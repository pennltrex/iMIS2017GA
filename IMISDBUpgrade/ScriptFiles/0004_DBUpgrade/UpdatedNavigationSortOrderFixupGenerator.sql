
DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ebabdbbb-a7da-45d7-88ae-6ae2a087917e'
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
SET @navItemKey = '2528b1e1-6250-4fa9-acf1-effc6becf695'
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
SET @navItemKey = '679f087b-5dd5-4e3d-9932-9268600cd8f1'
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
SET @navItemKey = 'ad77c24d-61a7-4267-a8d8-3d6d4317adfa'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = '3f782e57-e57c-463d-aebe-66dc3b178d02'
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
SET @navItemKey = '5fa446ca-ea32-454e-b5fc-2932bbc48048'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = '0bf0766f-237d-4b0e-b2cd-eaf3b86caf57'
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
SET @navItemKey = 'd07896c2-a131-4901-aef1-752a079ecfe0'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = '1d34e813-0c10-48b1-a7c1-0520c4383f2c'
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
SET @navItemKey = '08806d48-5a1a-462b-bb92-a4a4b0d1a2cb'
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
SET @navItemKey = '248ba2e2-beeb-4137-a36a-ee01650b102c'
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
SET @navItemKey = '78452bc0-43d1-432c-bb76-bf1bced010b5'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = '9ec13d39-f57f-4904-a2ca-9e4a21c164fb'
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
SET @navItemKey = '99019171-d98a-4d53-9e50-a8c3aabd637b'
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
SET @navItemKey = '2cd28379-4d20-4517-83ee-49fdce959d7a'
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
SET @navItemKey = 'ffc64b4b-5a08-449b-a4d6-a6e244596b21'
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
SET @navItemKey = 'e31cccee-45be-4c76-8fd1-0e835bbdbd6c'
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
SET @navItemKey = '46c21d89-99fb-447b-84d9-244921425bf3'
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
SET @navItemKey = '551f0237-8c5e-44af-b405-5b42925af74e'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = 'ca1c5878-675c-44ac-9b78-23e341ea6ed1'
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
SET @navItemKey = 'd4291bf6-f9de-4cf7-97e6-c00a8656a8cf'
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
SET @navItemKey = '05614270-0945-4698-8f41-3299cf9a9218'
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
SET @navItemKey = '3e174589-3cba-487e-8aa9-264c258a8ae6'
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
SET @navItemKey = '4bdbf36c-4ef1-4d01-aa88-8533996ed7ae'
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
SET @navItemKey = '57792fbc-b44b-4e55-8053-121651aff931'
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
SET @navItemKey = 'd0db0542-3f3b-41fe-8a70-477d222e6d5e'
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
SET @navItemKey = '56c6172e-c425-478f-b795-6b4187147f59'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

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
SET @navItemKey = '9dde317f-8ccb-4fee-b46e-49d27da4e73c'
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
SET @navItemKey = 'ecf595a7-4a82-4660-90ee-985c438f8294'
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
SET @navItemKey = 'cf700a2f-2d80-48b0-ab98-e10b14daddf8'
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
SET @navItemKey = '8f9a8e7d-bc3f-4c62-b7aa-984f4ac3584c'
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
SET @navItemKey = 'e6553ed6-9b26-4741-9716-ec5b62464f46'
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
SET @navItemKey = '38afa8d4-fe53-46a5-a976-bf13c5b40b68'
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
SET @navItemKey = '7b68526a-0bac-45b4-bdea-db554cdaba35'
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
SET @navItemKey = '619c8159-629c-4967-8867-42c81e4c491c'
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
SET @navItemKey = '8a10de5b-88fd-4123-be2b-bd567494432c'
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
SET @navItemKey = 'fe8579cd-7100-4ee1-a814-8f51d2e4c01e'
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
SET @navItemKey = '979de28e-cb48-46cf-87d0-2c0c75330143'
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
SET @navItemKey = 'dbf2107c-761b-42dd-9573-96c0198dd1a9'
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
SET @navItemKey = '7e7fbd68-f02e-4e52-80f0-d5155c180ee7'
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
SET @navItemKey = '4da4dd6e-cb5c-44d7-80a7-d2fb7d80cb27'
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
SET @navItemKey = '5bf978a9-48da-44c6-bcdd-e095d2806ad3'
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
SET @navItemKey = '44c9c319-19cd-4841-95a3-c1d9a895a014'
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
SET @navItemKey = '82373ab0-eedd-404f-b3dd-94aee86e6854'
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
SET @navItemKey = '8ca11b9f-3034-4918-829f-d1159e9139eb'
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
SET @navItemKey = 'e8034488-1e3b-4241-987d-e7bc580073c8'
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
SET @navItemKey = '1b58f209-481b-4a3a-8c6b-d3eabe8ca126'
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
SET @navItemKey = '13e3bef7-84dc-4c67-9c90-5698cd173a55'
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
SET @navItemKey = '2fb36623-527c-4a7d-bc70-6e19f78ed17f'
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
SET @navItemKey = '40e4954e-038a-493e-868b-58105aee6d3e'
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
SET @navItemKey = '3708d382-08b0-4076-af31-f2ed0b7932b2'
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
SET @navItemKey = 'e2e926fc-8881-48b2-acd5-f8fa011383eb'
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
SET @navItemKey = '101495fc-0cc4-431f-b32a-e119c4314efb'
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
SET @navItemKey = 'b37b9ee0-5a9a-45ed-b01c-488d864cfdca'
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
SET @navItemKey = 'bee031b4-0b0f-44cc-a791-222fb5aa5e00'
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
SET @navItemKey = 'c4c58a2c-a27d-4774-9b93-e2551f4b4cab'
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
SET @navItemKey = 'ef85b467-e2c2-4c65-98e3-c19b3fdc96cf'
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
SET @navItemKey = '3a2f454e-86b6-4f0e-8c13-bc490678a489'
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
SET @navItemKey = '3ec7e58b-4fcb-4b56-b7d2-408f667fb342'
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
SET @navItemKey = 'a526dc20-e57d-4a78-a38c-c36391a9f457'
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
SET @navItemKey = 'f6f19fee-0eb5-4526-95b4-47b063e374d8'
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
SET @navItemKey = '2ea93758-7bfe-4c98-a49f-170ed95f01d7'
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
SET @navItemKey = 'e768a803-dc3a-40bc-a3a0-8cce86b43f9c'
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
SET @navItemKey = '6cd3a57a-017b-48b6-b687-56931bce7779'
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
SET @navItemKey = 'd81d5628-14dc-491d-bd9f-dc3fe4c61c82'
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
SET @navItemKey = 'b6060e73-80c7-4bdc-bef8-9ffcb7def854'
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
SET @navItemKey = '86f38505-a8de-4e8c-ad62-0ab90c06ea7c'
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
SET @navItemKey = '6e7e6355-70c4-44fa-850c-4ea91a225368'
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
SET @navItemKey = 'c71ef7d2-e5e6-45ba-8126-68f835bca1eb'
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
SET @navItemKey = 'b1dd1c77-7492-422e-81b0-d6b9fe795e9d'
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
SET @navItemKey = 'c14b878f-1854-48e3-9366-a35647972fe7'
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
SET @navItemKey = 'b82cab22-0a96-4557-a334-4e0081efe92d'
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
SET @navItemKey = '7e884d84-3068-4fe7-ab45-0001413d5cbd'
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
SET @navItemKey = 'b61d9791-7b08-4242-9aa3-dbc166327549'
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
SET @navItemKey = '8581ae88-ff2c-4109-95c7-a13ddf214f57'
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
SET @navItemKey = '81d0b83e-a0eb-4c41-81ba-eeb4649a4c16'
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
SET @navItemKey = '608c9f2e-e9e5-4563-9734-5a0ec87449e4'
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
SET @navItemKey = 'bbdd3c35-40d3-4b97-958f-f20cb7be1c41'
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
SET @navItemKey = 'a1dbad48-547b-449f-8492-9d163387cc95'
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
SET @navItemKey = '34288012-c792-42ff-b5d7-4f623515f78c'
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
SET @navItemKey = '9227fadb-64ef-4f4c-9523-6436e6e774d8'
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
SET @navItemKey = '3aafb8b4-a390-46ca-b4ce-a026f43e8f33'
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
SET @navItemKey = 'f89136a3-1131-4629-a86e-72b86761b1de'
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
SET @navItemKey = '49fed7b1-af0e-4c4f-9104-682ea0f21b30'
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
SET @navItemKey = 'b65c05e0-75bf-4d5c-85ca-e74816a79ab1'
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
SET @navItemKey = '11370a46-e44b-483c-a14c-39faa4be831e'
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
SET @navItemKey = 'ddb1749d-e661-4e92-a0f0-490b60442fd0'
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
SET @navItemKey = 'bbb48dcf-1c0b-4de6-aea9-2244f6776028'
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
SET @navItemKey = '055035c8-051a-41f2-a4e1-3f13506d70ad'
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
SET @navItemKey = '286534a3-5766-4c55-b0ef-471f43e5a6c0'
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
SET @navItemKey = 'c94e3898-08db-4fdf-a4f0-165f7abf591e'
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
SET @navItemKey = 'f8b66648-159e-46de-bd2b-d48bddc377fb'
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
SET @navItemKey = '917029dd-4695-44eb-b059-666ea329ffad'
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
SET @navItemKey = 'f4ea893e-6b67-4b23-ba44-62f8aee84271'
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
SET @navItemKey = '5599bb2e-f635-4797-bc84-7ce263d7bf53'
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
SET @navItemKey = '325f4da4-ee0c-44d7-9f40-9019f14054a0'
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
SET @navItemKey = '6ff93c94-250c-4b63-b79f-d0dc612606cb'
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
SET @navItemKey = 'e4108a5c-7b94-41dd-916d-72eec861443f'
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
SET @navItemKey = 'b4e1b24d-ad42-4d99-87b2-88b630a4a154'
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
SET @navItemKey = 'b5d61d73-30dd-4824-9b35-c00a84bc12f3'
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
SET @navItemKey = '739aff8b-ce3b-448e-af29-c265380f4b54'
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
SET @navItemKey = '1820efcb-c05a-4164-a02f-59c0b3365745'
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
SET @navItemKey = '1ce5184d-5e3e-481a-8ef0-3edb8b35fe3c'
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
SET @navItemKey = '61d9e094-38d2-4841-8071-8adb1faf4ef8'
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
SET @navItemKey = '8af90d4e-18a7-4b62-991e-a4a4d1a9eca1'
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
SET @navItemKey = '337d5705-b8ff-43d1-ad52-2fd466634455'
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
SET @navItemKey = '28233268-09aa-466e-a3f1-f409e7391ec8'
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
SET @navItemKey = '5991f8c0-3fd6-435f-a8f3-712a0a1ab524'
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
SET @navItemKey = '86e25618-9cf4-4da4-a719-19317de71dde'
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
SET @navItemKey = '2baccea7-84c6-4a4e-8bce-93a65682ac21'
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
SET @navItemKey = 'eade26f9-465f-4489-983a-ad9a2d2a6bf1'
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
SET @navItemKey = '4c400499-ab88-4851-855d-c6af38e6cb8a'
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
SET @navItemKey = '7162e7bf-3d5b-42e5-b87e-b4b4a9cb11cb'
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
SET @navItemKey = 'fe78feec-2038-4fec-9cc1-5bcdde947ef0'
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
SET @navItemKey = 'feba6eab-0836-4a99-b6a0-40cacbe51eca'
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
SET @navItemKey = '8770c0fe-6010-4f62-aaa3-eb5e89d51404'
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
SET @navItemKey = '48642604-0efe-46e2-b240-8d38dbafb8a5'
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
SET @navItemKey = 'fb8b20eb-1f6c-4472-853b-adf4883407a4'
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
SET @navItemKey = 'ce755175-f046-42ee-a52c-28b1004a7e23'
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
SET @navItemKey = 'fdc32d39-ace7-4fd2-a2ea-458066e021cf'
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
SET @navItemKey = '7dc69820-1947-4297-9200-da829e2f027b'
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
SET @navItemKey = 'cf681880-ae2d-48d3-b001-beab6dc0fe84'
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
SET @navItemKey = 'a73eef06-fb11-44b1-af00-ee5fbd0e0bcc'
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
SET @navItemKey = 'a1d67f04-fa4b-42b7-a8f0-580c675dfa9a'
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
SET @navItemKey = '88353e74-265a-4b83-b795-5c70f604addd'
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
SET @navItemKey = '23ac439a-3777-4240-a7c1-fa8db6c16bff'
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
SET @navItemKey = 'aab72aa7-99cb-4258-ba24-94eddf2dcca1'
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
SET @navItemKey = 'e0bec9ac-0e92-418c-8c55-d4b70a7a3c3e'
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
SET @navItemKey = 'ff3f1774-7403-4858-bbfb-a1418bf53dac'
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
SET @navItemKey = 'fbf0afc8-5b74-4bc5-bab5-5906ea352f3b'
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
SET @navItemKey = 'e5203591-55c2-4358-97a9-a7e48437347a'
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
SET @navItemKey = '48ca3a88-f1ce-4cca-b95a-fac68d19df9d'
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
SET @navItemKey = '6c3bd796-6e69-468f-a71e-8d474ead0d3f'
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
SET @navItemKey = '9d8351df-f4fe-482d-a973-a15f9011f8ee'
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
SET @navItemKey = '26594c72-e8c9-4094-857b-014f1e6de37d'
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
SET @navItemKey = 'b82ac672-7ca9-439f-945e-f3aa47d973cc'
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
SET @navItemKey = 'cc5cc88e-044c-47bb-86b3-e19e6db26000'
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
SET @navItemKey = '588ccfb0-3008-4ff8-829a-a11b5a2d1f4b'
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
SET @navItemKey = 'f9b252b1-9813-4875-9af8-98718d425db1'
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
SET @navItemKey = '76223860-ba36-4158-9215-f0f4b331c7fd'
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
