
DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '1363e90a-b474-49fe-b2f3-a0e8034b9942'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '6cd53710-dde4-4e11-a403-53bb3d34fa54'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '4842e079-53df-4d4c-b9ec-35004c50fb6a'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '38132130-5fce-44f7-ab93-6f922ea603bb'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '10723585-f070-4de2-8633-fa72a928d0a6'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO

DECLARE @navItemKey uniqueidentifier
DECLARE @sortOrder int

-- Set the Nav item we're dealing with and its siblings' hierarchy keys
SET @navItemKey = '76223860-ba36-4158-9215-f0f4b331c7fd'

-- Get the current document's sort order
SELECT @sortOrder = [SortOrder]
  FROM [dbo].[Hierarchy] WHERE [UniformKey] = @navItemKey

-- Write out SQL to set the document's Sort Order
PRINT 'UPDATE [dbo].[Hierarchy] '
PRINT '   SET [SortOrder] = ' + CAST(@sortOrder AS nvarchar(12))
PRINT ' WHERE [UniformKey] = ''' + CAST(@navItemKey AS nvarchar(40)) + ''''
PRINT 'GO'
PRINT ' '
GO
