
-- This script is for rebuilding the GiftHistorySummary table for all Donors based on the DonorIds represented in the GiftReport table
-- Version 1.1

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

IF OBJECT_ID('tempdb..#idsToProcess') IS NOT NULL
    DROP TABLE #idsToProcess;

CREATE TABLE #idsToProcess (ID varchar(10) PRIMARY KEY NOT NULL);

DECLARE @done bit;
DECLARE @total bigint;
DECLARE @LastCustomerID varchar(10)

PRINT 'Starting...';
SELECT @LastCustomerID = ''
SET @done = 0;

SELECT @total = COUNT(DISTINCT(ID))
  FROM [dbo].[GiftReport]
 WHERE [ID] NOT IN (SELECT [DonorId] FROM [dbo].[GiftHistorySummary])
PRINT 'Total Ids to Process = ' + CAST(@total AS varchar(12)) 
 
WHILE (@done = 0)
BEGIN

    -- Get the DonorIds to be updated
    TRUNCATE TABLE #idsToProcess;
    INSERT INTO #idsToProcess
        SELECT DISTINCT TOP 10000 [ID]
          FROM [dbo].[GiftReport]
         WHERE [ID] > @LastCustomerID AND [ID] NOT IN (SELECT [DonorId] FROM [dbo].[GiftHistorySummary])
         ORDER BY ID
    
    IF (SELECT COUNT(1) FROM #idsToProcess) = 0
    BEGIN
        PRINT 'Done.'
        SET @done = 1;
        BREAK;
    END;

    -- Display total count
    DECLARE @totalIdsToProcess int
    SELECT @totalIdsToProcess = COUNT([ID]) FROM #idsToProcess
    PRINT '   Ids Left to Process = ' + CAST(@total AS varchar(12)) + ' @ ' + CONVERT(varchar, SYSDATETIME(), 121)


    -- define the customer ID to be handled now
    DECLARE @CustomerIDToHandle varchar(10)

    -- select the next customer to handle    
    SELECT TOP 1 @CustomerIDToHandle = [ID] FROM #idsToProcess ORDER BY [ID]

    -- Now recalculate the gift history summary for each DonorId
    BEGIN TRANSACTION; 
    DECLARE @count int
    SET @count = 1
    -- as long as we have customers......   
    WHILE @CustomerIDToHandle IS NOT NULL
    BEGIN
        EXEC asi_RecalculateGiftHistorySummary @DonorId = @CustomerIDToHandle
        
        -- set the last customer handled to the one we just handled
        SET @LastCustomerID = @CustomerIDToHandle
        SET @CustomerIDToHandle = NULL

        -- select the next customer to handle    
        SELECT TOP 1 @CustomerIDToHandle = [ID] FROM #idsToProcess WHERE [ID] > @LastCustomerID ORDER BY [ID]
        SET @count = @count + 1
    END
    COMMIT TRANSACTION;
    SET @total = @total - @totalIdsToProcess;
END

IF OBJECT_ID('tempdb..#idsToProcess') IS NOT NULL
    DROP TABLE #idsToProcess;

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO

