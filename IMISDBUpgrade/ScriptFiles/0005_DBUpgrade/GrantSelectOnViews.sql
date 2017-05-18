DECLARE @viewName sysname;
DECLARE @sql nvarchar(1000);

DECLARE theCursor CURSOR FORWARD_ONLY FOR 
    SELECT o.[name]
      FROM sys.objects o
           INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
     WHERE o.[type] = 'V' AND s.[name] = N'dbo' AND o.[name] LIKE 'vBO%'
     ORDER BY o.[name];
     
OPEN theCursor;
FETCH NEXT FROM theCursor INTO @viewName;

WHILE @@FETCH_STATUS = 0 -- spin through entries
BEGIN
    SET @sql = 'GRANT SELECT ON [dbo].[' + @viewName + '] to public'
    EXEC (@sql);
    FETCH NEXT FROM theCursor INTO @viewName;
END
CLOSE theCursor;
DEALLOCATE theCursor;
