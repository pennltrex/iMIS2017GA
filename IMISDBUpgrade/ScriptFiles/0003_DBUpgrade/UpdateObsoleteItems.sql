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
-- Beginning of script

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


--------------------------------------------------------------------------------------------------------
-- Bootstrap a stored procedure used in this script ... 
-- Update with fix HERE so that upgrade won't fail if issue is hit before it's updated by later script
--------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentDeleteDocument]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[asi_DocumentDeleteDocument]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- Deletes a document that is either a leaf node in a hierarchy, or a document not participating
-- in a hierarchy (a stand alone document).  This procedure takes into account any custom access
-- control, as well as whether the document is versioned or not.  This Stored Procedure should not
-- be called directly; it is called by asi_DocumentDelete or asi_DocumentDeleteHierarchy.
CREATE PROCEDURE [dbo].[asi_DocumentDeleteDocument] 
    @documentVersionKey uniqueidentifier,
    @purgeVersions bit = 0
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @documentKey uniqueidentifier
    DECLARE @accessKey uniqueidentifier
    DECLARE @isVersioned bit
    DECLARE @publishedVersionExists bit

    SET @publishedVersionExists = 1
    SELECT @documentKey = d.[DocumentKey], @accessKey = d.[AccessKey], @isVersioned = t.[TrackVersionsFlag]
      FROM [dbo].[DocumentMain] d INNER JOIN [dbo].[DocumentTypeRef] t ON d.[DocumentTypeCode] = t.[DocumentTypeCode]
     WHERE d.[DocumentVersionKey] = @documentVersionKey AND d.[DocumentStatusCode] IN (40,60)

    IF @documentKey IS NULL -- Could not find a published version
    BEGIN
        SET @publishedVersionExists = 0
        IF EXISTS (SELECT 1 FROM [dbo].[DocumentMain] d WHERE d.[DocumentVersionKey] = @documentVersionKey)
        BEGIN
            SET @isVersioned = 1
        END
    END

    IF @isVersioned = 1
    BEGIN
        IF @purgeVersions = 0
        BEGIN
            -- Versioned document... just Recycle it
            UPDATE [dbo].[DocumentMain] 
               SET [DocumentStatusCode] = 80,
                   [StatusUpdatedOn] = GETDATE()
             WHERE [DocumentKey] = @documentKey
        END
        ELSE
        BEGIN
            -- Versioned document... purge all versions
            DECLARE @documents TABLE (DocumentKey uniqueidentifier NOT NULL)
            INSERT INTO @documents
                SELECT [DocumentKey] FROM [dbo].[DocumentMain] d WHERE d.[DocumentVersionKey] = @documentVersionKey
                
            DELETE FROM [dbo].[Hierarchy] WHERE [UniformKey] = @documentVersionKey
            DELETE prd FROM @documents d INNER JOIN [dbo].[PublishRequestDetail] prd ON d.[DocumentKey] = prd.[ContentDocumentKey]
            DELETE dm FROM @documents d INNER JOIN [dbo].[DocumentMain] dm ON d.[DocumentKey] = dm.[DocumentKey]
            EXEC [dbo].[asi_AccessKeyDelete] @accessKey
            DELETE FROM [dbo].[UniformTag] WHERE [UniformKey] = @documentVersionKey
            DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentVersionKey
            DELETE u FROM @documents d INNER JOIN [dbo].[UniformRegistry] u ON d.[DocumentKey] = u.[UniformKey]
            DELETE FROM [dbo].[UniformLicense] WHERE [UniformKey] = @documentVersionKey
        END
    END
    ELSE IF @documentKey IS NOT NULL
    BEGIN
        -- Non-versioned document... delete all references
        DELETE FROM [dbo].[Hierarchy] WHERE [UniformKey] = @documentVersionKey
        EXEC [dbo].[asi_AccessKeyDelete] @accessKey
        DELETE FROM [dbo].[PublishRequestDetail] WHERE [ContentDocumentKey] = @documentKey
        DELETE FROM [dbo].[DocumentMain] WHERE [DocumentVersionKey] = @documentVersionKey
        DELETE FROM [dbo].[UniformTag] WHERE [UniformKey] = @documentVersionKey
        DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentKey
        DELETE FROM [dbo].[UniformRegistry] WHERE [UniformKey] = @documentVersionKey
        DELETE FROM [dbo].[UniformLicense] WHERE [UniformKey] = @documentVersionKey
    END
    
    SET NOCOUNT OFF
END

GO


