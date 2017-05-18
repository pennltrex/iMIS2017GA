----------------------------------
-- Modify Existing Table Schema --
----------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO
-- Beginning of script
------------------------------------------------------------------------------------------------------------------------------
-- Update the PublishQueue table if it already exists
------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue' AND COLUMN_NAME = 'ItemCode')
    BEGIN
        ALTER TABLE [dbo].[PublishQueue] ADD [ItemCode] varchar(32) NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue' AND COLUMN_NAME = 'ItemAction')
    BEGIN
        ALTER TABLE [dbo].[PublishQueue] ADD [ItemAction] int NULL
    END
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PublishQueue' AND COLUMN_NAME = 'PublishedByUserKey')
    BEGIN
        ALTER TABLE [dbo].[PublishQueue] ALTER COLUMN [PublishedByUserKey] uniqueidentifier NULL;
    END
END
GO

------------------------------------------------------------------
-- Update the length of the DocumentTypeCode column from 3 to 6 --
------------------------------------------------------------------

-- Drop FK Reference
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentMain_DocumentTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentMain]'))
    ALTER TABLE [dbo].[DocumentMain] DROP CONSTRAINT [FK_DocumentMain_DocumentTypeRef]

-- Change length of DocumentMain.DocumentTypeCode to be 6 characters, up from 3
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentMain')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentMain' AND COLUMN_NAME = 'DocumentTypeCode')
    BEGIN
        ALTER TABLE [dbo].[DocumentMain] ALTER COLUMN [DocumentTypeCode] nvarchar(6) NOT NULL
    END
END

-- Change length of DocumentTypeRef.DocumentTypeCode to be 6 characters, up from 3
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentTypeRef')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentTypeRef' AND COLUMN_NAME = 'DocumentTypeCode')
    BEGIN
        ALTER TABLE [dbo].[DocumentTypeRef] ALTER COLUMN [DocumentTypeCode] nvarchar(6) NOT NULL
    END
END

-- Add column DocumentDownloadLink to table DocumentTypeRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentTypeRef')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DocumentTypeRef' AND COLUMN_NAME = 'DocumentDownloadLink')
    BEGIN
        ALTER TABLE [DocumentTypeRef] ADD [DocumentDownloadLink] nvarchar(255) NULL
    END
END

-- Restore FK Reference
ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_DocumentTypeRef] 
    FOREIGN KEY([DocumentTypeCode]) REFERENCES [dbo].[DocumentTypeRef] ([DocumentTypeCode])
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_DocumentTypeRef]
GO

---------------------------------------------------------------------------------------
-- Drop DuesCycles.TIME_STAMP column to allow columns to be appended to DuesCycles
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[DuesCycles] DROP COLUMN [TIME_STAMP]
    END
END
GO

------------------------------------------------------------------
-- Add new DuesCycles.IS_FOR_JOIN NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles' AND COLUMN_NAME = 'IS_FOR_JOIN')
    BEGIN
        ALTER TABLE [dbo].[DuesCycles] ADD [IS_FOR_JOIN] bit 
              CONSTRAINT DF_DuesCycles_IS_FOR_JOIN DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new DuesCycles.IS_FOR_RENEW NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles' AND COLUMN_NAME = 'IS_FOR_RENEW')
    BEGIN
        ALTER TABLE [dbo].[DuesCycles] ADD [IS_FOR_RENEW] bit 
              CONSTRAINT DF_DuesCycles_IS_FOR_RENEW DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column DuesCycles.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuesCycles' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[DuesCycles] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Meet_Master.TIME_STAMP column to allow columns to be appended to Meet_Master
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] DROP COLUMN [TIME_STAMP]
    END
END
GO

--------------------------------------------------------------------------
-- Add new Meet_Master.FORM_DEFINITION_ID NULL column
-- This is a string representation of a Guid corresponding to 
-- FormDefinition.FormDefinitionKey
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'FORM_DEFINITION_ID')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [FORM_DEFINITION_ID] varchar(36)
            CONSTRAINT DF_Meet_Master_Form_Definition_ID DEFAULT ('') NOT NULL
    END
END
GO

