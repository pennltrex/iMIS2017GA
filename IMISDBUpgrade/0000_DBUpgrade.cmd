@ECHO OFF
SETLOCAL
@ECHO.
@ECHO =====================================================
@ECHO = iMIS 15.1.3 Update Database Update Driver Script =
@ECHO =====================================================
@ECHO.
SET BUILDPUBLISHBOS=1

REM ----------------------------------------------------------
REM - Set the Previous (expected) and Current (upgrading to) -
REM - versions here, in both readable string and int values  -
REM ---------------------------------------------------------- 
SET PREVVERSTR=15.1.3
SET PREVVERVALUE=150103
SET CURRVERSTR=15.1.3
SET CURRVERVALUE=150103

REM * SET IDENTIFIER VVVV------- **
SET UPGRADESCRIPTDIR=0000_DBUpgrade

REM -----------------------------------------------------
REM - Grab the command line parameters and display them -
REM -----------------------------------------------------
IF "%~1"=="" GOTO usage
IF "%~1"=="?" GOTO usage
IF "%~1"=="/?" GOTO usage
IF "%~1"=="-?" GOTO usage
IF "%~2"=="" GOTO usage
IF "%~3"=="" GOTO usage
IF "%~4"=="" GOTO usage
SET BINDIR=%~1
SET SERVERNAME=%~2
SET DBNAME=%~3
IF "%~4"=="" ( SET USERNAME=sa ) ELSE ( SET USERNAME=%~4 )
IF "%~5"=="" ( SET PASSWORD=dsa ) ELSE ( SET PASSWORD=%~5 )

date /t & time /t
@ECHO.
@ECHO Using
@ECHO   Server: %SERVERNAME%
@ECHO   Database: %DBNAME%
@ECHO   User: %USERNAME%
@ECHO   Install Root: %BINDIR%

osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -b -r -h-1 -Q "EXIT(SELECT LEFT(CONVERT(NVARCHAR(10), SERVERPROPERTY('ProductVersion')), CHARINDEX('.', CONVERT(NVARCHAR(10), SERVERPROPERTY('ProductVersion'))) - 1) + '0')" > NUL
SET SQLSERVER=%ERRORLEVEL%
IF %SQLSERVER% EQU 1 (
    @echo *** ERROR: Cannot connect to specified server
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
) ELSE IF %SQLSERVER% LSS 90 (
    @echo *** ERROR: Expected SQL Server 2005 or later with a compatibility level of 90 or above. 
    @echo *** ERROR: The specified SQL Server has a compatibility level of %SQLSERVER%.
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
) ELSE (
    @ECHO   SQL Server Version: %SQLSERVER%
)
SET BCPVERSTR=""
FOR /F "tokens=2 delims=. " %%i IN ('bcp -v ^| FIND "Version"') DO SET BCPVERSTR=%%i
@ECHO   SQL Client Tools Version: %BCPVERSTR%

REM -----------------------------------------------------
REM - Ensure empty logfile directory exists for logging -
REM -----------------------------------------------------
IF NOT EXIST .\LogFiles MKDIR .\LogFiles
IF NOT EXIST .\LogFiles\%UPGRADESCRIPTDIR% MKDIR .\LogFiles\%UPGRADESCRIPTDIR% 
del .\LogFiles\%UPGRADESCRIPTDIR%\*.* /F /Q 1> NUL 2> NUL

REM --------------------------------------------------------------------
REM - Examine the current database version.  If the result is anything -
REM - other than CURRVERVALUE, do not process any further.
REM --------------------------------------------------------------------
".\Utilities\DBVersion" -GetNoBuildVersion -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
SET /A DBVER=%ERRORLEVEL%
if %DBVER% EQU -2 (
    @ECHO.
    @ECHO *** ERROR connecting to specified database ***
    @ECHO.
    @ECHO Cannot access database ... exiting update process
    @ECHO.
    EXIT /B 1
)
IF %DBVER% EQU -4 (
    @ECHO.
    @ECHO *** ERROR upgrading specified database ... bad database version ***
    @ECHO.
    @ECHO Please upgrade this database to version 10.6.30.07 or later before continuing
    @ECHO.
    @ECHO Exiting update process
    @ECHO.
    EXIT /B 1
)

REM --------------------------------------------------------------------
REM - Grab the current database state (to detect if we're restarting
REM - a failed upgrade attempt)
REM --------------------------------------------------------------------
".\Utilities\DBVersion" -GetState -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
SET /A DBSTATE=%ERRORLEVEL%
".\Utilities\DBVersion" -GetBuildVersion -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
SET /A DBBUILD=%ERRORLEVEL%

