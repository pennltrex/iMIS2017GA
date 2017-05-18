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

-- Beginning of script

----------------------------------------------------------------------------
-- PBI 47647 - Set availability of registration options for any function
-- that has no availability specified.
----------------------------------------------------------------------------
UPDATE pf 
   SET pf.[AVAILABLE_TO] = CASE    
							   WHEN mm.ADD_GUESTS = 1 THEN 3  -- Reg option for event that allows guests, set to allow guest + registrant
							   ELSE 1                         -- Reg option for event that doesn't allow guests, set to allow registrant
						   END
  FROM [dbo].[Meet_Master] mm
	   INNER JOIN [dbo].[Product] p ON p.[PRODUCT_MAJOR] = mm.[MEETING]
	   INNER JOIN [dbo].[Product_Function] pf ON pf.[PRODUCT_CODE] = p.[PRODUCT_CODE]
WHERE pf.[IS_EVENT_REGISTRATION_OPTION] = 1 
   AND pf.[AVAILABLE_TO] = 0  -- == Not specified


----------------------------------------------------------------------------
-- PBI 52372 - Event Dashboard shortcut not consistent across all supported upgrades
----------------------------------------------------------------------------
-- If the AllSites shortcut is currently pointing to Event_Display, update it to point to Event_Dashboard instead
UPDATE [dbo].[URLMapping]
   SET [TargetDocumentVersionKey] = 'A8AB6743-9DDA-41F7-9AA2-7A681A203082',
	   [URL] = '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard'
 WHERE [URLMappingKey] = '7EE4B712-61A1-4C25-90E2-011D937139A5'
	   AND [TargetDocumentVersionKey] = '7AAA2571-9E50-4473-B894-1174EC66D004'

----------------------------------------------------------------------------
-- PBI 52830 - Supporting data for IQA based groups
----------------------------------------------------------------------------
-- New "Dynamic group" group type
DECLARE @userKey uniqueidentifier
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRef] WHERE [GroupTypeKey] = '3B630B49-2095-4B8E-A93D-61B30394D553')
INSERT INTO [dbo].[GroupTypeRef]
([GroupTypeKey], [GroupTypeName], [IsSystem], [IsPaymentRequired], [IsDateLimited], [IsInvitationOnly], [DefaultGroupStatusCode], [IsSimpleGroup],
[InheritRolesFlag], [IsSingleRole], [GroupTypeDesc], [CreatedByUserKey], [UpdatedByUserKey], [CreatedOn], [UpdatedOn], [IsRelationshipGroup])
VALUES
('3B630B49-2095-4B8E-A93D-61B30394D553', 'Dynamic Group', 1, 0, 0, 0, 'A', 1,
0, 0, 'Dynamic IQA based group type', @userKey, @userKey, GETDATE(), GETDATE(), 0)

GO

-- New IsSystem (hidden) scheduled tasks
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Add TaskDefinition
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '1DE1D2CB-053F-4135-8F40-7CBB799AD4C2')
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
	('1DE1D2CB-053F-4135-8F40-7CBB799AD4C2'	
	,'Refresh Dynamic Groups - Daily'	
	,'Refresh all groups based on IQA queries that are scheduled to update daily'	
	,0	
	,1	
	,1	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>56aa2249-9a25-42ad-82ee-2c2201793611</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Daily</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update daily</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Daily</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>85c06a56-092b-4043-8445-dbbca7531f23</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>1de1d2cb-053f-4135-8f40-7cbb799ad4c2</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>1de1d2cb-053f-4135-8f40-7cbb799ad4c2</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">05adb028-5bf0-48a7-82c5-f77bfc305e26</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2015-04-07T03:05:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-02-18T03:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:41:24.533</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    


IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'E24B81BD-DA44-47D2-9007-E2B78DBAC343')
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
	('E24B81BD-DA44-47D2-9007-E2B78DBAC343'	
	,'Refresh Dynamic Groups - Weekly'	
	,'Refresh all groups based on IQA queries that are scheduled to update weekly'	
	,0	
	,1	
	,1	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>936fce33-4c3f-436f-86d6-7ffee113c657</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Weekly</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update weekly</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Weekly</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>445c295d-c41d-4bd0-a457-9c0df545d0e1</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>e24b81bd-da44-47d2-9007-e2b78dbac343</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>e24b81bd-da44-47d2-9007-e2b78dbac343</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">6534ffce-d5d0-4579-b29e-05e8592c279c</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfWeek xmlns:a="http://schemas.datacontract.org/2004/07/System"><a:DayOfWeek>Sunday</a:DayOfWeek></DaysOfWeek><Months>0</Months><ScheduleFrequency>Weekly</ScheduleFrequency><Time>0001-01-01T01:00:00</Time><Weeks>1</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-03-01T04:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:05.373</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    


IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'A3C01355-8115-4C96-9A6A-10D2E0F23B6E')
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
	('A3C01355-8115-4C96-9A6A-10D2E0F23B6E'	
	,'Refresh Dynamic Groups - Monthly'	
	,'Refresh all groups based on IQA queries that are scheduled to update monthly'	
	,0	
	,1	
	,1	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>8ab67318-b10f-4427-8154-c3e137ecccdc</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Monthly</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update monthly</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Monthly</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>1850234a-925f-4bc6-bdb1-115b74d3a041</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>a3c01355-8115-4c96-9a6a-10d2e0f23b6e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>a3c01355-8115-4c96-9a6a-10d2e0f23b6e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">e8610b67-aa47-4535-9990-3bd219d5ff3d</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfMonth xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>1</a:string></DaysOfMonth><Months>1</Months><ScheduleFrequency>Monthly</ScheduleFrequency><Time>0001-01-01T02:00:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-03-01T05:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:23.01</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    

----------------------------------------------------------------------------
-- SBT 53588 - Update all system scheduled tasks to avoid trigger times between midnight & 3am (due to DST shifts)
----------------------------------------------------------------------------
-- Noticed the following two TaskDefinitions were in gold but not in upgrade.  Checked with team that did the original work and seems it was an omission.
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '458C4906-D946-4A41-85A8-B62E2B63ED2A')
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
	('458C4906-D946-4A41-85A8-B62E2B63ED2A'	
	,'Donation thank you email'	
	,'Sends out a thank you email to donors who have made a donation.'	
	,0	
	,0	
	,0	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>ffd474b3-7054-4643-9538-4472c1a3f65d</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>c866e389-3abd-45f6-9545-f1a9024b91c2</a:CommunicationTemplateId><a:Description>DonationThankYouTemplate</a:Description><a:RecipientDatasourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</DataSourceId><DataSourceName>Donors</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Donations received today</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a thank you email to donors who have made a donation.</Description><Evaluations/><Name>Donation thank you email</Name><Notifications><NotificationDefinition><DataSources><string>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</string></DataSources><DefaultTemplate/><NotificationDefinitionId>29dcb66a-dbca-465d-a769-dc3222e0c43d</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">6e91c1a3-3b09-4621-809d-878084021dcf</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2014-10-03T23:59:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T23:59:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T15:06:18.767</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T15:09:10.67</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    

IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'CD0655EF-CE2F-4D43-8CE9-7C49F6EBF79E')
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
	('CD0655EF-CE2F-4D43-8CE9-7C49F6EBF79E'	
	,'New member welcome email'	
	,'Sends out a welcome email on a weekly basis to members who have joined in the past week.'	
	,0	
	,0	
	,0	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>a42eef4e-7293-482a-a134-48a1a8659ba2</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>e31a50a7-7e40-463c-97ed-2f9de4856aab</a:CommunicationTemplateId><a:Description>New Member Welcome Email</a:Description><a:RecipientDatasourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</DataSourceId><DataSourceName>NewMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/New members in the last 7 days</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a welcome email on a weekly basis to members who have joined in the past week.</Description><Evaluations/><Name>New member welcome email</Name><Notifications><NotificationDefinition><DataSources><string>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</string></DataSources><DefaultTemplate/><NotificationDefinitionId>3b5d8751-e9c6-413a-b7cf-93f0f0497815</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">1b9adb73-daf7-4e20-92e3-5ca70854d415</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfWeek xmlns:a="http://schemas.datacontract.org/2004/07/System"><a:DayOfWeek>Sunday</a:DayOfWeek></DaysOfWeek><Months>0</Months><ScheduleFrequency>Weekly</ScheduleFrequency><Time>0001-01-01T00:00:00</Time><Weeks>1</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T03:01:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T14:58:35.247</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:58.227</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    
GO

-- Update DynamicGroup BO component registry and add an entry for the controller
UPDATE [dbo].[ComponentRegistry] 
   SET [Description] = '', [ConfigureWebUserControl] = '', [ConfigureWindowsControl] = '' 
 WHERE [Name] = 'DynamicGroup' AND [InterfaceName] = 'IAtom'

IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = 'C89B069C-FF42-48C8-9639-2E27BFBAC103')
INSERT INTO [dbo].[ComponentRegistry]
([ComponentKey], [Name], [Description], 
[InterfaceName], [TypeName], [AssemblyName],
[ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [DeploymentPackageCode])
VALUES
('C89B069C-FF42-48C8-9639-2E27BFBAC103', 'DynamicGroup', 'DynamicGroup Controller', 
'BusinessController', 'Asi.Business.Common.DynamicGroupController', 'Asi',
'', '', 1, 1, 'Platform')
GO
-----------------------------------------------------------------------------------
-- SBT 53025 - Add duplicate rule to DuplicateEngineRuleSet table
-----------------------------------------------------------------------------------

IF NOT EXISTS(SELECT 1 
				   FROM [dbo].[DuplicateEngineRuleSet]
				   WHERE [DuplicateEngineRuleSetCode] = 'ASI')
  BEGIN
	  INSERT INTO [dbo].[DuplicateEngineRuleSet]
	  VALUES
	  ('ASI','<Root>
	  <Rule>SELECT 
		LastName + SUBSTRING(FirstName,1,1) + SUBSTRING(ZIP,1,5),
		soundex(LastName + SUBSTRING(FirstName,1,1)) + SUBSTRING(ZIP,1,5), 
		cm.SyncContactID 
	  FROM Individual i
		INNER JOIN ContactMain cm ON cm.ContactKey = i.ContactKey
		INNER JOIN Name_Address a ON a.ID = cm.SyncContactID
	  WHERE a.PREFERRED_MAIL = 1 
	</Rule>
	</Root>')
  END  

  GO

----------------------------------------------------------------------------
-- SBT 53352 Automation: v100 Duplicate Contact Search task doesn't appear in upgraded dbs
----------------------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Add TaskDefinition
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'AF2310B5-84FB-48A6-B27A-6A0E764F3252')
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
	('AF2310B5-84FB-48A6-B27A-6A0E764F3252'	
	,'Duplicate Contact Search'	
	,'Searches all contacts for potential duplicates.'	
	,0	
	,1	
	,1	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionStoredProcedureData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>1ef57668-6c82-4a19-8803-0f030a1639e3</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>StoredProcedure</a:ActionTypeName><a:Description>asi_DuplicateEngineBatchRun</a:Description><a:StoredProcedureName>asi_DuplicateEngineBatchRun</a:StoredProcedureName></Action></Actions><DataSources i:nil="true"/><Description>Searches all contacts for potential duplicates.</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Duplicate Contact Search</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>fa85fa23-9270-49f6-8ce0-223471fe34ec</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>af2310b5-84fb-48a6-b27a-6a0e764f3252</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>af2310b5-84fb-48a6-b27a-6a0e764f3252</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers/><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>KERRYT</a:CreatedBy><a:CreatedOn>2015-03-11T13:49:47.22</a:CreatedOn><a:UpdatedBy>RBERNSTEIN</a:UpdatedBy><a:UpdatedOn>2015-03-31T15:12:59.53</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    
GO
----------------------------------------------------------------------------
-- PBI 52007 Automation: Add alert to v10 for duplicate record
----------------------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();

-- Update Duplicate Contact Alert TaskDefinition, taking into account moving of queries (PBI 53875)
IF EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99')
BEGIN
	UPDATE [dbo].[TaskDefinition] 
	SET 
	SerializedTaskDefinition = '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</DataSourceId><DataSourceName>PotentialPartyDuplicates</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/Queries/PotentialPartyDuplicates</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>872dfc76-5213-4c30-8ec7-34ab72c56184</DataSourceId><DataSourceName>SelectedContact</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/SelectedContact</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Alerts staff that a duplicate contact record may exist</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Duplicate Contact Alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Possible duplicate contact(s) found.&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b4b2a5b3-3b63-4ff9-bf26-51675db2bdd5</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>184bdd32-3a46-4431-919e-a5267fa6836a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-04-01T08:15:44.44</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2015-04-09T13:18:29.377</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	WHERE TaskDefinitionKey = 'EF535A97-76F5-4C72-B0A1-E94681D38C99';
END 


-- Add TaskDefinition
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
	,1	
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</DataSourceId><DataSourceName>PotentialPartyDuplicates</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/Queries/PotentialPartyDuplicates</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>872dfc76-5213-4c30-8ec7-34ab72c56184</DataSourceId><DataSourceName>SelectedContact</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/SelectedContact</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Alerts staff that a duplicate contact record may exist</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Duplicate Contact Alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Possible duplicate contact(s) found.&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b4b2a5b3-3b63-4ff9-bf26-51675db2bdd5</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>184bdd32-3a46-4431-919e-a5267fa6836a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-04-01T08:15:44.44</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2015-04-09T13:18:29.377</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey	
	,@now	
	,@userKey	
	,@now)
END    

IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99')
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
			   ('06509790-5BE7-47FE-9B88-A3E49C9BAF30'
			   ,'845F59DB-52B9-4448-8209-C77B8FC1FE60'
			   ,'EF535A97-76F5-4C72-B0A1-E94681D38C99'
			   ,4
			   ,0
			   ,@userKey
			   ,@now
			   ,@userKey
			   ,@now)
END
GO
----------------------------------------------------------------------------
-- SBT 53461 Update duplication search rule
----------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DuplicateEngineRuleSet')
BEGIN
	UPDATE [dbo].[DuplicateEngineRuleSet]
	   SET [DuplicateEngineRuleSetRule] = 
		  '<Root>
				<Rule>
					SELECT SUBSTRING([LastName],1,4) + SUBSTRING([FirstName],1,1) + SUBSTRING([ZIP],1,5),
						   SUBSTRING([LastName],1,4) + SUBSTRING([FirstName],1,1) + SUBSTRING([ZIP],1,5), 
						   cm.[SyncContactID] 
					FROM [dbo].[Individual] i
						 INNER JOIN [dbo].[ContactMain] cm ON cm.[ContactKey] = i.[ContactKey]
						 INNER JOIN [dbo].[Name_Address] a ON a.[ID] = cm.[SyncContactID]
					WHERE a.[PREFERRED_MAIL] = 1 
				</Rule>
			</Root>'
	WHERE DuplicateEngineRuleSetCode = 'ASI'
END
GO

------------------------------------------
--PBI 53513 Update EU Country Code 
------------------------------------------
UPDATE CountryRef SET EUCountryCode = N'' WHERE CountryCode IS NULL
UPDATE CountryRef SET EUCountryCode = N'AT' WHERE CountryCode = N'AT' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'BE' WHERE CountryCode = N'BE' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'BG' WHERE CountryCode = N'BG' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'CY' WHERE CountryCode = N'CY' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'CZ' WHERE CountryCode = N'CZ' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'DK' WHERE CountryCode = N'DK' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'EE' WHERE CountryCode = N'EE' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'FI' WHERE CountryCode = N'FI' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'FR' WHERE CountryCode = N'FR' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'DE' WHERE CountryCode = N'DE' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'GR' WHERE CountryCode = N'GR' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'HU' WHERE CountryCode = N'HU' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'IE' WHERE CountryCode = N'IE' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'IT' WHERE CountryCode = N'IT' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'LV' WHERE CountryCode = N'LV' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'LT' WHERE CountryCode = N'LT' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'LU' WHERE CountryCode = N'LU' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'MT' WHERE CountryCode = N'MT' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'NL' WHERE CountryCode = N'NL' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'PL' WHERE CountryCode = N'PL' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'PT' WHERE CountryCode = N'PT' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'RO' WHERE CountryCode = N'RO' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'SK' WHERE CountryCode = N'SK' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'SI' WHERE CountryCode = N'SI' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'ES' WHERE CountryCode = N'ES' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'SE' WHERE CountryCode = N'SE' AND EUCountryCode = N''
UPDATE CountryRef SET EUCountryCode = N'GB' WHERE CountryCode = N'GB' AND EUCountryCode = N''

-------------------------
-- PBI 54255:v10/v100 Licensing - Cleanup existing license table and code
-------------------------
-- Update Component Registry entries to reflect the new table and controller name
UPDATE [dbo].[ComponentRegistry] SET [Name] = 'LicenseRef' WHERE [Name] = 'License'

UPDATE [dbo].[ComponentRegistry] SET [TypeName] = 'Asi.LicenseManagement.LicenseRefController' WHERE [TypeName] = 'Asi.LicenseManagement.LicenseController'
GO

-------------------------------------------------------------------------------------------------
-- PBI 54255 - Add more licensing provisions to handle legacy licenses and temporary licenses
-------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [ComponentKey] = '0143F228-645E-47BE-9470-E756B6C4DAB7')
BEGIN
	INSERT INTO [dbo].[ComponentRegistry]
			   ([ComponentKey], [Name], [Description], [InterfaceName],
			   [TypeName], [AssemblyName], [ConfigureWebUserControl], [ConfigureWindowsControl],
			   [IsTyped], [IsBusinessItem], [DeploymentPackageCode])
		 VALUES
			   ('0143F228-645E-47BE-9470-E756B6C4DAB7', 'LicenseOrganizationVersion', 'LicenseOrganizationVersion Controller', 'BusinessController',
			   'Asi.LicenseManagement.LicenseOrganizationVersionController', 'Asi', '', '',
			   1, 1, 'Platform')
