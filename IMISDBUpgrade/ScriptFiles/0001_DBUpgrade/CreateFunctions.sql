
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_CompareVersions]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_CompareVersions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

-- =====================================================
-- Author:		Paul Bradshaw
-- Create date: 12-Nov-2006
-- Description:	Compares two version strings
--              Returns -1 if @ver1 < @ver2
--              Returns  0 if @ver1 = @ver2
--              Returns  1 if @ver1 > @ver2
-- =====================================================
CREATE FUNCTION [dbo].[asi_CompareVersions](@ver1 nvarchar(25), @ver2 nvarchar(25)) 
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int
	DECLARE @diff int

	DECLARE @DiffTable TABLE (ID int, Diff int)

	INSERT INTO @DiffTable(ID, Diff) SELECT TOP 1 ID, Diff FROM 
	(SELECT v1.ElementID as ID, Sign(CAST(v1.Element AS int) - CAST(v2.Element AS int)) as Diff
		FROM dbo.asi_SplitString(@ver1, '.') v1 inner join 
			 dbo.asi_SplitString(@ver2, '.') v2 on v1.ElementID = v2.ElementID
	 ) AS StrDiff
	WHERE Diff <> 0 

	IF @@ROWCOUNT = 0
		SET @result = 0
	ELSE
		SELECT @result = Diff from @DiffTable

	-- Return the result of the function
	RETURN @result

END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_ConsecutiveYearsGiving]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_ConsecutiveYearsGiving]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_ConsecutiveYearsGiving](@Id varchar(10))
-- 
-- Returns the number of years of consecutive giving for the contact identified by @Id
-- 
-- First gift calendar year counts as 1. Add 1 for each consecutive cal year they make a gift. 
-- If the donor hasn’t made any gifts by the end of the cal year it 
-- drops back to 0 on Jan 1st the next year.
-- 
-- This is used by Giving Summary display
-- 
RETURNS int AS
BEGIN

DECLARE @GiftHistory TABLE
(
  [GiftYear] int,
  [Amount] money  
)

DECLARE @StartYear int
DECLARE @EndYear int
DECLARE @C int
DECLARE @Result int
DECLARE @ThisYearAmt money

SET @StartYear = 0
SET @EndYear = 0
SET @Result = 0
SET @ThisYearAmt = 0
-- Determine range of years this contact has gifts for
SELECT @StartYear = ISNULL( MIN( DATEPART( YYYY, [TransactionDate] ) ), 99), 
@EndYear = ISNULL( MAX( DATEPART( YYYY, [TransactionDate] ) ), -1)
  FROM [dbo].[vGift] 
WHERE [ID] = @Id

-- Populate table with rows for range of years
SET @C = @StartYear
WHILE @C <= @EndYear
BEGIN
    INSERT @GiftHistory( [GiftYear], [Amount]) VALUES ( @C, 0 )
    SET @C = @C + 1
END   

-- Update amount given per year   
UPDATE @GiftHistory SET Amount = 
          (SELECT ISNULL( SUM( [Amount] ), 0) 
             FROM [dbo].[vGift] 
           WHERE [ID] = @Id 
                 AND DATEPART( YYYY, [TransactionDate] ) = GiftYear)

-- Determine number of consecutive years
SET @C = @StartYear
WHILE @C <= @EndYear
BEGIN
    SELECT @ThisYearAmt = Amount 
      FROM @GiftHistory 
    WHERE [GiftYear] = @C
    IF @ThisYearAmt > 0 
    BEGIN
        SET @Result = @Result + 1
    END
    IF @ThisYearAmt <= 0 
    BEGIN
        SET @Result = 0
    END
    SET @C = @C + 1
END   

RETURN @Result
END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DatabaseVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_DatabaseVersion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

-- =====================================================
-- Author:		Paul Bradshaw
-- Create date: 12-Nov-2006
-- Description:	Returns the iMIS Database Version string
-- =====================================================
CREATE FUNCTION [dbo].[asi_DatabaseVersion](@p1 nvarchar(20))
RETURNS nvarchar(25)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @type nvarchar(20)
	DECLARE @major nvarchar(10)
	DECLARE @minor nvarchar(10)
	DECLARE @patch nvarchar(10)
	DECLARE @build nvarchar(10)
	DECLARE @version nvarchar(25)
	DECLARE @systemEntity uniqueidentifier

	SET @type = UPPER(@p1)

	SELECT @systemEntity = SystemEntityKey FROM SystemEntity WHERE SystemKeyword = 'Organization'

	SELECT @major = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Major'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @minor = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Minor'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @patch = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Patch'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @build = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Build'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity

	IF @major IS NOT NULL AND @minor IS NOT NULL AND @patch IS NOT NULL AND @build IS NOT NULL
	BEGIN
		IF @type = '' OR @type = 'VERSION'
		BEGIN
			SET @version = @major + '.' + @minor + '.' + @patch + '.' + @build
		END
		ELSE IF @type = 'NOBUILD'
		BEGIN
			SET @version = @major + '.' + @minor + '.' + @patch
		END
		ELSE IF @type = 'MAJORMINOR'
		BEGIN
			SET @version = @major + '.' + @minor
		END
		ELSE IF @type = 'MAJOR'
		BEGIN
			SET @version = @major
		END
		ELSE IF @type = 'MINOR'
		BEGIN
			SET @version = @minor
		END
		ELSE IF @type = 'PATCH'
		BEGIN
			SET @version = @patch
		END
		ELSE IF @type = 'BUILD'
		BEGIN
			SET @version = @build
		END
		
	END
	ELSE
	BEGIN
		SET @version = NULL
	END

	-- Return the result of the function
	RETURN @version

END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_DocumentPathFromHierarchyKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_DocumentPathFromHierarchyKey]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- Given a HierarchyKey returns the full path to the document starting with the root name.  The path is in
-- slash notation.  Like $/Common/Business Objects/DocumentType
CREATE FUNCTION [dbo].[asi_DocumentPathFromHierarchyKey](@hierarchyKey uniqueidentifier)
RETURNS nvarchar(4000)
AS
BEGIN
DECLARE 
   @rootHierarchyKey uniqueidentifier,
   @documentFound bit,
   @continue int,
   @path nvarchar(4000)

   SET @path = ''
   SET @documentFound = 0
   SET @continue = 1

   SELECT @rootHierarchyKey = RootHierarchyKey
     FROM Hierarchy
    WHERE HierarchyKey = @hierarchyKey

   WHILE @hierarchyKey IS NOT NULL AND @hierarchyKey <> @rootHierarchyKey AND @continue > 0
   BEGIN
      SELECT TOP 1
             @path = DocumentMain.DocumentName + CASE WHEN LEN(@path) > 0 THEN '/' + @path ELSE '' END,
             @hierarchyKey = Hierarchy.ParentHierarchyKey,
             @rootHierarchyKey = Hierarchy.RootHierarchyKey
        FROM Hierarchy INNER JOIN DocumentMain on Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
       WHERE Hierarchy.HierarchyKey = @hierarchyKey
         AND (DocumentMain.DocumentStatusCode IN (40,50))
       ORDER BY DocumentMain.CreatedOn DESC

      SET @continue = @@ROWCOUNT

      IF @documentFound = 0  
      BEGIN
         SET @documentFound = 1
         SET @path = ''
      END
   END

   SELECT @path = HierarchyRootName + CASE WHEN LEN(@path) > 0 THEN '/' + @path ELSE '' END
     FROM HierarchyRoot
    WHERE RootHierarchyKey = @rootHierarchyKey

   RETURN @path
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_Get_TransactionID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_Get_TransactionID]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE FUNCTION [dbo].[asi_Get_TransactionID](@Id varchar(10), 
@TransReq varchar(10) )
-- 
-- Returns Transaction ID of the first, last or next last iMIS transaction 
-- for the contact identified by @Id
-- 
-- Which transaction we require is identifed by the @TransReq parameter which may be one of 
-- FIRST, LAST, NEXTLAST
-- 
-- This is used by Giving Summary display
-- 
RETURNS int AS
BEGIN

