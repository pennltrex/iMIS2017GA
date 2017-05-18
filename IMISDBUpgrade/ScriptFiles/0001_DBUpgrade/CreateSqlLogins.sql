-- script to fix up a restored iMIS db for iMIS15
--    Henry Huey 13 Sept 2006
--    Paul Bradshaw 15 Feb 2010
SET NOCOUNT ON

------------------------------------
-- create the IMIS role if necessary
------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE [name] = 'IMIS' AND [type_desc] = 'DATABASE_ROLE' )
BEGIN
	CREATE ROLE [IMIS] AUTHORIZATION [dbo]
END
GO

-- Drop obsolete System_Param values if present
DELETE FROM System_Params 
 WHERE ParameterName = 'System_Control.WebServerURL'

-- Ensure correct security model is set for backwards compatability
UPDATE System_Params SET ShortValue = '3'
 WHERE ParameterName = 'System_Control.SQLSecurityModel'
GO

----------------------------------------------
-- Create the Master and Manager SQL passwords
----------------------------------------------
DECLARE @password nvarchar(50)
SELECT @password = newid()

DELETE FROM System_Params 
 WHERE ParameterName = 'System_Control.SQLManagerPassword'
	
INSERT INTO System_Params (ParameterName, ShortValue) 
VALUES ('System_Control.SQLManagerPassword', @password)

DELETE FROM System_Params 
 WHERE ParameterName = 'System_Control.SQLMasterPassword'

INSERT INTO System_Params (ParameterName, ShortValue) 
VALUES ('System_Control.SQLMasterPassword', @password)
GO

----------------------------------------
-- Create the MANAGER reserved SQL login
----------------------------------------
DECLARE @userName  nvarchar(200)
DECLARE @execSQL nvarchar(1000)
DECLARE @userPassword nvarchar(200)

SELECT @userName = 'MANAGER' + '_' + DB_NAME()
SELECT @userPassword = ShortValue FROM System_Params 
	WHERE ParameterName = 'System_Control.SQLManagerPassword'

-- Drop MANAGER schema, alias, db user, and login if they already exist
IF EXISTS (SELECT 1 FROM sys.schemas WHERE [name] = @userName)
BEGIN
	SELECT @execSQL = 'DROP SCHEMA [' + @userName + ']'
	EXEC (@execSQL)
END

DECLARE @aliasName  nvarchar(200)
SELECT @aliasName = name FROM sys.sysusers WHERE name LIKE '%' + @userName and isaliased = 1
IF DATALENGTH (@aliasName) > 0
BEGIN
	EXEC sp_dropalias @userName
END

IF EXISTS (SELECT 1 FROM sys.sysusers WHERE name = @userName)
BEGIN
    EXEC sp_dropuser @userName
END

IF EXISTS (SELECT 1 FROM sys.sql_logins WHERE name = @userName)
BEGIN
	EXEC sp_droplogin @userName
END

-- Add MANAGER login, user, and add user to roles
IF NOT EXISTS(SELECT name FROM sys.syslogins WHERE [name] = @userName)
BEGIN
	SELECT @execSQL = 'sp_addlogin [' + @userName + '], ''' + @userPassword + ''', ' + db_name()
	EXEC (@execSQL)
END

IF NOT EXISTS (SELECT 1 FROM sys.sysusers WHERE [name] = @userName) 
BEGIN
	SELECT @execSQL = 'sp_adduser [' + @userName + '],  [' + @userName + ']'
	EXEC (@execSQL)
END

-- Add MANAGER to db_owner
SELECT @execSQL = 'sp_addrolemember ''db_owner'', [' + @userName + ']' 
EXEC (@execSQL)

-----------------------------------------
-- create the IMISUSER reserved SQL login
-----------------------------------------
SELECT @userName = 'IMISUSER' + '_' + db_name()
SELECT @userPassword = ShortValue FROM System_Params 
	WHERE ParameterName = 'System_Control.SQLMasterPassword'

-- Drop IMISUSER schema, user, and login
IF EXISTS (SELECT 1 from sys.schemas WHERE [name] = @userName)
BEGIN
	SELECT @execSQL = 'DROP SCHEMA [' + @userName + ']'
	EXEC (@execSQL)
END

IF EXISTS (SELECT 1 FROM sys.sysusers WHERE [name] = @userName)
BEGIN
    EXEC sp_dropuser @userName
END

IF EXISTS (SELECT 1 FROM master..syslogins WHERE [name] = @userName)
BEGIN
	EXEC sp_droplogin @userName
END

-- Add the IMIS login, user, and add user to roles
IF NOT EXISTS(SELECT [name] FROM master.dbo.syslogins WHERE [name] = @userName)
BEGIN
	SELECT @execSQL = 'sp_addlogin [' + @userName + '], ''' + @userPassword + ''', ' + db_name()
	EXEC (@execSQL)
END

IF NOT EXISTS (SELECT 1 FROM sys.sysusers WHERE [name] = @userName) 
BEGIN
	SELECT @execSQL = 'sp_adduser [' + @userName + '], [' + @userName + ']'
	EXEC (@execSQL)
END

-- Add IMISUSER to IMIS role
SELECT @execSQL = 'sp_addrolemember ''IMIS'', [' + @userName + ']'
EXEC (@execSQL)
GO

-- Fix up any orphan Name_Security_Groups
INSERT INTO Name_Security_Groups (ID, SECURITY_GROUP)
	SELECT ID, '' FROM Name_Security 
		WHERE ID NOT IN (SELECT ID FROM Name_Security_Groups)

SET NOCOUNT OFF
GO
