---------------------------------------------------
-- Drop or delete any obsolete DB schema or rows --
---------------------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
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
EXEC dbo.asi_DocumentDelete '4CB01600-836F-4ED3-9EA0-7EAC10F5F703', 1 -- ComponentResourceAction BOD
EXEC dbo.asi_DocumentDelete '477181BF-6C0A-4241-A596-4347EFDA0206', 1 -- ComponentResourceAction BUS
EXEC dbo.asi_DocumentDelete 'A089DB03-D36A-4A5B-B042-F77DD1C667C4', 1 -- ComponentResourceAction DBS
EXEC dbo.asi_DocumentDelete '6F3708EC-FE50-4470-AE20-6515A56BC5E8', 1 -- ComponentResourceActionRef DBO
EXEC dbo.asi_DocumentDelete '04F75631-8B4E-4205-981C-5CB735CD4F98', 1 -- ContactCommunicationLogReport BOD
EXEC dbo.asi_DocumentDelete '3314BA48-FB1C-4A05-B043-C06B967833F4', 1 -- ContactCommunicationLogReport BUS
EXEC dbo.asi_DocumentDelete '1792F9E1-4BF1-4ED6-B1F5-EA0D87C1514E', 1 -- ContactCommunicationLogReport DBS
EXEC dbo.asi_DocumentDelete '520C1758-24B7-4FB3-AAFD-1B49C2D5C14C', 1 -- ContentTypeRegistry BUS
EXEC dbo.asi_DocumentDelete 'B41EF9DE-7C9C-4033-A9EF-56755CB24F1B', 1 -- ContentTypeRegistry BOD
EXEC dbo.asi_DocumentDelete '1E87B16D-DF42-4B99-BC10-860D39A1584B', 1 -- ContentTypeRegistry DBS
EXEC dbo.asi_DocumentDelete '80043D51-C2B9-4095-89B6-A4E47DD9CC14', 1 -- DeferredIncomeReport BOD
EXEC dbo.asi_DocumentDelete 'E3A7868A-E2C9-4D2B-82E0-406997318204', 1 -- DeferredIncomeReport BUS
EXEC dbo.asi_DocumentDelete '6E141E00-F779-499E-A775-7A917B878096', 1 -- DeferredIncomeReport DBS
EXEC dbo.asi_DocumentDelete 'BC2F4448-D324-449A-BA45-1DA54B3161F3', 1 -- vDeferredIncomeReport DBO
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
EXEC dbo.asi_DocumentDelete '56DEEFC1-F341-4814-AEB1-E67C8686E5D9', 1 -- DonorClubReport BOD
EXEC dbo.asi_DocumentDelete 'B6E44606-A06D-4599-8C2E-0A343F3ED0BA', 1 -- DonorClubReport BUS
EXEC dbo.asi_DocumentDelete '6A559167-B8D1-46CC-A967-DBEE63C7A765', 1 -- DonorClubReport DBS
EXEC dbo.asi_DocumentDelete '84229973-7EB4-4AB5-A9B2-20901E0070D7', 1 -- vDonorClubReport DBO
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
EXEC dbo.asi_DocumentDelete '2B78DA99-0902-4087-8DBC-7CDE9689EC02', 1 -- PromotionReport BOD
EXEC dbo.asi_DocumentDelete 'A652CA9E-3547-405D-9A08-863107F41BDB', 1 -- PromotionReport BUS
EXEC dbo.asi_DocumentDelete '14E9E7FA-10E9-4719-BB42-765E945AAC95', 1 -- PromotionReport DBS
EXEC dbo.asi_DocumentDelete 'D5B45F3C-B893-47F6-998C-24AAC21D9DB8', 1 -- vPromotionReport DBO
EXEC dbo.asi_DocumentDelete '23FE3A09-6544-44F3-97D0-6F6126C0AE6D', 1 -- ProductDetailReport BOD
EXEC dbo.asi_DocumentDelete '4CFAC2F4-E5AF-4E07-BB50-7568EC199FE0', 1 -- ProductDetailReport BUS
EXEC dbo.asi_DocumentDelete 'E1B0AD25-EAE1-46DE-B93D-1FCBCB1376D5', 1 -- ProductDetailReport DBS
EXEC dbo.asi_DocumentDelete '637E83C4-E9E7-4070-942A-18BF6D809DF4', 1 -- vProductDetailReport DBO
EXEC dbo.asi_DocumentDelete 'e2e720fe-2b70-4445-b4fd-7aa34545c03e', 1 -- Report View shortcut
EXEC dbo.asi_DocumentDelete '993C49EF-1A32-43F5-93B1-54D2A267B026', 1 -- ResourceAction BOD
EXEC dbo.asi_DocumentDelete 'EBDF1C0E-810D-40E8-BAFB-5C830CB8C193', 1 -- ResourceAction BUS
EXEC dbo.asi_DocumentDelete '5E803643-C118-4471-AB6D-8B497A3F6CA8', 1 -- ResourceAction DBS
EXEC dbo.asi_DocumentDelete '7CCEF150-36C9-4FBE-9932-CBEB8FAE2B29', 1 -- ResourceActionRef DBO
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
-- Delete obsolete navigation items being replaced with shortcuts
EXEC dbo.asi_DocumentDelete 'D89F1F14-1EE4-4D76-80A5-112380DF40F7', 1 -- Item_Detail
EXEC dbo.asi_DocumentDelete '15250882-231E-4144-8CAB-A14A3B7F4B67', 1 -- Gift_Detail
EXEC dbo.asi_DocumentDelete '2EF5B37B-26D2-4C7C-80C4-2879F65A7BA5', 1 -- Gift_Detail
EXEC dbo.asi_DocumentDelete '7C8EA9F7-6298-46DB-AD42-23D486CEB47D', 1 -- Event_Detail
EXEC dbo.asi_DocumentDelete '8017119C-4AA9-4760-81E3-7533F559E0AB', 1 -- Item_Detail
EXEC dbo.asi_DocumentDelete 'E5788B5F-15E8-4C63-B5B8-B217AA0CF827', 1 -- Event_Detail
EXEC dbo.asi_DocumentDelete '967915BC-272A-4302-AAC1-2940252647A8', 1 ---MemberHome -MBR
EXEC dbo.asi_DocumentDelete 'F7ADFF4E-308B-41F3-A988-F21B5767E65A', 1 ---Member Profile -MBR
EXEC dbo.asi_DocumentDelete '20582AFF-DA6F-4074-9C4E-04D8E6291D27', 1 ---Member Profile -Mobile 
EXEC dbo.asi_DocumentDelete 'C3BD0CD3-2C21-4D54-B670-EDE0CE1AB7D1', 1 ---Organization Profile -MBR 
EXEC dbo.asi_DocumentDelete '11215929-5073-4B4A-A51D-8A2B6BD2445D', 1 ---Organization Profile -Mobile
EXEC dbo.asi_DocumentDelete 'C1A1B83A-A118-4BA8-A8D8-E5B4DD497F67', 1 ---Organization  -Mobile
EXEC dbo.asi_DocumentDelete '23992555-F6C9-45D8-A553-FD0408F7033E', 1 ---Organization  -MBR
EXEC dbo.asi_DocumentDelete '16F8A660-9C4A-4DCC-9386-D0EF582EA2DC', 1 ---Full Account -MBR
EXEC dbo.asi_DocumentDelete 'ACB2CAC2-8116-4430-AC3E-F6F781B88173', 1 ---My Account –MBR
EXEC dbo.asi_DocumentDelete '209E1D65-4E52-4B66-85A8-ADD5E72EC230', 1 --System Nav Item -Mobile
EXEC dbo.asi_DocumentDelete '335A30A6-0DE6-4228-80B2-9F7D6F9B8E80', 1 --My Account Nav Item -Mobile
EXEC dbo.asi_DocumentDelete '5ECE3708-9688-41DB-91CC-57E08AF11FE1', 1 --Create Account Nav Item -Mobile
EXEC dbo.asi_DocumentDelete '27B4175D-E261-4061-AB27-AB37A9744AE7', 1 --Create Account Nav Item –Member
EXEC dbo.asi_DocumentDelete '0A386C27-1AA2-4B31-AA4C-B20D7DF5F0AC', 1 --Create Account no Sign In Nav Item -Member
EXEC dbo.asi_DocumentDelete '3B65E01D-28F0-44E9-8BF8-F3E33CA12131', 1 --System & child Sign In Nav Items -Member
EXEC dbo.asi_DocumentDelete 'C7AB08F0-170F-493E-92A3-A394892A36E3', 1 --Hidden & children (Planning Session & Spring Conference) Nav Items

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

-- Begin temporary removal of views WITH SCHEMABINDING
-- The following views are not obsolete but have the WITH SCHEMABINDING hint
-- applied, which will cause problems in a future step.  These views will be 
-- recreated by CreateViews.sql.
IF  EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vSoaEventSummary')
BEGIN
    DROP VIEW [dbo].[vSoaEventSummary]
END

IF  EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vSoaPartySummary')
BEGIN
    DROP VIEW [dbo].[vSoaPartySummary]
END
-- End temporary removal of views WITH SCHEMABINDING

-- vSoaPartyEventAvailability doesn't have WITH SCHEMABINDING defined but is dependent on 
-- vSoaPartyEventAvailabilityBase, below, so drop it.  It will be recreated by CreateViews.sql.
IF  EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vSoaPartyEventAvailability')
BEGIN
    DROP VIEW [dbo].[vSoaPartyEventAvailability]
END

-- vSoaPartyEventAvailabilityBase is truly obsolete
IF  EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vSoaPartyEventAvailabilityBase')
BEGIN
    DROP VIEW [dbo].[vSoaPartyEventAvailabilityBase]
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
GO

-- Remove potentially left-over references to obsolete iParts
DELETE 
  FROM [dbo].[ComponentRegistry]
 WHERE [Name] IN ('Cart Summary', 'Order Confirmation', 'Payment Details', 'Submit Order')
GO
DECLARE @docVerKey uniqueidentifier
SELECT @docVerKey = [DocumentVersionKey]
  FROM [dbo].[DocumentMain]
 WHERE [DocumentName] = 'Cart Summary' AND DocumentTypeCode = 'RCT' AND DocumentStatusCode = 40
EXEC dbo.asi_DocumentDelete @docVerKey, 1
SELECT @docVerKey = [DocumentVersionKey]
  FROM [dbo].[DocumentMain]
 WHERE [DocumentName] = 'Payment Details' AND DocumentTypeCode = 'RCT' AND DocumentStatusCode = 40