-- Delete obsolete documents from the document system
EXEC dbo.asi_DocumentDelete '869DD33F-CEA5-493F-945E-001B7AA1B830', 1
EXEC dbo.asi_DocumentDelete 'EEF88856-702B-43F6-9B33-01639D33211D', 1
EXEC dbo.asi_DocumentDelete '20C6F658-1893-4323-BB25-02BBC6936C3F', 1
EXEC dbo.asi_DocumentDelete 'C51E9405-F2FD-4CE7-A97D-04D9717A858D', 1
EXEC dbo.asi_DocumentDelete 'DB0F181C-0CA3-434B-A947-061BB4A49B33', 1
EXEC dbo.asi_DocumentDelete 'CCD03391-DBCC-43A4-B53A-064124677393', 1
EXEC dbo.asi_DocumentDelete 'FAE255F7-4236-448C-98C7-079D348DE96B', 1
EXEC dbo.asi_DocumentDelete 'F366C593-2E90-4893-A119-0875CC1F5600', 1
EXEC dbo.asi_DocumentDelete '82B9D2B9-026A-4EDB-99B3-0C310559058D', 1
EXEC dbo.asi_DocumentDelete '790BFA5F-70ED-48F0-BD7C-0C828C7379A9', 1
EXEC dbo.asi_DocumentDelete 'CEB8D326-299F-4D36-9DE7-0E2C5449BE60', 1
EXEC dbo.asi_DocumentDelete 'F0BD9C30-B66F-4852-A6B2-0E840C7D4B39', 1
EXEC dbo.asi_DocumentDelete 'FED240A5-C7F9-4F56-978E-10DEFFF83CA3', 1
EXEC dbo.asi_DocumentDelete '9B5618DB-C7CA-4B0A-B4C1-1178531E29E4', 1
EXEC dbo.asi_DocumentDelete '508B8F5F-8ED0-4D64-A670-129FA794A586', 1
EXEC dbo.asi_DocumentDelete 'EA844DB7-D537-49F8-A247-1391D382CDBB', 1
EXEC dbo.asi_DocumentDelete '6FFA5281-856F-483A-A8EA-13DD419D0AAD', 1
EXEC dbo.asi_DocumentDelete '536BEF69-992B-4610-B7F2-14542EE1653D', 1
EXEC dbo.asi_DocumentDelete '8CC1200F-59F8-41DD-8EF7-15B662E4011C', 1
EXEC dbo.asi_DocumentDelete 'B6DD14C7-4E51-4F08-856E-17532733FAF0', 1
EXEC dbo.asi_DocumentDelete '837A258C-F76D-40F1-A67D-18C43ACA4498', 1
EXEC dbo.asi_DocumentDelete '7E26C09A-622A-41A0-9135-191C79ACE668', 1
EXEC dbo.asi_DocumentDelete '87CF8F55-4A19-426C-9DD6-1A23C98436AD', 1
EXEC dbo.asi_DocumentDelete 'F3787452-9865-457E-802A-1DF64C7F374A', 1
EXEC dbo.asi_DocumentDelete '61CAE4DC-4A52-428C-96A9-20AEAE62A855', 1
EXEC dbo.asi_DocumentDelete '29CD6827-9AB6-4CF5-9D14-218E4E4D6694', 1
EXEC dbo.asi_DocumentDelete '013AC374-3E0C-42F0-BBE7-231D397E8FBB', 1
EXEC dbo.asi_DocumentDelete '9E35419F-FD9A-462A-A2DF-24BAAC446BCA', 1
EXEC dbo.asi_DocumentDelete '9230A492-99B9-4408-B419-2534E4BD3901', 1
EXEC dbo.asi_DocumentDelete 'FD62AF6C-BE70-4888-9548-257300750A1B', 1
EXEC dbo.asi_DocumentDelete 'F7A2290F-6D8E-4FB8-9DB7-261C67767731', 1
EXEC dbo.asi_DocumentDelete 'A236307D-4950-4933-85E5-26803AD58233', 1
EXEC dbo.asi_DocumentDelete 'AF5137C1-89EF-432B-AFD2-27424A7AC6AD', 1
EXEC dbo.asi_DocumentDelete 'AD82DC2A-E338-46B6-8A94-286E5D027F5E', 1
EXEC dbo.asi_DocumentDelete '9598F7B0-7366-47A8-8EF8-29DAAD8E8E7B', 1
EXEC dbo.asi_DocumentDelete '0246CD7D-0E2D-4609-BC76-2A87D393732F', 1
EXEC dbo.asi_DocumentDelete 'CD78AA4D-343D-4F99-8650-2C2FCDF3D331', 1
EXEC dbo.asi_DocumentDelete '200A4FBD-D6D8-4C6A-AE04-2C73174437E6', 1
EXEC dbo.asi_DocumentDelete 'A7F8142A-CDD6-42CC-A726-2F9777C80F91', 1
EXEC dbo.asi_DocumentDelete '12121BEB-C3FD-4373-ABF1-325A1F5EEFF1', 1
EXEC dbo.asi_DocumentDelete '3A198769-BF9F-4188-B614-335D78472110', 1
EXEC dbo.asi_DocumentDelete '066B90A0-8A7A-41D9-9347-337C1E93DD0E', 1
EXEC dbo.asi_DocumentDelete '4EE824AA-2C12-43DD-9923-35DDF143C1AB', 1
EXEC dbo.asi_DocumentDelete '8B6FB01B-B046-41FA-B71B-35FD430BD9DB', 1
EXEC dbo.asi_DocumentDelete 'CB2276CA-F8D4-485C-A566-3733CF44DF73', 1
EXEC dbo.asi_DocumentDelete 'C3C31976-96BD-47D0-8DEB-3773AF680D85', 1
EXEC dbo.asi_DocumentDelete '0D6BC74C-93D9-4D0B-BE3C-3943E563D0F5', 1
EXEC dbo.asi_DocumentDelete '8FA4499C-CDE9-4C85-92B6-39504DE0A2BE', 1
EXEC dbo.asi_DocumentDelete 'BFE452EA-8F05-4DAD-9D01-39C7C89AE46B', 1
EXEC dbo.asi_DocumentDelete 'DCD385F9-77E1-4C41-95FF-40F9145A6E8E', 1
EXEC dbo.asi_DocumentDelete 'CC25A024-1046-4A82-8782-4367DE6B4BFF', 1
EXEC dbo.asi_DocumentDelete '51F24B5A-2991-4F00-B42C-44DAFC2D96F9', 1
EXEC dbo.asi_DocumentDelete 'DD9BAB6D-E7D6-47FF-B48E-4520CF2DCCC5', 1
EXEC dbo.asi_DocumentDelete 'F87AE099-09EE-487A-A46A-45B3732D534A', 1
EXEC dbo.asi_DocumentDelete '21D47F45-3F1D-42F4-8E9B-483FCACA532C', 1
EXEC dbo.asi_DocumentDelete '97327072-5509-44F0-BA70-49110B6D7951', 1
EXEC dbo.asi_DocumentDelete '36DC9CC0-D8E4-4E20-97CB-4A59BBC34208', 1
EXEC dbo.asi_DocumentDelete '7903405A-8E33-442D-BCFA-4C91C8B77456', 1
EXEC dbo.asi_DocumentDelete 'A13E158F-5BE4-4D6D-A408-4E88246A41F5', 1
EXEC dbo.asi_DocumentDelete 'B38D4BB2-59A5-450D-80C3-4F5B0E89962B', 1
EXEC dbo.asi_DocumentDelete '355D1F28-8E06-4DAB-8E13-4F83DBD6ABDA', 1
EXEC dbo.asi_DocumentDelete 'D360200E-724A-4B51-B914-54205FA65F0D', 1
EXEC dbo.asi_DocumentDelete '14E84054-FAA5-428E-B516-5494BEC99645', 1
EXEC dbo.asi_DocumentDelete '3D6C23A3-76E3-4CA7-8E25-553687D551DD', 1
EXEC dbo.asi_DocumentDelete 'F12AF77A-740C-45A4-8D7F-56525752060B', 1
EXEC dbo.asi_DocumentDelete '8135A6FF-6203-45F6-87F5-593022E3A539', 1
EXEC dbo.asi_DocumentDelete 'A88A3472-BC82-4C59-ACBB-596490DA4DA8', 1
EXEC dbo.asi_DocumentDelete 'A9759B38-0E52-4677-8030-5C8C56ADA35E', 1
EXEC dbo.asi_DocumentDelete '64BC4D63-BC34-4DA5-BADC-5D740055D397', 1
EXEC dbo.asi_DocumentDelete 'F9AB49ED-B3A2-420C-AD1F-5FDB10822B25', 1
EXEC dbo.asi_DocumentDelete 'C422C739-743A-4E18-9F2A-6051241AEF4C', 1
EXEC dbo.asi_DocumentDelete '2EF18897-BCAB-4161-AE2D-61F6AA9FA900', 1
EXEC dbo.asi_DocumentDelete '226C85BD-2878-45AF-A6DE-638D5662519D', 1
EXEC dbo.asi_DocumentDelete '32B00569-380A-47AD-AD12-6402F9B0BC43', 1
EXEC dbo.asi_DocumentDelete '81D1EA39-AF7C-4A68-BE60-65706B24A09A', 1
EXEC dbo.asi_DocumentDelete '160070FD-FB12-4DA7-A8A6-662F98BD472B', 1
EXEC dbo.asi_DocumentDelete 'B0F7A622-6208-4BAF-9470-66BC982EA8EC', 1
EXEC dbo.asi_DocumentDelete 'A3EF9DEE-469F-4CC1-A0A5-6B9C9B8CCC24', 1
EXEC dbo.asi_DocumentDelete 'CA2C86D9-4A02-462E-AEA2-6E18777D9B19', 1
EXEC dbo.asi_DocumentDelete '04377F8F-94B1-4609-8B04-6EE40C3B0382', 1
EXEC dbo.asi_DocumentDelete 'A04AA45F-AAD4-49C6-ABDC-6F68EA11D556', 1
EXEC dbo.asi_DocumentDelete '8DBA15A4-DA19-4CD2-89F1-7004FE42EFB7', 1
EXEC dbo.asi_DocumentDelete '27102A8B-9A7B-43D7-A2B0-703DEF331958', 1
EXEC dbo.asi_DocumentDelete 'EBA764F2-8F7F-404B-96E5-730206C251B4', 1
EXEC dbo.asi_DocumentDelete '1FF73118-A2EC-40DC-BDB7-739FA7D1BC25', 1
EXEC dbo.asi_DocumentDelete '1160AFD4-D587-4A17-9376-748838A84D7B', 1
EXEC dbo.asi_DocumentDelete 'B15ECD9F-EE92-4B38-A387-770362E1F917', 1
EXEC dbo.asi_DocumentDelete 'C98778D4-1760-4521-91A6-78739B919E96', 1
EXEC dbo.asi_DocumentDelete '4CABA710-8B61-4D6A-BF7E-7A237CC2F62F', 1
EXEC dbo.asi_DocumentDelete '0DAA419A-ED04-42F5-A40E-7B0F8552A144', 1
EXEC dbo.asi_DocumentDelete '583A5B71-0A1E-4A1C-A490-7BE681E7B03E', 1
EXEC dbo.asi_DocumentDelete '0C0305F2-44D5-483C-B229-7C47F66C7968', 1
EXEC dbo.asi_DocumentDelete 'C79CC062-9D12-4E3E-94AA-7D8820BB39E7', 1
EXEC dbo.asi_DocumentDelete 'BA5AE152-F5F4-492F-A954-7E24ED9DB4D3', 1
EXEC dbo.asi_DocumentDelete 'B121C473-6AA5-4FE2-B266-7E31DB01F070', 1
EXEC dbo.asi_DocumentDelete '6ADA92A3-7D31-4427-81EA-80C8F337B922', 1
EXEC dbo.asi_DocumentDelete 'C1374F4E-2AAA-4454-A7ED-812EEA7CC1BF', 1
EXEC dbo.asi_DocumentDelete '3F306CE9-E2E1-4842-8B76-8155DC2D827F', 1
EXEC dbo.asi_DocumentDelete 'B0F483B2-4490-474C-92E2-81CBAA3B7F85', 1
EXEC dbo.asi_DocumentDelete 'A128DFBE-A677-4312-AAE9-8334318FD6DA', 1
EXEC dbo.asi_DocumentDelete '9709393C-1E6E-4A8A-8790-837253221FC9', 1
EXEC dbo.asi_DocumentDelete 'D6821211-0DE3-4BDF-AC4D-83AFC56154DC', 1
EXEC dbo.asi_DocumentDelete 'AD65769A-989A-40A8-8E3C-8468A8DB2859', 1
EXEC dbo.asi_DocumentDelete '5E8448B4-FFCC-48EA-8068-85EAD2800F4A', 1
EXEC dbo.asi_DocumentDelete 'ED5E5637-1EE6-4DFF-B68D-87604EA1182D', 1
EXEC dbo.asi_DocumentDelete 'D2A3BCC4-ACD0-4D54-9D55-88E0B18DC6EE', 1
EXEC dbo.asi_DocumentDelete '7FE961E6-5D49-48A5-8900-8992D373F2EF', 1
EXEC dbo.asi_DocumentDelete '84765FE7-1E9B-4283-A082-8B818A140F74', 1
EXEC dbo.asi_DocumentDelete 'B3107F89-4E85-4BD5-9CBB-8C6E49C5C91C', 1
EXEC dbo.asi_DocumentDelete '79233BAD-160E-4E74-9FE1-8E9FC705A53C', 1
EXEC dbo.asi_DocumentDelete 'BE40107A-757F-442B-A913-8F107F989CFF', 1
EXEC dbo.asi_DocumentDelete 'B2C3B995-BFD1-4DCC-BCB4-8FB6D26C4E41', 1
EXEC dbo.asi_DocumentDelete '378D5AE4-DCC8-4C64-8B30-93A1FBD8C194', 1
EXEC dbo.asi_DocumentDelete '9D0A20EE-840F-4DD1-B31E-941646107864', 1
EXEC dbo.asi_DocumentDelete '8F729262-8180-415A-BA32-94D0B7AE9772', 1
EXEC dbo.asi_DocumentDelete 'CB93EEA5-8D5F-44FD-B3A1-95DA6DBD84B9', 1
EXEC dbo.asi_DocumentDelete 'D3CC6FC8-C287-46A4-8B87-983C51C23BA3', 1
EXEC dbo.asi_DocumentDelete '243532FB-3EBD-45EF-A6E7-9936D546175C', 1
EXEC dbo.asi_DocumentDelete '942CE6DD-6382-4D38-AD79-996E9FBEFC58', 1
EXEC dbo.asi_DocumentDelete 'E1183107-E5D1-472C-9AE4-9AA65EBA788D', 1
EXEC dbo.asi_DocumentDelete 'A166932D-31C9-4DA8-BE4F-9E5C21FD47E7', 1
EXEC dbo.asi_DocumentDelete '54A61518-5C6A-4D12-A7B7-9F7672F6576E', 1
EXEC dbo.asi_DocumentDelete '85A798C3-99F1-423B-BDFF-A0CCECB500D8', 1
EXEC dbo.asi_DocumentDelete '27FE47DD-9DE4-4079-999D-A0CF5D841F07', 1
EXEC dbo.asi_DocumentDelete '56AC6034-78F7-4789-BEA8-A2109709A779', 1
EXEC dbo.asi_DocumentDelete 'BE2B7506-9242-4461-9E55-A26E58B41755', 1
EXEC dbo.asi_DocumentDelete '14277B76-6C50-47AF-876A-A2875A65ADC2', 1
EXEC dbo.asi_DocumentDelete '0999B3B5-ACF4-4FDB-A5C9-A2EE10F987E4', 1
EXEC dbo.asi_DocumentDelete '54B4EC48-69F3-4F53-B49E-A3FE5B1CC5DD', 1
EXEC dbo.asi_DocumentDelete '29BDF75B-215A-4791-808A-A4DC6D42E03C', 1
EXEC dbo.asi_DocumentDelete 'E36E527B-51E5-4270-8FF3-A6377AE50609', 1
EXEC dbo.asi_DocumentDelete 'DF4D5B82-B7D3-48CA-9226-A7176AE010C4', 1
EXEC dbo.asi_DocumentDelete '6C00802C-2EFE-48B8-9FAB-AB6A5CB772A1', 1
EXEC dbo.asi_DocumentDelete 'A337AC45-EBCE-4E92-84AB-AF9485FCCFCA', 1
EXEC dbo.asi_DocumentDelete '4791DA79-F50D-40AC-B260-AFB29F809117', 1
EXEC dbo.asi_DocumentDelete '4ACA4C4F-E101-4BE0-A4E9-B07EA80A102E', 1
EXEC dbo.asi_DocumentDelete 'B86E7189-88DC-458F-8619-B142B33E438E', 1
EXEC dbo.asi_DocumentDelete '049771D2-4027-4124-BB45-B3E33423B574', 1
EXEC dbo.asi_DocumentDelete '0AEA5A5F-497C-4155-BE15-B3F1BFC92123', 1
EXEC dbo.asi_DocumentDelete 'CA23EB99-EC69-46EB-815A-B418FFD33FEF', 1
EXEC dbo.asi_DocumentDelete 'CF1F3BD8-D5EE-4EA0-8223-B69C6BDD6822', 1
EXEC dbo.asi_DocumentDelete 'BA6C3893-2272-43CE-810C-B76E877C90EA', 1
EXEC dbo.asi_DocumentDelete '6FB6A697-A024-4BCF-97C2-B9B0E18B7322', 1
EXEC dbo.asi_DocumentDelete '03A5A574-B2D1-4104-B622-BC23E421B6FF', 1
EXEC dbo.asi_DocumentDelete '7340984D-CD09-4221-B6E2-BDAB0B495592', 1
EXEC dbo.asi_DocumentDelete '0DA1F0E1-1804-472A-8023-C1392CCEA6C9', 1
EXEC dbo.asi_DocumentDelete 'A8671F7D-F8FC-4B34-9223-C13A2539E244', 1
EXEC dbo.asi_DocumentDelete 'AACB984D-C2A4-4311-8D51-C1B0414F4806', 1
EXEC dbo.asi_DocumentDelete '08743E0F-9911-4D8E-AB69-C1C96BC016CD', 1
EXEC dbo.asi_DocumentDelete '1098EF86-3C76-4FFC-9DB7-C28106F14670', 1
EXEC dbo.asi_DocumentDelete 'DDE39297-6151-44E2-9D6D-C6B2784096EC', 1
EXEC dbo.asi_DocumentDelete 'C9F7E0C9-2B04-41DF-807D-C6C818BFCF8A', 1
EXEC dbo.asi_DocumentDelete '789E9099-6A31-4F1D-AFAD-C6E78E45A377', 1
EXEC dbo.asi_DocumentDelete 'E62E41F6-23F6-4DEB-8EBE-C872F69FB6A5', 1
EXEC dbo.asi_DocumentDelete 'B20341A8-BCE5-4B5F-95C2-CBDC16B97412', 1
EXEC dbo.asi_DocumentDelete '80DA4B6D-92DF-412C-AD24-CC14C0E0A6E7', 1
EXEC dbo.asi_DocumentDelete '58DA7DC6-773F-4520-86B3-CCD35AF11122', 1
EXEC dbo.asi_DocumentDelete '3629584B-D77C-47E3-B5E1-CCF1B09C2CE3', 1
EXEC dbo.asi_DocumentDelete 'CB5A54B2-326A-420B-8D8B-CFBCA16D91A3', 1
EXEC dbo.asi_DocumentDelete '00B3111E-A180-49D1-BD2B-D0610F10C4E3', 1
EXEC dbo.asi_DocumentDelete '37A672EB-F5FE-4FED-9C78-D0DE011BEED0', 1
EXEC dbo.asi_DocumentDelete '3028CC8D-0C0C-4257-B0FB-D1E0250FF497', 1
EXEC dbo.asi_DocumentDelete 'BAA4E507-CBA1-44B6-8849-D341CA78FB43', 1
EXEC dbo.asi_DocumentDelete 'F2725650-ECA6-489D-A251-D68A006BCAAC', 1
EXEC dbo.asi_DocumentDelete 'E8AD4654-7C22-40A2-A143-D8F950B07C33', 1
EXEC dbo.asi_DocumentDelete 'F0EB3E70-B7EC-464A-9CA7-D9BB6B0D3D8B', 1
EXEC dbo.asi_DocumentDelete '06833637-CD16-4E77-9F91-DCA5CC23B42D', 1
EXEC dbo.asi_DocumentDelete '53C5F298-8585-4D39-92EC-DCBCA547C8B7', 1
EXEC dbo.asi_DocumentDelete '62BAD229-5E20-4B7D-AF64-DE62E1C47D5F', 1
EXEC dbo.asi_DocumentDelete '72887EBB-49D5-431C-BE7B-DF95B5571D52', 1
EXEC dbo.asi_DocumentDelete 'BA9990FF-D8D0-47E3-BA27-DFA3915C5FF1', 1
EXEC dbo.asi_DocumentDelete '319182CA-3529-4881-98B3-E04FE2B738B5', 1
EXEC dbo.asi_DocumentDelete '059DAF28-0AE0-4DC8-B9C6-E153BC98B735', 1
EXEC dbo.asi_DocumentDelete '70F50317-9AF8-4A7F-B71B-E3408D2AAB28', 1
EXEC dbo.asi_DocumentDelete '2CEC5BED-D819-49A9-B906-E3B603FDA5D8', 1
EXEC dbo.asi_DocumentDelete 'D6D474D2-6389-49A4-ADEF-E3F4C924B502', 1
EXEC dbo.asi_DocumentDelete '59A68995-7865-4CC7-8DE9-E4911A08B67D', 1
EXEC dbo.asi_DocumentDelete '3B92291F-193B-436B-92BF-E5752B1BD01C', 1
EXEC dbo.asi_DocumentDelete '49401FB0-2835-415F-9E07-E80186B4365C', 1
EXEC dbo.asi_DocumentDelete '8533A32C-35A4-4A69-B787-E9E914E3AA5F', 1
EXEC dbo.asi_DocumentDelete 'BAC0E6D6-6FE6-42B0-8FA3-EA583F396A5C', 1
EXEC dbo.asi_DocumentDelete '203F890F-7C04-45F9-AC2D-EA7FDD462567', 1
EXEC dbo.asi_DocumentDelete '489351A6-EC4A-4147-AC7A-EA8A3DB389D5', 1
EXEC dbo.asi_DocumentDelete 'DE2303CA-7041-4AC7-AF35-EB66BF458DF4', 1
EXEC dbo.asi_DocumentDelete 'D6B254E0-80B0-438C-AD19-EC08D28E925E', 1
EXEC dbo.asi_DocumentDelete '24B4B7ED-10E2-42C7-AF6B-EC33866C21DB', 1
EXEC dbo.asi_DocumentDelete 'CD700B8F-B614-4375-BE64-EFC4A9B523A8', 1
EXEC dbo.asi_DocumentDelete '9587C342-571A-455B-A8AD-F046F75D7255', 1
EXEC dbo.asi_DocumentDelete '09D2769C-54B4-4D34-9D7B-F358D64C4BCB', 1
EXEC dbo.asi_DocumentDelete '021B2560-BA5D-4842-9697-F36670824756', 1
EXEC dbo.asi_DocumentDelete 'E7DF640F-C85F-4E88-80ED-F51D92FD497A', 1
EXEC dbo.asi_DocumentDelete '9A7D4483-CB21-4CAB-8A39-F5953B4FC43E', 1
EXEC dbo.asi_DocumentDelete '12077B7E-D529-4209-9F6E-F5CD20F4E1DF', 1
EXEC dbo.asi_DocumentDelete 'F33E671B-19D6-48E6-BD35-F606DB4B7AB6', 1
EXEC dbo.asi_DocumentDelete 'DE38FFF3-DA8F-4E07-BFB0-F7DCE6029B88', 1
EXEC dbo.asi_DocumentDelete '6B13BAF0-F0A3-412D-A06E-F945ABC65A98', 1
EXEC dbo.asi_DocumentDelete 'FFA0D7D6-0AFF-44A9-8920-FCDF37B1F0F0', 1
EXEC dbo.asi_DocumentDelete '80596D2E-59B7-40E3-8521-FD606BE43BDB', 1
EXEC dbo.asi_DocumentDelete '5A3368A0-FD32-4BBF-9DFE-FE3DBFF4F879', 1
GO

