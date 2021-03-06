------------------------------------
-- Update data in existing tables --
------------------------------------
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET NOCOUNT ON
GO

EXEC [dbo].[asi_TaskRecreateTriggers];
GO

-- Beginning of script

-----------------------------------------------------------------------------------------------------------
--PBI 57918 Duplicate Contact Alert, removing "<IsSystem>True</IsSystem>" tag from SerializedTaskDefinition, and set TaskDefinitionIsSystem to 0
---------------------------------------------------------------------------------------------------------------
--change duplicate alerts serialized task definition to remove IsSystem tags
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('EF535A97-76F5-4C72-B0A1-E94681D38C99' 
    ,'Duplicate Contact Alert'     
    ,'Alerts staff that a duplicate contact record may exist'         
    ,0   
    ,1   
    ,0   
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</DataSourceId><DataSourceName>PotentialPartyDuplicates</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/Queries/PotentialPartyDuplicates</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>872dfc76-5213-4c30-8ec7-34ab72c56184</DataSourceId><DataSourceName>SelectedContact</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/SelectedContact</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Alerts staff that a duplicate contact record may exist</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Duplicate Contact Alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Possible duplicate contact(s) found.&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b4b2a5b3-3b63-4ff9-bf26-51675db2bdd5</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>184bdd32-3a46-4431-919e-a5267fa6836a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-04-01T08:15:44.44</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2015-04-09T13:18:29.377</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now
    ,@userKey    
    ,@now)
END  
ELSE
BEGIN
    UPDATE [dbo].[TaskDefinition]
    SET [SerializedTaskDefinition] = '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</DataSourceId><DataSourceName>PotentialPartyDuplicates</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/Queries/PotentialPartyDuplicates</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>872dfc76-5213-4c30-8ec7-34ab72c56184</DataSourceId><DataSourceName>SelectedContact</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/SelectedContact</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Alerts staff that a duplicate contact record may exist</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Duplicate Contact Alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Possible duplicate contact(s) found.&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b4b2a5b3-3b63-4ff9-bf26-51675db2bdd5</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>184bdd32-3a46-4431-919e-a5267fa6836a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-04-01T08:15:44.44</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2015-04-09T13:18:29.377</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
        [UpdatedByUserKey] = @userKey, [UpdatedOn] = @now, [TaskDefinitionIsSystem] = 0
    WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99'
END  
GO
 
-----------------------------------------------------------------------------------------------------------
--PBI 57918  Company Join Alerts, removing "<IsSystem>True</IsSystem>" tag from SerializedTaskDefinition, and set TaskDefinitionIsSystem to 0
---------------------------------------------------------------------------------------------------------------
 
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '168A405D-9A9E-4B70-AFFE-FA3D7E409B80')
BEGIN
    INSERT INTO [dbo].[TaskDefinition] 
    ([TaskDefinitionKey]
    ,[TaskDefinitionName]
    ,[TaskDefinitionDesc]
    ,[TaskDefinitionPriority]
    ,[TaskDefinitionIsActive]
    ,[TaskDefinitionIsSystem]
    ,[SerializedTaskDefinition]
    ,[CreatedByUserKey]
    ,[CreatedOn]
    ,[UpdatedByUserKey]
    ,[UpdatedOn]) 
    VALUES 
    ('168A405D-9A9E-4B70-AFFE-FA3D7E409B80' 
    ,'Company Join Alert' 
    ,'Creates an alert if the selected organization is not a member, prompting them to join.'   
    ,0   
    ,1   
    ,0   
    ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</DataSourceId><DataSourceName>NonMemberCompanies</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/NonMemberCompanies</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected organization is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Company Join Alert</Name><Notifications><NotificationDefinition><DataSources><string>77f57509-aa1a-41d0-967b-69b3ea410df3</string></DataSources><DefaultTemplate>&lt;p style="text-align: center;"&gt;&lt;a href="[~]/OrganizationJoinNow?ID={#NonMemberCompanies.ID}" class="PrimaryButton LargeButton TextButton"&gt;Join Now&lt;/a&gt;&lt;/p&gt;</DefaultTemplate><NotificationDefinitionId>17789d31-4275-421f-bf25-e56ab2fbacbd</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>0903f8c5-9bc7-4669-9490-7014ad64642e</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-07-07T10:31:29.737</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-07-07T10:33:56.267</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
    ,@userKey
    ,@now
    ,@userKey    
    ,@now)
END  
ELSE
BEGIN
    UPDATE [dbo].[TaskDefinition]
    SET [SerializedTaskDefinition] = '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</DataSourceId><DataSourceName>NonMemberCompanies</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/NonMemberCompanies</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected organization is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Company Join Alert</Name><Notifications><NotificationDefinition><DataSources><string>77f57509-aa1a-41d0-967b-69b3ea410df3</string></DataSources><DefaultTemplate>&lt;p style="text-align: center;"&gt;&lt;a href="[~]/OrganizationJoinNow?ID={#NonMemberCompanies.ID}" class="PrimaryButton LargeButton TextButton"&gt;Join Now&lt;/a&gt;&lt;/p&gt;</DefaultTemplate><NotificationDefinitionId>17789d31-4275-421f-bf25-e56ab2fbacbd</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>0903f8c5-9bc7-4669-9490-7014ad64642e</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-07-07T10:31:29.737</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-07-07T10:33:56.267</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
        [UpdatedByUserKey] = @userKey, [UpdatedOn] = @now, [TaskDefinitionIsSystem] = 0
    WHERE [TaskDefinitionKey] = '168A405D-9A9E-4B70-AFFE-FA3D7E409B80'
END  
GO

-----------------------------------------------------------------------------------------------------------
--PBI 57172 Update all earned registrations so the new column gets populated with their completion date
--------------------------------------------------------------------------------------------------------------- 
UPDATE [dbo].[CertificationProgramRegistration]  
   SET [CompletionDate] = CONVERT(datetimeoffset, SUBSTRING(ActionManifest, PATINDEX('%CompletedDate%', ActionManifest)+14, 
       (PATINDEX('%</CompletedDate>%', ActionManifest) - (PATINDEX('%CompletedDate%', ActionManifest)+14))))
 WHERE [RegistrationStatusCode] = 'AP' AND [CompletionDate] IS NULL
   AND SUBSTRING(ActionManifest, PATINDEX('%CompletedDate%', ActionManifest)+14, 
       (PATINDEX('%</CompletedDate>%', ActionManifest) - (PATINDEX('%CompletedDate%', ActionManifest)+14))) <> '0001-01-01T00:00:00'
 GO

-- End of script

IF NOT EXISTS ( SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'ProfileDocuments' )
BEGIN
    INSERT  INTO [dbo].[ObjectMetaData]
            ( [ObjectName] ,
              [RelatedToEntity] ,
              [IsUserDefined] ,
              [IsMultiInstance] ,
              [Version]
            )
    VALUES  ( 'ProfileDocuments' ,
              'Party' ,
              1 ,
              0 ,
              'V2'
            );
END
GO

-----------------------------------------------------------------------------------------------------------------
-- SMR 364959/PBI 58784 Blank out any and all CardNumber and SecurityCode values found in the CommunicationLog --
-----------------------------------------------------------------------------------------------------------------

-- Declare a temp-table to hold our results so we can convert to xml
IF OBJECT_ID('tempdb..#tempCommunications') IS NOT NULL DROP TABLE #tempCommunications;
CREATE TABLE #tempCommunications (CommunicationLogKey uniqueidentifier PRIMARY KEY, Communication xml)
-- Grab the rows we're interested in
INSERT INTO #tempCommunications (CommunicationLogKey, Communication)
    SELECT CommunicationLogKey, CAST(Communication AS xml) FROM CommunicationLog
     WHERE CAST(Communication AS xml).value('(//*[local-name()=''CardNumber''])[1]', 'nvarchar(128)') <> '****************'
       AND CAST(Communication AS xml).value('(//*[local-name()=''CardNumber''])[1]', 'nvarchar(128)') <> ''
       AND CAST(Communication AS xml).value('(//*[local-name()=''CardNumber''])[1]', 'nvarchar(128)') IS NOT NULL
UPDATE #tempCommunications
   SET Communication.modify('replace value of ((//*[local-name()=''CardNumber''])/text())[1] with "****************"')
UPDATE cl
   SET Communication = CAST(tc.Communication AS nvarchar(max))
  FROM CommunicationLog cl
      INNER JOIN #tempCommunications tc ON cl.CommunicationLogKey = tc.CommunicationLogKey
GO


-----------------------------------------------------------------------------
--SMR 364959/PBI 58784 Blank out any and all SecurityCode values found in the CommunicationLog --
-----------------------------------------------------------------------------

-- Declare a temp-table to hold our results so we can convert to xml
IF OBJECT_ID('tempdb..#tempCommunications') IS NOT NULL DROP TABLE #tempCommunications;
CREATE TABLE #tempCommunications (CommunicationLogKey uniqueidentifier PRIMARY KEY, Communication xml)
-- Grab the rows we're interested in
INSERT INTO #tempCommunications (CommunicationLogKey, Communication)
    SELECT CommunicationLogKey, CAST(Communication AS xml) FROM CommunicationLog
     WHERE CAST(Communication AS xml).value('(//*[local-name()=''SecurityCode''])[1]', 'nvarchar(128)') <> '***'
       AND CAST(Communication AS xml).value('(//*[local-name()=''SecurityCode''])[1]', 'nvarchar(128)') <> ''
       AND CAST(Communication AS xml).value('(//*[local-name()=''SecurityCode''])[1]', 'nvarchar(128)') IS NOT NULL
UPDATE #tempCommunications
   SET Communication.modify('replace value of ((//*[local-name()=''SecurityCode''])/text())[1] with "***"')
UPDATE cl
   SET Communication = CAST(tc.Communication AS nvarchar(max))
  FROM CommunicationLog cl
      INNER JOIN #tempCommunications tc ON cl.CommunicationLogKey = tc.CommunicationLogKey
GO


----------------------------------------------------------------------------------------------------
-- PBI 55490 - Setup Default Template
----------------------------------------------------------------------------------------------------
DECLARE @eventCode varchar(10) 
-- Set EventKey for 'Default Template'
SET @eventCode = 'T_Default'

-- Check if a default template already exist in database
IF NOT EXISTS (SELECT 1 FROM [dbo].[Meet_Master] WHERE [Template_State_Code] = 2)
BEGIN

    IF EXISTS (SELECT 1 FROM [dbo].[Meet_Master] WHERE MEETING = 'T_Default' AND [Template_State_Code] != 2)
    BEGIN
        DECLARE @i int;
        SET @i = 0;
        WHILE @i < 10 AND EXISTS (SELECT 1 FROM Meet_Master WHERE MEETING = 'T_Default' + CAST(@i AS varchar(1))) SET @i += 1;
        IF @i < 10 
            SELECT @eventCode = 'T_Default' + CAST(@i AS varchar(1))
        ELSE
            SELECT @eventCode = 'T' + RIGHT(REPLACE(CAST(NEWID() AS varchar(36)), '-', ''), 9)
    END


    --Add Default Template in Meet_Master Table
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Meet_Master] WHERE [Meeting] = @eventCode)
    BEGIN
        INSERT INTO [dbo].[Meet_Master] 
        ([Meeting],[Title],[Meeting_Type],[Status],[Web_Enabled],[Post_Registration],
         [Web_Reg_Class_Method],[Registration_Closed_Message],[Template_State_Code])
        VALUES 
        (@eventCode,'Default','REG','A',1,
        1,1 ,'Registration is closed.'
        ,2)
    END 

    --Add Default Template in EventDetails Table
    IF NOT EXISTS (SELECT 1 FROM [dbo].[EventDetails] WHERE [Meeting] = @eventCode)
    BEGIN
        INSERT INTO [dbo].[EventDetails] 
        ([Meeting],[DefaultDisplayLayoutDirectoryName],[OwnerDisplayLayoutDirectoryName])
        VALUES 
        (@eventCode,'~/EventDetail', '~/EventDashboard')
    END 
END 
GO