EXEC dbo.asi_DocumentDelete @docVerKey, 1
SELECT @docVerKey = [DocumentVersionKey]
  FROM [dbo].[DocumentMain]
 WHERE [DocumentName] = 'Submit Order' AND DocumentTypeCode = 'RCT' AND DocumentStatusCode = 40
EXEC dbo.asi_DocumentDelete @docVerKey, 1
SELECT @docVerKey = [DocumentVersionKey]
  FROM [dbo].[DocumentMain]
 WHERE [DocumentName] = 'Order Confirmation' AND DocumentTypeCode = 'RCT' AND DocumentStatusCode = 40
EXEC dbo.asi_DocumentDelete @docVerKey, 1
GO 

-- Drop obsolete or redundant indexes
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DocumentMain]') AND name = N'idx_DocumentMain_DocumentVersionKey')
DROP INDEX [idx_DocumentMain_DocumentVersionKey] ON [dbo].[DocumentMain] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DocumentMain]') AND name = N'IX_DocumentMain_DocumentVersionKey_Cover1')
DROP INDEX [IX_DocumentMain_DocumentVersionKey_Cover1] ON [dbo].[DocumentMain] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DocumentMain]') AND name = N'AK_DocumentMain_DefaultChildAccessKey')
DROP INDEX [AK_DocumentMain_DefaultChildAccessKey] ON [dbo].[DocumentMain] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hierarchy]') AND name = N'IX_Hierarchy_ParentHierarchyKey')
DROP INDEX [IX_Hierarchy_ParentHierarchyKey] ON dbo.Hierarchy

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hierarchy]') AND name = N'IX_Hierarchy_RootHierarchyKey_SortOrder')
DROP INDEX [IX_Hierarchy_RootHierarchyKey_SortOrder] ON [dbo].[Hierarchy] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'AK_UserMain_UserID')
DROP INDEX [AK_UserMain_UserID] ON [dbo].[UserMain] WITH ( ONLINE = OFF )

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMain]') AND name = N'idx_UserID')
DROP INDEX [idx_UserID] ON [dbo].[UserMain] WITH ( ONLINE = OFF )
GO

-- drop unnecessary StateProvinceRef index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND name = N'IX_StateProvinceRef_StateProvinceCode')
DROP INDEX [IX_StateProvinceRef_StateProvinceCode] ON [dbo].[StateProvinceRef] WITH ( ONLINE = OFF )
GO

-- Clean up Hierarchy Issues 
DELETE FROM Hierarchy WHERE HierarchyKey = '8228F9AC-5E77-4475-9E64-66C2C07682CD' -- Extraneous PrefixRef BUS hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '5F773E02-EF13-479E-A90E-87E6684733FA' -- Extraneous PrefixRef BUS hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '8E1ACD0C-89C9-4865-B81A-DAAFF4F1DAC6' -- Extraneous CertificationModule BOD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '7FE39B35-925D-4916-9F42-E0B93F82AA52' -- Extraneous All Campaigns IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '40A839AA-E731-4B17-86D4-11A9A94FC33D' -- Extraneous Campaign by Name IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '94BBC95A-D226-4CBC-A914-E64152BAE069' -- Extraneous Inactive Campaigns IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '33A276CF-B537-498A-9A70-65424752F59B' -- Extraneous RFM Analysis by name IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '7182E573-855F-49E8-B8EF-E4BC677D694C' -- Extraneous Segment Definition by Name IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = 'BF8BFCC0-04A2-40B4-91A6-AFA4B220868A' -- Extraneous Segmentation Definition by Job IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = 'A3FE6636-3A4A-46BE-8158-937E22E49739' -- Extraneous Segmentation Job by Name IQD hierarchy
DELETE FROM Hierarchy WHERE HierarchyKey = '8519BA04-BCEE-4C6C-B56D-B218B9AB22A1' -- Extraneous Example Query IQD hierarchy
UPDATE [dbo].[Hierarchy]    -- Move children, if any
   SET [ParentHierarchyKey] = 'DF91D18C-735B-48A6-A1CA-411B0B3B9ABC'
 WHERE [ParentHierarchyKey] = '5E17D7C9-215E-4EB4-AA39-A1FB6C5CD2E0'
DELETE FROM Hierarchy WHERE HierarchyKey = '5E17D7C9-215E-4EB4-AA39-A1FB6C5CD2E0' -- Extraneous Templates FOL hierarchy
UPDATE [dbo].[Hierarchy]    -- Move children, if any
   SET [ParentHierarchyKey] = '34BE25A3-88B4-42D9-AF2F-FB7BE111AC09'
 WHERE [ParentHierarchyKey] = 'F06908B9-820D-43B0-90CE-59CCF884E2E0'
DELETE FROM Hierarchy WHERE HierarchyKey = 'F06908B9-820D-43B0-90CE-59CCF884E2E0' -- Extraneous User Queries FOL hierarchy 

GO

----------------------------------------------------------
-- Remove obsolete system config parameter SE.DisplayIcons
----------------------------------------------------------

DECLARE @ParameterName nvarchar(255)
DECLARE @PropertyDefinitionKey uniqueidentifier

SET @ParameterName = 'SE.DisplayIcons'

SELECT @PropertyDefinitionKey = PropertyDefinitionKey
  FROM [dbo].[SystemConfigParameterRef]
WHERE [ParameterName] = @ParameterName

DELETE FROM [dbo].[SystemConfig] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigPageParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[SystemConfigParameterRef] WHERE [ParameterName] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [Label] = @ParameterName
DELETE FROM [dbo].[PropertyDefinition] WHERE [PropertyDefinitionKey] = @propertyDefinitionKey
GO

-- remove InventoryTransactionLog BO
EXEC [dbo].[asi_DocumentDelete] 'C4752CA3-31FE-474C-93B9-1FF3BB0C141C', 1;
EXEC [dbo].[asi_DocumentDelete] '22F449DF-3BA9-45CC-BB2F-4AEF57ECD33C', 1;
EXEC [dbo].[asi_DocumentDelete] '8CC7902D-AEB5-40E8-BF7F-593ED6E90D4E', 1;
-- remove InventoryTransactionLogCost BO
EXEC [dbo].[asi_DocumentDelete] '9C303120-6288-46D5-A5FA-8A553603BE1D', 1;
EXEC [dbo].[asi_DocumentDelete] '291C8630-4A8E-4701-8097-D8ABFE86A762', 1;
EXEC [dbo].[asi_DocumentDelete] '1F95E8CF-25F4-4B49-A1BA-F666E38A3485', 1;
-- remove InventoryTransactionLogLine BO
EXEC [dbo].[asi_DocumentDelete] '857AAEB1-A6E0-4CA7-8EB8-26E6E9DCD758', 1;
EXEC [dbo].[asi_DocumentDelete] '6A072380-4698-4FDB-842E-270108C402CD', 1;
EXEC [dbo].[asi_DocumentDelete] '39F37941-0063-43B5-9D4E-662CC7CE4ACC', 1;
-- remove the WorkflowDemo BO
EXEC [dbo].[asi_DocumentDelete] 'B719702D-8FB8-4CD7-9512-17379F67D9D4', 1;
EXEC [dbo].[asi_DocumentDelete] '6608F961-9A62-482E-B1D5-86668200C2FF', 1;
EXEC [dbo].[asi_DocumentDelete] 'EBB700C4-2DBD-4064-8650-D0EE9D538966', 1;
EXEC [dbo].[asi_DocumentDelete] '2A308CF9-2439-4231-BAA5-D254E02B6DEE', 1;
-- remove the WorkflowDemoLog BO
EXEC [dbo].[asi_DocumentDelete] 'AC853BEB-83C9-4827-81B5-59F88A7D20BE', 1;
EXEC [dbo].[asi_DocumentDelete] 'C86F1E00-A70C-45B7-B38F-CDCA1F149F48', 1;
EXEC [dbo].[asi_DocumentDelete] 'DEAC8EED-437F-4FE9-8A7F-F3DCE725A94E', 1;
EXEC [dbo].[asi_DocumentDelete] '88EC95A9-6437-440B-9157-FDEE002C7599', 1;
-- remove the BatchSetup BO
EXEC [dbo].[asi_DocumentDelete] '852EB6E8-851D-4C76-8FB5-7FB7084765D2', 1;
EXEC [dbo].[asi_DocumentDelete] 'B8AD5FA6-0CD9-4A4F-896D-D4A4957C2F1E', 1;
EXEC [dbo].[asi_DocumentDelete] '78A7B342-1EB2-4F19-B405-EFF19AA50797', 1;
-- remove the BatchStatusRef BO
EXEC [dbo].[asi_DocumentDelete] '2560346B-C6FF-43BA-B34E-1581DD3B6B1E', 1;
EXEC [dbo].[asi_DocumentDelete] '61A2479B-9709-42F3-8A23-51F0E3EF7D71', 1;
EXEC [dbo].[asi_DocumentDelete] 'DCFD996D-EB47-4474-9102-84DDBC2DB3B4', 1;

-- remove obsolete rows from ComponentRegistry - these are Pecos things
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchStatusRef')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'BatchStatusRef'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetupControl')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetupControl'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetupAction')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetupAction'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetupCriterion'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetup')
DELETE [dbo].[AtomPanelWebSite] WHERE [AtomPanelKey] IN
(SELECT [AtomPanelKey] FROM [dbo].[AtomPanel] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetup'))
DELETE [dbo].[AtomPanel] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetup')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'BatchSetup'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'WorkflowDemo'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'WorkflowDemoLog'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'InventoryTransactionLogLine'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'InventoryTransactionLogCost'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'InventoryTransactionLog')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'InventoryTransactionLog'     

-- remove obsolete WebPartGalleryEntry documents
EXEC [dbo].[asi_DocumentDelete] 'ADFBC001-F7CD-4479-95FB-2A728DC06C5F', 1;
EXEC [dbo].[asi_DocumentDelete] '0642E88D-FD11-49F2-BD62-8E860CB4F936', 1;
-- remove obsolete Generic documents
EXEC [dbo].[asi_DocumentDelete] 'C5275ABB-EB53-458E-8A85-05505C5CEA53', 1;
EXEC [dbo].[asi_DocumentDelete] '1321F717-A03A-4DFB-98FF-B2820A389D16', 1;
EXEC [dbo].[asi_DocumentDelete] 'CD618882-3EE0-43D9-9505-E81B3D43B3E1', 1;
-- remove obsolete GenericLink documents
EXEC [dbo].[asi_DocumentDelete] 'E36FA82C-0CB3-4E8C-B2A2-3C6E71203F9A', 1;
EXEC [dbo].[asi_DocumentDelete] 'A6A98DAD-8EE6-4F30-9146-5558BE5FF9CE', 1;
EXEC [dbo].[asi_DocumentDelete] 'E39F6AFA-1E0E-4F92-8B92-D142CE4A3947', 1;

-- delete component registry for the same objects
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'WebPartGalleryEntry'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'Generic')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'Generic'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'GenericLink'


