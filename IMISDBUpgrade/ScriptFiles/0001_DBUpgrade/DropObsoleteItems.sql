---------------------------------------------------
-- Drop or delete any obsolete DB schema or rows --
---------------------------------------------------
SET NOCOUNT ON

-- Remove all Correspondence Management documents from the document system
-- ($\CorrespondenceManagement folder, and everything underneath it)
EXEC dbo.asi_DocumentDelete '06748079-6DAE-4612-AC40-C7E9CC04E9DD', 1

-- Remove all documents with the document types we'll be deleting (Correspondence Management)
DECLARE @documentsToDelete TABLE (DocumentVersionKey uniqueidentifier, deleted bit)
DECLARE @versionKey uniqueidentifier

INSERT INTO @documentsToDelete
    SELECT [DocumentVersionKey], 0
      FROM [dbo].[DocumentMain]
     WHERE [DocumentTypeCode] IN ('PAC', 'MLP', 'WMC', 'WT2', 'CLT' )
     
WHILE EXISTS (SELECT 1 FROM @documentsToDelete WHERE deleted = 0)
BEGIN
    SELECT TOP 1 @versionKey = [DocumentVersionKey] FROM @documentsToDelete WHERE deleted = 0
    EXEC dbo.asi_DocumentDelete @versionKey, 1
    UPDATE @documentsToDelete SET deleted = 1 where DocumentVersionKey = @versionKey
END
GO

-- Remove the Correspondence Management document types from DocumentTypeRef
DELETE FROM [dbo].[DocumentTypeRef]
WHERE [DocumentTypeCode] IN ('PAC', 'MLP', 'WMC', 'WT2', 'CLT' )
GO

-- Remove Correspondence Management System Config variables
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.ChunkSize'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.FaxDistribution'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.PrintDistribution'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.DefaultDocumentPath'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.IncomingCommunicationWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.SaveDistribution'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.PackageExecutionWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.UI.PaperSizeUnit'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.DefaultPackageQueueReleaseWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.UI.DefaultSenderKey'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.PackageQueueNotificationGroupType'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.EmailDistribution'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.InboundCommunicationProcessingGroup'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.CommunicationLogRelationshipType'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.EmailProcessingWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.MailingListExportPackageProcessingWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.PackageProcessingWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.QueuePrereleaseWorkflow'
DELETE FROM [dbo].[SystemConfig]
WHERE [ParameterName] = 'CorrespondenceManagement.XslPath'
GO

-- Delete obsolete BOD objects Hierarchy
DELETE FROM [dbo].[Hierarchy]
WHERE [UniformKey] IN (
SELECT [DocumentVersionKey] FROM [dbo].[DocumentMain]
 WHERE [DocumentTypeCode] IN ('BOD', 'BUS', 'DBS', 'DBO')
       AND [DocumentName] IN (
        'CorrespondenceDistributionLetterTemplateTypeRef',
        'CorrespondenceDistributionRef',
        'CorrespondenceSender',
        'CorrespondenceSenderStatusRef',
        'CorrespondenceSignature', 
        'EmailAccountRef',
        'FaxAccountRef',
        'FullAddressCorrespondenceReport',
        'InboundCommunicationLog',
        'LetterheadRef', 
        'LetterTemplateTypeDocumentTypeRef',
        'LetterTemplateTypeRef',
        'LetterTemplateTypeInboundCommunicationLog',
        'MonitoredEmailAccountRef', 
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef', 
        'OutboundCommunicationStatusRef', 
        'OutboundLetterTemplateLog',
        'PackageLog', 
        'PackageLogStatusRef', 
        'PackageLogPackageQueue', 
        'PackageLogSupplement',
        'PackageQueue', 
        'PackageQueueReleaseTypeRef',
        'PaperSizeRef', 
        'PaperSourceRef',
        'PrinterRef'
        )
)
-- Delete obsolete BOD objects
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentTypeCode] IN ('BOD', 'BUS', 'DBS', 'DBO')
       AND [DocumentName] IN (
        'CorrespondenceDistributionLetterTemplateTypeRef',
        'CorrespondenceDistributionRef',
        'CorrespondenceSender',
        'CorrespondenceSenderStatusRef',
        'CorrespondenceSignature', 
        'EmailAccountRef',
        'FaxAccountRef',
        'FullAddressCorrespondenceReport',
        'InboundCommunicationLog',
        'LetterheadRef', 
        'LetterTemplateTypeDocumentTypeRef',
        'LetterTemplateTypeRef',
        'LetterTemplateTypeInboundCommunicationLog',
        'MonitoredEmailAccountRef', 
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef', 
        'OutboundCommunicationStatusRef', 
        'OutboundLetterTemplateLog',
        'PackageLog', 
        'PackageLogStatusRef', 
        'PackageLogPackageQueue', 
        'PackageLogSupplement',
        'PackageQueue', 
        'PackageQueueReleaseTypeRef',
        'PaperSizeRef', 
        'PaperSourceRef',
        'PrinterRef'
        )

