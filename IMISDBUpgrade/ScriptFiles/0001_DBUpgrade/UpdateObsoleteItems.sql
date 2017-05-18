---------------------------------------------------
-- Drop or delete any obsolete DB schema or rows --
---------------------------------------------------
SET NOCOUNT ON
GO

-----------------------------------------------------------------------------
-- Boot strap some functions that are relied on by utilities during upgrade 
-----------------------------------------------------------------------------
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetDatabaseTimeZoneIdentifier]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DECLARE @sql nvarchar(max);

SET @sql = N'

-- =============================================
-- Author:		Stacey Tarr
-- Create date: 29 JAN 2014
-- Description:	Get DB Time Zone Identifier
-- =============================================
CREATE FUNCTION [dbo].[asi_GetDatabaseTimeZoneIdentifier]() 
RETURNS VARCHAR(50)
AS
BEGIN
	
	DECLARE @TZName VARCHAR(50)

	EXEC [master].[dbo].xp_regread ''HKEY_LOCAL_MACHINE'', ''SYSTEM\CurrentControlSet\Control\TimeZoneInformation'', ''TimeZoneKeyName'',@TZName OUT;

	RETURN @TZName

END

';

EXEC(@sql);
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetAppDatetime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DECLARE @sql nvarchar(max);

SET @sql = N'
-- ===================================================================================
-- Author:      Paul Bradshaw
-- Create date: 03-Aug-2016
-- Description: Return the current datetime value offset by configured timezone offset 
-- ===================================================================================
CREATE FUNCTION [dbo].[asi_GetAppDatetime]()
RETURNS datetime
AS
BEGIN
    DECLARE @offset int; -- timezone offset from UTC in minutes
    SELECT @offset = [ParameterValue] FROM [dbo].[SystemConfig] WHERE [ParameterName] = N''System.Database.TimeZoneOffset'';
    IF (@offset IS NULL) SELECT @offset = DATEDIFF(MINUTE, GETUTCDATE(), GETDATE());
    RETURN DATEADD(minute, @offset, GETUTCDATE());
END

';

EXEC(@sql);
END
GO


-- Drop Obsolete Stored Procedures
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConvertDeferredIncome]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_ConvertDeferredIncome]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DeferredIncomeImport]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_DeferredIncomeImport]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetEvaluatorLevelInfoForContact]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_GetEvaluatorLevelInfoForContact]
GO