-- remove obsolete DiscountRule documents
EXEC [dbo].[asi_DocumentDelete] 'D9DD6A8D-904A-43BF-870A-0FA3CFD18D7B', 1;
EXEC [dbo].[asi_DocumentDelete] 'DAE9651B-E937-483C-AE27-E266433ED6CD6', 1;
-- remove obsolete PromotionRule documents
EXEC [dbo].[asi_DocumentDelete] '15D61325-C5F0-4E0E-B03D-66789DD63068', 1;
EXEC [dbo].[asi_DocumentDelete] 'DFC79781-8426-401D-9DBF-CECEAA91FAFB', 1;
-- remove obsolete Rule documents
EXEC [dbo].[asi_DocumentDelete] '0F8A79D5-5282-4395-82D2-6D19EDB68716', 1;
EXEC [dbo].[asi_DocumentDelete] 'EC875068-B0AF-4F98-A9A6-8AFD712CE1EA', 1;
EXEC [dbo].[asi_DocumentDelete] 'BBD618A1-FFE9-4B96-8CE4-CF71F0C4CBAE', 1;

-- delete component registry for the same objects
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'DiscountRule')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'DiscountRule'
DELETE [dbo].[ComponentRegistryCategory] WHERE [ComponentKey] IN
    (SELECT [ComponentKey] FROM [dbo].[ComponentRegistry] WHERE [Name] = 'PromotionRule')
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'PromotionRule'
DELETE [dbo].[ComponentRegistry] WHERE [Name] = 'Rule'
GO

-- Delete content items with duplicate content codes
EXEC dbo.asi_DocumentDelete '2aca0af9-2c07-4622-a3e9-46ce8598dec6', 1
EXEC dbo.asi_DocumentDelete 'f9639819-c852-4a4f-8de0-4fc8049774b1', 1
EXEC dbo.asi_DocumentDelete '0967c168-bbe5-4226-b38f-545f4e92e978', 1
EXEC dbo.asi_DocumentDelete '817b0296-145d-44ff-a5c2-0f63a1ac0435', 1
EXEC dbo.asi_DocumentDelete '649d6a33-5a1e-4753-a82d-5f9fa0407bcf', 1

-- Delete obsolete/unused content items
EXEC dbo.asi_DocumentDelete '1aa99a5c-ac22-4cd2-adea-3325549c7674', 1
EXEC dbo.asi_DocumentDelete '3311730d-bc1f-4b04-ba72-27068988c602', 1
EXEC dbo.asi_DocumentDelete 'a0fbdbfc-27fa-4048-9435-26a02731ba59', 1
EXEC dbo.asi_DocumentDelete '7b908435-a7be-4d6f-ab61-24d60fb45dad', 1
EXEC dbo.asi_DocumentDelete 'afca23e2-8647-44db-99f0-7c7166bb8282', 1
EXEC dbo.asi_DocumentDelete 'fcb33091-7eb9-4254-a2e5-4f67d03f08be', 1
EXEC dbo.asi_DocumentDelete '500c27aa-619e-45dd-af6c-5c07e9e6f26f', 1
EXEC dbo.asi_DocumentDelete '4749fe7c-f341-42f6-b73a-77c0836f8035', 1
EXEC dbo.asi_DocumentDelete 'ef5c52d2-8b5e-4c58-9e03-bbb70a7470ef', 1
EXEC dbo.asi_DocumentDelete 'cde13b51-131a-48a3-8724-eae57fbf3b9d', 1
EXEC dbo.asi_DocumentDelete '7694f35c-c05b-45b4-b683-89835cc9e4c9', 1
EXEC dbo.asi_DocumentDelete '999c0afb-e3f7-41b2-aff0-2215cefbafec', 1
EXEC dbo.asi_DocumentDelete 'b217aa4f-22e8-4bf2-881d-df4db912e538', 1
EXEC dbo.asi_DocumentDelete '2dd442fd-8fe2-4dd9-b6a4-953ee5d59032', 1
EXEC dbo.asi_DocumentDelete '5368c921-98d2-4fb2-882e-3bd505fc78a7', 1
EXEC dbo.asi_DocumentDelete '13f0435b-a0d8-456e-8efb-419ba2e42da7', 1
EXEC dbo.asi_DocumentDelete '5dbb64f9-9282-42c2-a8d6-67b3fcd95a44', 1
EXEC dbo.asi_DocumentDelete 'a9aa18e4-52ce-4bcb-b5d6-5e2e95a6f634', 1
EXEC dbo.asi_DocumentDelete '1d1643ab-50f8-42ac-9635-1eee7fd62d8c', 1
EXEC dbo.asi_DocumentDelete 'bb057e2c-55dd-4bdb-8ea1-4d7751deea88', 1
EXEC dbo.asi_DocumentDelete '9bda26b8-7ab6-4680-826e-f4a728a9f081', 1
EXEC dbo.asi_DocumentDelete 'fa863651-629f-4853-8100-f1c58d7069ed', 1
EXEC dbo.asi_DocumentDelete '1995d7ea-15ab-44cb-a3c6-e4a5717c85b7', 1
EXEC dbo.asi_DocumentDelete '29455b53-9264-46eb-ac77-3ccfc8630ff4', 1
EXEC dbo.asi_DocumentDelete 'b646c1d7-c6cb-4275-9ac5-7933143b0cf1', 1
EXEC dbo.asi_DocumentDelete '452f851e-7875-451a-a648-11bd75644c2b', 1
EXEC dbo.asi_DocumentDelete 'eda030c9-ba0e-4dfb-bbb8-849252f3ff69', 1
EXEC dbo.asi_DocumentDelete 'f4ca839f-3dba-43f4-97fe-aa501c8818e4', 1
EXEC dbo.asi_DocumentDelete '21e73e15-42ac-4827-9582-914113de5b03', 1
EXEC dbo.asi_DocumentDelete '229d89bc-b05d-4d77-8b82-584f5d9f1db2', 1
EXEC dbo.asi_DocumentDelete '4a204c39-8581-4401-a570-ae270dbf546d', 1
EXEC dbo.asi_DocumentDelete '3fcf5783-c790-4f53-adbd-da84f515caae', 1
EXEC dbo.asi_DocumentDelete '9157e69f-ad38-43ca-b036-3ace55dca0f8', 1
EXEC dbo.asi_DocumentDelete '35e623d4-c2fa-40d7-93cb-8dda2406f20a', 1
EXEC dbo.asi_DocumentDelete '6dd8ca47-b41c-4f53-a3a7-85a333df5bf5', 1
EXEC dbo.asi_DocumentDelete '1b8ca72b-411f-41f4-90a5-d53208a5a2f1', 1
EXEC dbo.asi_DocumentDelete 'ff0fa749-0395-4b4f-ae97-32ee7a17f181', 1
EXEC dbo.asi_DocumentDelete '9f90a425-c76e-4445-b746-30882f1f307c', 1
EXEC dbo.asi_DocumentDelete '510ed115-4c80-4a24-8280-d6c05d2b283c', 1
EXEC dbo.asi_DocumentDelete '1e917ae2-3542-4fe8-acf2-1435bef25fd1', 1
EXEC dbo.asi_DocumentDelete '94d28e97-4d43-4a3b-9ede-ffe6da8bdbea', 1
EXEC dbo.asi_DocumentDelete '1eb3d5ff-04f6-413d-bba2-6081bcb539ca', 1
EXEC dbo.asi_DocumentDelete '66def935-0c90-4a60-a655-7bffd9fab19e', 1
EXEC dbo.asi_DocumentDelete 'fa888532-9c12-4e72-83c0-83855c038aab', 1
EXEC dbo.asi_DocumentDelete '09dd37a4-d7ac-417c-b733-65091f5f8606', 1
EXEC dbo.asi_DocumentDelete '67e892db-2865-4052-9b3c-5717a75680a0', 1
EXEC dbo.asi_DocumentDelete '04ca52f6-e69c-4282-8e0b-1c6f9f838372', 1
EXEC dbo.asi_DocumentDelete '25eeb3ea-3e14-41bb-af98-a8cfdf835363', 1
EXEC dbo.asi_DocumentDelete '640b733a-cdac-43fb-82fe-d50922d1a9d5', 1
EXEC dbo.asi_DocumentDelete '760cefda-1c73-47c1-b25c-c9572d5d824a', 1
EXEC dbo.asi_DocumentDelete '680dedf6-7264-496a-ac30-3cfa66bd3db8', 1
EXEC dbo.asi_DocumentDelete 'af0de63e-c38c-45f4-8c40-c363eb4e0088', 1
EXEC dbo.asi_DocumentDelete 'bf6a17ad-c9fb-4648-aaf7-d09163b05ac6', 1
EXEC dbo.asi_DocumentDelete '85f5bf5b-037e-45db-b57a-831559756248', 1
EXEC dbo.asi_DocumentDelete '3296914e-8c95-4b47-aa66-2ed552638f77', 1
EXEC dbo.asi_DocumentDelete 'a90d0341-3e2f-4f28-b1f4-f60ca5d023f1', 1
EXEC dbo.asi_DocumentDelete 'ce0590f4-5770-4a10-a607-7262ad62c6ff', 1
EXEC dbo.asi_DocumentDelete '7b02259e-0155-4169-a80f-ac9fe2b9c329', 1
EXEC dbo.asi_DocumentDelete '100b22ef-d69d-4993-81cc-9fb46df3a301', 1
EXEC dbo.asi_DocumentDelete '93f91e8f-a4a0-491e-b6df-9455ca52fbe6', 1
EXEC dbo.asi_DocumentDelete '78d40496-e62c-4b80-b050-c68295189c60', 1
EXEC dbo.asi_DocumentDelete '91f64a10-ea77-4002-acf7-37ff4395ec19', 1
EXEC dbo.asi_DocumentDelete '81ebfbae-2703-40bc-852c-81dc29d1692a', 1
EXEC dbo.asi_DocumentDelete '56432670-ba5e-4e84-8462-14c07858abdd', 1
EXEC dbo.asi_DocumentDelete '17ad0e7b-207c-47e9-844b-2351bafb9b87', 1
EXEC dbo.asi_DocumentDelete '46d42a9b-328a-4331-b051-838463acd2e6', 1
EXEC dbo.asi_DocumentDelete '58194292-8647-4d26-9ba4-f36acb703572', 1
EXEC dbo.asi_DocumentDelete '12774924-18a3-428a-9cb0-223da6247714', 1
EXEC dbo.asi_DocumentDelete '0f3a2c92-64d5-4c33-8c8c-763a7c58576b', 1
EXEC dbo.asi_DocumentDelete '1ff18419-e468-4ca9-b5f9-d6136aa22379', 1
GO