END
GO

-------------------------------------------------------------------------------------------------
-- PBI 54427 - Refactor publishing to use new Task Queue
-------------------------------------------------------------------------------------------------
-- Re-establish broker because we changed which table it is listening to (From PublishQueue to TaskQueue)
EXEC [dbo].[asi_EnsurePublishQueueAndServiceBroker]

-------------------------------------------------------------------------------------------------
-- PBI 54427 - Add new task to clean up Task Queue periodically
-------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE TaskDefinitionKey ='D0735509-BEA1-4DF2-8264-9CD6BEF31782')
BEGIN
	DECLARE @now datetime
	DECLARE @userKey uniqueidentifier
	SELECT @now = GETDATE();
	SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
	
	INSERT INTO [dbo].[TaskDefinition]
			   ([TaskDefinitionKey], [TaskDefinitionName], 
			   [TaskDefinitionDesc],
			   [TaskDefinitionPriority], [TaskDefinitionIsActive], [TaskDefinitionIsSystem],
			   [SerializedTaskDefinition],
			   [CreatedByUserKey], [CreatedOn], [UpdatedByUserKey], [UpdatedOn])
	 VALUES
		   ('D0735509-BEA1-4DF2-8264-9CD6BEF31782', 'Task Queue Cleanup',
			'Task that runs daily to delete processed queue items (for example publishing requests) older than one month. Failed queue items are deleted after 3 months.',
			0, 1, 1,
			'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionStoredProcedureData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>ec330651-ffd4-4c89-80ff-dda05a00fdd0</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>StoredProcedure</a:ActionTypeName><a:Description>asi_CleanTaskQueue</a:Description><a:StoredProcedureName>asi_CleanTaskQueue</a:StoredProcedureName></Action></Actions><DataSources i:nil="true"/><Description>Task that runs daily to delete processed queue items (for example publishing requests) older than one month. Failed queue items are deleted after 3 months.&#xD; </Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Task Queue Cleanup</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>52bc1c6d-a773-4d98-a4e3-d57237c55bbf</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>d0735509-bea1-4df2-8264-9cd6bef31782</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>d0735509-bea1-4df2-8264-9cd6bef31782</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">3f81c750-7c7f-43f0-874c-103b2f6ebcf1</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2015-05-18T04:30:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-05-18T04:30:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>CPEREZ</a:CreatedBy><a:CreatedOn>2015-05-18T12:01:47.61</a:CreatedOn><a:UpdatedBy>CPEREZ</a:UpdatedBy><a:UpdatedOn>2015-05-18T12:03:00.607</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
			@userKey, @now, @userKey, @now)