-- Drop Obsolete BO Views
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoProductDetailReport')
BEGIN
    DROP VIEW [dbo].[vBoProductDetailReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDeferredIncomeReport')
BEGIN
    DROP VIEW [dbo].[vBoDeferredIncomeReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDonorClubReport')
BEGIN
    DROP VIEW [dbo].[vBoDonorClubReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoPromotionReport')
BEGIN
    DROP VIEW [dbo].[vBoPromotionReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDeferralMatrix')
BEGIN
    DROP VIEW [dbo].[vBoDeferralMatrix]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDeferralMatrixLine')
BEGIN
    DROP VIEW [dbo].[vBoDeferralMatrixLine]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDeferralMatrixLineDetail')
BEGIN
    DROP VIEW [dbo].[vBoDeferralMatrixLineDetail]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoDeferralTerms')
BEGIN
    DROP VIEW [dbo].[vBoDeferralTerms]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoEvaluator')
BEGIN
    DROP VIEW [dbo].[vBoEvaluator]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoEvaluatorLevel')
BEGIN
    DROP VIEW [dbo].[vBoEvaluatorLevel]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoEvaluatorReasonCode')
BEGIN
    DROP VIEW [dbo].[vBoEvaluatorReasonCode]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoComponentResourceAction')
BEGIN
    DROP VIEW [dbo].[vBoComponentResourceAction]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoResourceAction')
BEGIN
    DROP VIEW [dbo].[vBoResourceAction]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoUniformItemUniformResource')
BEGIN
    DROP VIEW [dbo].[vBoUniformItemUniformResource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoUniformResource')
BEGIN
    DROP VIEW [dbo].[vBoUniformResource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vBoUniformResourceAction')
BEGIN
    DROP VIEW [dbo].[vBoUniformResourceAction]
END
GO

-- Delete Obsolete BOD documents
EXEC dbo.asi_DocumentDelete '8A15076A-567D-4B1C-AB98-FAEC7DCFE5B8', 1 -- DeferralMatrix DBS
EXEC dbo.asi_DocumentDelete '9CD24AB4-D95B-484A-9240-67EDE8BD82B5', 1 -- DeferralMatrix DBO
EXEC dbo.asi_DocumentDelete 'BF77FFA8-76E6-4F9A-944B-6885F57474DC', 1 -- DeferralMatrix BUS
EXEC dbo.asi_DocumentDelete '68A00408-0384-4D51-81CF-90759D4B30E1', 1 -- DeferralMatrix BOD
EXEC dbo.asi_DocumentDelete '750AEB84-F58F-4030-B4F3-285CED57E809', 1 -- DeferralMatrixLine DBS
EXEC dbo.asi_DocumentDelete 'FE49D84D-33ED-4C4D-9106-21D07CA182C6', 1 -- DeferralMatrixLine DBO
EXEC dbo.asi_DocumentDelete '43F9A32C-E159-4191-A0FB-0B2B337CF13B', 1 -- DeferralMatrixLine BUS 
EXEC dbo.asi_DocumentDelete 'DF36617A-20CF-4C71-BE68-6BE2362238A4', 1 -- DeferralMatrixLine BOD
EXEC dbo.asi_DocumentDelete 'F61F149C-2484-4964-BE26-53EB1DC69CA1', 1 -- DeferralMatrixLineDetail DBS 
EXEC dbo.asi_DocumentDelete '60D591C7-C4D2-4533-8CAF-4F4678A7339C', 1 -- DeferralMatrixLineDetail DBO
EXEC dbo.asi_DocumentDelete '62BC1683-4261-43C1-85B4-EE60C7642129', 1 -- DeferralMatrixLineDetail BUS
EXEC dbo.asi_DocumentDelete '58F2B095-B3D6-42FA-AFD5-EBF4823D41E5', 1 -- DeferralMatrixLineDetail BOD
EXEC dbo.asi_DocumentDelete '367BBE4F-9FEC-4035-B754-B4523B70DAE5', 1 -- DeferralTerms DBS
EXEC dbo.asi_DocumentDelete 'A1E58A76-42AE-41CD-8F3E-43F266A238FB', 1 -- DeferralTerms DBO
EXEC dbo.asi_DocumentDelete '1D30F098-4AED-4933-998F-7E09688DA7B7', 1 -- DeferralTerms BOD
EXEC dbo.asi_DocumentDelete '1EE70DC2-8966-449A-B73E-B5DED07F7348', 1 -- DeferralTerms BUS
EXEC dbo.asi_DocumentDelete 'B99DCF93-9BF1-4EAE-BBFA-119DBAFFF155', 1 -- DeferralIntervalTypeRef DBO
EXEC dbo.asi_DocumentDelete '8FE3751B-58D7-47FB-ACF9-3DF916604CA4', 1 -- Evaluator BOD
EXEC dbo.asi_DocumentDelete '04BEF551-6CC6-40DC-B045-F6C633EE48CA', 1 -- Evaluator BUS
EXEC dbo.asi_DocumentDelete '855F1D48-2407-4823-8EF0-A2352FA48124', 1 -- Evaluator DBO
EXEC dbo.asi_DocumentDelete '52B727F6-CEF9-4BFC-BEE9-FF2D9E561B6A', 1 -- Evaluator DBS
EXEC dbo.asi_DocumentDelete '5B3D6E91-A62F-430E-B07E-0039378074E0', 1 -- EvaluatorLevel BOD
EXEC dbo.asi_DocumentDelete 'DD935583-3F70-4283-B93F-487038D67ABB', 1 -- EvaluatorLevel BUS
EXEC dbo.asi_DocumentDelete '44FF3B53-EE7D-4567-BEFB-8AC39C97399E', 1 -- EvaluatorLevel DBO
EXEC dbo.asi_DocumentDelete 'B3005163-3494-4BD4-979A-079A3C996F53', 1 -- EvaluatorLevel DBS
EXEC dbo.asi_DocumentDelete 'DD424176-8DAF-4019-B1B2-8CA4FCD6EBB1', 1 -- EvaluatorReasonCode BOD
EXEC dbo.asi_DocumentDelete 'D5885B51-2B9B-4994-A114-D7CEF87FCE72', 1 -- EvaluatorReasonCode BUS
EXEC dbo.asi_DocumentDelete '963FF77F-B4FE-4B34-8AC9-F4E20FC62245', 1 -- EvaluatorReasonCode DBS
EXEC dbo.asi_DocumentDelete 'B17DE85C-7386-4A82-ADD6-12503BF53790', 1 -- EvaluatorReasonCodeRef DBO
EXEC dbo.asi_DocumentDelete '2EE8FCDA-075D-4A69-A7EB-887FAA21D3FF', 1 -- UniformItemUniformResource BOD
EXEC dbo.asi_DocumentDelete 'BBCD6363-EF0D-470D-BDD9-23980E8739CA', 1 -- UniformItemUniformResource BUS
EXEC dbo.asi_DocumentDelete '55E9C89B-37CB-4063-95E5-92F9A0725971', 1 -- UniformItemUniformResource DBS
EXEC dbo.asi_DocumentDelete '87B508AE-FF3D-4AE9-A462-F00D1AE4ED27', 1 -- UniformItemUniformResourceRef DBO
EXEC dbo.asi_DocumentDelete '009AA978-DEBE-4625-AFF9-3F022335A644', 1 -- UniformResource BOD
EXEC dbo.asi_DocumentDelete '0130FCBB-4E09-42AC-9AFC-0EEEACE1220C', 1 -- UniformResource BUS
EXEC dbo.asi_DocumentDelete '7FF0F4F1-3B90-43F1-A9ED-AFC9DBA7727C', 1 -- UniformResource DBS
EXEC dbo.asi_DocumentDelete 'BBDA4BB5-FBFA-46D0-B6C9-FF7E85F6699E', 1 -- UniformResourceRef DBO
EXEC dbo.asi_DocumentDelete 'D44DC315-E6E8-40E9-B515-AD91F9F63451', 1 -- UniformResourceAction BOD
EXEC dbo.asi_DocumentDelete 'F20584DA-5086-4C59-9543-54D4BD86039A', 1 -- UniformResourceAction BUS
EXEC dbo.asi_DocumentDelete 'F7C91BDA-9E8D-4250-8B08-F7464F22A4C0', 1 -- UniformResourceAction DBO
EXEC dbo.asi_DocumentDelete 'DECA10F4-2414-46E0-A9BD-42F7DC30EC18', 1 -- UniformResourceAction DBS
EXEC dbo.asi_DocumentDelete '4CB01600-836F-4ED3-9EA0-7EAC10F5F703', 1 -- ComponentResourceAction BOD
EXEC dbo.asi_DocumentDelete '477181BF-6C0A-4241-A596-4347EFDA0206', 1 -- ComponentResourceAction BUS
EXEC dbo.asi_DocumentDelete 'A089DB03-D36A-4A5B-B042-F77DD1C667C4', 1 -- ComponentResourceAction DBS
EXEC dbo.asi_DocumentDelete '6F3708EC-FE50-4470-AE20-6515A56BC5E8', 1 -- ComponentResourceActionRef DBO
EXEC dbo.asi_DocumentDelete '993C49EF-1A32-43F5-93B1-54D2A267B026', 1 -- ResourceAction BOD
EXEC dbo.asi_DocumentDelete 'EBDF1C0E-810D-40E8-BAFB-5C830CB8C193', 1 -- ResourceAction BUS
EXEC dbo.asi_DocumentDelete '5E803643-C118-4471-AB6D-8B497A3F6CA8', 1 -- ResourceAction DBS
EXEC dbo.asi_DocumentDelete '7CCEF150-36C9-4FBE-9932-CBEB8FAE2B29', 1 -- ResourceActionRef DBO
EXEC dbo.asi_DocumentDelete '80043D51-C2B9-4095-89B6-A4E47DD9CC14', 1 -- DeferredIncomeReport BOD
EXEC dbo.asi_DocumentDelete 'E3A7868A-E2C9-4D2B-82E0-406997318204', 1 -- DeferredIncomeReport BUS
EXEC dbo.asi_DocumentDelete '6E141E00-F779-499E-A775-7A917B878096', 1 -- DeferredIncomeReport DBS
EXEC dbo.asi_DocumentDelete 'BC2F4448-D324-449A-BA45-1DA54B3161F3', 1 -- vDeferredIncomeReport DBO
EXEC dbo.asi_DocumentDelete '56DEEFC1-F341-4814-AEB1-E67C8686E5D9', 1 -- DonorClubReport BOD
EXEC dbo.asi_DocumentDelete 'B6E44606-A06D-4599-8C2E-0A343F3ED0BA', 1 -- DonorClubReport BUS
EXEC dbo.asi_DocumentDelete '6A559167-B8D1-46CC-A967-DBEE63C7A765', 1 -- DonorClubReport DBS
EXEC dbo.asi_DocumentDelete '84229973-7EB4-4AB5-A9B2-20901E0070D7', 1 -- vDonorClubReport DBO
EXEC dbo.asi_DocumentDelete '2B78DA99-0902-4087-8DBC-7CDE9689EC02', 1 -- PromotionReport BOD
EXEC dbo.asi_DocumentDelete 'A652CA9E-3547-405D-9A08-863107F41BDB', 1 -- PromotionReport BUS
EXEC dbo.asi_DocumentDelete '14E9E7FA-10E9-4719-BB42-765E945AAC95', 1 -- PromotionReport DBS
EXEC dbo.asi_DocumentDelete 'D5B45F3C-B893-47F6-998C-24AAC21D9DB8', 1 -- vPromotionReport DBO
EXEC dbo.asi_DocumentDelete '23FE3A09-6544-44F3-97D0-6F6126C0AE6D', 1 -- ProductDetailReport BOD
EXEC dbo.asi_DocumentDelete '4CFAC2F4-E5AF-4E07-BB50-7568EC199FE0', 1 -- ProductDetailReport BUS
EXEC dbo.asi_DocumentDelete 'E1B0AD25-EAE1-46DE-B93D-1FCBCB1376D5', 1 -- ProductDetailReport DBS
EXEC dbo.asi_DocumentDelete '637E83C4-E9E7-4070-942A-18BF6D809DF4', 1 -- vProductDetailReport DBO
GO

-- Drop Foreign Keys
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DeferralMatrix_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeferralMatrix]'))
    ALTER TABLE [dbo].[DeferralMatrix] DROP CONSTRAINT [FK_DeferralMatrix_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DeferralMatrixLine_DeferralMatrix]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeferralMatrixLine]'))
    ALTER TABLE [dbo].[DeferralMatrixLine] DROP CONSTRAINT [FK_DeferralMatrixLine_DeferralMatrix]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DeferralMatrixLineDetail_DeferralMatrix]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeferralMatrixLineDetail]'))
    ALTER TABLE [dbo].[DeferralMatrixLineDetail] DROP CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrix]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DeferralMatrixLineDetail_DeferralMatrixLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeferralMatrixLineDetail]'))
    ALTER TABLE [dbo].[DeferralMatrixLineDetail] DROP CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrixLine]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductMain_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductMain]'))
    ALTER TABLE [dbo].[ProductMain] DROP CONSTRAINT [FK_ProductMain_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductClass_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductClass]'))
    ALTER TABLE [dbo].[ProductClass] DROP CONSTRAINT [FK_ProductClass_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceDistribution_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceDistribution]'))
    ALTER TABLE [dbo].[InvoiceDistribution] DROP CONSTRAINT [FK_InvoiceDistribution_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkInvoiceDistribution_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkInvoiceDistribution]'))
    ALTER TABLE [dbo].[WorkInvoiceDistribution] DROP CONSTRAINT [FK_WorkInvoiceDistribution_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GLTransactionLine_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[GLTransactionLine]'))
    ALTER TABLE [dbo].[GLTransactionLine] DROP CONSTRAINT [FK_GLTransactionLine_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DeferredIncomeWork_DeferralTerms]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeferredIncomeWork]'))
    ALTER TABLE [dbo].[DeferredIncomeWork] DROP CONSTRAINT [FK_DeferredIncomeWork_DeferralTerms]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Evaluator_EvaluatorReasonCodeRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[Evaluator]'))
    ALTER TABLE [dbo].[Evaluator] DROP CONSTRAINT [FK_Evaluator_EvaluatorReasonCodeRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EvaluatorLevel_Evaluator]') AND parent_object_id = OBJECT_ID(N'[dbo].[EvaluatorLevel]'))
    ALTER TABLE [dbo].[EvaluatorLevel] DROP CONSTRAINT [FK_EvaluatorLevel_Evaluator]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComponentResourceActionRef_ResourceActionRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[ComponentResourceActionRef]'))
    ALTER TABLE [dbo].[ComponentResourceActionRef] DROP CONSTRAINT [FK_ComponentResourceActionRef_ResourceActionRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UniformItemUniformResourceRef_UniformResourceRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[UniformItemUniformResourceRef]'))
    ALTER TABLE [dbo].[UniformItemUniformResourceRef] DROP CONSTRAINT [FK_UniformItemUniformResourceRef_UniformResourceRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UniformResourceAction_UniformResourceRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[UniformResourceAction]'))
    ALTER TABLE [dbo].[UniformResourceAction] DROP CONSTRAINT [FK_UniformResourceAction_UniformResourceRef]
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UniformResourceActionRef_ResourceActionRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[UniformResourceAction]'))
    ALTER TABLE [dbo].[UniformResourceAction] DROP CONSTRAINT [FK_UniformResourceActionRef_ResourceActionRef]

GO


-- Drop Obsolete Views
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vDeferredIncomeReport')
BEGIN
    DROP VIEW [dbo].[vDeferredIncomeReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vDonorClubReport')
BEGIN
    DROP VIEW [dbo].[vDonorClubReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vPromotionReport')
BEGIN
    DROP VIEW [dbo].[vPromotionReport]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vProductDetailReport')
BEGIN
    DROP VIEW [dbo].[vProductDetailReport]
END

GO


-- Drop Obsolete Tables
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeferralMatrix')
BEGIN
    DROP TABLE DeferralMatrix
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeferralMatrixLine')
BEGIN
    DROP TABLE DeferralMatrixLine
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeferralMatrixLineDetail')
BEGIN
    DROP TABLE DeferralMatrixLineDetail
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeferralTerms')
BEGIN
    DROP TABLE DeferralTerms
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeferralIntervalTypeRef')
BEGIN
    DROP TABLE DeferralIntervalTypeRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Evaluator')
BEGIN
    DROP TABLE Evaluator
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EvaluatorLevel')
BEGIN
    DROP TABLE EvaluatorLevel
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EvaluatorReasonCodeRef')
BEGIN
    DROP TABLE EvaluatorReasonCodeRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ComponentResourceActionRef')
BEGIN
    DROP TABLE ComponentResourceActionRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ResourceActionRef')
BEGIN
    DROP TABLE ResourceActionRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UniformItemUniformResourceRef')
BEGIN
    DROP TABLE UniformItemUniformResourceRef
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UniformResourceAction')
BEGIN
    DROP TABLE UniformResourceAction
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UniformResourceRef')
BEGIN
    DROP TABLE UniformResourceRef
END

GO

-- Remove unnecessary indexes from UserDefinedSingleInstanceProperty
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_BooleanValue')
DROP INDEX [IX_UserDefinedMultiInstanceProperty_BooleanValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_DateTimeValue')
DROP INDEX [IX_UserDefinedMultiInstanceProperty_DateTimeValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_GuidValue')
DROP INDEX [IX_UserDefinedMultiInstanceProperty_GuidValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_IntValue')
DROP INDEX [IX_UserDefinedMultiInstanceProperty_IntValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND name = N'IX_UserDefinedMultiInstanceProperty_StringValue')
DROP INDEX [IX_UserDefinedMultiInstanceProperty_StringValue] ON [dbo].[UserDefinedSingleInstanceProperty] WITH ( ONLINE = OFF )
GO

-- First remove the license key restriction on the navigation "Import NRDS transactions"
DELETE FROM UniformLicense where UniformKey = '389DA67D-3A55-4B84-8821-567E0E6D39D5'

-- Then delete the navigation "~/AR_Cash/Enter and edit transactions/Import NRDS transactions"
EXEC dbo.asi_DocumentDelete '389DA67D-3A55-4B84-8821-567E0E6D39D5', 1


SET NOCOUNT OFF
GO