REM ---------------------------------------------------------------------------
REM - Exit gracefully if database is already at or above the expected version -
REM ---------------------------------------------------------------------------
SET DBVERSTR=""
FOR /F "tokens=*" %%i IN ('.\Utilities\DBVersion -GetVersion -E -S "%SERVERNAME%" -U %USERNAME% -P %PASSWORD% -D %DBNAME%') do SET DBVERSTR=%%i
IF %DBVER% GTR %CURRVERVALUE% (
    @ECHO.
    @ECHO Database already upgraded to version %DBVERSTR% ... exiting
    @ECHO.
    EXIT /B 0
) ELSE (
    IF %DBVER% LSS %PREVVERVALUE% (
        @ECHO.
        @ECHO *** ERROR upgrading specified database ... unexpected database version ***
        @ECHO.
        @ECHO Expected version %PREVVERSTR%.x, but found version: %DBVERSTR%	
        @ECHO.
        @ECHO Exiting update process
        @ECHO.
        EXIT /B 1
    )
)

@ECHO Database at version %DBVERSTR% ... updating

REM -------------------------------------------------
REM - Display current iMIS version just for reference
REM -------------------------------------------------
SET OLDIMISVERSTR=""
FOR /F "tokens=1 delims= " %%i IN ('osql -t -S "%SERVERNAME%" -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -b -r -h-1 -Q"SET NOCOUNT ON SELECT ShortValue FROM System_Params WHERE ParameterName = 'System_Control.Version'" ^| FIND "."') DO SET OLDIMISVERSTR=%%i
IF NOT "%OLDIMISVERSTR%"=="%DBVERSTR%" (
    @ECHO.
    @ECHO Current iMIS Version is: %OLDIMISVERSTR%
)

REM -----------------------------------------------------------------------
REM - Microsoft can't seem to create tools that are backwards compatible. -
REM - So to hack around something that they should have done, run this    -
REM - tool to convert the format files to something SQLServer 2000's BCP  -
REM - utility can read.  Why SQLServer2005's BCP can't generate files     -
REM - that SQLServer2000's BCP can read is anybody's guess.               -
REM -----------------------------------------------------------------------
IF EXIST .\FormatFiles\%UPGRADESCRIPTDIR% (
    .\Utilities\CvtFmt.exe TO90 .\FormatFiles\%UPGRADESCRIPTDIR%
)

REM -------------------------
REM - Set the upgrade state -
REM -------------------------
SET /A REALDBSTATE=%DBSTATE% + 1
IF %DBSTATE% GTR 0 (
    IF %DBBUILD% EQU 0 (
        @ECHO.
        @ECHO Interrupted Upgrade detected during iMIS %CURRVERVALUE% Update ... 
        @ECHO Continuing to run Upgrade Script.
        @ECHO.
        EXIT /B 0
    )
    @ECHO.
    @ECHO Restarting an upgrade that was interrupted during step %REALDBSTATE%
    TIME /T
    SET /A CURRENTSTATE=1
    GOTO Step%REALDBSTATE%
)
REM ".\Utilities\DBVersion" -SetVersion %CURRVERSTR%.0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
".\Utilities\DBVersion" -SetState 0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 

REM ------------------------------------------------------------
REM - Database validations pass, so begin the Update Process! -
REM ------------------------------------------------------------
@ECHO.
@ECHO Starting Update Process 
TIME /T