----------------------------------------------------------------------------------------------------
-- PBI 55490 - Delete Default Template
----------------------------------------------------------------------------------------------------
DECLARE @eventCode varchar(10) 
-- Get the EventCode for Default Template (Only 1 default template in system)
SELECT @eventCode = [MEETING] FROM [dbo].[Meet_Master] WHERE [TEMPLATE_STATE_CODE] = 2

IF EXISTS (SELECT 1 FROM [dbo].[Meet_Master] WHERE [MEETING] = @eventCode AND [TEMPLATE_STATE_CODE] = 2)
BEGIN
    --Delete Default Template in EventDetails Table
    IF EXISTS (SELECT 1 FROM [dbo].[EventDetails] WHERE [Meeting] = @eventCode)
    BEGIN
        DELETE FROM [dbo].[EventDetails]  WHERE [Meeting] = @eventCode
    END
    
    --Delete Default Template in [dbo].[Meet_Master] Table
    DELETE FROM [dbo].[Meet_Master] WHERE [MEETING] = @eventCode
END 


------------------------------------------------------------------------------------------------------------
-- Fix issue with renaming BOD objects where AlternateName isn't properly updated because it should be empty
------------------------------------------------------------------------------------------------------------
   UPDATE [dbo].[DocumentMain]
      SET [AlternateName] = N''
    WHERE [DocumentTypeCode] = 'BOD' 
      AND [AlternateName] IS NOT NULL 
      AND [AlternateName] <> '';
GO

-- Rebuild Counters
EXECUTE [dbo].[asi_RebuildCounters];
GO

------------------------------
-- PBI 59971 - migrate the assembly name for many iParts
------------------------------
UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Common' 
 WHERE [ComponentKey] IN 
 ('CC6A7345-4A79-4879-976D-E63A23BB518A',
'8B6E0869-F2B7-4382-89D4-26331EF100A6',
'B6365EBB-7505-4106-A182-DE4DC8E39858',
'7AF1A8E6-2955-42C9-9E0E-BBF27B4C177E',
'06107C15-F343-462F-8FDC-F80F5D7A7D4D',
'377FB41A-2CC4-45D1-A32A-D395A1A82347',
'80B28557-9DF5-4FE1-82FA-711CE043A46D',
'9902587A-5754-41D7-B397-08E601D46B07',
'F1EF44A4-AB91-4464-A15F-2CCF77A50229',
'886FCA56-4F84-41F8-9B09-CB198E726EDD',
'E54FEB64-8A29-4242-8439-429B265D7789',
'B3CCB151-338A-4813-9D66-9AD7881168B0',
'1F829E6A-08C5-45C3-90E6-4E6DC1C190D0',
'8B770B60-C229-4627-9D95-EFFCADAD24D9',
'5AD15CC8-F1C3-4147-B5BB-B02E93F7B0A3',
'B7860208-3285-41B8-A3E5-198DDA8D7177',
'F8437D06-5D02-4DF5-8D74-F87D5F328D08',
'48635CA7-E457-4D9F-A59E-4231D5479E47',
'83819433-1EE7-43B9-A32C-392451B713D9',
'BCEA2776-7EF2-4E8D-87BC-20FE4F650CB6',
'F1E3D712-8A81-4140-BD2A-4C3E9F1657FE',
'7FE69FC0-33C7-4DDD-A90F-FED21DFD5F49',
'1EA30077-C94C-47CD-9373-5C6528CDDE4B',
'9693A534-FB8C-4AB0-99D1-F7BDEC25E372',
'4051EB0E-C26A-42A0-8D53-A3F33730FF15',
'321580FC-3BA3-41F2-8294-317F90CE2915',
'15028C58-AA3D-4E33-88B0-3C143EC64838',
'7841BA18-164C-4FE3-B109-C9EF9197C049',
'377F845F-7FBF-424A-B06F-3DBF2FD7A710',
'83E7B102-2708-419A-8683-87B89FF4FAEC',
'C73FEA81-96D7-4CAB-8D88-8EDB67D32A69')


UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Commerce' 
 WHERE [ComponentKey] IN 
('690EBB4C-CDA4-41F2-9C38-A627EDA68D8B',
'CECF8F32-7702-4291-99A8-FC32FA05F092',
'EBD285CD-03E1-4A08-8696-A3C0B958FED7',
'C2535453-1F82-413F-93B7-01D00210FB0A',
'8897B91E-B367-4A92-B4A6-6387281B1E71',
'441D795C-4DA4-4750-9A09-41DE4FBFB8B3',
'0FA99997-2DD4-40A8-AD8F-151FE2E4B173',
'47B25946-DECE-49AC-A175-DF095AFFC4A4',
'5566C943-623D-4F9C-9273-1075C522F15E',
'F100F5B9-FFD3-4941-9EFF-43E0B58E86D7',
'1F5B436C-5562-4C97-8C09-BF0ADFBC8020',
'B6CC2092-726A-418A-9797-19E44E0E4B1E',
'A24EA544-7A8A-40F9-99E0-C5459DABD7EE',
'56DCF9D5-9A83-4D70-9020-9BF43D70B601',
'6C9A66DE-DC3B-4429-A0C1-384F22035220',
'4CC5BD44-42D2-45FA-8A9D-5B1BDEA34E84',
'13C8C145-147A-45E2-8478-64C283D81053',
'05D0FB16-D7C2-487A-A97F-69EFB6F4CF7A',
'5D495E98-AE39-46C5-B0A5-2AFAD1BC8FF9')


UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Communications' 
 WHERE [ComponentKey] IN 
('DFE5417A-C702-46D0-A376-224FECDD97D9',
'00A5B411-23CE-4F86-A284-CA5C7909687C',
'EAB07623-25FC-46ED-8C96-6E8477199CB6',
'6CA6981C-0B01-4029-9804-9285C271A98B',
'D37F0F8D-F1DC-4B76-B923-937D87AD0F3A')


UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.ContactManagement' 
 WHERE [ComponentKey] IN 
('4CFDA0D4-98D0-481C-BCB1-0F09862B6BB0',
'2144E058-1519-4D15-9970-F332586B1379',
'5CDE343C-BB75-48A3-BED5-A18807EFBE61',
'B747D72C-F4A9-478B-A885-E8D1F501545A',
'45A89D6E-F26B-4ADD-B499-EE32CF39AB19',
'B98583ED-8F8B-4ED9-93DB-70FF5F0E1DBB',
'AE957ADF-092E-43A4-AE6E-88A80B0785BF',
'2F042870-16C6-45CA-90C5-777560A9CA98',
'DFFFBEDB-AD41-4070-AEDB-A5EE4203FBEE',
'FE676E6F-0A0D-4F9E-A982-75736FC50AF9',
'71404D61-AD9B-44CF-8F50-0484A2D3BDF2',
'67DAEF0D-F7E0-4D6A-80CB-88C69C53CFB5',
'7A87C70F-7445-42C7-A8D7-57B3777BB31D',
'50FB7173-5E25-44F3-AC76-4A6883973244',
'CE367DCA-D0C9-40C6-8E7D-5A8321D9B711',
'CF8B8544-32BB-4D57-A844-96025A096294')



UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Events' 
 WHERE [ComponentKey] IN
('26886D31-928B-49F9-B4C5-ADF36030C067',
'36772E20-F793-412B-B1E6-E91D68B1BEE1',
'CED4E39E-7FE1-44AD-9BB9-D9625F84E307',
'23FD75D4-4F14-46B3-A6D8-93514168E4AA',
'028842D6-6260-4FC0-B005-0426EE9CFB96',
'1CFBCBF3-1D15-4679-958C-6996CF026278')


UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Fundraising' 
 WHERE [ComponentKey] IN
('00CB6F96-83D6-48A4-9520-9BDE80C47817',
'9AEB93F4-FED4-425F-81BD-B41ABAB5E6D2',
'3BDB6F5A-0C41-43B1-BA77-AC32C7AA4798',
'1F29E8E4-39CB-492B-AB5C-C01444381493',
'2D12545F-01B1-420D-8216-C71162E2A5E8',
'2D9BFAC3-4558-4E51-95F1-399BF47C1DDD')



UPDATE [dbo].[ComponentRegistry] 
   SET [AssemblyName] = 'Asi.Web.iParts.Social' 
 WHERE [ComponentKey] IN
('C5B839D6-8482-4534-B6CB-32BE708078A4',
'1F0452FE-FCA6-4D9A-A868-251D3351307A')

------------------------------
-- PBI 60110 - Merging main10 specific iParts into one dll
------------------------------
UPDATE [dbo].[ComponentRegistry] 
    SET [AssemblyName] = 'Asi.Web.iParts.v10' 
WHERE [ComponentKey] IN 
('8b6b8531-03d3-43c9-9073-96c6a0261b9a'
,'2ac6eaa1-bb7b-49a3-b128-8a83d687a323'
,'b63ee63b-a28d-4327-96dd-f927bcbbef4a'
,'78211694-8781-45ae-a9ce-fb536a96bc78'
,'77687556-43d9-4237-8fe4-9e0c8a240ba7'
,'bba747c7-c3c6-4477-961c-40cdbe242675'
,'e2e93186-e9e8-4f33-a902-3248c89c14f3'
,'9e57bbcb-e626-48e5-bb84-ff247ce4ee86'
,'fbdb83f9-67a9-42cf-9b86-cc931e42a04b'
,'2b3279e8-b66d-4d25-8a84-bd2885ad76c7'
,'c34133df-648b-4736-8688-bb4003fbdc7e'
,'7ecee69d-baae-4218-8729-8ad281f60ef4')


------------------------------
-- PBI 59971 - delete entries for which there are duplicates
------------------------------
DELETE ComponentRegistry
WHERE ComponentKey IN
('06ACE3A0-7619-4374-8A1E-2ED725CA14F0','1906AF5B-D516-4E19-BE3B-FFA54EC5A810',
'6A6A3C7C-9057-4618-9F44-779EC59039F9','F8780016-A92E-4002-8F9D-13A53B50EF0B','A286B16B-8BBF-4355-A826-F3AC79AF9BD9',
'A1175F96-5DAF-4525-95D0-317EE1450841','F10EEDF4-48D7-4045-86EA-1A9BB3ABBCD7',
'6EB2148C-8E59-49DD-9C43-D0D6FF44ACB5','23244D8A-AC34-4059-98BB-A4A9400FB815')
GO

------------------------------
-- PBI 60097 - type change for shortcuts OrganizationJoin and OrganizationJoinNow from Editable to Reference 
------------------------------
UPDATE [dbo].[URLMapping] 
   SET URLMappingTypeCode = 30 
 WHERE URLMappingKey IN ('5DE0F2FB-DE4B-4F43-AAF0-15978B128D26', '70553431-2BB3-4946-9C16-B5A59A02A6E5', 
       '40868184-5D76-41B9-8B88-4CAD05C4A9C7', '477D3267-6B8B-4EDD-B554-540B477048B1')
GO
-------------------------------
---PBI 60229 - V100\V10 - Allow a customer to edit/cancel an enrollment for recurring membership
-------------------------------
IF NOT EXISTS ( SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'AutoPayMemberInstructionDetail' )
BEGIN
    INSERT  INTO [dbo].[ObjectMetaData]
            ( [ObjectName] ,
              [RelatedToEntity] ,
              [IsUserDefined] ,
              [IsMultiInstance] ,
              [Version]
            )
    VALUES  ( 'AutoPayMemberInstructionDetail' ,
              'Party' ,
              0 ,
              1 ,
              ''
            );