-- Delete obsolete IAtoms and Panels
DELETE u 
  FROM UniformRegistry u
       INNER JOIN ComponentRegistry c ON u.ComponentKey = c.ComponentKey
 WHERE c.InterfaceName = 'IAtom'
       AND [Name] IN (
        'ContactCommunicationLogReport',
        'CorrespondenceSender',
        'CorrespondenceSignature',
        'EmailAccountRef',
        'FaxAccountRef',
        'InboundCommunicationLog',
        'LetterheadRef',
        'MonitoredEmailAccountRef',
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef',
        'OutboundLetterTemplateLog',
        'PackageLog',
        'PackageLogPackageQueue',
        'PackageQueue',
        'PaperSizeRef',
        'PaperSourceRef',
        'PrinterRef'
        )
      

DELETE r 
  FROM ComponentRegistryCategory r
       INNER JOIN ComponentRegistry c ON r.ComponentKey = c.ComponentKey
       INNER JOIN ComponentCategoryRef ccr ON r.ComponentCategoryKey = ccr.ComponentCategoryKey
WHERE ccr.ComponentCategoryName = 'Correspondence'

DELETE w FROM AtomPanelWebsite w
    INNER JOIN AtomPanel a ON a.AtomPanelKey = w.AtomPanelKey
       INNER JOIN ComponentRegistry c ON a.ComponentKey = c.ComponentKey
 WHERE c.InterfaceName = 'IAtom'
       AND [Name] IN (
        'ContactCommunicationLogReport',
        'CorrespondenceSender',
        'CorrespondenceSignature',
        'EmailAccountRef',
        'FaxAccountRef',
        'InboundCommunicationLog',
        'LetterheadRef',
        'MonitoredEmailAccountRef',
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef',
        'OutboundLetterTemplateLog',
        'PackageLog',
        'PackageLogPackageQueue',
        'PackageQueue',
        'PaperSizeRef',
        'PaperSourceRef',
        'PrinterRef'
        )

DELETE a FROM AtomPanel a
       INNER JOIN ComponentRegistry c ON a.ComponentKey = c.ComponentKey
 WHERE c.InterfaceName = 'IAtom'
       AND [Name] IN (
        'ContactCommunicationLogReport',
        'CorrespondenceSender',
        'CorrespondenceSignature',
        'EmailAccountRef',
        'FaxAccountRef',
        'InboundCommunicationLog',
        'LetterheadRef',
        'MonitoredEmailAccountRef',
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef',
        'OutboundLetterTemplateLog',
        'PackageLog',
        'PackageLogPackageQueue',
        'PackageQueue',
        'PaperSizeRef',
        'PaperSourceRef',
        'PrinterRef'
        )

DELETE FROM ComponentRegistry
 WHERE InterfaceName = 'IAtom'
       AND [Name] IN (
        'ContactCommunicationLogReport',
        'CorrespondenceDistributionLetterTemplateTypeRef',
        'CorrespondenceDistributionRef',
        'CorrespondenceSender',
        'CorrespondenceSenderStatusRef',
        'CorrespondenceSignature', 
        'EmailAccountRef',
        'FaxAccountRef',
        'FullAddressCorrespondenceReport',
        'InboundCommunicationLog',
        'LetterheadRef', 
        'LetterTemplateTypeDocumentTypeRef',
        'LetterTemplateTypeRef',
        'LetterTemplateTypeInboundCommunicationLog',
        'MonitoredEmailAccountRef', 
        'OutboundCommunicationLog',
        'OutboundCommunicationStatusReasonRef', 
        'OutboundCommunicationStatusRef', 
        'OutboundLetterTemplateLog',
        'PackageLog', 
        'PackageLogStatusRef', 
        'PackageLogPackageQueue', 
        'PackageLogSupplement',
        'PackageQueue', 
        'PackageQueueReleaseTypeRef',
        'PaperSizeRef', 
        'PaperSourceRef',
        'PrinterRef'
        )

