-- Fix error in flag settings in AccessArea table
UPDATE [dbo].[AccessArea]
   SET [IsContentACL] = 1
 WHERE [IsContentACL] = 0 AND [Name] LIKE 'CA+%'
GO

