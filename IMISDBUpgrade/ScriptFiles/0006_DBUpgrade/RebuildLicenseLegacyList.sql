SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO

-----------------------------------------------------------
-- script to parse licensed products string at upgrade time
-----------------------------------------------------------
DECLARE @products varchar(4000)
DECLARE @licenseKey uniqueidentifier

TRUNCATE TABLE LicenseLegacyList

SELECT @products =  cASE WHEN DATALENGTH(ShortValue) > 0 THEN ShortValue ELSE LongValue END
  FROM System_Params
 WHERE ParameterName = 'System_Control.LicensedProducts'

-- assume comma delimiter for all products, and eliminate the special case of the last license key
SET @products = REPLACE(@products, '/', ',')  -- just in case; there may be some slash-delimited CS licenses
SET @products = @products + ','

DECLARE @token varchar(50)

WHILE (DATALENGTH (@products) > 0)
BEGIN
    SET @token = SUBSTRING (@products, 1, CHARINDEX (',', @products) - 1)
    SET @products = SUBSTRING (@products, CHARINDEX (',', @products) + 1, 4000) 

    IF (DATALENGTH(@token) > 0 AND @token <> ',')
    BEGIN
        IF (CHARINDEX ('ECMADV', @token) <> 0) BEGIN SET @token = 'ECMADV' END
        IF (CHARINDEX ('ECMSIM', @token) <> 0) BEGIN SET @token = 'ECMSIM' END
        IF (CHARINDEX ('CASUAL', @token) <> 0) BEGIN SET @token = 'CASUAL' END
        IF (CHARINDEX ('ACCU',   @token) <> 0) BEGIN SET @token = 'ACCU'   END
        IF (CHARINDEX ('PROS',   @token) <> 0) BEGIN SET @token = 'PROS'   END
        IF (CHARINDEX ('CERTIFICATION', @token) <> 0) BEGIN SET @token = 'CERT' END
        IF (CHARINDEX ('RELATIONSHIPS', @token) <> 0) BEGIN SET @token = 'RELATION' END

        SET @licenseKey = NULL
        SELECT @licenseKey = LicenseKey FROM dbo.LicenseLegacyMap WHERE LegacyLicenseCode = @token

        IF NOT EXISTS (SELECT 1 FROM [dbo].[LicenseLegacyList] WHERE [LegacyLicenseCode] = @token)
        BEGIN
            INSERT [dbo].[LicenseLegacyList] ([LicenseLegacyKey], [LegacyLicenseCode])
            VALUES (ISNULL(@licenseKey, NEWID()), @token)
        END
    END
END

GO