-- Delete more obsolete documents
EXEC dbo.asi_DocumentDelete 'EA3D42D1-5C0D-45F2-90BE-000F398D7DBB', 1
EXEC dbo.asi_DocumentDelete '19B9B8D4-CE78-4FA0-BA69-00EED4733C96', 1
EXEC dbo.asi_DocumentDelete '913DE3CD-C90A-4EFD-B966-0189089B5767', 1
EXEC dbo.asi_DocumentDelete 'AC5409FA-30F0-4BE2-9A33-01F5594130A8', 1
EXEC dbo.asi_DocumentDelete 'AB732ADA-7B5F-468D-8595-03403B7EC6A3', 1
EXEC dbo.asi_DocumentDelete '41A1CD4F-DF08-42CE-A17E-0396F03C5925', 1
EXEC dbo.asi_DocumentDelete 'EABAFEF1-7278-48EB-8E65-04C2B5B5B476', 1
EXEC dbo.asi_DocumentDelete '009DB570-4FF9-4F97-A699-05CEEABF6285', 1
EXEC dbo.asi_DocumentDelete '8D5EAA3F-C71F-449D-872F-08A0ADDAA6B1', 1
EXEC dbo.asi_DocumentDelete '00059FD0-6AE2-48C1-858E-092087AD5907', 1
EXEC dbo.asi_DocumentDelete '9ABE59DF-16D9-4D27-9C5D-0A637C27AE6A', 1
EXEC dbo.asi_DocumentDelete '61AC20CB-0F05-4427-B0BD-0A8E09D4BBA9', 1
EXEC dbo.asi_DocumentDelete '3BEE7340-C4EA-4C1A-8B97-0CF785F99771', 1
EXEC dbo.asi_DocumentDelete '7DF3247D-5DBD-44EA-BF3B-0D9D030A1ED0', 1
EXEC dbo.asi_DocumentDelete 'B7AFA157-C316-4C16-AC6A-0F8458F50F0D', 1
EXEC dbo.asi_DocumentDelete 'BD69B5A6-B197-45C9-9F03-110BF5DBA791', 1
EXEC dbo.asi_DocumentDelete 'CF9589C7-52F4-4525-B4E1-112B0E0777D7', 1
EXEC dbo.asi_DocumentDelete 'C10C822E-68C7-425F-AEBD-13BC227F6D12', 1
EXEC dbo.asi_DocumentDelete 'BF087D79-6A8D-4EE8-BB11-1484BC181465', 1
EXEC dbo.asi_DocumentDelete 'A511C2C4-6C0F-43B8-92BA-14E9CF012A20', 1
EXEC dbo.asi_DocumentDelete '72F5712A-DFE7-45D7-8E05-1532D326B780', 1
EXEC dbo.asi_DocumentDelete '13A3E9DC-45BE-4058-8423-168599051620', 1
EXEC dbo.asi_DocumentDelete '584AC6A2-C7C6-4397-8670-176E82021431', 1
EXEC dbo.asi_DocumentDelete '6ADAD66F-86DD-4A14-A0C3-18B25D45B6F1', 1
EXEC dbo.asi_DocumentDelete '9CD66171-03A6-437A-B21F-18D49905B6EB', 1
EXEC dbo.asi_DocumentDelete 'DB471943-F810-4F94-B7C4-19006633AA6F', 1
EXEC dbo.asi_DocumentDelete '380DE721-4388-472C-ACA8-19EA43BA26C6', 1
EXEC dbo.asi_DocumentDelete 'EC75DBD3-39D9-4B7F-82AA-19FC45FAC2F5', 1
EXEC dbo.asi_DocumentDelete '3D94AB55-9BC1-402A-9E7A-1CE8760C0610', 1
EXEC dbo.asi_DocumentDelete 'C00D49DF-2967-4C2A-A88C-1D52E5D3C2BB', 1
EXEC dbo.asi_DocumentDelete 'F57E48C7-05DD-4649-B08D-228214F6C52A', 1
EXEC dbo.asi_DocumentDelete 'C85D9EFC-22A7-4323-B98C-27D672300E73', 1
EXEC dbo.asi_DocumentDelete '00E9AE91-B4D9-4935-994C-297920796BAA', 1
EXEC dbo.asi_DocumentDelete 'A65DCCDC-01F9-4DA1-9F58-2BDB21620D20', 1
EXEC dbo.asi_DocumentDelete 'B76E16F2-D391-443E-B14E-2D206ACAE12C', 1
EXEC dbo.asi_DocumentDelete '167D3DCB-A35D-4AB0-A343-2FA3EE95286D', 1
EXEC dbo.asi_DocumentDelete '8760EC51-E8C7-4A2C-89C5-2FC071073754', 1
EXEC dbo.asi_DocumentDelete 'E28392F7-2102-4763-A708-330BEB7F3BFA', 1
EXEC dbo.asi_DocumentDelete 'AF6CE683-33F0-4347-8E57-34E1B92BCC82', 1
EXEC dbo.asi_DocumentDelete 'CC9136BA-D1E6-4300-B214-34FA41F6642D', 1
EXEC dbo.asi_DocumentDelete '6DD97843-0A16-4B49-9735-3509B3141F0A', 1
EXEC dbo.asi_DocumentDelete 'D618A460-2D22-4FAA-B90D-36D03BBC7CFC', 1
EXEC dbo.asi_DocumentDelete 'B9EB30F0-096F-403C-BF61-36DB9CE307BF', 1
EXEC dbo.asi_DocumentDelete '4431E214-3859-42AA-A52E-3915B542F2A2', 1
EXEC dbo.asi_DocumentDelete 'C9889ADF-BAB3-4BFB-B30B-3983B84372C4', 1
EXEC dbo.asi_DocumentDelete '678E498F-A056-48F1-8839-3A9FDD023C8A', 1
EXEC dbo.asi_DocumentDelete '492E101E-1007-4531-9383-3B93C1800B7A', 1
EXEC dbo.asi_DocumentDelete 'DAFA7A7D-3658-4E94-A86B-3E2ECFA719BF', 1
EXEC dbo.asi_DocumentDelete '4C8EFE05-9445-4D2E-964C-3F347859B976', 1
EXEC dbo.asi_DocumentDelete '0E7BE1F5-A106-419E-B4B4-3F945EFCEC84', 1
EXEC dbo.asi_DocumentDelete '877AA258-0044-4A9E-A03A-4225D4189135', 1
EXEC dbo.asi_DocumentDelete '76120849-03D6-4287-A112-43723FFB1D1F', 1
EXEC dbo.asi_DocumentDelete 'D36E5005-EB54-4978-95B9-447525F2BD52', 1
EXEC dbo.asi_DocumentDelete 'D562A388-FB03-4FE3-92A7-45108535F7E7', 1
EXEC dbo.asi_DocumentDelete 'F1D9B66F-A9B6-474A-AEB2-4525D320B73B', 1
EXEC dbo.asi_DocumentDelete '97BC449A-B898-4D8C-B1D4-45D61A32F73E', 1
EXEC dbo.asi_DocumentDelete 'B09159BD-69D8-4524-A5C9-47DEAB3DA900', 1
EXEC dbo.asi_DocumentDelete '539057B1-7FE9-4DE7-95AC-4A79C091B005', 1
EXEC dbo.asi_DocumentDelete 'CD7F45C6-F888-4D83-8D44-4B1DD4078E4C', 1
EXEC dbo.asi_DocumentDelete '28819AEA-718B-4490-B9A4-4CF87F473841', 1
EXEC dbo.asi_DocumentDelete '50B892CF-AAC6-41CE-AF7F-4D093A0AF23B', 1
EXEC dbo.asi_DocumentDelete 'C46B59EE-D6BD-423D-B10F-4D37AB02EB80', 1
EXEC dbo.asi_DocumentDelete 'CE86510F-BC1B-4358-8AF9-4E3279610A48', 1
EXEC dbo.asi_DocumentDelete '9538435D-EC8D-4962-ABA3-4EB8876B1C8D', 1
EXEC dbo.asi_DocumentDelete '24E0C062-E1AA-41CD-A873-4F1B1AFE483A', 1
EXEC dbo.asi_DocumentDelete 'E3147AA7-00FF-425B-8879-4F768ACD532B', 1
EXEC dbo.asi_DocumentDelete '4F5E60AE-6122-4232-97EF-51DAD8310A36', 1
EXEC dbo.asi_DocumentDelete '07BB4391-4F04-4A8E-ABBD-51FB5B7E7756', 1
EXEC dbo.asi_DocumentDelete 'F0555212-1F0F-43E9-B19F-543E211CFA0D', 1
EXEC dbo.asi_DocumentDelete 'EC7AECFE-AA59-4C99-8809-570A8EF31279', 1
EXEC dbo.asi_DocumentDelete 'C6A866C9-B8FC-464D-BECB-580CF01743CD', 1
EXEC dbo.asi_DocumentDelete '64BA3B9C-AC9D-4B64-904F-58E714D462CA', 1
EXEC dbo.asi_DocumentDelete '2618EE0B-A442-4A04-9A03-5B289ABC87DE', 1
EXEC dbo.asi_DocumentDelete 'EC899EE4-A12E-4061-BD12-5BF5E7F4980F', 1
EXEC dbo.asi_DocumentDelete '0605057F-C6DC-4835-86EC-5C15774E46FC', 1
EXEC dbo.asi_DocumentDelete 'D035881A-5EDE-4EAD-804A-5D923010FAD7', 1
EXEC dbo.asi_DocumentDelete '9A926DD9-433A-4500-8F23-5FDBB9358EAF', 1
EXEC dbo.asi_DocumentDelete '7356B8CA-0AC9-4FF4-BDA2-64C576B233EC', 1
EXEC dbo.asi_DocumentDelete 'EE1EFE92-012C-4811-A9BD-664D162122F5', 1
EXEC dbo.asi_DocumentDelete '212B57AD-0EA4-478A-9C5A-6875AB1FB1A2', 1
EXEC dbo.asi_DocumentDelete 'D16C1286-81E7-461F-92A0-68DB8AE2D599', 1
EXEC dbo.asi_DocumentDelete 'D0C5F28A-DD3F-4EEE-8BEE-6C151DB5B1E8', 1
EXEC dbo.asi_DocumentDelete '9B63C472-DC91-482A-BB49-6C3C10CD42FB', 1
EXEC dbo.asi_DocumentDelete 'B172F0B5-488C-49B8-BFA8-6C752372B613', 1
EXEC dbo.asi_DocumentDelete '462EB441-F1B3-4DC2-B3C2-6F32F03D00D5', 1
EXEC dbo.asi_DocumentDelete '2BF03CE5-7275-4211-BAF2-70D0EEE53F31', 1
EXEC dbo.asi_DocumentDelete 'E6609A7C-92BC-4AF4-95FC-7804A833C640', 1
EXEC dbo.asi_DocumentDelete '26B23321-94C2-4A0D-8025-791C1B089DDE', 1
EXEC dbo.asi_DocumentDelete '386996ED-5C60-436B-BB3F-79AEB8EA9BCC', 1
EXEC dbo.asi_DocumentDelete '0875C041-6FC9-44B6-8C7F-7A27E2D3F25B', 1
EXEC dbo.asi_DocumentDelete '24E6C1A6-F732-4DF4-AD8A-7A4A6F182998', 1
EXEC dbo.asi_DocumentDelete '6ECD2A97-B1A1-4588-A83F-7A5D1A22A160', 1
EXEC dbo.asi_DocumentDelete '5CAA87F3-B995-461E-9B9C-7AAA1D7A3794', 1
EXEC dbo.asi_DocumentDelete '4929850A-12F9-426C-BB7B-7BF3BE9DA23C', 1
EXEC dbo.asi_DocumentDelete '4E5B23CF-5B11-4CBB-8A36-7CEA6F5EB5F4', 1
EXEC dbo.asi_DocumentDelete '7DC37D28-1B59-48D2-B631-7D58E7EFE29A', 1
EXEC dbo.asi_DocumentDelete '680C95AF-60B0-4013-B43E-811B61626A94', 1
EXEC dbo.asi_DocumentDelete 'F10D613C-7784-4DAB-B5BF-83188209E3AC', 1
EXEC dbo.asi_DocumentDelete '7E0867D9-73B6-45B2-9DE2-8366010AC1F8', 1
EXEC dbo.asi_DocumentDelete 'FE40C233-8DB2-4EC0-8581-855094D79F2F', 1
EXEC dbo.asi_DocumentDelete '05DFCA47-FC09-4B53-B0F9-8867CAE418F8', 1
EXEC dbo.asi_DocumentDelete '3E726B00-810A-4BBE-AD4E-88E0FBFB3C7B', 1
EXEC dbo.asi_DocumentDelete '22E5CB39-6EFF-42C1-9918-8B4212C5938F', 1
EXEC dbo.asi_DocumentDelete 'C7070C28-DE8A-4706-9603-8BC744353ADA', 1
EXEC dbo.asi_DocumentDelete 'EFE1D844-843C-412A-A614-91F71187AD5F', 1
EXEC dbo.asi_DocumentDelete 'BF8D9314-4A45-4A33-B3AA-9247C81CBDFA', 1
EXEC dbo.asi_DocumentDelete 'AB5E7F97-7299-403A-AC22-93B210686F87', 1
EXEC dbo.asi_DocumentDelete '2DA4CA0C-2301-4B32-948A-95FBF18E2395', 1
EXEC dbo.asi_DocumentDelete '83D7EABF-7826-436E-92F8-96EAEA75A7F4', 1
EXEC dbo.asi_DocumentDelete '525C3047-B552-4A6B-A7C9-97148DA375A6', 1
EXEC dbo.asi_DocumentDelete '2FBC4DE1-E366-4359-8516-9916379FEAAF', 1
EXEC dbo.asi_DocumentDelete '78CFBDBB-0927-48B2-9CAD-99AD86E26347', 1
EXEC dbo.asi_DocumentDelete '5E410000-068A-49A9-9018-99AD98C84B0C', 1
EXEC dbo.asi_DocumentDelete '01B90FDB-744C-4B54-9A24-9B3CBEC5E273', 1
EXEC dbo.asi_DocumentDelete 'F898C257-103D-4C95-9D38-9C2FCA187638', 1
EXEC dbo.asi_DocumentDelete 'A94A2111-C5FD-4A5B-A65D-9E1C0E28F0B2', 1
EXEC dbo.asi_DocumentDelete 'E2CDE596-C075-45C5-A41A-A09D6FF6777A', 1
EXEC dbo.asi_DocumentDelete '671F2665-C929-46C8-BE6E-A1815923C596', 1
EXEC dbo.asi_DocumentDelete '1F6006C2-1ABB-42DC-8FF7-A3427458F13B', 1
EXEC dbo.asi_DocumentDelete 'A6417B26-EF83-4E0E-AC87-A412A7F20219', 1
EXEC dbo.asi_DocumentDelete '5793B400-073F-44DF-AF67-A5B0F212C03F', 1
EXEC dbo.asi_DocumentDelete 'DCC0E289-D940-4EE6-A5E9-A74767C28BD5', 1
EXEC dbo.asi_DocumentDelete '498DD7EB-9A93-4F86-AF8E-A779E942A2B4', 1
EXEC dbo.asi_DocumentDelete '1C352DB3-5BDF-4A24-BD35-A77BAB1F779F', 1
EXEC dbo.asi_DocumentDelete '61E91E21-1364-4E91-9CA9-A7DF3E1B7796', 1
EXEC dbo.asi_DocumentDelete '848D399A-D264-454C-B06E-A887A5AE45F7', 1
EXEC dbo.asi_DocumentDelete 'AAB63D6F-7955-46D4-9A30-AAB71C8B5E85', 1
EXEC dbo.asi_DocumentDelete 'DAB59842-BE89-47A2-8A04-ACAFEF6B06FD', 1
EXEC dbo.asi_DocumentDelete '7E839C62-189F-4441-9E31-AD11A6BD3386', 1
EXEC dbo.asi_DocumentDelete '7AE670A4-01FE-4FBC-92F6-AD7840EC4A19', 1
EXEC dbo.asi_DocumentDelete 'A272FE7E-8859-4359-A57B-B289A78C3A23', 1
EXEC dbo.asi_DocumentDelete '3E4FBE4F-9320-4F72-95BD-B3C00FF9F726', 1
EXEC dbo.asi_DocumentDelete 'BA5390D5-C8A1-44D9-BFEF-B509AEF9DD67', 1
EXEC dbo.asi_DocumentDelete '321962F3-83E1-4868-BD98-B5BAB1D05071', 1
EXEC dbo.asi_DocumentDelete '03017C59-B37D-4C53-A413-B6F1F4BF0003', 1
EXEC dbo.asi_DocumentDelete 'C69A5896-6B1B-42F9-A2E9-B6F9F4A3BD58', 1
EXEC dbo.asi_DocumentDelete '6FB9A334-60CA-4DD4-BFC9-B7182BBCDDE2', 1
EXEC dbo.asi_DocumentDelete '9755C3AD-0D06-4F76-9F82-B7CF4B39663A', 1
EXEC dbo.asi_DocumentDelete 'E9C098C6-4BA8-44D1-8149-B9F022460AE5', 1
EXEC dbo.asi_DocumentDelete '9E10EDCC-F4A2-49A7-8C9B-BC7EC9774301', 1
EXEC dbo.asi_DocumentDelete 'E33D4408-32BB-448C-A206-BCEF351A5CD6', 1
EXEC dbo.asi_DocumentDelete '7A3130AE-B329-49ED-87FB-BD0D82C09243', 1
EXEC dbo.asi_DocumentDelete '11E22999-19AF-4664-8A38-BD9BE1BA591D', 1
EXEC dbo.asi_DocumentDelete 'B2365CA0-03DB-41D0-8167-BEB449274F5C', 1
EXEC dbo.asi_DocumentDelete '6DC99D78-2824-4789-B17A-BF7338E267A1', 1
EXEC dbo.asi_DocumentDelete '50C3F6C0-0F6D-4DFA-BB12-BFCAF1450EE4', 1
EXEC dbo.asi_DocumentDelete 'AA0503F9-A3A3-4CB0-9CF4-C0E00D4B4C1A', 1
EXEC dbo.asi_DocumentDelete 'F13ACC79-A0B5-449D-B546-C32B7C620EC2', 1
EXEC dbo.asi_DocumentDelete '6FE3164B-6A5D-469A-AB8C-C365588E6E8C', 1
EXEC dbo.asi_DocumentDelete 'D8794A5F-CB60-492E-A17F-C4276F0FF63F', 1
EXEC dbo.asi_DocumentDelete '5CEF6ED4-E482-4388-B346-C86B903B0FB9', 1
EXEC dbo.asi_DocumentDelete '83896676-8178-4B5A-9FEB-CBE51DC66AB5', 1
EXEC dbo.asi_DocumentDelete '7D78EF13-02FE-4947-89FF-CC2F7B95C1B4', 1
EXEC dbo.asi_DocumentDelete '323F80D8-8F3B-42C0-B054-CD4AC08C523C', 1
EXEC dbo.asi_DocumentDelete 'A0C071D8-092B-405B-9713-CE1695DB3640', 1
EXEC dbo.asi_DocumentDelete 'A39334EF-D786-4715-A8E8-CE3A34CC72D1', 1
EXEC dbo.asi_DocumentDelete '26B0E5D6-7BB2-4D42-BAD3-D4216BA09321', 1
EXEC dbo.asi_DocumentDelete 'FFF3F609-0E5E-4262-A409-D77670D8B953', 1
EXEC dbo.asi_DocumentDelete '2157C7D3-16AA-4C62-B230-D7CDA122DEBE', 1
EXEC dbo.asi_DocumentDelete '5FDB1F2D-ED96-4A0D-BF71-D92936067C36', 1
EXEC dbo.asi_DocumentDelete '052BB43F-05DD-4BF7-87B2-D9B5F08DC451', 1
EXEC dbo.asi_DocumentDelete '6643D7B0-E882-402C-8F23-D9E38EB8D324', 1
EXEC dbo.asi_DocumentDelete '96DCF7E3-A6E7-4BB3-8B0D-DA8D0859B87A', 1
EXEC dbo.asi_DocumentDelete 'B4E8044C-B1EA-4971-B847-DC2ECC1E55F7', 1
EXEC dbo.asi_DocumentDelete '907B6A6D-B5AB-4B54-9EAD-DC92D5E1A30A', 1
EXEC dbo.asi_DocumentDelete '65F9013D-6D7D-400E-8040-DD797A9B3CDD', 1
EXEC dbo.asi_DocumentDelete '46696206-ABCC-496F-9A6B-DE0F36952EF0', 1
EXEC dbo.asi_DocumentDelete '4F91D390-3DC8-40F1-9CCC-DFE4FE29CA8C', 1
EXEC dbo.asi_DocumentDelete '04652AFC-055C-44AC-9826-E0CC249E280A', 1
EXEC dbo.asi_DocumentDelete 'FAE481D3-285F-4D95-93DE-E17A18F6470B', 1
EXEC dbo.asi_DocumentDelete '093EBDF0-F822-4E76-B3C5-E295CD3013E9', 1
EXEC dbo.asi_DocumentDelete '497576EF-C626-47C1-83F0-E2B7A20CAFE5', 1
EXEC dbo.asi_DocumentDelete '316D0D36-8459-4BF6-9513-E2B9132DD0E9', 1
EXEC dbo.asi_DocumentDelete 'E306F274-24AC-49C5-8817-E321AD2A21BB', 1
EXEC dbo.asi_DocumentDelete 'D713940D-F41B-426F-B102-E3D094411B30', 1
EXEC dbo.asi_DocumentDelete '5F0FE871-048B-46AE-95DC-E3DC7770DD1F', 1
EXEC dbo.asi_DocumentDelete '8EFED4CF-83E9-4441-89B7-E5937854C511', 1
EXEC dbo.asi_DocumentDelete '0B07F6DA-45BF-4145-98C0-E8B49F556B5F', 1
EXEC dbo.asi_DocumentDelete 'BAD8927D-82B8-4C00-8009-E9C0653BBBC0', 1
EXEC dbo.asi_DocumentDelete '98731309-83A0-49C7-B413-EA51002CFDD9', 1
EXEC dbo.asi_DocumentDelete '0C2FBE81-E58D-45BD-ACF6-ED3DD3A6511F', 1
EXEC dbo.asi_DocumentDelete '3AFE8F78-827A-4D5D-8254-EE340F97C923', 1
EXEC dbo.asi_DocumentDelete 'DF0BB018-8DEA-4CEB-9E26-EF12FBF9A253', 1
EXEC dbo.asi_DocumentDelete '78D89B9C-F6C0-4B41-9424-F2257FAF21C6', 1
EXEC dbo.asi_DocumentDelete '3A803F83-827D-4BF9-9EC4-F402BFF3A73D', 1
EXEC dbo.asi_DocumentDelete 'A4F8C8D9-51BC-46D7-BC71-F42E36703EB9', 1
EXEC dbo.asi_DocumentDelete '1336D733-0E41-4C1B-A637-F49D9B5938AF', 1
EXEC dbo.asi_DocumentDelete '2E63BF0F-96ED-4D91-A32C-F5F9899CB190', 1
EXEC dbo.asi_DocumentDelete '49B7EAC1-9483-4D2B-BF04-F962819D46D1', 1
EXEC dbo.asi_DocumentDelete 'B3487B94-4EE0-498A-8A0B-FA2A0800B258', 1
EXEC dbo.asi_DocumentDelete 'D974380D-D4A0-443A-9B16-FBAEBC2B9FA3', 1
EXEC dbo.asi_DocumentDelete 'FBF275F5-54FF-46B5-80D3-FD1EEF7B19DA', 1
EXEC dbo.asi_DocumentDelete '1E9D7FA0-4EDF-439D-8031-FD3AE2F928ED', 1
EXEC dbo.asi_DocumentDelete '0951D077-A8A3-4D05-972C-FFD0FCF03948', 1
EXEC dbo.asi_DocumentDelete 'BB48FF5C-E9C1-4B7C-8F4A-27150F661EED', 1
GO