END
GO
-------------------------------
---PBI 60330 - DEV - V10 Add BO/IQA/CON/Panel (PBI 60229)
-------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'AutoPayMemberInstructionDetails') 
INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
VALUES('2F90D754-016C-4075-8273-A580B529F5D2', 'AutoPayMemberInstructionDetails', 'AutoPay Member Instruction Details', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>AutoPay Member Instruction Details</Description><Name>AutoPayMemberInstructionDetails</Name><PanelDefinitionId>2f90d754-016c-4075-8273-a580b529f5d2</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>AutoPayMemberInstructionDetails</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Title</Caption><EntityName>AutoPayMemberInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TITLE</PropertyName></PanelFieldData><PanelFieldData><Caption>Status</Caption><EntityName>AutoPayMemberInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Status</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Payment Details</Caption><EntityName>AutoPayMemberInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>true</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PaymentMethodSummary</PropertyName></PanelFieldData><PanelFieldData><Caption>Cancelled On</Caption><EntityName>AutoPayMemberInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancelledOn</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData i:nil="true"/><PanelFieldData><Caption>Cancellation Reason</Caption><EntityName>AutoPayMemberInstructionDetail</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CancellationReason</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>AutoPayMemberInstructionDetail</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-------------------------------
---PBI 60205 - 
-------------------------------
IF NOT EXISTS ( SELECT 1 FROM [dbo].[ReferenceDate])
BEGIN
    INSERT INTO [dbo].[ReferenceDate] ([RunDate]) VALUES('2016-01-28')
END

-------------------------------
---PBI 51274 - Volunteer Management
-------------------------------
-- Add the public Volunteer Information panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer Information') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('296166F4-AEB5-42CF-9816-A87F2682D768', 'Volunteer Information', 'Basic information about volunteers', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Basic information about volunteers</Description><Name>Volunteer Information</Name><PanelDefinitionId>296166f4-aeb5-42cf-9816-a87f2682d768</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer Information</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Yes, I would like to be a volunteer</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IsVolunteer</PropertyName></PanelFieldData><PanelFieldData><Caption>Age group</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AgeGroup</PropertyName></PanelFieldData><PanelFieldData><Caption>Emergency contact</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EmergencyContact</PropertyName></PanelFieldData><PanelFieldData><Caption>Resume</Caption><EntityName>ProfileDocuments</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Resume</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Available beginning</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AvailableBeginning</PropertyName></PanelFieldData><PanelFieldData><Caption>DL or ID Number</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>GovernmentIDNumber</PropertyName></PanelFieldData><PanelFieldData><Caption>Emergency contact phone number</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EmergencyContactPhone</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerInformation</a:string><a:string>ProfileDocuments</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the staff Volunteer Information panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer Information - Staff') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('5D7560A2-FE51-4F31-A0C1-AACA85D63753', 'Volunteer Information - Staff', 'Basic information about volunteers (staff only view)', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Basic information about volunteers (staff only view)</Description><Name>Volunteer Information - Staff</Name><PanelDefinitionId>5d7560a2-fe51-4f31-a0c1-aaca85d63753</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer Information - Staff</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Is a volunteer</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IsVolunteer</PropertyName></PanelFieldData><PanelFieldData><Caption>Age group</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AgeGroup</PropertyName></PanelFieldData><PanelFieldData><Caption>Emergency contact</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EmergencyContact</PropertyName></PanelFieldData><PanelFieldData><Caption>Resume</Caption><EntityName>ProfileDocuments</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Resume</PropertyName></PanelFieldData><PanelFieldData><Caption>Background check status</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BackgroundCheckStatus</PropertyName></PanelFieldData><PanelFieldData><Caption>Completed orientation</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CompletedOrientation</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Available beginning</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>AvailableBeginning</PropertyName></PanelFieldData><PanelFieldData><Caption>DL or ID number</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>GovernmentIDNumber</PropertyName></PanelFieldData><PanelFieldData><Caption>Emergency contact phone number</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EmergencyContactPhone</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData><PanelFieldData><Caption>Background check valid until</Caption><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>BackgroundCheckValidUntil</PropertyName></PanelFieldData><PanelFieldData><Caption>Orientation valid until</Caption><EntityName>VolunteerInformation</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>OrientationValidUntil</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerInformation</a:string><a:string>ProfileDocuments</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the Volunteer Availability panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer Availability') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('D3D3CEB1-BE0F-4804-A399-E0AB416E8C02', 'Volunteer Availability', 'Time and days of the week volunteers are available', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Time and days of the week volunteers are available</Description><Name>Volunteer Availability</Name><PanelDefinitionId>d3d3ceb1-be0f-4804-a399-e0ab416e8c02</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer Availability</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Day of the week</Caption><EntityName>VolunteerAvailability</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DayOfTheWeekCode</PropertyName></PanelFieldData><PanelFieldData><Caption>Daytime</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerAvailability</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Daytime</PropertyName></PanelFieldData><PanelFieldData><Caption>Evening</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerAvailability</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Evening</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerAvailability</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the public Volunteer Skills and Interests panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer Skills and Interests') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('C086AD78-2C17-45B4-BECF-D1E2BE67910F', 'Volunteer Skills and Interests', 'The skills, interests and skill levels of volunteers', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>The skills, interests and skill levels of volunteers</Description><Name>Volunteer Skills and Interests</Name><PanelDefinitionId>c086ad78-2c17-45b4-becf-d1e2be67910f</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer Skills and Interests</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Skill</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Skill</PropertyName></PanelFieldData><PanelFieldData><Caption>Notes</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Notes</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Skill Level</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SkillLevel</PropertyName></PanelFieldData><PanelFieldData><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerSkills</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the staff Volunteer Skills and Interests panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer Skills and Interests - Staff') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('30ED046C-4D22-4F62-B352-39468FABCEE8', 'Volunteer Skills and Interests - Staff', 'The skills, interests and skill levels of volunteers (staff only view)', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>The skills, interests and skill levels of volunteers (staff only view)</Description><Name>Volunteer Skills and Interests - Staff</Name><PanelDefinitionId>30ed046c-4d22-4f62-b352-39468fabcee8</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer Skills and Interests - Staff</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Skill</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Skill</PropertyName></PanelFieldData><PanelFieldData><Caption>Notes</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Notes</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Skill level</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SkillLevel</PropertyName></PanelFieldData><PanelFieldData><Caption>Staff notes</Caption><EntityName>VolunteerSkills</EntityName><HideInNormalView>true</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>StaffNotes</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerSkills</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the public Volunteer History and Schedule panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer History and Schedule') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('16E0AEDC-5942-4D8A-A312-66C401CBD4FE', 'Volunteer History and Schedule', 'The history of events attended and upcoming events for volunteers', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>The history of events attended and upcoming events for volunteers</Description><Name>Volunteer History and Schedule</Name><PanelDefinitionId>16e0aedc-5942-4d8a-a312-66c401cbd4fe</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer History and Schedule</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Date</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Date</PropertyName></PanelFieldData><PanelFieldData><Caption>Event</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Event</PropertyName></PanelFieldData><PanelFieldData><Caption>Hours</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Hours</PropertyName></PanelFieldData><PanelFieldData><Caption>Notes</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Notes</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerHistory</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

-- Add the staff Volunteer History and Schedule panel
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Volunteer History and Schedule - Staff') 
    INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
    VALUES('7A418AB4-8A05-47E8-B559-89E2552A41EF', 'Volunteer History and Schedule - Staff', 'The history of events attended and upcoming events for volunteers (staff only view)', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>The history of events attended and upcoming events for volunteers (staff only view)</Description><Name>Volunteer History and Schedule - Staff</Name><PanelDefinitionId>7a418ab4-8a05-47e8-b559-89e2552a41ef</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Volunteer History and Schedule - Staff</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Date</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Date</PropertyName></PanelFieldData><PanelFieldData><Caption>Event</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Event</PropertyName></PanelFieldData><PanelFieldData><Caption>Hours</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>true</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Hours</PropertyName></PanelFieldData><PanelFieldData><Caption>Notes</Caption><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Notes</PropertyName></PanelFieldData><PanelFieldData><Caption>Approved?</Caption><DisplayControlType>0</DisplayControlType><EntityName>VolunteerHistory</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Approved</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>VolunteerHistory</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

------------------------------------------------------------
-- iMISMain10 PBI 61060 Update ComponentRegistry table.
------------------------------------------------------------
UPDATE [dbo].[ComponentRegistry] 
   SET [Name] = 'Engagement Score Display'
WHERE [ComponentKey] = 'D239B3AF-6FDF-469C-A276-5ECFB4AA6B1A'
GO

------------------------------------------------------------
-- PBI 51274 - Volunteer Management
------------------------------------------------------------
-- Add volunteer objects to ObjectMetaData
IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'VolunteerAvailability') 
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('VolunteerAvailability', 'Party', 0, 1) 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'VolunteerHistory') 
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('VolunteerHistory', 'Party', 0, 1) 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'VolunteerInformation') 
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('VolunteerInformation', 'Party', 0, 0) 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'VolunteerSkills') 
    INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
    VALUES ('VolunteerSkills', 'Party', 0, 1) 
GO

------------------------------------------------------------------
-- PBI 61330 Update existing score component if our sample is there
------------------------------------------------------------------
UPDATE [dbo].[ScoreComponent] 
   SET [IsSampled] = 1
 WHERE [ScoreComponentKey] = 'F6C034DF-3DB9-4044-A3A3-22A03A461AFF'
   AND [DataSource] LIKE '%$/Common/Engagement/Queries/CommunitySubscriptions%'

UPDATE [dbo].[ScoreComponent] 
   SET [IsSampled] = 1
 WHERE [ScoreComponentKey] = '2ABB0F9F-EE9C-4462-9693-23D376A1CF12'
   AND [DataSource] LIKE '%$/Common/Engagement/Queries/CommitteeMemberships%'
GO
--------------------------------------------------------------------
-- SBT61364 Remove Crystal Report Documents
--------------------------------------------------------------------