-- Drop obsolete Tables and Views
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceDistributionLetterTemplateTypeRef' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceDistributionLetterTemplateTypeRef_LetterTemplateTypeRef')
    ALTER TABLE [dbo].[CorrespondenceDistributionLetterTemplateTypeRef] DROP CONSTRAINT FK_CorrespondenceDistributionLetterTemplateTypeRef_LetterTemplateTypeRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSender' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSender_ContactKey')
    ALTER TABLE [dbo].[CorrespondenceSender] DROP CONSTRAINT FK_CorrespondenceSender_ContactKey
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSender' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSender_CorrespondenceSenderStatusRef')
    ALTER TABLE [dbo].[CorrespondenceSender] DROP CONSTRAINT FK_CorrespondenceSender_CorrespondenceSenderStatusRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSender' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSender_EmailAdccountRef')
    ALTER TABLE [dbo].[CorrespondenceSender] DROP CONSTRAINT FK_CorrespondenceSender_EmailAdccountRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSender' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSender_FaxAdccountRef')
    ALTER TABLE [dbo].[CorrespondenceSender] DROP CONSTRAINT FK_CorrespondenceSender_FaxAdccountRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSender' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSender_UniformRegistry')
    ALTER TABLE [dbo].[CorrespondenceSender] DROP CONSTRAINT FK_CorrespondenceSender_UniformRegistry
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'CorrespondenceSignature' AND [CONSTRAINT_NAME] = 'FK_CorrespondenceSignature_CorrespondenceSender')
    ALTER TABLE [dbo].[CorrespondenceSignature] DROP CONSTRAINT FK_CorrespondenceSignature_CorrespondenceSender
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'LetterheadRef' AND [CONSTRAINT_NAME] = 'FK_LetterheadRef_PrinterRef')
    ALTER TABLE [dbo].[LetterheadRef] DROP CONSTRAINT FK_LetterheadRef_PrinterRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'LetterheadRef' AND [CONSTRAINT_NAME] = 'FK_LetterheadRef_PaperSourceRef_FirstPage')
    ALTER TABLE [dbo].[LetterheadRef] DROP CONSTRAINT FK_LetterheadRef_PaperSourceRef_FirstPage
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'LetterheadRef' AND [CONSTRAINT_NAME] = 'FK_LetterheadRef_PaperSourceRef_OtherPages')
    ALTER TABLE [dbo].[LetterheadRef] DROP CONSTRAINT FK_LetterheadRef_PaperSourceRef_OtherPages
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'LetterheadRef' AND [CONSTRAINT_NAME] = 'FK_LetterheadRef_UniformRegistry')
    ALTER TABLE [dbo].[LetterheadRef] DROP CONSTRAINT FK_LetterheadRef_UniformRegistry
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'LetterTemplateTypeDocumentTypeRef' AND [CONSTRAINT_NAME] = 'FK_LetterTemplateTypeDocumentTypeRef_LetterTemplateTypeRef')
    ALTER TABLE [dbo].[LetterTemplateTypeDocumentTypeRef] DROP CONSTRAINT FK_LetterTemplateTypeDocumentTypeRef_LetterTemplateTypeRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_AddressCategoryRef')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_AddressCategoryRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_AddressMain')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_AddressMain
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_ContactMain')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_ContactMain
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_OutboundCommunicationStatusReasonRef')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_OutboundCommunicationStatusReasonRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_OutboundCommunicationStatusRef')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_OutboundCommunicationStatusRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_PackageLog')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_PackageLog
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundCommunicationLog' AND [CONSTRAINT_NAME] = 'FK_OutboundCommunicationLog_UniformRegistry')
    ALTER TABLE [dbo].[OutboundCommunicationLog] DROP CONSTRAINT FK_OutboundCommunicationLog_UniformRegistry
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'OutboundLetterTemplateLog' AND [CONSTRAINT_NAME] = 'FK_OutboundLetterTemplateLog_OutboundCommunicationLog')
    ALTER TABLE [dbo].OutboundLetterTemplateLog DROP CONSTRAINT FK_OutboundLetterTemplateLog_OutboundCommunicationLog
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLogPackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageLogPackageQueue_PackageLog')
    ALTER TABLE [dbo].[PackageLogPackageQueue] DROP CONSTRAINT FK_PackageLogPackageQueue_PackageLog
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLogSupplement' AND [CONSTRAINT_NAME] = 'FK_PackageLogSupplement_PackageLog')
    ALTER TABLE [dbo].[PackageLogSupplement] DROP CONSTRAINT FK_PackageLogSupplement_PackageLog
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLogSupplement' AND [CONSTRAINT_NAME] = 'FK_PackageLogSupplement_SupplementMain')
    ALTER TABLE [dbo].[PackageLogSupplement] DROP CONSTRAINT FK_PackageLogSupplement_SupplementMain
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLog' AND [CONSTRAINT_NAME] = 'FK_PackageLog_CorrespondenceSender')
    ALTER TABLE [dbo].[PackageLog] DROP CONSTRAINT FK_PackageLog_CorrespondenceSender
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLog' AND [CONSTRAINT_NAME] = 'FK_PackageLog_PackageLogStatusRef')
    ALTER TABLE [dbo].[PackageLog] DROP CONSTRAINT FK_PackageLog_PackageLogStatusRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLog' AND [CONSTRAINT_NAME] = 'FK_PackageLog_SourceCode')
    ALTER TABLE [dbo].[PackageLog] DROP CONSTRAINT FK_PackageLog_SourceCode
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLog' AND [CONSTRAINT_NAME] = 'FK_PackageLog_UniformRegistry')
    ALTER TABLE [dbo].[PackageLog] DROP CONSTRAINT FK_PackageLog_UniformRegistry
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PackageLog' AND [CONSTRAINT_NAME] = 'FK_PackageLog_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PackageLog] DROP CONSTRAINT FK_PackageLog_UserMain_CreatedBy
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PaperSourceRef' AND [CONSTRAINT_NAME] = 'FK_PaperSourceRef_PrinterRef')
    ALTER TABLE [dbo].[PaperSourceRef] DROP CONSTRAINT FK_PaperSourceRef_PrinterRef
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE 
            WHERE [TABLE_NAME] = 'PrinterRef' AND [CONSTRAINT_NAME] = 'FK_PrinterRef_UniformRegistry')
    ALTER TABLE [dbo].PrinterRef DROP CONSTRAINT FK_PrinterRef_UniformRegistry
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoContactCommunicationLogReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoContactCommunicationLogReport
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoCorrespondenceDistributionLetterTemplateTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoCorrespondenceDistributionLetterTemplateTypeRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoCorrespondenceDistributionRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoCorrespondenceDistributionRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoCorrespondenceSender' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoCorrespondenceSender
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoCorrespondenceSenderStatusRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoCorrespondenceSenderStatusRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoCorrespondenceSignature' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoCorrespondenceSignature
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoFaxAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoFaxAccountRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoFullAddressCorrespondenceReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoFullAddressCorrespondenceReport
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoEmailAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoEmailAccountRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoInboundCommunicationLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoInboundCommunicationLog
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoLetterheadRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoLetterheadRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoLetterTemplateTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoLetterTemplateTypeRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoLetterTemplateTypeDocumentTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoLetterTemplateTypeDocumentTypeRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoMonitoredEmailAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoMonitoredEmailAccountRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoOutboundCommunicationStatusReasonRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoOutboundCommunicationStatusReasonRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoOutboundCommunicationLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoOutboundCommunicationLog
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoOutboundLetterTemplateLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoOutboundLetterTemplateLog
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPackageLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPackageLog
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPackageLogPackageQueue' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPackageLogPackageQueue
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPackageLogSupplement' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPackageLogSupplement
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPaperSizeRefvBoLetterheadRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPaperSizeRefvBoLetterheadRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPaperSourceRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPaperSourceRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoPrinterRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoPrinterRef
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vContactCorrespondencePreferencesReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vContactCorrespondencePreferencesReport
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vContactCommunicationLogReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vContactCommunicationLogReport
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vFullAddressCorrespondenceReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vFullAddressCorrespondenceReport
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'CorrespondenceDistributionLetterTemplateTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[CorrespondenceDistributionLetterTemplateTypeRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'CorrespondenceDistributionRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[CorrespondenceDistributionRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'CorrespondenceSender' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[CorrespondenceSender]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'CorrespondenceSenderStatusRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[CorrespondenceSenderStatusRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'CorrespondenceSignature' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[CorrespondenceSignature]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'EmailAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[EmailAccountRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'FaxAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[FaxAccountRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'InboundCommunicationLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[InboundCommunicationLog]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'LetterheadRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[LetterheadRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'LetterTemplateTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[LetterTemplateTypeRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'LetterTemplateTypeDocumentTypeRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[LetterTemplateTypeDocumentTypeRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'MonitoredEmailAccountRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[MonitoredEmailAccountRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'OutboundCommunicationStatusReasonRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[OutboundCommunicationStatusReasonRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'OutboundCommunicationLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[OutboundCommunicationLog]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'OutboundLetterTemplateLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[OutboundLetterTemplateLog]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PackageLog' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PackageLog]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PackageLogPackageQueue' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PackageLogPackageQueue]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PackageLogSupplementvAddressCorrespondenceReport' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PackageLogSupplementvAddressCorrespondenceReport]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PaperSizeRefLetterheadRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PaperSizeRefLetterheadRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PaperSourceRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PaperSourceRef]
END
GO
    
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'PrinterRef' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE')
BEGIN                  
    DROP TABLE [dbo].[PrinterRef]
END
GO

-- Delete obsolete Component Registry entries
DELETE u 
  FROM UniformRegistry u
       INNER JOIN ComponentRegistry c ON u.ComponentKey = c.ComponentKey
 WHERE c.AssemblyName = 'Asi.CorrespondenceManagement' AND c.[Name] NOT LIKE 'Supplement%'      

DELETE r 
  FROM ComponentRegistryCategory r
       INNER JOIN ComponentRegistry c ON r.ComponentKey = c.ComponentKey
 WHERE c.AssemblyName = 'Asi.CorrespondenceManagement' AND c.[Name] NOT LIKE 'Supplement%'      

DELETE FROM ComponentRegistry
WHERE AssemblyName = 'Asi.CorrespondenceManagement' AND [Name] NOT LIKE 'Supplement%'
GO

-- Update Component Registry entries
UPDATE [dbo].[ComponentRegistry]
   SET [TypeName] = 'Asi.Business.PackageManagement.SupplementController', 
       [AssemblyName] = 'Asi.Business.PackageManagement' 
 WHERE [Name] = 'Supplement' AND [InterfaceName] = 'BusinessController'
 GO

UPDATE [dbo].[ComponentRegistry]
   SET [TypeName] = 'Asi.Business.PackageManagement.SupplementTypeController', 
       [AssemblyName] = 'Asi.Business.PackageManagement' 
 WHERE [Name] = 'SupplementTypeRef' AND [InterfaceName] = 'BusinessController'
 GO

-- Delete obsolete Component Category
DELETE FROM ComponentCategoryRef
WHERE ComponentCategoryName = 'Correspondence'
GO


-- Remove old UD iParts
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'WebPartGalleryEntryRef')
BEGIN
    DELETE FROM [dbo].[WebPartGalleryEntryRef]
     WHERE [WebPartName] = 'Contact UD Panel'
    DELETE FROM [dbo].[WebPartGalleryEntryRef]
     WHERE [WebPartName] = 'Contact UD Panel Collection'