--------------------------------------------------------------------------
-- Add new Meet_Master.FORM_DEFINITION_SECTION_ID NULL column
-- This is a string representation of a Guid corresponding to 
-- FormDefinitionSection.FormDefinitionSectionKey
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Meet_Master' 
        AND COLUMN_NAME = 'FORM_DEFINITION_SECTION_ID')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [FORM_DEFINITION_SECTION_ID] varchar(36)
            CONSTRAINT DF_Meet_Master_Form_Definition_Section_ID DEFAULT ('') NOT NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Meet_Master.PUBLISH_START_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'PUBLISH_START_DATE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [PUBLISH_START_DATE] datetime NULL
    END
END
GO
------------------------------------------
-- Add a new NULL column Meet_Master.PUBLISH_END_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'PUBLISH_END_DATE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [PUBLISH_END_DATE] datetime NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Meet_Master.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Product_Function.TIME_STAMP column to allow columns to be appended to Product_Function
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] DROP COLUMN [TIME_STAMP]
    END
END
GO

--------------------------------------------------------------------------
-- Add new Product_Function.FORM_DEFINITION_SECTION_ID NULL column
-- This is a string representation of a Guid corresponding to 
-- FormDefinitionSection.FormDefinitionSectionKey
--------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = 'dbo' 
        AND TABLE_NAME = 'Product_Function' 
        AND COLUMN_NAME = 'FORM_DEFINITION_SECTION_ID')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [FORM_DEFINITION_SECTION_ID] varchar(36)
            CONSTRAINT DF_Product_Function_Form_Definition_Section_ID DEFAULT ('') NOT NULL

    END
END
GO

------------------------------------------------
-- Add a new NULL column Product_Function.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product_Function' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Product_Function] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

-----------------------------------------
-- Fix up default on URLMapping column --
-----------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
           WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'URLMapping' AND COLUMN_NAME = 'URLMappingTypeCode')
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sys.default_constraints d
                    INNER JOIN sys.columns c ON d.parent_object_id = c.object_id AND d.parent_column_id = c.column_id
                    WHERE OBJECT_NAME(d.parent_object_id) = 'URLMapping' AND c.name = 'URLMappingTypeCode')
    BEGIN
        ALTER TABLE [dbo].[URLMapping] ADD CONSTRAINT [DF_URLMapping_URLMappingTypeCode] DEFAULT (10) FOR [URLMappingTypeCode]
    END
END
GO

----------------------------------
-- Make PhysicalAddress.CountryCode nullable
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress')

BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhysicalAddress' AND COLUMN_NAME = 'CountryCode')
    BEGIN
        ALTER TABLE [dbo] .[PhysicalAddress] ALTER COLUMN [CountryCode] [nchar](2) NULL
    END
END
GO

-- PBI 39041 Certification (v10)
------------------------------------------------------------------
-- Remove obsolete object data
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'RegistrationStatusChange') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedContactKey' and Object_ID = Object_ID('RegistrationStatusChange')) 
BEGIN
    DELETE FROM [dbo].[RegistrationStatusChange]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistrationCertificationModule') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CertificationProgramRegistration'))
BEGIN 
    DELETE FROM [dbo].[CertificationProgramRegistrationCertificationModule]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModuleRegistration') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CertificationProgramRegistration'))
BEGIN 
    DELETE FROM [dbo].[CertificationModuleRegistration]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CertificationProgramRegistration'))
BEGIN 
    DELETE FROM [dbo].[CertificationProgramRegistration]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'OfferedCustomerExperience') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CustomerExperience')) 	
BEGIN
    DELETE FROM [dbo].[OfferedCustomerExperience]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperience') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CustomerExperience')) 	
BEGIN
    DELETE FROM [dbo].[CustomerExperience]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperienceStatusChange') AND NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedContactKey' and Object_ID = Object_ID('CustomerExperienceStatusChange')) 
BEGIN
    DELETE FROM [dbo].[CustomerExperienceStatusChange]
END
GO