END
GO

----------------------------------------------------------------------------
-- PBI 55079 Add new out of the box task for deleting task log entries
----------------------------------------------------------------------------
DECLARE @userKey uniqueidentifier;
DECLARE @now datetime;
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'; 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Add TaskDefinition
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '3E24AC67-5195-45C9-B765-AC7CDA1182B1')
BEGIN
	INSERT INTO [dbo].[TaskDefinition] 
	([TaskDefinitionKey],
	[TaskDefinitionName],
	[TaskDefinitionDesc],
	[TaskDefinitionPriority],
	[TaskDefinitionIsActive],
	[TaskDefinitionIsSystem],
	[SerializedTaskDefinition],
	[CreatedByUserKey],
	[CreatedOn],
	[UpdatedByUserKey],
	[UpdatedOn]) 
	VALUES 
	('3E24AC67-5195-45C9-B765-AC7CDA1182B1',
	'Task Log Cleanup',
	'Task that runs daily to delete task logs older than a month. Failed task logs are deleted after 3 months. (This interval is configurable).',
	0,
	1,
	1,
	'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionStoredProcedureData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>879271ee-9358-4f76-a1ae-835188890669</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>StoredProcedure</a:ActionTypeName><a:Description>asi_CleanTaskLog</a:Description><a:StoredProcedureName>asi_CleanTaskLog</a:StoredProcedureName></Action></Actions><DataSources i:nil="true"/><Description>Task that runs daily to delete task logs older than a month. Failed task logs are deleted after 3 months. (This interval is configurable)</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Task Log Cleanup</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>22668a95-2018-4603-8252-1a4242db2a5f</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>3e24ac67-5195-45c9-b765-ac7cda1182b1</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>3e24ac67-5195-45c9-b765-ac7cda1182b1</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">c4f8f9a6-c068-4a90-a252-82ed5ae86bad</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2015-06-08T09:10:14.3216413-05:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-06-08T09:10:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-06-08T09:09:35.077</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-06-08T09:12:23.717</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
	@userKey,
	@now,
	@userKey,     
	@now)
END    
GO

----------------------------------------------------------------------------
-- PBI 55145 Remove the task queue clean up task & asi_CleanTaskQueue from both branches
----------------------------------------------------------------------------

IF EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'D0735509-BEA1-4DF2-8264-9CD6BEF31782')
BEGIN
	DELETE FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'D0735509-BEA1-4DF2-8264-9CD6BEF31782'
END
GO

-------------------------------------------------------------------------------------------
-- PBI 55209: (Process Automation) Paging problems in the Task iPart
-------------------------------------------------------------------------------------------
--Need to set this task to IsSystem
IF EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99')    
BEGIN
	UPDATE [dbo].[TaskDefinition] 
	  SET [TaskDefinitionIsSystem] = 1
	WHERE [TaskDefinitionKey] = 'EF535A97-76F5-4C72-B0A1-E94681D38C99'
END
GO

-------------------------------------------------------------------------------------------
--- PBI 55024 - Add specific group type in v10 GroupTypeRef table
-------------------------------------------------------------------------------------------
DECLARE @now datetime
DECLARE @userKey uniqueidentifier

SELECT @now = GETDATE()
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM'

IF @userKey IS NULL SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER'

IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRef] WHERE [GroupTypeKey] = 'E88E66B1-9516-47F9-88DC-E2EB8A3EF13E')
BEGIN
	INSERT INTO [dbo].[GroupTypeRef] ([GroupTypeKey], [GroupTypeName], [IsSystem], [IsDateLimited], [IsInvitationOnly], [DefaultGroupStatusCode], [InheritRolesFlag], [IsSingleRole],
		[GroupTypeDesc], [CreatedByUserKey], [UpdatedByUserKey], [CreatedOn], [UpdatedOn], [ExtendActiveMembershipTermFlag])
	VALUES ('E88E66B1-9516-47F9-88DC-E2EB8A3EF13E', 'Purchased Products', 1, 1, 0, 'A', 1, 1, 
		'Use this group type when creating groups that allow access to content related to a product when that product is purchased.',
		@userKey, @userKey, @now, @now, 1) 
END
GO

----------------------------------------------
-- SBT 55344 Insert system Group Role 'Member'
----------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupRoleRef] WHERE [GroupRoleKey] = '29AAE912-660E-4C53-B884-AD9EE27DEE0C')
BEGIN
	INSERT INTO [dbo].[GroupRoleRef] ([GroupRoleKey], [GroupRoleDesc], [IsActive], [IsSystem], [GroupRoleName]) 
	VALUES ('29AAE912-660E-4C53-B884-AD9EE27DEE0C', 'Member', 1, 1, 'Member')
END
GO

-----------------------------------------------------------------------------------------------------------
-- SBT 55344 Insert GroupTypeRole record associating 'Purchased Products' group type to 'Member' group role
-----------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[GroupTypeRole] WHERE [GroupTypeRoleKey] = '442EE7C3-CE42-4DF6-A0C9-48CA745BD911')
BEGIN
	INSERT INTO [dbo].[GroupTypeRole] ([GroupTypeKey], [GroupRoleKey], [IsRequired], [IsUnique], [SortRank], [IsDefault], [DefaultMemberStatusCode], [IsSystem], [GroupTypeRoleKey]) 
	VALUES ('E88E66B1-9516-47F9-88DC-E2EB8A3EF13E','29AAE912-660E-4C53-B884-AD9EE27DEE0C', 0, 0, null, 1, 'A', 1, '442EE7C3-CE42-4DF6-A0C9-48CA745BD911')
END
GO

---------------------------------
-- PBI:52106 Create new merge reference in PartyMergeSchemaReference
---------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PartyMergeSchemaReference] WHERE [TableName] = 'Name' AND ColumnName = 'ID' AND ProcessingOrder = 22 )
BEGIN
	INSERT INTO [dbo].[PartyMergeSchemaReference] ([TableName], [ColumnName], [ProcessingOrder], [ProcessingType], [DataColumnName]) 
	VALUES ('Name', 'ID', 22, 'DATAUPDATE', 'MOBILE_PHONE')
END
GO

---------------------------------
-- PBI:52106 Renumber ProcessingOrder in PartyMergeSchemaReference
---------------------------------
WITH oldNumbers AS (
SELECT TableName AS OldTableName, ColumnName AS OldColumnName, ProcessingOrder AS OldProcessingOrder,
		ROW_NUMBER() OVER (ORDER BY ProcessingOrder) AS NewNumber
   FROM dbo.PartyMergeSchemaReference
)
UPDATE pmsr
   SET ProcessingOrder = o.NewNumber
  FROM dbo.PartyMergeSchemaReference pmsr
	   INNER JOIN oldNumbers o ON pmsr.ProcessingOrder = o.OldProcessingOrder 
							  AND pmsr.TableName = o.OldTableName 
							  AND pmsr.ColumnName = o.OldColumnName
GO

---------------------------------
-- PBI 38515 - Update Organization Account Pages
---------------------------------
-- Update the Organization_Profile_Page panel definition
IF EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [PanelDefinitionId] = 'A27EA058-2C88-4227-99C4-9723B93B2D86') 
	UPDATE [dbo].[PanelDefinition] 
	   SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Organization_Profile_Page</Name><PanelDefinitionId>a27ea058-2c88-4227-99c4-9723b93b2d86</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Organization_Profile_Page</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>About</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>About</PropertyName></PanelFieldData><PanelFieldData><Caption>Locations</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Locations</PropertyName></PanelFieldData><PanelFieldData><Caption>Founded</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Date_Founded</PropertyName></PanelFieldData><PanelFieldData><Caption>Website</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Web_Site</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Profile_Page</a:string><a:string>Organization_Demo</a:string></SelectedEntityNames></PanelDefinitionData>'
	 WHERE [PanelDefinitionId] = 'A27EA058-2C88-4227-99C4-9723B93B2D86'
GO

-- Update the Organization Demographics panel definition
UPDATE [dbo].[PanelDefinition]
	SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Organization Demographics</Name><PanelDefinitionId>1591133f-3b63-4747-b3a7-84ff6aa6265c</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Organization Demographics</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>ID</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Staff Size</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Staff_Size</PropertyName></PanelFieldData><PanelFieldData><Caption>Annual Revenue in Millions</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Annual_Revenue</PropertyName></PanelFieldData><PanelFieldData><Caption>Industry</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Industry</PropertyName></PanelFieldData><PanelFieldData><Caption>Region</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Region</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a sponsor</Caption><DisplayControlType>0</DisplayControlType><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IsSponsor</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string><a:string>Name_Demo</a:string><a:string>Profile_Page</a:string></SelectedEntityNames></PanelDefinitionData>'
	WHERE [PanelDefinitionId] = '1591133F-3B63-4747-B3A7-84FF6AA6265C'
GO

-- All Websites OrganizationAccount – use the Company Admin account page
	UPDATE [dbo].[URLMapping] 
	   SET URL = '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', TargetDocumentVersionKey = '9829E708-688C-4C69-87DE-FEAC9E549A2B'
	 WHERE URLMappingKey  = '5576D388-7AD5-4CB1-BA29-055DF4FE3A1B'
	   AND TargetDocumentVersionKey = 'D67D49AA-3691-4B32-856B-BEFD670C6001'
GO

--------------------------------------------------------------
-- SBT 55669 - Allow company administrators to join a company
--------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();