DECLARE @TransId int
DECLARE @FirstTransId int
DECLARE @FirstTransDate datetime
DECLARE @LastTransId int
DECLARE @LastTransDate datetime
DECLARE @NextLastTransId int
DECLARE @NextLastTransDate datetime
SET @TransId= 0
SET @LastTransId = 0
SET @NextLastTransId = 0
SET @FirstTransId = 0


-- Summarises the vGift rows - this takes reversals and so on into account
DECLARE @Gifts TABLE
(
  [OriginalTransaction] int,
  [Amount] money,
  [MinTransDate] datetime,  
  [MaxTransDate] datetime,
  [TransDate] datetime
)

INSERT INTO @Gifts( [OriginalTransaction], [Amount],
  [MinTransDate], [MaxTransDate]  )
SELECT [OriginalTransaction], SUM([Amount]), 
       MIN( [TransactionDate] ), 
       MAX( [TransactionDate] )
  FROM [vGift] GH1 WITH(NOLOCK) 
 WHERE [ID] =  @Id
GROUP BY [OriginalTransaction]  

-- remove transactions that have been reversed out to 0
DELETE FROM @Gifts WHERE [Amount] = 0

SELECT TOP 1 @FirstTransId = [OriginalTransaction], 
             @FirstTransDate = [MinTransDate]
  FROM @Gifts
ORDER BY [MinTransDate], [OriginalTransaction]                            

SELECT TOP 1 @LastTransId = ISNULL([OriginalTransaction] ,0),
             @LastTransDate = [MaxTransDate]
  FROM @Gifts
  WHERE [OriginalTransaction] <> @FirstTransId
  AND [MaxTransDate] >= @FirstTransDate
ORDER BY [MaxTransDate] DESC, [OriginalTransaction] DESC                           

SELECT TOP 1 @NextLastTransId = ISNULL([OriginalTransaction] ,0)              
  FROM @Gifts
  WHERE [OriginalTransaction] <> @FirstTransId
  AND [OriginalTransaction] <> @LastTransId
  AND [MaxTransDate] >= @FirstTransDate
  AND [MaxTransDate] <= @LastTransDate
ORDER BY [MaxTransDate] DESC, [OriginalTransaction] DESC 

IF (@TransReq = 'LAST')  -- most recent transaction   
BEGIN
   SET @TransId = @LastTransId     
END

IF @TransReq = 'FIRST'  -- oldest transaction
BEGIN
   SET @TransId = @FirstTransId  
   
END

IF (@TransReq = 'NEXTLAST') -- next to most recent transaction
BEGIN
  SET @TransId = @NextLastTransId                                   
END

RETURN @TransId
END






GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetFullAddressText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_GetFullAddressText]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/*
This function is for generating FullAddressText with a specified FullAddress, Salutation and Formula.
It mimic behaviors of asi_ProcessFormula, but only used for FullAddress.
It is used when correspondence management needs to override user's preferred communication reason or
salutation. It is currently used from vFullAddressCorrespondenceReport.

Usage:
dbo.asi_GetFullAddressText(fullAddressKey,contactKey,physicalAddressKey,salutationKey,formula)

*/
CREATE  Function [dbo].[asi_GetFullAddressText]
		(@fullAddressKey as uniqueidentifier,
		 @contactKey as uniqueidentifier,
		 @addressKey as uniqueidentifier,
		 @salutationKey as uniqueidentifier,
		 @formula as nvarchar(500))
RETURNS nvarchar(1000)
BEGIN

  DECLARE
    @FieldName nvarchar(200),
    @FieldValue nvarchar(500),
    @output nvarchar(1000)

  SET @output = @formula

  DECLARE c_Components CURSOR FOR
  SELECT FieldName, FieldValue
    FROM dbo.asi_GetFullAddressTextComponents(@fullAddressKey,@contactKey,@addressKey,@salutationKey)

  OPEN c_Components

  FETCH NEXT FROM c_Components
   INTO @FieldName, @FieldValue
  WHILE @@FETCH_STATUS = 0 BEGIN
    IF CHARINDEX(@FieldName, @output) > 0 AND @FieldValue IS NOT NULL BEGIN
      SET @output = REPLACE(@output,'[' + @FieldName + ']', @FieldValue)
      SET @output = REPLACE(@output,'[<u>' + @FieldName + ']', UPPER(@FieldValue))
    END

    FETCH NEXT FROM c_Components
     INTO @FieldName, @FieldValue
  END

  CLOSE c_Components
  DEALLOCATE c_Components

  DECLARE
   @startIndex int,
   @endIndex int,
   @bracketStartIndex int,
   @bracketEndIndex int
  SET @startIndex = CHARINDEX('{',@output)

  while @startIndex <= LEN(@output) begin
      SET @endIndex = CHARINDEX('}',@output,@startIndex)
      IF @endIndex = 0 
        BREAK
      SET @bracketStartIndex = CHARINDEX('[',@output,@startIndex)

      IF @bracketStartIndex > 0 BEGIN
          SET @bracketEndIndex = CHARINDEX(']',@output,@bracketStartIndex)
          IF @bracketEndIndex > 0 BEGIN
            SET @output = Substring(@output,1,@startIndex-1) + Substring(@output,@endIndex + 1,LEN(@output) - @endIndex)
          END
      END
      ELSE BEGIN
        SET @output = REPLACE(REPLACE(@output,'{',''),'}','')
      END

      SET @startIndex = CHARINDEX('{',@output)
  END
  
  SET @output = REPLACE(@output,'<n>',char(13) + char(10))
  SET @output = REPLACE(@output,'<t>',char(9))

  RETURN @output
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetFullAddressTextComponents]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_GetFullAddressTextComponents]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/*
This function is called from asi_GetFullAddressText function, in order to provide key-value pairs
for all the possible replacement parts for FullAddress formula.
The returning table has two columns, FieldName and FieldValue.

Sample result
FieldName                       FieldValue
--------------------            -------------------
FirstName                       John
LastName                        Doe
Address1                        123 Washington Circle
StateProvinceCode               VA

*/
CREATE  FUNCTION [dbo].[asi_GetFullAddressTextComponents]
        (@fullAddressKey as uniqueidentifier,
         @contactKey as uniqueidentifier,
         @addressKey as uniqueidentifier,
         @salutationKey as uniqueidentifier)
RETURNS @GetFullAddressTextComponents TABLE
        (FieldName nvarchar(200), FieldValue nvarchar(500))
