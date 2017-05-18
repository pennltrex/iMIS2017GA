DECLARE @systemEntity uniqueidentifier
SELECT @systemEntity = SystemEntityKey FROM SystemEntity WHERE SystemKeyword = 'Organization'
UPDATE SystemConfig SET ParameterValue = '15'
 WHERE ParameterName = 'System.Database.Version.Major' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '2'
 WHERE ParameterName = 'System.Database.Version.Minor' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '23'
 WHERE ParameterName = 'System.Database.Version.Patch' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
UPDATE SystemConfig SET ParameterValue = '5635'
 WHERE ParameterName = 'System.Database.Version.Build' AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
GO
UPDATE [System_Params] SET [ShortValue] = '15.2.23.5635' where ParameterName = 'System_Control.Version'
GO
