@ECHO OFF
SETLOCAL
@ECHO.
@ECHO ================================================
@ECHO = iMIS 15.2.x Database Upgrade Driver Script   =
@ECHO ================================================
@ECHO.
SET BUILDPUBLISHBOS=1

REM ----------------------------------------------------------
REM - Set the Previous (expected) and Current (upgrading to) -
REM - versions here, in both readable string and int values  -
REM ---------------------------------------------------------- 
SET PREVVERSTR=15.2.0
SET PREVVERVALUE=150200

REM * SET IDENTIFIER VVVV------- **
SET UPGRADESCRIPTDIR=0002_DBUpgrade

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
REM Handle ! characters in passwords
SET PASSWORD=%PASSWORD:!=^^^^!%
SETLOCAL ENABLEDELAYEDEXPANSION

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
IF %BCPVERSTR% LSS 9 (
    @echo.
    @echo *** ERROR: Expected SQL Server Client Tools 2005 [version 9] or later. 
    @echo *** ERROR: The specified SQL Server Tools are at version %BCPVERSTR%.
    @echo *** ERROR: If you have SQL Server Tools 2005 or later installed, you may
    @echo *** ERROR: need to edit the System PATH Environment Variable in order to
    @echo *** ERROR: ensure that SQL Server Tools 2005 [version 9] or later is
    @echo *** ERROR: FIRST on the path.  Or uninstall SQL Server Tools 2000.
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
) ELSE (
    @ECHO   SQL Client Tools Version: %BCPVERSTR%
)

IF %BCPVERSTR%0 LSS %SQLSERVER% (
    @echo *** ERROR: Expected SQL Server Client Tools version to match SQL Server version. 
    @echo *** ERROR: The specified SQL Server Tools are at version %BCPVERSTR%.
    @echo *** ERROR: The specified SQL Server is at version %SQLSERVER%.
    @echo *** ERROR: You may need to edit the System PATH Environment Variable in order 
    @echo *** ERROR: to ensure that SQL Server Tools for the version of SQL Server you are 
    @echo *** ERROR: using is FIRST on the path.  Or uninstall the previous version of 
    @echo *** ERROR: SQL Server Tools.
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)

osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -b -r -h-1 -Q "EXIT(SELECT CHARINDEX('_CI_', CAST(SERVERPROPERTY('COLLATION') AS sysname)))" > NUL
SET ISCASEINSENSITIVE=%ERRORLEVEL%
IF %ISCASEINSENSITIVE% EQU 0 (
    @echo *** ERROR: Expected SQL Server to be installed with a case-insensitive collation. 
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

REM --------------------------------------------------------------------
REM - Grab the current upgrade script version string and code (to detect
REM - if the script needs to run or not)
REM --------------------------------------------------------------------
SET DBVERSTR=""
FOR /F "tokens=*" %%i IN ('.\Utilities\DBVersion -GetVersion -E -S "%SERVERNAME%" -U %USERNAME% -P %PASSWORD% -D %DBNAME%') do SET DBVERSTR=%%i
SET CURRVERVALUE=""
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersionCode.txt (
    FOR /F "tokens=1 delims= " %%f in (.\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersionCode.txt) do  SET CURRVERVALUE=%%f
)
SET CURRVERSTR=""
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersionString.txt (
    FOR /F "tokens=1 delims= " %%f in (.\ScriptFiles\%UPGRADESCRIPTDIR%\DBVersionString.txt) do  SET CURRVERSTR=%%f
)

REM ---------------------------------------------------------------------
REM - Exit gracefully if database is already above the expected version -
REM ---------------------------------------------------------------------
IF %DBVER% GTR %CURRVERVALUE% (
    @ECHO.
    @ECHO Database already upgraded to version %DBVERSTR% ... exiting
    @ECHO.
    EXIT /B 0
) ELSE IF %DBVER% EQU %CURRVERVALUE% (
    IF %DBSTATE% EQU 0 (
        IF %DBBUILD% NEQ 0 (
            @ECHO.
            @ECHO Database already upgraded to version %DBVERSTR% ... exiting
            @ECHO.
            EXIT /B 0
        )
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
REM - tool to convert the format files to something SQLServer 2005's BCP  -
REM - utility can read.  Why SQLServer2008's BCP can't generate files     -
REM - that SQLServer2005's BCP can read is anybody's guess.               -
REM -----------------------------------------------------------------------
IF EXIST .\FormatFiles\%UPGRADESCRIPTDIR% (
    .\Utilities\CvtFmt.exe TO%BCPVERSTR%0 .\FormatFiles\%UPGRADESCRIPTDIR%
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
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateObsoleteItems.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateObsoleteItems.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateObsoleteItems.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR dropping obsolete database items ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateObsoleteItems.err"
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
REM ------------------------------------------
REM - Delete old and obsolete commerce objects
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Dropping Obsolete Commerce Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropObsoleteCommerceObjects.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteCommerceObjects.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteCommerceObjects.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR dropping obsolete commerce objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DropObsoleteCommerceObjects.err"
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

:Step5
SET /A CURRENTSTATE=5
REM ---------------------------------------------------------------------------------------------
REM - Create all the new iMIS 15 database tables.  If the table already exists in this database -
REM - then it is left alone.  Following steps will modify those tables in-place to match what   -
REM - the schema of the new tables.  Column order might be affected.                            -
REM ---------------------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating New Database Tables ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateTables.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTables.err
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

:Step6
SET /A CURRENTSTATE=6
REM ---------------------------------------------------
REM - Ensure all Default Constraints are properly named
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Renaming Default Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RenameDefaultConstraints.err
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

:Step7
SET /A CURRENTSTATE=7
REM --------------------------------
REM - Modify other existing tables -
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Modifying Existing Tables ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateTableSchema.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableSchema.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableSchema.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR modifying existing tables ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableSchema.err"
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
REM --------------------------------------------------
REM - Create the 'Staff' group, and 'Staff' security -
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Staff Group And Security ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateStaffGroupAndSecurity.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateStaffGroupAndSecurity.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateStaffGroupAndSecurity.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating staff group and security ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateStaffGroupAndSecurity.err"
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
REM ----------------------------------------------------------------------------
REM - Create all User Defined Functions.  Any functions with the same name are -
REM - replaced with the new definition.  Any other functions are left alone.   -
REM ----------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating User Defined Functions ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateFunctions.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFunctions.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFunctions.err
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

:Step10
SET /A CURRENTSTATE=10
REM ----------------------------------------------------------------
REM - Create new Views.  Any views with the same name are replaced -
REM - with the new definition.  Any other views are left alone.    -
REM ----------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Views ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateViews.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateViews.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateViews.err
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

:Step11
SET /A CURRENTSTATE=11
REM ---------------------------------------------------
REM - Add all the necessary iMIS 15 database triggers -
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Triggers ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateTriggers.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTriggers.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateTriggers.err
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

:Step12
SET /A CURRENTSTATE=12
REM ----------------------------------------------------------------------------------
REM - Create all Stored Procedures.  Any stored procedures with the same name are    -
REM - replaced with the new definition.  Any other stored procedures are left alone. -
REM ----------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Stored Procedures ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateProcedures.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateProcedures.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateProcedures.err
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

:Step13
SET /A CURRENTSTATE=13
REM -------------------------------
REM - Drop non-PK Clustered Indexes
REM -------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Dropping Non-PK Clustered Indexes ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\DropNonPKClusteredIndexes.err
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

:Step14
REM ----------------------------------------------------------------------------------------
REM - Clear all the Foreign Key constraints, so they don't hang us up while making changes -
REM ----------------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Clearing FK Constraints ...
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured" DEL /F /Q ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured"
(osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r1 -w 2000 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.sql 2>&1 1>DropAllFKConstraints.log || copy nul ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured" /y > nul ) | .\Utilities\Tee.exe /FOO:"INFO:" /FOE:"PRINT" .\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.log  
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured" (
    @echo.
    @echo *** ERROR dropping FK constraints ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.log" | FINDSTR /L /I "Error"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured" DEL /F /Q ".\LogFiles\%UPGRADESCRIPTDIR%\DropAllFKConstraints.AnERROROccured"
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step15
SET /A CURRENTSTATE=14
REM ----------------------------------------------------------------------------------
REM - Truncate new *Ref tables, so that they have known contents when they're loaded -
REM ----------------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Loading Ref Tables ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\RefTables.txt) do (
    osql -t -S "%SERVERNAME%" -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -Q "TRUNCATE TABLE %%i" 1>> .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.log 2>> .\LogFiles\%UPGRADESCRIPTDIR%\TruncateRefTables.err
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\LoadRefTables.log"
)
IF !ERRORFLAG! NEQ 0 (
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

:Step16
SET /A CURRENTSTATE=15
REM --------------------------------------
REM - Merge new data in to existing tables
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Loading Merge Tables ...
IF NOT EXIST .\AsiTableData\%UPGRADESCRIPTDIR%\MergeTables.txt (
    @echo.
    @echo *** ERROR loading merge tables ***
    @echo.
    @echo MergeTables.txt file not found
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\MergeTables.txt) do (
    echo Table %%i 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log"
    osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\Merge%%iData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.err
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeTables.log"
)
IF !ERRORFLAG! NEQ 0 (
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

:Step17
SET /A CURRENTSTATE=16
REM -----------------------
REM - Re-create all indexes
REM -----------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Re-Creating Indexes ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateIndexes.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateIndexes.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateIndexes.err
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

:Step18
SET /A CURRENTSTATE=17
REM ---------------------------------
REM - Apply Foreign Key constraints -
REM ---------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Applying Foreign Key Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateFKs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFKs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateFKs.err
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

:Step19
SET /A CURRENTSTATE=18
REM ------------------------------------
REM - Update Table Data                -
REM ------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Table Data ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateTableData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableData.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableData.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating table data ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateTableData.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step20
SET /A CURRENTSTATE=19
REM ---------------------------------
REM - Convert Orders to include VAT -
REM ---------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Converting Orders to Include VAT ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\VATInclusiveConversion.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\VATInclusiveConversion.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\VATInclusiveConversion.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR converting orders to include VAT ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\VATInclusiveConversion.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step21
SET /A CURRENTSTATE=20
REM --------------------------------
REM - Update System Config entries -
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating System Configuration ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateSystemConfig.err
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

:Step22
SET /A CURRENTSTATE=21
REM --------------------------------
REM - Fix-Up Query Access Settings
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Fixing Up Existing Query Access Settings...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\FixUpQueryAccessSettings.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\FixUpQueryAccessSettings.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\FixUpQueryAccessSettings.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR fixing up existing query settings ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\FixUpQueryAccessSettings.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step23
SET /A CURRENTSTATE=22
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

:Step24
SET /A CURRENTSTATE=23
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

:Step25
SET /A CURRENTSTATE=24
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step26
SET /A CURRENTSTATE=25
REM -----------------------------------------------
REM - Archive Business Objects that are being added
REM -----------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving New Business Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveAddedBOs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedBOs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedBOs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving new business objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedBOs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step27
SET /A CURRENTSTATE=26
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

:Step28
SET /A CURRENTSTATE=27
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

:Step29
SET /A CURRENTSTATE=28
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step30
SET /A CURRENTSTATE=29
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step31
SET /A CURRENTSTATE=30
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

:Step32
SET /A CURRENTSTATE=31
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

REM ===========================================================================
REM = Handle Added Navigation Documents =======================================
REM ===========================================================================

:Step33
SET /A CURRENTSTATE=32
REM -------------------------------------------------
REM - Clean Navigation Documents that are being added
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning added navigation documents ***
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

:Step34
SET /A CURRENTSTATE=33
REM ---------------------------------------------------
REM - Archive Navigation Documents that are being added
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving New Navigation Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveAddedNavigationDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedNavigationDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedNavigationDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving added navigation documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedNavigationDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step35
SET /A CURRENTSTATE=34
REM ---------------------------------------------------
REM - Load DocumentMain with Added Navigation Documents
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step36
SET /A CURRENTSTATE=35
REM ---------------------------------------------------------
REM - Load Hierarchy with Added Navigation Document Hierarchy
REM ---------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Navigation Document Hierarchy ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewNavigationDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step37
SET /A CURRENTSTATE=36
REM ---------------------------------------------------
REM - Determine Updated Navigation Document Sort Orders
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Determining Updated Navigation Document Sort Orders ...
IF EXIST .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql ATTRIB -r .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -h-1 -b -r -w 4095 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationSortOrderFixupGenerator.sql 1> .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql 2> .\LogFiles\%UPGRADESCRIPTDIR%\DetermineUpdatedNavigationDocumentSortOrders.err
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

:Step38
SET /A CURRENTSTATE=37
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step39
SET /A CURRENTSTATE=38
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step40
SET /A CURRENTSTATE=39
REM -----------------------------------------------------
REM - Load DocumentMain with updated Navigation Documents
REM -----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step41
SET /A CURRENTSTATE=40
REM -----------------------------------------------------------
REM - Load Hierarchy with Updated Navigation Document Hierarchy
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Navigation Document Hierarchy ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedNavigationDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step42
SET /A CURRENTSTATE=41
REM -----------------------------------------------------------
REM - Setting Updated Navigation Document Sort Orders
REM -----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting Updated Navigation Document Sort Orders ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\SetUpdatedNavigationDocumentSortOrders.err
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

:Step43
SET /A CURRENTSTATE=42
REM ------------------------------------------------
REM - Clean Versioned Documents that are being added
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Cleaning New Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CleanNewVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning added versioned documents ***
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

:Step44
SET /A CURRENTSTATE=43
REM --------------------------------------------------
REM - Archive Versioned Documents that are being added
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Archiving New Versioned Documents ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ArchiveAddedVersionedDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedVersionedDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedVersionedDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR archiving added versioned documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\ArchiveAddedVersionedDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step45
SET /A CURRENTSTATE=44
REM --------------------------------------------------
REM - Load DocumentMain with Added Versioned Documents
REM --------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step46
SET /A CURRENTSTATE=45
REM ----------------------------------------------------------
REM - Load Hierarchy with Added Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Versioned Document Hierarchy ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewVersionedDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step47
SET /A CURRENTSTATE=46
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

:Step48
SET /A CURRENTSTATE=47
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step49
SET /A CURRENTSTATE=48
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step50
SET /A CURRENTSTATE=49
REM ----------------------------------------------------
REM - Load DocumentMain with updated Versioned Documents
REM ----------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step51
SET /A CURRENTSTATE=50
REM ----------------------------------------------------------
REM - Load Hierarchy with Updated Versioned Document Hierarchy
REM ----------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Versioned Document Hierarchy ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedVersionedDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step52
SET /A CURRENTSTATE=51
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step53
SET /A CURRENTSTATE=52
REM --------------------------------------
REM - Load DocumentMain with New Documents
REM --------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step54
SET /A CURRENTSTATE=53
REM ----------------------------------
REM - Load Hierarchy for new Documents
REM ----------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding New Hierarchy Entries For New Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\NewDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\NewDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step55
SET /A CURRENTSTATE=54
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step56
SET /A CURRENTSTATE=55
REM ------------------------------------------
REM - Load DocumentMain with updated Documents
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Documents ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocuments_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log"
    bcp %DBNAME%.dbo.DocumentMain in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\DocumentMain.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocuments.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step57
SET /A CURRENTSTATE=56
REM ------------------------------------------------
REM - Load Hierarchy with Updated Document Hierarchy
REM ------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Existing Document Hierarchy ...
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err /y > nul
for %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy_*.dat) do (
    ECHO Loading %%i >> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log"
    bcp %DBNAME%.dbo.Hierarchy in "%%i" -f ".\FormatFiles\%UPGRADESCRIPTDIR%\Hierarchy.fmt" -V 90 -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.log" -E 2>> ".\LogFiles\%UPGRADESCRIPTDIR%\UpdatedDocumentHierarchy.err" 
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
)
IF !ERRORFLAG! NEQ 0 (
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

:Step58
SET /A CURRENTSTATE=57
REM --------------------------------
REM - Update Document System Objects
REM --------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Document System Objects ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateDocumentSystemObjects.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDocumentSystemObjects.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDocumentSystemObjects.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating document system objects ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateDocumentSystemObjects.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step59
SET /A CURRENTSTATE=58
REM ------------------------------------------
REM - Merge new Hierarchy Roots & Perspectives
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Merging Hierarchy Roots And Perspectives ...
IF NOT EXIST .\AsiTableData\%UPGRADESCRIPTDIR%\MergeRootPerspectives.txt (
    @echo.
    @echo *** ERROR merging hierarchy roots and perspectives ***
    @echo.
    @echo MergeRootPerspectives.txt file not found
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
SET /A ERRORFLAG=0
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.log /y > nul
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.err /y > nul
for /F %%i in (.\AsiTableData\%UPGRADESCRIPTDIR%\MergeRootPerspectives.txt) do (
    echo Table %%i 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.log"
    osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -i .\ScriptFiles\%UPGRADESCRIPTDIR%\Merge%%iData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.err
    SET /A ERRORFLAG=!ERRORFLAG! + !ERRORLEVEL!
    echo ---------------------------------------------------------------------- 1>> ".\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.log"
)
IF !ERRORFLAG! NEQ 0 (
    @echo.
    @echo *** ERROR merging hierarchy roots and perspectives ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.log"
    type ".\LogFiles\%UPGRADESCRIPTDIR%\MergeRootPerspectives.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step60
SET /A CURRENTSTATE=59
REM ---------------------------------------------------
REM - Correct the createdOn/createdBy info on Documents
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Correcting CreatedOn Document Dates ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CorrectCreatedOnDateCreatedByUserDocuments.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CorrectCreatedOnDateCreatedByUserDocuments.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CorrectCreatedOnDateCreatedByUserDocuments.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR cleaning updated documents ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CorrectCreatedOnDateCreatedByUserDocuments.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step61
SET /A CURRENTSTATE=60
REM ---------------------------------------------------
REM - Restore Document System after loading new objects
REM ---------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Restoring Document System After Loading New Objects ...
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured" DEL /F /Q ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured"
(osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -h-1 -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.sql || copy nul ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured" /y > nul )  2>> .\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.err | .\Utilities\Tee.exe /FOO:"WARNING:" /FOE:"SELECT"  .\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.log
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured" (
    @echo.
    @echo *** ERROR restoring document system after loading ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
IF EXIST ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured" DEL /F /Q ".\LogFiles\%UPGRADESCRIPTDIR%\RestoreDocumentMain.AnERROROccured"
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step62
SET /A CURRENTSTATE=61
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

:Step63
SET /A CURRENTSTATE=62
REM ----------------------------
REM - Add new Mobile Member site
REM ----------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Creating Mobile Site ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -h-1 -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\CreateMobileSite.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\CreateMobileSite.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\CreateMobileSite.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR creating mobile site ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\CreateMobileSite.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step64
SET /A CURRENTSTATE=63
REM ----------------------------
REM - Update URL Shortcut Data 
REM ----------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating URL Shortcut Data ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -h-1 -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateShortcutData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateShortcutData.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateShortcutData.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR updating url shortcut data ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\UpdateShortcutData.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step65
SET /A CURRENTSTATE=64
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step66
SET /A CURRENTSTATE=65
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step67
SET /A CURRENTSTATE=66
REM --------------------------------------------
REM - Apply ACL Updates to the Document System -
REM --------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Setting Document ACLs ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\SetDocumentACLs.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\SetDocumentACLs.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\SetDocumentACLs.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR setting document acls ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\SetDocumentACLs.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step68
SET /A CURRENTSTATE=67
REM --------------------------------------------------------
REM - Add Component Registry Entries for New Content Types -
REM --------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Adding Component Registry Entries for New Content Types ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\NewRCTComponentEntries.err
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

:Step69
SET /A CURRENTSTATE=68
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step70
SET /A CURRENTSTATE=69
REM ------------------------------------------
REM - Grant select permissions all BO views  -
REM ------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Granting Execute Permissions ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GrantSelectOnViews.err
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

:Step71
SET /A CURRENTSTATE=70
REM ----------------------------------------------------------------------------
REM - Grant permissions to all IMIS data objects
REM ----------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Granting Permissions To IMIS ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\GrantPermissions.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\GrantPermissions.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\GrantPermissions.err
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

:Step72
SET /A CURRENTSTATE=71
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

:Step73
SET /A CURRENTSTATE=72
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

:Step74
SET /A CURRENTSTATE=73
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

:Step75
SET /A CURRENTSTATE=74
REM ------------------------------
REM - Rebuild Legacy License Table
REM ------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Rebuilding Product Licenses ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\RebuildLicenseLegacyList.err
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

:Step76
SET /A CURRENTSTATE=75
REM ---------------------------------
REM - Update Standard Report Specs  -
REM ---------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating Standard Report Specs ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\ResetReportDescData.err
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

:Step77
SET /A CURRENTSTATE=76
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

:Step78
SET /A CURRENTSTATE=77
REM -------------------------------------------------
REM - Ensure FK Constraints are all valid and trusted
REM -------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Ensuring Foreign Key Constraints ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureAllFKConstraints.err
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

:Step79
SET /A CURRENTSTATE=78
REM -------------------------------------------------------------------------
REM - Ensure all Contacts have correct entries and Required Users are present
REM -------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Ensuring Required Contact and User Entries Exist ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -u -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\EnsureContactsAndUsers.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureContactsAndUsers.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\EnsureContactsAndUsers.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR ensuring required contact and user entries exist ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\EnsureContactsAndUsers.err"
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

:Step80
SET /A CURRENTSTATE=79
REM --------------------------------------------------------------------
REM - Build and Publish all BO objects to ensure everything is in sync -
REM --------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Building And Publishing Business Objects ...
copy nul .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishBOs.log /y > nul
"%BINDIR%\BuildPublishBOs.exe" -W -S -CS %SERVERNAME% -CU %USERNAME% -CP %PASSWORD% -CD %DBNAME%  | .\Utilities\Tee /FOE:: .\LogFiles\%UPGRADESCRIPTDIR%\BuildPublishBOs.log
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo     Error building and publishing business objects... 
    @echo     Please check the logs to determine which objects failed to publish.
    @echo     Continuing...
    @echo.
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:NoBuildPublishBos

:Step81
SET /A CURRENTSTATE=80
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
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step82
SET /A CURRENTSTATE=81
REM --------------------------------------------------------------------------
REM - Tuning Contact and Document system performance
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Tuning Contact and Document System Performance ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\TuneContactAndDocumentSystemPerformance.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\TuneContactAndDocumentSystemPerformance.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\TuneContactAndDocumentSystemPerformance.err
IF %ERRORLEVEL% NEQ 0 (
    @echo.
    @echo *** ERROR tuning contact and document system performance ***
    @echo.
    type ".\LogFiles\%UPGRADESCRIPTDIR%\TuneContactAndDocumentSystemPerformance.err"
    @echo.
    @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! ***
    @echo.
    EXIT /B 1
)
".\Utilities\DBVersion" -SetState %CURRENTSTATE% -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% 
IF %ERRORLEVEL% LSS 0 ( @echo *** ERROR Accessing Database State *** & @echo *** UPGRADE PROCESS ENDED WITH ERRORS !!! *** & @echo. & EXIT /B 1 )
@ECHO Step %CURRENTSTATE% Done.

:Step83
SET /A CURRENTSTATE=82
REM --------------------------------------------------------------------------
REM - Finally, update the database version number to reflect the new version -
REM --------------------------------------------------------------------------
@ECHO.
IF "%LOGTIME%" EQU "1" ECHO %date%-%time%
@ECHO Updating DB version ...
osql -t -S %SERVERNAME% -U %USERNAME% -P %PASSWORD% -d %DBNAME% -n -e -b -r -w 256 -i .\ScriptFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.sql 1> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.log 2> .\LogFiles\%UPGRADESCRIPTDIR%\UpdateDatabaseVersion.err
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

:Step84
SET /A CURRENTSTATE=83
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
@ECHO	binDir = absolute path to the Bin directory of root install of iMIS 100
@ECHO	serverName = Name of the SQL Server instance to use
@ECHO 	databaseName = Name of the Database to use
@ECHO 	userName = SQL Server user name to use for login (optional)
@ECHO 	password = The password for the SQL Server user login (optional)
@ECHO.
EXIT /B 1