-- Delete all GroupMember & GroupMemberDetail rows for Institute Groups EXCEPT primary Contact
DECLARE @members TABLE (GroupMemberKey uniqueidentifier)
INSERT INTO @members
SELECT DISTINCT(m.GroupMemberKey)
  FROM [dbo].[Institute] i
       INNER JOIN [dbo].[GroupMain] g ON i.[InstituteGroupKey] = g.[GroupKey]
       INNER JOIN [dbo].[GroupMember] m ON g.[GroupKey] = m.[GroupKey]
       INNER JOIN [dbo].[GroupMemberDetail] d ON m.[GroupMemberKey] = d.[GroupMemberKey]
       INNER JOIN [dbo].[GroupRoleRef] r ON d.[GroupRoleKey] = r.[GroupRoleKey]
 WHERE r.[GroupRoleName] <> 'Primary Contact'

DELETE gmd
  FROM @members m
       INNER JOIN [dbo].[GroupMemberDetail] gmd ON m.[GroupMemberKey] = gmd.[GroupMemberKey]
DELETE gm
  FROM @members m
       INNER JOIN [dbo].[GroupMember] gm ON m.[GroupMemberKey] = gm.[GroupMemberKey]
GO

IF EXISTS (SELECT c.AccessKey FROM ContactMain c
           INNER JOIN AccessMain am ON c.AccessKey = am.AccessKey
           LEFT OUTER JOIN AccessArea aa ON c.AccessKey = aa.ProtectedAccessKey
           WHERE aa.ProtectedAccessKey IS NULL)
BEGIN
    -- Update all Contact Access Keys to use Shared "Everyone Full Control" & delete all local ACLs for Contacts
    IF OBJECT_ID('tempdb..#accessKeys') IS NOT NULL DROP TABLE #accessKeys;
    CREATE TABLE #accessKeys (AccessKey uniqueidentifier NOT NULL)
    -- Get the list of AccessKeys to update
    INSERT INTO #accessKeys (AccessKey)
        SELECT DISTINCT c.AccessKey
          FROM ContactMain c
               INNER JOIN AccessMain am ON c.AccessKey = am.AccessKey
               LEFT OUTER JOIN AccessArea aa ON c.AccessKey = aa.ProtectedAccessKey
        WHERE aa.ProtectedAccessKey IS NULL 
    ALTER TABLE #accessKeys ADD CONSTRAINT PK_accessKeys PRIMARY KEY (AccessKey);    
    -- Update all access keys in ContactMain to be "Everyone Full Control"
    UPDATE c
       SET [AccessKey] = '00000000-0000-0000-0000-000000000E1F'
      FROM [dbo].[ContactMain] c
           INNER JOIN #accessKeys k ON c.AccessKey = k.AccessKey
    -- Now clean up the access item and access main rows that are no longer needed
    DELETE ai
      FROM [dbo].[AccessItem] ai
           INNER JOIN #accessKeys k ON ai.AccessKey = k.AccessKey
    DELETE am
      FROM [dbo].[AccessMain] am
           INNER JOIN #accessKeys k ON am.AccessKey = k.AccessKey
    IF OBJECT_ID('tempdb..#accessKeys') IS NOT NULL DROP TABLE #accessKeys;
END
GO       

-- Update all company groups to have an AccessKey of EverybodyRead & delete all local ACLs for those Groups
IF EXISTS (SELECT 1 FROM [dbo].[Institute] i
           INNER JOIN [dbo].[GroupMain] g ON i.[InstituteGroupKey] = g.[GroupKey]
           INNER JOIN AccessMain am ON g.AccessKey = am.AccessKey
           LEFT OUTER JOIN AccessArea aa ON g.AccessKey = aa.ProtectedAccessKey
           WHERE aa.ProtectedAccessKey IS NULL
          )
BEGIN
    IF OBJECT_ID('tempdb..#accessKeys') IS NOT NULL DROP TABLE #accessKeys;
    CREATE TABLE #accessKeys (AccessKey uniqueidentifier NOT NULL)
    INSERT INTO #accessKeys
        SELECT DISTINCT(g.AccessKey)
          FROM [dbo].[Institute] i
               INNER JOIN [dbo].[GroupMain] g ON i.[InstituteGroupKey] = g.[GroupKey]
               INNER JOIN AccessMain am ON g.AccessKey = am.AccessKey
               LEFT OUTER JOIN AccessArea aa ON g.AccessKey = aa.ProtectedAccessKey
        WHERE aa.ProtectedAccessKey IS NULL
    ALTER TABLE #accessKeys ADD CONSTRAINT PK_accessKeys PRIMARY KEY (AccessKey);    

    -- Update all access keys in GroupMain to be "Everyone Read"
    UPDATE g
       SET [AccessKey] = '00000000-0000-0000-0000-000000000E02'
      FROM [dbo].[GroupMain] g
           INNER JOIN #accessKeys k ON g.AccessKey = k.AccessKey
    -- Now clean up the access item and access main rows that are no longer needed
    DELETE ai
      FROM [dbo].[AccessItem] ai
           INNER JOIN #accessKeys k ON ai.AccessKey = k.AccessKey
    DELETE am
      FROM [dbo].[AccessMain] am
           INNER JOIN #accessKeys k ON am.AccessKey = k.AccessKey
    IF OBJECT_ID('tempdb..#accessKeys') IS NOT NULL DROP TABLE #accessKeys;
END
GO       

--Drop vSoaCashInvoiceLine view
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vSoaCashInvoiceLine')
BEGIN
    DROP VIEW [dbo].[vSoaCashInvoiceLine]
END
GO

----------------------------------------------------------------------------------
-- Remove two tables no longer used                                             --
----------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'RuleSourceDesign')
BEGIN
      DROP TABLE [dbo].[RuleSourceDesign]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'RuleSourcePublish')
BEGIN
      DROP TABLE [dbo].[RuleSourcePublish]
END

----------------------------------------------------------------------------------
-- Remove stored procedures that use deleted tables                             --
----------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_GetDesignRuleSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_GetDesignRuleSource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_PurgePanelEditorSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_PurgePanelEditorSource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_RemoveRuleSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_RemoveRuleSource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_UpdateDesignRuleSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_UpdateDesignRuleSource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_GetPublishedRuleSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_GetPublishedRuleSource]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_UpdatePublishedRuleDebugMode')
BEGIN
      DROP PROCEDURE [dbo].[asi_UpdatePublishedRuleDebugMode]
END
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'asi_UpdatePublishedRuleSource')
BEGIN
      DROP PROCEDURE [dbo].[asi_UpdatePublishedRuleSource]
END
GO

-------------------------------------------------------------------
-- Remove ISABETA license restriction for Fundraising Query Folder
-------------------------------------------------------------------
DELETE FROM [dbo].[UniformLicense] WHERE UniformKey='29662E23-67CF-4FF9-9A3E-82A15C9FB90B'
GO

-------------------------------------------------------------------
-- Remove deprecated Communities Help navigation item and related Break navigation item from MBR site
-------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '14699082-4781-4CE5-8136-65F9B1A821F5', 1
EXEC dbo.asi_DocumentDelete '9D09344B-0732-4E4F-BA2B-884517892713', 1
GO