END
DELETE FROM [dbo].[ComponentRegistry]
 WHERE [Name] = 'Contact UD Panel'
DELETE FROM [dbo].[ComponentRegistry]
 WHERE [Name] = 'Contact UD Panel Collection'

EXEC dbo.asi_DocumentDelete 'ACB921A9-C80A-42F6-80A3-D65ED06DDE56',1
EXEC dbo.asi_DocumentDelete '17248B4E-EA62-44BF-86E9-3F9460F75294', 1
GO

-- Remove old Contact Summary and Personal Info pages
EXEC dbo.asi_DocumentDelete '67968ED2-0FEA-400D-990F-7223A07DC340', 1
EXEC dbo.asi_DocumentDelete 'A1D0CA17-CB36-406C-ABE4-8EA243A0E0C6', 1
GO


-- Remove obsolete WebPartGalleryEntryRef BO and view
EXEC dbo.asi_DocumentDelete '16A93617-7B8A-4216-9010-71F15176A2DB', 1
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoWebPartGalleryEntry')
BEGIN
    DROP VIEW [dbo].[vBoWebPartGalleryEntry]
END
GO

-- Remove FKs on tables that will be deleted later
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryEntryRef_WebPartGalleryRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryEntryRef]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryEntryRef] DROP CONSTRAINT [FK_WebPartGalleryEntryRef_WebPartGalleryRef]
END

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryLicense_WebPartGalleryRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryLicense]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryLicense] DROP CONSTRAINT [FK_WebPartGalleryLicense_WebPartGalleryRef]
END

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryLicense_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryLicense]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryLicense] DROP CONSTRAINT [FK_WebPartGalleryLicense_License]
END
GO