EXEC [dbo].[asi_DocumentDelete] 'C1C956D0-13F7-417F-966F-C1F998D47C59', 1; -- Overdue Optional
EXEC [dbo].[asi_DocumentDelete] '5020C528-C3BF-420D-954E-C892CA5DAC06', 1; -- CS Donor Data PE Test
EXEC [dbo].[asi_DocumentDelete] '607A1EC0-7EA2-424B-B0AA-0FB798DBD8D7', 1; -- CS Notification List PE Test
EXEC [dbo].[asi_DocumentDelete] 'D1DDAB8D-5459-4F7E-A5C7-1DAB3DA246B7', 1; -- Segment Definition
EXEC [dbo].[asi_DocumentDelete] '55113966-0DA8-42A0-A3B1-C1E8DB312C4B', 1; -- CS Donations PE Test
EXEC [dbo].[asi_DocumentDelete] 'D60BD302-2329-47D7-A736-852E67C12DAE', 1; -- New Item
EXEC [dbo].[asi_DocumentDelete] '7EC58FF3-540D-4DE8-A5F0-B6D73AFFAB20', 1; -- Segmentation Job
EXEC [dbo].[asi_DocumentDelete] '4CD421DE-EEE1-439A-9F2E-77121358194D', 1; -- Manager Future Actions
EXEC [dbo].[asi_DocumentDelete] 'B62F248B-7702-4386-9D86-7D0261EA290D', 1; -- Segment Definition by Job
EXEC [dbo].[asi_DocumentDelete] '65D8706D-5B7F-4999-A596-BCF87BA57B0A', 1; -- Projects by Salesperson
EXEC [dbo].[asi_DocumentDelete] '880A87DA-E58E-4EC0-B6BD-250AF0E19218', 1; -- IQA Security Report
EXEC [dbo].[asi_DocumentDelete] '570C8A9C-8F66-4FD7-BEF5-27E56CCA647D', 1; -- Segment Definition
EXEC [dbo].[asi_DocumentDelete] '85899B86-6FA3-4EA4-898A-A0FA05F56E14', 1; -- Campaign Performance by Source Code
EXEC [dbo].[asi_DocumentDelete] '7B540407-A4AF-4C80-8118-6523D7A485B8', 1; -- RFM Profile
EXEC [dbo].[asi_DocumentDelete] 'F986455F-6B83-4357-B6D2-4E432F4DB016', 1; -- CS Pledge PE Test
EXEC [dbo].[asi_DocumentDelete] '07F4FBB2-6AF8-4FF6-AD2D-EA663DB28FF6', 1; -- Project Forecast
EXEC [dbo].[asi_DocumentDelete] 'ACD324BE-195E-437B-957F-5E9C3A91550A', 1; -- RFM Analysis Preview Report
EXEC [dbo].[asi_DocumentDelete] '3C5A9D2A-F9BF-4D44-BBCF-C45DC3EE31CB', 1; -- Action Report
EXEC [dbo].[asi_DocumentDelete] 'CE77D1E3-3795-4BF7-9875-7CA77EE82C7D', 1; -- CS Activity PE Test
EXEC [dbo].[asi_DocumentDelete] '2A144B30-7D37-4CF3-B4B0-3379CE6D4DEC', 1; -- Sales Person Project Forecast
EXEC [dbo].[asi_DocumentDelete] '018DCC62-8F29-49BC-85FC-5884A5C0C30B', 1; -- Campaign Stage
EXEC [dbo].[asi_DocumentDelete] 'E65EA5C5-64DF-43CD-99A9-7BC2DC0CA000', 1; -- Manager Action Report
EXEC [dbo].[asi_DocumentDelete] '71B77108-96A1-42A8-946E-651F441894F9', 1; -- IQA Security Report
EXEC [dbo].[asi_DocumentDelete] '2BF7069D-34F2-4BD7-8D84-7060C1EC0A08', 1; -- CS Gifts PE Test
EXEC [dbo].[asi_DocumentDelete] '98C7CF9D-0CC0-4AF0-A3B2-32C0A8873DB7', 1; -- Won or Lost Process
EXEC [dbo].[asi_DocumentDelete] 'C6332159-41BC-4531-8061-370B1A2B5E3D', 1; -- Overdue Reguired
EXEC [dbo].[asi_DocumentDelete] 'C55A71EA-C200-44D5-AF6B-921996AB1E53', 1; -- Incomplete Stage Report
EXEC [dbo].[asi_DocumentDelete] 'CDB652EE-943F-45EF-80E7-F6F717BE1763', 1; -- Project Profile
EXEC [dbo].[asi_DocumentDelete] '8F8AA2F5-DCEF-460E-9A54-942AFA5D1D20', 1; -- Campaign Confirmation
EXEC [dbo].[asi_DocumentDelete] '697F2017-35F9-40FB-BA8B-82EA9B2F8C3D', 1; -- Sales Person Action Report
EXEC [dbo].[asi_DocumentDelete] 'B8EC1495-D6E7-43E4-91A8-4DC51CF75B8F', 1; -- CS Solicitor Data PE Test
EXEC [dbo].[asi_DocumentDelete] '22C06624-BBD6-476B-A694-6AB87314FDB3', 1; -- Manager Response Analysis
EXEC [dbo].[asi_DocumentDelete] '1D0DAFA4-675E-4ABB-8583-AC40FA6FACDB', 1; -- Manager Overdue Actions
EXEC [dbo].[asi_DocumentDelete] '552E7834-4938-48F5-BEF0-910515158966', 1; -- Campaign Performance by Solicitation
EXEC [dbo].[asi_DocumentDelete] '9873D16A-2632-48B1-B05D-13BC59DB5552', 1; -- Manager Win/Loss Analysis
EXEC [dbo].[asi_DocumentDelete] '6FF8AF42-E8F4-441E-94BF-508B62AC15CA', 1; -- Action Report Test Das
EXEC [dbo].[asi_DocumentDelete] '6C97F54B-61EF-449B-8F78-48D87D4C0C87', 1; -- CS Matching Plans PE Test
EXEC [dbo].[asi_DocumentDelete] '0F81B6A7-5C86-4EC3-A9B2-D118213926A7', 1; -- Manager Project Forecast
EXEC [dbo].[asi_DocumentDelete] '8E0B9299-5D7F-470F-A433-B0C8CC579B2E', 1; -- Projects with Overdue Actions
EXEC [dbo].[asi_DocumentDelete] '3636D6D7-6ACB-49F8-813A-E5A1D7085B3C', 1; -- Sales Person Future Actions
EXEC [dbo].[asi_DocumentDelete] '7A5AEDF4-0346-4F14-BC67-7DB10F93B868', 1; -- CS Contact Object PE Test
EXEC [dbo].[asi_DocumentDelete] 'DAD186ED-50C7-419A-815B-58A644244DD8', 1; -- Sales Person Overdue Actions
EXEC [dbo].[asi_DocumentDelete] 'FB1763FF-24CE-4056-B802-8C8EADE5F481', 1; -- Campaign Purge
EXEC [dbo].[asi_DocumentDelete] 'F3999C5D-1DE1-4E14-B959-6EA01C77C647', 1; -- Manager Incomplete Stage Report
EXEC [dbo].[asi_DocumentDelete] '405436E8-434C-42A4-9F6B-B2F4AC4C9F27', 1; -- Response Analysis
EXEC [dbo].[asi_DocumentDelete] '0471FB09-9FDB-43BE-B46C-55B140F8F470', 1; -- CS Salutations PE Test
EXEC [dbo].[asi_DocumentDelete] '53A5683B-63A9-4F1C-AD10-EF3CA528EA21', 1; -- Projects with Future Actions
EXEC [dbo].[asi_DocumentDelete] '66362CEE-310B-4793-B021-704181840625', 1; -- Das Test CPE
EXEC [dbo].[asi_DocumentDelete] '76B23CB6-4AE6-4142-A168-1C89F78683E5', 1; -- CS Donations Detail PE Test

--Now handle the object browser meta data pointing to these records
EXEC [dbo].[asi_DocumentDelete] 'E6DAED32-9B0C-4FBF-8914-3C0520B1776D', 1; -- Manager Won or Lost Process
EXEC [dbo].[asi_DocumentDelete] '36E10AC6-8642-4DB1-BB08-16805D5067A8', 1; -- IQA Security Report
EXEC [dbo].[asi_DocumentDelete] 'EC54468E-FE93-4392-B298-EC272AF27D7C', 1; -- Won or Lost Process
EXEC [dbo].[asi_DocumentDelete] 'CC3DCD13-EC53-468B-83D1-058A2B394655', 1; -- Sales Person Process Forecast
EXEC [dbo].[asi_DocumentDelete] '2129AF0D-1881-45DF-BAC5-BDD36897C53F', 1; -- Campaign Stage
EXEC [dbo].[asi_DocumentDelete] 'E95AA044-E9CF-402C-82F8-1C43C85892F1', 1; -- Sales Person Overdue Actions
EXEC [dbo].[asi_DocumentDelete] 'A2FC735E-02B3-4233-A2B0-B10BBB7BA7A8', 1; -- RFM Analysis Preview Report
EXEC [dbo].[asi_DocumentDelete] 'A952A74A-4DB7-4B97-AC6D-AB72B7ECD7D5', 1; -- RFM Profile
EXEC [dbo].[asi_DocumentDelete] 'BBF03B24-35DD-4972-A9DD-6FEAACC7331F', 1; -- Manager Response Analysis
EXEC [dbo].[asi_DocumentDelete] '19B69FFF-BDE3-40FC-9259-EF7A3CC1F006', 1; -- Manager Incomplete Stage Report
EXEC [dbo].[asi_DocumentDelete] '8EEB3910-8818-4A72-8D06-B76AAE2C917C', 1; -- Manager Future Actions
EXEC [dbo].[asi_DocumentDelete] '268B9B34-4E97-44D3-894E-75BA39CC784D', 1; -- Manager Action Report
EXEC [dbo].[asi_DocumentDelete] '08FDAC9F-839C-4B6C-9219-082F271D256C', 1; -- Segment Definition by Job
EXEC [dbo].[asi_DocumentDelete] '6E5CC2F4-6289-47E1-AC9F-77554F16D3CD', 1; -- Sales Person Action Report
EXEC [dbo].[asi_DocumentDelete] 'E9696747-AA32-4729-B243-C05D76E571B6', 1; -- Campaign Purge
EXEC [dbo].[asi_DocumentDelete] '8C1D2A44-240F-4C94-A092-4F928CFE3E9F', 1; -- Campaign Performance by Solicitation
EXEC [dbo].[asi_DocumentDelete] 'BD24874E-CE17-4C21-AC76-97F1FBC2E130', 1; -- Process with Incomplete Stage
EXEC [dbo].[asi_DocumentDelete] 'ABB4B89B-5B2C-4ED1-AD6A-851D18F8DCFE', 1; -- Campaign Confirmation
EXEC [dbo].[asi_DocumentDelete] 'DFC29F9D-5125-4E0B-B458-BA909FBD1D85', 1; -- Campaign Performance by Source Code
EXEC [dbo].[asi_DocumentDelete] '8A283280-3EB7-4575-8954-D9942E788609', 1; -- Manager Overdue Actions
EXEC [dbo].[asi_DocumentDelete] 'DBFF65E7-5476-4A54-83C6-3C4CC6EBC9A4', 1; -- Process with Overdue Actions
EXEC [dbo].[asi_DocumentDelete] 'E08229DD-8134-4D7E-A2CF-9AE88CF24EF0', 1; -- Response Analysis
EXEC [dbo].[asi_DocumentDelete] '040187F3-17F6-4BD0-9B3B-05426130B1E0', 1; -- Segmentation Job
EXEC [dbo].[asi_DocumentDelete] '4D448557-C51B-4B7E-BAB4-865BD9BFC1C7', 1; -- Processes by Salesperson
EXEC [dbo].[asi_DocumentDelete] 'E7707E87-A863-4EA0-8A83-A993B63BFCAF', 1; -- Action Report
EXEC [dbo].[asi_DocumentDelete] '2ABA7351-4D77-4374-B9AD-949DE5F81A32', 1; -- Manager Process Forecast
EXEC [dbo].[asi_DocumentDelete] '197C7582-3CD8-472D-B085-0F1586CF686E', 1; -- Sales Person Future Actions
EXEC [dbo].[asi_DocumentDelete] '12618146-9A89-46A6-9393-CC846D7F1A63', 1; -- Process Forecast
EXEC [dbo].[asi_DocumentDelete] '88620BDE-2704-4DFE-8CA9-222978AFD6D8', 1; -- Process with Future Actions
EXEC [dbo].[asi_DocumentDelete] '7EEE47E9-52CC-4CB7-9AEC-80DD5D53A790', 1; -- Process Profile

GO
---------------------------------------------------------------------------------
-- PBI59478 Add ThemeBuilder CAG options and rename Layout Editor
---------------------------------------------------------------------------------
DECLARE @groupRoleKeyWTE uniqueidentifier;
SET @groupRoleKeyWTE = '8462835C-4669-461A-B3FE-A21C862E8920';
DECLARE @groupRoleNameWTE nvarchar(50);
SET @groupRoleNameWTE = 'Theme Editor';

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupRoleRef] WHERE [GroupRoleKey] = @groupRoleKeyWTE AND [GroupRoleName] = @groupRoleNameWTE)
INSERT INTO [dbo].[GroupRoleRef] ([GroupRoleKey], [GroupRoleName], [GroupRoleDesc], [IsActive], [IsSystem])
VALUES (@groupRoleKeyWTE, @groupRoleNameWTE, @groupRoleNameWTE, 1, 1);

DECLARE @groupRoleKeyWTA uniqueidentifier;
SET @groupRoleKeyWTA = '2E8BCA88-8948-4570-9531-C235FD42A563';
DECLARE @groupRoleNameWTA nvarchar(50);
SET @groupRoleNameWTA = 'Theme Approver';

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupRoleRef] WHERE [GroupRoleKey] = @groupRoleKeyWTA AND [GroupRoleName] = @groupRoleNameWTA)
INSERT INTO [dbo].[GroupRoleRef] ([GroupRoleKey], [GroupRoleName], [GroupRoleDesc], [IsActive], [IsSystem])
VALUES (@groupRoleKeyWTA, @groupRoleNameWTA, @groupRoleNameWTA, 1, 1);

DECLARE @groupRoleKeyTLC uniqueidentifier;
SET @groupRoleKeyTLC = 'A989A95C-4D9F-456D-B48D-C81AA38EBC62';
DECLARE @groupRoleNameTLC nvarchar(50);
SET @groupRoleNameTLC = 'Theme Layout Editor';

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupRoleRef] WHERE [GroupRoleKey] = @groupRoleKeyTLC AND [GroupRoleName] = @groupRoleNameTLC)
INSERT INTO [dbo].[GroupRoleRef] ([GroupRoleKey], [GroupRoleName], [GroupRoleDesc], [IsActive], [IsSystem])
VALUES (@groupRoleKeyTLC, @groupRoleNameTLC, @groupRoleNameTLC, 1, 1);

