@ECHO OFF
SETLOCAL
@ECHO.
@ECHO =============================================================
@ECHO = iMIS 15.1.3 to iMIS 15.2.0 Database Upgrade Driver Script =
@ECHO =============================================================
@ECHO.
SET BUILDPUBLISHBOS=1

REM ----------------------------------------------------------
REM - Set the Previous (expected) and Current (upgrading to) -
REM - versions here, in both readable string and int values  -
REM ---------------------------------------------------------- 
SET PREVVERSTR=15.1.3
SET PREVVERVALUE=150103
SET CURRVERSTR=15.2.0
SET CURRVERVALUE=150200

REM * SET IDENTIFIER VVVV------- **
SET UPGRADESCRIPTDIR=0001_DBUpgrade

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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
) ELSE IF %SQLSERVER% LSS 90 (
    @echo *** ERROR: Expected SQL Server 2005 or later with a compatibility level of 90 or above. 
    @echo *** ERROR: The specified SQL Server has a compatibility level of %SQLSERVER%.
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
) ELSE (
    @ECHO   SQL Server Version: %SQLSERVER%
)
SET BCPVERSTR=""
FOR /F "tokens=2 delims=. " %%i IN ('bcp -v ^| FIND "Version"') DO SET BCPVERSTR=%%i
@ECHO   SQL Client Tools Version: %BCPVERSTR%

osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -b -r -h-1 -Q "EXIT(SELECT PATINDEX('%%CASUAL%%', LongValue) + PATINDEX('%%CASUAL%%', ShortValue) FROM System_Params WHERE ParameterName = 'System_Control.LicensedProducts')" > NUL
IF %ERRORLEVEL% LSS 1 (
    @echo.
    @echo ** ERROR: Need to apply CASUAL License prior
    @echo ** ERROR: to beginning upgrade of database.
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)	

REM -----------------------------------------------------
REM - Ensure empty logfile directory exists for logging -
REM -----------------------------------------------------
IF NOT EXIST .\LogFiles MKDIR .\LogFiles
IF NOT EXIST .\LogFiles\%UPGRADESCRIPTDIR% MKDIR .\LogFiles\%UPGRADESCRIPTDIR% 
del .\LogFiles\%UPGRADESCRIPTDIR%\*.* /F /Q 1> NUL 2> NUL

REM --------------------------------------------------------------------
REM - Examine the current database version.  Bail if cannot connect 
REM --------------------------------------------------------------------
".\Utilities\DBVersion" -GetNoBuildVersion -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
SET /A DBVER=%ERRORLEVEL%
if %DBVER% EQU -2 (
    @ECHO.
    @ECHO *** ERROR connecting to specified database ***
    @ECHO.
    @ECHO Cannot access database ... exiting upgrade process
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
) ELSE IF %DBVER% EQU %CURRVERVALUE% (
    IF %DBSTATE% EQU 0 (
        @ECHO.
        @ECHO Database already upgraded to version %DBVERSTR% ... exiting
        @ECHO.
        EXIT /B 0
    )
) ELSE (
    IF %DBVER% LSS %PREVVERVALUE% (
        @ECHO.
        @ECHO *** ERROR upgrading specified database ... unexpected database version ***
        @ECHO.
        @ECHO Expected version %PREVVERSTR%.x, but found version: %DBVERSTR%	
        @ECHO.
        @ECHO Exiting upgrade process
        @ECHO.
        EXIT /B 1
    )
)

@ECHO Database at version:  %DBVERSTR%

REM -----------------------------------------------------------
REM - Display the version we're upgrading to just for reference
REM -----------------------------------------------------------
SET NEWIMISVERSTR=
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersion.txt (
    FOR /F "tokens=1 delims= " %%f in (.\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersion.txt) do  SET NEWIMISVERSTR=%%f
)
IF "%NEWIMISVERSTR%" NEQ "" @ECHO Upgrading to version: %NEWIMISVERSTR%

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
    IF %DBBUILD% GTR 0 (
        @ECHO.
        @ECHO Interrupted Upgrade detected during iMIS %CURRVERVALUE% Update ... 
        @ECHO Continuing to run Update Script.
        @ECHO.
        EXIT /B 0
    )
    @ECHO.
    @ECHO Restarting an upgrade that was interrupted during step %REALDBSTATE%
    TIME /T
    SET /A CURRENTSTATE=1
    GOTO Step%REALDBSTATE%
)
".\Utilities\DBVersion" -SetVersion %CURRVERSTR%.0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME%
".\Utilities\DBVersion" -SetState 0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 

REM ------------------------------------------------------------
REM - Database validations pass, so begin the Upgrade Process! -
REM ------------------------------------------------------------
@ECHO.
@ECHO Starting Upgrade Process 
TIME /T

REM *************************************************************************

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
REM -------------------------------------------------------------------------
REM - Delete old and obsolete database items, clearing the way for new ones -
REM -------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Removing Obsolete Database Items ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteItems.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR dropping obsolete database items ***
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

:Step3
SET /A CURRENTSTATE=3
REM -----------------------------------------------------------------------
REM - Save Existing Website customizations so they can be reapplied later -
REM -----------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Saving Website Customizations ...
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.sql ATTRIB -r .\ScriptFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.sql
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -h-1 -b -r -w 4095 -c ZZZ -i .\ScriptFiles\%UPGRADESCRIPTDIR%\GenerateWebsiteUpdateScript.sql 1> .\ScriptFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.sql 2> .\LogFiles\%UPGRADESCRIPTDIR%\GenerateWebsiteUpdateScript.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR saving website customizations ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\GenerateWebsiteUpdateScript.err"
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
REM -----------------------
REM - Fix User Logon Issues
REM -----------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Fix User Logon Issues ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixUserLoginIssues.sql | .\Utilities\Tee.exe /FOO:"WARNING:" /FOE:"SELECT" .\LogFiles\%UPGRADESCRIPTDIR%\FixUserLoginIssues.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixUserLoginIssues.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR fixing user logon issues ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\FixUserLoginIssues.err"
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
REM --------------------------------------------
REM - Import public company users into User Main
REM --------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Importing Public Company Users ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ImportPublicCompanyUsers.sql | .\Utilities\Tee.exe /FOO:"WARNING:" /FOE:"SELECT" .\LogFiles\%UPGRADESCRIPTDIR%\ImportPublicCompanyUsers.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ImportPublicCompanyUsers.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR importing public company users ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ImportPublicCompanyUsers.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step6
SET /A CURRENTSTATE=6
REM -------------------------------------------------
REM - Convert Table schema to full ANSI compliance  -
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Rebuilding Tables For Full ANSI Compliance ...
".\Utilities\ConvertTablesToANSI.exe" -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME% | .\Utilities\Tee.exe  .\LogFiles\%UPGRADESCRIPTDIR%\RebuildTablesForANSICompliance.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RebuildTablesForANSICompliance.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR rebuilding tables for full ansi compliance ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RebuildTablesForANSICompliance.err"
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

:Step8
SET /A CURRENTSTATE=8
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

:Step9
SET /A CURRENTSTATE=9
REM ------------------------------------
REM - Convert Float columns to Numeric -
REM ------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Converting Float Columns To Numeric ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ConvertFloatColumnsToNumeric.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ConvertFloatColumnsToNumeric.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ConvertFloatColumnsToNumeric.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR converting float columns to numeric ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ConvertFloatColumnsToNumeric.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step10
SET /A CURRENTSTATE=10
REM ----------------------------------------------------------------------------
REM - Create all User Defined Functions.  Any functions with the same name are -
REM - replaced with the new definition.  Any other functions are left alone.   -
REM ----------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating User Defined Functions ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateFunctions.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFunctions.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFunctions.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR  creating user defined functions ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateFunctions.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step11
SET /A CURRENTSTATE=11
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

:Step12
SET /A CURRENTSTATE=12
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

:Step13
SET /A CURRENTSTATE=13
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