-------------------------------------------------------
-- Remove unused and obsolete BOs and associated tables
-------------------------------------------------------

-- Delete obsolete BOD objects Hierarchy
DELETE FROM [dbo].[Hierarchy]
WHERE [UniformKey] IN (
SELECT [DocumentVersionKey] FROM [dbo].[DocumentMain]
 WHERE [DocumentTypeCode] IN ('BOD', 'BUS', 'DBS', 'DBO')
       AND [DocumentName] IN (
        'GroupLogicalDefinition',
        'GroupRoleToolAccess',
        'GroupTool',
        'GroupTypeAllowedTool',
        'GroupTypeAllowedType',
        'HierarcyAncestor', 
        'HierarchyAncestor'
        )
)
-- Delete obsolete BOD objects
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentTypeCode] IN ('BOD', 'BUS', 'DBS', 'DBO')
       AND [DocumentName] IN (
        'GroupLogicalDefinition',
        'GroupRoleToolAccess',
        'GroupTool',
        'GroupTypeAllowedTool',
        'GroupTypeAllowedType',
        'HierarcyAncestor', 
        'HierarchyAncestor'
        )

-- Delete associated ComponentRegistry and Category entries
DELETE crc
FROM [ComponentRegistryCategory] crc
     INNER JOIN [ComponentRegistry] c ON c.[ComponentKey] = crc.[ComponentKey]
 WHERE c.[Name] IN (
        'GroupLogicalDefinition',
        'GroupRoleToolAccess',
        'GroupTool',
        'GroupTypeAllowedTool',
        'GroupTypeAllowedType',
        'HierarcyAncestor', 
        'HierarchyAncestor'
       )
        
DELETE FROM ComponentRegistry
 WHERE InterfaceName = 'IAtom'
       AND [Name] IN (
        'GroupLogicalDefinition',
        'GroupRoleToolAccess',
        'GroupTool',
        'GroupTypeAllowedTool',
        'GroupTypeAllowedType',
        'HierarcyAncestor', 
        'HierarchyAncestor'
       )