:Step1
SET /A CURRENTSTATE=1
REM -----------------------------
REM -- Populate IMISTable table -
REM -----------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Populating IMIS Table List ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log /y > nul
@ECHO Truncating iMISTable... 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE IMISTable" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.err
@ECHO Bulk-Loading iMISTable... 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log 
bcp %DBNAME%.dbo.IMISTable in ".\AsiTableData\%UPGRADESCRIPTDIR%\IMISTable.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\IMISTable.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** Error Populating IMIS Table List ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PopulateIMISTable.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step2
SET /A CURRENTSTATE=2
REM ---------------------------------------------------------------------------------------------
REM - Create all the new iMIS 15 database tables.  If the table already exists in this database -
REM - then it is left alone.  Following steps will modify those tables in-place to match what   -
REM - the schema of the new tables.  Column order might be affected.                            -
REM ---------------------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating New Database Tables ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateTables.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTables.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step3
SET /A CURRENTSTATE=3
REM --------------------------------
REM - Modify other existing tables -
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Modifying Existing Tables ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ModifyTables.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ModifyTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ModifyTables.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR Modifying existing tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ModifyTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step4
SET /A CURRENTSTATE=4
REM ----------------------------------------------------------------
REM - Create new Views.  Any views with the same name are replaced -
REM - with the new definition.  Any other views are left alone.    -
REM ----------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Views ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateViews.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateViews.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateViews.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR  creating views ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateViews.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step5
SET /A CURRENTSTATE=5
REM ---------------------------------------------------
REM - Add all the necessary iMIS 15 database triggers -
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Triggers ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateTriggers.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTriggers.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTriggers.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating triggers ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateTriggers.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
REM IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step6
SET /A CURRENTSTATE=6
REM ----------------------------------------------------------------------------------
REM - Create all Stored Procedures.  Any stored procedures with the same name are    -
REM - replaced with the new definition.  Any other stored procedures are left alone. -
REM ----------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Stored Procedures ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateProcedures.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateProcedures.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateProcedures.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating stored procedures ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateProcedures.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step7
SET /A CURRENTSTATE=7
REM --------------------
REM - Create all indexes
REM --------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Re-Creating Indexes ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateIndexes.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateIndexes.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateIndexes.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR re-creating indexes ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateIndexes.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step8
SET /A CURRENTSTATE=8
REM ----------------------------------------------------------
REM - Prepare the Document system for bulk loading new objects
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Preparing To Load New Document System objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR preparing document system for loading ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step9
SET /A CURRENTSTATE=9
REM --------------------------------
REM - Renumber Hierarchy Sort Order
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Renumbering Hierarchy Sort Order...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR renumbering hierarchy sort order ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Business Object Documents ==================================
REM ===========================================================================

:Step10
SET /A CURRENTSTATE=10
REM ---------------------------------------------
REM - Clean Business Objects that are being added
REM ---------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step11
SET /A CURRENTSTATE=11
REM ---------------------------------------------
REM - Load DocumentMain with new Business Objects
REM ---------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Business Objects ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewBODocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step12
SET /A CURRENTSTATE=12
REM -------------------------------------------------
REM - Load Hierarchy with new Business Object Entries
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Hierarchy Entries For New Business Objects ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewBOHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding hierarchy entries for new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.


REM ===========================================================================
REM = Handle Updated Business Object Documents ================================
REM ===========================================================================

:Step13
SET /A CURRENTSTATE=13
REM -----------------------------------------------
REM - Clean Business Objects that are being updated
REM -----------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step14
SET /A CURRENTSTATE=14
REM -------------------------------------------------
REM - Archive Business Objects that are being updated
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step15
SET /A CURRENTSTATE=15
REM -------------------------------------------------
REM - Load DocumentMain with updated Business Objects
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Business Objects ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedBODocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step16
SET /A CURRENTSTATE=16
REM -----------------------------------------------------
REM - Load Hierarchy with updated Business Object Entries
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Hierarchy Entries For Updated Business Objects ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding hierarchy entries for updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step17
SET /A CURRENTSTATE=17
REM ------------------------------------------------------------------
REM - Load RuleSourcePublish with updated Business Objects definitions
REM ------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Bootstrap Business Objects ...
bcp %DBNAME%.dbo.RuleSourcePublish in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedRuleSourceData.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\RuleSourcePublish.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating bootstrap business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Navigation Documents =======================================
REM ===========================================================================

:Step18
SET /A CURRENTSTATE=18
REM -------------------------------------------------
REM - Clean Navigation Documents that are being added
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step19
SET /A CURRENTSTATE=19
REM ---------------------------------------------------
REM - Load DocumentMain with Added Navigation Documents
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step20
SET /A CURRENTSTATE=20
REM ---------------------------------------------------------
REM - Load Hierarchy with Added Navigation Document Hierarchy
REM ---------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new navigation document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Navigation Documents =====================================
REM ===========================================================================


:Step21
SET /A CURRENTSTATE=21
REM ---------------------------------------------------
REM - Determine Updated Navigation Document Sort Orders
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Determining Updated Navigation Document Sort Orders ...
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql ATTRIB -r .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -h-1 -b -r -w4095 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationSortOrderFixupGenerator.sql 1> .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql 2> .\LogFiles\%UPGRADESCRIPTDIR%\DetermineUpdatedNavigationDocumentSortOrders.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR determining updated navigation document sort orders ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DetermineUpdatedNavigationDocumentSortOrders.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step22
SET /A CURRENTSTATE=22
REM ----------------------------------------------------
REM - Clean Navigation Documents that are being updated
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step23
SET /A CURRENTSTATE=23
REM -----------------------------------------------------
REM - Archive Navigation Documents that are being updated
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step24
SET /A CURRENTSTATE=24
REM -----------------------------------------------------
REM - Load DocumentMain with updated Navigation Documents
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step25
SET /A CURRENTSTATE=25
REM -----------------------------------------------------------
REM - Load Hierarchy with Updated Navigation Document Hierarchy
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing navigation document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step26
SET /A CURRENTSTATE=26
REM -----------------------------------------------------------
REM - Setting Updated Navigation Document Sort Orders
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting Updated Navigation Document Sort Orders ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting updated navigation document sort orders ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Versioned Documents ========================================
REM ===========================================================================

