SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO

-- Disable all triggers in the database
DECLARE @string varchar(8000)
DECLARE @tableName nvarchar(500)
DECLARE cur CURSOR FAST_FORWARD FOR 
    SELECT DISTINCT(S2.[name]) AS [TableName]
    FROM sysobjects S1 JOIN sysobjects S2 ON S1.[parent_obj] = S2.[id] WHERE S1.[xtype] = 'TR'
OPEN cur
FETCH NEXT FROM cur INTO @tableName
WHILE @@fetch_status = 0
BEGIN
    SET @string ='DISABLE TRIGGER ALL ON ' + @tableName
    EXEC (@string)
    FETCH NEXT FROM cur INTO @tableName
END
CLOSE cur
DEALLOCATE cur
GO

-- Update any UserKey in any column that references a key that doesn't exist in UserMain to be the MANAGER key
DECLARE @managerKey uniqueidentifier
DECLARE @tableName sysname
DECLARE @columnName sysname
DECLARE @sql nvarchar(2000)
SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

DECLARE theCursor CURSOR FAST_FORWARD FOR
    SELECT isc.TABLE_NAME, isc.COLUMN_NAME 
      FROM INFORMATION_SCHEMA.COLUMNS isc INNER JOIN 
           INFORMATION_SCHEMA.TABLES ist ON isc.TABLE_NAME = ist.TABLE_NAME INNER JOIN
           IMISTable ON ist.TABLE_NAME = IMISTable.IMISTableName
     WHERE isc.COLUMN_NAME like '%UserKey' AND isc.DATA_TYPE = 'uniqueidentifier' AND ist.TABLE_TYPE = 'BASE TABLE' AND ist.TABLE_SCHEMA = 'dbo'
       AND isc.TABLE_NAME NOT IN ('UserMain', 'PciAuditLog') AND isc.COLUMN_NAME != 'RespondentUserKey'
     ORDER BY isc.TABLE_NAME, isc.COLUMN_NAME
OPEN theCursor
FETCH NEXT from theCursor INTO @tableName, @columnName
WHILE (@@FETCH_STATUS =0)
BEGIN
    SET @sql = 'UPDATE a SET a.[' + @columnName + '] = ''' + CAST(@managerKey AS nvarchar(40)) + 
              ''' FROM [dbo].[' + @tableName + '] a LEFT OUTER JOIN [dbo].[UserMain] b ON a.[' + 
              @columnName + '] = b.[UserKey] WHERE a.[' + @columnName + '] IS NOT NULL AND b.[UserKey] IS NULL'
    PRINT @tableName + '.' + @columnName
    EXEC (@sql)
    FETCH NEXT from theCursor INTO @tableName, @columnName
END
CLOSE theCursor
DEALLOCATE theCursor
GO

-- Ensure manager user cannot expire
UPDATE [UserMain] SET [ExpirationDate] = NULL WHERE [UserId] = 'MANAGER'
GO

-- Enable all triggers in the database
DECLARE @string varchar(8000)
DECLARE @tableName nvarchar(500)
DECLARE cur CURSOR FAST_FORWARD FOR 
    SELECT DISTINCT(S2.[name]) AS [TableName]
    FROM sysobjects S1 JOIN sysobjects S2 ON S1.[parent_obj] = S2.[id] WHERE S1.[xtype] = 'TR'
OPEN cur
FETCH NEXT FROM cur INTO @tableName
WHILE @@fetch_status = 0
BEGIN
    SET @string ='ENABLE TRIGGER ALL ON ' + @tableName
    EXEC (@string)
    FETCH NEXT FROM cur INTO @tableName
END
CLOSE cur
DEALLOCATE cur
GO
