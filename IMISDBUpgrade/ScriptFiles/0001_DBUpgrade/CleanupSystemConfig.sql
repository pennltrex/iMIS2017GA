-- This template has tokens replaced for running:
--
-- C:\Windows\Temp\BRADSHAW-WIN7-SQL2008CI_Main10Upgrade1513 and C:\tfs\iMIS\Main10\imis.net get substituted at upgrade time
--
--
UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\Windows\Temp\BRADSHAW-WIN7-SQL2008CI_Main10Upgrade1513' 
 WHERE [ParameterName] = 'TempDirectory'
GO

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\Windows\Temp\BRADSHAW-WIN7-SQL2008CI_Main10Upgrade1513' 
 WHERE [ParameterName] = 'CrystalReports.TempPath'
GO

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\Windows\Temp\BRADSHAW-WIN7-SQL2008CI_Main10Upgrade1513' 
 WHERE [ParameterName] = 'ReportingServices.TempPath'
GO

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\tfs\iMIS\Main10\imis.net\bootstrap'
 WHERE [ParameterName] = 'BootStrap.Path'
GO

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\tfs\iMIS\Main10\imis.net\iMIS\AtomControls'
 WHERE [ParameterName] = 'AtomBuildPath'
GO

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'C:\tfs\iMIS\Main10\imis.net\bin'
 WHERE [ParameterName] = 'CorrespondenceManagement.XslPath'
GO

