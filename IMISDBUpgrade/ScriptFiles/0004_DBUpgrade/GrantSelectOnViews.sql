IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[asi_GrantSelectOnViews]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[asi_GrantSelectOnViews]
GO

-- Ensure all BO views have proper permissions
CREATE PROCEDURE [dbo].[asi_GrantSelectOnViews] 
AS
BEGIN
DECLARE @vwName nvarchar(100)
DECLARE @sql nvarchar(1000)

DECLARE theCursor CURSOR FORWARD_ONLY FOR 
	SELECT so.[name] FROM sysobjects so INNER JOIN sysusers su ON so.uid = su.uid
		WHERE [type] = 'V' AND su.[name] = 'dbo' AND so.[name] LIKE 'vBo%'
	
OPEN theCursor

FETCH NEXT FROM theCursor 
	INTO @vwName

WHILE @@FETCH_STATUS = 0 -- spin through entries
BEGIN
	SET @sql = 'GRANT SELECT ON [dbo].[' + @vwName + '] to public'
	EXEC (@sql)
	FETCH NEXT FROM theCursor 
		INTO @vwName
END
CLOSE theCursor
DEALLOCATE theCursor
END
GO

EXEC [dbo].[asi_GrantSelectOnViews]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[asi_GrantSelectOnViews]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[asi_GrantSelectOnViews]
GO