------------------------------------------------------------------
-- Add new CertificationProgramRegistration.ContactKey, RegistrationStatusChange.StatusChangedContactKey 
-- CustomerExperience.ContactKey and CustomerExperienceStatusChange.StatusChangedContactKey NOT NULL column.
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration')
BEGIN
    IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CertificationProgramRegistration'))
    BEGIN
        ALTER TABLE [dbo].[CertificationProgramRegistration] ADD [ContactKey] uniqueidentifier NOT NULL		
    END	
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'RegistrationStatusChange')
BEGIN
    IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedContactKey' and Object_ID = Object_ID('RegistrationStatusChange')) 
    BEGIN			
        ALTER TABLE [dbo].[RegistrationStatusChange] ADD [StatusChangedContactKey] uniqueidentifier NOT NULL					
    END
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperience')
BEGIN
    IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'ContactKey' and Object_ID = Object_ID('CustomerExperience')) 	
    BEGIN
        ALTER TABLE [dbo].[CustomerExperience] ADD [ContactKey] uniqueidentifier NOT NULL	
    END	
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperienceStatusChange')
BEGIN
    IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedContactKey' and Object_ID = Object_ID('CustomerExperienceStatusChange')) 
    BEGIN
        ALTER TABLE [dbo].[CustomerExperienceStatusChange] ADD [StatusChangedContactKey] uniqueidentifier NOT NULL			
    END
END
GO

-------------------------------------
-- Drop the obsolete column field
-------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration')
BEGIN
    IF EXISTS(SELECT * FROM sys.columns WHERE Name = 'UserKey' and Object_ID = Object_ID('CertificationProgramRegistration'))	
    BEGIN
        ALTER TABLE [dbo].[CertificationProgramRegistration] DROP COLUMN [UserKey]
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'RegistrationStatusChange')
BEGIN
    IF EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedUserKey' and Object_ID = Object_ID('RegistrationStatusChange'))
    BEGIN 			
        ALTER TABLE [dbo].[RegistrationStatusChange] DROP COLUMN [StatusChangedUserKey]
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperience')
BEGIN
    IF EXISTS(SELECT * FROM sys.columns WHERE Name = 'UserKey' and Object_ID = Object_ID('CustomerExperience')) 
    BEGIN	
        ALTER TABLE [dbo].[CustomerExperience] DROP COLUMN [UserKey]	
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperienceStatusChange')
BEGIN
    IF EXISTS(SELECT * FROM sys.columns WHERE Name = 'StatusChangedUserKey' and Object_ID = Object_ID('CustomerExperienceStatusChange'))
    BEGIN 			
        ALTER TABLE [dbo].[CustomerExperienceStatusChange] DROP COLUMN [StatusChangedUserKey]
    END
END
GO

------------------------------------------
-- Add a new NULL column CertificationModule.AttachmentInstructions
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule' AND COLUMN_NAME = 'AttachmentInstructions')
    BEGIN
        ALTER TABLE [dbo].[CertificationModule] ADD [AttachmentInstructions] nvarchar(250) NULL
    END
END
GO

------------------------------------------
-- Add a new NOT NULL column CertificationModule.FileAttachment
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule' AND COLUMN_NAME = 'FileAttachment')
    BEGIN
        ALTER TABLE [dbo].[CertificationModule] ADD [FileAttachment] tinyint 
              CONSTRAINT DF_CertificationModule_FileAttachment DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column CertificationModuleRegistration.FileAttachmentDocumentKey
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModuleRegistration')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModuleRegistration' AND COLUMN_NAME = 'FileAttachmentDocumentKey')
    BEGIN
        ALTER TABLE [dbo].[CertificationModuleRegistration] ADD [FileAttachmentDocumentKey] uniqueidentifier NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column CertificationModuleRegistration.AvailableUnits
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModuleRegistration')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModuleRegistration' AND COLUMN_NAME = 'AvailableUnits')
    BEGIN
        ALTER TABLE [dbo].[CertificationModuleRegistration] ADD [AvailableUnits] [decimal](18, 9) NULL
    END
END
GO

------------------------------------------------------------------
-- Add new CertificationModule.EnrolleeCanRecordFlag NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationModule' AND COLUMN_NAME = 'EnrolleeCanRecordFlag')
    BEGIN
        ALTER TABLE [dbo].[CertificationModule] ADD [EnrolleeCanRecordFlag] bit 
              CONSTRAINT DF_CertificationModule_EnrolleeCanRecordFlag DEFAULT (1) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new LocalizationPhrase.DoNotLocalize NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase' AND COLUMN_NAME = 'DoNotLocalize')
    BEGIN
        ALTER TABLE [dbo].[LocalizationPhrase] ADD [DoNotLocalize] bit 
              CONSTRAINT DF_LocalizationPhrase_DoNotLocalize DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new LocalizationPhrase.ControlType NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase' AND COLUMN_NAME = 'ControlType')
    BEGIN
        ALTER TABLE [dbo].[LocalizationPhrase] ADD [ControlType] nvarchar(50) 
              CONSTRAINT DF_LocalizationPhrase_ControlType DEFAULT ('') NOT NULL
    END