:Step14
SET /A CURRENTSTATE=14
REM -------------------------------
REM - Drop non-PK Clustered Indexes
REM -------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Dropping Non-PK Clustered Indexes ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR dropping non-PK clustered indexes ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step15
SET /A CURRENTSTATE=15
REM ----------------------------------------------------------------------------------------
REM - Clear all the Foreign Key constraints, so they don't hang us up while making changes -
REM ----------------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Clearing FK Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r1 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.sql 2>&1 | .\Utilities\Tee.exe /FOO:"INFO:" /FOE:"PRINT" .\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.log 2>&1  
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR dropping FK constraints ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step16
SET /A CURRENTSTATE=16
REM ----------------------------------------------------------------------------------
REM - Truncate new *Ref tables, so that they have known contents when they're loaded -
REM ----------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Loading Ref Tables ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\RefTables.txt) do osql -t -S "%SERVERNAME%" -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE %%i" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR truncating Ref tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)

REM -------------------------------------------
REM - Bulk load new *Ref tables to known data -
REM -------------------------------------------
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\RefTables.txt) do (
    echo Table %%i 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log"
    bcp %DBNAME%.dbo.%%i in ".\AsiTableData\%UPGRADESCRIPTDIR%\%%i.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\%%i.fmt" -a 16384 -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> .\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.err
    SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log"
)
IF %ERRORFLAG% NEQ 0 (
    @echo.
    @echo *** ERROR populating Ref tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step17
SET /A CURRENTSTATE=17
REM --------------------------------------
REM - Merge new data in to existing tables
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Loading Merge Tables ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\MergeTables.txt) do (
    echo Table %%i 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log"
    osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\Merge%%1Data.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.err
    SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log"
)
IF %ERRORFLAG% NEQ 0 (
    @echo.
    @echo *** ERROR loading merge tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step18
SET /A CURRENTSTATE=18
REM -----------------------------
REM - Reorganize Web Part Gallery
REM -----------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Reorganize Web Part Gallery ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ReorganizeWebPartsGallery.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ReorganizeWebPartsGallery.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ReorganizeWebPartsGallery.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR reorganizing web part gallery ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ReorganizeWebPartsGallery.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step19
SET /A CURRENTSTATE=19
REM -----------------------
REM - Re-create all indexes
REM -----------------------
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

:Step20
SET /A CURRENTSTATE=20
REM ---------------------------------
REM - Apply Foreign Key constraints -
REM ---------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Applying Foreign Key Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateFKs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFKs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFKs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR applying foreign key constraints ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateFKs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
REM IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step21
SET /A CURRENTSTATE=21
REM --------------------------------
REM - Renumber Hierarchy Sort Order
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Renumbering Hierarchy Sort Order...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR renumbering hierarchy sort order ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RenumberDocumentHierarchy.err"
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
REM ----------------------------------------------------------
REM - Prepare the Document system for bulk loading new objects
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Preparing To Load New Document System objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR preparing document system for loading ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PrepareDocumentMain.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Business Object Documents ==================================
REM ===========================================================================

:Step23
SET /A CURRENTSTATE=23
REM ---------------------------------------------
REM - Clean Business Objects that are being added
REM ---------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step24
SET /A CURRENTSTATE=24
REM ---------------------------------------------
REM - Load DocumentMain with new Business Objects
REM ---------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Business Objects ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewBODocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBODocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step25
SET /A CURRENTSTATE=25
REM -------------------------------------------------
REM - Load Hierarchy with new Business Object Entries
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Hierarchy Entries For New Business Objects ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewBOHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding hierarchy entries for new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewBOHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Business Object Documents ================================
REM ===========================================================================

:Step26
SET /A CURRENTSTATE=26
REM -----------------------------------------------
REM - Clean Business Objects that are being updated
REM -----------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step27
SET /A CURRENTSTATE=27
REM -------------------------------------------------
REM - Archive Business Objects that are being updated
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step28
SET /A CURRENTSTATE=28
REM -------------------------------------------------
REM - Load DocumentMain with updated Business Objects
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Business Objects ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedBODocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBODocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step29
SET /A CURRENTSTATE=29
REM -----------------------------------------------------
REM - Load Hierarchy with updated Business Object Entries
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Hierarchy Entries For Updated Business Objects ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding hierarchy entries for updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBOHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step30
SET /A CURRENTSTATE=30
REM ------------------------------------------------------------------
REM - Load RuleSourcePublish with updated Business Objects definitions
REM ------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Bootstrap Business Objects ...
bcp %DBNAME%.dbo.RuleSourcePublish in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedRuleSourceData.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\RuleSourcePublish.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating bootstrap business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedBootstrapBODocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Navigation Documents =======================================
REM ===========================================================================

:Step31
SET /A CURRENTSTATE=31
REM -------------------------------------------------
REM - Clean Navigation Documents that are being added
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step32
SET /A CURRENTSTATE=32
REM ---------------------------------------------------
REM - Load DocumentMain with Added Navigation Documents
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step33
SET /A CURRENTSTATE=33
REM ---------------------------------------------------------
REM - Load Hierarchy with Added Navigation Document Hierarchy
REM ---------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new navigation document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Navigation Documents =====================================
REM ===========================================================================

:Step34
SET /A CURRENTSTATE=34
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

:Step35
SET /A CURRENTSTATE=35
REM ----------------------------------------------------
REM - Clean Navigation Documents that are being updated
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step36
SET /A CURRENTSTATE=36
REM -----------------------------------------------------
REM - Archive Navigation Documents that are being updated
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step37
SET /A CURRENTSTATE=37
REM -----------------------------------------------------
REM - Load DocumentMain with updated Navigation Documents
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step38
SET /A CURRENTSTATE=38
REM -----------------------------------------------------------
REM - Load Hierarchy with Updated Navigation Document Hierarchy
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing navigation document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step39
SET /A CURRENTSTATE=39
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

:Step40
SET /A CURRENTSTATE=40
REM ------------------------------------------------
REM - Clean Versioned Documents that are being added
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step41
SET /A CURRENTSTATE=41
REM --------------------------------------------------
REM - Load DocumentMain with Added Versioned Documents
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step42
SET /A CURRENTSTATE=42
REM ----------------------------------------------------------
REM - Load Hierarchy with Added Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new versioned document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step43
SET /A CURRENTSTATE=43
REM -------------------------------------------------------------
REM - Fix up Navigation Sort Order for Added Navigation Documents
REM -------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting Navigation Sort Order for Added Navigation ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting navigation sort order for added navigation ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\FixupNewNavigationSortOrder.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Versioned Documents ======================================
REM ===========================================================================

:Step44
SET /A CURRENTSTATE=44
REM --------------------------------------------------
REM - Clean Versioned Documents that are being updated
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedVersionedDocuments.err"
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
REM ----------------------------------------------------
REM - Archive Versioned Documents that are being updated
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving Updated Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving updated versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveUpdatedVersionedDocuments.err"
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
REM ----------------------------------------------------
REM - Load DocumentMain with updated Versioned Documents
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step47
SET /A CURRENTSTATE=47
REM ----------------------------------------------------------
REM - Load Hierarchy with Updated Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing versioned document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Added Non-Versioned Documents ====================================
REM ===========================================================================

:Step48
SET /A CURRENTSTATE=48
REM ------------------------------------------
REM - Clean new Documents that are being added
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanNewDocuments.err"
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
REM --------------------------------------
REM - Load DocumentMain with New Documents
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err"
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
REM ----------------------------------
REM - Load Hierarchy for new Documents
REM ----------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Hierarchy Entries For New Documents ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR adding new hierarchy entries for new documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ===========================================================================
REM = Handle Updated Non-Versioned Documents ==================================
REM ===========================================================================

:Step51
SET /A CURRENTSTATE=51
REM ----------------------------------------
REM - Clean Documents that are being updated
REM ----------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning Updated Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanUpdatedDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step52
SET /A CURRENTSTATE=52
REM ------------------------------------------
REM - Load DocumentMain with updated Documents
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Documents ...
bcp %DBNAME%.dbo.DocumentMain in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocuments.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err"
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
REM ------------------------------------------------
REM - Load Hierarchy with Updated Document Hierarchy
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Document Hierarchy ...
bcp %DBNAME%.dbo.Hierarchy in ".\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err" 
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating existing document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err"
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step55
SET /A CURRENTSTATE=55
REM -------------------------------
REM - Resort the Document Hierarchy
REM -------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Resorting Document Hierarchy ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR resorting document hierarchy ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ResortDocumentHierarchy.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step56
SET /A CURRENTSTATE=56
REM --------------------------------------------------------
REM - Restore website customizations after document import -
REM --------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Restoring Website Customizations ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR restoring website customizations ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\WebsiteUpdateScript.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step57
SET /A CURRENTSTATE=57
REM ------------------------------------------------
REM - Flag System Documents in the Document System -
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting System Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting system documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\SetSystemDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step58
SET /A CURRENTSTATE=58
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

:Step59
SET /A CURRENTSTATE=59
REM --------------------------------------------------------------------
REM - Set Business Objects to "Working" state so they'll Build/Publish -
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Initializing Updated Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\WorkingBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR initializing updated business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\WorkingBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step60
SET /A CURRENTSTATE=60
REM ---------------------------------------------------------------
REM - Migrate existing iMIS Content Types to new folder hierarchy -
REM ---------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Migrating Existing Content Type Documents To New Folders ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\MigrateConentTypeDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\MigrateConentTypeDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\MigrateConentTypeDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR migrating existing content type documents to new folders ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MigrateConentTypeDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step61
SET /A CURRENTSTATE=61
REM ----------------------------------------------
REM - Generate a script to clean up SystemConfig -
REM ----------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Generating System Config Cleanup Script ...
SET INSTALLDIR=%BINDIR:~0,-4%
".\Utilities\sr" .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.sql.template .\Scriptfiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.sql __INSTALLDIR__ "%INSTALLDIR%" __TEMPDIR__ "%SYSTEMROOT%\Temp\%SERVERNAME:\=-%_%DBNAME%" 1> .\LogFiles\%UPGRADESCRIPTDIR%\GenerateSystemConfigCleanup.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GenerateSystemConfigCleanup.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR generating system config cleanup script ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\GenerateSystemConfigCleanup.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step62
SET /A CURRENTSTATE=62
REM ----------------------------------------------------------
REM - Run the generated script to clean up SystemConfig data -
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning System Config Data ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning up system config data ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanupSystemConfig.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step63
SET /A CURRENTSTATE=63
REM ----------------------------------------------
REM - Generate a script to clean up BOD Assembly -
REM ----------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Generating BOD Assembly Cleanup Script ...
SET INSTALLDIR=%BINDIR:~0,-4%
".\Utilities\sr" .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.cmd.template .\Scriptfiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.cmd __INSTALLDIR__ "%INSTALLDIR%" __TEMPDIR__ "%SYSTEMROOT%\Temp\%SERVERNAME:\=-%_%DBNAME%" 1> .\LogFiles\%UPGRADESCRIPTDIR%\GenerateBODAssemblyCleanup.cmd.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GenerateBODAssemblyCleanup.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR generating BOD Assembly cleanup script ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\GenerateBODAssemblyCleanup.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step64
SET /A CURRENTSTATE=64
REM ---------------------------------------------------------
REM - Run the generated script to clean up the BOD Assembly -
REM ---------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning up the BOD Assembly ...
CALL .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.cmd 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning up the BOD Assembly ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CleanupBODAssembly.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step65
SET /A CURRENTSTATE=65
REM --------------------------------------
REM - Prepare to Update the License Keys -
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Preparing License Update ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log /y > nul
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE [dbo].[LicenseLegacyMap]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE [dbo].[LicenseMap]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE [dbo].[LicenseMapMaster]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "TRUNCATE TABLE [dbo].[UniformLicense]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "DELETE FROM [dbo].[LicenseTypeRef]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -Q "DELETE FROM [dbo].[License]" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err
SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
IF %ERRORFLAG% NEQ 0 (
    @echo.
    @echo *** ERROR preparing license update ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\PrepareLicenseUpdate.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step66
SET /A CURRENTSTATE=66
REM ---------------------------
REM - Update the License Keys -
REM ---------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating License Keys ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.log /y > nul
for %%i in (License,LicenseLegacyMap,LicenseMap,LicenseMapMaster,LicenseTypeRef,UniformLicense) do (
    echo Table %%i 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.log"
    bcp %DBNAME%.dbo.%%i in ".\AsiTableData\%UPGRADESCRIPTDIR%\%%i.dat" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\%%i.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.err
    SET /A ERRORFLAG=%ERRORFLAG% + %ERRORLEVEL%
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.log"
)
IF %ERRORFLAG% NEQ 0 (
    @echo.
    @echo *** ERROR updating license keys ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseKeys.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step67
SET /A CURRENTSTATE=67
REM --------------------------
REM - Update License Checksums
REM --------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating License Checksums ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateLicenseChecksums.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseChecksums.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseChecksums.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating license checksums ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateLicenseChecksums.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step68
SET /A CURRENTSTATE=68
REM ------------------------------
REM - Rebuild Legacy License Table
REM ------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Rebuilding Product Licenses ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR rebuilding product licenses ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step69
SET /A CURRENTSTATE=69
REM ---------------------------------
REM - Update Standard Report Specs  -
REM ---------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Standard Report Specs ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating standard report specs ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step70
SET /A CURRENTSTATE=70
REM ------------------------------------
REM - Update Miscellaneous Table Data  -
REM ------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Miscellaneous Table Data ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateMiscTableData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateMiscTableData.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateMiscTableData.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating miscellaneous table data ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateMiscTableData.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step71
SET /A CURRENTSTATE=71
REM --------------------------------
REM - Update System Config entries -
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating System Configuration ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating system configuration ***
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

:Step72
SET /A CURRENTSTATE=72
REM ---------------------------
REM - Update UserKey References
REM ---------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating UserKey References ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateUserKeys.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateUserKeys.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateUserKeys.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating user key references ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateUserKeys.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step73
SET /A CURRENTSTATE=73
REM ---------------------------------------------------------
REM - Fix up mismatched SQL aliases, users, and logins.     -
REM - This step always produces errors, so do not do any    -
REM - error handling, and route all errors to the log file. -
REM ---------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Dropping old SQL Logins ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixSqlLogins.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\FixSqlLogins.log 2> NUL
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step74
SET /A CURRENTSTATE=74
REM -----------------------------------------------------------
REM - Create the necessary SQL logins for iMIS desktop client -
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating SQL Logins ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateSqlLogins.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateSqlLogins.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateSqlLogins.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating SQL logins ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateSqlLogins.err"
    @echo.
    @echo *** PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step75
SET /A CURRENTSTATE=75
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

:Step76
SET /A CURRENTSTATE=76
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

:Step77
SET /A CURRENTSTATE=77
REM -------------------------------------------------
REM - Ensure FK Constraints are all valid and trusted
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Ensuring Foreign Key Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR ensuring foreign key constraints ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step78
SET /A CURRENTSTATE=78
REM ---------------------------------------------------
REM - Ensure all Default Constraints are properly named
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Renaming Default Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR renaming default constraints ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

REM ----------------------------------------
REM - Skip build-publish step if requested -
REM ----------------------------------------
IF %BUILDPUBLISHBOS% EQU 0 GOTO NoBuildPublishBos

:Step79
SET /A CURRENTSTATE=79
REM ----------------------------------------------------------------------------
REM - Build and Publish all updated BO objects to ensure everything is in sync -
REM ----------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Building And Publishing Updated Business Objects ...
"%BINDIR%\BuildPublishBOs.exe" -W -S -CS %SERVERNAME% -CU %USERNAME% -CP %PASSWORD% -CD %DBNAME% | .\Utilities\Tee /FOE:: .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishUpdatedBOs.log
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error building and publishing updated business objects... 
    @echo     Please check the logs to determine which objects failed to publish.
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step80
SET /A CURRENTSTATE=80
REM -------------------------------------------------------------------------------
REM - Build and Publish all additional BO objects to ensure everything is in sync -
REM -------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Building And Publishing Additional Business Objects ...
"%BINDIR%\BuildPublishBOs.exe" -O Activity,CsActivity,CsCommitteePosition,CsInvoice,CsNameLog,CsNameNote,CsOrders,CsProductType,Donation,Gift,GiftAidClaim,GiftAidClaimDetail,GiftAidClaimHeader,GiftAidDeclaration,GiftHistory,GiftHistorySummary,GiftsReceived,GroupInfo,NetContact,RecurringDonationCommitment,RecurringDonationExpectedPayment,RecurringDonationExpectedPaymentSet,RecurringDonationExpectedPaymentSetList,RecurringDonationExpectedPaymentSetStatus,RecurringDonationExpectedPaymentStatus,RecurringDonationFrequencyRef,RecurringDonationMatchStatus,StoreFeaturedProducts,TaskItem,WorkflowQueueItemWithStatus -CS %SERVERNAME% -CU %USERNAME% -CP %PASSWORD% -CD %DBNAME% | .\Utilities\Tee /FOE:: .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishUpdatedBOs.log
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error building and publishing updated business objects... 
    @echo     Please check the logs to determine which objects failed to publish.
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step81
SET /A CURRENTSTATE=81
REM -------------------------------------------------------------------------
REM - Build and Publish all user BO objects to ensure everything is in sync -
REM -------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Building And Publishing User Business Objects ...
"%BINDIR%\BuildPublishBOs.exe" -X -CS %SERVERNAME% -CU %USERNAME% -CP %PASSWORD% -CD %DBNAME% | .\Utilities\Tee /FOE:: .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishUserBOs.log
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error building and publishing user business objects... 
    @echo     Please check the logs to determine which objects failed to publish.
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:NoBuildPublishBos

:Step82
SET /A CURRENTSTATE=82
REM --------------------------------------------------------------------------
REM - Refresh view metadata for all views
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Refreshing Views ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR refreshing views ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RefreshViewMetadata.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step83
SET /A CURRENTSTATE=83
REM --------------------------------------------------
REM - Migrate custom iParts to new document folders  -
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Migrating Custom iParts to New Document Folders ...
"%BINDIR%\ConvertWebParts.exe" -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME% >> .\LogFiles\%UPGRADESCRIPTDIR%\MigrateCustomWebParts.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\MigrateCustomWebParts.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR migrating custom iParts to new document folders ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MigrateCustomWebParts.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step84
SET /A CURRENTSTATE=84
REM ----------------------------------
REM - Remove Obsolete WebPart Tables -
REM ----------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Removing Obsolete WebPart Tables ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropWebGalleryTables.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropWebGalleryTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropWebGalleryTables.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR removing obsolete webpart tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DropWebGalleryTables.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step85
SET /A CURRENTSTATE=85
REM --------------------------------------------------------------------
REM - Encrypt CCAuthAcct passwords
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Encrypting passwords in CCAuthAcct ...
"%BINDIR%\EncryptCCAuthAcct.exe" -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -D %DBNAME% 1> .\LogFiles\%UPGRADESCRIPTDIR%\EncryptCCAuthAcct.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\EncryptCCAuthAcct.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error encrypting CCAuthAcct passwords... 
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step86
SET /A CURRENTSTATE=86
REM --------------------------------------------------------------------
REM - Fix up the WsdlHelpGenerator.aspx page in .Net
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Fixing up WsdlHelpGenerator Page ...
"%BINDIR%\FixWsdlGeneratorPage.exe" 1> .\LogFiles\%UPGRADESCRIPTDIR%\FixWsdlGeneratorPage.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixWsdlGeneratorPage.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error fixing up the WsdlHelpGenerator Page... 
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step87
SET /A CURRENTSTATE=87
REM --------------------------------------------
REM - Fix up Orphaned Public Users
REM --------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Fixing orphaned public users ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixOrphanedAspnetUsersRecordsWithUserMainProviderKey.sql | .\Utilities\Tee.exe /FOO:":" /FOE:"PRINT|SELECT" .\LogFiles\%UPGRADESCRIPTDIR%\FixOrphanedAspnetUsersRecordsWithUserMainProviderKey.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixOrphanedAspnetUsersRecordsWithUserMainProviderKey.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR fixing orphaned public users ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\FixOrphanedAspnetUsersRecordsWithUserMainProviderKey.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step88
SET /A CURRENTSTATE=88
REM --------------------------------------------------------------------------
REM - Finally, update the database version number to reflect the new version -
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating DB version ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating DB version ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step89
SET /A CURRENTSTATE=89
REM -----------------------------
REM - Upgrade Process Complete! -
REM -----------------------------
@ECHO.
@ECHO Upgrade process complete!
@ECHO Database successfully upgraded to version %NEWIMISVERSTR%
".\Utilities\DBVersion" -SetState 0 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
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