AS
BEGIN

  Declare
    @AdditionalLine1 nvarchar(50),
    @AdditionalLine2 nvarchar(50),
    @FullAddressDesc nvarchar(20),
    @FormattedAddress nvarchar(300),
    @AddresseeText nvarchar(1000),
    @IsAddresseeOverridden bit,
    @IsPhysicalAddress bit,
    @Address1 nvarchar(50),
    @Address2 nvarchar(50),
    @Address3 nvarchar(50),
    @City nvarchar(50),
    @StateProvinceCode nvarchar(5),
    @PostalCode nvarchar(20),
    @CountryName nvarchar(50),
    @Region nvarchar(50),
    @CountryCode nchar(2),
    @SalutationText nvarchar(500),
    @ID nvarchar(10),
    @SortName nvarchar(110),
    @FullName nvarchar(110),
    @IsInstitute bit,
    @InstituteName nvarchar(80),
    @PrefixCode nvarchar(10),
    @FirstName nvarchar(20),
    @MiddleName nvarchar(20),
    @LastName nvarchar(30),
    @SuffixCode nvarchar(10),
    @Designation nvarchar(20),
    @Informal nvarchar(20),
    @PrimaryInstituteName nvarchar(80),
    @PrimaryInstituteTitle nvarchar(80)

  SELECT @AdditionalLine1 = AdditionalLine1,
         @AdditionalLine2 = AdditionalLine2,
         @FullAddressDesc = FullAddressDesc,
         @AddresseeText = AddresseeText,
         @IsAddresseeOverridden = IsAddresseeOverridden
    FROM FullAddress
  WHERE FullAddressKey = @fullAddressKey

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('AdditionalLine1',@AdditionalLine1)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('AdditionalLine2',@AdditionalLine1)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('FullAddressDesc',@FullAddressDesc)

  SELECT @FormattedAddress = FormattedAddress,
         @IsPhysicalAddress = IsPhysicalAddress
    FROM AddressMain
   WHERE AddressKey = @addressKey

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('FormattedAddress',@FormattedAddress)

  IF @IsPhysicalAddress = 1 BEGIN
   SELECT @Address1 = Address1,
          @Address2 = Address2,
          @Address3 = Address3,
          @City = City,
          @StateProvinceCode = StateProvinceCode,
          @PostalCode = PostalCode,
          @Region = Region,
          @CountryCode = a.CountryCode,
          @CountryName = b.CountryName
     FROM PhysicalAddress a LEFT OUTER JOIN CountryRef b
       ON a.CountryCode = b.CountryCode

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('Address1',@Address1)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('Address2',@Address2)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('Address3',@Address3)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('City',@City)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('StateProvinceCode',@StateProvinceCode)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('PostalCode',@PostalCode)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('Region',@Region)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('CountryCode',@CountryCode)

   INSERT INTO @GetFullAddressTextComponents
   VALUES ('CountryName',@CountryName)

  END

  SELECT @SalutationText = SalutationText
    FROM ContactSalutation
   WHERE ContactKey = @contactKey
     AND SalutationKey = @salutationKey

  INSERT INTO @GetFullAddressTextComponents
  VALUES ('SalutationText',@SalutationText)

  IF @IsAddresseeOverridden = 1 BEGIN
   INSERT INTO @GetFullAddressTextComponents
   VALUES ('AddreseeText',@AddresseeText)
  END
  ELSE BEGIN
   INSERT INTO @GetFullAddressTextComponents
   VALUES ('AddreseeText',@SalutationText)
  END

  SELECT @ID = ID,
         @SortName = SortName,
         @FullName = FullName,
         @IsInstitute = IsInstitute
    FROM ContactMain
   WHERE ContactKey = @contactKey

  INSERT INTO @GetFullAddressTextComponents
  VALUES ('ID',@ID)

  INSERT INTO @GetFullAddressTextComponents
  VALUES ('SortName',@SortName)

  INSERT INTO @GetFullAddressTextComponents
  VALUES ('FullName',@FullName)

  IF @IsInstitute = 1 BEGIN
    SELECT @InstituteName = InstituteName
      FROM Institute
     WHERE ContactKey = @contactKey

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('InstituteName',@InstituteName)
  END
  ELSE BEGIN
    SELECT @PrefixCode = PrefixCode,
           @FirstName = FirstName,
           @MiddleName = MiddleName,
           @LastName = LastName,
           @SuffixCode = SuffixCode,
           @Designation = Designation,
           @Informal = Informal,
           @PrimaryInstituteName = PrimaryInstituteName,
           @PrimaryInstituteTitle = PrimaryInstituteTitle
      FROM Individual
     WHERE ContactKey = @contactKey

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('PrefixCode',@PrefixCode)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('FirstName',@FirstName)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('MiddleName',@MiddleName)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('LastName',@LastName)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('SuffixCode',@SuffixCode)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('Designation',@Designation)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('Informal',@Informal)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('PrimaryInstituteName',@PrimaryInstituteName)

    INSERT INTO @GetFullAddressTextComponents
    VALUES ('PrimaryInstituteTitle',@PrimaryInstituteTitle)
  END

  RETURN
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetWorkflowInstanceLockDuration]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_GetWorkflowInstanceLockDuration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create function [dbo].[asi_GetWorkflowInstanceLockDuration]()
 returns int
as
begin
declare @duration int

select  @duration = convert(int, ParameterValue)
 from	SystemConfig
 where	ParameterName = 'WorkflowInstanceLockDuration'

if @duration is null
   set @duration = 30

return(@duration)
end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GetWorkItemLockDuration]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_GetWorkItemLockDuration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create function [dbo].[asi_GetWorkItemLockDuration]()
 returns int
as
begin
declare @duration int

select  @duration = convert(int, ParameterValue)
 from	SystemConfig
 where	ParameterName = 'WorkItemLockDuration'

if @duration is null
   set @duration = 10

return(@duration)
end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_GivingStatistics]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_GivingStatistics]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_GivingStatistics]( @Id varchar(10), 
@StatReq varchar(10) )
--
-- Returns key giving Statistics for the contact identified by @Id
-- the statistic required are identified by the @StatReq parameter 
-- which can be one of:
-- 
--  AVG - average gift value 
--  MIN - Minimum gift amout 
--  MAX - Maximum gift amount
--  COUNT - Count of gifts made
--  SUM - Sum of gift made
--
-- This is used by Giving Summary display
--
-- The calculations are based on vGift but due to the fact that multiple rows can 
-- be returned for one original gift (e.g. in the case of reversals) this function
-- is needed as SQL Server does not allow an aggregate function (e.g. MIN) on an 
-- expression containing an aggregate or a subquery (e.g. SUM(amount))
--
RETURNS money AS
BEGIN

DECLARE @Result money
SET @Result = 0

DECLARE @Gifts TABLE
(
  [OriginalTransaction] int,
  [Amount] money  
)

INSERT INTO @Gifts( [OriginalTransaction], [Amount]  )
SELECT [OriginalTransaction], SUM([Amount])
FROM [vGift] GH1 WITH(NOLOCK) 
WHERE [ID] =  @Id
GROUP BY [OriginalTransaction]

IF @StatReq = 'AVG'
BEGIN
  SELECT @Result = (SELECT AVG([Amount] ) FROM @Gifts WHERE [Amount] <> 0 )
END

IF @StatReq = 'MIN'
BEGIN
  SELECT @Result = (SELECT MIN(ISNULL([Amount],0) ) FROM @Gifts WHERE [Amount] <> 0 )
END

IF @StatReq = 'MAX'
BEGIN
  SELECT @Result = (SELECT MAX([Amount] ) FROM @Gifts WHERE [Amount] <> 0 )
END

IF @StatReq = 'COUNT'
BEGIN
  SELECT @Result = (SELECT COUNT( * ) FROM @Gifts WHERE [Amount] <> 0 )
END

IF @StatReq = 'SUM'
BEGIN
  SELECT @Result = (SELECT SUM([Amount] ) FROM @Gifts)
END

RETURN @Result
END



GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_IsColumnIdentity]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_IsColumnIdentity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION [dbo].[asi_IsColumnIdentity](@tableName varchar(100), @columnName nvarchar(100))
RETURNS bit
AS
BEGIN
      -- Declare the return variable here
      DECLARE @Result bit;
      IF EXISTS (SELECT 1
                   FROM INFORMATION_SCHEMA.COLUMNS
                  WHERE COLUMNPROPERTY(OBJECT_ID(QUOTENAME([TABLE_SCHEMA]) + '.' + QUOTENAME([TABLE_NAME])), [COLUMN_NAME], 'IsIdentity') = 1
                        AND [TABLE_NAME] = @tableName and [COLUMN_NAME] = @columnName)
            SET @Result = 1
      ELSE
            SET @Result = 0
      RETURN @Result;