-- Drop Unused/Obsolete BO-associated views (BOs are already gone)
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSetup]'))
    DROP VIEW [dbo].[vBoBatchSetup]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchStatusRef]'))
    DROP VIEW [dbo].[vBoBatchStatusRef]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGeneric]'))
    DROP VIEW [dbo].[vBoGeneric]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGenericLink]'))
    DROP VIEW [dbo].[vBoGenericLink]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLog]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLog]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLogCost]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLogCost]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLogLine]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLogLine]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoName_FR]'))
    DROP VIEW [dbo].[vBoName_FR]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOutboundCommunicationStatusRef]'))
    DROP VIEW [dbo].[vBoOutboundCommunicationStatusRef]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageLogStatusRef]'))
    DROP VIEW [dbo].[vBoPackageLogStatusRef]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageQueue]'))
    DROP VIEW [dbo].[vBoPackageQueue]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageQueueReleaseTypeRef]'))
    DROP VIEW [dbo].[vBoPackageQueueReleaseTypeRef]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaperSizeRef]'))
    DROP VIEW [dbo].[vBoPaperSizeRef]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoStateProvinceCodes]'))
    DROP VIEW [dbo].[vBoStateProvinceCodes]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowDemo]'))
    DROP VIEW [dbo].[vBoWorkflowDemo]
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowDemoLog]'))
    DROP VIEW [dbo].[vBoWorkflowDemoLog]