UPDATE [dbo].[GroupRoleRef]
SET [GroupRoleName]='Content Layout Editor', [GroupRoleDesc]='Content Layout Editor'
WHERE [GroupRoleName]='Layout Editor' AND [GroupRoleKey] = 'D196C524-B321-46D1-99CA-320716BDF9AE';

/** Add roles to CAG**/
DECLARE @groupTypeKey uniqueidentifier;
SET @groupTypeKey = 'C4D78A02-048A-4D35-8440-74B5C82CF62F';
DECLARE @groupTypeRoleKeyWTE uniqueidentifier;
SET @groupTypeRoleKeyWTE = '320672B8-10A0-48F1-99F0-193FFF4D9040';
DECLARE @groupTypeRoleKeyWTA uniqueidentifier;
SET @groupTypeRoleKeyWTA = 'E4C21248-79BF-46E8-B0F9-99CB8894D57C';
DECLARE @groupTypeRoleKeyTLC uniqueidentifier;
SET @groupTypeRoleKeyTLC = 'CCF71E60-5AAB-4BC0-9035-DA54A08538E7';

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRole] WHERE [GroupTypeKey] = @groupTypeKey AND [GroupRoleKey] = @groupRoleKeyWTE AND [GroupTypeRoleKey] = @groupTypeRoleKeyWTE)
INSERT INTO [dbo].[GroupTypeRole] ([GroupTypeKey], [GroupRoleKey], [IsRequired], [IsUnique], [SortRank], [IsDefault], [DefaultMemberStatusCode], [IsSystem], [GroupTypeRoleKey])
VALUES (@groupTypeKey, @groupRoleKeyWTE, 0, 0, 11, 0, 'A', 0, @groupTypeRoleKeyWTE)

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRole] WHERE [GroupTypeKey] = @groupTypeKey AND [GroupRoleKey] = @groupRoleKeyWTA AND [GroupTypeRoleKey] = @groupTypeRoleKeyWTA)
INSERT INTO [dbo].[GroupTypeRole] ([GroupTypeKey], [GroupRoleKey], [IsRequired], [IsUnique], [SortRank], [IsDefault], [DefaultMemberStatusCode], [IsSystem], [GroupTypeRoleKey])
VALUES (@groupTypeKey, @groupRoleKeyWTA, 0, 0, 13, 0, 'A', 0, @groupTypeRoleKeyWTA)

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRole] WHERE [GroupTypeKey] = @groupTypeKey AND [GroupRoleKey] = @groupRoleKeyTLC AND [GroupTypeRoleKey] = @groupTypeRoleKeyTLC)
INSERT INTO [dbo].[GroupTypeRole] ([GroupTypeKey], [GroupRoleKey], [IsRequired], [IsUnique], [SortRank], [IsDefault], [DefaultMemberStatusCode], [IsSystem], [GroupTypeRoleKey])
VALUES (@groupTypeKey, @groupRoleKeyTLC, 0, 0, 14, 0, 'A', 0, @groupTypeRoleKeyTLC)

GO

---------------------------------------------------------------------------------------------------------------
-- PBI64076 - BUG: (CAG) Reassigning Default Owner Role does not reassign theme editor role to new default owner
---------------------------------------------------------------------------------------------------------------

UPDATE [dbo].[GroupTypeRole]
SET [SortRank]='10',
    [IsSystem]='1'
WHERE [GroupTypeKey]='C4D78A02-048A-4D35-8440-74B5C82CF62F' AND [GroupRoleKey] = '8462835C-4669-461A-B3FE-A21C862E8920';

UPDATE [dbo].[GroupTypeRole]
SET [SortRank]='11',
    [IsSystem]='1'
WHERE [GroupTypeKey]='C4D78A02-048A-4D35-8440-74B5C82CF62F' AND [GroupRoleKey] = '2E8BCA88-8948-4570-9531-C235FD42A563';

UPDATE [dbo].[GroupTypeRole]
SET [SortRank]='12',
    [IsSystem]='1'
WHERE [GroupTypeKey]='C4D78A02-048A-4D35-8440-74B5C82CF62F' AND [GroupRoleKey] = 'A989A95C-4D9F-456D-B48D-C81AA38EBC62';

UPDATE [dbo].[GroupTypeRole]
SET [SortRank]='13'
WHERE [GroupTypeKey]='C4D78A02-048A-4D35-8440-74B5C82CF62F' AND [GroupRoleKey] = '6A528B5B-4739-4075-A95F-C0F7F5766BAC';

GO

---------------------------------------------------------------------------------------------------------------
-- SBT61561 - Create alert for non-pci compliance
---------------------------------------------------------------------------------------------------------------

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();

DELETE FROM [dbo].[NotificationSetDetail] where [NotificationSetDetailKey] = 'E8286D48-E8A3-44A9-9F84-2A0F07DC9FDC'
DELETE FROM [dbo].[TaskDefinition] where [TaskDefinitionKey] = '21AEC3C8-DBB7-4572-BB83-7C1458D3F38F'
INSERT INTO [dbo].[TaskDefinition]
        ([TaskDefinitionKey]
        ,[TaskDefinitionName]
        ,[TaskDefinitionDesc]
        ,[TaskDefinitionPriority]
        ,[TaskDefinitionIsActive]
        ,[TaskDefinitionIsSystem]
        ,[SerializedTaskDefinition]
        ,[CreatedByUserKey]
        ,[CreatedOn]
        ,[UpdatedByUserKey]
        ,[UpdatedOn])
    VALUES
        ('21AEC3C8-DBB7-4572-BB83-7C1458D3F38F'
        ,'PCI Noncompliance Alert - Password Expiration'
        ,'This alert will show when a system does not have an admin password expiration policy in force.'
        ,0
        ,1
        ,1
        ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>57a3def4-0a5f-471c-b71a-7cee0b92aa2d</DataSourceId><DataSourceName>PasswordExpiration</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>c0740d18-d56b-48c8-8ff0-3412068e52fa</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>This alert will show when a system does not have an admin password expiration policy in force.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>57a3def4-0a5f-471c-b71a-7cee0b92aa2d</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>PCI Noncompliance Alert - Password Expiration</Name><Notifications><NotificationDefinition><DataSources><string>57a3def4-0a5f-471c-b71a-7cee0b92aa2d</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD;&lt;div class="media-body"&gt;&#xD;PCI compliance violation: &lt;a href="[website]/Settings/Contacts/Authentication/iMIS/Setup/PasswordExpirationConfiguration.aspx"&gt;Administrator password expiration policy&lt;/a&gt; must be 90 days or less&#xD;&lt;/div&gt;&#xD;&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>359d7dc1-2b19-4268-a2a9-9f65f7a0f262</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>21aec3c8-dbb7-4572-bb83-7c1458d3f38f</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>21aec3c8-dbb7-4572-bb83-7c1458d3f38f</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>2cef98e2-7325-4a98-85e7-ec3906807cbd</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2016-03-23T15:25:41.843</a:CreatedOn><a:UpdatedBy>MANAGER</a:UpdatedBy><a:UpdatedOn>2016-03-23T15:25:41.843</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
        ,@userKey
        ,@now
        ,@userKey    
        ,@now)



IF EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '973294CD-0BD2-45A0-9E22-B718B7096BD8')
BEGIN
    
    INSERT INTO [dbo].[NotificationSetDetail]
                ([NotificationSetDetailKey]
                ,[NotificationSetKey]
                ,[TaskDefinitionKey]
                ,[NotificationSetDetailPriority]
                ,[NotificationSetDetailIsDefault]
                ,[CreatedByUserKey]
                ,[CreatedOn]
                ,[UpdatedByUserKey]
                ,[UpdatedOn])
    VALUES
        ('E8286D48-E8A3-44A9-9F84-2A0F07DC9FDC'
        ,'973294CD-0BD2-45A0-9E22-B718B7096BD8'
        ,'21AEC3C8-DBB7-4572-BB83-7C1458D3F38F'
        ,1
        ,0
        ,@userKey
        ,@now
        ,@userKey    
        ,@now)
END

GO

---------------------------------------------------------------------------
--iMISMain10 SBT 61624  Create new Alert for password History PCI compliance
---------------------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();

DELETE FROM [dbo].[NotificationSetDetail] where [NotificationSetDetailKey] = '00DC1F61-72BC-40DC-9430-8E320400311B'
DELETE FROM [dbo].[TaskDefinition] where [TaskDefinitionKey] = 'FED57640-C26C-4402-8D74-47679C513337'
INSERT INTO [dbo].[TaskDefinition]
        ([TaskDefinitionKey]
        ,[TaskDefinitionName]
        ,[TaskDefinitionDesc]
        ,[TaskDefinitionPriority]
        ,[TaskDefinitionIsActive]
        ,[TaskDefinitionIsSystem]
        ,[SerializedTaskDefinition]
        ,[CreatedByUserKey]
        ,[CreatedOn]
        ,[UpdatedByUserKey]
        ,[UpdatedOn])
    VALUES
        ('FED57640-C26C-4402-8D74-47679C513337'
        ,'PCI Noncompliance Alert - Password History'
        ,'This alert will show when a password history count is between 0 and 3.'
        ,0
        ,1
        ,1
        ,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>b5622c47-31bf-4fd7-90e0-d87ee29aeec3</DataSourceId><DataSourceName>PassowrdExpiration</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>c52d60b6-b7b5-4a94-860a-d1e0620faede</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>This alert will show when a password history count is between 0 and 3.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>b5622c47-31bf-4fd7-90e0-d87ee29aeec3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>PCI Noncompliance Alert - Password History</Name><Notifications><NotificationDefinition><DataSources><string>b5622c47-31bf-4fd7-90e0-d87ee29aeec3</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; PCI compliance violation: &lt;a href="[website]/Settings/Contacts/Authentication/iMIS/Setup/PasswordExpirationConfiguration.aspx"&gt;Administrators&lt;/a&gt; must not be allowed to reuse any of their last 4 passwords &#xD; &lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>e42c0e10-0665-4af4-8931-1289c4945a69</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>fed57640-c26c-4402-8d74-47679c513337</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>fed57640-c26c-4402-8d74-47679c513337</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>a9edbbea-6b9a-444c-b1c9-03c7d099f844</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>SAIF123</a:CreatedBy><a:CreatedOn>2016-03-28T09:57:20.817</a:CreatedOn><a:UpdatedBy>SAIF123</a:UpdatedBy><a:UpdatedOn>2016-03-28T10:07:41.867</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
        ,@userKey
        ,@now
        ,@userKey    
        ,@now)


IF EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '973294CD-0BD2-45A0-9E22-B718B7096BD8')
BEGIN
        INSERT INTO [dbo].[NotificationSetDetail]
                    ([NotificationSetDetailKey]
                    ,[NotificationSetKey]
                    ,[TaskDefinitionKey]
                    ,[NotificationSetDetailPriority]
                    ,[NotificationSetDetailIsDefault]
                    ,[CreatedByUserKey]
                    ,[CreatedOn]
                    ,[UpdatedByUserKey]
                    ,[UpdatedOn])
        VALUES
            ('00DC1F61-72BC-40DC-9430-8E320400311B'
            ,'973294CD-0BD2-45A0-9E22-B718B7096BD8'
            ,'FED57640-C26C-4402-8D74-47679C513337'
            ,2
            ,0
            ,@userKey
            ,@now
            ,@userKey    
            ,@now)
     
END
GO

---------------------------------------------------------------------------
--iMISMain10 PBI 48308  Create new Alert for Session Timeout PCI compliance
---------------------------------------------------------------------------

DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '320E8F8F-5B6E-4520-9A29-B56F00ED6631')
BEGIN
   INSERT INTO [dbo].[TaskDefinition]
           ([TaskDefinitionKey]
           ,[TaskDefinitionName]
           ,[TaskDefinitionDesc]
           ,[TaskDefinitionPriority]
           ,[TaskDefinitionIsActive]
           ,[TaskDefinitionIsSystem]
           ,[SerializedTaskDefinition]
           ,[CreatedByUserKey]
           ,[CreatedOn]
           ,[UpdatedByUserKey]
           ,[UpdatedOn])
     VALUES(
           '320E8F8F-5B6E-4520-9A29-B56F00ED6631',
           'PCI Noncompliance Alert - Session Timeout',
           'This alert will show when a system does not have a PCI compliant session timeout policy for system administrators.',
           0,
           1,
           1,
           '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>52890e69-53fc-4df3-9225-155fbc227355</DataSourceId><DataSourceName>SessionTimeoutMinutes</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>52de3930-d47c-414d-9832-911a49a8581a</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>This alert will show when a system does not have a PCI compliant session timeout policy for system administrators.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>52890e69-53fc-4df3-9225-155fbc227355</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>PCI Noncompliance Alert - Session Timeout</Name><Notifications><NotificationDefinition><DataSources><string>52890e69-53fc-4df3-9225-155fbc227355</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; PCI compliance violation: &lt;a href="[website]/Settings/Contacts/Authentication/iMIS/Setup/PasswordExpirationConfiguration.aspx"&gt;Administrator session timeout policy&lt;/a&gt; must be 15 minutes or less&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>724462af-1bd4-4b2d-a00c-3d14e2d27fd7</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>320e8f8f-5b6e-4520-9a29-b56f00ed6631</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>320e8f8f-5b6e-4520-9a29-b56f00ed6631</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>94358608-e229-4086-976c-8fa37e388a29</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>RDELFELD</a:CreatedBy><a:CreatedOn>2016-04-06T16:40:58.447</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2016-04-06T16:43:38.13</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
           @userKey,
           @now,
           @userKey,
           @now)

END

IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '2365CD04-68E8-454F-B39F-F12D7D0D8C8F')
BEGIN
     IF EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '973294CD-0BD2-45A0-9E22-B718B7096BD8')
     BEGIN
        INSERT INTO [dbo].[NotificationSetDetail]
                   ([NotificationSetDetailKey]
                   ,[NotificationSetKey]
                   ,[TaskDefinitionKey]
                   ,[NotificationSetDetailPriority]
                   ,[NotificationSetDetailIsDefault]
                   ,[CreatedByUserKey]
                   ,[CreatedOn]
                   ,[UpdatedByUserKey]
                   ,[UpdatedOn])
             VALUES(
                   '2365CD04-68E8-454F-B39F-F12D7D0D8C8F',
                   '973294CD-0BD2-45A0-9E22-B718B7096BD8',
                   '320E8F8F-5B6E-4520-9A29-B56F00ED6631',
                   3,
                   0,
                   @userKey,
                   @now,
                   @userKey,
                   @now)
             END
END
GO

---------------------------------------------------------------------------
-- PBI 61737 - Volunteeer Management updates from review feedback
---------------------------------------------------------------------------
-- Remove the never-used "IsVolunteer" and "Hours per week" property from the Donor Data panel
UPDATE PanelDefinition
   SET SerializedPanelDefinition = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>DonorData</Description><Name>DonorData</Name><PanelDefinitionId>503ca4f2-5b4e-437f-ab3b-baf5bc3b09e6</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>DonorData</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Do not phone</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_PHONE</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not email</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_EMAIL</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a moves manager</Caption><DisplayControlType>0</DisplayControlType><EntityName>CsName_Staff</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IS_SALESMAN</PropertyName></PanelFieldData><PanelFieldData><Caption>Receipt interval</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Receipt_Interval</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>Do not solicit</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SOLICIT</PropertyName></PanelFieldData><PanelFieldData><Caption>Do not sell name</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>DO_NOT_SELL</PropertyName></PanelFieldData><PanelFieldData><Caption>Moves manager</Caption><DisplayControlType>0</DisplayControlType><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SOLICITOR_ID</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>FundraisingProfileDonorData</a:string><a:string>CsName_Staff</a:string></SelectedEntityNames></PanelDefinitionData>'
 WHERE PanelDefinitionId = '503CA4F2-5B4E-437F-AB3B-BAF5BC3B09E6'
GO

---------------------------------------------------------------------------
--- PBI 62561 - Add AutoPayAccount table to merge
---------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PartyMergeSchemaReference] WHERE TableName='AutoPayAccount'
    AND ColumnName='CustomerId')
BEGIN
    UPDATE [dbo].[PartyMergeSchemaReference]
        SET [ProcessingOrder] = [ProcessingOrder] + 1 
        WHERE [ProcessingOrder] > 71

    INSERT INTO [PartyMergeSchemaReference] (TableName,ColumnName,ProcessingOrder,ProcessingType,DataColumnName,UseGuidKey)
    VALUES ('AutoPayAccount','CustomerId',72,'UPDATE',NULL,NULL)
END
GO

---------------------------------------------------------------------------
--- PBI 67302 - Update ChangeLog.ObjectKey column on duplicate merge
---------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PartyMergeSchemaReference] WHERE [TableName] = 'ChangeLog' AND [ColumnName] = 'ObjectKey')
BEGIN
    DECLARE @processingOrder int;
    SELECT @processingOrder = MAX([ProcessingOrder]) + 1
      FROM [dbo].[PartyMergeSchemaReference];
  
    INSERT INTO [dbo].[PartyMergeSchemaReference] ([TableName], [ColumnName], [ProcessingOrder], [ProcessingType], [DataColumnName], [UseGuidKey])
    VALUES ('ChangeLog', 'ObjectKey', @processingOrder, 'UPDATE', NULL, 1);
END
GO

---------------------------------------------------------------------------------------------------------
-- PBI 62595 Engagement Scoring: Provide Overall engagement formula on install and upgrade
---------------------------------------------------------------------------------------------------------

-- Populate SystemTypeRef
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemTypeRef] WHERE [SystemTypeCode] = 10)
BEGIN
    INSERT INTO [dbo].[SystemTypeRef] ([SystemTypeCode], [SystemTypeName], [SystemTypeRefDesc])
    VALUES (10, 'Custom', 'Default value, assigned to any new formulas created.')
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemTypeRef] WHERE [SystemTypeCode] = 20)
BEGIN
    INSERT INTO [dbo].[SystemTypeRef] ([SystemTypeCode], [SystemTypeName], [SystemTypeRefDesc])
    VALUES (20, 'Editable', 'Formulas can be edited fully but not deleted.')
END
GO

-- Engagement Score
DECLARE @userKey uniqueidentifier
DECLARE @engagementScoreKey uniqueidentifier
DECLARE @now datetime

-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
SET @engagementScoreKey = 'd0292457-7eff-42e1-b655-be8715b78552'
SET @now = GETDATE()