END
GO

---------------------------------------------------------
-- Change length of LocalizationPhrase.ControlType to be 300 characters
---------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationPhrase' AND COLUMN_NAME = 'ControlType')
    BEGIN
        ALTER TABLE [dbo].[LocalizationPhrase] ALTER COLUMN [ControlType] nvarchar(300) NOT NULL
    END
END
GO

------------------------------------------------------------------------
-- Add extra columns to AutoPayInstruction table for recurring donations
------------------------------------------------------------------------

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'AuthorizedPaymentAmount')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [AuthorizedPaymentAmount] numeric(18,4) 
                CONSTRAINT DF_AutoPayInstruction_AuthorizedPaymentAmount DEFAULT(0) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'IntervalTypeCode')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [IntervalTypeCode] int 
                CONSTRAINT DF_AutoPayInstruction_IntervalTypeCode DEFAULT(0) NOT NULL
                CONSTRAINT FK_AutoPayInstrution_IntervalTypeRef FOREIGN KEY REFERENCES [dbo].[IntervalTypeRef]([IntervalTypeCode])
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'CollectionDay')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [CollectionDay] int
                CONSTRAINT DF_AutoPayInstruction_CollectionDay DEFAULT(0) NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'ProductCode')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [ProductCode] varchar(31) 
            CONSTRAINT DF_AutoPayInstruction_ProductCode DEFAULT(NULL) NULL
            CONSTRAINT FK_AutoPayInstrution_Product FOREIGN KEY REFERENCES [dbo].[Product]([PRODUCT_CODE])
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'Appeal')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [Appeal] varchar(40) CONSTRAINT DF_AutoPayInstruction_Appeal DEFAULT('') NOT NULL            
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'Campaign')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [Campaign] varchar(10) CONSTRAINT DF_AutoPayInstruction_Campaign DEFAULT('') NOT NULL
    END
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'Fund')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] 
            ADD [Fund] varchar(10) CONSTRAINT DF_AutoPayInstruction_Fund DEFAULT('') NOT NULL
    END
END
GO

------------------------------------------------------------------------------------
-- Add a new NULL column AutoPayInstruction.PaymentTokenExpirationDate
------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AutoPayInstruction' AND COLUMN_NAME = 'PaymentTokenExpirationDate')
    BEGIN
        ALTER TABLE [dbo].[AutoPayInstruction] ADD [PaymentTokenExpirationDate] datetime NULL
    END
END
GO

---------------------------------------------------------------------------------------
-- Drop Order_Meet.TIME_STAMP column to allow columns to be appended to Order_Meet
---------------------------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Meet] DROP COLUMN [TIME_STAMP]
    END
END
GO

---------------------------------------------------------------------------------------
-- Add new columns to Order_Meet for guest registration
---------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet' AND COLUMN_NAME = 'PARENT_ORDER_NUMBER')
    BEGIN
        ALTER TABLE [dbo].[Order_Meet] ADD [PARENT_ORDER_NUMBER] numeric(15,2) NULL
    END
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet' AND COLUMN_NAME = 'REGISTERED_BY_ID')
    BEGIN
        ALTER TABLE [dbo].[Order_Meet] ADD [REGISTERED_BY_ID] varchar(10) NULL
    END
END
GO

------------------------------------------------
-- Add a new NULL column Order_Meet.TIME_STAMP
------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Order_Meet' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Order_Meet] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

-- Add computed column to support a peformance improvement via indexing
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserLegacyInfo')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserLegacyInfo' AND COLUMN_NAME = 'UPPERUserId')
    BEGIN
        ALTER TABLE [dbo].[UserLegacyInfo] 
          ADD UPPERUserId AS UPPER (UserId) 
    END
END
GO