GO

-- Remove duplicate indexes to improve DB efficiency
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'AK_GroupMain_AccessKey')
    AND EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'IX_GroupMain_AccessKey')
BEGIN
    DROP INDEX [AK_GroupMain_AccessKey] ON [dbo].[GroupMain] WITH ( ONLINE = OFF )
END

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'AK_GroupMain_OverrideOwnerGroupKey')
    AND EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'IX_GroupMain_OverrideOwnerGroupKey')
BEGIN
    DROP INDEX [AK_GroupMain_OverrideOwnerGroupKey] ON [dbo].[GroupMain] WITH ( ONLINE = OFF )
END

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'AK_GroupMain_OwnerAccessKey')
    AND EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupMain]') AND name = N'IX_GroupMain_OwnerAccessKey')
BEGIN
    DROP INDEX [AK_GroupMain_OwnerAccessKey] ON [dbo].[GroupMain] WITH ( ONLINE = OFF )
END

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Individual]') AND name = N'AK_Individual_PrimaryInstituteContactKey')
    AND EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Individual]') AND name = N'IX_Individual_PrimaryInstituteContactKey')
BEGIN
    DROP INDEX [AK_Individual_PrimaryInstituteContactKey] ON [dbo].[Individual] WITH ( ONLINE = OFF )
END

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Activity]') AND name = N'iActivitySeqnActivityTypeID')
BEGIN
    DROP INDEX [iActivitySeqnActivityTypeID] ON [dbo].[Activity] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AccountPending]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[AccountPending] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Error]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[Error] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FieldDesign]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[FieldDesign] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FieldDesignSectionLookup]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[FieldDesignSectionLookup] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FieldSection]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[FieldSection] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventGuest]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[EventGuest] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventRegistrant]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[EventRegistrant] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[EventSetupFunctionGroup] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventSetupQuestion]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[EventSetupQuestion] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderCheckout]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[OrderCheckout] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CartBilling]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[CartBilling] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CartEvent]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[CartEvent] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CartEventFunction]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[CartEventFunction] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CartItem]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[CartItem] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderProduct]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[OrderProduct] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CartOrder]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[CartOrder] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderSuperProductAttribute]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[OrderSuperProductAttribute] WITH ( ONLINE = OFF )
END
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderSuperProductChildProduct]') AND name = N'iWC')
BEGIN
    DROP INDEX [iWC] ON [dbo].[OrderSuperProductChildProduct] WITH ( ONLINE = OFF )
END
GO

-- Delete obsolete NAV documents with invalid referenced document keys
EXEC dbo.asi_DocumentDelete '41EB0E76-CED4-4191-96E3-6A0E0D869C9A', 1
EXEC dbo.asi_DocumentDelete '5761A5DC-5333-4184-9EE8-B274D5404DD1', 1
EXEC dbo.asi_DocumentDelete 'D9A087D5-A1A3-4287-A0B3-B8CD0D352A50', 1
EXEC dbo.asi_DocumentDelete 'DF958984-544A-47CE-8BB3-481430C4917B', 1
EXEC dbo.asi_DocumentDelete 'D91C23A0-82C5-47E3-89A6-B6E010F4D9B9', 1
EXEC dbo.asi_DocumentDelete '41DC1A24-5DB0-4E8B-A92B-D0111F4AB2DA', 1
EXEC dbo.asi_DocumentDelete '9A3FDB3A-26AA-4E09-83AA-FCCDF3CC1E28', 1
EXEC dbo.asi_DocumentDelete '16DBFFB2-C4B2-4361-A9F9-9DE637C64A42', 1
EXEC dbo.asi_DocumentDelete 'FCA13E7A-4777-48E4-B9FD-F3D0858B2AAF', 1
GO

-- Set RelatedDocumentVersionKey to null for any archived document versions where the reference document no longer exists
UPDATE [dbo].[DocumentMain]
   SET [RelatedDocumentVersionKey] = NULL
 WHERE DocumentStatusCode <> 40 AND RelatedDocumentVersionKey IS NOT NULL 
   AND RelatedDocumentVersionKey NOT IN (SELECT DocumentVersionKey FROM DocumentMain)
GO

-- Drop unused, obsolete, and broken stored procedures
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_AccessPermission]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_AccessPermission]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConvertWorkInvoices]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_ConvertWorkInvoices]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConvertWorkPayments]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_ConvertWorkPayments]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_CreateDeferredIncomeWork]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_CreateDeferredIncomeWork]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_CreateGLExportItems]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_CreateGLExportItems]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_FindOrderLine]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_FindOrderLine]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_FindProductBO]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_FindProductBO]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcProductClassDiscounts]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcProductClassDiscounts]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryGenericRuleFilters]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryGenericRuleFilters]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryPriceBreak]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryPriceBreak]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryPriceBreakForVersion]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryPriceBreakForVersion]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryPriceSheetListByProduct]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryPriceSheetListByProduct]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryPriceSheetVersion]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryPriceSheetVersion]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryPriceVersionDetailOwner]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryPriceVersionDetailOwner]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryProductPriceBreaks]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryProductPriceBreaks]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PrcQueryProductPriceDetails]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_PrcQueryProductPriceDetails]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConvertDocumentNodeToHierarchy]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[ConvertDocumentNodeToHierarchy]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEConfigurationDelete]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEConfigurationDelete]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEConfigurationGetAll]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEConfigurationGetAll]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEConfigurationInsert]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEConfigurationInsert]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEConfigurationLoad]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEConfigurationLoad]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEConfigurationUpdate]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEConfigurationUpdate]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEFindMeStatisticDelete]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEFindMeStatisticDelete]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEGetAllConfigurationInformation]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEGetAllConfigurationInformation]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEGetConfigurationVariable]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEGetConfigurationVariable]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEGetConfigVars]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEGetConfigVars]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEGetCreditCardList]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEGetCreditCardList]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEGetFieldsToUse]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEGetFieldsToUse]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAEResetConfigurationVariableToDefault]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAEResetConfigurationVariableToDefault]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAESecurityKeyUpdate]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAESecurityKeyUpdate]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BAESetConfigurationVariable]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[BAESetConfigurationVariable]
GO

-- PBI 35207 - These are copies of "System" All sites shortcuts that cannot be edited or deleted.  
-- Therefore, a website specific version is not needed.
DELETE FROM [dbo].[URLMapping] 
WHERE [WebsiteDocumentVersionKey] = 'DEEA0907-2D5E-405C-8EC4-E9794203EADD' 
  AND [DirectoryName] IN ('/EventEdit','/FunctionEdit')
GO

-- PBI 33891 Delete obsolete PaymentMethodSet Component registry/atom panel entries
DELETE FROM [dbo].[AtomPanelWebsite] 
WHERE AtomPanelKey IN ('25FF1925-1D80-4E81-AF84-8F13E77DA6AD', '47C0B87B-46B2-4BE9-9523-3A799683DEE2')
GO
DELETE FROM [dbo].[AtomPanel] 
WHERE ComponentKey= '42BAAA60-DACF-44AB-9BE3-F1F1677CC147' 
GO
DELETE FROM [dbo].[ComponentRegistryCategory] 
WHERE ComponentKey= '42BAAA60-DACF-44AB-9BE3-F1F1677CC147' 
GO
DELETE FROM [dbo].[ComponentRegistry] 
WHERE ComponentKey IN ('42BAAA60-DACF-44AB-9BE3-F1F1677CC147', '079F5C71-A970-4C7F-9636-E167FE7013ED')
GO

-- Drop redundant indexes, Rename indexes, rebuild constraints as indexes
-- (This is all happening here so that it happens first during upgrade, so the rest of upgrade works correctly)
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentWorkLog_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_Workflow_Log]'))
ALTER TABLE [dbo].[Content_Workflow_Log] DROP CONSTRAINT [FK_ContentWorkLog_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_Security_Group_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_Security_Group]'))
ALTER TABLE [dbo].[Content_Security_Group] DROP CONSTRAINT [FK_Content_Security_Group_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_Link_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_Link]'))
ALTER TABLE [dbo].[Content_Link] DROP CONSTRAINT [FK_Content_Link_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_HTML_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_HTML]'))
ALTER TABLE [dbo].[Content_HTML] DROP CONSTRAINT [FK_Content_HTML_Content]
GO
-- Drop referencing constraints so we can rebuild the constraints and indexes properly
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_File_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_File]'))
ALTER TABLE [dbo].[Content_File] DROP CONSTRAINT [FK_Content_File_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_Change_Request_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content_Change_Request]'))
ALTER TABLE [dbo].[Content_Change_Request] DROP CONSTRAINT [FK_Content_Change_Request_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NavMenu_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nav_Menu]'))
ALTER TABLE [dbo].[Nav_Menu] DROP CONSTRAINT [FK_NavMenu_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_Content_OriginalContentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content]'))
ALTER TABLE [dbo].[Content] DROP CONSTRAINT [FK_Content_Content_OriginalContentID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Content_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Content]'))
ALTER TABLE [dbo].[Content] DROP CONSTRAINT [FK_Content_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PUBLISH__REFERENCE_CONTENT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publish_Request_Detail]'))
ALTER TABLE [dbo].[Publish_Request_Detail] DROP CONSTRAINT [FK_PUBLISH__REFERENCE_CONTENT]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publish_Request_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publish_Request_Detail]'))
ALTER TABLE [dbo].[Publish_Request_Detail] DROP CONSTRAINT [FK_Publish_Request_Content]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaggedPageInterestCategory_Content]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tagged_Page_Interest_Category]'))
ALTER TABLE [dbo].[Tagged_Page_Interest_Category] DROP CONSTRAINT [FK_TaggedPageInterestCategory_Content]
GO

-- Rebuild Primary Key
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'PK_Content')
    ALTER TABLE [dbo].[Content] DROP CONSTRAINT [PK_Content]
GO

ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
    [ContentID] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

-- Drop redundant constraint
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'AK_Content_ContentID')
ALTER TABLE [dbo].[Content] DROP CONSTRAINT [AK_Content_ContentID]
GO

-- Restore constraints, now referencing PK instead of AK
ALTER TABLE [dbo].[Content_Workflow_Log]  WITH CHECK ADD  CONSTRAINT [FK_ContentWorkLog_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_Workflow_Log] CHECK CONSTRAINT [FK_ContentWorkLog_Content]
GO

ALTER TABLE [dbo].[Content_Security_Group]  WITH CHECK ADD  CONSTRAINT [FK_Content_Security_Group_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_Security_Group] CHECK CONSTRAINT [FK_Content_Security_Group_Content]
GO

ALTER TABLE [dbo].[Content_Link]  WITH CHECK ADD  CONSTRAINT [FK_Content_Link_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_Link] CHECK CONSTRAINT [FK_Content_Link_Content]
GO

ALTER TABLE [dbo].[Content_HTML]  WITH CHECK ADD  CONSTRAINT [FK_Content_HTML_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_HTML] CHECK CONSTRAINT [FK_Content_HTML_Content]
GO

ALTER TABLE [dbo].[Content_File]  WITH CHECK ADD  CONSTRAINT [FK_Content_File_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_File] CHECK CONSTRAINT [FK_Content_File_Content]
GO

ALTER TABLE [dbo].[Content_Change_Request]  WITH CHECK ADD  CONSTRAINT [FK_Content_Change_Request_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content_Change_Request] CHECK CONSTRAINT [FK_Content_Change_Request_Content]
GO

ALTER TABLE [dbo].[Nav_Menu]  WITH CHECK ADD  CONSTRAINT [FK_NavMenu_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_Content]
GO

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Content_OriginalContentID] FOREIGN KEY([OriginalContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content_OriginalContentID]
GO

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Content] FOREIGN KEY([PreviousContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content]
GO

ALTER TABLE [dbo].[Publish_Request_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Publish_Request_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_Publish_Request_Content]
GO

ALTER TABLE [dbo].[Tagged_Page_Interest_Category]  WITH CHECK ADD  CONSTRAINT [FK_TaggedPageInterestCategory_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Tagged_Page_Interest_Category] CHECK CONSTRAINT [FK_TaggedPageInterestCategory_Content]
GO

-- Create new indexes for efficiency
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'IX_Content_ContentID')
    DROP INDEX [IX_Content_ContentID] ON [dbo].[Content] WITH ( ONLINE = OFF )
GO

CREATE NONCLUSTERED INDEX [IX_Content_ContentID] ON [dbo].[Content] 
(
    [ContentID] ASC
)
INCLUDE (PublishDateTime, OriginalContentID)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

-- Rename indexes
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'ix_Content')
    DROP INDEX [ix_Content] ON [dbo].[Content] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'IX_Content_NavMenuID')
    DROP INDEX [IX_Content_NavMenuID] ON [dbo].[Content] WITH ( ONLINE = OFF )