END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PublishedChildDocumentsByDocumentKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_PublishedChildDocumentsByDocumentKey]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_PublishedChildDocumentsByDocumentKey](@documentVersionKey uniqueidentifier)
RETURNS @tblArray TABLE ( [DocumentVersionKey] uniqueidentifier, 
                          [Title] nvarchar(100), 
                          [DocumentTypeCode] nvarchar(3), 
                          [CreatedOn] datetime, 
                          [CreatedByUserKey] uniqueidentifier, 
                          [HierarchyKey] uniqueidentifier, 
                          [Level] int
   )
AS
BEGIN
    -- Get ParentHierarchyKey
    DECLARE @parentHierarchyKey uniqueidentifier
    SELECT @parentHierarchyKey = h.[HierarchyKey]
      FROM [dbo].[DocumentMain] d
           INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
     WHERE d.[DocumentVersionKey] = @documentVersionKey 
           AND d.DocumentStatusCode = 40

    ;WITH ChildDocuments ([DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level])
    AS
    (
    -- Anchor member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                0 AS [Level]
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
          WHERE h.[ParentHierarchyKey] = @parentHierarchyKey
                AND d.DocumentStatusCode = 40
        UNION ALL
    -- Recursive member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                [Level] + 1
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
                INNER JOIN ChildDocuments AS c ON h.ParentHierarchyKey = c.HierarchyKey
          WHERE d.[DocumentStatusCode] = 40
    )
    -- Statement that executes the CTE
    INSERT INTO @tblArray
    SELECT [DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level]
      FROM ChildDocuments
    RETURN
END



GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PublishedChildDocumentsByDocumentKeyAndType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_PublishedChildDocumentsByDocumentKeyAndType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_PublishedChildDocumentsByDocumentKeyAndType](@documentVersionKey uniqueidentifier, @documentTypeCode nvarchar(3))
RETURNS @tblArray TABLE ( [DocumentVersionKey] uniqueidentifier, 
                          [Title] nvarchar(100), 
                          [DocumentTypeCode] nvarchar(3), 
                          [CreatedOn] datetime, 
                          [CreatedByUserKey] uniqueidentifier, 
                          [HierarchyKey] uniqueidentifier, 
                          [Level] int
   )
AS
BEGIN
    -- Get ParentHierarchyKey
    DECLARE @parentHierarchyKey uniqueidentifier
    SELECT @parentHierarchyKey = h.[HierarchyKey]
      FROM [dbo].[DocumentMain] d
           INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
     WHERE d.[DocumentVersionKey] = @documentVersionKey 
           AND d.DocumentStatusCode = 40

    ;WITH ChildDocuments ([DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level])
    AS
    (
    -- Anchor member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                0 AS [Level]
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
          WHERE h.[ParentHierarchyKey] = @parentHierarchyKey
                AND d.DocumentStatusCode = 40
        UNION ALL
    -- Recursive member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                [Level] + 1
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
                INNER JOIN ChildDocuments AS c ON h.ParentHierarchyKey = c.HierarchyKey
          WHERE d.[DocumentStatusCode] = 40
    )
    -- Statement that executes the CTE
    INSERT INTO @tblArray
    SELECT [DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level]
      FROM ChildDocuments
     WHERE DocumentTypeCode = @documentTypeCode
    RETURN
END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PublishedCommunitiesByDocumentKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_PublishedCommunitiesByDocumentKey]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_PublishedCommunitiesByDocumentKey](@documentKey uniqueidentifier)
RETURNS @tblArray TABLE ( [DocumentVersionKey] uniqueidentifier, 
                          [Title] nvarchar(100), 
                          [DocumentTypeCode] nvarchar(3), 
                          [CreatedOn] datetime, 
                          [CreatedByUserKey] uniqueidentifier, 
                          [HierarchyKey] uniqueidentifier, 
                          [Level] int
   )
AS
BEGIN
    -- Get ParentHierarchyKey
    DECLARE @parentHierarchyKey uniqueidentifier
    SELECT @parentHierarchyKey = h.[ParentHierarchyKey]
      FROM [dbo].[DocumentMain] d
           INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
     WHERE d.[DocumentVersionKey] = @documentKey 
           AND d.DocumentTypeCode = 'CTY' 
           AND d.DocumentStatusCode = 40

    ;WITH ChildDocuments ([DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level])
    AS
    (
    -- Anchor member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                0 AS [Level]
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
          WHERE h.[ParentHierarchyKey] = @parentHierarchyKey
                AND d.DocumentStatusCode = 40
        UNION ALL
    -- Recursive member definition
         SELECT d.[DocumentVersionKey], 
                CASE WHEN d.[AlternateName] IS NULL OR d.[AlternateName] = '' THEN d.[DocumentName] ELSE d.[AlternateName] END AS [Title], 
                d.[DocumentTypeCode],
                d.[CreatedOn], 
                d.[CreatedByUserKey], 
                h.[HierarchyKey],
                [Level] + 1
           FROM [dbo].[DocumentMain] d
                INNER JOIN [dbo].[Hierarchy] h ON d.[DocumentVersionKey] = h.[UniformKey]
                INNER JOIN ChildDocuments AS c ON h.ParentHierarchyKey = c.HierarchyKey
          WHERE d.[DocumentStatusCode] = 40
    )
    -- Statement that executes the CTE
    INSERT INTO @tblArray
    SELECT [DocumentVersionKey], [Title], [DocumentTypeCode], [CreatedOn], [CreatedByUserKey], [HierarchyKey], [Level]
      FROM ChildDocuments
    RETURN
END




GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_PublishedDocumentPath]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_PublishedDocumentPath]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- given a DocumentKey or a DocumentVersionKey, gets the first path to it (there should be only one)
CREATE FUNCTION [dbo].[asi_PublishedDocumentPath](@key uniqueidentifier)
RETURNS nvarchar(4000)
AS
BEGIN
   DECLARE @hierarchyKey uniqueidentifier
   DECLARE @rootHierarchyKey uniqueidentifier
   DECLARE @documentName nvarchar(100)
   DECLARE @path nvarchar(4000)

   SELECT TOP 1 @hierarchyKey = Hierarchy.HierarchyKey,
          @documentName = DocumentName, @rootHierarchyKey = Hierarchy.RootHierarchyKey
     FROM Hierarchy inner join HierarchyRoot on Hierarchy.RootHierarchyKey = HierarchyRoot.RootHierarchyKey
          inner join DocumentMain on Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
    WHERE (DocumentMain.DocumentKey = @key
       OR Hierarchy.UniformKey = @key)
      AND (DocumentMain.DocumentStatusCode IN (40,50))
    ORDER BY DocumentMain.CreatedOn DESC

   IF @@ROWCOUNT > 0
   BEGIN
      SELECT @path =  [dbo].[asi_DocumentPathFromHierarchyKey](@hierarchyKey)
      IF @hierarchyKey <> @rootHierarchyKey
         SET @path = @path + '/' + @documentName      
   END

   RETURN @path
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_SplitString]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION dbo.asi_SplitString ( 
		@vcDelimitedString varchar(8000),
		@vcDelimiter varchar(100) )
/**************************************************************************
DESCRIPTION: 
		Accepts a delimited string and splits it at the specified
		delimiter points.  Returns the individual items as a table data
		type with the ElementID field as the array index and the Element
		field as the data

PARAMETERS:
		@vcDelimitedString		- The string to be split
		@vcDelimiter			- String containing the delimiter where
								  delimited string should be split

RETURNS:
		Table data type containing array of strings that were split with
		the delimiters removed from the source string

USAGE:
		SELECT ElementID, Element 
		FROM asi_SplitString('11111,22222,3333', ',') 
		ORDER BY ElementID

***************************************************************************/
RETURNS @tblArray TABLE 
   (
	ElementID smallint IDENTITY(1,1),
   	Element varchar(1000)
   )
