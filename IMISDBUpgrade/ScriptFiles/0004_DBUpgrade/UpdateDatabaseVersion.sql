DECLARE @systemEntity uniqueidentifier
SELECT @systemEntity = SystemEntityKey FROM SystemEntity WHERE SystemKeyword = 'Organization'
UPDATE SystemConfig SET ParameterValue = '20'
 WHERE ParameterName = 'System.Database.Version.Major' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '2'
 WHERE ParameterName = 'System.Database.Version.Minor' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '9'
 WHERE ParameterName = 'System.Database.Version.Patch' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '640'
 WHERE ParameterName = 'System.Database.Version.Build' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
GO
UPDATE [System_Params] SET [ShortValue] = '20.2.9.640' where ParameterName = 'System_Control.Version'
GO
