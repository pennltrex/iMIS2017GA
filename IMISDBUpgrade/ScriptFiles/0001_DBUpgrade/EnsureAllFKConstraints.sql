SET NOCOUNT ON
DECLARE @sql nvarchar(512)
DECLARE @tableName sysname;
DECLARE @fkName sysname;

DECLARE theFKCursor CURSOR FAST_FORWARD FOR 
    SELECT tbl.[name] AS [TableName], fk.[name] AS[FkName]
      FROM sys.foreign_keys fk
           INNER JOIN sys.tables tbl ON fk.[parent_object_id] = tbl.[object_id]
           INNER JOIN IMISTable it ON tbl.[name] = it.[IMISTableName]
     WHERE fk.[is_not_trusted] = 1
     ORDER BY tbl.[name], fk.[Name]

OPEN theFKCursor
FETCH NEXT FROM theFKCursor INTO @tableName, @fkName

WHILE @@FETCH_STATUS = 0 -- spin through FK entries
BEGIN
    SELECT @sql = 'ALTER TABLE [' + @tableName + '] WITH CHECK CHECK CONSTRAINT [' + @fkName + ']'
    EXEC (@sql)
    FETCH NEXT FROM theFKCursor INTO @tableName, @fkName
END
CLOSE theFKCursor
DEALLOCATE theFKCursor