-- Delete obsolete/unused content items
EXEC dbo.asi_DocumentDelete '34c29805-7906-42f7-89af-602683799775', 1
EXEC dbo.asi_DocumentDelete '83d9011f-8b64-4af3-b06e-be7973e5e0de', 1
EXEC dbo.asi_DocumentDelete 'c0cbeba5-ab85-4ae6-801c-3f4ee73d9572', 1
EXEC dbo.asi_DocumentDelete 'f454982e-8c8c-4bab-9204-e95f24d77233', 1
EXEC dbo.asi_DocumentDelete '243cbea5-0732-4c53-a854-0ec819da18bb', 1
EXEC dbo.asi_DocumentDelete '1efe000f-e378-43ad-a406-8be1fd7f2c8f', 1
EXEC dbo.asi_DocumentDelete '23503391-3ced-4830-9cf9-5af12ffc8d54', 1
EXEC dbo.asi_DocumentDelete 'b28c0806-74fb-4d76-9339-bafc4b8f6b5b', 1
EXEC dbo.asi_DocumentDelete 'ca724653-6389-4844-859c-ef8ed5ba1002', 1
EXEC dbo.asi_DocumentDelete 'aa36e1d8-352f-484b-ab1c-7628680da875', 1
EXEC dbo.asi_DocumentDelete 'bd6a91a1-dcdf-4e35-919c-423379a8f4bb', 1
EXEC dbo.asi_DocumentDelete '8cbe79f0-837e-452a-a4e4-311f19d47cff', 1
EXEC dbo.asi_DocumentDelete 'cb8fb752-4f0e-43d4-bc72-347d1aef5e9f', 1
EXEC dbo.asi_DocumentDelete 'b8fb4af7-b273-440b-adb9-3a48e044ae63', 1
EXEC dbo.asi_DocumentDelete '546b91b0-ce8e-4043-975f-48e3f2cad33c', 1
EXEC dbo.asi_DocumentDelete 'b458d8c4-b508-4891-8d27-fea2b079ff17', 1
EXEC dbo.asi_DocumentDelete '162cdae0-57b3-4bb5-85d6-0c517514eef0', 1
EXEC dbo.asi_DocumentDelete 'b11aff22-132f-4c54-abd6-5a15e8213624', 1
EXEC dbo.asi_DocumentDelete '9031d3e6-22b5-442e-8489-61eea1f611f7', 1
EXEC dbo.asi_DocumentDelete '5021f781-0249-48c2-a955-525daaf55e41', 1
EXEC dbo.asi_DocumentDelete '8f62add5-03c0-4822-bf38-c7f6665dbed8', 1
EXEC dbo.asi_DocumentDelete '10bad49b-2a59-4b5e-85b3-9a0ebcdc355e', 1
EXEC dbo.asi_DocumentDelete '6c82509f-50ae-4788-a2a5-84dfeef9b785', 1
EXEC dbo.asi_DocumentDelete '652dad35-bd0b-4fb9-96df-b3e4a0e8ed29', 1
EXEC dbo.asi_DocumentDelete '97ae73a4-5a38-432a-a7e6-ea2b5d8801af', 1
EXEC dbo.asi_DocumentDelete '9aae17ea-b824-4e1d-b24c-b7bebec4d7fa', 1
EXEC dbo.asi_DocumentDelete 'd7ce9e44-8709-43e5-90a3-f1a4036d7dfc', 1
EXEC dbo.asi_DocumentDelete '240129b1-5d43-4fc4-a113-f7c1f2b253be', 1
EXEC dbo.asi_DocumentDelete '851cebe0-00b5-4c6d-84b9-25eb708add63', 1
EXEC dbo.asi_DocumentDelete '8e9b0e64-17e5-4053-b190-b4ae102a83b2', 1
EXEC dbo.asi_DocumentDelete 'e0e62929-0fb2-4bfc-94bb-62cfcf97dd82', 1
EXEC dbo.asi_DocumentDelete 'c7c1aaac-1a36-44f2-8745-0b554c064227', 1
EXEC dbo.asi_DocumentDelete 'b2b72b4d-8e12-4eee-bf0f-5c48ca6d56c1', 1
EXEC dbo.asi_DocumentDelete 'babda231-30ee-493a-8b80-40ea5ef4ded0', 1
EXEC dbo.asi_DocumentDelete 'f386ef48-b699-409f-adbe-51317a10b790', 1
EXEC dbo.asi_DocumentDelete 'faeee586-b877-45c1-94a8-e5eb1548fab3', 1
EXEC dbo.asi_DocumentDelete '3b013c71-c22c-478f-a214-00f11b93a04b', 1
EXEC dbo.asi_DocumentDelete 'e82690df-e51d-4801-a34b-7a6bb29d3454', 1
EXEC dbo.asi_DocumentDelete '9af35cf0-c8f5-473b-936a-adf7db75e60a', 1
EXEC dbo.asi_DocumentDelete '0125af2d-cc0f-4fab-8c21-f373791e0016', 1
EXEC dbo.asi_DocumentDelete '1968c0b0-d48b-487d-9f58-6c9fee236d98', 1
EXEC dbo.asi_DocumentDelete '818bcd97-6190-4c27-9c17-fc760fa4ad45', 1
EXEC dbo.asi_DocumentDelete 'f29ab595-a9a4-496b-8338-4f0f0b3d7f5d', 1
EXEC dbo.asi_DocumentDelete 'aca769a9-abe0-4dfb-9498-b10f5eb85301', 1
EXEC dbo.asi_DocumentDelete '7e5599ef-8cff-4ce7-8ae3-582fab26381e', 1
EXEC dbo.asi_DocumentDelete '10614b66-30a6-46fc-93ca-4e9d85d7886b', 1
EXEC dbo.asi_DocumentDelete '7e1cc228-05fa-4182-90cc-6fec64976eb3', 1
EXEC dbo.asi_DocumentDelete '5f3db079-8808-4cc8-9fa0-3a577a25eb82', 1
EXEC dbo.asi_DocumentDelete '4c31e98f-d5b7-480c-8919-035066c7d048', 1
EXEC dbo.asi_DocumentDelete '321506ae-a73c-41d8-98fe-7eb4975dc97f', 1
EXEC dbo.asi_DocumentDelete '36457e53-39dd-4447-8c1e-294d9d16f0a2', 1
EXEC dbo.asi_DocumentDelete '596bfde2-c5b2-47e8-a4f4-0c287bba495d', 1
EXEC dbo.asi_DocumentDelete '36a0990e-8d2f-4825-a5f3-3cbc749e267a', 1
EXEC dbo.asi_DocumentDelete '8aec5dbd-309f-44b7-a7d3-5f89e8b19191', 1
EXEC dbo.asi_DocumentDelete '44fcbb2f-a015-4db7-a9c8-0447ed52f93a', 1
EXEC dbo.asi_DocumentDelete '63c9012f-bf63-46a6-8c2b-dbb5a58abd87', 1
EXEC dbo.asi_DocumentDelete '0752feef-7b62-4b28-9865-f2d5fe1234fd', 1
EXEC dbo.asi_DocumentDelete '96cad02e-1937-4d17-9a0c-c1957941208e', 1
EXEC dbo.asi_DocumentDelete 'bfa8ae5f-a480-44ab-ab94-403cd9b5a0de', 1
EXEC dbo.asi_DocumentDelete '11c4eaad-4b1d-4361-822a-9f20716bf425', 1
EXEC dbo.asi_DocumentDelete '2939efe6-4a4c-4a6f-aee9-c296e95da358', 1
EXEC dbo.asi_DocumentDelete '0db1f48e-3450-4960-822b-d1c4b768e502', 1
EXEC dbo.asi_DocumentDelete '4a468502-e1c6-4ef6-9558-f42fcfe38ad3', 1
EXEC dbo.asi_DocumentDelete '7ec4ef9e-4a88-46bb-8f44-7639ef57f9cc', 1
EXEC dbo.asi_DocumentDelete '7a885804-e726-46da-8ec3-75bc8254aed4', 1
EXEC dbo.asi_DocumentDelete '5b3b93ef-30dd-4e88-832c-6b68f92142c6', 1
EXEC dbo.asi_DocumentDelete 'ab71fcd4-9b7c-44e7-848f-30cf9e5ad32a', 1
EXEC dbo.asi_DocumentDelete '6b4198ad-694e-40ab-8b3b-aed37bc79313', 1
EXEC dbo.asi_DocumentDelete 'd7b438b5-bf21-4b43-a440-c35d8a9721d7', 1
EXEC dbo.asi_DocumentDelete '93275e52-8bbb-4241-b99c-0c6ebbde45f5', 1
EXEC dbo.asi_DocumentDelete '0b41d087-53bc-43d5-9156-021974151901', 1
EXEC dbo.asi_DocumentDelete 'd89d98f1-b24e-4453-8b2e-40176e92e1b2', 1
EXEC dbo.asi_DocumentDelete '4f8a6be2-6903-423f-a285-69fba6a0dea2', 1
EXEC dbo.asi_DocumentDelete '6ae70623-bc88-4079-a191-5cbedbdd616d', 1
EXEC dbo.asi_DocumentDelete 'c66e39f2-70a1-48ee-b25f-47e6f693cd8d', 1
EXEC dbo.asi_DocumentDelete '624d87a5-a5ee-40af-8131-596c1617e956', 1
EXEC dbo.asi_DocumentDelete '268ce8c7-f089-4ef5-a47e-05ec156a8cb0', 1
EXEC dbo.asi_DocumentDelete 'dde5c680-dae8-401c-a846-ba97292d4217', 1
EXEC dbo.asi_DocumentDelete '31477a15-6646-46ef-9656-574ce107a062', 1
EXEC dbo.asi_DocumentDelete '82666539-862c-45b5-b960-4c7c5a307fc3', 1
EXEC dbo.asi_DocumentDelete '254eaa03-ccc9-46b6-9792-8bc8fef5a5ad', 1
EXEC dbo.asi_DocumentDelete '187f5456-344b-4595-9b2e-96209067f26a', 1
EXEC dbo.asi_DocumentDelete 'e3dc5d86-9fd4-4fa8-aa2c-fe6bef41368d', 1
EXEC dbo.asi_DocumentDelete '44275680-e7d4-4bbd-9c37-61412d047b58', 1
EXEC dbo.asi_DocumentDelete '713ecf27-dbae-47c4-a9c1-2f90bc037da1', 1
EXEC dbo.asi_DocumentDelete 'e1169334-8e57-48c7-9fcb-16f2d17684ba', 1
EXEC dbo.asi_DocumentDelete 'e97ce631-9e1f-40e7-8121-38c0c637e21b', 1
EXEC dbo.asi_DocumentDelete '3ed058f1-a363-4e46-a8e5-85e3b7f6a8a5', 1
EXEC dbo.asi_DocumentDelete 'f47fbf19-e68e-4e82-be70-e2dabca68dbd', 1
EXEC dbo.asi_DocumentDelete '4d93b281-b8f8-4185-94cf-475ebaa7e86d', 1
EXEC dbo.asi_DocumentDelete '92b18b45-c7d0-4434-b1c1-09cc7db32363', 1
EXEC dbo.asi_DocumentDelete 'b6f60b1f-01a0-486f-94d3-40f6262100d6', 1
EXEC dbo.asi_DocumentDelete '9be822b3-82bf-4578-99f9-22e13726aa66', 1
EXEC dbo.asi_DocumentDelete '4816a78f-36d7-45e3-817c-9af5ac948788', 1
EXEC dbo.asi_DocumentDelete 'ac9571b4-0d29-498b-96fd-0ea5320eefc2', 1
EXEC dbo.asi_DocumentDelete 'b0819140-dfa6-498d-8bcc-48d3cf6ebae5', 1
EXEC dbo.asi_DocumentDelete '1b09822b-4302-440a-af2d-f6218f2f46b4', 1
EXEC dbo.asi_DocumentDelete '070099da-a8ea-431a-b0f9-7700164e561f', 1
EXEC dbo.asi_DocumentDelete '333ccbd3-6d7d-4fbd-bc71-3e61a5f097f8', 1
EXEC dbo.asi_DocumentDelete 'caf17281-8b5b-49b5-ba95-4cfeb6930f04', 1
EXEC dbo.asi_DocumentDelete '39cedbaf-b074-4003-9702-90a815c98d65', 1
EXEC dbo.asi_DocumentDelete 'c4f817ff-56e8-4421-a046-bc51a81e8b9d', 1
EXEC dbo.asi_DocumentDelete '3a139f56-da87-4c5d-b7a6-94b66dc23189', 1
EXEC dbo.asi_DocumentDelete '80f00153-20eb-4074-ae26-f716807493d4', 1
EXEC dbo.asi_DocumentDelete '1eb4910d-d8bd-47d3-b3fe-916e6c7e622b', 1
EXEC dbo.asi_DocumentDelete 'a661eb07-5ef9-46b4-b01f-50d08ed99a7b', 1
EXEC dbo.asi_DocumentDelete '99426157-14ca-48d7-9552-51f2e21c41aa', 1
EXEC dbo.asi_DocumentDelete '8bc32eff-0e19-476a-9428-434638b15615', 1
EXEC dbo.asi_DocumentDelete '29b986ce-0837-4ff7-b9f7-1bc5182cfd31', 1
EXEC dbo.asi_DocumentDelete '2d644c2f-f32e-48e6-8d38-2c14996c0a25', 1
EXEC dbo.asi_DocumentDelete '1f34b92f-22d5-457a-bbbd-2537585c9b4a', 1
EXEC dbo.asi_DocumentDelete 'd35eb29c-c748-4062-81fd-54965f217df4', 1
EXEC dbo.asi_DocumentDelete 'e80ef851-ac04-4363-88b2-d152b9a44e8d', 1
EXEC dbo.asi_DocumentDelete 'd9b7d011-f421-4523-8742-0155d51f94c0', 1
EXEC dbo.asi_DocumentDelete '9416a9ba-3672-4b32-a846-0f31f8e861fb', 1
EXEC dbo.asi_DocumentDelete 'bae1faf9-23a0-4361-b43c-b1c0561cea75', 1
EXEC dbo.asi_DocumentDelete 'e44558f5-f0a2-4c1e-a81d-9831a1150730', 1
EXEC dbo.asi_DocumentDelete '8fd369b1-04a1-4376-8531-6330112c87d4', 1
EXEC dbo.asi_DocumentDelete 'b0b1f7af-1f34-4217-85b4-bfa94f627b5d', 1
EXEC dbo.asi_DocumentDelete 'c6aa1512-db1b-4c6a-ab20-bbd251236bb1', 1
EXEC dbo.asi_DocumentDelete '9814a497-647e-4213-8a07-b6fd9379c141', 1
EXEC dbo.asi_DocumentDelete '10c499ac-f421-4199-83c6-0ceee687e7e6', 1
EXEC dbo.asi_DocumentDelete '7b184803-969a-4511-bb33-0e6835f6c559', 1
EXEC dbo.asi_DocumentDelete '18d67597-a285-4362-9310-2ef5a44f149d', 1
EXEC dbo.asi_DocumentDelete '786c4fb3-7336-49a2-9469-39e4bb768cbb', 1
EXEC dbo.asi_DocumentDelete 'fe7ba83e-286c-4664-8d3d-e642718c58d0', 1
EXEC dbo.asi_DocumentDelete '33740772-9ee7-406f-bd0b-f42cda07c30d', 1
EXEC dbo.asi_DocumentDelete 'c83bb2cf-d777-4715-b6a1-16a8fa72c7e7', 1
EXEC dbo.asi_DocumentDelete '4ee6379f-ca80-4432-94ab-ffdf8b04bde6', 1
EXEC dbo.asi_DocumentDelete 'e4db94aa-e3f6-4f81-b86f-1bb674361198', 1
EXEC dbo.asi_DocumentDelete '3fea1721-be80-42d4-9910-c22bff488c92', 1
EXEC dbo.asi_DocumentDelete 'd44e60ac-ae28-4308-ac9d-bd0de65a1a4e', 1
EXEC dbo.asi_DocumentDelete 'd58f7db9-2281-45bb-91d8-2e11f3f4ff05', 1
EXEC dbo.asi_DocumentDelete '3b5c191b-6166-43fa-a59e-cc218f72ad6f', 1
EXEC dbo.asi_DocumentDelete '24ff086e-aa70-41a3-8d44-0be0ea3378d2', 1
EXEC dbo.asi_DocumentDelete '52e3c747-581e-4b7d-a262-915414312fe3', 1
EXEC dbo.asi_DocumentDelete 'f6f1a229-75ef-464e-9a72-3212dc4543cc', 1
EXEC dbo.asi_DocumentDelete 'fc3d5a75-e39a-45d3-becb-30edb6d4e250', 1
EXEC dbo.asi_DocumentDelete 'dd9d1971-ad38-48fe-99d4-f410f9a9bdd2', 1
EXEC dbo.asi_DocumentDelete '4d77c289-1c90-4a2c-87c2-68d529b4b4dc', 1
EXEC dbo.asi_DocumentDelete '63a5cc1d-d866-4131-ab0f-a6a367541d2f', 1
EXEC dbo.asi_DocumentDelete '2d203e35-bbe6-4fe1-ba03-3d2f56abcf8e', 1
EXEC dbo.asi_DocumentDelete '5361461a-ba1e-40ac-bdbc-8253150ed998', 1
EXEC dbo.asi_DocumentDelete '09508c84-161f-40a2-9010-aa8ceeb58ccc', 1
EXEC dbo.asi_DocumentDelete '724f0ae7-0136-42ba-b7a2-f37173f806f4', 1
EXEC dbo.asi_DocumentDelete '7c3b4b88-d21b-4d8c-ab67-5ca2a002cce8', 1
EXEC dbo.asi_DocumentDelete '5198e5f0-a706-444d-91d5-0a4ed331c8e1', 1
EXEC dbo.asi_DocumentDelete '46a01b78-453a-4a14-88bb-6687d8ad64f5', 1
EXEC dbo.asi_DocumentDelete 'c6d7ebfb-8d29-4be7-9df9-d2b3d0a84bcc', 1
EXEC dbo.asi_DocumentDelete '1db6d682-ebb5-4e8e-a60b-c6edee4f6041', 1
EXEC dbo.asi_DocumentDelete '543cf2fe-5caf-41a6-ad65-68a246c5f243', 1
EXEC dbo.asi_DocumentDelete '28f7e607-c40e-45c3-8f8b-c7c4e1f0d2e0', 1
EXEC dbo.asi_DocumentDelete '31721435-02e9-4f09-a49f-a6889fce6084', 1
EXEC dbo.asi_DocumentDelete '8b1d121c-f0a0-49d1-a500-3c6b0263d108', 1
EXEC dbo.asi_DocumentDelete '6c0239b7-1013-4480-88ad-313d89ef7b42', 1
EXEC dbo.asi_DocumentDelete '000eef13-5498-4d32-8a14-5df66a9bc520', 1
EXEC dbo.asi_DocumentDelete '24293911-84aa-45f5-8531-8a65e6fa48d6', 1
EXEC dbo.asi_DocumentDelete '38d889ea-4bd2-4640-ba65-8a11746c1fb3', 1
EXEC dbo.asi_DocumentDelete '6e36cace-cab5-4940-bf36-dafe9d2923e8', 1
EXEC dbo.asi_DocumentDelete 'de4266ac-5993-4ea1-92c8-dcad88d67cca', 1
EXEC dbo.asi_DocumentDelete '701eef59-6fcb-483e-b803-0feb6327f93c', 1
EXEC dbo.asi_DocumentDelete '4c9702bc-966e-4d0d-af61-e5bce2a22a0f', 1
EXEC dbo.asi_DocumentDelete 'b2092c9e-e691-4a4f-bf32-e4bc3bb6e7e6', 1
EXEC dbo.asi_DocumentDelete '2f8b4e36-9308-4262-b90d-a4a5719b6fd0', 1
EXEC dbo.asi_DocumentDelete '95a852e5-55b6-43ef-aaf5-d150e733d229', 1
EXEC dbo.asi_DocumentDelete 'c7fc9d90-c320-46cd-95ff-0312b8fa2fa0', 1
EXEC dbo.asi_DocumentDelete 'f4b1023a-cb5b-4dee-90d9-7559ac4a6a6d', 1
EXEC dbo.asi_DocumentDelete 'cbe667aa-dda5-4d12-98f5-c75fd99586b1', 1
EXEC dbo.asi_DocumentDelete '48e07745-a1c3-4ea7-a453-7b085b19f8ee', 1
EXEC dbo.asi_DocumentDelete 'f58bae14-759d-44a2-b377-dfd0b5f4e70e', 1
EXEC dbo.asi_DocumentDelete 'f86a139b-635e-4cb6-a757-859141a1ffb0', 1
EXEC dbo.asi_DocumentDelete 'd161cf6c-383b-45f9-bf26-98e007bcc7e6', 1
EXEC dbo.asi_DocumentDelete '9fc7040c-bd98-44cd-be28-b5bfba5a9869', 1
EXEC dbo.asi_DocumentDelete 'ff4293bd-7ec7-4f7d-ad67-3ddf8d275792', 1
EXEC dbo.asi_DocumentDelete '24f0a99d-bd00-481c-9154-bb2b74a4486b', 1
EXEC dbo.asi_DocumentDelete 'cb4d41f5-407a-4226-b490-e3b6cea18c27', 1
EXEC dbo.asi_DocumentDelete '45030dff-ddf1-4cf2-a1e5-1e6e60d4e93b', 1
EXEC dbo.asi_DocumentDelete 'bcc4ef9d-cba2-4ada-a687-7d202931746c', 1
EXEC dbo.asi_DocumentDelete '92051856-60cb-47e6-827e-16f7c6389606', 1
EXEC dbo.asi_DocumentDelete 'a04c2267-ea31-4f98-873a-3b67aa20901c', 1
EXEC dbo.asi_DocumentDelete 'c27d2f82-b051-49bf-be5a-f2a84f80316d', 1
EXEC dbo.asi_DocumentDelete 'ee7f8bdb-4c6b-4925-b60b-6c19fa601d3f', 1
EXEC dbo.asi_DocumentDelete '222a7a4c-9df2-4293-b6aa-0e6058fb7fd9', 1
EXEC dbo.asi_DocumentDelete 'b5c8c41d-22be-4a82-b0bc-fac51a6a4adc', 1
EXEC dbo.asi_DocumentDelete '0b414720-8c9e-42b9-832e-adffefaee566', 1
EXEC dbo.asi_DocumentDelete 'e6ff99ca-327a-47d8-92ff-5d5fe9d7049a', 1
EXEC dbo.asi_DocumentDelete '52556bdd-929b-4096-8664-0c651052e28b', 1
EXEC dbo.asi_DocumentDelete '08a64e34-2661-49bb-8363-bba63f778e97', 1
EXEC dbo.asi_DocumentDelete 'a16bd772-1225-4638-8fce-c91e5407f336', 1
EXEC dbo.asi_DocumentDelete 'a4a69d2b-0505-4a8d-8359-c773a8311e10', 1
EXEC dbo.asi_DocumentDelete '3de00649-4df4-47ac-80c2-a1b1fe6679d4', 1
EXEC dbo.asi_DocumentDelete 'dcb673c4-d1e9-48f3-b701-9efbfb23af1a', 1
EXEC dbo.asi_DocumentDelete '446f5650-3979-4436-bcfc-9598f18dc892', 1
EXEC dbo.asi_DocumentDelete '6836a08e-e068-4497-82f6-8a6171c2e3b9', 1
GO    

