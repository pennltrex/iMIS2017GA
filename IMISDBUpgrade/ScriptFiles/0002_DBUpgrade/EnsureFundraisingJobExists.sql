EXIT(
DECLARE @JobID BINARY(16)  
DECLARE @returnCode INT    
SET  @returnCode = 0    
 
IF (SELECT COUNT(1) FROM msdb.dbo.syscategories WHERE name = N'Uncategorized (Local)') < 1 
    EXECUTE msdb.dbo.sp_add_category @name = N'Uncategorized (Local)'

SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
 WHERE (name = N'ASI Update Fundraising Views') 
       
IF (@JobID IS NOT NULL)    
BEGIN  
    IF (NOT EXISTS (SELECT 1 
                      FROM msdb.dbo.sysjobservers 
                     WHERE(job_id = @JobID) AND (server_id <> 0))) 
    BEGIN
        EXECUTE msdb.dbo.sp_delete_job @job_name = N'ASI Update Fundraising Views' 
    END
    SET @JobID = NULL
END 

BEGIN TRANSACTION
DECLARE @dbName sysname

SELECT @dbName = DB_NAME()

EXECUTE @returnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , 
                                          @job_name = N'ASI Update Fundraising Views', 
                                          @owner_login_name = N'sa', 
                                          @description = N'No description available.', 
                                          @category_name = N'[Uncategorized (Local)]', 
                                          @enabled = 0, 
                                          @notify_level_email = 0, 
                                          @notify_level_page = 0, 
                                          @notify_level_netsend = 0, 
                                          @notify_level_eventlog = 2, 
                                          @delete_level= 0
                                          
IF (@@ERROR <> 0 OR @returnCode <> 0) 
BEGIN
    SELECT 'ERROR adding job'
    ROLLBACK TRANSACTION
    SELECT 1
    RETURN 
END

EXECUTE @returnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, 
                                              @step_id = 1, @step_name = N'execute procedure', 
                                              @command = N'exec dbo.sp_asi_UpdateFundraisingViewTables ', 
                                              @database_name = @dbName, @server = N'', 
                                              @database_user_name = N'', 
                                              @subsystem = N'TSQL', 
                                              @cmdexec_success_code = 0, 
                                              @flags = 0, 
                                              @retry_attempts = 0, 
                                              @retry_interval = 1, 
                                              @output_file_name = N'', 
                                              @on_success_step_id = 0, 
                                              @on_success_action = 1, 
                                              @on_fail_step_id = 0, 
                                              @on_fail_action = 2
IF (@@ERROR <> 0 OR @returnCode <> 0) 
BEGIN
    SELECT 'ERROR Adding Job Step'
    ROLLBACK TRANSACTION
    SELECT 1
    RETURN 
END

EXECUTE @returnCode = msdb.dbo.sp_update_job @job_id = @JobID, 
                                             @start_step_id = 1 
IF (@@ERROR <> 0 OR @returnCode <> 0) 
BEGIN
    SELECT 'ERROR Updating Job Step'
    ROLLBACK TRANSACTION
    SELECT 1
    RETURN 
END

EXECUTE @returnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, 
                                                  @name = N'ASI Update Fundraising Views Schedule', 
                                                  @enabled = 1, 
                                                  @freq_type = 4, 
                                                  @active_start_date = 20120815, 
                                                  @active_start_time = 20000, 
                                                  @freq_interval = 1, 
                                                  @freq_subday_type = 1, 
                                                  @freq_subday_interval = 0, 
                                                  @freq_relative_interval = 0, 
                                                  @freq_recurrence_factor = 0, 
                                                  @active_end_date = 99991231, 
                                                  @active_end_time = 235959
IF (@@ERROR <> 0 OR @returnCode <> 0) 
BEGIN
    SELECT 'ERROR Adding Job Schedule'
    ROLLBACK TRANSACTION
    SELECT 1 
    RETURN 
END

EXECUTE @returnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, 
                                                @server_name = N'(local)' 
IF (@@ERROR <> 0 OR @returnCode <> 0) 
BEGIN
    SELECT 'ERROR Adding Job Server'
    ROLLBACK TRANSACTION
    SELECT 1
    RETURN 
END

COMMIT TRANSACTION
SELECT 0
)