-- Drop BO views
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoGroupLogicalDefinition' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoGroupLogicalDefinition
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoGroupTool' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoGroupTool
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoGroupTypeAllowedTool' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoGroupTypeAllowedTool
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoGroupRoleToolAccess' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoGroupRoleToolAccess
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vBoGroupTypeAllowedType' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vBoGroupTypeAllowedType
END
GO
       
-- Drop GroupLogicalDefinition Table        
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLocialDefinition_DocumentMain_QueryIsAMember]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupLogicalDefinition]'))
    ALTER TABLE [dbo].[GroupLogicalDefinition] DROP CONSTRAINT [FK_GroupLocialDefinition_DocumentMain_QueryIsAMember]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLocialDefinition_DocumentMain_QueryMemberList]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupLogicalDefinition]'))
    ALTER TABLE [dbo].[GroupLogicalDefinition] DROP CONSTRAINT [FK_GroupLocialDefinition_DocumentMain_QueryMemberList]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLogicalDefinition_GroupTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupLogicalDefinition]'))
    ALTER TABLE [dbo].[GroupLogicalDefinition] DROP CONSTRAINT [FK_GroupLogicalDefinition_GroupTypeRef]
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_GroupLogicalDefinition_QueryIsAMemberDocumentKey]') AND type = 'D')
    ALTER TABLE [dbo].[GroupLogicalDefinition] DROP CONSTRAINT [DF_GroupLogicalDefinition_QueryIsAMemberDocumentKey]
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_GroupLogicalDefinition_QueryMemberListDocumentKey]') AND type = 'D')
    ALTER TABLE [dbo].[GroupLogicalDefinition] DROP CONSTRAINT [DF_GroupLogicalDefinition_QueryMemberListDocumentKey]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupLogicalDefinition]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupLogicalDefinition]
GO

-- Drop GroupRoleToolAccess Table        
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupRoleToolAccess_GroupTypeAllowedTool]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupRoleToolAccess]'))
    ALTER TABLE [dbo].[GroupRoleToolAccess] DROP CONSTRAINT [FK_GroupRoleToolAccess_GroupTypeAllowedTool]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupRoleToolAccess]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupRoleToolAccess]
GO

-- Drop GroupTypeAllowedTool Table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupTypeAllowedTool_GroupToolRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedTool]'))
    ALTER TABLE [dbo].[GroupTypeAllowedTool] DROP CONSTRAINT [FK_GroupTypeAllowedTool_GroupToolRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupTypeAllowedTool_GroupTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedTool]'))
    ALTER TABLE [dbo].[GroupTypeAllowedTool] DROP CONSTRAINT [FK_GroupTypeAllowedTool_GroupTypeRef]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedTool]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupTypeAllowedTool]
GO

-- Drop GroupTypeAllowedType
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupTypeAllowedType_GroupTypeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedType]'))
    ALTER TABLE [dbo].[GroupTypeAllowedType] DROP CONSTRAINT [FK_GroupTypeAllowedType_GroupTypeRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupTypeAllowedType_UniformType]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedType]'))
    ALTER TABLE [dbo].[GroupTypeAllowedType] DROP CONSTRAINT [FK_GroupTypeAllowedType_UniformType]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupTypeAllowedType]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupTypeAllowedType]
GO

-- Drop GroupToolRef table
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupToolRef]') AND type in (N'U'))
    DROP TABLE [dbo].[GroupToolRef]
GO

-- Remove some invalid and obsolete Rules in RuleSourcePublish/Design that can cause issues
DELETE FROM [dbo].[RuleSourcePublish] WHERE [RuleName] IN ('~~Assembly', 'CommitteeMember', 'ContentManagementAuthorityGroup', 'Demo', 'FullAddressCorrespondenceReport', 'PaperSourceRef')
DELETE FROM [dbo].[RuleSourceDesign] WHERE [RuleName] IN ('~~Assembly', 'CommitteeMember', 'ContentManagementAuthorityGroup', 'Demo', 'FullAddressCorrespondenceReport', 'PaperSourceRef')
DELETE r 
  FROM [dbo].[RuleSourcePublish] r
       LEFT OUTER JOIN [dbo].[DocumentMain] d ON r.[RuleName] = d.[DocumentName]
 WHERE d.[DocumentName] IS NULL
DELETE r 
  FROM [dbo].[RuleSourceDesign] r
       LEFT OUTER JOIN [dbo].[DocumentMain] d ON r.[RuleName] = d.[DocumentName]
 WHERE d.[DocumentName] IS NULL
GO

-- Drop obsolete stored procedures
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[BAECartPostCheckout]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[BAECartPostCheckout]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEImisProductGetAllWebEnabledBilling]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BAEImisProductGetAllWebEnabledBilling]
GO

--------------------------------------
-- Remove obsolete Report_Desc scripts
--------------------------------------
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create iMIS.NET Triggers for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create International Utility Functions for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create sp_asi_NameAddressNameGlobalSync'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create sp_asi_NameToNameAddressSync'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create FR Trans trigger for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create fn_asi_SoftCreditCMDM_Amount for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create fn_asi_SoftCreditCMDM_Exists for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create e-Series Triggers for MS SQL'
DELETE FROM Report_Desc WHERE ImisSystem = 'SYSTEM' AND Category = 'System Setup' AND Title = 'Create sp_asi_ARPayment for MS SQL'
GO

