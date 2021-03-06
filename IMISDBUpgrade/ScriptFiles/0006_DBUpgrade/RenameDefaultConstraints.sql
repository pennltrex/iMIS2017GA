DECLARE @tableName sysname;
DECLARE @columnName sysname;
DECLARE @oldDefaultName sysname;
DECLARE @newDefaultName sysname;
DECLARE @default nvarchar(256);
DECLARE @oldDefault nvarchar(256);
DECLARE @sql nvarchar(4000);
DECLARE @total int;
DECLARE @changed int;

SET @total = 0;
SET @changed = 0;

DECLARE tableCursor CURSOR FAST_FORWARD FOR
    SELECT [IMISTableName] FROM [dbo].[IMISTable] 
     WHERE [IsIMIS15Table] = 1 AND [IMISTableName] != N'IMISTable'
     ORDER BY [IMISTableName] DESC;

OPEN tableCursor;

FETCH NEXT FROM tableCursor INTO @tableName;

WHILE @@FETCH_STATUS = 0 
BEGIN 
    DECLARE defaultCursor CURSOR FAST_FORWARD FOR
        SELECT d.[name] AS [DefaultName], c.[name] AS [ColumnName], d.[definition] AS [DefaultConstraint]
          FROM sys.columns c
               INNER JOIN sys.default_constraints d ON c.[object_id] = d.[parent_object_id] AND c.[column_id] = d.[parent_column_id]
               INNER JOIN sys.objects t ON c.[object_id] = t.[object_id]
        WHERE t.[type] = 'U'
          AND t.[name] = @tableName 
        ORDER BY [DefaultName];

    OPEN defaultCursor;

    FETCH NEXT FROM defaultCursor
       INTO @oldDefaultName, @columnName, @default;

    WHILE @@FETCH_STATUS = 0
    BEGIN

        SET @newDefaultName = 'DF_' + @tableName + '_' + @columnName;
        SET @oldDefault = @default;
        SET @default = dbo.asi_StripParens(@default);
        IF (CHARINDEX('''', @oldDefault) > 0) AND LEFT(@default, 1) != '''' AND LEFT(@default, 2) != 'N'''
            SET @default = '''' + @default + '''';

        SET @total = @total + 1;
        IF (@oldDefaultName <> @newDefaultName)
        BEGIN
            SET @changed = @changed + 1;
            -- Drop the old Default
            SET @sql = N'ALTER TABLE [dbo].[' + @tableName + N'] DROP CONSTRAINT ' + @oldDefaultName;
            PRINT @sql;
            EXEC (@sql);

            -- Add the new Default
            SET @sql = N'ALTER TABLE [dbo].[' + @tableName + N'] ADD CONSTRAINT ' + @newDefaultName  + N' DEFAULT (' + @default + N') FOR ' + @columnName
            PRINT @sql;
            EXEC (@sql);
        END

        FETCH NEXT FROM defaultCursor
           INTO @oldDefaultName, @columnName, @default;
    END

    CLOSE defaultCursor;
    DEALLOCATE defaultCursor;

    FETCH NEXT FROM tableCursor
       INTO @tableName;

END

PRINT 'Total Defaults  : ' + CAST(@total AS nvarchar(9));
PRINT 'Defaults Changed: ' + CAST(@changed AS nvarchar(9));

CLOSE tableCursor;
DEALLOCATE tableCursor;