:Step27
SET /A CURRENTSTATE=27
REM ------------------------------------------------
REM - Clean Versioned Documents that are being added
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step28
SET /A CURRENTSTATE=28
REM --------------------------------------------------
REM - Load DocumentMain with Added Versioned Documents
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step29
SET /A CURRENTSTATE=29
REM ----------------------------------------------------------
REM - Load Hierarchy with Added Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new versioned document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Versioned Documents ======================================
REM ===========================================================================

:Step30
SET /A CURRENTSTATE=30
REM --------------------------------------------------
REM - Clean Versioned Documents that are being updated
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step31
SET /A CURRENTSTATE=31
REM ----------------------------------------------------
REM - Archive Versioned Documents that are being updated
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step32
SET /A CURRENTSTATE=32
REM ----------------------------------------------------
REM - Load DocumentMain with updated Versioned Documents
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step33
SET /A CURRENTSTATE=33
REM ----------------------------------------------------------
REM - Load Hierarchy with Updated Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing versioned document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Non-Versioned Documents ====================================
REM ===========================================================================

:Step34
SET /A CURRENTSTATE=34
REM ------------------------------------------
REM - Clean new Documents that are being added
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step35
SET /A CURRENTSTATE=35
REM --------------------------------------
REM - Load DocumentMain with New Documents
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step36
SET /A CURRENTSTATE=36
REM ----------------------------------
REM - Load Hierarchy for new Documents
REM ----------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Hierarchy Entries For New Documents ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new hierarchy entries for new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Non-Versioned Documents ==================================
REM ===========================================================================