------------------------------------------------------------------------
-- SBI 20621 - Drop obsolete content types                            --
-- Cart Summary, Order Confirmation, Payment Details and Submit Order --
------------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '4B3ACE9F-CD17-4AE7-B93F-44DA963151AA', 1
EXEC dbo.asi_DocumentDelete '9105393D-9595-4801-B0EE-E8A782FD8F9E', 1
EXEC dbo.asi_DocumentDelete '40DA00ED-C877-4F3E-9A43-546257E0F0F1', 1
EXEC dbo.asi_DocumentDelete '969E68DA-60FD-4127-BD1E-A49195C11512', 1
DELETE 
  FROM [dbo].[ComponentRegistry]
 WHERE [Name] IN ('Cart Summary', 'Order Confirmation', 'Payment Details', 'Submit Order')
GO

-------------------------------------------
-- Drop Obsolete Crystal Report Definitions
-------------------------------------------
EXEC dbo.asi_DocumentDelete '1EAFEBF1-6E96-485B-97B1-F3BCA7FA6E17'
EXEC dbo.asi_DocumentDelete 'A9631EF6-191E-4905-9CC9-DE0DDECBFE79'
EXEC dbo.asi_DocumentDelete '09CD6B21-D9C9-4D9F-9383-0F7EF9B0B6BC'
EXEC dbo.asi_DocumentDelete '801730B4-AD64-4551-8AFC-010A1A0A588F'
EXEC dbo.asi_DocumentDelete '7F261C2D-07AF-4343-A0D2-1DCCBBAEA152'
EXEC dbo.asi_DocumentDelete '37A52FB9-613E-4B16-9D19-2217ADBB75F9'
EXEC dbo.asi_DocumentDelete '159DA220-2E67-4051-8B49-580ECC77B8AE'
EXEC dbo.asi_DocumentDelete 'FE9E7278-FBAD-4A5C-BC6C-89A481BE22B9'
EXEC dbo.asi_DocumentDelete '491C34F7-5309-4ADF-9EAA-77DAF29866B4'
EXEC dbo.asi_DocumentDelete 'BB154DB3-C18F-4977-9A54-6308C346CD41'
EXEC dbo.asi_DocumentDelete '769F2C8F-668A-4BAA-AB05-FEAB862937FE'
EXEC dbo.asi_DocumentDelete 'D756105C-6DC0-4293-9059-D4FA1BB11B08'
EXEC dbo.asi_DocumentDelete '303DA02E-1072-4469-B048-B323B2AF43FB'
EXEC dbo.asi_DocumentDelete '01830758-6A7B-4BB7-B684-DB6B2C6ED931'
EXEC dbo.asi_DocumentDelete 'BC211964-0F69-4192-8B69-7F14D7782FE6'
EXEC dbo.asi_DocumentDelete '1C60E0CA-9635-492F-9B1E-80C581E51819'
EXEC dbo.asi_DocumentDelete '41CB7E4A-B9B8-46AE-98AB-BDD64024F8E0'
EXEC dbo.asi_DocumentDelete '0AF753DA-D543-4CCD-B809-826F3C18C0B1'
EXEC dbo.asi_DocumentDelete 'F5C35CFB-3512-4C25-880D-BADE416BE0E2'
EXEC dbo.asi_DocumentDelete 'E6E256FF-2269-40FA-A539-C575D87E4285'
EXEC dbo.asi_DocumentDelete 'D363A70D-E0FC-4AC2-BBD6-E38F502F4019'
EXEC dbo.asi_DocumentDelete '6818F154-64B3-41B0-B54C-A6B7E95A6F70'
EXEC dbo.asi_DocumentDelete '9332FFF5-D3D1-40E1-8E69-B4B5D2402FF2'
EXEC dbo.asi_DocumentDelete '24CED2BC-DAC1-488C-8054-6DB6C1B1F15D'
EXEC dbo.asi_DocumentDelete 'CCAAD678-1FE6-45FB-9E74-2CDD16718393'
EXEC dbo.asi_DocumentDelete 'AAEC1F82-21A6-4A92-A693-32CEE1A296EA'
EXEC dbo.asi_DocumentDelete 'FB938889-0ACE-4486-AF09-DD68F4E990F5'
EXEC dbo.asi_DocumentDelete '4756492A-B79B-4945-B12F-C62E9A6374C4'
EXEC dbo.asi_DocumentDelete '22EE53A7-0019-4FBD-8802-9AE16587A284'
EXEC dbo.asi_DocumentDelete 'DDA3DBEF-8068-42FC-8FA0-F187308AB26F'
EXEC dbo.asi_DocumentDelete '37CD862E-C711-4024-A29A-67B8C5A0A101'
EXEC dbo.asi_DocumentDelete '5288051A-E18B-45D5-ACF8-6FCF4B8FAAFD'
EXEC dbo.asi_DocumentDelete 'D437D5C4-4AE3-44E8-AF1B-180232D7595A'
EXEC dbo.asi_DocumentDelete 'E350A77A-02DD-40FE-AFF5-6739AA29CA0F'
EXEC dbo.asi_DocumentDelete 'D9654E57-A486-4BD8-B36B-6BB89F17E887'
EXEC dbo.asi_DocumentDelete '16600FC2-13B6-4A47-A77E-1B1DCBF72B2A'
EXEC dbo.asi_DocumentDelete 'C3882C8C-B016-4B17-8EEF-1CB68468819B'
GO