AS
BEGIN

	DECLARE @siIndex smallint
	DECLARE @siStart smallint
	DECLARE @siDelSize smallint

	SET @siDelSize	= LEN(@vcDelimiter)
	--loop through source string and add elements to destination table array
	WHILE LEN(@vcDelimitedString) > 0
	BEGIN
		SET @siIndex = CHARINDEX(@vcDelimiter, @vcDelimitedString)
		IF @siIndex = 0
		BEGIN
			INSERT INTO @tblArray VALUES(@vcDelimitedString)
			BREAK
		END
		ELSE
		BEGIN
			INSERT INTO @tblArray VALUES(SUBSTRING(@vcDelimitedString, 1,@siIndex - 1))
			SET @siStart = @siIndex + @siDelSize
			SET @vcDelimitedString = SUBSTRING(@vcDelimitedString, @siStart , LEN(@vcDelimitedString) - @siStart + 1)
		END
	END

	RETURN
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asi_StripParens]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[asi_StripParens]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE FUNCTION [dbo].[asi_StripParens](@string nvarchar(4000))
     RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @result nvarchar(4000)
	DECLARE @count int
	SET @count = 0
    SET @result = LTRIM(RTRIM(@string))
    WHILE (LEFT(@result, 1)='(' OR LEFT(@result,1)='''') 
	BEGIN
		SET @result = SUBSTRING(@result, 2, LEN(@result) - 1)
		SET @count = @count + 1
	END
	IF (LEN(@result) - @count) <= 0
		SET @result = ''''''
	ELSE
		SET @result = LEFT(@result, LEN(@result) - @count)
    RETURN @result 
END


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CalculateDeferralConversionAmount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[CalculateDeferralConversionAmount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE     FUNCTION [dbo].[CalculateDeferralConversionAmount]
  (@invDate datetime, @amountDeferred decimal(18,4), @totalAmount decimal(18,4), @amountConverted decimal(18,4),
	@termsCount int, @termsEffectiveCount int, @termsType int, @termsDuration int, @effectiveDate datetime)
RETURNS decimal(18,4) 
AS
BEGIN
DECLARE @amountToConvert decimal(18,4)
DECLARE @amountEligibleForConversion decimal(18,4)
DECLARE @amountPerInterval decimal(18,4)
DECLARE @intervalsPassed int
DECLARE @termsTypeYearly int
DECLARE @termsTypeQuarterly int
DECLARE @termsTypeMonthly int
DECLARE @termsTypeWeekly int
DECLARE @termsTypeDaily int
DECLARE @termsTypeEvent int
DECLARE @monthsPassed int
DECLARE @invDateDay int
DECLARE @effectiveDateDay int
DECLARE @dayAfterEffectiveDate int
DECLARE @decimalPlaces int

IF @amountConverted >= @totalAmount
	RETURN 0

IF @termsCount = 0
	RETURN 0

SET @termsTypeYearly = 0
SET @termsTypeQuarterly = 1
SET @termsTypeMonthly = 2
SET @termsTypeWeekly = 3
SET @termsTypeDaily = 4
SET @termsTypeEvent = 5

-- TODO: change the Currency table (or some similar mechanism) to carry the
-- number of decimal places to use when rounding.
SET @decimalPlaces = 2

SET @amountPerInterval = ROUND(@totalAmount / @termsCount, @decimalPlaces)

IF @termsType = @termsTypeYearly
	SET @intervalsPassed = DATEDIFF(Day, @invDate, @effectiveDate) / 365
ELSE IF @termsType = @termsTypeWeekly
	SET @intervalsPassed = DATEDIFF(Day, @invDate, @effectiveDate) / 7
ELSE IF @termsType = @termsTypeDaily
	SET @intervalsPassed = DATEDIFF(Day, @invDate, @effectiveDate)
ELSE IF @termsType = @termsTypeEvent
	SET @intervalsPassed = @termsEffectiveCount
ELSE
BEGIN	/* Either monthly or quarterly - deal with leap year issues... */
	SET @invDateDay = DATEPART(day, @invDate)
	SET @effectiveDateDay = DATEPART(day, @effectiveDate)
	SET @monthsPassed = DATEDIFF(Month, @invDate, @effectiveDate)
	IF @effectiveDateDay < @invDateDay
	BEGIN	/* If the invoice date day is on a day that equals the end of the month
		day of the effective date, let the months passed stay adjusted upward...
		(for example, if the invoice date is 1/30/04, and the effective date is
		2/29/04, we want this to show as a month passed...) */
		SET @dayAfterEffectiveDate = DATEPART(day, DATEADD(day, 1, @effectiveDate))
		IF @dayAfterEffectiveDate > @effectiveDateDay
			SET @monthsPassed = @monthsPassed - 1  /* (the effective date day is not the end of	
								a month - otherwise day after would be the first
								day of following month = 1, which < the previous day) */
	END
		
	IF @termsType = @termsTypeMonthly
		SET @intervalsPassed = @monthsPassed
	ELSE IF @termsType = @termsTypeQuarterly
		SET @intervalsPassed = @monthsPassed / 3
END

/* The first interval should actually take place ON @invDate...: */
IF @termsType != @termsTypeEvent
	SET @intervalsPassed = @intervalsPassed + 1

IF @intervalsPassed >= @termsCount
	RETURN @totalAmount - @amountConverted

SET @amountEligibleForConversion = @amountPerInterval * @intervalsPassed
IF @amountEligibleForConversion > @amountDeferred
	SET @amountEligibleForConversion = @amountDeferred
IF @amountConverted >= @amountEligibleForConversion
	SET @amountToConvert = 0
ELSE
	SET @amountToConvert = @amountEligibleForConversion - @amountConverted
RETURN @amountToConvert
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CalculateFiscalPeriod]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[CalculateFiscalPeriod]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE   FUNCTION [dbo].[CalculateFiscalPeriod]
  (@transDate datetime, @firstMonthFiscalYear int)
RETURNS int
AS
BEGIN
DECLARE @fiscalMonth int
DECLARE @fiscalYear int
DECLARE @transMonth int
DECLARE @transYear int
DECLARE @fiscalPeriod char(6)
SET @transMonth = DATEPART(m, @transDate)
SET @transYear = DATEPART(yyyy, @transDate)
IF @firstMonthFiscalYear = 0
	SET @firstMonthFiscalYear = 1
IF @firstMonthFiscalYear = 1
BEGIN
	SET @fiscalMonth = @transMonth
	SET @fiscalYear = @transYear
END
ELSE IF @firstMonthFiscalYear <= @transMonth
BEGIN
	SET @fiscalMonth = @transMonth - @firstMonthFiscalYear + 1
	SET @fiscalYear = @transYear + 1
END
ELSE
BEGIN
	SET @fiscalMonth = 13 - @firstMonthFiscalYear + @transMonth
	SET @fiscalYear = @transYear
END
IF @fiscalMonth < 10
	SET @fiscalPeriod = CAST(@fiscalYear as char(4)) + '0' + CAST(@fiscalMonth as char(1))
ELSE
	SET @fiscalPeriod =  CAST(@fiscalYear as char(4)) + CAST(@fiscalMonth as char(2))
RETURN CAST(@fiscalPeriod as int)
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_CompareVersions]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_CompareVersions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =====================================================
-- Author:		Paul Bradshaw
-- Create date: 12-Nov-2006
-- Description:	Compares two version strings
--              Returns -1 if @ver1 < @ver2
--              Returns  0 if @ver1 = @ver2
--              Returns  1 if @ver1 > @ver2
-- =====================================================
CREATE FUNCTION [dbo].[fn_asi_CompareVersions](@ver1 nvarchar(25), @ver2 nvarchar(25)) 
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int
	DECLARE @diff int

	DECLARE @DiffTable TABLE (ID int, Diff int)

	INSERT INTO @DiffTable(ID, Diff) SELECT TOP 1 ID, Diff FROM 
	(SELECT v1.ElementID as ID, Sign(CAST(v1.Element AS int) - CAST(v2.Element AS int)) as Diff
		FROM dbo.asi_SplitString(@ver1, '.') v1 inner join 
			 dbo.asi_SplitString(@ver2, '.') v2 on v1.ElementID = v2.ElementID
	 ) AS StrDiff
	WHERE Diff <> 0 

	IF @@ROWCOUNT = 0
		SET @result = 0
	ELSE
		SELECT @result = Diff from @DiffTable

	-- Return the result of the function
	RETURN @result

END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_convert_foreign_chars]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_convert_foreign_chars]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  UserDefinedFunction dbo.fn_asi_convert_foreign_chars  ******/

CREATE function dbo.fn_asi_convert_foreign_chars(@inchar varchar(1))
returns varchar(1)
as 
begin
	declare @outchar varchar(1)

	if ascii(@inchar)<128
	begin
		-- not in extended ascii character set, just return it
		return @inchar
	end

	select @outchar =
	case ascii(@inchar)
		when ascii('À') then 'A'
		when ascii('Á') then 'A'
		when ascii('Â') then 'A'
		when ascii('Ã') then 'A'
		when ascii('Ä') then 'A'
		when ascii('Å') then 'A'
		when ascii('Æ') then 'A'
		when ascii('Ç') then 'C'
		when ascii('È') then 'E'
		when ascii('É') then 'E'
		when ascii('Ê') then 'E'
		when ascii('Ë') then 'E'
		when ascii('Ì') then 'I'
		when ascii('Í') then 'I'
		when ascii('Î') then 'I'
		when ascii('Ï') then 'I'
		when ascii('Ð') then 'D'
		when ascii('Ñ') then 'N'
		when ascii('Ò') then 'O'
		when ascii('Ó') then 'O'
		when ascii('Ô') then 'O'
		when ascii('Õ') then 'O'
		when ascii('Ö') then 'O'
		when ascii('×') then 'x'
		when ascii('Ø') then 'O'
		when ascii('Ù') then 'U'
		when ascii('Ú') then 'U'
		when ascii('Û') then 'U'
		when ascii('Ü') then 'U'
		when ascii('Ý') then 'Y'
		when ascii('Þ') then 'P'
		when ascii('ß') then 's'
		when ascii('à') then 'a'
		when ascii('á') then 'a'
		when ascii('â') then 'a'
		when ascii('ã') then 'a'
		when ascii('ä') then 'a'
		when ascii('å') then 'a'
		when ascii('æ') then 'a'
		when ascii('ç') then 'c'
		when ascii('è') then 'e'
		when ascii('é') then 'e'
		when ascii('ê') then 'e'
		when ascii('ë') then 'e'
		when ascii('ì') then 'i'
		when ascii('í') then 'i'
		when ascii('î') then 'i'
		when ascii('ï') then 'i'
		when ascii('ð') then 'o'
		when ascii('ñ') then 'n'
		when ascii('ò') then 'o'
		when ascii('ó') then 'o'
		when ascii('ô') then 'o'
		when ascii('õ') then 'o'
		when ascii('ö') then 'o'
		when ascii('ø') then 'o'
		when ascii('ù') then 'u'
		when ascii('ú') then 'u'
		when ascii('û') then 'u'
		when ascii('ü') then 'u'
		when ascii('ý') then 'y'
		when ascii('þ') then 'b'
		when ascii('ÿ') then 'y'
		else ''
	end

	return @outchar

end


GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_convert_foreign_string]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_convert_foreign_string]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  UserDefinedFunction dbo.fn_asi_convert_foreign_string  ******/
 create function dbo.fn_asi_convert_foreign_string(@instring varchar(2000))
 returns varchar(2000)
 as
 begin
 	declare @i int
 	declare @str_len int
 	declare @outstring varchar(2000)
 	set @str_len = len(@instring)
 	set @i = 1
 	set @outstring = ''
 	while @i <= @str_len
 	begin
 		set @outstring = @outstring + dbo.fn_asi_convert_foreign_chars(substring(@instring,@i,1))
 		set @i = @i + 1
 	end
 	return @outstring
 end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_DatabaseVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_DatabaseVersion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =====================================================
-- Author:		Paul Bradshaw
-- Create date: 12-Nov-2006
-- Description:	Returns the iMIS Database Version string
-- =====================================================
CREATE FUNCTION [dbo].[fn_asi_DatabaseVersion](@p1 nvarchar(20))
RETURNS nvarchar(25)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @type nvarchar(20)
	DECLARE @major nvarchar(10)
	DECLARE @minor nvarchar(10)
	DECLARE @patch nvarchar(10)
	DECLARE @build nvarchar(10)
	DECLARE @version nvarchar(25)
	DECLARE @systemEntity uniqueidentifier

	SET @type = UPPER(@p1)

	SELECT @systemEntity = SystemEntityKey FROM SystemEntity WHERE SystemKeyword = 'Organization'

	SELECT @major = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Major'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @minor = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Minor'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @patch = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Patch'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity
	SELECT @build = ParameterValue FROM SystemConfig WHERE ParameterName = 'System.Database.Version.Build'
		AND OrganizationKey = '00000000-0000-0000-0000-000000000000' AND SystemEntityKey = @systemEntity

	IF @major IS NOT NULL AND @minor IS NOT NULL AND @patch IS NOT NULL AND @build IS NOT NULL
	BEGIN
		IF @type = '' OR @type = 'VERSION'
		BEGIN
			SET @version = @major + '.' + @minor + '.' + @patch + '.' + @build
		END
		ELSE IF @type = 'NOBUILD'
		BEGIN
			SET @version = @major + '.' + @minor + '.' + @patch
		END
		ELSE IF @type = 'MAJORMINOR'
		BEGIN
			SET @version = @major + '.' + @minor
		END
		ELSE IF @type = 'MAJOR'
		BEGIN
			SET @version = @major
		END
		ELSE IF @type = 'MINOR'
		BEGIN
			SET @version = @minor
		END
		ELSE IF @type = 'PATCH'
		BEGIN
			SET @version = @patch
		END
		ELSE IF @type = 'BUILD'
		BEGIN
			SET @version = @build
		END
		
	END
	ELSE
	BEGIN
		SET @version = NULL
	END

	-- Return the result of the function
	RETURN @version

END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_generate_login]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_generate_login]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  UserDefinedFunction dbo.fn_asi_generate_login    Script Date: 05/30/2006 15:25:13 ******/
 create function dbo.fn_asi_generate_login(@ID varchar(10))
 returns varchar(60)
 as 
 begin
 DECLARE @outstring varchar(60)
 SELECT @outstring = LEFT(isnull(a.FIRST_NAME,''),1) + isnull(a.LAST_NAME,'') + a.ID
 FROM Name a, Name_Security b
 WHERE a.ID = b.ID
   AND a.ID = @ID
 SET @outstring = UPPER(dbo.fn_asi_convert_foreign_string(@outstring))
 return @outstring
 end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_GetCompanySort]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_GetCompanySort]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Function dbo.fn_asi_GetCompanySort  ******/
 -- =============================================
 -- This function takes CompanyName and calculates CompanySort 
 -- depending on the defined rules. 
 -- Default rules are:
 -- - Remove foreign characters
 -- - Uppercase the string
 -- - Remove leading words ("The ", "Le ", "La ", "L'")
 -- =============================================
 create function dbo.fn_asi_GetCompanySort(@CompanyName varchar(80))
      returns varchar(30) 
  AS
  BEGIN
  	
  	DECLARE @Sort varchar(80),
 		@CompanySort varchar(30),
          @PrefixList varchar(2000),
  		@SimpleSort varchar(80),
  		@FirstWord varchar(80),
         	@EndPosSpace int,
  		@EndPosQuote int,
  		@Pos int,
  		@EndPos int
  	-- get the prefix list
      SELECT @PrefixList = CASE WHEN Len(ShortValue) > 0 THEN ShortValue 
  						 ELSE LongValue END
      	FROM System_Params
  		WHERE ParameterName = 'System_Control.CompanySortPrefixes'
 	IF @PrefixList IS NULL 
 		SET @PrefixList = ''
  	IF LEN(@PrefixList) = 0
  		SET @PrefixList = ' THE '
  	ELSE
  		SET @PrefixList = UPPER(@PrefixList)
  	IF RIGHT(@PrefixList,1) <> ' ' 
  		SET @PrefixList = @PrefixList + ' '
  	IF LEFT(@PrefixList,1) <> ' '
  		SET @PrefixList = ' ' + @PrefixList
  	-- DEBUG SELECT 'PrefixList=' + @PrefixList
  	-- Prepare the sort
      -- Strip out foreign characters and other chars not needed
      SET @SimpleSort = RTRIM(LTRIM(UPPER(dbo.fn_asi_convert_foreign_string(@CompanyName))))
  	SET @SimpleSort = REPLACE(@SimpleSort,CHAR(10),' ')
  	SET @SimpleSort = REPLACE(@SimpleSort,CHAR(13),' ')
  	SET @Sort = @SimpleSort
  	-- Get the first word or prefix from the company name
  	SET @EndPosSpace = CHARINDEX(' ',@Sort)
  	IF @EndPosSpace = 0
  		SET @EndPosSpace = LEN(@Sort)
  	SET @EndPosQuote = CHARINDEX('''',@Sort)
  	IF @EndPosQuote = 0
  		SET @EndPosQuote = LEN(@Sort)
  	-- if it is a quote, we need to keep the quote in the string
  	IF @EndPosSpace < @EndPosQuote
  		SET @EndPos = @EndPosSpace-1
  	ELSE
  		SET @EndPos = @EndPosQuote
  	-- now see if the first word or prefix is in the prefix list
  	SET @FirstWord = SUBSTRING(@Sort,1,@EndPos)	
  	SET @Pos = CHARINDEX(' ' + @FirstWord + ' ',@PrefixList)
  	IF CHARINDEX(' ' + @FirstWord + ' ',@PrefixList)>0
  	BEGIN
  		-- The Company Sort starts with one of the words in the list
  		SET @Sort = LTRIM(SUBSTRING(@Sort,@EndPos+1,LEN(@Sort)))
  	END
  	-- if after removing the unwanted words we are left with nothing, keep
  	-- the original
  	IF @Sort=''
  		SET @Sort = @SimpleSort
  	SET @CompanySort = LEFT(LTRIM(@Sort), 30)
  	return @CompanySort 
 END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_GetDupMatchKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_GetDupMatchKey]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Function dbo.fn_asi_GetDupMatchKey  ******/
 -- =============================================
 -- This stored procedure calculates the Name.DUP_MATCH_KEY value - update the formula as required
 -- =============================================
 create function dbo.fn_asi_GetDupMatchKey(@Id varchar(10))
 returns varchar(20)
 as
 begin
 	declare @DupMatchKey varchar(20)
 	select @DupMatchKey = UPPER(dbo.fn_asi_convert_foreign_string(SUBSTRING(Name.ZIP,1,5) + (CASE WHEN Name.LAST_NAME<>'' THEN (SUBSTRING(Name.LAST_NAME,1,4) + SUBSTRING(Name.FIRST_NAME,1,1)) ELSE SUBSTRING(Name.COMPANY,1,5) END))) from Name where ID=@Id
 	
 	return @DupMatchKey
 end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_GetFullName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_GetFullName]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION dbo.fn_asi_GetFullName(
     @FirstName varchar(20) = NULL,
     @MiddleName varchar(20) = NULL,
     @LastName varchar(30) = NULL,
 	@Prefix varchar(25) = NULL,
     @Suffix varchar(10) = NULL,
     @Designation varchar(20) = NULL,
     @Title varchar(80) = NULL,
     @Informal varchar(20) = NULL)
     returns varchar(70)
 AS
 BEGIN
     DECLARE @Result varchar(255)
 	DECLARE @FullName varchar(70)
     SET @Result = ''
 	-- By default, FullName is just FirstName + LastName
 	IF(@Prefix IS NOT NULL AND LEN(@Prefix) > 0)
        SET @Result = RTRIM(LTRIM(@Prefix))
     IF(@FirstName IS NOT NULL AND Len(@FirstName) > 0)
        SET @Result = @Result + ' ' + RTRIM(LTRIM(@FirstName))
     IF(@MiddleName IS NOT NULL AND Len(@MiddleName) > 0)
        SET @Result = @Result + ' ' + RTRIM(LTRIM(@MiddleName))
     IF(@LastName IS NOT NULL AND Len(@LastName) > 0)
        SET @Result = @Result + ' ' + RTRIM(LTRIM(@LastName))
     IF(@Suffix IS NOT NULL AND Len(@Suffix) > 0)
        SET @Result = @Result + ', ' + RTRIM(LTRIM(@Suffix))
     IF(@Designation IS NOT NULL AND Len(@Designation) > 0)
        SET @Result = @Result + ', ' + RTRIM(LTRIM(@Designation))
 	SET @Result = RTRIM(LTRIM(@Result))
     IF(LEFT(@Result,1) = ',')
        SET @Result = LTRIM(RIGHT(@Result,Len(@Result)-2))
     SET @FullName = LEFT(@Result,70)
    RETURN @FullName 
 END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_GetLastFirst]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_GetLastFirst]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  StoredProcedure dbo.fn_asi_GetLastFirst  ******/
 create function dbo.fn_asi_GetLastFirst(@LastName varchar(30),@FirstName varchar(20))
 returns varchar(30)
  as
 begin
  	declare @NewLastFirst varchar(30)
 	if @FirstName is null
 		set @FirstName = ''
 	if @LastName is null
 		set @LastName = ''
 	if @FirstName<>'' and @LastName<>''
 		set @NewLastFirst = RTRIM(LTRIM(@LastName)) + ', ' + LTRIM(RTRIM(@FirstName))
 	else
 		set @NewLastFirst = LTRIM(RTRIM(@LastName)) + ' ' + LTRIM(RTRIM(@FirstName))
 	-- get the new last first value
 	set @NewLastFirst = REPLACE(LTRIM(RTRIM(@NewLastFirst)),'''','')
 	set @NewLastFirst = dbo.fn_asi_convert_foreign_string(@NewLastFirst)
 	set @NewLastFirst = UPPER(@NewLastFirst)
 	return @NewLastFirst
  		
  end

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_SoftCreditCMDM_Amount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_SoftCreditCMDM_Amount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION fn_asi_SoftCreditCMDM_Amount
        (@pTransNumber int,
        @pOrignatingActivitySeqn int,
		@pSoftCreditId as varchar(50))
  RETURNS money
  AS
  BEGIN
       /*  JB 19-May-06
       Returns a correction value to be applied to an original Soft Credit value.
       This correction value is a total of all the CM/DM that have been issued against
       the Soft Credit
       The original soft credit is identified in Trans_SoftCredit by
       the combination of TRANS_NUMBER and ORIGINATING_ACTIVITY_SEQN.
       Subsequent CM/DM will have the same ORIGINATING_ACTIVITY_SEQN
       but different TRANS_NUMBER 
       */
       declare @correctionVal money
       -- get the correction value
       select 
            @correctionVal = sum(AMOUNT)
       from
            Trans_SoftCredit
       where
            ORIGINATING_ACTIVITY_SEQN = @pOrignatingActivitySeqn
            and TRANS_NUMBER <> @pTransNumber
			and SOFT_CREDIT_ID=@pSoftCreditId
       return isnull(@correctionVal,0)
  END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_SoftCreditCMDM_Exists]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_SoftCreditCMDM_Exists]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  FUNCTION fn_asi_SoftCreditCMDM_Exists(
		@pTransNumber int,
        @pOrignatingActivitySeqn int,
        @pSoftCreditId as varchar(50))
  RETURNS bit
  AS
  BEGIN
      /*  JB 26-May-06
      Returns a flag to indicate if there are CM/DM applied to an original Soft Credit value.
      The original soft credit is identified in Trans_SoftCredit by
      the combination of TRANS_NUMBER and ORIGINATING_ACTIVITY_SEQN.
      Subsequent CM/DM will have the same ORIGINATING_ACTIVITY_SEQN
      but different TRANS_NUMBER 
      */
      declare @exists bit
      set @exists = 0
      if exists (
            select 1 from Trans_SoftCredit
            where
                 ORIGINATING_ACTIVITY_SEQN = @pOrignatingActivitySeqn
                 and TRANS_NUMBER <> @pTransNumber
				 and SOFT_CREDIT_ID=@pSoftCreditId
      )
		set @exists = 1

	  return @exists
  END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_asi_StripParens]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[fn_asi_StripParens]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION [dbo].[fn_asi_StripParens](@string nvarchar(4000))
     RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @result nvarchar(4000)
	DECLARE @count int
	SET @count = 0
    SET @result = LTRIM(RTRIM(@string))
    WHILE (LEFT(@result, 1)='(' OR LEFT(@result,1)='''') 
	BEGIN
		SET @result = SUBSTRING(@result, 2, LEN(@result) - 1)
		SET @count = @count + 1
	END
	IF (LEN(@result) - @count) <= 0
		SET @result = ''''''
	ELSE
		SET @result = LEFT(@result, LEN(@result) - @count)
    RETURN @result 
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFirstGLTransactionLineKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[GetFirstGLTransactionLineKey]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  User Defined Function dbo.GetFirstGLTransactionLineKey    Script Date: 1/10/2006 9:19:58 AM ******/
CREATE   FUNCTION [dbo].[GetFirstGLTransactionLineKey]
  (@GLTransKey uniqueidentifier, @PaymentKey uniqueidentifier, @GLAccountKey uniqueidentifier, @Type nvarchar(50))
RETURNS uniqueidentifier 
AS
BEGIN
	RETURN (SELECT TOP 1 GLTransactionLineKey FROM GLTransactionLine 
	WHERE GLTransactionKey = @GLTransKey
		AND (PaymentKey = @PaymentKey OR @PaymentKey is null)
		AND GLAccountKey = @GLAccountKey
		AND GLEntryType = @Type)
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserKeyByUserId]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[GetUserKeyByUserId]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  FUNCTION [dbo].[GetUserKeyByUserId]
  (@UserId nvarchar(50))
