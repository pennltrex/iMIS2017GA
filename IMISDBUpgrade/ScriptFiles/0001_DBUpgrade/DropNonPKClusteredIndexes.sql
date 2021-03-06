SET NOCOUNT ON
/*
DECLARE @sql nvarchar(2000)
DECLARE @tableName sysname
DECLARE @indexName sysname

DECLARE theClusteredIndexCursor CURSOR FAST_FORWARD FOR 
    SELECT DISTINCT OBJECT_NAME(i.[object_id]) AS [TableName], 
           i.[name] AS [IndexName]
      FROM sys.objects o 
           INNER JOIN sys.indexes i on o.[object_id] = i.[object_id]
           INNER JOIN IMISTable t ON OBJECT_NAME(i.[object_id]) = t.[IMISTableName]
    WHERE i.[type] = 1 AND i.[is_primary_key] = 0 -- Is Clustered but not Primary Key
      AND i.[name] NOT LIKE 'PK%'
      AND OBJECTPROPERTY(i.[object_id], 'IsMsShipped') = 0
    ORDER BY [TableName], [IndexName];

OPEN theClusteredIndexCursor
FETCH NEXT FROM theClusteredIndexCursor INTO @tableName, @indexName

WHILE @@FETCH_STATUS = 0 -- spin through index entries
BEGIN
    SELECT @sql = 'DROP INDEX [' + @tableName + '].[' + @indexName + ']'
    EXEC (@sql)
    FETCH NEXT FROM theClusteredIndexCursor INTO @tableName, @indexName
END
CLOSE theClusteredIndexCursor
DEALLOCATE theClusteredIndexCursor
*/
GO