EXEC dbo.asi_DocumentDelete '83d46306-f713-4ddf-8c05-245358aeb1a6', 1
EXEC dbo.asi_DocumentDelete 'd77a89ee-a85d-4511-ab14-1bb4a4509c7f', 1
EXEC dbo.asi_DocumentDelete 'ef6c5cef-d6b2-4259-882f-1d7321c7132a', 1
EXEC dbo.asi_DocumentDelete '44444278-affd-441f-a386-a76c62f3a72e', 1
EXEC dbo.asi_DocumentDelete '2022e739-67df-435b-a89c-3fa04dba6889', 1
EXEC dbo.asi_DocumentDelete '9ef0b8c1-79cf-41d4-8ec8-e9efb3e72ffb', 1
EXEC dbo.asi_DocumentDelete 'c8c5ae3d-3cc7-4e4d-b8f7-b99ad9cf7d2e', 1
EXEC dbo.asi_DocumentDelete '57e51075-f3d1-43b7-bac5-1aea7e9bc867', 1
EXEC dbo.asi_DocumentDelete 'f8cc27ad-1f22-4927-9401-78f5ea30aae1', 1
EXEC dbo.asi_DocumentDelete '63d51373-dd18-4645-9c6e-74ddf23f84cc', 1
EXEC dbo.asi_DocumentDelete '429ec40e-4663-4be4-ac41-3b0ea3ce6ea6', 1
EXEC dbo.asi_DocumentDelete '828bcf90-c6b5-49b8-b3a3-075c237c33d9', 1
EXEC dbo.asi_DocumentDelete '17f7091a-9d42-43d3-9028-8a02d2ae2c8c', 1
EXEC dbo.asi_DocumentDelete '564ddf74-4bec-4b2d-bbcc-163de466c7a8', 1
EXEC dbo.asi_DocumentDelete 'd052f53e-edfd-464b-92f8-33bd3549d37a', 1
EXEC dbo.asi_DocumentDelete '88216a41-7e64-4036-98fd-4d1f7b14c140', 1
EXEC dbo.asi_DocumentDelete '3843dfe5-a74b-4c7a-961a-e9608651e0b7', 1
EXEC dbo.asi_DocumentDelete 'f6530d4f-7c29-4a98-9c97-c5e2389a4e69', 1
EXEC dbo.asi_DocumentDelete '5f786c19-0cea-43f6-bd90-e9f4ddf9742b', 1
EXEC dbo.asi_DocumentDelete '84483660-0a2e-4f3f-9192-01753a608f64', 1
EXEC dbo.asi_DocumentDelete '020601b7-f3ad-4d6c-9f74-06e236cd5e8c', 1
EXEC dbo.asi_DocumentDelete '8d6df8bb-74b4-4485-b911-c3cf3a8df85d', 1
EXEC dbo.asi_DocumentDelete 'e0a006f6-28cc-4e56-9f91-a5db644af1c2', 1
EXEC dbo.asi_DocumentDelete '44082672-91d4-41cf-8fd8-15095a19c422', 1
EXEC dbo.asi_DocumentDelete '52fcd449-dcdd-4c57-9ba0-fd0fff74152e', 1
EXEC dbo.asi_DocumentDelete 'b51322df-e3fd-4a97-ad71-3f0c1d89f84c', 1
EXEC dbo.asi_DocumentDelete '99a261e3-f831-4e4b-b29e-32226aa1e395', 1
EXEC dbo.asi_DocumentDelete 'ad8c0413-524c-47d2-8f8e-e59c65c6113e', 1
EXEC dbo.asi_DocumentDelete '66f506b2-5139-4ca2-a255-5648452215a0', 1
EXEC dbo.asi_DocumentDelete '38fbcb1e-b2cb-4004-ad9f-77c65b46d3b3', 1
EXEC dbo.asi_DocumentDelete 'b3ff0996-a03d-4b25-8c07-d7a6dbb25fb0', 1
EXEC dbo.asi_DocumentDelete '977fa4f5-1ed6-4381-9a5b-77620d02fea7', 1
EXEC dbo.asi_DocumentDelete '69a5d057-0977-4678-9e43-fac10173a59e', 1
EXEC dbo.asi_DocumentDelete '47361561-25bb-4065-9ffb-e665a82db23c', 1
EXEC dbo.asi_DocumentDelete 'e85cdd05-8e57-496e-bc9e-6cd08a3b6868', 1
EXEC dbo.asi_DocumentDelete '7bba024e-ebf6-4725-9b23-5ea1cd4b4e4f', 1
EXEC dbo.asi_DocumentDelete '4450c775-37f5-4298-bd3a-ab1bf4b49ab9', 1
EXEC dbo.asi_DocumentDelete 'ef80b124-b876-418e-b32c-60c327f97307', 1
EXEC dbo.asi_DocumentDelete '064fdd18-f5aa-4796-8404-594eefa20e71', 1
EXEC dbo.asi_DocumentDelete 'd24c4fc7-ff88-484e-9672-247fb9762077', 1
EXEC dbo.asi_DocumentDelete '3c60434a-c4b7-45c8-8f7d-12edd82435ab', 1
EXEC dbo.asi_DocumentDelete '87f79d29-e8db-4087-95b8-2040883267ec', 1
EXEC dbo.asi_DocumentDelete 'deb091c2-ee59-4ee7-a8be-739a07ccfc03', 1
EXEC dbo.asi_DocumentDelete '84848c03-cea6-4b2d-863c-35345d6fe710', 1
EXEC dbo.asi_DocumentDelete 'f3cf7b0c-54ff-4b10-b02a-04cba903c1ff', 1
EXEC dbo.asi_DocumentDelete 'd9b9b1fc-b590-4114-aa3e-f9c5ed1a6815', 1
EXEC dbo.asi_DocumentDelete 'a86ebca7-fe0c-4ffc-a397-47a369f69cd9', 1
EXEC dbo.asi_DocumentDelete 'd2b97a39-6436-4946-809f-3233d576fba2', 1
EXEC dbo.asi_DocumentDelete 'c7d1334c-e689-4dd9-a0c8-3cd311539d40', 1
EXEC dbo.asi_DocumentDelete 'af892695-db9c-4f40-a0ea-ba6a35be5129', 1
EXEC dbo.asi_DocumentDelete '71e1c23a-2b59-4cf2-86a7-9a1c94ed3890', 1
GO