-- Add new LocalizationVersionPhrase.DoNotLocalize NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase' AND COLUMN_NAME = 'DoNotLocalize')
    BEGIN
        ALTER TABLE [dbo].[LocalizationVersionPhrase] ADD [DoNotLocalize] bit 
              CONSTRAINT DF_LocalizationVersionPhrase_DoNotLocalize DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new LocalizationVersionPhrase.ControlType NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhrase' AND COLUMN_NAME = 'ControlType')
    BEGIN
        ALTER TABLE [dbo].[LocalizationVersionPhrase] ADD [ControlType] nvarchar(300) 
              CONSTRAINT DF_LocalizationVersionPhrase_ControlType DEFAULT ('') NOT NULL
    END
END
GO


-- Add new LocalizationVersionPhraseTransfer.DoNotLocalize NOT NULL column with a default of (0)
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhraseTransfer')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhraseTransfer' AND COLUMN_NAME = 'DoNotLocalize')
    BEGIN
        ALTER TABLE [dbo].[LocalizationVersionPhraseTransfer] ADD [DoNotLocalize] bit 
              CONSTRAINT DF_LocalizationVersionPhraseTransfer_DoNotLocalize DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------------------------------
-- Add new LocalizationVersionPhraseTransfer.VersionPhraseTransferDesc NOT NULL column with a default of ('')
------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhraseTransfer')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationVersionPhraseTransfer' AND COLUMN_NAME = 'VersionPhraseTransferDesc')
    BEGIN
        ALTER TABLE [dbo].[LocalizationVersionPhraseTransfer] ADD [VersionPhraseTransferDesc] nvarchar(300) 
              CONSTRAINT DF_LocalizationVersionPhraseTransfer_VersionPhraseTransferDesc DEFAULT ('') NOT NULL
    END
END
GO

-------------------------------------------------------------
-- Change length of [State_Codes].[TITLE] to be 30 characters
-------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'State_Codes')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'State_Codes' AND COLUMN_NAME = 'TITLE')
    BEGIN
        ALTER TABLE [dbo].[State_Codes] ALTER COLUMN [TITLE] varchar(30) NOT NULL
    END
END
GO

--------------------------------------------------------------
-- Change length of Rpt_BadgeTbl.REG_TYPE to be 40 characters
-- so we can copy Meet_Reg_Class.LONG_DESCRIPTION into it
--------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_BadgeTbl')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rpt_BadgeTbl' AND COLUMN_NAME = 'REG_TYPE')
    BEGIN
        ALTER TABLE [dbo].[Rpt_BadgeTbl] ALTER COLUMN [REG_TYPE] varchar(40) NULL
    END
END
GO

------------------------------------------
-- Drop MyTable.TIME_STAMP column to allow columns to be appended to Activity
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] DROP COLUMN [TIME_STAMP] 
    END
END
GO


------------------------------------------
-- Add a new NULL column Meet_Master.REGISTRATION_START_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'REGISTRATION_START_DATE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [REGISTRATION_START_DATE] datetime NULL
    END
END
GO
------------------------------------------
-- Add a new NULL column Meet_Master.REGISTRATION_END_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'REGISTRATION_END_DATE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [REGISTRATION_END_DATE] datetime NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Meet_Master.REGISTRATION_CLOSED_MESSAGE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'REGISTRATION_CLOSED_MESSAGE')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [REGISTRATION_CLOSED_MESSAGE] VARCHAR(400) NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column MyTable.TIME_STAMP
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Meet_Master' AND COLUMN_NAME = 'TIME_STAMP')
    BEGIN
        ALTER TABLE [dbo].[Meet_Master] ADD [TIME_STAMP] timestamp NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column Offering.LinkedItemCode
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering' AND COLUMN_NAME = 'LinkedItemCode')
    BEGIN
        ALTER TABLE [dbo].[Offering] ADD [LinkedItemCode] varchar(50) NULL
    END
END
GO

------------------------------------------
-- Add a new NOT NULL column Offering.OfferingType
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering' AND COLUMN_NAME = 'OfferingType')
    BEGIN
        ALTER TABLE [dbo].[Offering] ADD [OfferingType] tinyint 
              CONSTRAINT DF_Offering_OfferingType DEFAULT (0) NOT NULL
    END
END
GO

------------------------------------------
-- Add a new NOT NULL column Offering.PurchaseMarksCompletionFlag
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Offering' AND COLUMN_NAME = 'PurchaseMarksCompletionFlag')
    BEGIN
        ALTER TABLE [dbo].[Offering] ADD [PurchaseMarksCompletionFlag] bit 
              CONSTRAINT DF_Offering_PurchaseMarksCompletionFlag DEFAULT ('0') NOT NULL
    END