--Add Alert for Company Join
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '62B8F1C9-AAB9-4841-917D-32F8FF532944')
BEGIN
	INSERT INTO [dbo].[NotificationSet]
			   ([NotificationSetKey],
				[NotificationSetName],
				[NotificationSetDesc],
				[NotificationSetLimitUserView],
				[NotificationSetIsSystem],
				[NotificationSetIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('62B8F1C9-AAB9-4841-917D-32F8FF532944',
				'Join Alert',
				'Alert used to display on Company Administrator organization profile page',
				1,
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add Task for Company Join Alert
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '168A405D-9A9E-4B70-AFFE-FA3D7E409B80')
BEGIN
	INSERT INTO [dbo].[TaskDefinition] 
	([TaskDefinitionKey],
	 [TaskDefinitionName],
	 [TaskDefinitionDesc],
	 [TaskDefinitionPriority],
	 [TaskDefinitionIsActive],
	 [TaskDefinitionIsSystem],
	 [SerializedTaskDefinition],
	 [CreatedByUserKey],
	 [CreatedOn],
	 [UpdatedByUserKey],
	 [UpdatedOn]) 
	VALUES 
	('168A405D-9A9E-4B70-AFFE-FA3D7E409B80', 
	 'Company Join Alert',     
	 'Creates an alert if the selected organization is not a member, prompting them to join.',         
	 0,   
	 1,   
	 1,   
	 '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</DataSourceId><DataSourceName>NonMemberCompanies</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/NonMemberCompanies</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected organization is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Company Join Alert</Name><Notifications><NotificationDefinition><DataSources><string>77f57509-aa1a-41d0-967b-69b3ea410df3</string></DataSources><DefaultTemplate>&lt;p style="text-align: center;"&gt;&lt;a href="[~]/OrganizationJoinNow?ID={#NonMemberCompanies.ID}" class="PrimaryButton LargeButton TextButton"&gt;Join Now&lt;/a&gt;&lt;/p&gt;</DefaultTemplate><NotificationDefinitionId>17789d31-4275-421f-bf25-e56ab2fbacbd</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>0903f8c5-9bc7-4669-9490-7014ad64642e</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-07-07T10:31:29.737</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-07-07T10:33:56.267</a:UpdatedOn></UpdateInformation></TaskDefinitionData>',
	 @userKey,    
	 @now,        
	 @userKey,    
	 @now)
END 

IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = 'EFDC5D30-DE39-4395-910D-70A649025C91')
BEGIN
	INSERT INTO [dbo].[NotificationSetDetail]
			   ([NotificationSetDetailKey],
				[NotificationSetKey],
				[TaskDefinitionKey],
				[NotificationSetDetailPriority],
				[NotificationSetDetailIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('EFDC5D30-DE39-4395-910D-70A649025C91',
				'62B8F1C9-AAB9-4841-917D-32F8FF532944',
				'168A405D-9A9E-4B70-AFFE-FA3D7E409B80',
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END
GO

----------------------------------------------------------------------------------------------
-- SBT 55821 - Cleanup Panel definition fields
----------------------------------------------------------------------------------------------

UPDATE [dbo].[PanelDefinition] SET [SerializedPanelDefinition] = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Name>Demographics</Name><PanelDefinitionId>aa2c9cf3-1500-4d8a-9416-10416f7edb75</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Demographics</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Spouse</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Spouse</PropertyName></PanelFieldData><PanelFieldData><Caption>Sponsor</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Sponsor</PropertyName></PanelFieldData><PanelFieldData><Caption>Date Certified</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Date_Certified</PropertyName></PanelFieldData><PanelFieldData><Caption>Annual Revenue</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Annual_Revenue</PropertyName></PanelFieldData><PanelFieldData><Caption>System Type</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>System_Type</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>School Attended</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>School_Attended</PropertyName></PanelFieldData><PanelFieldData><Caption>Mobile Phone</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Mobile_Phone</PropertyName></PanelFieldData><PanelFieldData><Caption>Staff Size</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Staff_Size</PropertyName></PanelFieldData><PanelFieldData><Caption>Activity Fee</Caption><EntityName>Name_Demo</EntityName><HideInNormalView i:nil="true"/><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>1</NumberOfLinesToDisplay><PropertyName>Activity_Fee</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Name_Demo</a:string></SelectedEntityNames></PanelDefinitionData>'
WHERE [PanelDefinitionId] = 'AA2C9CF3-1500-4D8A-9416-10416F7EDB75'

UPDATE [dbo].[PanelDefinition] SET SerializedPanelDefinition = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description>Individual</Description><Name>Individual</Name><PanelDefinitionId>f4902313-a031-4704-8082-ba5e136048de</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Individual</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Spouse</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Spouse</PropertyName></PanelFieldData><PanelFieldData><Caption>Sponsor</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Sponsor</PropertyName></PanelFieldData><PanelFieldData><Caption>Date Certified</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Date_Certified</PropertyName></PanelFieldData><PanelFieldData><Caption>Annual Revenue</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Annual_Revenue</PropertyName></PanelFieldData><PanelFieldData><Caption>System Type</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>System_Type</PropertyName></PanelFieldData></Fields></PanelColumnData><PanelColumnData><Fields><PanelFieldData><Caption>School Attended</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>School_Attended</PropertyName></PanelFieldData><PanelFieldData><Caption>Mobile Phone</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Mobile_Phone</PropertyName></PanelFieldData><PanelFieldData><Caption>Staff Size</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Staff_Size</PropertyName></PanelFieldData><PanelFieldData><Caption>Activity Fee</Caption><EntityName>Name_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Activity_Fee</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>Name_Demo</a:string></SelectedEntityNames></PanelDefinitionData>'
WHERE [PanelDefinitionId] = 'F4902313-A031-4704-8082-BA5E136048DE'

UPDATE [dbo].[PanelDefinition] SET SerializedPanelDefinition = '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Organization Demographics</Name><PanelDefinitionId>1591133f-3b63-4747-b3a7-84ff6aa6265c</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Organization Demographics</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>ID</Caption><EntityName>CsContact</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>ID</PropertyName></PanelFieldData><PanelFieldData><Caption>Staff Size</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Staff_Size</PropertyName></PanelFieldData><PanelFieldData><Caption>Annual Revenue in Millions</Caption><EntityName>Organization_Demo</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Annual_Revenue</PropertyName></PanelFieldData><PanelFieldData><Caption>Industry</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Industry</PropertyName></PanelFieldData><PanelFieldData><Caption>Region</Caption><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Region</PropertyName></PanelFieldData><PanelFieldData><Caption>Is a sponsor</Caption><DisplayControlType>0</DisplayControlType><EntityName>Profile_Page</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>IsSponsor</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CsContact</a:string><a:string>Organization_Demo</a:string><a:string>Profile_Page</a:string></SelectedEntityNames></PanelDefinitionData>'
WHERE [PanelDefinitionId] = '1591133F-3B63-4747-B3A7-84FF6AA6265C'

GO

----------------------------------------------------------------------------------------------------
-- SBT 55928 - Add new content record for product without cart button and change the shortcut url
----------------------------------------------------------------------------------------------------
UPDATE [dbo].[URLMapping] 
   SET [TargetDocumentVersionKey] = '339E3091-E79C-4C82-BDDE-76203BAE43DB',
	   [URL] = '@/iCore/Membership/General_product_display_without_cart_button'
   WHERE [URLMappingKey] = '40868184-5D76-41B9-8B88-4CAD05C4A9C7' 
		AND [TargetDocumentVersionKey] = 'CB6C4B08-DD2A-49EF-83FC-B537DB3535FB'

UPDATE [dbo].[URLMapping] 
   SET [TargetDocumentVersionKey] = '339E3091-E79C-4C82-BDDE-76203BAE43DB',
	   [URL] = '@/iCore/Membership/General_product_display_without_cart_button'
   WHERE [URLMappingKey] = '477D3267-6B8B-4EDD-B554-540B477048B1' 
		AND [TargetDocumentVersionKey] = 'CB6C4B08-DD2A-49EF-83FC-B537DB3535FB'  
		
UPDATE [dbo].[URLMapping] 
   SET [TargetDocumentVersionKey] = '339E3091-E79C-4C82-BDDE-76203BAE43DB',
	   [URL] = '@/iCore/Membership/General_product_display_without_cart_button'
   WHERE [URLMappingKey] = '9AE877FA-2505-4F7A-BA62-F108B7DB4A8B' 
		AND [TargetDocumentVersionKey] = 'CB6C4B08-DD2A-49EF-83FC-B537DB3535FB'
GO

----------------------------------------------------------------------------------------------------
-- PBI 48861 - Add new alerts to the organization account pages
----------------------------------------------------------------------------------------------------
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();

--Add Alert Set for Organization administrators
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '0CF4D85A-9925-4C3B-B86A-2936640E1031')
BEGIN
	INSERT INTO [dbo].[NotificationSet]
			   ([NotificationSetKey],
				[NotificationSetName],
				[NotificationSetDesc],
				[NotificationSetLimitUserView],
				[NotificationSetIsSystem],
				[NotificationSetIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('0CF4D85A-9925-4C3B-B86A-2936640E1031',
				'Organization administrator alerts',
				'Alerts that display to organization administrators on the organization account page',
				1,
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add task 1 to Alert Set for Organization administrators
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '5456D17A-D6D0-406E-9BE5-569825E6AA50')
BEGIN
	INSERT INTO [dbo].[NotificationSetDetail]
			   ([NotificationSetDetailKey],
				[NotificationSetKey],
				[TaskDefinitionKey],
				[NotificationSetDetailPriority],
				[NotificationSetDetailIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('5456D17A-D6D0-406E-9BE5-569825E6AA50',
				'0CF4D85A-9925-4C3B-B86A-2936640E1031',
				'E6BB9114-8528-48A2-94FD-579BEF13FA0B',
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add task 2 to Alert Set for Organization administrators
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = 'ED93B07F-5B8B-47E2-9532-92B4AB351CCC')
BEGIN
	INSERT INTO [dbo].[NotificationSetDetail]
			   ([NotificationSetDetailKey],
				[NotificationSetKey],
				[TaskDefinitionKey],
				[NotificationSetDetailPriority],
				[NotificationSetDetailIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('ED93B07F-5B8B-47E2-9532-92B4AB351CCC',
				'0CF4D85A-9925-4C3B-B86A-2936640E1031',
				'81A688AA-25FB-47EE-92A7-03D006CB1C44',
				1,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add Alert Set for Staff Organization account page
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSet] WHERE [NotificationSetKey] = '4EFA2DEB-C864-491D-8792-EA92B538A585')
BEGIN
	INSERT INTO [dbo].[NotificationSet]
			   ([NotificationSetKey],
				[NotificationSetName],
				[NotificationSetDesc],
				[NotificationSetLimitUserView],
				[NotificationSetIsSystem],
				[NotificationSetIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('4EFA2DEB-C864-491D-8792-EA92B538A585',
				'Staff organization account page alerts',
				'Alerts that appear on the organization account page which staff users see',
				1,
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add task 1 to Alert Set for Staff Organization account page
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '7F96087D-67EE-4BE7-AB9C-2A12D325D796')
BEGIN
	INSERT INTO [dbo].[NotificationSetDetail]
			   ([NotificationSetDetailKey],
				[NotificationSetKey],
				[TaskDefinitionKey],
				[NotificationSetDetailPriority],
				[NotificationSetDetailIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('7F96087D-67EE-4BE7-AB9C-2A12D325D796',
				'4EFA2DEB-C864-491D-8792-EA92B538A585',
				'E6BB9114-8528-48A2-94FD-579BEF13FA0B',
				0,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

--Add task 2 to Alert Set for Staff Organization account page
IF NOT EXISTS (SELECT 1 FROM [dbo].[NotificationSetDetail] WHERE [NotificationSetDetailKey] = '7DDAE1F5-439D-4A2F-90EF-E24A84DE928A')
BEGIN
	INSERT INTO [dbo].[NotificationSetDetail]
			   ([NotificationSetDetailKey],
				[NotificationSetKey],
				[TaskDefinitionKey],
				[NotificationSetDetailPriority],
				[NotificationSetDetailIsDefault],
				[CreatedByUserKey],
				[CreatedOn],
				[UpdatedByUserKey],
				[UpdatedOn])
		 VALUES
			   ('7DDAE1F5-439D-4A2F-90EF-E24A84DE928A',
				'4EFA2DEB-C864-491D-8792-EA92B538A585',
				'81A688AA-25FB-47EE-92A7-03D006CB1C44',
				1,
				0,
				@userKey,
				@now,
				@userKey,
				@now)
END

GO

----------------------------------------------------------------------------------------------------
-- PBI 56137 - Add task for synchronizing license information
----------------------------------------------------------------------------------------------------
-- New IsSystem (hidden) scheduled tasks
DECLARE @userKey uniqueidentifier
DECLARE @now datetime
-- Use for CreatedByUserKey/UpdatedByUserKey
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
-- Use for CreatedOn/UpdatedOn
SET @now = GETDATE();
-- Add TaskDefinition
IF NOT EXISTS (SELECT 1 FROM [dbo].[TaskDefinition] WHERE [TaskDefinitionKey] = '3B54C492-8F6F-4591-8698-35747D539669')
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
	('3B54C492-8F6F-4591-8698-35747D539669'     
	,'Synchronize license information'    
	,'Report basic customer information back to iMIS.'      
	,0      
	,1      
	,1      
	,'<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionSyncLicenseInformationData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>5fa96c9d-a019-451d-b891-7c726420ffa4</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>SyncLicenseInformation</a:ActionTypeName><a:Description>Synchronize iMIS license information.</a:Description></Action></Actions><DataSources i:nil="true"/><Description>Report basic customer information back to iMIS.</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Synchronize license information</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>70011278-6dd7-4712-93bb-03916a3b38b9</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>3b54c492-8f6f-4591-8698-35747d539669</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>3b54c492-8f6f-4591-8698-35747d539669</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers/><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>CPEREZ</a:CreatedBy><a:CreatedOn>2015-07-30T09:38:36.283</a:CreatedOn><a:UpdatedBy>CPEREZ</a:UpdatedBy><a:UpdatedOn>2015-07-30T09:38:59.657</a:UpdatedOn></UpdateInformation></TaskDefinitionData>'
	,@userKey     
	,@now   
	,@userKey     
	,@now)
END
GO

------------------------------------------------------------------
--Add Default template for Event Template
------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Template] WHERE [Templatekey] = '0B81229A-41C3-4E00-B100-F482648C84F2')
BEGIN
	INSERT INTO [dbo].[Template] 
	([TemplateKey]
	,[TemplateTypeCode]
	,[TemplateName]
	,[IsSystem]
	,[TemplateData] ) 
	VALUES 
	('0B81229A-41C3-4E00-B100-F482648C84F2'
	,0
	,'Default'         
	,1   
	,'<EventData xmlns="http://schemas.imis.com/2008/01/EventsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><AdditionalAttributes xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:GenericProperty><a:Name>TAX_BY_ADDRESS</a:Name><a:Value i:type="b:boolean" xmlns:b="http://www.w3.org/2001/XMLSchema">false</a:Value></a:GenericProperty><a:GenericProperty><a:Name>VAT_RULE</a:Name><a:Value i:type="b:string" xmlns:b="http://www.w3.org/2001/XMLSchema"/></a:GenericProperty><a:GenericProperty><a:Name>TAX_AUTHORITY</a:Name><a:Value i:type="b:string" xmlns:b="http://www.w3.org/2001/XMLSchema"/></a:GenericProperty><a:GenericProperty><a:Name>fullAddressAttribute</a:Name><a:Value i:type="b:FullAddressData" xmlns:b="http://schemas.imis.com/2008/01/MembershipDataContracts"><b:Address><b:AddressLines><b:AddressLine/><b:AddressLine/><b:AddressLine/></b:AddressLines><b:CityName/><b:CountryCode>United States</b:CountryCode><b:CountrySubEntityCode/><b:PostalCode/></b:Address></a:Value></a:GenericProperty></AdditionalAttributes><Description/><DisplayLayouts xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:DisplayLayoutData><a:LayoutDirectory>~/EventDetail</a:LayoutDirectory><a:LayoutDocument/></a:DisplayLayoutData><a:DisplayLayoutData><a:LayoutDirectory>~/EventDashboard</a:LayoutDirectory><a:LayoutDocument/><a:LayoutType>EventOwner</a:LayoutType></a:DisplayLayoutData></DisplayLayouts><EventCode/><Name>Default</Name><RegistrationType>RegistrationNotRequired</RegistrationType><AdditionalDescription/><Capacity>0</Capacity><FinancialEntityId/><ImageDescription/><ImageUrl/><NotificationPartyId/><PublishingInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:ExpirationDate i:nil="true"/><a:Keywords i:nil="true" xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"/><a:PublishingState>Active</a:PublishingState><a:StartDate i:nil="true"/></PublishingInformation><RegistrationClosedMessage>Registration is closed.</RegistrationClosedMessage></EventData>')
END 
GO

----------------------------------------------------------------------------
-- PBI 52372 - Bug: StaffCommunityLanding shortcut points to Membership Dashboard on upgrade
----------------------------------------------------------------------------
UPDATE [dbo].[URLMapping]
   SET [TargetDocumentVersionKey] = 'B8BD531C-D507-49FC-9478-4BDEADA5A869',
	   [URL] = '@/iCore/Staff_Dashboards/Community/Community_dashboard'
 WHERE [URLMappingKey] = '04FF3146-7B15-4159-9317-187F1EB4AA2F'
	   AND [TargetDocumentVersionKey] = '61A1BAC3-EA70-444F-8B0F-CF94DC0ACA01'
GO

----------------------------------------------------------------------------
-- PBI 57484 - Migrating Panel Editor Content for Moves Management
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Cultivation Plan') 
	INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
	VALUES('6FD685B1-A91E-42C5-8AFB-3A99440BD104', 'Cultivation Plan', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Cultivation Plan</Name><PanelDefinitionId>6fd685b1-a91e-42c5-8afb-3a99440bd104</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Cultivation Plan</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Type of Move</Caption><EntityName>CultivationActivity</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>TypeOfActivity</PropertyName></PanelFieldData><PanelFieldData><Caption>Date</Caption><EntityName>CultivationActivity</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Date</PropertyName></PanelFieldData><PanelFieldData><Caption>Note</Caption><EntityName>CultivationActivity</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Note</PropertyName></PanelFieldData><PanelFieldData><Caption>Follow Up Date</Caption><EntityName>CultivationActivity</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FollowUpDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Follow Up Note</Caption><EntityName>CultivationActivity</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>FollowUpNote</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>true</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CultivationActivity</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[PanelDefinition] WHERE [Name] = 'Cultivating Donor For') 
	INSERT INTO [dbo].[PanelDefinition] ([PanelDefinitionId], [Name], [Description], [RelatedEntityName], [SerializedPanelDefinition]) 
	VALUES('836DACBE-C40B-4CDE-840C-3C7254AF0F4F', 'Cultivating Donor For', '', 'Party', '<PanelDefinitionData xmlns="http://schemas.imis.com/2008/01/SharedDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Description/><Name>Cultivating Donor For</Name><PanelDefinitionId>836dacbe-c40b-4cde-840c-3c7254af0f4f</PanelDefinitionId><RelatedEntityName>Party</RelatedEntityName><Caption>Cultivating Donor For</Caption><Groups><PanelGroupData><Columns><PanelColumnData><Fields><PanelFieldData><Caption>Gift Type</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>GiftType</PropertyName></PanelFieldData><PanelFieldData><Caption>Estimated Value</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>EstimatedValue</PropertyName></PanelFieldData><PanelFieldData><Caption>Planned Ask Time</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>PlannedAskDate</PropertyName></PanelFieldData><PanelFieldData><Caption>Cultivation Stage</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>CultivationStage</PropertyName></PanelFieldData><PanelFieldData><Caption>Quality</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Quality</PropertyName></PanelFieldData><PanelFieldData><Caption>Note</Caption><EntityName>CultivatingFor</EntityName><HideInNormalView>false</HideInNormalView><IsReadOnly>false</IsReadOnly><IsRequired>false</IsRequired><NumberOfLinesToDisplay>0</NumberOfLinesToDisplay><PropertyName>Note</PropertyName></PanelFieldData></Fields></PanelColumnData></Columns></PanelGroupData></Groups><IsMultipleInstance>false</IsMultipleInstance><SelectedEntityNames xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>CultivatingFor</a:string></SelectedEntityNames></PanelDefinitionData>' ); 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'CultivatingFor') 
INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
VALUES ('CultivatingFor', 'Party', 1, 0) 

GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[ObjectMetaData] WHERE [ObjectName] = 'CultivationActivity') 
INSERT INTO [dbo].[ObjectMetaData] ([ObjectName], [RelatedToEntity], [IsUserDefined], [IsMultiInstance]) 
VALUES ('CultivationActivity', 'Party', 1, 1) 
GO

-- End of script
SET NOCOUNT OFF
GO