GO
CREATE NONCLUSTERED INDEX [IX_Content_NavMenuID] ON [dbo].[Content] 
(
    [NavMenuID] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'ix_Content_OriginalContentID')
    DROP INDEX [ix_Content_OriginalContentID] ON [dbo].[Content] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'IX_Content_OriginalContentID')
    DROP INDEX [IX_Content_OriginalContentID] ON [dbo].[Content] WITH ( ONLINE = OFF )
GO
CREATE NONCLUSTERED INDEX [IX_Content_OriginalContentID] ON [dbo].[Content] 
(
    [OriginalContentID] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'ix_Content_PreviousContentID')
    DROP INDEX [ix_Content_PreviousContentID] ON [dbo].[Content] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Content]') AND name = N'IX_Content_PreviousContentID')
    DROP INDEX [IX_Content_PreviousContentID] ON [dbo].[Content] WITH ( ONLINE = OFF )
GO

CREATE NONCLUSTERED INDEX [IX_Content_PreviousContentID] ON [dbo].[Content] 
(
    [PreviousContentID] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

-- Rename and redefine index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND name = N'IX_PARAMETERNAME')
    DROP INDEX [IX_PARAMETERNAME] ON [dbo].[SystemConfigParameterRef] WITH ( ONLINE = OFF )
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND name = N'IX_ParameterName')
    DROP INDEX [IX_ParameterName] ON [dbo].[SystemConfigParameterRef] WITH ( ONLINE = OFF )
GO

CREATE NONCLUSTERED INDEX [IX_ParameterName] ON [dbo].[SystemConfigParameterRef] 
(
    [ParameterName] ASC
)
INCLUDE (SystemKeyword, PropertyDefinitionKey)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

-- Redefine index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpportunityMainDonor]') AND name = N'IX_OpportunityMainDonor')
    DROP INDEX [IX_OpportunityMainDonor] ON [dbo].[OpportunityMainDonor] WITH ( ONLINE = OFF )
GO
CREATE NONCLUSTERED INDEX [IX_OpportunityMainDonor] ON [dbo].[OpportunityMainDonor] 
(
    [OpportunityKey] ASC
)
INCLUDE(DecisionDate)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpportunityMainMember]') AND name = N'IX_OpportunityMainMember')
    DROP INDEX [IX_OpportunityMainMember] ON [dbo].[OpportunityMainMember] WITH ( ONLINE = OFF )
GO
CREATE NONCLUSTERED INDEX [IX_OpportunityMainMember] ON [dbo].[OpportunityMainMember] 
(
    [OpportunityKey] ASC
)
INCLUDE(DecisionDate)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpportunityMainSales]') AND name = N'IX_OpportunityMainSales')
    DROP INDEX [IX_OpportunityMainSales] ON [dbo].[OpportunityMainSales] WITH ( ONLINE = OFF )
GO
CREATE NONCLUSTERED INDEX [IX_OpportunityMainSales] ON [dbo].[OpportunityMainSales] 
(
    [OpportunityKey] ASC
)
INCLUDE(DecisionDate)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

-- Drop obsolete index
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Trans]') AND name = N'iTans_IS_FR_ITEM')
    DROP INDEX [iTans_IS_FR_ITEM] ON [dbo].[Trans] WITH ( ONLINE = OFF )
GO

------------------------------------------------------
-- Drop more invalid/obsolete/unused Stored Procedures
------------------------------------------------------
IF OBJECT_ID('dbo.asi_ExpireTimedCommitments') IS NOT NULL
    DROP PROCEDURE dbo.asi_ExpireTimedCommitments
IF OBJECT_ID('dbo.asi_GetHandlingPrice') IS NOT NULL
    DROP PROCEDURE dbo.asi_GetHandlingPrice
IF OBJECT_ID('dbo.asi_GetOrderPaymentTotal') IS NOT NULL
    DROP PROCEDURE dbo.asi_GetOrderPaymentTotal
IF OBJECT_ID('dbo.asi_GetRestockPrice') IS NOT NULL
    DROP PROCEDURE dbo.asi_GetRestockPrice
IF OBJECT_ID('dbo.asi_GetShippingMethodPriceList') IS NOT NULL
    DROP PROCEDURE dbo.asi_GetShippingMethodPriceList
IF OBJECT_ID('dbo.asi_GetShipPrice') IS NOT NULL
    DROP PROCEDURE dbo.asi_GetShipPrice
IF OBJECT_ID('dbo.asi_ImportDeferredIncomeConversionWork') IS NOT NULL
    DROP PROCEDURE dbo.asi_ImportDeferredIncomeConversionWork
IF OBJECT_ID('dbo.asi_NextSequenceForBatchDate') IS NOT NULL
    DROP PROCEDURE dbo.asi_NextSequenceForBatchDate
IF OBJECT_ID('dbo.asi_PostGLData') IS NOT NULL
    DROP PROCEDURE dbo.asi_PostGLData
IF OBJECT_ID('dbo.asi_PostMonetaryData') IS NOT NULL
    DROP PROCEDURE dbo.asi_PostMonetaryData
GO

-----------------------------------------------------------------
-- PBI 38600 - Remove duplicate document system navigation item
-----------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'D2A4529F-157E-4323-82D7-42C7D708EBC6', 1
GO

------------------------------------------
-- PBI 38494 - Clean up event dashboards
------------------------------------------
-- Delete redundant Dashboards folder
EXEC dbo.asi_DocumentDelete '7CCBB54D-6F6A-4F62-8A5D-9AA7973A4D9E', 1

-- Delete unnecessary Staff site Event Dashboard shortcut
DELETE FROM [dbo].[URLMapping] 
 WHERE URLMappingKey = '93D1967C-705B-4C8F-8EB2-CD684EE60F8A'
GO

-----------------------------------------
-- PBI 38432  - Drop unnecessary localization tables
------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationElementCultureProperty' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LocalizationElementCultureProperty]
END
GO 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationElementCulture' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LocalizationApplicationCulture]
END
GO 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationElementCulture' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LocalizationElementCulture]
END
GO 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LocalizationElement' AND TABLE_TYPE = 'BASE TABLE')
BEGIN
    DROP TABLE [dbo].[LocalizationElement]
END
GO 

------------------------------------------------------------------------------------------------------------------------------------------------
-- Dropping Unnecessary Indexes
------------------------------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Trans]') AND name = N'iTransDO_NOT_RECEIPT')
    DROP INDEX [iTransDO_NOT_RECEIPT] ON [dbo].[Trans] WITH ( ONLINE = OFF )
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Trans]') AND name = N'iTransIS_MATCH_GIFT')
    DROP INDEX [iTransIS_MATCH_GIFT] ON [dbo].[Trans] WITH ( ONLINE = OFF )
GO
------------------------------------------------------------------------------------------------------------------------------------------------
-- Drop Obsolete Stored Procedure: asi_UpdateFundraisingViewTables
------------------------------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_UpdateFundraisingViewTables]') AND type in (N'P', N'PC'))
    DROP PROCEDURE [dbo].[asi_UpdateFundraisingViewTables]
GO
------------------------------------------------------------------------------------------------------------------------------------------------
-- Drop Obsolete Triggers
------------------------------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Trans_FundraisingInsertUpdateDelete]'))
    DROP TRIGGER [dbo].[asi_Trans_FundraisingInsertUpdateDelete]
GO
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[asi_Trans_FundraisingInsertDelete]'))
    DROP TRIGGER [dbo].[asi_Trans_FundraisingInsertDelete]
GO

-- PBI 39041 Certification (v10)
------------------------------------------------------------------
-- Drop obsolete indexes and foreign key constraints
------------------------------------------------------------------
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CertificationProgramRegistration')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_UserMain')
    BEGIN    
        ALTER TABLE [dbo].[CertificationProgramRegistration] DROP CONSTRAINT [FK_CertificationProgramRegistration_UserMain]
    END		
    IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_UserKey')
    BEGIN
        DROP INDEX [dbo].[CertificationProgramRegistration].[IX_CertificationProgramRegistration_UserKey]
    END
END
GO
    
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'RegistrationStatusChange')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_UserMain_StatusChanged')
    BEGIN    
        ALTER TABLE [dbo].[RegistrationStatusChange] DROP CONSTRAINT [FK_RegistrationStatusChange_UserMain_StatusChanged]
    END
    IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_StatusChangedUserKey')
    BEGIN
        DROP INDEX [dbo].[RegistrationStatusChange].[IX_RegistrationStatusChange_StatusChangedUserKey]
    END
END
GO	

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperience')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_UserMain')
    BEGIN    
        ALTER TABLE [dbo].[CustomerExperience] DROP CONSTRAINT [FK_CustomerExperience_UserMain]
    END
    IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'IX_CustomerExperience_UserKey')
    BEGIN
        DROP INDEX [dbo].[CustomerExperience].[IX_CustomerExperience_UserKey]
    END
END
GO	

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CustomerExperienceStatusChange')
BEGIN
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_UserMain_StatusChanged')
    BEGIN    
        ALTER TABLE [dbo].[CustomerExperienceStatusChange] DROP CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_StatusChanged]
    END
    IF EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_StatusChangedUserKey')
    BEGIN
        DROP INDEX [dbo].[CustomerExperienceStatusChange].[IX_CustomerExperienceStatusChange_StatusChangedUserKey]
    END
END
GO	

-----------------------------------------------------------------------
-- PBI 41259 - 'Casual Users' and 'Full Users' queries return an error
-----------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '02AE5273-30A9-4FB7-A80D-34EE7516D34E', 1
EXEC dbo.asi_DocumentDelete '8E148F11-6629-4C60-AAFB-365CE3762E2D', 1
GO

----------------------------------------------------------
-- PBI 41325 - Delete Gold DB Demo Content Block Posts
----------------------------------------------------------
EXEC dbo.asi_DocumentDelete '0DA8CF31-4216-4DED-A081-4A88D062B4AB', 1
EXEC dbo.asi_DocumentDelete '7997AF3B-0206-40B7-937F-551107927243', 1
EXEC dbo.asi_DocumentDelete '9FFB4F3B-B1C5-40A6-8290-A167F253EC1B', 1
EXEC dbo.asi_DocumentDelete 'B6B5603A-533B-4A64-8EC7-C7BE9C2D665B', 1
EXEC dbo.asi_DocumentDelete '7D0C39D8-E023-4EA9-B1A2-6C75FE4F5C01', 1
EXEC dbo.asi_DocumentDelete '3B718873-2E5F-44A6-9E46-63B7E55D374A', 1
EXEC dbo.asi_DocumentDelete '9D31184D-C6BA-4347-954F-FC0A6869AEA5', 1
EXEC dbo.asi_DocumentDelete '8480FE74-247C-45CE-A603-37B981FA1DCF', 1
EXEC dbo.asi_DocumentDelete '201E5D39-E01B-40B6-B78B-43EDFBD3E7DF', 1
GO

------------------------------------------------------------------------------------------------------------------------
-- PBI 41633 - (Admin Console) Delete the Customer Service navigation item and the break before it from the Home page.
------------------------------------------------------------------------------------------------------------------------
exec asi_documentdelete '9AE80B74-D0E6-4D81-BBAD-37353F3880D8', 1 -- Admin Console < Home < Customer Service
exec asi_documentdelete '7C5C2485-B1FB-476E-AFC3-7076CF6A71AC', 1 -- [break] before ...< Customer Service
GO

-- Drop obsolete indexes
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND name = N'IX_ParameterName')
    DROP INDEX [IX_ParameterName] ON [dbo].[SystemConfigParameterRef] WITH ( ONLINE = OFF )
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemConfig]') AND name = N'IX_ParameterName')
    DROP INDEX [IX_ParameterName] ON [dbo].[SystemConfig] WITH ( ONLINE = OFF )
GO

-----------------------------------------------------------------------
-- PBI 42007 - NAV item related to AUTOPAY that we need to replace
-----------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'FF8180D4-707E-402E-B87D-23420FB82AE8', 1
GO

---------------------------------------------------------------------------
-- PBI 42900
-- This IndividualExternalNetwork table is deleted in UpdateTableData.sql
-- but we drop this FK here to avoid warnings during upgrade
---------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE TABLE_NAME = N'IndividualExternalNetwork' AND CONSTRAINT_NAME = N'FK_IndividualExternalNetwork_Name')
    ALTER TABLE [dbo].[IndividualExternalNetwork] DROP CONSTRAINT [FK_IndividualExternalNetwork_Name]
GO
-----------------------------------------------------------------------
-- SBT 43684 - Delete 8 redundant AutoPay NAV items 
-----------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete '0C14810E-0CE4-40DD-B1AC-256E34CE9EAD', 1
EXEC dbo.asi_DocumentDelete 'A214A784-CC37-4B97-A54C-7A186013DD30', 1
EXEC dbo.asi_DocumentDelete '134CAADD-6EA9-408B-A967-C4792CD20D2F', 1
EXEC dbo.asi_DocumentDelete '482978BD-9748-4FF8-B79D-BCACD7C061F6', 1
EXEC dbo.asi_DocumentDelete '68A700C3-CAD9-4846-AEDA-62F083E76154', 1
EXEC dbo.asi_DocumentDelete 'CC84236C-E42F-4323-8073-6338A305270B', 1
EXEC dbo.asi_DocumentDelete '516791CC-68D2-473D-8CAE-AFCBA18F2F1B', 1
EXEC dbo.asi_DocumentDelete 'C1A15B25-E32D-4F6E-8176-8C4ED662918F', 1
GO

