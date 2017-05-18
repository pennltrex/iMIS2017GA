-------------------------------------------------------------------------
-- This Script fixes issues with mismatched aliases, users, and logins --
-- and will always issue error messages.  These error messages may be  --
-- safely ignored.  The commands are duplicated in order to catch all  --
-- known errors... this is not a mistake in the script.                --
-------------------------------------------------------------------------

DECLARE @dbname nvarchar(100)
DECLARE @mgrname nvarchar(200)
DECLARE @usrname nvarchar(200)
SELECT @dbname = db_name()
SELECT @mgrname = 'MANAGER_' + @dbname
SELECT @usrname = 'IMISUSER_' + @dbname

EXEC sp_dropalias @mgrname
EXEC sp_dropuser @mgrname
EXEC sp_droplogin @mgrname
EXEC sp_dropalias @usrname
EXEC sp_dropuser @usrname
EXEC sp_droplogin @usrname

GO

DECLARE @dbname nvarchar(100)
DECLARE @mgrname nvarchar(200)
DECLARE @usrname nvarchar(200)
SELECT @dbname = db_name()
SELECT @mgrname = 'MANAGER_' + @dbname
SELECT @usrname = 'IMISUSER_' + @dbname

EXEC sp_dropalias @mgrname
EXEC sp_dropuser @mgrname
EXEC sp_droplogin @mgrname
EXEC sp_dropalias @usrname
EXEC sp_dropuser @usrname
EXEC sp_droplogin @usrname

GO
