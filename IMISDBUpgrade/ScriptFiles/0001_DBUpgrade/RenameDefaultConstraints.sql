SET QUOTED_IDENTIFIER OFF

DECLARE @tableName sysname 
DECLARE @columnName sysname
DECLARE @oldDefaultName sysname
DECLARE @newDefaultName sysname
DECLARE @default nvarchar(256)
DECLARE @oldDefault nvarchar(256)
DECLARE @sql nvarchar(4000)
DECLARE @total int
DECLARE @changed int

SET @total = 0
SET @changed = 0

DECLARE tableCursor CURSOR FAST_FORWARD FOR
    SELECT [IMISTableName] FROM [dbo].[IMISTable] 
     WHERE [IsIMIS15Table] = 1 AND [IMISTableName] != 'IMISTable'
     ORDER BY [IMISTableName] DESC

OPEN tableCursor

FETCH NEXT FROM tableCursor
   INTO @tableName

WHILE @@FETCH_STATUS = 0 
BEGIN 
    DECLARE defaultCursor CURSOR FAST_FORWARD FOR
        SELECT c_obj.[name], col.[name], com.[text]
          FROM [sysobjects] c_obj INNER JOIN [syscomments] com ON c_obj.id = com.id
                                INNER JOIN [sysobjects] t_obj ON c_obj.parent_obj = t_obj.id
                                INNER JOIN [sysconstraints] con ON c_obj.id = con.constid
                                INNER JOIN [syscolumns] col ON t_obj.id = col.id AND con.colid = col.colid
         WHERE c_obj.xtype = 'D' AND   t_obj.name = @tableName 

    OPEN defaultCursor

    FETCH NEXT FROM defaultCursor
       INTO @oldDefaultName, @columnName, @default

    WHILE @@FETCH_STATUS = 0
    BEGIN

        SET @newDefaultName = 'DF_' + @tableName + '_' + @columnName
        SET @oldDefault = @default
        SET @default = dbo.fn_asi_StripParens(@default)
        IF (CHARINDEX('''', @oldDefault) > 0) AND LEFT(@default, 1) != '''' AND LEFT(@default, 2) != 'N'''
            SET @default = '''' + @default + ''''

        SET @total = @total + 1
        IF (@oldDefaultName <> @newDefaultName)
        BEGIN
            SET @changed = @changed + 1
            -- Drop the old Default
            SET @sql = 'ALTER TABLE [dbo].[' + @tableName + '] DROP CONSTRAINT ' + @oldDefaultName
            PRINT @sql
            EXEC (@sql)

            -- Add the new Default
            SET @sql = 'ALTER TABLE [dbo].[' + @tableName + '] ADD CONSTRAINT ' + @newDefaultName  + ' DEFAULT (' + @default + ') FOR ' + @columnName
            PRINT @sql
            EXEC (@sql)
        END

        FETCH NEXT FROM defaultCursor
           INTO @oldDefaultName, @columnName, @default
    END

    CLOSE defaultCursor
    DEALLOCATE defaultCursor

    FETCH NEXT FROM tableCursor
       INTO @tableName

END

PRINT 'Total Defaults  : ' + CAST(@total AS nvarchar(9))
PRINT 'Defaults Changed: ' + CAST(@changed AS nvarchar(9))

CLOSE tableCursor
DEALLOCATE tableCursor

SET QUOTED_IDENTIFIER ON
