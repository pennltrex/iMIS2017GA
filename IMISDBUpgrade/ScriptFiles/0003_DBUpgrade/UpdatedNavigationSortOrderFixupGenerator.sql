
DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '91a25e8d-4fd2-4329-a472-d30dc9c7842a'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '35acfad2-9e0c-42b9-97a3-e3094018d4db'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd932a5cf-1b8e-4703-93ed-92afe26848d5'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ebabdbbb-a7da-45d7-88ae-6ae2a087917e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '426a3144-4c69-4945-be40-f2684645172d'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9074916d-efb2-4374-a783-8b8fd886f59c'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '51d4c751-7d03-4e56-9f80-a4ca743ee33c'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2aa7352c-c5e7-4df0-9b82-f5730cce5423'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '579f8c40-731b-4842-9d61-5db19afefb80'
SET @rootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1a4e1c52-4d17-486e-b85e-30231a420853'
SET @rootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f9345d55-28e3-4fea-8f28-b8e62b21b029'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0898c4d0-508c-4980-a5fe-d1b45bcc683e'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1df5b4c9-f94d-4950-ab0c-0d5561b3dfcf'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2f4c2a14-9524-45bd-9d1f-288d179883fc'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7b1ae717-3d6a-4339-b7b5-338cd2d4025e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2c7fa6bb-b237-42e3-9424-2fa5f4d6b113'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '98fc583c-cf21-4de3-9bdb-cc87e643fb93'
SET @rootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a1912ec0-1539-4689-a29d-d20603c053f3'
SET @rootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'cfa08b8e-5126-4edd-83ea-f30eb6e2af79'
SET @rootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ded8f16c-c568-468f-985e-9da4f3b61eae'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '201dde99-737a-4260-ac90-b6d7fdb6bfaf'
SET @rootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd0fe2b3c-3484-4ba2-b709-d4779201035f'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'dcf78247-b509-4b5b-b8e6-588021e1482d'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '325dda51-7afc-4a43-9c2e-f9dc48869678'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c4e40dce-bcac-47ae-9a3b-f83751edb880'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e4fddad9-f387-4338-a788-e027ed64706d'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a8b5b47b-7e90-4826-bfbf-419dd6b0dfaf'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9c4675ec-48c5-4e90-8d7a-a0be9a32c0d6'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ac74324e-9ece-4346-bff3-9ce226ad01d7'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'df57d03d-72e4-48d0-9572-a145818e76f2'
SET @rootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9d3088a0-350f-4352-ab92-93120e64231a'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '36d101cc-7b8e-4bd7-903d-5d9a2ba8194b'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '3260a6af-635e-4a32-9ab9-a2df699b0196'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '8cfb4ff0-816a-4b14-89e8-49582b9ed7ad'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fd232df7-47f8-42e6-bace-627ca538d6d9'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6d89a25c-2522-4fc4-aa22-7ac586f8a06a'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7a13ee49-cac4-43c5-986d-245d6f5733dd'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4747399e-6c97-427d-8af9-dc98cec44234'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ac79b76a-0f32-4a95-9d52-6a8937977e56'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9c61022e-a07c-4224-ab2d-873b5464879d'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e49fb3c5-ad5d-4040-aafe-71594bd9b0f1'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0ad91f58-f048-482d-b762-e3a848e26a53'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '027240af-c487-4552-b0c2-c4d2d80ebf04'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '668165d0-5810-4b32-bce2-9047f38ce1c9'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '85acab7f-72ba-49de-a297-fcefc7452564'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '74a6e970-9e6e-4adc-b3f0-72c758bbf589'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'eed96820-da1a-4ecd-ae38-0c862d62d9b0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f0bd2df4-85bb-4181-a208-69b6e3e24daf'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6e1facd0-3d70-43d2-b456-afeb320208a7'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b51762d0-d179-481b-943b-47fd443dda58'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0981c3ad-a1bc-4541-b62b-6bc0a57f4487'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5f83a52c-7609-4992-9a36-2bd387d5c1a4'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fe9fddb9-d6e1-4c52-800a-6805b9ab29c5'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '49b2fcf4-fabc-4169-9201-1a0b811e0a06'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5eacf13f-7b91-4659-87bb-d9d2904ff5b3'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c2f7e1bd-a101-4cba-a186-6aa8f2e3f559'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e9c19c83-571b-4a9c-a7a3-b00b2b75bf98'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0a92e4f0-238d-4f26-bc2b-420cc797e34d'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'dc5e4548-a0b5-473d-b1e3-26d9beaa99f1'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'bb37b07d-5881-4d98-8e79-d1874101aa93'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7e0fbed8-13cd-48e1-873e-a5235d316193'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'a0e38354-fe63-48ad-af69-5f5ed17ace72'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2b395fd8-8a02-46f7-8b01-b083fcf6ffaa'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f0ff1d24-e3a3-4ac6-98d3-3a1d2247c237'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '8f87b685-bcfd-48b2-85d7-c6c71c005a94'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '15218a87-1f26-4905-8392-3f690a39e02d'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6fd3b8f9-1369-42ce-a1c4-fbfc5e85a181'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'da4b33c8-d91b-46a3-bfe1-081d31057c97'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1889399b-d89f-42b7-a3fb-c2ae5be3ba5a'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ac7c3a5e-6954-4f00-9331-20a2def14961'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0ef1e368-9b2d-43ee-8cf7-e8eae213554b'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e59ca5e7-a75e-4c63-9e55-177ba347eb95'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '44d3eafb-0a70-4246-8969-e4256612a260'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '33c91c0a-2c60-4dad-8334-1003ce8416d9'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1653df3a-cc1d-4304-8cc5-49c1db5f576c'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ef0258dc-c910-4d86-9f98-2f68d6537d5e'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7f76b5a3-80b2-4801-b035-fa033e8669a7'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '216ee655-f617-45a3-a5e3-04cbd3be7cad'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1b05091e-6247-430f-88d4-77390cdf4ebd'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '794327e1-5e30-4932-8f78-3ced922a10fc'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'da2e77ca-081e-4d5f-ba63-416d0186d0fa'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ca61e544-a05c-47ed-bb16-6f77126e349a'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '60cd6ede-dd06-4a04-a489-2e84effb2299'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e0f6585a-956b-4d2d-9426-98c1f6fd983b'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c425a5c0-3d43-468a-ab9b-006c7c5af94a'
SET @rootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fe1294e4-2f0f-4331-bdef-ad5d51f2d535'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'bb982453-73f4-4acb-be66-f832efd11e95'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0c0477f8-ba93-40d1-bbf1-520038312dcc'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '79bcae6e-6093-46d0-bb08-cb24981d3ce5'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'de4c665c-3e0a-473d-9562-b2c5e4bcd27e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c209ba2a-ece8-4ba0-9188-296c498b865f'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9a274b5a-7dbc-4d5c-b8e0-ed9984129522'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '95447b1b-0b27-43bf-99fe-e293cada5613'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6708c0de-5d44-448e-bacb-463598238b36'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7147551f-b709-4e34-949e-e563fdb522fb'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c87a2b56-013a-411f-8be0-9e0aac82326c'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd4d51556-f815-40e2-bcc8-10c6622a23c9'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '232f6592-dbf2-4fdd-b151-887b3a038618'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '48213e13-ec51-47dc-a52e-0878973775c1'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '794fff82-916f-4716-9cf7-2eafc1ccb12c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '37e99c80-d4a3-4dc7-93d4-74b8768d4098'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '0216809b-7493-461c-a547-caeed6755a6a'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'db165858-deae-4689-be05-c02d8ddd5261'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '48841d7c-0968-47bc-abe2-b8bdc69c14f2'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'bcdf3d8e-15c9-4a6b-9f05-a12da58a7fd0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '95b31c36-e172-4860-841f-0640ec932aed'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '878be44e-7271-4d36-9c67-8cb35633453e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9697d86d-463b-4465-96c3-4096eb5b0dec'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6255cec7-8cfc-4f75-92b2-4f8ee1b5d26c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '337a4fdd-529c-431c-aed7-cb43cf900adc'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b64dc529-74a8-48db-beb2-f73332bc2879'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e41b0414-8f70-4381-bf81-b33f2f066061'
SET @rootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '44df5f36-d000-4c1d-85e9-7f5810bc3ab0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7220e8fd-ea69-4c50-9b19-1d086c932254'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '38bd44e5-b9a7-451a-b2ba-f30db62daffa'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6f67920b-296e-49fd-9ec8-db39fab1b42c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ab0fe306-51bd-44e9-a052-9aa268ac40ca'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1a4b8a72-5727-4476-870c-d74fca1b0eb6'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c00e4b7d-c2e5-46a8-8a95-9c679c9517a0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4688d0ad-9375-460e-a676-632a2806f87a'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '35e21bbb-2f52-4c08-abce-5f8116785035'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f50b3d15-15e6-4987-80c0-e1f319b338b5'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'cadb7140-4fe6-40f1-8441-8d0860993ef3'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '13b1d417-6a1c-4946-9e76-c78d38e1c287'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'efbccda3-3ca6-4a60-991b-29ca64358dd0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '50c0a58b-72fc-4784-bb15-0db6679c896e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd8364376-5bc7-4649-abc9-ed03805e2c5b'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'eee93242-7e61-4c6f-9e60-f44c2d572748'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ed9abbdf-f3b5-4ead-aadb-82e6658f92d3'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '72f60af9-6d9a-427f-93cc-a7cfedc7f059'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f55497f9-c79a-4f6c-a171-73e6f3ebe12c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'c0407d73-4604-483c-9571-42364aa9b9e4'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f29a9ce6-ee91-4e24-9066-6e67f4e12027'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ea6a11e2-0d7e-4b74-9971-76239afbf99a'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd600cd11-f054-40d1-aad1-66012c049916'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '7b9e122d-a416-41e1-aac0-faecbd9b056a'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '621dda7c-a578-428b-a16b-74c2913eb4fd'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2c119d2c-a849-45fc-844e-1243928cbad3'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9d421488-655a-4648-920d-0f535e724184'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '99ba583d-db1c-4fc2-b65f-fa66033e2ce0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9a88bc38-1755-4766-b198-b164ef0759b8'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '50b88949-df9e-42c0-aa26-0df2d88bd983'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '9be62eac-37b7-4045-bb70-4a1d98146716'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b1ca04a5-b6a8-492f-9b43-4389e1e47945'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'abf95e7c-6547-4a72-9a06-8dbf65b7c64f'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f5207c21-75fc-464e-9c6b-7c19e54f12bd'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4cf9d80e-42ce-4003-af77-d943c298f0b5'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '301bb1fd-194d-4c2e-826d-887582ec220d'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '8f4cb6ed-bf61-4c82-b58a-ccb834ddcff0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e607d7f5-00df-4b0a-8bca-91b61ec68aaa'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1d27f36b-aa25-41ae-ba1c-13f3c51b7c57'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '322bfc0c-8492-4f4e-b561-f7f5867a5467'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '24903e50-b176-463d-8289-c0fa2240a41e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ac1026ec-2442-4845-9c3e-e5b2abb91c41'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '53eb21ac-82eb-4e45-b4b9-cc7b66a75525'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'bf220feb-547b-4239-9826-ccd82d17ba2f'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1b47eaf0-1bc9-4636-b997-9f76acf0710c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '104905b9-0338-4d71-9e8c-2cee9912fd6e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2e0a985c-4876-471c-8fa2-fc4ceb213c74'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5cd0060b-463d-4a45-abaa-b23a4bc9db72'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '80ab0c54-1527-4c01-aff5-af08efbc6972'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fc4d663a-8aec-4d22-a1af-813d6f0678ae'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2e54e23f-3ede-4738-8ece-7f9ecad1d553'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e709b0c9-eb44-4872-bbed-b5d89ecd227e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1f2e4c5b-7e4f-4ed3-a1cb-ca00c143a7fb'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ecacd6fe-6976-45cc-a698-97a45f79d73c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '613f7110-1257-44c6-8c9f-91a202d3708e'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '10e2bafe-f69b-493d-af9a-9961f319f4d1'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '031b350d-82b2-41fd-96b5-7297a1edfade'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '5f2298f6-f837-417e-8045-2d91a4ed4914'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f39b48b8-b4e3-48e0-b3ea-74997174ccc0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b60d86fc-44b9-4936-8113-94e5974efaa4'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1914fad1-1f97-4fb4-8a42-92802c59d2f7'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '91a76e23-180f-4f3f-9bae-b4e2fe1bf10f'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'e422864d-2bef-4f40-bbc1-17be1840d7c3'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b4a2aace-2059-4cb7-830c-40a18d335d17'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b0d0948d-acf6-4752-9093-1ba60c1b157a'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4705b43a-ad98-49af-b70c-892da02e3bc3'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd3505396-6d3f-4d06-9d53-a2992c602668'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '771b1810-8691-4bf1-bad9-efe9af6287ab'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'ffee1059-675a-4abc-89da-33b900ab7ac1'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '16f9170c-dcfb-4df3-8dd9-a09e388521f0'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2db2dff6-af52-4f28-a475-77a2bdcf225b'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '22f26991-9ee3-41c8-b298-ddf902f9b2a5'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2ab14719-5597-4984-aab0-c04fd41a1d12'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '26db6356-cb25-4fb2-9c37-a3986b96f3a7'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'afb4d29d-9dce-4de0-80ef-c211a3bedd0c'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'd395e133-170f-4940-a7c0-39d3eb0ebc28'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '80ce3c41-f439-4881-a93f-5f1de7e51dbc'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '71a7b773-d772-4728-b9a5-63fed0c9e416'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'fd6ea3a9-87c4-4c32-8567-5270b48128f7'
SET @rootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f48b6014-532e-4973-b603-7f7b448a72f1'
SET @rootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '680802d8-31c2-4071-901c-2b77dead172b'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '2b74598c-30dd-440b-abc2-b57fff1a6dff'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '343ee562-8b69-47ce-abb8-d1a7fbf064b9'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '8ab8bb49-b8af-48ee-b748-80db2844373d'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
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
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '27a57655-844b-4223-8f45-bcbf79b56248'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'f2bb175a-5fab-4595-bee7-5c46ff12a170'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @rootHierarchyKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = 'b912076e-a8d5-48d3-8ea1-53a4cbab1cef'
SET @rootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey AND [RootHierarchyKey] = @rootHierarchyKey;

-- Write out SQL to set the document's Sort Order
IF @sortOrder IS NOT NULL
BEGIN
    PRINT 'UPDATE [dbo].[Hierarchy] '
    PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
    PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
    PRINT '   AND [RootHierarchyKey] = ''' + CAST(@rootHierarchyKey AS nvarchar(40)) + ''''
    PRINT 'GO'
    PRINT ' '
END
GO