-- Delete duplicate/redundant ComponentRegistry Entries
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '7D54F7E1-D510-487B-B3C3-E2A185ED906F' AND [Name] = 'AddressPurposeContactType' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FEE3BF4D-67A2-4529-A56A-E32C8E107619' AND [Name] = 'AddressPurposeContactType' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D1B08C76-877A-4D8F-A92E-A4C5361B7F0E' AND [Name] = 'AddressTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EB166157-15C3-410C-81E2-ED73D7201FE0' AND [Name] = 'AddressTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '7A437F9E-C8ED-4B93-A7E7-8CFF3905DE45' AND [Name] = 'AppealParticipation' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4F06805E-F678-4538-99C5-F40235B03B7F' AND [Name] = 'AtomPanelPurpose' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '89DFB83D-A2B7-4177-B0E1-CB9113C3E08F' AND [Name] = 'BatchCriterion' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2A4234F5-F259-4AC5-BD10-8DEFCD3142C3' AND [Name] = 'BatchCriterionRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B8B5A37F-05A3-4DA8-BA74-CCDF716F634B' AND [Name] = 'BatchCriterionTemplate' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B8B5A37F-05A3-4DA8-BA74-CCDF716F634B' AND [Name] = 'BatchCriterionTemplate' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '96842F7D-61FD-4480-8B40-D6324442161B' AND [Name] = 'Contact' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '94AD4FF7-5BD1-42B5-867B-9645D64BC888' AND [Name] = 'Contact Organization Editor' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '58194BA8-7288-4C0F-9774-65257E819367' AND [Name] = 'ContactPicture' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EFCE2354-524D-4A6A-A74A-FF2AA0E8FC37' AND [Name] = 'ContactReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'E16FE898-DEF2-4676-A1AE-FAECFD1BDA40' AND [Name] = 'CsActivity' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0C32DB5F-0AD4-4F2B-A1C0-E19DC161A64E' AND [Name] = 'CsCommitteeMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0611303B-5913-43B7-98C5-FB3F42D296BA' AND [Name] = 'CsCommitteeMemberGroup' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '82FF0C7F-B1E4-46DB-BC36-7E7630DF6006' AND [Name] = 'CsDonationsDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5777F17E-E758-458A-8E63-74A994EA85EF' AND [Name] = 'CsOrderLines' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C83DFE72-E339-44DE-86F1-19D7A35AB888' AND [Name] = 'CsRegFunctions' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '3C8D98CF-EF97-4108-B5C5-81D17A461BC3' AND [Name] = 'CsRegistration' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '7762CE81-AB81-45D9-9BFD-B20FA5771C0A' AND [Name] = 'DeferredIncomeReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B4AD1DB9-FEDD-4B92-8668-9F4216E0E667' AND [Name] = 'DonorClubReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EFD2B3DD-62F3-40D4-9A7B-82FF3FD5D010' AND [Name] = 'Dynamic Content Collection Organizer' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D0CD77D2-24BD-46CA-9FD5-27B66A0EAA0F' AND [Name] = 'ExportQueryResults' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EF010D1E-F539-4730-9DB9-F26C5B237736' AND [Name] = 'FileTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4D1910B6-2E86-4133-9595-24E9486B4CE7' AND [Name] = 'FinancialEntity' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FA90626F-17A4-4D5B-AD30-A6689B061CD7' AND [Name] = 'FinancialEntity' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '7A9DA504-D2CB-46C2-9D65-D0A3ABD0CD82' AND [Name] = 'FinancialEntity' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2CA0DD3E-B55D-4C36-95C1-C81D650BEFFD' AND [Name] = 'FinancialEntityDueTo' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9A34A7A1-E865-47D9-84C7-4CB76B470FC7' AND [Name] = 'FundFamilyRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4E7A82C4-0310-4DDE-89D3-BACBF8A00DBC' AND [Name] = 'GatewayAccount' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F89DCD0C-65F2-44FD-8CF6-4F4FF4293527' AND [Name] = 'GatewayTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C7160FB5-0454-4470-A496-5D53C4927359' AND [Name] = 'GLAccount' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '326B9881-32F6-486C-9D40-3EE107F1368C' AND [Name] = 'GLAccount' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C4C71205-4AFA-4B2A-BD8B-1054DF02E64E' AND [Name] = 'GLExportDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B3EB5214-925E-42D3-B31B-CAE2DE1B5CFF' AND [Name] = 'GLExportDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '95D4AC63-3D35-46D0-9D58-6A53CFD56175' AND [Name] = 'GLExportDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C606E67F-7FE6-4F0A-93A3-1DD3414DF2EF' AND [Name] = 'GLTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0B9E26AD-7049-4427-BF25-705CC8D2423A' AND [Name] = 'GLTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F9077C00-D1C2-407D-8E12-FDA2A820A861' AND [Name] = 'GLTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'DEEE2B1A-A034-456C-89FA-01FE33466E44' AND [Name] = 'GLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9E0DC39B-D5FD-484F-A294-3EF55D33C03E' AND [Name] = 'GLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '06D626E6-9D01-4D4A-BC3E-84B927E703C7' AND [Name] = 'GLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '705A5965-CE7F-4845-9320-D5EBE1DEDEAA' AND [Name] = 'GLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4D14A1B5-EB70-4070-82E1-AE8565EC1B62' AND [Name] = 'GLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '000A7396-75B1-461A-B0B8-E8204BF8674D' AND [Name] = 'GLTransReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C6CAB9FD-49A6-431C-80E8-2B1A3041E8CA' AND [Name] = 'Group' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C1F26AFB-6A6D-4F33-95BE-4E237414D91B' AND [Name] = 'Group' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A531F2CD-582D-4EDA-8707-C91D8DD4EF8D' AND [Name] = 'Group List Editor' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'AC19530A-44A2-46E8-9F48-B6EACF585AA3' AND [Name] = 'GroupInstanceRole' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D4CA4EEB-F158-4DCB-A738-F50C9ECBA61D' AND [Name] = 'GroupInstanceRole' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '718603C6-EB91-489C-9D81-01E72A547733' AND [Name] = 'GroupMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '8D352A91-3677-4AC0-9EE5-E6266E09DD42' AND [Name] = 'GroupMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '8D79A081-0C1F-4587-B972-ECBD5CDA8760' AND [Name] = 'GroupMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '3002794C-7A78-4ED3-98B9-C472D73F9DF5' AND [Name] = 'GroupMemberDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C75B609A-241A-4BE9-98DD-DBA45B3AD7BC' AND [Name] = 'GroupMemberDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '8B01AD61-B272-48E0-AD9A-58485567D008' AND [Name] = 'GroupMemberStatusRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '32FDB05F-C4F3-4513-96B7-4FDA78681371' AND [Name] = 'GroupMemberStatusRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '8EB63A9B-9BD4-4A78-B281-CE5A6EA3E963' AND [Name] = 'GroupPerspective' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F68F6BB9-AC92-4DA4-AA64-12AB387E8F26' AND [Name] = 'GroupRoleRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B5A7CA1F-3911-4111-B4CA-54B9F7A9D7C3' AND [Name] = 'GroupTypeMemberStatus' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '772F3CD6-C46E-4749-9C53-1D03185A3A7D' AND [Name] = 'GroupTypeMemberStatus' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'AC681616-D859-45C1-AC49-B22377853BC9' AND [Name] = 'GroupTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '31852E64-8716-4895-A128-C318E9B5B8FB' AND [Name] = 'GroupTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A8ABA605-26BB-4AD2-A226-9D093A92C4F3' AND [Name] = 'GroupTypeRole' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5C825BF3-D0EC-4BB1-ACE5-863D7132A770' AND [Name] = 'GroupTypeRole' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9B63361A-EFA6-4921-A8DC-0991DB7A49C4' AND [Name] = 'GroupTypeRole' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9A91E45F-5EBB-4F5D-B7EF-5E81B3243434' AND [Name] = 'HierarchyRoot' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'DB6C62F3-1B8A-4319-9075-4C1598793722' AND [Name] = 'InventoryBackOrder' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '07BED0C9-CB5F-456C-BD1A-4A5D680DF472' AND [Name] = 'InventoryCOGSReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'BFA8B662-5F63-4BB2-A52C-FA20F34A1A80' AND [Name] = 'InventoryProductReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EB8FC026-D02D-46DD-A4FE-1C3BEDBD2DD4' AND [Name] = 'Invoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B96EC1FF-9A1B-4034-85B4-51B81891854C' AND [Name] = 'Invoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D7D89F9C-DCFB-48F9-A8FA-C7CE1323D52F' AND [Name] = 'Invoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B9AEA367-A6E0-407D-9B2B-E9321FCEFAD6' AND [Name] = 'Invoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '659C78E5-1F0B-45C0-B210-FDB5E0ACF3DA' AND [Name] = 'Invoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F6E3E316-95B8-49FC-BB06-DABC0EBB2C1E' AND [Name] = 'InvoiceDistribution' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '56172510-566D-4491-96A5-15170BC66D8A' AND [Name] = 'InvoiceLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '58F1B39A-7AFE-40BD-B335-E1391ED807BE' AND [Name] = 'InvoiceLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A5454D02-5D90-4B9B-90AB-92747EB2A3DB' AND [Name] = 'InvoiceReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '837E051F-DDDD-4A61-9EB7-E3D2F6253658' AND [Name] = 'JournalEntryTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A5054594-46EE-4133-88C7-69067A3267F5' AND [Name] = 'LicenseMaster' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D8142F1C-8246-4360-844C-B28031D04A10' AND [Name] = 'LicenseMaster' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'AE25C309-3D04-485B-AFA3-98E8DD1ED9F8' AND [Name] = 'LicenseOrganization' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D8A648A7-C152-4BF1-9000-EC4E85F54312' AND [Name] = 'LicenseOrganization' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '80FF0AA5-9436-4BFD-B47A-F277C0A0E8BA' AND [Name] = 'MemorialTributeNotificationMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '6C4422FE-61EF-4BEE-AFCB-838EFA8F36CC' AND [Name] = 'MethodSet' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'DF0375BE-F4C3-4D39-8EF3-C46D6DF318A2' AND [Name] = 'MethodSet' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'B073EAEB-2C18-4400-9753-9E727254BCBD' AND [Name] = 'MethodSetDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '08C5043A-C7AD-4519-9A56-AAA00DF33F3F' AND [Name] = 'MethodSetDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'CC1B0B36-981D-424C-85BF-4BAB6E93C257' AND [Name] = 'MonetaryApplication' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '41F9813E-C419-4642-89E8-BE8A2FD360B0' AND [Name] = 'Name_FR' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '6BE6108F-0805-442C-9252-C83A27835558' AND [Name] = 'Name_FR' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '06EB9EC3-A711-4473-A87B-0D3A2DCB2676' AND [Name] = 'NavigationTreeItem' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '036C1860-26AB-4E58-B5B0-A14CAA706F27' AND [Name] = 'NRDS Sync Buttons' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '637B4D19-7FDD-4CCA-A301-221002070E2E' AND [Name] = 'Order' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0772070A-FEFB-46B7-88ED-A80CAD26F324' AND [Name] = 'Order' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A8C081C1-171B-4DAD-A0B1-9449086E41BD' AND [Name] = 'OrderAllReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '21368FE9-C106-4728-A72E-B2CAB996E398' AND [Name] = 'OrderAllReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C992E44C-0B56-4FE3-8F7E-E03278D8FCED' AND [Name] = 'OrderAllReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'ED54676F-A494-474D-AF29-FC2C16CDF054' AND [Name] = 'OrderHeaderReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D8BA6045-B5C9-45EB-BFD6-C9BF800FB364' AND [Name] = 'OrderLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'D3F6A68E-76B2-46AD-8AC8-FD8CA53D13F1' AND [Name] = 'OrderLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '58C496C7-95D4-4FF6-BBDF-1A7D9BD14388' AND [Name] = 'OrderShipTo' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '3263FBBE-53C6-4B63-8648-AC73AD5FB1F8' AND [Name] = 'OrderShipTo' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FDD14163-A577-4FC6-848C-58327BA7F293' AND [Name] = 'Organization' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '31420F3A-D971-4F98-9A0A-F5B24A635EBA' AND [Name] = 'PackageQueuePackageLog' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '845A81A6-556A-4244-BFF9-092E40A2C7C0' AND [Name] = 'Payment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '67753259-7886-45A9-853D-4BBEED82006B' AND [Name] = 'Payment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F74CBF63-B4AA-46AD-B467-54DBA1602D1F' AND [Name] = 'Payment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F6DA3FA7-9652-4BC3-A82F-7B8457BEDCBB' AND [Name] = 'Payment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '1F66C365-2D9F-490A-8E43-5480C55CE68F' AND [Name] = 'PaymentApplicationSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5E545E41-C067-4CC7-B283-6B361C2A1632' AND [Name] = 'PaymentApplicationSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '57E7E0ED-7C5D-4A2D-8285-8F910720AB11' AND [Name] = 'PaymentApplicationSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'ABD928CA-0CF4-45FE-9105-A8077B49E29F' AND [Name] = 'PaymentApplicationSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '53BB0C83-5C93-4AAA-8942-4535F195B4F7' AND [Name] = 'PaymentApplicationSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '05BE0A29-07B5-4725-8275-0A07CF0514E1' AND [Name] = 'PaymentApplicationToInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '02428846-444D-47D5-A2C9-58D392021145' AND [Name] = 'PaymentApplicationToInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'CA578D0A-1ED3-44BC-98B9-D51EFE7FA0A8' AND [Name] = 'PaymentApplicationToInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '3EF1CF6A-7D02-4F05-8C28-F8823535CF1A' AND [Name] = 'PaymentApplicationToInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '62EC836F-61B7-48BD-A73C-ED8CECFECC54' AND [Name] = 'PaymentApplicationToOrder' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '88111145-D584-4857-BB37-508AC3FD3FA0' AND [Name] = 'PaymentScheduleLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EBF49EC6-5132-414A-B570-7D9D2C57126B' AND [Name] = 'PaymentTerms' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'DFE4906D-70B9-43FE-BEFA-E60CE50058C0' AND [Name] = 'Perspective' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '923D495B-BCA6-4982-A7C0-403D82F888FD' AND [Name] = 'PostalCodeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '1A8E779E-644B-4095-B85F-5A8044DB5E54' AND [Name] = 'PostalCodeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F0545467-B9AC-4D98-91E9-DA2178FE752F' AND [Name] = 'PostalCodeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '215A23F2-D746-4CD5-ACA8-85F9E4EE7BDF' AND [Name] = 'PrefixRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '60DFFF50-DFB7-48B6-9CC3-A222DA3C8E3A' AND [Name] = 'PrefixRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '72212162-FE0F-47E3-B2F1-58D5CE140940' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '40963DC1-37C6-4F0A-9FBB-6357254521D3' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F7089B64-EE61-4B3C-953D-BBFD37DF5B2C' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0CC6A13B-0979-44F2-B509-CC253DE1E1A5' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '11F0DE43-383B-4CC3-A91C-D075B32FD775' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '20E1308D-C1FC-4077-81FB-EEF18A9FE480' AND [Name] = 'Product' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '6EBF3A2C-0E71-4DFB-BF18-27BC68FB1728' AND [Name] = 'ProductClass' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2F3AB403-0A15-4E05-98DA-5DA809C344F1' AND [Name] = 'ProductClass' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9C4ED097-B609-4440-A0CB-A4C5A82702DA' AND [Name] = 'ProductClass' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4C362A68-2517-494B-9189-5772817B24B8' AND [Name] = 'ProductDetailReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '04232A78-8297-4DD9-9423-79CAFF6883AB' AND [Name] = 'ProductDetailReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FE92F853-3DC5-4E4D-9B42-5D5162B6036E' AND [Name] = 'ProductReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '1ADCD759-0E89-43EC-AE40-06CFA6FA5A35' AND [Name] = 'ProductSet' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C2C5E2AC-90FA-47D1-B473-636A44C9AAE7' AND [Name] = 'ProductSetItem' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F8446790-F0C7-45FD-9EF8-DD468649F5CC' AND [Name] = 'ProductSetItem' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A7CEB799-1A44-4F5A-8664-E3D80F0470EE' AND [Name] = 'ProductSetItem' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '44C32B12-DDBA-4FB4-8B4D-49056D2552FD' AND [Name] = 'ProductSetTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FC0D9637-03B1-4735-AA73-22C56D41B49E' AND [Name] = 'ProductWarehouse' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A5F4C09A-63C1-4E5E-B6F8-0533FC136AC5' AND [Name] = 'RelatedJournalEntry' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '953F1423-410D-45F5-85AF-AEBA4BD3395E' AND [Name] = 'RelatedJournalEntry' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2E9E2D37-D290-4159-AA99-ED374D41BD92' AND [Name] = 'RelatedJournalEntry' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '744E4D97-7E01-4E8C-A7B5-31A4EB1F7401' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4612F7B2-1600-43F7-86AE-430C43F00BEF' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '31E735C9-CFA7-447F-B2DE-69212B91B19D' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '11ABCCDC-CDF7-476D-8762-8490DCA9C921' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '9B8ABA55-005A-4062-9840-91AFDA5E2034' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '70E57DBB-BED3-40B5-BAD7-9A0A3E2C3EAE' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '18D63DD2-A62F-4847-8530-AB669716C647' AND [Name] = 'Relationship' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A2D05F86-AEE2-4021-9183-25A2FC5DB4C3' AND [Name] = 'RelationshipCategory' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '928A1E2B-26CF-4B7F-88BF-159F87409D04' AND [Name] = 'RelationshipTypeCategory' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'E01AFD96-934A-4AED-A968-531A432E700B' AND [Name] = 'RelationshipTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4B7A9B53-EE8E-4548-900D-04115F9DB37A' AND [Name] = 'RelationshipTypeRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EA491632-F67E-4886-A3E1-C33AB2A86004' AND [Name] = 'RemittanceAppliedToOrder' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '797140F6-9BB1-4696-B6D2-04F64EA488C7' AND [Name] = 'ReportIndexReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '58543D4C-AD76-47C4-93D9-575A9EBB960D' AND [Name] = 'SalesHistory' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'A56C4930-9DF7-4A59-B667-7D919CE0760C' AND [Name] = 'SalesJournalSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '88F4DF90-28D6-4595-9240-1EE247F8CE8E' AND [Name] = 'SalesJournalSummary' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2BF68F72-4B17-4DA4-8C63-AE960D439CA5' AND [Name] = 'SalesTeamMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '064C69EA-34A9-43C3-82A5-E2A7E52F56FC' AND [Name] = 'SalesTeamMember' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '33B8868E-D1CE-4E00-9722-59C8124A5DC6' AND [Name] = 'ScheduleCommon' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'ADE80B4C-6F79-4147-BBF8-CFB39364BF92' AND [Name] = 'Shipment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '67019DD3-D23B-4794-B121-CBF935BAAA8C' AND [Name] = 'ShipmentReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '97DECD64-B6CA-455B-85DB-A2EF0A76F0D3' AND [Name] = 'ShipMethod' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '835E7981-7D77-4663-84B2-C93F31D238E5' AND [Name] = 'ShipMethodSetDetail' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '6BF19046-D23C-49E8-AA75-C7B79CF4C39E' AND [Name] = 'ShipPrice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '33917D30-59F7-4167-9F7A-3A5551F80024' AND [Name] = 'StateProvinceRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'FB5EEC69-302F-49E5-881E-C644B5EFFDEA' AND [Name] = 'StateProvinceRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '14B69C1D-C256-44B5-91A3-D8C935F5C8CA' AND [Name] = 'StateProvinceRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '96CE8514-29BA-47A8-ACD0-1A6ABD84A4A8' AND [Name] = 'SuffixRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '961D1E2E-CD01-4656-BAA8-D7820D0E4A0D' AND [Name] = 'SuffixRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0774DDA9-19A8-4ECC-95FF-AA072564CC40' AND [Name] = 'SummaryGLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'AB53C1C3-73AD-4007-8AD2-F663F0487A04' AND [Name] = 'SummaryGLTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '84BBC298-1D7F-4713-B084-107512A78BFE' AND [Name] = 'SummaryInvoicePayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '00D7E848-E93D-4307-B989-8F5DDE876217' AND [Name] = 'Supplement' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '35B15AA9-6F0C-4767-9896-9C7F3E6BE553' AND [Name] = 'TaxationReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '965DCF9D-2472-438C-B882-9E8E9969E8B3' AND [Name] = 'TaxAuthorityFinancialEntity' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '91FAB88E-F07F-4999-944B-75F8F94D1487' AND [Name] = 'TaxScheduleAuthority' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '4F59EE63-4599-419F-8886-AC2276ED4992' AND [Name] = 'TaxScheduleAuthority' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C5C4E1D8-F73F-4D7A-B9AB-D852F33DFB4E' AND [Name] = 'TaxScheduleAuthority' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '478CD9A3-4A98-4606-8BF3-75BCA0AC11BF' AND [Name] = 'TimeZoneRef' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '75F5C518-7C70-410B-AEAA-3CBDC278324B' AND [Name] = 'UnpostedOrderReport' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '453EDAC9-19C5-45EB-82E1-A55060416847' AND [Name] = 'Uom' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0ABBADCF-FA54-44CA-9706-3C84F2956263' AND [Name] = 'User' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '775D0722-0CDF-4B16-9643-3E460718D61B' AND [Name] = 'User' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5FDB2670-3272-4090-B57D-81CB95192FD8' AND [Name] = 'User' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '56E32D01-D22D-4E5E-A18E-D0286F2FA294' AND [Name] = 'User' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5A029CEC-AC0E-452C-9A44-78361E1B6AED' AND [Name] = 'WarehouseCarrierService' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '1BB7BF42-6F10-4880-8945-59A98122101D' AND [Name] = 'WorkInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '72D54AA8-6538-40E9-A1CB-5B391766B10A' AND [Name] = 'WorkInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '69F79B74-75A2-4784-8C62-B5ABFC5A8C4D' AND [Name] = 'WorkInvoice' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'EA2A099B-310A-4A50-83B9-FF9947C598FE' AND [Name] = 'WorkMonetaryApplication' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '154FE9CD-676D-416C-A25F-25A7E2FF83A4' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'AF3D7202-2E10-4D24-BB7C-6CD806225FBE' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '2EEEF1D2-299D-4E32-9EA6-6DF74B2812FF' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '73D11E8C-EACA-4BB0-B78F-96A54A9A31B5' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '1FBADFD6-3B87-4AC7-9C03-A15BA7CCC4FB' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '5054431F-9AF5-4F53-AA27-A37F31181757' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'F59A2D9D-24D9-4293-8463-EFF0346D8B37' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '82993FA5-3151-4D33-A2B7-F1E9E2121613' AND [Name] = 'WorkPayment' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '596DFB0D-28E0-4B31-AD36-0FF457D31CBE' AND [Name] = 'WorkTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '50A3CFBC-048A-48BC-86E0-566FCCD1039F' AND [Name] = 'WorkTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '3CBB29DA-A0E4-4339-882A-7459714A084A' AND [Name] = 'WorkTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'ED0C3B56-AF96-45A1-B9ED-9A109DA47FF3' AND [Name] = 'WorkTransaction' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '7C3664E8-D300-47E2-BC97-343EC0D9927C' AND [Name] = 'WorkTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '80610D9A-FC62-446B-8A67-38D9DBE3C24C' AND [Name] = 'WorkTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '823B1718-A943-4388-BD8C-889BFF0FAB1A' AND [Name] = 'WorkTransactionLine' AND InterfaceName = 'IAtom'
DELETE FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '860C38CF-177B-4C7A-B26F-F490AD65AACD' AND [Name] = 'WorkTransactionLine' AND InterfaceName = 'IAtom'
GO

