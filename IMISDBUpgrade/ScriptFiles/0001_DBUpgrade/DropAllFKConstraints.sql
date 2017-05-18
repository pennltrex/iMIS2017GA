-- Drop all Foreign Key Constraints on IMIS tables
SET NOCOUNT ON
DECLARE @sql nvarchar(2000)
DECLARE @tableName sysname
DECLARE @fkName sysname

DECLARE theFKCursor CURSOR FAST_FORWARD FOR 
	SELECT [TABLE_NAME], [CONSTRAINT_NAME]
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS LEFT OUTER JOIN [dbo].[IMISTable] ON [TABLE_NAME] = [IMISTableName]
	WHERE [CONSTRAINT_TYPE] = 'FOREIGN KEY' AND [IMISTableName] IS NOT NULL AND [dbo].[IMISTable].[IsIMIS15Table] = 1
	ORDER BY TABLE_NAME

OPEN theFKCursor
FETCH NEXT FROM theFKCursor INTO @tableName, @fkName

WHILE @@FETCH_STATUS = 0 -- spin through FK entries
BEGIN
	SELECT @sql = 'ALTER TABLE [' + @tableName + '] DROP CONSTRAINT [' + @fkName + ']'
	EXEC (@sql)
	PRINT @sql
	FETCH NEXT FROM theFKCursor INTO @tableName, @fkName
END
CLOSE theFKCursor
DEALLOCATE theFKCursor

GO

-- DROP any constraints from other tables into IMIS Tables (excluding tables being dropped in iMIS15)
SET NOCOUNT ON
DECLARE @sql nvarchar(2000)
DECLARE @tableName nvarchar(256)
DECLARE @fkName nvarchar(256)
DECLARE @dropped bit
DECLARE theFKCursor CURSOR FAST_FORWARD FOR 
	SELECT ctu.[TABLE_NAME], ctu.[CONSTRAINT_NAME] FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE ctu 
	   INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc ON ctu.[CONSTRAINT_NAME] = rc.[CONSTRAINT_NAME]
	   INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE ctu2 ON rc.[UNIQUE_CONSTRAINT_NAME] = ctu2.[CONSTRAINT_NAME]
	   LEFT OUTER JOIN [dbo].[IMISTable] i1 ON ctu.[TABLE_NAME] = i1.[IMISTableName] AND i1.[IsIMIS15Table] = 1
	   LEFT OUTER JOIN [dbo].[IMISTable] i2 ON ctu2.[TABLE_NAME] = i2.[IMISTableName] AND i2.[IsIMIS15Table] = 1
	WHERE i1.[IMISTableName] IS NULL AND i2.[IMISTableName] IS NOT NULL 

SET @dropped = 0
OPEN theFKCursor
FETCH NEXT FROM theFKCursor INTO @tableName, @fkName

WHILE @@FETCH_STATUS = 0 -- spin through FK entries
BEGIN
	IF (@dropped = 0)
	BEGIN
		PRINT 'INFO: ---------------------'
	END
	SELECT @sql = 'ALTER TABLE [' + @tableName + '] DROP CONSTRAINT [' + @fkName + ']'
	EXEC (@sql)
	PRINT @sql
	PRINT 'INFO: Dropping ' + @tableName + '.' + @fkName
	SET @dropped = 1
	FETCH NEXT FROM theFKCursor INTO @tableName, @fkName
END
CLOSE theFKCursor
DEALLOCATE theFKCursor

IF (@dropped = 1)
BEGIN
    PRINT 'INFO: ---------------------'
    PRINT 'INFO: You will need to manually restore the above FKs after upgrade completes'
END
GO