-- Add EngagementScore for upgrade if its not found.  If it is found, we don't mess with it at all,
-- because they might have modified it. 
IF NOT EXISTS (SELECT 1 FROM [dbo].[EngagementScore] WHERE [EngagementScoreKey] = @engagementScoreKey)
BEGIN
    INSERT INTO [dbo].[EngagementScore]([EngagementScoreKey], [EngagementScoreName], [EngagementScoreDesc], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [IsEnabled], [SystemTypeCode]) 
    VALUES (@engagementScoreKey, 'Overall engagement', 'Calculations for a general overall engagement score', @userKey, @now, @userKey, @now, 1, 20)


    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '20069af4-9792-461d-b3a0-14a1c2ea15cd' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('20069af4-9792-461d-b3a0-14a1c2ea15cd', @engagementScoreKey, 'Number of donations', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/Donations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>2</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'f6c034df-3db9-4044-a3a3-22a03a461aff' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('f6c034df-3db9-4044-a3a3-22a03a461aff', @engagementScoreKey, 'Community subscriptions', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/CommunitySubscriptions</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>1</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 1)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '2abb0f9f-ee9c-4462-9693-23d376a1cf12' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('2abb0f9f-ee9c-4462-9693-23d376a1cf12', @engagementScoreKey, 'Committee memberships', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/CommitteeMemberships</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>5</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 1)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '7080e16a-6a9d-4070-881b-374b41c7c8ba' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('7080e16a-6a9d-4070-881b-374b41c7c8ba', @engagementScoreKey, 'Event registrations', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/EventRegistrations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '12ebf864-389f-43a3-88fb-47c4bbbadebb' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('12ebf864-389f-43a3-88fb-47c4bbbadebb', @engagementScoreKey, 'Number of posts', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/NumberOfPosts</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>0.75</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '93f17409-58ff-4ec8-a62e-72af39a526c3' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('93f17409-58ff-4ec8-a62e-72af39a526c3', @engagementScoreKey, 'Purchases', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/Purchases</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'a32aa482-33b7-4148-879e-734f1d513277' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('a32aa482-33b7-4148-879e-734f1d513277', @engagementScoreKey, 'Recently logged in', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/RecentlyLoggedIn</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>1</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '0e5d6e73-5d21-42ab-9e96-dd905d685ad0' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('0e5d6e73-5d21-42ab-9e96-dd905d685ad0', @engagementScoreKey, 'Volunteer attendance', '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/Volunteer attendance</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>', '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>0.25</Multiplier></WeightData>', 2, 'Hours', @userKey, @now, @userKey, @now, NULL, 0)
    END


-- Add 5 EngagementCategories

    INSERT INTO EngagementCategory VALUES('E66D25CF-6A71-4F7D-BAC9-3B54463CF8A9','D0292457-7EFF-42E1-B655-BE8715B78552','Leader',0,
        '#68bd49','<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>85</Value></CategoryCriteria><CategoryCriteria><BasisType>Component</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId>7080e16a-6a9d-4070-881b-374b41c7c8ba</ScoreComponentId><Value>6</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,'2016-01-05 07:44:45.357',@userKey,'2016-01-05 07:44:45.357')
    INSERT INTO EngagementCategory VALUES('B8126FB4-E2B5-4D3A-B922-70D4E7ABA69E','D0292457-7EFF-42E1-B655-BE8715B78552','Contributor',1,
        '#00a9e0','<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>50</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,'2016-01-05 07:44:45.357',@userKey,'2016-01-05 07:44:45.357')
    INSERT INTO EngagementCategory VALUES('9483B418-76CE-4F2C-AB44-635E0019224D','D0292457-7EFF-42E1-B655-BE8715B78552','Connector',2,
        '#8e51ae','<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>35</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,'2016-01-05 07:44:45.357',@userKey,'2016-01-05 07:44:45.357')
    INSERT INTO EngagementCategory VALUES('572A8203-3396-44D3-A838-0260FBA4662B','D0292457-7EFF-42E1-B655-BE8715B78552','Participant',3,
        '#d03528','<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>15</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
         1,@userKey,'2016-01-05 07:44:45.357',@userKey,'2016-01-05 07:44:45.357')
    INSERT INTO EngagementCategory VALUES('F0FD7C8B-A862-48E3-8B51-BE970DADE5DF','D0292457-7EFF-42E1-B655-BE8715B78552','User',4,
        '#616365','<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,'2016-01-05 07:44:45.357',@userKey,'2016-01-05 07:44:45.357')
END
GO

---------------------------------------------------------------------------
-- PBI 61225 - Be sure exactly one PublishServerRef entry is set as default
-- This is the server that will execute all process automation tasks
---------------------------------------------------------------------------
DECLARE @defaultCount int
DECLARE @defaultPublishServerCode char
SELECT @defaultCount = COUNT(1) FROM [dbo].[PublishServerRef] WHERE [IsDefault] = 1

IF @defaultCount = 0
    UPDATE [dbo].[PublishServerRef] SET [IsDefault] = 1 WHERE [PublishServerCode] = (SELECT TOP 1 [PublishServerCode] FROM [dbo].[PublishServerRef])
ELSE IF @defaultCount > 1
BEGIN
    SELECT TOP 1 @defaultPublishServerCode = [PublishServerCode] FROM [dbo].[PublishServerRef] WHERE [IsDefault] = 1 ORDER BY [PublishServerCode]
    UPDATE [dbo].[PublishServerRef] SET [IsDefault] = 0 WHERE [PublishServerCode] <> @defaultPublishServerCode
END    
GO

---------------------------------------------------------------------------------------------------------
-- PBI 57833 Merging V10 BOD dll's into a single project/dll called Asi.Business.V10
---------------------------------------------------------------------------------------------------------
UPDATE [dbo].[ComponentRegistry] 
    SET [AssemblyName] = 'Asi.Business.V10' 
WHERE [ComponentKey] IN 
('0eef128e-6641-480f-8149-b958d4472537'
,'12590bb9-773d-48c8-8b7c-0c3c52c72e99'
,'18143c08-1a7f-4289-8419-5a0122ba0a5e'
,'2450bed6-f2cd-4034-8839-5c1a2f9b0348'
,'2b2a83dc-bfff-40d5-af7c-a13aeb75cb06'
,'35fa26c2-bbbf-45a5-bf90-a8a759fcbb7c'
,'3ac0d954-e616-413f-a54b-1eb74a708d2e'
,'4cfa8986-0422-4c15-bfd1-58dc42a7279b'
,'592e98bb-de7e-4983-a7e9-e653088830f4'
,'5b0b5792-44da-4d56-a66d-a21bdbe2a11f'
,'6aaff419-fbc2-4ca1-8ee0-3b72cad31af3'
,'6d63419e-3fa6-4bdb-97fa-7ab377d083d5'
,'8f3e6453-3dd8-4426-9481-bd1c626549ec'
,'8f5d4749-f62b-4f4a-97ff-b3c7d39418e8'
,'904ea33f-20a6-43f6-aad3-e73daf506f4a'
,'994549f2-f553-43d5-ab05-9e6a424bc527'
,'9d67b0af-3f97-41ea-8e02-fed67e36b423'
,'9e7cc0ab-3024-4883-83e9-bbb4829a3e7d'
,'9edd357c-0a16-4697-857f-6db305954b14'
,'d2358654-ede5-4ac4-9cf6-cbfa2c9b5887'
,'d60ed1b1-2b41-4e2d-afaf-a16028614976'
,'dbdcf83e-d7a9-4195-b08b-764c8b52b803'
,'e5b09257-efea-4126-968c-edddb3738fae'
,'fe95563c-4bbd-413b-98fe-f7aebd1a2f3b'
,'4669FBF0-AC7F-408E-8C89-63AAECD411CA'
)

---------------------------------
-- PBI 63565/ 57833 BUG BOD project merge fallout.  Update the Process Engine types
---------------------------------
UPDATE [dbo].[ProcessEngineType] 
    SET [Assembly] = 'Asi.Business.V10' 
WHERE [ProcessEngineTypeKey] IN
('3EC09CA7-A02C-41B8-B4BC-58C47E7454A5'
,'EEE96338-D44F-4A5E-B0BE-B21A7A06F084'
,'3D14CBC3-7D74-46C7-B16F-D75B98D6E144'
,'0F1FF7B7-0839-4C6C-AD9C-EBBBC319E936'
)

---------------------------------
-- PBI 64222 - Minor UI updates
---------------------------------
-- Fix for weird labels in the Contact Formulas setup page
UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Full name formula for individuals'
 WHERE [ParameterName] = 'IndividualFullNameFormula';

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Full name formula for organizations'
 WHERE [ParameterName] = 'InstituteFullNameFormula';

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Format for contact ID'
 WHERE [ParameterName] = 'ContactIDFormat';

UPDATE [dbo].[SystemConfig]
   SET [Description] = 'Email regular expression (regex)'
 WHERE [ParameterName] = 'Contact.Email.RegularExpression';

 ----------------------------------------------------------
-- Populate blank PaymentMethodSummary fields in the DataVaultLogDetail table -PBI 63874
----------------------------------------------------------
UPDATE t1 
   SET [PaymentMethodSummary] = t2.[PaymentMethodSummary]
  FROM [dbo].[DataVaultLogDetail] t1 
       INNER JOIN [dbo].[AutoPayAccount] t2 ON t1.[PaymentToken] = t2.[PaymentToken] 
 WHERE t1.[PaymentMethodSummary] = ''
   AND t2.[PaymentMethodSummary] IS NOT NULL 
GO

 ----------------------------------------------------------
-- PBI 64122 Update LocalizationCulture data for German language
----------------------------------------------------------
UPDATE [dbo].[LocalizationCulture]
   SET [LocalizationCultureDisplayName] = 'Deutsch'
WHERE [LocalizationCultureId] = 'de'
   AND ([LocalizationCultureDisplayName] IS NULL OR [LocalizationCultureDisplayName] <> 'Deutsch');
GO

------------------------------------------------------------
-- PBI 63882 - Match AtomHIControlType enum for time zone ID
------------------------------------------------------------
IF NOT EXISTS (
               SELECT 1
                 FROM [dbo].[HiControlTypeRef]
                WHERE [HiControlTypeRef].[HiControlTypeCode] = 25
)
BEGIN
    INSERT INTO [dbo].[HiControlTypeRef] ([HiControlTypeCode],
                                          [HiControlTypeName],
                                          [HiControlTypeDesc]
                                         )
    VALUES (25,
            'Image',
            'Image'
           );
END;
GO
IF NOT EXISTS (
               SELECT 1
                 FROM [dbo].[HiControlTypeRef]
                WHERE [HiControlTypeRef].[HiControlTypeCode] = 26
)
BEGIN
    INSERT INTO [dbo].[HiControlTypeRef] ([HiControlTypeCode],
                                          [HiControlTypeName],
                                          [HiControlTypeDesc]
                                         )
    VALUES (26,
            'TimeZone',
            'TimeZone'
           );
END;
GO

-------------------------------------------------
-- Add new RemoteService role to RoleMain table
-------------------------------------------------
DECLARE @userKey uniqueidentifier;
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM';
IF (@userKey IS NULL) SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER';
-- Add the new role if it doesn't already exist
IF NOT EXISTS (SELECT 1 FROM [dbo].[RoleMain] WHERE [RoleKey] = '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576' AND [Name] = 'RemoteService')
BEGIN
    INSERT INTO [dbo].[RoleMain] ([RoleKey], [Name], [Description], [IsSystem], [UpdatedByUserKey], [UpdatedOn])
    VALUES ('8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576', 'RemoteService', 'Remote Service Access', 1, @userKey, '2016-06-17 00:00:00.000');
END
-- Fix up any role with the same name but a differnet key
IF EXISTS (SELECT 1 FROM [dbo].[RoleMain] WHERE [Name] = 'RemoteService' AND [RoleKey] <> '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576')
BEGIN
    DECLARE @oldRemoteServiceKey uniqueidentifier;
    SELECT @oldRemoteServiceKey = [RoleKey] FROM [dbo].[RoleMain] WHERE [Name] = 'RemoteService' AND [RoleKey] <> '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576';
    UPDATE [dbo].[AccessItem]
       SET [Grantee] = '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576',
           [RoleKey] = '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576'
     WHERE [RoleKey] = @oldRemoteServiceKey;
    UPDATE [dbo].[UserRole]
       SET [RoleKey] = '8DFF65A1-2CC3-4AAF-A9C1-9EB33662D576'
     WHERE [RoleKey] = @oldRemoteServiceKey;
    DELETE FROM [dbo].[RoleMain]
     WHERE [Name] = 'RemoteService' AND [RoleKey] = @oldRemoteServiceKey;
END
GO

---------------------------------
-- Inactivate AutoPayAccounts that have same payment method, update instructions to point to single active AutoPayAccount
---------------------------------
-- Check for existence of the SystemConfig indicating that this process has already been run
IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [ParameterName] = 'AutoPayAccountsHaveBeenConsolidated')
BEGIN

    SET NOCOUNT ON

    --Initialize constants for inserts and updates
    DECLARE @managerKey uniqueidentifier
    DECLARE @now datetime
    DECLARE @orgKey uniqueidentifier
    DECLARE @systemEntity uniqueidentifier

    SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'
    SELECT @now = [dbo].asi_GetAppDatetime()
    SELECT @orgKey = '00000000-0000-0000-0000-000000000000'
    SELECT @systemEntity = [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization'

    -- Identify all of the cases where duplicate rows exist for the same Account. We will assign a RowNumber value
    -- based on the CreatedOn date and always assign the lowest value to the newest row. This is the one that we 
    -- consolidate all of the duplicates into.   
    IF OBJECT_ID('tempdb..#UpdateAccounts') IS NOT NULL DROP TABLE #UpdateAccounts;
    WITH cteNonUniqueAccounts AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY [CustomerId] ORDER BY [CreatedOn] DESC) AS [RowNumber],
           [CustomerId],
           [PaymentMethodId],
           [PaymentMethodSummary],
           [PaymentToken],
           [PaymentTokenExpirationDate],
           [CreatedOn],
           [CreatedByUserKey],
           [AutoPayAccountKey]
      FROM [dbo].[AutoPayAccount]
    )
    SELECT a.[AutoPayAccountKey] AS [AccountKeyToDelete],
           n.[AutoPayAccountKey] AS [NewAccountKey],
           a.[PaymentToken] AS [TokenToDelete],
           n.[PaymentToken] AS [ReplacementToken]
      INTO #UpdateAccounts
      FROM [dbo].[AutoPayAccount] a
           INNER JOIN cteNonUniqueAccounts n ON a.[CustomerId] = n.[CustomerId] 
                                          AND a.[PaymentMethodId] = n.[PaymentMethodId] 
                                          AND a.[PaymentMethodSummary] = n.[PaymentMethodSummary]
                                          AND a.[PaymentTokenExpirationDate] = n.[PaymentTokenExpirationDate]
                                          AND a.[PaymentToken] <> n.[PaymentToken]
                                          AND n.[RowNumber] = 1

    -- Update the AutoPayInstruction data for the duplicate Accounts to all use the newest Token
    UPDATE [dbo].[AutoPayInstruction]
       SET [AutoPayAccountKey] = u.[NewAccountKey],
           [UpdatedByUserKey] = @managerKey,
           [UpdatedOn] = @now
      FROM [dbo].[AutoPayInstruction] 
           INNER JOIN #UpdateAccounts u ON [AutoPayAccountKey] = u.[AccountKeyToDelete]

    -- Update the AutoPayAccount data to mark the duplicate Accounts as Inactive
    UPDATE [dbo].[AutoPayAccount]
       SET [AutoPayAccountStatusCode] = 'Inactive',
           [UpdatedByUserKey] = @managerKey,
           [UpdatedOn] = @now
      FROM [dbo].[AutoPayAccount]
           INNER JOIN #UpdateAccounts u ON [AutoPayAccountKey] = u.[AccountKeyToDelete]
 
    -- Insert the system config parameter to prevent this procedure from being run again when upgrade is rerun
    IF NOT EXISTS (SELECT 1 FROM [dbo].[SystemConfig] WHERE [SystemConfigKey] = 'B8028131-FC10-4BD0-998F-852F55A70512')
    BEGIN
        INSERT INTO [dbo].[SystemConfig]([SystemConfigKey], [ParameterName], [ParameterValue],
                                         [Description],
                                         [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn],
                                         [OrganizationKey], [SystemEntityKey])
        VALUES ('B8028131-FC10-4BD0-998F-852F55A70512', 'AutoPayAccountsHaveBeenConsolidated', 'True', 
        'Indicates whether the logic to consolidate duplicated rows in the AutoPayAccount table has already been run.', 
        @managerKey, @now, @managerKey, @now, @orgKey, @systemEntity)
    END

    -- Clean up the Temp tables
    IF OBJECT_ID('tempdb..#NonUniqueAccounts') IS NOT NULL DROP TABLE #NonUniqueAccounts;    
    IF OBJECT_ID('tempdb..#UpdateAccounts') IS NOT NULL DROP TABLE #UpdateAccounts;

    SET NOCOUNT OFF

END
GO

---------------------------------------------------------------
-- PBI 65107 DataVaultServiceAddress has URL that is incorrect
---------------------------------------------------------------
UPDATE sc 
   SET [ParameterValue] = '' 
  FROM [dbo].[SystemConfig] sc 
 WHERE [ParameterName] = 'DataVault.DataVaultServiceAddress' 
   AND [ParameterValue] = 'https://payments.advsol.com/DataVaultLive/Asi.Services.DataVaultService.DataVault.svc'
    OR [ParameterValue] = 'https://payments.advsol.com/DataVaultCI/Asi.Services.DataVaultService.DataVault.svc'
GO


---------------------------------------------------------------
-- PBI 65533 - Deprecate older themes
---------------------------------------------------------------
-- Mark themes as deprecated
UPDATE [dbo].[Theme] 
   SET [ScheduledRemovalDate] = '20171001' 
 WHERE [ThemeName] IN ('Everest', 'Venus', 'Birch', 'Mercury', 'Aspen_Mobile', 'Aspen', 'Aspen2', 'Mars')
   AND [ScheduledRemovalDate] IS NULL
GO

---------------------------------------------------------------
-- SBT 65308 - Add Identified by to Moves management profile
---------------------------------------------------------------
UPDATE [dbo].[PanelDefinition]
   SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Cultivating Donor For</Name><PanelDefinitionId>836dacbe-c40b-4cde-840c-3c7254af0f4f</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Cultivating Donor For</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Gift type</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>GiftType</PropertyName></PanelFieldData><PanelFieldData><Caption>Estimated value</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EstimatedValue</PropertyName></PanelFieldData><PanelFieldData><Caption>Planned ask time</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PlannedAskDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Cultivation stage</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CultivationStage</PropertyName></PanelFieldData><PanelFieldData><Caption>Quality</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Quality</PropertyName></PanelFieldData><PanelFieldData><Caption>Note</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Note</PropertyName></PanelFieldData><PanelFieldData><Caption>Identified by</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IdentifiedBy</PropertyName></PanelFieldData><PanelFieldData><Caption>Moves manager</Caption><EntityName>FundraisingProfileDonorData</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>SOLICITOR_ID</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CultivatingFor</a:string><a:string>FundraisingProfileDonorData</a:string></SelectedEntityNames></PanelDefinitionData>'
 WHERE [PanelDefinitionId] = '836DACBE-C40B-4CDE-840C-3C7254AF0F4F'
GO

-- Update the Security on some queries
UPDATE [dbo].[DocumentMain]
   SET [AccessKey] = '00000000-0000-0000-0000-000000000CA1'
 WHERE [DocumentKey] IN ('DDC276D2-B15E-4840-8861-A40211DACF52', 'CA3DCDB6-AE82-489D-B70A-501ACA7B89F4',
                         '6BFD2A43-4123-4133-B453-9991A438FA8E', '3863FCA4-09DE-4C46-B860-67624345D0B9', 
                         'F31D4DC0-DFBF-4026-A205-660914D5116C', 'C2344314-2765-4272-84AD-02740107DBAD', 
                         'CEFC9DC8-790F-4D37-A6C3-71D4B0107603', '8E031969-B5B4-40DD-A63E-9EB30D560B8B',
                         '675D1C67-8A09-486C-B6E2-F67FBDDA82D0')
  AND [AccessKey] <> '00000000-0000-0000-0000-000000000CA1';
GO


------------------------------------------------------------------------------------------------------------------
-- SMR 370509: Ensure Relationship_Type values EVTGUEST and EVTGUESTOF which are required for guest pricing, exist
------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship_Types] WHERE [RELATION_TYPE] = 'EVTGUEST')
BEGIN
    INSERT INTO [dbo].[Relationship_Types] ([RELATION_TYPE], [DESCRIPTION], [RECIPROCAL_TYPE], [USE_TITLE], [USE_DATES])
    VALUES ('EVTGUEST', 'Event Guest', 'EVTGUESTOF', 0, 1)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Relationship_Types] WHERE [RELATION_TYPE] = 'EVTGUESTOF')
BEGIN
    INSERT INTO [dbo].[Relationship_Types] ([RELATION_TYPE], [DESCRIPTION], [RECIPROCAL_TYPE], [USE_TITLE], [USE_DATES])
    VALUES ('EVTGUESTOF', 'Event Guest of', 'EVTGUEST', 0, 1)
END
GO

------------------------------------------------------------------------------------------------------------------
-- PBI 67314 - Add a new Organization score
------------------------------------------------------------------------------------------------------------------
-- Engagement Score 
DECLARE @userKey uniqueidentifier
DECLARE @engagementScoreKey uniqueidentifier
DECLARE @now datetime

-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
SET @engagementScoreKey = '73C94168-8893-4D25-BFCA-78EF4DBDEE60'
SET @now = dbo.asi_GetAppDatetime()

-- Add EngagementScore for upgrade if its not found.  If it is found, we don't mess with it at all,
-- because they might have modified it. 
IF NOT EXISTS (SELECT 1 FROM [dbo].[EngagementScore] WHERE [EngagementScoreKey] = @engagementScoreKey)
BEGIN
    INSERT INTO [dbo].[EngagementScore]([EngagementScoreKey], [EngagementScoreName], [EngagementScoreDesc], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [IsEnabled], [SystemTypeCode]) 
    VALUES (@engagementScoreKey, 'Overall organization engagement', 'Calculations for a general overall engagement score for organizations, including activity by members of the organization', @userKey, @now, @userKey, @now, 1, 20)


    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '2423BF86-24F3-4C29-B80B-1E3E2A2F1739' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('2423BF86-24F3-4C29-B80B-1E3E2A2F1739', @engagementScoreKey, 'Organization donations', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgDonations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>2</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'A9DB68F2-9A5B-48EF-A789-81221BBE153A' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('A9DB68F2-9A5B-48EF-A789-81221BBE153A', @engagementScoreKey, 'Event registrations', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgMemberEventRegistrations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'EE21CAE0-97E0-40DC-B3BC-5D94A7B1E810' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('EE21CAE0-97E0-40DC-B3BC-5D94A7B1E810', @engagementScoreKey, 'Recently logged in', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgRecentlyLoggedIn</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>1</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '4A596A2C-7027-43C9-9AA8-BC3B7E926CE0' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('4A596A2C-7027-43C9-9AA8-BC3B7E926CE0', @engagementScoreKey, 'Donations', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgMemberDonations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>2</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '173C61EE-7802-4F70-A865-D4C50AB2149D' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('173C61EE-7802-4F70-A865-D4C50AB2149D', @engagementScoreKey, 'Purchases', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgPurchasesByOrgMembers</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '6BE66DA3-0262-4EAF-9F0F-A445345E2FCE' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('6BE66DA3-0262-4EAF-9F0F-A445345E2FCE', @engagementScoreKey, 'Organization purchases', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgPurchases</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '1FF7880C-DD21-4B7D-A73A-72E423B42400' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('1FF7880C-DD21-4B7D-A73A-72E423B42400', @engagementScoreKey, 'Volunteer attendance', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgVolunteer_attendance</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>0.25</Multiplier></WeightData>', 2, 'Hours', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'BAC3EC2B-00AF-4D52-9ECC-A11FA03018E6' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('BAC3EC2B-00AF-4D52-9ECC-A11FA03018E6', @engagementScoreKey, 'Committee memberships', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgCommitteeMemberships</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>5</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 1)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '79D1F6E4-3993-41BF-BD6E-75413001A763' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('79D1F6E4-3993-41BF-BD6E-75413001A763', @engagementScoreKey, 'Posts', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgNumberOfPosts</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>0.75</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = 'EEDE112E-7B86-4E38-A98E-C41F2D9EABEB' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('EEDE112E-7B86-4E38-A98E-C41F2D9EABEB', @engagementScoreKey, 'Organization event registrations', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgEventRegistrations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>3</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 0)
    END
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ScoreComponent] WHERE [ScoreComponentKey] = '6D33591A-9F67-4EC3-A3C8-1B1A2F60F1A7' AND [EngagementScoreKey] = @engagementScoreKey)
    BEGIN
        INSERT INTO [dbo].[ScoreComponent] ([ScoreComponentKey], [EngagementScoreKey], [DisplayName], [DataSource], [Weight], [FunctionId], [FunctionPropertyName], [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn], [LastRunOn], [IsSampled]) 
        VALUES ('6D33591A-9F67-4EC3-A3C8-1B1A2F60F1A7', @engagementScoreKey, 'Community subscriptions', 
        '<DataSourceQueryData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><DataSourceId>primary</DataSourceId><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Engagement/Queries/OrgCommunitySubscriptions</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></DataSourceQueryData>',
        '<WeightData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Multiplier>1</Multiplier></WeightData>', 1, N'', @userKey, @now, @userKey, @now, NULL, 1)
    END
        


-- Add 5 EngagementCategories

   INSERT INTO EngagementCategory VALUES('5C7CC978-F610-4882-A288-0F405A39AC95',@engagementScoreKey,'Leadership',0,
        '#68bd49',
        '<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>80.0</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,@now,@userKey,@now)
   INSERT INTO EngagementCategory VALUES('A5586E35-8078-42A7-ACA4-2ADCDF261DFD',@engagementScoreKey,'Active',1,
        '#00a9e0',
        '<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>60.0</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,@now,@userKey,@now)
   INSERT INTO EngagementCategory VALUES('2E7F7840-FA34-4921-BED2-2DDA587AE0AF',@engagementScoreKey,'Median',2,
        '#8e51ae',
        '<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>40.0</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,@now,@userKey,@now)
   INSERT INTO EngagementCategory VALUES('24524AD1-CBFD-419E-95A4-FD9D68FE21DD',@engagementScoreKey,'At Risk',3,
        '#d03528',
        '<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>20.0</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,@now,@userKey,@now)       
   INSERT INTO EngagementCategory VALUES('4FD5654E-4929-4A04-B6C6-B6CCAD817A9C',@engagementScoreKey,'Low Activity',4,
        '#616365',
        '<CategoryCriteriaDataCollection xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><CategoryCriteria><BasisType>Percentile</BasisType><Comparison>GreaterThan</Comparison><ScoreComponentId/><Value>-1.0</Value></CategoryCriteria></CategoryCriteriaDataCollection>',
        1,@userKey,@now,@userKey,@now)
END
GO

-------------------------------------------------
-- PBI 69662 - Fix CommitteeDetailAdmin shortcuts
-------------------------------------------------
-- Since this shortcut is editable, customers may have already fixed it
-- Update the Description if it hasn't been set yet
IF EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE [URLMappingKey] = 'A0D68620-E9BA-4F2C-84B1-32964E4BD2FD' AND [URLMappingDesc] = '')
UPDATE [dbo].[URLMapping] SET [URLMappingDesc] = 'Used to display committee group details for users authorized to administer the group.' WHERE [URLMappingKey] = 'A0D68620-E9BA-4F2C-84B1-32964E4BD2FD'

-- Update the URL Parameters if they haven't been fixed yet
IF EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE [URLMappingKey] = 'A0D68620-E9BA-4F2C-84B1-32964E4BD2FD' AND [URLParameters] = 'Used to display committee group details for users authorized to administer the group.')
UPDATE [dbo].[URLMapping] SET [URLParameters] = '' WHERE [URLMappingKey] = 'A0D68620-E9BA-4F2C-84B1-32964E4BD2FD'
GO

------------------------------------------------------------------------------------------------------------------
-- PBI 69094 20.2.6x (Activity) Activity.EffectiveDate has timestamp and shouldn't 
-- (Gift Aid) When generating a Gift Aid tax reclaim gifts are not being included if thru date is today. Thru date must be set to tomorrow.
------------------------------------------------------------------------------------------------------------------
UPDATE [dbo].[Activity]
   SET EFFECTIVE_DATE = DATEADD(dd, DATEDIFF(dd, 0, EFFECTIVE_DATE), 0)
WHERE EFFECTIVE_DATE IS NOT NULL
   AND CONVERT(TIME, EFFECTIVE_DATE) <> '00:00:00:000'
GO

----------------------------------------------------------------------------------------------------
-- PBI 71882 - (AutoPay) v10/v100 BUG - need to persist PaymentMethodSummary (inactive)
----------------------------------------------------------------------------------------------------
UPDATE [AutoPayAccount] 
   SET [PaymentMethodSummary] = [PaymentMethodSummary] + ' (inactive)'
  FROM [dbo].[AutoPayAccount] 
 WHERE [AutoPayAccountStatusCode] <> 'Active'
   AND [PaymentMethodSummary] NOT LIKE '%(inactive)%'
GO
-- End of script

SET NOCOUNT OFF
GO
