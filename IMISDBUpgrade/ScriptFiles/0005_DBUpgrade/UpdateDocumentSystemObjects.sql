----------------------------------------------------------------------------------------
-- This script is to allow modifying document-system related data AFTER all the new
-- and updated documents have been loaded, but prior to restoring FK constraints, etc.
----------------------------------------------------------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script

-----------------------------------------------------------------------------------
-- PBI 52917 - Hide the Manage Duplicates documents with the DUPMERGE license key
-----------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1EE98303-5562-42B2-B535-8CAFF809A077' AND [UniformKey] = '572B535F-034A-485F-92A2-B21AB2A3E52C')
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey])
    VALUES ('1EE98303-5562-42B2-B535-8CAFF809A077', '572B535F-034A-485F-92A2-B21AB2A3E52C') -- nav item
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '1EE98303-5562-42B2-B535-8CAFF809A077' AND [UniformKey] = 'A3AE5570-AA35-4E45-8331-F428AD838129')
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey])
    VALUES ('1EE98303-5562-42B2-B535-8CAFF809A077', 'A3AE5570-AA35-4E45-8331-F428AD838129') -- content record
END
GO

------------------------------------------
-- PBI 54255:v10/v100 Licensing - Cleanup existing license table and code
------------------------------------------

-- Secure new LicenseRef BO with the ISABETA license key
DECLARE @DocumentVersionKey uniqueidentifier;
SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'LicenseRef' AND [DocumentTypeCode] = 'BOD'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM [dbo].[DocumentMain] WHERE [DocumentName] = 'LicenseRef' AND [DocumentTypeCode] = 'BUS'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

SELECT TOP 1 @DocumentVersionKey = [DocumentVersionKey] FROM DocumentMain WHERE DocumentName = 'LicenseRef' AND [DocumentTypeCode] = 'DBS'
IF @DocumentVersionKey IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[UniformLicense] WHERE [LicenseKey] = '85B28521-74BA-4C03-B920-919C618A9A2C' AND [UniformKey] = @DocumentVersionKey)
BEGIN
    INSERT INTO [dbo].[UniformLicense] ([LicenseKey], [UniformKey]) VALUES ('85B28521-74BA-4C03-B920-919C618A9A2C', @DocumentVersionKey)
END

-------------------------
-- End of script
SET NOCOUNT OFF
GO