EXEC dbo.asi_DocumentDelete 'a3ae9d45-617d-4360-b806-89b223663915', 1
EXEC dbo.asi_DocumentDelete 'ac82b616-ea4e-48cb-b98c-2a4f6dbd717b', 1
EXEC dbo.asi_DocumentDelete '72763646-8fb9-4ebc-8d5f-e03a3c63e14d', 1
EXEC dbo.asi_DocumentDelete '83ce453c-d45e-4373-a6ee-bc1b07c3b92d', 1
EXEC dbo.asi_DocumentDelete '05ce10c1-5a73-4a2a-bab5-e9d02d570e6a', 1
EXEC dbo.asi_DocumentDelete '778faee2-0bd2-48c1-b7f7-18c56c4534fc', 1
EXEC dbo.asi_DocumentDelete '9225c227-be31-401d-8c95-49d7ef49aa45', 1
EXEC dbo.asi_DocumentDelete 'b551105d-80c9-46f1-9225-2cbfb0b4b5cd', 1
EXEC dbo.asi_DocumentDelete '53fb64c9-65da-428b-b310-da2ed4a38faa', 1
EXEC dbo.asi_DocumentDelete '9f6a39d2-25dc-4480-bf05-5cc9c0a09757', 1
EXEC dbo.asi_DocumentDelete 'ac8a75a0-077c-47b2-9bcd-20575d1b5e40', 1
EXEC dbo.asi_DocumentDelete 'c2d7a9f2-f352-496e-8a5f-8287ed6398ef', 1
EXEC dbo.asi_DocumentDelete '12db1478-b252-4f0a-b598-61ba3ede241f', 1
EXEC dbo.asi_DocumentDelete '06ee7f3c-04ee-494f-8718-34543fc03e6c', 1
EXEC dbo.asi_DocumentDelete 'e7ccb600-6e04-49f2-9cad-d7d27f617a74', 1
EXEC dbo.asi_DocumentDelete '120963c8-5dd8-47c7-a7d2-a3ef344c7d0f', 1
EXEC dbo.asi_DocumentDelete 'fc1668a4-f53c-4f69-b2e1-4ee1b1bb5f88', 1
EXEC dbo.asi_DocumentDelete '44d790c6-80ab-4a64-b5b7-1e88f3c265e5', 1
EXEC dbo.asi_DocumentDelete '2e9e19ec-e6d9-41f4-83e8-4b74eb1a3acf', 1
EXEC dbo.asi_DocumentDelete '2a70fcc4-f1ba-472f-b60c-762949d2c3b9', 1
EXEC dbo.asi_DocumentDelete 'ee3d5b5e-a620-4dc6-bd4e-8b4d5c96888e', 1
EXEC dbo.asi_DocumentDelete '82fa6360-9000-4b03-9535-d590f994ed79', 1
EXEC dbo.asi_DocumentDelete 'bf3cb0d7-5365-4248-9dcf-8d58e6a422e3', 1
EXEC dbo.asi_DocumentDelete '8a6f3eda-e3ff-4a61-9cc5-1fc1d653181b', 1
EXEC dbo.asi_DocumentDelete '96461a51-36e4-4b92-88fe-d68c9e097d51', 1
EXEC dbo.asi_DocumentDelete '9ae0eeaf-dd20-4a8d-a7db-008a8e00cf0a', 1
EXEC dbo.asi_DocumentDelete 'ec363b0f-2b45-4a1d-bb7f-675d96db254a', 1
EXEC dbo.asi_DocumentDelete 'debbd4a9-f5a3-45b9-ba00-7924aa625e88', 1
EXEC dbo.asi_DocumentDelete 'c87f772a-3fac-4e92-b038-2e00c41e7a88', 1
EXEC dbo.asi_DocumentDelete '8d763060-4906-4cd0-9697-b71c549d23dc', 1
EXEC dbo.asi_DocumentDelete '321f56f1-d206-46fd-a399-3da4511c6c2e', 1
EXEC dbo.asi_DocumentDelete 'f9697a46-fc5c-476c-b12e-51d34c7e9295', 1
EXEC dbo.asi_DocumentDelete 'e6708955-f7b9-4d85-b7b5-40d106a203ac', 1
GO