:Step37
SET /A CURRENTSTATE=37
REM ----------------------------------------
REM - Clean Documents that are being updated
REM ----------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step38
SET /A CURRENTSTATE=38
REM ------------------------------------------
REM - Load DocumentMain with updated Documents
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step39
SET /A CURRENTSTATE=39
REM ------------------------------------------------
REM - Load Hierarchy with Updated Document Hierarchy
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step40
SET /A CURRENTSTATE=40
REM ---------------------------------------------------
REM - Restore Document System after loading new objects
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Restoring Document System After Loading New Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -h-1 -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.sql | .\Utilities\Tee.exe /FOO:"WARNING:" /FOE:"SELECT"  .\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR restoring document system after loading ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step41
SET /A CURRENTSTATE=41
REM -------------------------------------------------------------
REM - Fix up Navigation Sort Order for Added Navigation Documents
REM -------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting Navigation Sort Order for Added Navigation ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting navigation sort order for added navigation ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step42
SET /A CURRENTSTATE=42
REM -------------------------------
REM - Resort the Document Hierarchy
REM -------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Resorting Document Hierarchy ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR resorting document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step43
SET /A CURRENTSTATE=43
REM ------------------------------------------------
REM - Flag System Documents in the Document System -
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting System Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting system documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step44
SET /A CURRENTSTATE=44
REM --------------------------------------------------------
REM - Add Component Registry Entries for New Content Types -
REM --------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Component Registry Entries for New Content Types ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding component registry entries for new content types ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step45
SET /A CURRENTSTATE=45
REM -----------------------------------------------------
REM - Add WebPart Gallery Entries for New Content Types -
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding WebPart Gallery Entries for New Content Types ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\NewRCTWebPartEntries.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTWebPartEntries.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTWebPartEntries.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding webpart gallery entries for new content types ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewRCTWebPartEntries.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step46
SET /A CURRENTSTATE=46
REM --------------------------------------------------------------------
REM - Set Business Objects to "Working" state so they'll Build/Publish -
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Initializing Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\WorkingBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR initializing updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step47
SET /A CURRENTSTATE=47
REM ------------------------------------------
REM - Grant select permissions all BO views  -
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Granting Execute Permissions ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR granting select permissions ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step48
SET /A CURRENTSTATE=48
REM ----------------------------------------------------------------------------
REM - Grant permissions to all IMIS data objects
REM ----------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Granting Permissions To IMIS ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\GrantPermissions.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\GrantPermissions.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GrantPermissions.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR granting permissions ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\GrantPermissions.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step49
SET /A CURRENTSTATE=49
REM --------------------------------------------------------------------
REM - UpdateSystemConfig.sql - Update System Configuration Data
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Some Data [UpdateSystemConfig] ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.err
IF %ERRORLEVEL% NEQ 0 (
      @echo.
      @echo *** ERROR updating some data [UpdateSystemConfig] ***
      @echo.
      type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.err"
      @echo.
      @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
      @echo.
      EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step50
SET /A CURRENTSTATE=50
REM --------------------------------------------------------------------
REM - DropObsoleteItems.sql - Drop obsolete DB schema or rows
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Dropping Some Schema [DropObsoleteItems] ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.err
IF %ERRORLEVEL% NEQ 0 (
      @echo.
      @echo *** ERROR updating some data [DropObsoleteItems] ***
      @echo.
      type ".\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.err"
      @echo.
      @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
      @echo.
      EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ================================
REM = Start Version-Specific Updates
REM ================================

:Step51
SET /A CURRENTSTATE=51
REM --------------------------------------------------------------------
REM - PBI4321.sql - Fix Access Area
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Fixing Access Area Flags [PBI4321] ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\PBI4321.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\PBI4321.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\PBI4321.err
IF %ERRORLEVEL% NEQ 0 (
      @echo.
      @echo *** ERROR fixing access area flags [pbi4321] ***
      @echo.
      type ".\LogFiles\%UPGRADESCRIPTDIR%\PBI4321.err"
      @echo.
      @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
      @echo.
      EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ================================= 
REM = End of Version-Specific Updates
REM =================================

REM ----------------------------------------
REM - Skip build-publish step if requested -
REM ----------------------------------------
IF %BUILDPUBLISHBOS% EQU 0 GOTO NoBuildPublishBos

:Step52
SET /A CURRENTSTATE=52
REM ----------------------------
REM - Prepare to BuildPublishBOs
REM ----------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Prepare to Build and Publish Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\PrepareBuildPublishBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareBuildPublishBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareBuildPublishBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR preparing to build and publish business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PrepareBuildPublishBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step53
SET /A CURRENTSTATE=53
REM ----------------------------------------------------------------------
REM - Preload RuleSourcePublish with changes needed by BuildPublishBOs.exe
REM ----------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Preloading Business Object Rules ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.log /y > nul
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE [dbo].[RuleSourcePublish]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.err
bcp %DBNAME%.dbo.RuleSourcePublish in ".\AsiTableData\%UPGRADESCRIPTDIR%\RuleSourcePublish.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\RuleSourcePublish.fmt" -V 80 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** Error preloading business object rules ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PreloadBORules.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step54
SET /A CURRENTSTATE=54
REM --------------------------------------------------------------------
REM - Build and Publish all BO objects to ensure everything is in sync -
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Building And Publishing Business Objects ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishBOs.log /y > nul
"%BINDIR%\BuildPublishBOs.exe" -W -S -CS %SERVERNAME% -CU %USERNAME% -CP %PASSWORD% -CD %DBNAME% >> .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishBOs.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error building and publishing business objects... 
    @echo     Please check the logs to determine which objects failed to publish.
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:NoBuildPublishBos

:Step55
SET /A CURRENTSTATE=55
REM --------------------------------------------------------------------------
REM - Refresh view metadata for all views
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Refreshing Views ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR refreshing views ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step56
SET /A CURRENTSTATE=56
REM --------------------------------------------------------------------------
REM - Finally, update the database version number to reflect the new version -
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating DB version ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDBVersionString.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDBVersionString.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating DB version ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateDBVersionString.err"
    @echo.
    @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step57
SET /A CURRENTSTATE=57
REM -----------------------------
REM - Update Process Complete! -
REM -----------------------------
@ECHO.
@ECHO Update process complete
".\Utilities\DBVersion" -SetState 0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPDATE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
TIME /T
@ECHO.

EXIT /B 0

:usage
@ECHO.
@ECHO %0 Batch File Usage Syntax:
@ECHO.
@ECHO		%0 binDir serverName serverName databaseName 
@ECHO		%0 binDir serverName serverName databaseName userName password
@ECHO.
@ECHO Where:
@ECHO	binDir = absolute path to the Bin directory of root install of iMIS15
@ECHO	serverName = Name of the SQL Server instance to use
@ECHO 	databaseName = Name of the Database to use
@ECHO 	userName = SQL Server user name to use for login (optional)
@ECHO 	password = The password for the SQL Server user login (optional)
@ECHO.
EXIT /B 1