RETURNS uniqueidentifier 
AS
BEGIN
	RETURN (SELECT TOP 1 UserKey FROM UserMain WHERE UserId = @UserId)
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetValueListTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[GetValueListTable]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE FUNCTION [dbo].[GetValueListTable] (@ListValues varchar(5000))  
RETURNS @valTable TABLE (uid varchar(10)) AS  
BEGIN 
	
	DECLARE @ListValueID varchar(10), @Pos int

	SET @ListValues = LTRIM(RTRIM(@ListValues))+ ','
		SET @Pos = CHARINDEX(',', @ListValues, 1)
	
		IF REPLACE(@ListValues, ',', '') <> ''
		BEGIN
			WHILE @Pos > 0
			BEGIN
				SET @ListValueID = LTRIM(RTRIM(LEFT(@ListValues, @Pos - 1)))
				IF @ListValueID <> ''
				BEGIN
					INSERT INTO @valTable (uid) VALUES (@ListValueID) --Use Appropriate conversion
				END
				SET @ListValues = RIGHT(@ListValues, LEN(@ListValues) - @Pos)
				SET @Pos = CHARINDEX(',', @ListValues, 1)
	
			END
		END		

	RETURN
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchForSuperProduct]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
    DROP FUNCTION [dbo].[SearchForSuperProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
-- =====================================================
-- Author:		Mario Moreno
-- Create date: 14-Jul-2008
-- Description:	
-- =====================================================
CREATE FUNCTION [dbo].[SearchForSuperProduct](@SuperProductID INT, @IsSuperProduct BIT, @SearchString varchar(200), @MatchType int) 
RETURNS INT
AS

BEGIN
	IF(@IsSuperProduct = 1)
		BEGIN
			DECLARE @i1 INT;
			DECLARE @i2 INT;
			DECLARE @Word VARCHAR(100);
			DECLARE @Words TABLE (Word VARCHAR(100) NOT NULL);
			DECLARE @WordCount AS INTEGER;
			DECLARE @SuperProductAttribute TABLE (
			Title			VARCHAR(128)
			)

			INSERT INTO @SuperProductAttribute
				SELECT DISTINCT av.Title
				FROM OrderSuperProductAttributeLookup AS a
				INNER JOIN OrderSuperProductAttribute AS b ON a.OrderSuperProductAttributeID = b.OrderSuperProductAttributeID,
OrderSuperProductAttributeValue AS av INNER JOIN
				OrderSuperProductAttributeLookup AS al ON av.OrderSuperProductAttributeID = al.OrderSuperProductAttributeID INNER JOIN
				OrderSuperProductChildProduct AS cp ON al.OrderProductID = cp.OrderProductID INNER JOIN
				OrderSuperProductChildProductAttribute AS cpa ON av.OrderSuperProductAttributeValueID = cpa.OrderSuperProductAttributeValueID AND 
				cp.OrderSuperProductChildProductID = cpa.OrderSuperProductChildProductID
				INNER JOIN Product_Inventory pinv ON pinv.PRODUCT_CODE COLLATE database_default = cp.ProductCode COLLATE database_default
				WHERE a.OrderProductID = @SuperProductID AND
				  al.OrderProductID = @SuperProductID
				AND (pinv.QUANTITY_AVAILABLE > 0) 
				AND av.OrderSuperProductAttributeID = b.OrderSuperProductAttributeID

			IF (@MatchType != 2)
				BEGIN
					SET @SearchString = ' ' + @SearchString  + ' ';
					SET @i1 = 1;
					WHILE (@i1 != 0)
						BEGIN
							SET @i2=charindex(' ', @SearchString, @i1+1)
							IF (@i2 != 0)
								BEGIN
									SET @Word = rtrim(ltrim(substring(@SearchString, @i1+1, @i2-@i1)))
									IF @Word != '' INSERT INTO @Words SELECT @Word
								END

							SET @i1 = @i2
						END
				END
			ELSE
				INSERT INTO @Words SELECT LTRIM(RTRIM(@SearchString))

		-- Get the total # of words:

			SET @WordCount = (SELECT COUNT(*) FROM @Words)

			DECLARE @result INT
			SELECT @result = COUNT(*) FROM
				(SELECT a.MatchPct, T.* 
					FROM @SuperProductAttribute T
					INNER JOIN
					(
						SELECT
						T.Title, Count(*)  * 1.0 / @WordCount AS MatchPct
						FROM
						@SuperProductAttribute T
						INNER JOIN
						@Words W ON ' ' + T.Title + ' ' LIKE '%[^a-z]' + Word + '[^a-z]%'
						GROUP BY
						T.Title
					) a ON T.Title = a.Title
					WHERE
					MatchPct = 1 OR @MatchType <>1
				) AS res
			IF (@result = 0)
				RETURN 0
			ELSE
				RETURN 1
		END
	RETURN 0
END

GO