EXEC dbo.asi_DocumentDelete '8c318aed-3afc-46fa-8995-398f37d9b282', 1
EXEC dbo.asi_DocumentDelete 'c500556f-5a72-4868-aff4-4ef14cce5701', 1
EXEC dbo.asi_DocumentDelete 'bb5b46ce-150a-4593-a49b-2404cb123717', 1
EXEC dbo.asi_DocumentDelete 'b699bcb5-7b9c-4abe-b883-25956de23b28', 1
EXEC dbo.asi_DocumentDelete '4f41fffd-a5c1-4d99-9798-7d11cd6c1ebf', 1
EXEC dbo.asi_DocumentDelete '0541ba35-2253-445a-821a-0ca12696be7a', 1
EXEC dbo.asi_DocumentDelete 'de7fc2cc-930a-4a6c-bb27-688ffb354c57', 1
EXEC dbo.asi_DocumentDelete 'eff94215-366e-4c10-983f-a0d473e50ad2', 1
EXEC dbo.asi_DocumentDelete '92080c78-9fe1-4943-bb72-dbe066688ef4', 1
EXEC dbo.asi_DocumentDelete 'd71f8068-1bfa-4bba-a471-41716ec94699', 1
EXEC dbo.asi_DocumentDelete '29a8430a-15f2-4d98-b6bb-3b268b6ac85e', 1
EXEC dbo.asi_DocumentDelete 'fe2490cd-7705-4f67-98cd-89eacaa2d1d3', 1
EXEC dbo.asi_DocumentDelete '8e4dedf9-23c6-4325-b36a-67cf46512fe5', 1
EXEC dbo.asi_DocumentDelete '052cf20d-8762-4f7c-b4a9-f54cf990a266', 1
EXEC dbo.asi_DocumentDelete '5120bf87-7cd3-4856-8394-dcc076c3c23f', 1
EXEC dbo.asi_DocumentDelete 'bc297c0a-bedc-40b4-ae0a-ed2f6a51c622', 1
EXEC dbo.asi_DocumentDelete '6fa78005-d0e9-49f8-8fdf-3179affb8d18', 1
EXEC dbo.asi_DocumentDelete '9a923a04-8a68-4c4b-9157-3639d3bbdba2', 1
EXEC dbo.asi_DocumentDelete 'a9a55815-4412-4460-9fcf-db8781ee8ce5', 1
EXEC dbo.asi_DocumentDelete 'db416158-e9ad-4473-96c3-93c14e068a56', 1
EXEC dbo.asi_DocumentDelete 'd04578d0-9735-4019-a046-68e0712869ac', 1
EXEC dbo.asi_DocumentDelete '8ea89456-80b9-4811-8a40-c4b105075039', 1
EXEC dbo.asi_DocumentDelete 'a79503c0-235a-4457-a689-85eaecf26412', 1
EXEC dbo.asi_DocumentDelete '12daafbe-dcbe-4c0b-98c2-5e7a6fd61b3f', 1
EXEC dbo.asi_DocumentDelete '6a4c1589-bc76-4bc2-8ef4-198ea6bc2e47', 1
EXEC dbo.asi_DocumentDelete 'fa633a1c-056f-4c6f-bb33-88d208851deb', 1
EXEC dbo.asi_DocumentDelete '5420be35-7a61-4aa4-80d4-2aca1af329a9', 1
GO


-------------------------------------------------------------------
-- Delete any orphan Name_Indexes rows with an ID of "IBOGuest" - SMR 279846
-------------------------------------------------------------------
DELETE FROM [dbo].[Name_Indexes] WHERE ID='IBOGuest'
GO

-- If any data exists in the TransWatch table, run the old stored procedure
SET NOCOUNT ON
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransWatch]') AND type in (N'U'))
BEGIN
    IF EXISTS (SELECT 1 FROM TransWatch)
    BEGIN
        EXEC dbo.sp_asi_UpdateFundraisingViewTables
    END
END
GO
SET NOCOUNT OFF

-- Drop the trigger on Trans
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Trans_DeleteInsertUpdate]'))
    DROP TRIGGER [dbo].[asi_Trans_DeleteInsertUpdate]
GO
    
-- Drop the TransWatch table
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TransWatch_TransactionNumber]') AND type = 'D')
BEGIN
    ALTER TABLE [dbo].[TransWatch] DROP CONSTRAINT [DF_TransWatch_TransactionNumber]
END
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TransWatch_InvoiceNumber]') AND type = 'D')
BEGIN
    ALTER TABLE [dbo].[TransWatch] DROP CONSTRAINT [DF_TransWatch_InvoiceNumber]
END
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransWatch]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[TransWatch]
END
GO

-- Drop the old stored procedure
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_asi_UpdateFundraisingViewTables]') AND type in (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[sp_asi_UpdateFundraisingViewTables]
END
GO

-- Drop obsolete functions
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConsecutiveYearsGiving]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[asi_ConsecutiveYearsGiving]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConsecutiveYearsGivingToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[asi_ConsecutiveYearsGivingToDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_Get_TransactionID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[asi_Get_TransactionID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GivingStatistics]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[asi_GivingStatistics]
GO

-- Drop any existing GiftHistorySummary table so it gets re-created
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GiftHistorySummary]') AND type in (N'U'))
DROP TABLE [dbo].[GiftHistorySummary]
GO

-- Delete some obsolete queries
EXEC dbo.asi_DocumentDelete '0E2777A0-F3BE-444D-8BFC-33F540FC6D46', 1
EXEC dbo.asi_DocumentDelete '2C41D7D6-ACD1-4B6F-AD9E-3B63C09216EE', 1
GO

--- Remove old iCore folder - PBI 32370
EXEC dbo.asi_DocumentDelete '0A7A76F5-A0E0-4FE4-A24A-774C51778C7B', 1
GO

-- Delete removed Staff site navigation items - SBT 21935
Update perspective Set HomePageHierarchyKey=null WHERE PerspectiveKey='8D22E78D-5E61-48A4-9264-D3522A7D8F7F'
EXEC dbo.asi_DocumentDelete 'DFF600F1-B5DF-415B-8FC3-622D3D48F5CB', 1
EXEC dbo.asi_DocumentDelete '1874D8AE-54E7-4E73-A91B-C2C64D591068', 1
EXEC dbo.asi_DocumentDelete 'A933B273-E454-4DB1-95C4-3C619B16B3ED', 1
EXEC dbo.asi_DocumentDelete 'C19B79E6-DBBF-4031-A1D1-2C62AFF7FADB', 1

-- Delete unused layout...1Over3Over2Over1 - SBT 33076
EXEC dbo.asi_DocumentDelete '27C9FC6A-E2AD-49D4-BBA5-C22E588BCE6C', 1
GO

-- Delete Home, AR Cash, Configure, Reports, Tools, System Admin from old Admin Console - PBI 31791
Update perspective Set HomePageHierarchyKey=null WHERE PerspectiveKey='CDAFDB44-325E-4767-9F5D-30AB2E75224E'
EXEC dbo.asi_DocumentDelete '60CBF22D-02E9-4632-BD36-6838A30F7570', 1
EXEC dbo.asi_DocumentDelete '3BB362B1-114D-44B1-AB8E-5BF35DD5AA7C', 1
EXEC dbo.asi_DocumentDelete 'AA16F4ED-4003-4E75-95E5-901B7E4EB3A7', 1
EXEC dbo.asi_DocumentDelete 'F285B8B1-62B0-4513-B43C-A7413A2473FD', 1
EXEC dbo.asi_DocumentDelete '5E806861-88AE-4DB4-B69D-DD97F137669E', 1
EXEC dbo.asi_DocumentDelete '25CAC73E-0EE6-402D-A417-1BE4FB8FD21B', 1

-- Delete unused Admin Console landing pages (Configuration and Reporting) - PBI 31791
EXEC dbo.asi_DocumentDelete 'e5ed930c-924e-46ab-9f9a-438122f7b0f0', 1
EXEC dbo.asi_DocumentDelete '4da447e4-0cf2-4846-bb05-a5eac325a345', 1

---Delete redundant Give Now submenu - SBT 33251
EXEC dbo.asi_DocumentDelete '6C3E1448-6B4C-49A2-A62D-CAFF77AE9DAA', 1

-- Delete Continuum -> Events Reports navigation from staff site - SBT 33483/33497
EXEC dbo.asi_DocumentDelete '8B6589E4-906D-4CC5-B603-16FDE8D6555E', 1

-- Delete CsName_Staff BOD, DBS & BUS documents - SBT 33513
EXEC dbo.asi_DocumentDelete '7C331654-F33A-4BEC-8E9F-FA86DFD46B0A', 1
EXEC dbo.asi_DocumentDelete 'A839A6A9-2E1C-4928-BF76-745BD461DC2A', 1
EXEC dbo.asi_DocumentDelete '60092483-4F99-469B-8176-6C5AE69A98C8', 1

-- Delete old Name_Staff meta data and make sure CsName_Staff is not marked as user defined - SBT 33513
DELETE FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'Name_Staff'

-- Delete Name_FR meta data - SBT33862
DELETE FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'Name_FR'

-- Delete Name_FR BOD, DBS & BUS documents - SBT33862
EXEC dbo.asi_DocumentDelete 'E538053B-AFA0-49A4-8952-7DE938119962', 1
EXEC dbo.asi_DocumentDelete 'FBAA401A-04E4-4811-9E71-7351DEE86B42', 1
EXEC dbo.asi_DocumentDelete '028B4058-F1B1-4582-909C-1D3E5E0266B3', 1
GO

-- Purge Name_Indexes of any duplicate rows that might cause failure when the new Primary Key is added
WITH Dupes AS (
SELECT ID, INDEX_NAME, INDEX_VALUE, COUNT(ID) AS [DupCount]
 FROM Name_Indexes
 GROUP BY ID, INDEX_NAME, INDEX_VALUE
 HAVING COUNT(ID) > 1
), DupesList AS (
SELECT ROW_NUMBER() OVER (PARTITION BY ni.ID, ni.INDEX_NAME, ni.INDEX_VALUE ORDER BY ni.ID, ni.INDEX_NAME, ni.INDEX_VALUE) AS [DupId], ni.* 
  FROM Name_Indexes ni
       INNER JOIN Dupes ON  ni.ID = Dupes.ID AND ni.INDEX_NAME = Dupes.INDEX_NAME AND ni.INDEX_VALUE = Dupes.INDEX_VALUE
WHERE ni.ID = Dupes.ID AND ni.INDEX_NAME = Dupes.INDEX_NAME AND ni.INDEX_VALUE = Dupes.INDEX_VALUE
)
DELETE ni
FROM DupesList dl
     INNER JOIN Name_Indexes ni ON ni.TIME_STAMP = dl.TIME_STAMP AND dl.DupId > 1
GO


SET NOCOUNT OFF
GO