END
GO

------------------------------------------
-- Add a new NULL column UnofferedCustomerExperience.UnOfferedCustomerExperienceGradeKey
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UnofferedCustomerExperience')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UnofferedCustomerExperience' AND COLUMN_NAME = 'UnOfferedCustomerExperienceGradeKey')
    BEGIN
        ALTER TABLE [dbo].[UnofferedCustomerExperience] ADD [UnOfferedCustomerExperienceGradeKey] uniqueidentifier NULL
        CONSTRAINT [FK_UnofferedCustomerExperience_UnOfferedCustomerExperienceGradeKey] REFERENCES [GradeRef] ([GradeKey])
    END
END
GO

-- End of Script
SET NOCOUNT OFF
GO
---------------------------------------------
---Add two new columns in Product Table. PUBLISH_START_DATE and PUBLISH_END_DATE
---------------------------------------------
BEGIN

    DECLARE @restoreProductKey bit
    DECLARE @productKeyMap TABLE ([PRODUCT_CODE] varchar(100), [ProductKey] uniqueidentifier)
    SET @restoreProductKey = 0

    ---------------------------------------------------------------------------------------
    -- Drop Product.ProductKey column to allow columns to be appended to Product
    -- First write its values into a table variable so we can restore them later
    ---------------------------------------------------------------------------------------
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'ProductKey')
        BEGIN
            SET @restoreProductKey = 1
            INSERT INTO @productKeyMap SELECT [PRODUCT_CODE], [ProductKey] FROM Product
            IF OBJECT_ID('AK_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [AK_Product_ProductKey]
            END
            IF OBJECT_ID('DF_Product_ProductKey') IS NOT NULL
            BEGIN
                ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ProductKey]
            END        
            ALTER TABLE [dbo].Product DROP COLUMN [ProductKey]
        END
    END

    ---------------------------------------------------------------------------------------
    -- Drop Product.TIME_STAMP column to allow columns to be appended to Product
    ---------------------------------------------------------------------------------------
    IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].Product DROP COLUMN [TIME_STAMP]
        END
    END

------------------------------------------
-- Add a new NULL column Product.PUBLISH_START_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'PUBLISH_START_DATE')
    BEGIN
        ALTER TABLE [dbo].[Product] ADD [PUBLISH_START_DATE] datetime NULL
    END
END
------------------------------------------
-- Add a new NULL column Product.PUBLISH_END_DATE
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'PUBLISH_END_DATE')
    BEGIN
        ALTER TABLE [dbo].[Product] ADD [PUBLISH_END_DATE] datetime NULL
    END
END
    ------------------------------------------------
    -- Restore column Product.TIME_STAMP
    ------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'TIME_STAMP')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [TIME_STAMP] timestamp NULL
        END
    END

    ------------------------------------------------
    -- Restore column Product.ProductKey
    -- Restore its values from the table variable
    ------------------------------------------------
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
    BEGIN
        IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product' AND COLUMN_NAME = 'ProductKey')
        BEGIN
            ALTER TABLE [dbo].[Product] ADD [ProductKey] uniqueidentifier
                  CONSTRAINT [DF_Product_ProductKey] DEFAULT (newid())
                  CONSTRAINT [AK_Product_ProductKey] UNIQUE NONCLUSTERED
                  NOT NULL
            IF @restoreProductKey=1
            BEGIN
                UPDATE [Product] SET [ProductKey]=pkm.[ProductKey]
                  FROM [Product]
                  JOIN @productKeyMap pkm ON [Product].[PRODUCT_CODE]=pkm.[PRODUCT_CODE]
            END
        END
    END

END
GO

------------------------------------------
-- PBI 43449 We need the ability to save a value to SocialNetworkUserId without a value in SocialNetworkUserName
------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork')
BEGIN
    IF EXISTS(SELECT IS_NULLABLE FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ContactSocialNetwork' 
                   AND COLUMN_NAME = 'SocialNetworkUserName' AND IS_NULLABLE = 'NO')
    BEGIN
        ALTER TABLE [dbo].[ContactSocialNetwork] ALTER COLUMN [SocialNetworkUserName] NVARCHAR(255) NULL
    END
END
GO