--------------------------------------------------------------------
-- Delete old archived document
--------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'A5F803F0-1A48-47E7-A5C7-E3397C957DE1', 1
EXEC dbo.asi_AccessKeyDelete @accessKey = 'DC033A4F-64BB-46F9-8148-63E5DF008B8B'
GO

--------------------------------------------------------------------
-- Clean out archived & recycled versions of non-versioned documents
--------------------------------------------------------------------
IF EXISTS (SELECT [DocumentKey] FROM [dbo].[DocumentMain] d
           INNER JOIN DocumentTypeRef t on d.DocumentTypeCode = t.DocumentTypeCode
           INNER JOIN AccessArea aa ON d.AccessKey = aa.ProtectedAccessKey
           WHERE t.TrackVersionsFlag =  0 AND d.DocumentStatusCode <>  '40')
BEGIN
    IF OBJECT_ID('tempdb..#documentsToDelete') IS NOT NULL DROP TABLE #documentsToDelete;
    CREATE TABLE #documentsToDelete (DocumentKey uniqueidentifier NOT NULL)
    INSERT INTO #documentsToDelete
        SELECT [DocumentKey] 
          FROM [dbo].[DocumentMain] d
           INNER JOIN DocumentTypeRef t on d.DocumentTypeCode = t.DocumentTypeCode
           INNER JOIN AccessArea aa ON d.AccessKey = aa.ProtectedAccessKey
         WHERE t.TrackVersionsFlag =  0 AND d.DocumentStatusCode <>  '40'
    ALTER TABLE #documentsToDelete ADD CONSTRAINT PK_documentsToDelete PRIMARY KEY (DocumentKey);    
    DELETE dm 
      FROM [dbo].[DocumentMain] dm INNER JOIN #documentsToDelete d ON dm.[DocumentKey] = d.[DocumentKey]
    DELETE ur
      FROM [dbo].[UniformRegistry] ur INNER JOIN #documentsToDelete d ON ur.[UniformKey] = d.[DocumentKey]
    IF OBJECT_ID('tempdb..#documentsToDelete') IS NOT NULL DROP TABLE #documentsToDelete;
END

GO

--------------------------------------------------------------------
-- Delete unused MBRR documents
--------------------------------------------------------------------
EXEC dbo.asi_DocumentDelete 'AFEB9570-5678-4CB2-BD02-A57BC10A6BAD', 1
EXEC dbo.asi_DocumentDelete '78A434FA-4BF2-408A-BC1F-2D0529F9E354', 1
EXEC dbo.asi_DocumentDelete 'B5411D19-9466-43E7-B11C-575B3CBF08BE', 1
EXEC dbo.asi_DocumentDelete '5351732E-1189-439C-9085-ACAE3F5FF428', 1
EXEC dbo.asi_DocumentDelete '0A2253E4-CE75-42B7-BAB2-50B489631424', 1
EXEC dbo.asi_DocumentDelete '2527581F-A2EB-404A-9392-A29E4BE4004B', 1
EXEC dbo.asi_DocumentDelete 'E7DBD5D4-98D0-40C9-A2A2-126B49988662', 1

-- End of script
SET NOCOUNT OFF
GO


