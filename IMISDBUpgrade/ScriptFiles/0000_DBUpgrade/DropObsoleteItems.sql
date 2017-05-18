---------------------------------------------------
-- Drop or delete any obsolete DB schema or rows --
---------------------------------------------------
SET NOCOUNT ON

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEImisProductGetAllWebEnabledBilling]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BAEImisProductGetAllWebEnabledBilling]
GO

SET NOCOUNT OFF