--------------------------------------
-- Drop Empty/Obsolete Content Folders
--------------------------------------
-- @/iMIS/Accounting
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'DA68089E-C615-4CC4-9A78-D79FC39467BD')
EXEC dbo.asi_DocumentDelete 'DA68089E-C615-4CC4-9A78-D79FC39467BD', 1

-- @/iMIS/Billing
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '98D065C6-B58B-4C00-ACC1-17CF3363843D')
EXEC dbo.asi_DocumentDelete '98D065C6-B58B-4C00-ACC1-17CF3363843D', 1

-- @/iMIS/Certification
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'DDE3512F-CB58-485C-9B22-CB3EE2D93A13')
EXEC dbo.asi_DocumentDelete 'DDE3512F-CB58-485C-9B22-CB3EE2D93A13', 1

-- @/iMIS/EventManagement
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '1324E6FD-67FC-46B3-A76B-B008247AF8CD')
EXEC dbo.asi_DocumentDelete '1324E6FD-67FC-46B3-A76B-B008247AF8CD', 1

-- @/iMIS/Exhibition
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '13206029-AA97-414E-9BBD-A26FAC6612A5')
EXEC dbo.asi_DocumentDelete '13206029-AA97-414E-9BBD-A26FAC6612A5', 1

-- @/iMIS/Exposition
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '85E97592-12DD-4748-99A2-ADBA44F847C7')
EXEC dbo.asi_DocumentDelete '85E97592-12DD-4748-99A2-ADBA44F847C7', 1

-- @/iMIS/iFC
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '2E71CBFD-925D-4DAB-8381-5C56AB1B5F08')
EXEC dbo.asi_DocumentDelete '2E71CBFD-925D-4DAB-8381-5C56AB1B5F08', 1

-- @/iMIS/Issues
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '5636B107-DC11-418E-B0CA-45ECF196B1B6')
EXEC dbo.asi_DocumentDelete '5636B107-DC11-418E-B0CA-45ECF196B1B6', 1

-- @/iMIS/LegislativeTracking
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '687ECDF7-FDB6-43BA-B1E9-1BE46479BA90')
EXEC dbo.asi_DocumentDelete '687ECDF7-FDB6-43BA-B1E9-1BE46479BA90', 1

-- @/iMIS/MarketingManager
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = '30288F76-4126-4A3D-B0A3-6622FDB07CCA')
EXEC dbo.asi_DocumentDelete '30288F76-4126-4A3D-B0A3-6622FDB07CCA', 1

-- @/iMIS/Orders
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'F39BC8A9-A720-44CB-8C96-C6D97D2F40D5')
EXEC dbo.asi_DocumentDelete 'F39BC8A9-A720-44CB-8C96-C6D97D2F40D5', 1

-- @/iMIS/Referrals
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'BC192441-A6B5-4B21-A3D2-843EF01DCD88')
EXEC dbo.asi_DocumentDelete 'BC192441-A6B5-4B21-A3D2-843EF01DCD88', 1

-- @/iMIS/ServiceCentral
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'E505E888-0F62-4435-8F31-302C481B2653')
EXEC dbo.asi_DocumentDelete 'E505E888-0F62-4435-8F31-302C481B2653', 1

-- @/iMIS/Subscriptions
IF NOT EXISTS (SELECT * FROM [dbo].[Hierarchy] child INNER JOIN [dbo].[Hierarchy] parent 
	ON child.[ParentHierarchyKey] = parent.[HierarchyKey] 
	WHERE parent.[UniformKey] = 'E2B36D21-A423-43D1-8896-28A5050268B6')
EXEC dbo.asi_DocumentDelete 'E2B36D21-A423-43D1-8896-28A5050268B6', 1
GO

-- Drop obsolete views
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vSoaPartyRelationship' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vSoaPartyRelationship
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vSoaPartyRelationshipType' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vSoaPartyRelationshipType
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_NAME = 'vSoaSystemSetting' AND 
                  TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'VIEW')
BEGIN                  
    DROP VIEW vSoaSystemSetting
END
GO

SET NOCOUNT OFF
