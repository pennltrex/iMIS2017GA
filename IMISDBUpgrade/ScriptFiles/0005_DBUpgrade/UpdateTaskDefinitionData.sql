SET NOCOUNT OFF;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSet' AND [CONSTRAINT_NAME] = 'FK_NotificationSet_CreatedByUser')
    ALTER TABLE [dbo].[NotificationSet] DROP CONSTRAINT [FK_NotificationSet_CreatedByUser]
go

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSet' AND [CONSTRAINT_NAME] = 'FK_NotificationSet_UpdatedByUser')
    ALTER TABLE [dbo].[NotificationSet] DROP CONSTRAINT [FK_NotificationSet_UpdatedByUser]
go


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_CreatedByUser')
    ALTER TABLE [dbo].[NotificationSetDetail] DROP CONSTRAINT [FK_NotificationSetDetail_CreatedByUser]
go

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_NotificationSet')
    ALTER TABLE [dbo].[NotificationSetDetail] DROP CONSTRAINT [FK_NotificationSetDetail_NotificationSet]
go

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_TaskDefinition')
    ALTER TABLE [dbo].[NotificationSetDetail] DROP CONSTRAINT [FK_NotificationSetDetail_TaskDefinition]
go

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_UpdatedByUser')
    ALTER TABLE [dbo].[NotificationSetDetail] DROP CONSTRAINT [FK_NotificationSetDetail_UpdatedByUser]
go


SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '81a688aa-25fb-47ee-92a7-03d006cb1c44')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('81a688aa-25fb-47ee-92a7-03d006cb1c44', 'Expired membership alert', 'Creates an alert if the selected contact''s membership is expired', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>8ba0c9fd-efbb-453e-85c9-4e928d212f79</DataSourceId><DataSourceName>ExpiredMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Expired members</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact''s membership is expired</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>8ba0c9fd-efbb-453e-85c9-4e928d212f79</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Expired membership alert</Name><Notifications><NotificationDefinition><DataSources><string>8ba0c9fd-efbb-453e-85c9-4e928d212f79</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Membership expired on&amp;nbsp;&lt;strong&gt;{#ExpiredMembers.PaidThrough format=m}&lt;/strong&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>2764a409-e0fb-4521-8319-429e3d6aa772</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>81a688aa-25fb-47ee-92a7-03d006cb1c44</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>81a688aa-25fb-47ee-92a7-03d006cb1c44</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>27e096d2-6133-4c4b-a9b6-3fbb645bb359</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:48:28.477</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T12:58:02.62</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:48:28', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 12:58:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0', 'Event reminder alert', 'Creates an alert if the selected contact is registered for an event occurring within 21 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>d562d541-4108-451f-9981-339457671723</DataSourceId><DataSourceName>UpcomingRegistrations</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Upcoming event registrations</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact is registered for an event occurring within 21 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>d562d541-4108-451f-9981-339457671723</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Event reminder alert</Name><Notifications><NotificationDefinition><DataSources><string>d562d541-4108-451f-9981-339457671723</string></DataSources><DefaultTemplate>{foreach event in UpcomingRegistrations}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/alarm-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Registered for&amp;nbsp;&lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.Event_Title}&lt;/a&gt;, starting {#event.BeginDate format=m}​&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>33acc141-c614-4ef8-81e6-a9014202b7e6</NotificationDefinitionId><PersonalizedTemplate>{foreach event in UpcomingRegistrations}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/alarm-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.Event_Title}&lt;/a&gt; is coming up on&amp;nbsp;&lt;strong&gt;{#event.BeginDate format="m"}&#xD;
&lt;/strong&gt;​&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</PersonalizedTemplate><TaskDefinitionId>5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>d126d2e0-9ecb-42ba-bfb1-4d98b121eb5d</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:45:26.463</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T12:58:27.603</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:45:26', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 12:58:36')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '51a9559c-a438-4598-b722-100b7c5f0d7e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('51a9559c-a438-4598-b722-100b7c5f0d7e', 'Staff recent orders alert', 'Creates an alert listing orders placed today.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>ab8d87b3-732b-4fdb-be9c-1fc88f4d3455</DataSourceId><DataSourceName>RecentOrders</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>fda61f23-ba7e-4151-a546-4a4a137e2b97</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing orders placed today.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>ab8d87b3-732b-4fdb-be9c-1fc88f4d3455</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent orders alert</Name><Notifications><NotificationDefinition><DataSources><string>ab8d87b3-732b-4fdb-be9c-1fc88f4d3455</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/cart-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Recent orders&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach order in RecentOrders limit 10}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#order.code_PartyId}"&gt;{#order.Sold_To}&lt;/a&gt; placed an order for &lt;strong&gt;{#order.Total}&lt;/strong&gt;&lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Commerce/Recent_orders.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>817e809f-1dff-4c1a-a439-4bc81ab6d679</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>51a9559c-a438-4598-b722-100b7c5f0d7e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>51a9559c-a438-4598-b722-100b7c5f0d7e</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>8e6f7bb8-8795-45d2-8562-3eb6a46504ea</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:45:50.25</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:46:06.813</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:45:50', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:46:27')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'a3c01355-8115-4c96-9a6a-10d2e0f23b6e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('a3c01355-8115-4c96-9a6a-10d2e0f23b6e', 'Refresh Dynamic Groups - Monthly', 'Refresh all groups based on IQA queries that are scheduled to update monthly', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>8ab67318-b10f-4427-8154-c3e137ecccdc</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Monthly</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update monthly</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Monthly</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>1850234a-925f-4bc6-bdb1-115b74d3a041</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>a3c01355-8115-4c96-9a6a-10d2e0f23b6e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>a3c01355-8115-4c96-9a6a-10d2e0f23b6e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">e8610b67-aa47-4535-9990-3bd219d5ff3d</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfMonth xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><a:string>1</a:string></DaysOfMonth><Months>1</Months><ScheduleFrequency>Monthly</ScheduleFrequency><Time>0001-01-01T02:00:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-03-01T05:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:23.01</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '977af0e0-542c-4978-876c-20ff9395de91')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('977af0e0-542c-4978-876c-20ff9395de91', 'Staff recent renewals list alert', 'Creates an alert listing the members who have renewed in the past 7 days. ', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>65b000ab-7189-49d3-a57f-47c90926471b</DataSourceId><DataSourceName>Renewals</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>5007a86c-688d-47b4-a029-c59281356d84</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing the members who have renewed in the past 7 days. </Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>65b000ab-7189-49d3-a57f-47c90926471b</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent renewals list alert</Name><Notifications><NotificationDefinition><DataSources><string>65b000ab-7189-49d3-a57f-47c90926471b</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Recent renewals&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach member in Renewals limit 10}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#member.code_PartyID}"&gt;{#member.Name}&lt;/a&gt; renewed on {#member.Renewed_Date format=m} &lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Membership/Recent_renewals.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>0711c167-1a20-475a-a72b-e6ef94c62c01</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>977af0e0-542c-4978-876c-20ff9395de91</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>977af0e0-542c-4978-876c-20ff9395de91</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>39c8e111-dab2-4252-b52c-eeda207a44bd</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:27:31.39</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-14T10:01:00.393</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:27:31', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150814 10:01:03')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '7b49886f-814c-45e8-ab19-233dd02dfa69')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('7b49886f-814c-45e8-ab19-233dd02dfa69', 'Staff online registration closes soon alert', 'Creates an alert when the online registration for an event closes within 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>7c2bd392-98c3-42d6-9df4-c47daa109ae2</DataSourceId><DataSourceName>RegClosesSoon</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>45249b04-4302-4043-b377-60e201af4e80</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert when the online registration for an event closes within 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>7c2bd392-98c3-42d6-9df4-c47daa109ae2</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff online registration closes soon alert</Name><Notifications><NotificationDefinition><DataSources><string>7c2bd392-98c3-42d6-9df4-c47daa109ae2</string></DataSources><DefaultTemplate>{foreach reg in RegClosesSoon}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;Online registration for &lt;a href="[~]/Event.aspx?EventKey={#reg.EventCode}"&gt;{#reg.EventName}&lt;/a&gt; ends &lt;strong&gt;{#reg.Closes}&lt;/strong&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>64378642-a115-4c6a-9326-6727a5b72d16</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>7b49886f-814c-45e8-ab19-233dd02dfa69</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>7b49886f-814c-45e8-ab19-233dd02dfa69</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>f224e7fb-c798-431c-82d4-06fbdff9805f</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:35:43.163</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:35:57.103</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:35:43', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:36:18')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'e7561f7e-3635-414b-8bdd-386ea876b4c3')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('e7561f7e-3635-414b-8bdd-386ea876b4c3', 'Staff major donor gifts alert', 'Creates an alert displaying recent gifts from the current user''s major donor.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>2060f009-e412-46f1-ad06-e0c23708c2fc</DataSourceId><DataSourceName>MajorDonorGifts</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>138972c6-e8c8-4db6-bac1-fbe8fdd64a90</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert displaying recent gifts from the current user''s major donor.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>2060f009-e412-46f1-ad06-e0c23708c2fc</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff major donor gifts alert</Name><Notifications><NotificationDefinition><DataSources><string>2060f009-e412-46f1-ad06-e0c23708c2fc</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/star-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;My Major Donor gifts&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach gift in MajorDonorGifts}&#xD;
    &lt;li&gt;&#xD;
    &lt;a href="[~]/Party.aspx?ID={#gift.ID}"&gt;{#gift.FullName}&lt;/a&gt;: &lt;strong&gt;{#gift.Amount}&lt;/strong&gt; on {#gift.DateReceived}&#xD;
    &lt;/li&gt;&#xD;
    {/foreach}&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>17f29199-181a-4a5b-b6e5-9a17ae48fc59</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>e7561f7e-3635-414b-8bdd-386ea876b4c3</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>e7561f7e-3635-414b-8bdd-386ea876b4c3</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>b22c5f62-c949-4017-8dba-ea8f61c6befb</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:31:02.027</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:31:38.84</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:31:02', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150814 11:17:56')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '4a039901-d1e1-47e7-8fa8-432ea99ae46f')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('4a039901-d1e1-47e7-8fa8-432ea99ae46f', 'Staff upcoming event alert', 'Creates an alert for each event that begins within the next 15 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4894ff83-5f9d-4ab1-a4e9-0898f6e4089f</DataSourceId><DataSourceName>UpcomingEvents</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>3f4cce3e-a672-474d-bb63-6d9de217336a</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert for each event that begins within the next 15 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>4894ff83-5f9d-4ab1-a4e9-0898f6e4089f</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff upcoming event alert</Name><Notifications><NotificationDefinition><DataSources><string>4894ff83-5f9d-4ab1-a4e9-0898f6e4089f</string></DataSources><DefaultTemplate>{foreach event in UpcomingEvents}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/calendar-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.EventName}&lt;/a&gt; begins on &lt;strong&gt;{#event.BeginDate format="m"}&lt;/strong&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>af093fce-e5e9-4b0a-93dd-c45d13fbe9fa</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>4a039901-d1e1-47e7-8fa8-432ea99ae46f</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>4a039901-d1e1-47e7-8fa8-432ea99ae46f</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>f2b922ec-ba86-4fe5-8bd0-37d148096f65</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:33:40.47</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:33:55.707</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:33:40', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:34:26')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '3ede8482-e141-4ae8-8689-474cc15d1425')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('3ede8482-e141-4ae8-8689-474cc15d1425', 'Staff lapsing members summary alert', 'Creates an alert with a count of members whose memberships expire within 7 days. ', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>449b4f4a-fc1b-4150-b161-7c2a48dbb28d</DataSourceId><DataSourceName>LapsingMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>b16a2c83-912b-404c-96af-0cde30cef0f6</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert with a count of members whose memberships expire within 7 days. </Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>449b4f4a-fc1b-4150-b161-7c2a48dbb28d</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff lapsing members summary alert</Name><Notifications><NotificationDefinition><DataSources><string>449b4f4a-fc1b-4150-b161-7c2a48dbb28d</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Membership/Members_lapsing_soon.aspx"&gt;{#LapsingMembers.NumberLapsing} member(s)&lt;/a&gt; lapse in the next week&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>905a1f2f-7559-4781-8133-95726fbb0536</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>3ede8482-e141-4ae8-8689-474cc15d1425</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>3ede8482-e141-4ae8-8689-474cc15d1425</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>a4effb10-9109-4bcf-b4e4-67c47af42737</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:22:35.6</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:24:35.747</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:22:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:24:37')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '5d970207-a95e-4882-a605-4b010f16e583')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5d970207-a95e-4882-a605-4b010f16e583', 'VIP alert', 'Intended for staff use; Creates a VIP alert if the selected contact is a committee President or Chair.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>5c801589-1153-41be-9104-b7b49cd756c2</DataSourceId><DataSourceName>VIPs</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/VIP contacts</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Intended for staff use; Creates a VIP alert if the selected contact is a committee President or Chair.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>5c801589-1153-41be-9104-b7b49cd756c2</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>VIP alert</Name><Notifications><NotificationDefinition><DataSources><string>5c801589-1153-41be-9104-b7b49cd756c2</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/cup-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;VIP&lt;/h4&gt;&#xD;
{foreach group in VIPs}&#xD;
{#group.CommitteeName} -&amp;nbsp;{#group.Position}&lt;br /&gt;&#xD;
{/foreach}&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>a88bd600-0090-48f0-a0aa-b20c6eee180a</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>5d970207-a95e-4882-a605-4b010f16e583</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5d970207-a95e-4882-a605-4b010f16e583</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>eaf5d4c0-8928-4f97-8aed-ebe44edcfda1</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:24:41.64</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-02T12:33:57.797</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:24:41', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:34:02')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '5281abd1-2f75-4250-a61e-533677cf79e9')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5281abd1-2f75-4250-a61e-533677cf79e9', 'Staff new contacts alert', 'Creates an alert listing new contacts created in the last 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>aeb970e7-b294-4b12-ba67-afe49318c45a</DataSourceId><DataSourceName>NewContacts</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>0c104e8a-fd79-44c9-8b29-9ed7a3ccedcc</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing new contacts created in the last 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>aeb970e7-b294-4b12-ba67-afe49318c45a</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff new contacts alert</Name><Notifications><NotificationDefinition><DataSources><string>aeb970e7-b294-4b12-ba67-afe49318c45a</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;New contacts&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach contact in NewContacts}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#contact.PartyID}"&gt;{#contact.FullName}&lt;/a&gt; added on {#contact.CreatedOn format=m}&lt;/li&gt;&#xD;
    {/foreach}&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>e0df3dec-f730-4348-9048-d01682aa8053</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>5281abd1-2f75-4250-a61e-533677cf79e9</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5281abd1-2f75-4250-a61e-533677cf79e9</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>20ca80ad-f315-4323-93ae-8eabfc8971b6</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:21:08.223</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:21:51.63</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:21:08', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:22:07')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'da3b20f6-0f3e-4816-affc-55e3e8d77904')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('da3b20f6-0f3e-4816-affc-55e3e8d77904', 'Staff recent renewals summary alert', 'Creates an alert with a count of members who have renewed in the past 7 days. ', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>7769265b-e838-46e7-9bac-b457eb49822c</DataSourceId><DataSourceName>Renewals</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>890aa3d3-9f27-4791-8e06-81952ad35d86</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert with a count of members who have renewed in the past 7 days. </Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>7769265b-e838-46e7-9bac-b457eb49822c</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent renewals summary alert</Name><Notifications><NotificationDefinition><DataSources><string>7769265b-e838-46e7-9bac-b457eb49822c</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/info-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Membership/Recent_renewals.aspx"&gt;{#Renewals.NumberRenewed} member(s)&lt;/a&gt; renewed in the last week&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>30786b72-341f-4504-b7ee-af3ef023bfc6</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>da3b20f6-0f3e-4816-affc-55e3e8d77904</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>da3b20f6-0f3e-4816-affc-55e3e8d77904</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>fe5bd488-c6e7-4c19-9f91-010b5720311d</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:26:27.763</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:26:43.763</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:26:27', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:27:01')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'e6bb9114-8528-48a2-94fd-579bef13fa0b')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('e6bb9114-8528-48a2-94fd-579bef13fa0b', 'Membership expires soon alert', 'Creates an alert if the selected contact''s membership will expire within 60 days', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</DataSourceId><DataSourceName>ExpiringMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Members expiring within 60 days</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact''s membership will expire within 60 days</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Membership expires soon alert</Name><Notifications><NotificationDefinition><DataSources><string>c50a6060-71a8-44eb-8f7c-b8eb1f5a0136</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Membership expires on&amp;nbsp;&lt;strong&gt;{#ExpiringMembers.PaidThrough format=m}&lt;/strong&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>e0362465-9431-44ef-be16-7f0f2f39154c</NotificationDefinitionId><PersonalizedTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Your membership expires on&amp;nbsp;&lt;strong&gt;{#ExpiringMembers.PaidThrough format=m}&lt;/strong&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</PersonalizedTemplate><TaskDefinitionId>e6bb9114-8528-48a2-94fd-579bef13fa0b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>e6bb9114-8528-48a2-94fd-579bef13fa0b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>55f7062d-214b-47d7-98e4-6dc4afeb594a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:49:31.787</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:47:31.48</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:49:31', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 12:57:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '49f51017-953c-4f12-a107-5dd9943582d2')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('49f51017-953c-4f12-a107-5dd9943582d2', 'Staff recent gifts alert', 'Creates an alert listing recent gifts under 500.00.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>10b3eb53-1df9-4042-aae3-ee505454c1c6</DataSourceId><DataSourceName>RecentGifts</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>35b90395-0588-4f12-bc84-2211e2e57ce9</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing recent gifts under 500.00.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>10b3eb53-1df9-4042-aae3-ee505454c1c6</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent gifts alert</Name><Notifications><NotificationDefinition><DataSources><string>10b3eb53-1df9-4042-aae3-ee505454c1c6</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/donor-ribbon-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Recent gifts&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach gift in RecentGifts limit 10}&#xD;
    &lt;li&gt;{#gift.Donor} gave &lt;strong&gt;{#gift.Amount}&lt;/strong&gt;&lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Fundraising/Recent_gifts.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>16021a44-76a4-474f-a932-059265dd57a3</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>49f51017-953c-4f12-a107-5dd9943582d2</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>49f51017-953c-4f12-a107-5dd9943582d2</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>33204523-bd53-420c-ac14-b51bedb96a1b</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:28:53.11</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:29:26.69</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:28:53', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:29:29')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '27f50f61-e6d7-4461-afc7-643dbf17ab4a')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('27f50f61-e6d7-4461-afc7-643dbf17ab4a', 'Staff new users alert', 'Creates an alert listing new users (contacts with usernames) created in the last 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4c4280d4-8dee-4c29-9046-d5caf4f5c8e3</DataSourceId><DataSourceName>NewUsers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>0ccf0c13-7121-43d8-9c85-65a29de32165</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing new users (contacts with usernames) created in the last 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>4c4280d4-8dee-4c29-9046-d5caf4f5c8e3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff new users alert</Name><Notifications><NotificationDefinition><DataSources><string>4c4280d4-8dee-4c29-9046-d5caf4f5c8e3</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;New users&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach contact in NewUsers}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#contact.PartyID}"&gt;{#contact.Full_Name}&lt;/a&gt; added on {#contact.CreatedOn format=m}&lt;/li&gt;&#xD;
    {/foreach}&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>0b7f112a-499f-444a-b549-c1c65cb4668b</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>27f50f61-e6d7-4461-afc7-643dbf17ab4a</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>27f50f61-e6d7-4461-afc7-643dbf17ab4a</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>4cb3fa75-3d2a-4f7a-b502-45c55812cc5f</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:13:43.89</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:14:22.423</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:13:43', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150818 15:23:23')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'd577be59-2531-4947-b2cd-671de991a38b')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('d577be59-2531-4947-b2cd-671de991a38b', 'Join now alert', 'Creates an alert if the selected contact is not a member, prompting them to join.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</DataSourceId><DataSourceName>Non-members</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Non-members</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>ed81cf67-9298-4682-889a-1d7ded18b5c8</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Join now alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;a href="[Website]/JoinNow"&gt;&lt;strong&gt;Join now&lt;/strong&gt;&lt;/a&gt; and start enjoying members-only resources, events, and learning opportunities!&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>488d7bd5-798c-47ab-8d68-0695a66fb2d7</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>d577be59-2531-4947-b2cd-671de991a38b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>f622ea0d-18a9-4473-b69c-da9bb609661a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:42:43.887</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2014-11-03T15:55:02.393</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:42:43', '73493eb2-7f2e-4345-a800-0bf5582b16bc', '20141103 15:55:12')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'af2310b5-84fb-48a6-b27a-6a0e764f3252')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('af2310b5-84fb-48a6-b27a-6a0e764f3252', 'Duplicate Contact Search', 'Searches all contacts for potential duplicates.', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionStoredProcedureData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>1ef57668-6c82-4a19-8803-0f030a1639e3</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>StoredProcedure</a:ActionTypeName><a:Description>asi_DuplicateEngineBatchRun</a:Description><a:StoredProcedureName>asi_DuplicateEngineBatchRun</a:StoredProcedureName></Action></Actions><DataSources i:nil="true"/><Description>Searches all contacts for potential duplicates.</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Duplicate Contact Search</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>fa85fa23-9270-49f6-8ce0-223471fe34ec</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>af2310b5-84fb-48a6-b27a-6a0e764f3252</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>af2310b5-84fb-48a6-b27a-6a0e764f3252</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers/><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>KERRYT</a:CreatedBy><a:CreatedOn>2015-03-11T13:49:47.22</a:CreatedOn><a:UpdatedBy>RBERNSTEIN</a:UpdatedBy><a:UpdatedOn>2015-03-31T15:12:59.53</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '8c337930-8aaa-400f-a57b-ff8d3681ef4a', '20150311 13:49:47', 'f0ceb9ec-3020-438e-82a4-5f32b06d34a8', '20150331 15:13:10')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'aaa4511b-caa4-4e33-b0ff-6f1c5ca02806')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('aaa4511b-caa4-4e33-b0ff-6f1c5ca02806', 'Staff dropped or reinstated members alert', 'Creates an alert for members who have been dropped or reinstated recently.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>3310aa0f-00ac-4722-bd8f-7f8271b9a391</DataSourceId><DataSourceName>StatusChanged</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>a49f727f-8e82-4d64-a56c-5d5bb7743220</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert for members who have been dropped or reinstated recently.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>3310aa0f-00ac-4722-bd8f-7f8271b9a391</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff dropped or reinstated members alert</Name><Notifications><NotificationDefinition><DataSources><string>3310aa0f-00ac-4722-bd8f-7f8271b9a391</string></DataSources><DefaultTemplate>{foreach member in StatusChanged}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/info-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;a href="[~]/Party.aspx?ID={#member.PartyId}"&gt;{#member.FullName}&lt;/a&gt; ({#member.MemberType}) updated to &lt;strong&gt;{#member.MemberStatus}&lt;/strong&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>8fd80462-360a-48c6-8a60-46789e84ef9d</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>aaa4511b-caa4-4e33-b0ff-6f1c5ca02806</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>aaa4511b-caa4-4e33-b0ff-6f1c5ca02806</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>73368856-4a4b-465c-8f61-5311f318a9b7</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:32:14.653</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:32:26.56</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:32:14', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:32:45')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '90976f5d-7269-4f7c-ba38-73a7842fe3b4')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('90976f5d-7269-4f7c-ba38-73a7842fe3b4', 'Staff popular products this month alert ', 'Creates an alert listing the products with the highest quantity purchased this month.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>e7786156-a9a6-4314-9fe4-a22feafd8ca8</DataSourceId><DataSourceName>Products</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>6eb4666e-1573-491a-9c87-a63880f49aba</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing the products with the highest quantity purchased this month.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>e7786156-a9a6-4314-9fe4-a22feafd8ca8</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff popular products this month alert </Name><Notifications><NotificationDefinition><DataSources><string>e7786156-a9a6-4314-9fe4-a22feafd8ca8</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/star-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Popular products this month&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach prod in Products}&#xD;
    &lt;li&gt;&lt;a href="[~]/ItemDetail?iProductCode={#prod.ProductCode}&amp;amp;Category={#prod.ProductCategory}"&gt;{#prod.ProductName}&lt;/a&gt;: {#prod.QuantityOrdered format=f0} sold&lt;/li&gt;&#xD;
    {/foreach}&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>161cea32-f505-4aae-8936-10dabdbc457b</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>90976f5d-7269-4f7c-ba38-73a7842fe3b4</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>90976f5d-7269-4f7c-ba38-73a7842fe3b4</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>58f16f9a-1d62-46fb-b688-ce0c302ede5b</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:44:51.107</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:45:03.903</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:44:51', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:45:32')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e', 'New member welcome email', 'Sends out a welcome email on a weekly basis to members who have joined in the past week.', 0, 0, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>a42eef4e-7293-482a-a134-48a1a8659ba2</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>e31a50a7-7e40-463c-97ed-2f9de4856aab</a:CommunicationTemplateId><a:Description>New Member Welcome Email</a:Description><a:RecipientDatasourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</DataSourceId><DataSourceName>NewMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/New members in the last 7 days</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a welcome email on a weekly basis to members who have joined in the past week.</Description><Evaluations/><Name>New member welcome email</Name><Notifications><NotificationDefinition><DataSources><string>70aa36f3-c6cd-44b9-b654-ac91292bcf9f</string></DataSources><DefaultTemplate/><NotificationDefinitionId>3b5d8751-e9c6-413a-b7cf-93f0f0497815</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>cd0655ef-ce2f-4d43-8ce9-7c49f6ebf79e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">1b9adb73-daf7-4e20-92e3-5ca70854d415</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfWeek xmlns:a="http://schemas.datacontract.org/2004/07/System"><a:DayOfWeek>Sunday</a:DayOfWeek></DaysOfWeek><Months>0</Months><ScheduleFrequency>Weekly</ScheduleFrequency><Time>0001-01-01T00:00:00</Time><Weeks>1</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T03:01:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T14:58:35.247</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:58.227</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 14:58:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 15:02:09')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '1de1d2cb-053f-4135-8f40-7cbb799ad4c2')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('1de1d2cb-053f-4135-8f40-7cbb799ad4c2', 'Refresh Dynamic Groups - Daily', 'Refresh all groups based on IQA queries that are scheduled to update daily', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>56aa2249-9a25-42ad-82ee-2c2201793611</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Daily</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update daily</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Daily</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>85c06a56-092b-4043-8445-dbbca7531f23</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>1de1d2cb-053f-4135-8f40-7cbb799ad4c2</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>1de1d2cb-053f-4135-8f40-7cbb799ad4c2</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">05adb028-5bf0-48a7-82c5-f77bfc305e26</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2015-04-07T03:05:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-02-18T03:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:41:24.533</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9', 'Major donor alert', 'Intended for staff use; creates an alert if the selected contact is assigned to a Moves Manager.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>70776c3c-db48-4f1a-b80e-60f5404c5e65</DataSourceId><DataSourceName>MajorDonors</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Major Donors</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Intended for staff use; creates an alert if the selected contact is assigned to a Moves Manager.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>70776c3c-db48-4f1a-b80e-60f5404c5e65</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Major donor alert</Name><Notifications><NotificationDefinition><DataSources><string>70776c3c-db48-4f1a-b80e-60f5404c5e65</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/donor-ribbon-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Major Donor&lt;/h4&gt;&#xD;
Moves Manager:&amp;nbsp;&lt;a href="[~]/Party.aspx?ID={#MajorDonors.Moves_Manager_ID}"&gt;{#MajorDonors.Moves_Manager}&lt;/a&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>0df7dbe3-9209-4890-bf45-266e1982ce7c</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>6e5a7e0b-eb04-4991-84b8-7df45ecf4ae9</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>37e1b987-59b0-4099-8f3c-8c00464e0a3d</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:20:32.443</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:48:41.697</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:20:32', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:34:25')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'bf83275a-2965-4d7a-ac92-9335bb2519a1')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('bf83275a-2965-4d7a-ac92-9335bb2519a1', 'Staff low inventory alert', 'Creates an alert listing products which have low inventory.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4cfefc35-029b-434d-b6e4-555bb2e6712b</DataSourceId><DataSourceName>LowInventory</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>7b7e4e6c-ee26-4e17-805e-8bf922576385</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing products which have low inventory.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>4cfefc35-029b-434d-b6e4-555bb2e6712b</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff low inventory alert</Name><Notifications><NotificationDefinition><DataSources><string>4cfefc35-029b-434d-b6e4-555bb2e6712b</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Low inventory&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach product in LowInventory limit 10}&#xD;
    &lt;li&gt;&lt;a href="[~]/ItemDetail?iProductCode={#product.code_ProductCode}&amp;amp;Category={#product.Category}"&gt;{#product.Product}&lt;/a&gt;: {#product.QuantityAvailable format=f0} &lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Commerce/Low_inventory_products.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b8498e20-8d58-4e20-8e15-bf652b54ba95</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>bf83275a-2965-4d7a-ac92-9335bb2519a1</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>bf83275a-2965-4d7a-ac92-9335bb2519a1</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>266e1632-708e-4217-92c1-cbfee3aebc61</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-17T09:21:12.337</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-17T09:21:26.947</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:21:12', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:21:45')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'ffcaf8ec-8d4a-4fbf-9540-a9fe380a86fe')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('ffcaf8ec-8d4a-4fbf-9540-a9fe380a86fe', 'Staff regular pricing cutoff alert', 'Creates an alert when the regular registration pricing for an event will end within 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>822357bb-5bb8-4ef4-b155-d6aeeb38fdbe</DataSourceId><DataSourceName>RegularCutoffEvents</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>d564cf26-e748-40e0-9c96-112334fc4fa1</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert when the regular registration pricing for an event will end within 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>822357bb-5bb8-4ef4-b155-d6aeeb38fdbe</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff regular pricing cutoff alert</Name><Notifications><NotificationDefinition><DataSources><string>822357bb-5bb8-4ef4-b155-d6aeeb38fdbe</string></DataSources><DefaultTemplate>{foreach reg in RegularCutoffEvents}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;Regular registration pricing for &lt;a href="[~]/Event.aspx?EventKey={#reg.EventCode}"&gt;{#reg.EventName}&lt;/a&gt; ends &lt;strong&gt;{#reg.Cutoff}&lt;/strong&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>d3b5e9e2-20e4-44fe-9282-47d319f8c0fa</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ffcaf8ec-8d4a-4fbf-9540-a9fe380a86fe</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ffcaf8ec-8d4a-4fbf-9540-a9fe380a86fe</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>232d53c8-d8f7-446c-94c0-1d121d401178</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:38:06.077</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:38:47.203</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:38:06', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:38:49')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '3e24ac67-5195-45c9-b765-ac7cda1182b1')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('3e24ac67-5195-45c9-b765-ac7cda1182b1', 'Task Log Cleanup', 'Task that runs daily to delete task logs older than a month. Failed task logs are deleted after 3 months. (This interval is configurable).', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionStoredProcedureData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>879271ee-9358-4f76-a1ae-835188890669</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>StoredProcedure</a:ActionTypeName><a:Description>asi_CleanTaskLog</a:Description><a:StoredProcedureName>asi_CleanTaskLog</a:StoredProcedureName></Action></Actions><DataSources i:nil="true"/><Description>Task that runs daily to delete task logs older than a month. Failed task logs are deleted after 3 months. (This interval is configurable)</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Task Log Cleanup</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>22668a95-2018-4603-8252-1a4242db2a5f</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>3e24ac67-5195-45c9-b765-ac7cda1182b1</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>3e24ac67-5195-45c9-b765-ac7cda1182b1</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">c4f8f9a6-c068-4a90-a252-82ed5ae86bad</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2015-06-08T09:10:14.3216413-05:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-06-08T09:10:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-06-08T09:09:35.077</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-06-08T09:12:23.717</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150609 09:01:44', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150609 09:01:44')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '20c696eb-b684-43c4-98af-aef826e0da4b')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('20c696eb-b684-43c4-98af-aef826e0da4b', 'Missing mobile phone alert', 'Creates an alert if the selected contact has no mobile phone.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>54f3e083-4c54-4e60-a3eb-8b7e9907d9db</DataSourceId><DataSourceName>MissingMobilePhone</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>685837de-156f-48fe-bcc8-c89c3dfac78e</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact has no mobile phone.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>54f3e083-4c54-4e60-a3eb-8b7e9907d9db</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Missing mobile phone alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Mobile phone is missing&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>fa2ccd2c-f0d2-431f-a662-b473d70dcca1</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>20c696eb-b684-43c4-98af-aef826e0da4b</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>20c696eb-b684-43c4-98af-aef826e0da4b</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>d73fb58a-aa19-41cc-bcce-4ada090841e8</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>BSCHRADER</a:CreatedBy><a:CreatedOn>2015-08-19T15:59:01.08</a:CreatedOn><a:UpdatedBy>BSCHRADER</a:UpdatedBy><a:UpdatedOn>2015-08-19T15:59:36.097</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 15:59:01', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:01:27')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '5fb57e67-9ecb-44ed-a759-b13edfbd285e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5fb57e67-9ecb-44ed-a759-b13edfbd285e', 'Staff recent event registrations alert', 'Creates an alert listing the 10 most recent event registrations.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>6d5607a4-5e6d-4375-9951-f77dffb64ab9</DataSourceId><DataSourceName>RecentRegistrations</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>5ba5cf33-86d8-4750-917e-11751bd5ab98</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing the 10 most recent event registrations.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>6d5607a4-5e6d-4375-9951-f77dffb64ab9</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent event registrations alert</Name><Notifications><NotificationDefinition><DataSources><string>6d5607a4-5e6d-4375-9951-f77dffb64ab9</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Recent registrations&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach reg in RecentRegistrations limit 10}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#reg.code_PartyId}"&gt;{#reg.Registrant}&lt;/a&gt; registered for the &lt;a href="[~]/Event.aspx?EventKey={#reg.code_EventCode}"&gt;{#reg.EventName}&lt;/a&gt;&lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Events/Recent_event_registrations.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>93c7e689-21bc-4f0e-b0ce-61dbd8edc807</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>5fb57e67-9ecb-44ed-a759-b13edfbd285e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>5fb57e67-9ecb-44ed-a759-b13edfbd285e</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>31341b3c-c228-4eb5-9a38-6058a83a3b10</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:41:02.613</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:41:48.913</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:41:02', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:41:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '8d312ffe-5661-4a5e-8d85-b2f33c450863')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('8d312ffe-5661-4a5e-8d85-b2f33c450863', 'Staff early pricing cutoff alert', 'Creates an alert for the selected event when the early registration pricing will end within 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>18fc507b-26f6-4c68-b2e7-d165dfb0b06a</DataSourceId><DataSourceName>EarlyPricingEnds</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>8f7d1f18-0a15-4d6e-84a4-1b1a91e093b3</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert for the selected event when the early registration pricing will end within 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>18fc507b-26f6-4c68-b2e7-d165dfb0b06a</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff early pricing cutoff alert</Name><Notifications><NotificationDefinition><DataSources><string>18fc507b-26f6-4c68-b2e7-d165dfb0b06a</string></DataSources><DefaultTemplate>{foreach reg in EarlyPricingEnds}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;Early registration pricing for &lt;a href="[~]/Event.aspx?EventKey={#reg.EventCode}"&gt;{#reg.EventName}&lt;/a&gt; ends&amp;nbsp;&lt;strong&gt;{#reg.Cutoff}&lt;/strong&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>73f80cfc-bfa1-475b-bfc3-90204f540bb8</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>8d312ffe-5661-4a5e-8d85-b2f33c450863</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>8d312ffe-5661-4a5e-8d85-b2f33c450863</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>8e3f5f97-1ea4-4b2b-b1c3-3a741277807c</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:37:09.213</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:37:23.917</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:37:09', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:37:42')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'aff2b818-cc19-44ed-a921-b40b9bb7f9ac')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('aff2b818-cc19-44ed-a921-b40b9bb7f9ac', 'Missing primary email alert', 'Creates an alert if the selected contact has no primary email.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4c6097f0-8771-4347-8ad3-b64f7a2f7bb2</DataSourceId><DataSourceName>MissingEmail</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Contacts with no primary email</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected contact has no primary email.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>4c6097f0-8771-4347-8ad3-b64f7a2f7bb2</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Missing primary email alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/warning.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
Primary email is missing&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>8529fb7e-7f42-4f4b-9cf0-6c937b9517df</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>aff2b818-cc19-44ed-a921-b40b9bb7f9ac</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>aff2b818-cc19-44ed-a921-b40b9bb7f9ac</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>c88f7648-6027-4fb2-ae7f-becadae7a84c</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-09-30T13:40:39.5</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-09-30T14:48:15.29</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:40:39', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:32:57')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '458c4906-d946-4a41-85a8-b62e2b63ed2a')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('458c4906-d946-4a41-85a8-b62e2b63ed2a', 'Donation thank you email', 'Sends out a thank you email to donors who have made a donation.', 0, 0, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>ffd474b3-7054-4643-9538-4472c1a3f65d</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>c866e389-3abd-45f6-9545-f1a9024b91c2</a:CommunicationTemplateId><a:Description>DonationThankYouTemplate</a:Description><a:RecipientDatasourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</DataSourceId><DataSourceName>Donors</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/Donations received today</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends out a thank you email to donors who have made a donation.</Description><Evaluations/><Name>Donation thank you email</Name><Notifications><NotificationDefinition><DataSources><string>4b832544-34cd-4cc6-8b4a-f9fc1187fe07</string></DataSources><DefaultTemplate/><NotificationDefinitionId>29dcb66a-dbca-465d-a769-dc3222e0c43d</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>458c4906-d946-4a41-85a8-b62e2b63ed2a</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">6e91c1a3-3b09-4621-809d-878084021dcf</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>1</Days><Months>0</Months><ScheduleFrequency>Daily</ScheduleFrequency><Time>2014-10-03T23:59:00</Time><Weeks>0</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2014-01-01T23:59:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2014-10-03T15:06:18.767</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2014-10-03T15:09:10.67</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 15:06:18', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141003 15:09:27')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '836d7b92-0fdb-4f6c-9319-b7c59d4525e9')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('836d7b92-0fdb-4f6c-9319-b7c59d4525e9', 'Staff new joins alert', 'Creates an alert for members who have joined today.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>b11103dd-5e5a-412b-892e-1d5a7fc21c6f</DataSourceId><DataSourceName>JoinsToday</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>dcb1d528-f94a-4263-86fe-15ab0f96c8bb</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert for members who have joined today.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>b11103dd-5e5a-412b-892e-1d5a7fc21c6f</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff new joins alert</Name><Notifications><NotificationDefinition><DataSources><string>b11103dd-5e5a-412b-892e-1d5a7fc21c6f</string></DataSources><DefaultTemplate>{foreach member in JoinsToday}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/people-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;a href="[~]/Party.aspx?ID={#member.PartyId}"&gt;{#member.FullName}&lt;/a&gt; joined today as a {#member.MemberType}&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>1942eb3d-c26f-40f0-bd35-0aae32ced917</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>836d7b92-0fdb-4f6c-9319-b7c59d4525e9</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>836d7b92-0fdb-4f6c-9319-b7c59d4525e9</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>b667b8a9-c450-4330-8d71-d4362f068a19</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:25:07.2</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:25:19.027</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:25:07', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:25:37')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '16c0db1f-c174-4f2d-a2d1-bb2b14581f9e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('16c0db1f-c174-4f2d-a2d1-bb2b14581f9e', 'Event confirmation email', 'Sends a confirmation email to event registrants when they submit their registration.', 0, 0, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionCommunicationJobData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>7a07330d-ab9f-471d-8fce-894ac564fdb5</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>CommunicationJob</a:ActionTypeName><a:CommunicationTemplateId>63300372-f980-4c79-b9ef-9d55fbaaebf1</a:CommunicationTemplateId><a:Description>Event Confirmation</a:Description><a:RecipientDatasourceId>bcdf505b-0970-45ea-b317-93bf5d5a560b</a:RecipientDatasourceId></Action></Actions><DataSources><anyType i:type="DataSourceEntityData"><DataSourceId>4d515be4-78cd-41f0-9657-a7b08c3245ab</DataSourceId><DataSourceName>Table:Order_Meet</DataSourceName></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>bcdf505b-0970-45ea-b317-93bf5d5a560b</DataSourceId><DataSourceName>Registration</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>2bcfa5c0-ac9d-4629-97e7-1cd20c9a5adf</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Sends a confirmation email to event registrants when they submit their registration.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>bcdf505b-0970-45ea-b317-93bf5d5a560b</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><Name>Event confirmation email</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>40903856-7e0d-4d7e-a2ec-46b7e8053ba4</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>16c0db1f-c174-4f2d-a2d1-bb2b14581f9e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>16c0db1f-c174-4f2d-a2d1-bb2b14581f9e</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="a:TaskDefinitionTriggerDataChangedData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>true</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>4d515be4-78cd-41f0-9657-a7b08c3245ab</a:TriggerId><a:TriggerTypeName>Data</a:TriggerTypeName><a:EntityName/><a:Filters i:nil="true"/><a:FireTypes><TriggerFireTypeData>Insert</TriggerFireTypeData></a:FireTypes><a:TableName>Order_Meet</a:TableName><a:TriggerSystemEventType>None</a:TriggerSystemEventType></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-20T12:47:24.72</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-20T12:48:58.38</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150820 12:47:24', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150820 12:49:12')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '6ec57bc4-6294-4e01-ae51-bbb90ad2f70e')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('6ec57bc4-6294-4e01-ae51-bbb90ad2f70e', 'Staff lapsing members list alert', 'Creates an alert listing members whose memberships expire within 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>5e421a67-d1f1-480c-b296-e4b909e29f33</DataSourceId><DataSourceName>LapsingMembers</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>c9356a08-8b64-4e5f-bfe0-f2b536486eba</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing members whose memberships expire within 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>5e421a67-d1f1-480c-b296-e4b909e29f33</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff lapsing members list alert</Name><Notifications><NotificationDefinition><DataSources><string>5e421a67-d1f1-480c-b296-e4b909e29f33</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Lapsing members&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach member in LapsingMembers limit 10}&#xD;
    &lt;li&gt;&lt;a href="[~]/Party.aspx?ID={#member.code_PartyID}"&gt;{#member.Name}&lt;/a&gt; lapses on {#member.PaidThrough format=m} &lt;/li&gt;&#xD;
    {/foreach}&#xD;
    &lt;li&gt;&lt;a href="[website]/iCore/Staff_Dashboards/Membership/Members_lapsing_soon.aspx"&gt;&lt;strong&gt;View all&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>a7fb6a20-b986-43d8-a982-bb3d4bce708b</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>6ec57bc4-6294-4e01-ae51-bbb90ad2f70e</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>6ec57bc4-6294-4e01-ae51-bbb90ad2f70e</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>8830e6f2-a04e-4965-aa78-a9dab1b07374</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:23:35.29</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:24:17.353</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:23:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150814 09:58:28')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '7cb6e609-ba30-4cd8-9dff-de1e6f641595')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('7cb6e609-ba30-4cd8-9dff-de1e6f641595', 'Staff low event registration alert', 'Creates an alert when an event starts soon and has low registration.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>05117986-aaf4-4dfd-b864-2fc57264982c</DataSourceId><DataSourceName>EventsAtRisk</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>c582058f-b2ad-45ff-98b4-7a19e1b8f12f</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert when an event starts soon and has low registration.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>05117986-aaf4-4dfd-b864-2fc57264982c</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff low event registration alert</Name><Notifications><NotificationDefinition><DataSources><string>05117986-aaf4-4dfd-b864-2fc57264982c</string></DataSources><DefaultTemplate>{foreach event in EventsAtRisk}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;a href="[~]/Event.aspx?EventKey={#event.EventCode}"&gt;{#event.EventName}&lt;/a&gt; begins soon and has low registration&lt;br /&gt;&#xD;
&lt;label&gt;Event date&lt;/label&gt;: {#event.BeginDate}&lt;br /&gt;&#xD;
&lt;label&gt;Registrants&lt;/label&gt;: {#event.Registrants}&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>f6de0bf1-7c03-42db-8c3b-1d7ab1d17dab</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>7cb6e609-ba30-4cd8-9dff-de1e6f641595</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>7cb6e609-ba30-4cd8-9dff-de1e6f641595</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>65e7f6d3-ad93-4807-b0f6-10f9df6dcf52</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:39:13.237</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:40:16.267</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:39:13', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:40:31')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'e24b81bd-da44-47d2-9007-e2b78dbac343')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('e24b81bd-da44-47d2-9007-e2b78dbac343', 'Refresh Dynamic Groups - Weekly', 'Refresh all groups based on IQA queries that are scheduled to update weekly', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions><Action i:type="a:TaskDefinitionActionRefreshDynamicGroupsData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:ActionId>936fce33-4c3f-436f-86d6-7ffee113c657</a:ActionId><a:ActionNotification i:nil="true"/><a:ActionTypeName>RefreshDynamicGroups</a:ActionTypeName><a:Description>None selected</a:Description><a:ScheduleFrequency>Weekly</a:ScheduleFrequency></Action></Actions><DataSources i:nil="true"/><Description>Refresh all groups based on IQA queries that are scheduled to update weekly</Description><Evaluations/><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Refresh Dynamic Groups - Weekly</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate/><NotificationDefinitionId>445c295d-c41d-4bd0-a457-9c0df545d0e1</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>e24b81bd-da44-47d2-9007-e2b78dbac343</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>e24b81bd-da44-47d2-9007-e2b78dbac343</TaskDefinitionId><TaskType>Scheduled</TaskType><Triggers><Trigger i:type="TaskDefinitionTriggerTimedEventData"><Description i:nil="true" xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"/><Enabled xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">true</Enabled><QuitOnMatch xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">false</QuitOnMatch><TriggerId xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">6534ffce-d5d0-4579-b29e-05e8592c279c</TriggerId><TriggerTypeName xmlns="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts">Scheduled</TriggerTypeName><Recurrence><CalendarSchedule><Days>0</Days><DaysOfWeek xmlns:a="http://schemas.datacontract.org/2004/07/System"><a:DayOfWeek>Sunday</a:DayOfWeek></DaysOfWeek><Months>0</Months><ScheduleFrequency>Weekly</ScheduleFrequency><Time>0001-01-01T01:00:00</Time><Weeks>1</Weeks></CalendarSchedule><EndDatetime i:nil="true"/><StartDatetime>2015-03-01T04:05:00</StartDatetime></Recurrence></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-02-24T18:12:06.7</a:CreatedOn><a:UpdatedBy>STACEY</a:UpdatedBy><a:UpdatedOn>2015-04-07T15:43:05.373</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150224 18:12:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'a39fd29d-32c1-4ce1-874b-e4c839209828')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('a39fd29d-32c1-4ce1-874b-e4c839209828', 'Staff recent large gifts alert', 'Creates an alert listing recent gifts of 500.00 or more.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>8e35ee63-b6e6-45b7-8d6c-c9fd7f01f23d</DataSourceId><DataSourceName>RecentGifts</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>a7ec7a94-68a4-4299-b241-ea8e881fd2c6</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert listing recent gifts of 500.00 or more.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>8e35ee63-b6e6-45b7-8d6c-c9fd7f01f23d</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff recent large gifts alert</Name><Notifications><NotificationDefinition><DataSources><string>8e35ee63-b6e6-45b7-8d6c-c9fd7f01f23d</string></DataSources><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/star-color.png" /&gt;&#xD;
&lt;div class="media-body"&gt;&#xD;
&lt;h4 class="media-heading"&gt;Recent large gifts&lt;/h4&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
&lt;div&gt;&#xD;
&lt;ul class="list-unstyled"&gt;&#xD;
    {foreach gift in RecentGifts limit 10}&#xD;
    &lt;li&gt;{#gift.Donor} gave &lt;strong&gt;{#gift.Amount}&lt;/strong&gt;&lt;/li&gt;&#xD;
    {/foreach}&#xD;
&lt;/ul&gt;&#xD;
&lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>3f5537d4-f707-4f0e-b5f1-b59432c6a97b</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>a39fd29d-32c1-4ce1-874b-e4c839209828</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>a39fd29d-32c1-4ce1-874b-e4c839209828</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>07d73cbd-a23d-443a-ba64-a5104368d8d0</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:29:54.897</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:30:06.49</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:29:54', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:30:26')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'ef535a97-76f5-4c72-b0a1-e94681d38c99')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('ef535a97-76f5-4c72-b0a1-e94681d38c99', 'Duplicate Contact Alert', 'Alerts staff that a duplicate contact record may exist', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</DataSourceId><DataSourceName>PotentialPartyDuplicates</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/Queries/PotentialPartyDuplicates</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType><anyType i:type="DataSourceQueryData"><DataSourceId>872dfc76-5213-4c30-8ec7-34ab72c56184</DataSourceId><DataSourceName>SelectedContact</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/ContactManagement/DefaultSystem/SelectedContact</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Alerts staff that a duplicate contact record may exist</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>0fc70c24-7569-4ca8-8783-934e1d3f3624</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Duplicate Contact Alert</Name><Notifications><NotificationDefinition><DataSources/><DefaultTemplate>&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/caution.png" /&gt;&#xD; &lt;div class="media-body"&gt;&#xD; Possible duplicate contact(s) found.&lt;/div&gt;&#xD; &lt;/div&gt;</DefaultTemplate><NotificationDefinitionId>b4b2a5b3-3b63-4ff9-bf26-51675db2bdd5</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>ef535a97-76f5-4c72-b0a1-e94681d38c99</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>184bdd32-3a46-4431-919e-a5267fa6836a</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MANAGER</a:CreatedBy><a:CreatedOn>2015-04-01T08:15:44.44</a:CreatedOn><a:UpdatedBy>RDELFELD</a:UpdatedBy><a:UpdatedOn>2015-04-09T13:18:29.377</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150401 08:15:44', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150409 14:53:12')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = 'c7885c31-d6cd-4926-9a7a-f1d6043543a9')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('c7885c31-d6cd-4926-9a7a-f1d6043543a9', 'Staff online registration opens soon alert', 'Creates an alert when the online registration for an event opens within 7 days.', 0, 1, 0, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>e39778a8-43a5-4217-9350-dac8452552d5</DataSourceId><DataSourceName>RegOpensSoon</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryDocumentVersionKey</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>a5367630-fbe4-4bd9-b761-8b0cd7a76cc7</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert when the online registration for an event opens within 7 days.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>e39778a8-43a5-4217-9350-dac8452552d5</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><Name>Staff online registration opens soon alert</Name><Notifications><NotificationDefinition><DataSources><string>e39778a8-43a5-4217-9350-dac8452552d5</string></DataSources><DefaultTemplate>{foreach reg in RegOpensSoon}&#xD;
&lt;div class="media"&gt;&lt;img alt="" src="[~]/images/Icons/Alerts/hourglass-grey.png" /&gt;&#xD;
&lt;div class="media-body"&gt;Online registration for &lt;a href="[~]/Event.aspx?EventKey={#reg.EventCode}"&gt;{#reg.EventName}&lt;/a&gt; begins&lt;strong&gt; {#reg.Opens}&lt;/strong&gt;&lt;/div&gt;&#xD;
&lt;/div&gt;&#xD;
{/foreach}</DefaultTemplate><NotificationDefinitionId>2773dac9-7025-4dce-850c-cde22ab7ecf7</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>c7885c31-d6cd-4926-9a7a-f1d6043543a9</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>c7885c31-d6cd-4926-9a7a-f1d6043543a9</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>1f9c1cc9-dbfc-4d74-9321-60fe267561a1</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>MVERDUZCO</a:CreatedBy><a:CreatedOn>2015-08-13T09:34:50.63</a:CreatedOn><a:UpdatedBy>MVERDUZCO</a:UpdatedBy><a:UpdatedOn>2015-08-13T09:35:03.6</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:34:50', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:35:21')
END
GO

IF NOT EXISTS (SELECT 1 FROM TaskDefinition WHERE TaskDefinitionKey = '168a405d-9a9e-4b70-affe-fa3d7e409b80')
BEGIN
    INSERT INTO TaskDefinition (TaskDefinitionKey, TaskDefinitionName, TaskDefinitionDesc, TaskDefinitionPriority, TaskDefinitionIsActive, TaskDefinitionIsSystem, SerializedTaskDefinition, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('168a405d-9a9e-4b70-affe-fa3d7e409b80', 'Company Join Alert', 'Creates an alert if the selected organization is not a member, prompting them to join.', 0, 1, 1, '<TaskDefinitionData xmlns="http://schemas.imis.com/2008/01/CommunicationsDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><Actions/><DataSources><anyType i:type="DataSourceQueryData"><DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</DataSourceId><DataSourceName>NonMemberCompanies</DataSourceName><Query xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:Criteria><a:Criteria><a:Operation>Equal</a:Operation><a:PropertyName>QueryName</a:PropertyName><a:Values xmlns:b="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><b:string>$/Common/Tasks/Queries/NonMemberCompanies</b:string></a:Values></a:Criteria></a:Criteria><a:EntityTypeName>IQA</a:EntityTypeName></Query></anyType></DataSources><Description>Creates an alert if the selected organization is not a member, prompting them to join.</Description><Evaluations><Evaluation i:type="a:TaskDefinitionEvaluationQueryData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:DataSourceId>77f57509-aa1a-41d0-967b-69b3ea410df3</a:DataSourceId><a:EvaluationTypeName>Query</a:EvaluationTypeName></Evaluation></Evaluations><IsActive>true</IsActive><IsSystem>true</IsSystem><Name>Company Join Alert</Name><Notifications><NotificationDefinition><DataSources><string>77f57509-aa1a-41d0-967b-69b3ea410df3</string></DataSources><DefaultTemplate>&lt;p style="text-align: center;"&gt;&lt;a href="[~]/OrganizationJoinNow?ID={#NonMemberCompanies.ID}" class="PrimaryButton LargeButton TextButton"&gt;Join Now&lt;/a&gt;&lt;/p&gt;</DefaultTemplate><NotificationDefinitionId>17789d31-4275-421f-bf25-e56ab2fbacbd</NotificationDefinitionId><PersonalizedTemplate/><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId></NotificationDefinition></Notifications><Priority>0</Priority><TaskDefinitionId>168a405d-9a9e-4b70-affe-fa3d7e409b80</TaskDefinitionId><Triggers><Trigger i:type="a:TaskDefinitionTriggerOnDemandData" xmlns:a="http://schemas.datacontract.org/2004/07/Asi.Soa.Communications.DataContracts"><a:Description i:nil="true"/><a:Enabled>false</a:Enabled><a:QuitOnMatch>false</a:QuitOnMatch><a:TriggerId>0903f8c5-9bc7-4669-9490-7014ad64642e</a:TriggerId><a:TriggerTypeName>OnDemand</a:TriggerTypeName></Trigger></Triggers><UpdateInformation xmlns:a="http://schemas.imis.com/2008/01/SharedDataContracts"><a:CreatedBy>TARINIK</a:CreatedBy><a:CreatedOn>2015-07-07T10:31:29.737</a:CreatedOn><a:UpdatedBy>TARINIK</a:UpdatedBy><a:UpdatedOn>2015-07-07T10:33:56.267</a:UpdatedOn></UpdateInformation></TaskDefinitionData>', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46')
END
GO

SET NOCOUNT OFF

SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '0cf4d85a-9925-4c3b-b86a-2936640e1031')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('0cf4d85a-9925-4c3b-b86a-2936640e1031', 'Organization administrator alerts', 'Alerts that display to organization administrators on the organization''s account page', 1, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:17:51', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:18')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '62b8f1c9-aab9-4841-917d-32f8ff532944')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('62b8f1c9-aab9-4841-917d-32f8ff532944', 'Join Alert', 'Alert used to display on Company Administrator organization account page', 1, 0, 0, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = 'd32c2cb8-44c7-4243-8b8d-35a048ccf576')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('d32c2cb8-44c7-4243-8b8d-35a048ccf576', 'Quick Start Member alerts', 'Sample member-facing alerts for use in the Quick Start sites', 1, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:34:58', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:50:44')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '4606245e-9bbf-418a-9deb-3ab9d1890912')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('4606245e-9bbf-418a-9deb-3ab9d1890912', 'Membership Dashboard', 'Alerts that appear on the Membership dashboard in the Staff site', 0, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:12:39', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '15a241b2-a762-4d0b-a6bd-474265d0858a')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('15a241b2-a762-4d0b-a6bd-474265d0858a', 'Fundraising Dashboard', 'Alerts that appear on the Fundraising dashboard in the Staff site', 0, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:12:23', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '9bdcb97a-74e9-44f9-8572-662bcebef006')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('9bdcb97a-74e9-44f9-8572-662bcebef006', 'Member alerts', 'Alerts that display to public users on the home page and on their account page', 1, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:51:59', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '678ee017-9ff0-42dc-acb9-73f03e73e830')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('678ee017-9ff0-42dc-acb9-73f03e73e830', 'Events Dashboard', 'Alerts that appear on the Events dashboard in the Staff site', 0, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:12:06', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '973294cd-0bd2-45a0-9e22-b718b7096bd8')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('973294cd-0bd2-45a0-9e22-b718b7096bd8', 'Community Dashboard', 'Alerts that appear on the Community dashboard in the Staff site', 0, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:11:48', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:46:56')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '845f59db-52b9-4448-8209-c77b8fc1fe60')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('845f59db-52b9-4448-8209-c77b8fc1fe60', 'Staff account page alerts', 'Alerts that appear on the account page which staff users see', 1, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20140930 13:52:34', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '497e2174-fb50-430c-a8eb-d1a62a9d53be')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('497e2174-fb50-430c-a8eb-d1a62a9d53be', 'Commerce Dashboard', 'Alerts that appear on the Commerce dashboard in the Staff site', 0, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:11:33', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSet WHERE NotificationSetKey = '4efa2deb-c864-491d-8792-ea92b538a585')
BEGIN
    INSERT INTO NotificationSet (NotificationSetKey, NotificationSetName, NotificationSetDesc, NotificationSetLimitUserView, NotificationSetIsSystem, NotificationSetIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('4efa2deb-c864-491d-8792-ea92b538a585', 'Staff organization account page alerts', 'Alerts that appear on the organization account page which staff users see', 1, 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:47', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:19:55')
END
GO

SET NOCOUNT OFF

SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '5e5c5099-899a-4d72-ae29-012efec961b7')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5e5c5099-899a-4d72-ae29-012efec961b7', '678ee017-9ff0-42dc-acb9-73f03e73e830', '4a039901-d1e1-47e7-8fa8-432ea99ae46f', 5, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '0479ba8b-4717-455b-9c44-15003b0ceabb')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('0479ba8b-4717-455b-9c44-15003b0ceabb', '9bdcb97a-74e9-44f9-8572-662bcebef006', '5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0', 2, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '001d7319-4eb5-4ed2-be87-220739e57101')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('001d7319-4eb5-4ed2-be87-220739e57101', '9bdcb97a-74e9-44f9-8572-662bcebef006', '81a688aa-25fb-47ee-92a7-03d006cb1c44', 0, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '7f96087d-67ee-4be7-ab9c-2a12d325d796')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('7f96087d-67ee-4be7-ab9c-2a12d325d796', '4efa2deb-c864-491d-8792-ea92b538a585', 'e6bb9114-8528-48a2-94fd-579bef13fa0b', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:19:55', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:19:55')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '06c7ac39-838d-497d-939a-339b3661fd2e')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('06c7ac39-838d-497d-939a-339b3661fd2e', '15a241b2-a762-4d0b-a6bd-474265d0858a', '49f51017-953c-4f12-a107-5dd9943582d2', 2, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '7d76278a-635c-4337-be02-359c41c78188')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('7d76278a-635c-4337-be02-359c41c78188', '678ee017-9ff0-42dc-acb9-73f03e73e830', 'c7885c31-d6cd-4926-9a7a-f1d6043543a9', 3, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = 'a136c6f9-711d-4821-b527-3a802b48e2d2')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('a136c6f9-711d-4821-b527-3a802b48e2d2', '678ee017-9ff0-42dc-acb9-73f03e73e830', '7cb6e609-ba30-4cd8-9dff-de1e6f641595', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '88ae2604-a76a-4e41-a1dc-43b7c3a55fa6')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('88ae2604-a76a-4e41-a1dc-43b7c3a55fa6', '497e2174-fb50-430c-a8eb-d1a62a9d53be', '90976f5d-7269-4f7c-ba38-73a7842fe3b4', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '5456d17a-d6d0-406e-9be5-569825e6aa50')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5456d17a-d6d0-406e-9be5-569825e6aa50', '0cf4d85a-9925-4c3b-b86a-2936640e1031', 'e6bb9114-8528-48a2-94fd-579bef13fa0b', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:18', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:18')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '5468e1a2-87e1-4a8d-a022-62b6ab191473')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5468e1a2-87e1-4a8d-a022-62b6ab191473', '497e2174-fb50-430c-a8eb-d1a62a9d53be', '51a9559c-a438-4598-b722-100b7c5f0d7e', 2, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = 'efdc5d30-de39-4395-910d-70a649025c91')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('efdc5d30-de39-4395-910d-70a649025c91', '62b8f1c9-aab9-4841-917d-32f8ff532944', '168a405d-9a9e-4b70-affe-fa3d7e409b80', 0, 0, '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46', '7540a41c-977c-4f3a-8621-f1bc9cd3bbd6', '20150707 15:28:46')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = 'e1955255-0a79-42c7-960d-718a903c44f9')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('e1955255-0a79-42c7-960d-718a903c44f9', '15a241b2-a762-4d0b-a6bd-474265d0858a', 'e7561f7e-3635-414b-8bdd-386ea876b4c3', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '226a54a0-c364-4c5f-aae3-7839be221249')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('226a54a0-c364-4c5f-aae3-7839be221249', '845f59db-52b9-4448-8209-c77b8fc1fe60', 'e6bb9114-8528-48a2-94fd-579bef13fa0b', 1, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '26c13afc-dfb2-47e9-bc9c-7ab10c8a158a')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('26c13afc-dfb2-47e9-bc9c-7ab10c8a158a', '973294cd-0bd2-45a0-9e22-b718b7096bd8', '27f50f61-e6d7-4461-afc7-643dbf17ab4a', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:46:56', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:46:56')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '0f8bc33b-540b-4529-9093-7b61ea994605')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('0f8bc33b-540b-4529-9093-7b61ea994605', '9bdcb97a-74e9-44f9-8572-662bcebef006', 'e6bb9114-8528-48a2-94fd-579bef13fa0b', 1, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:38')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '821a793e-6803-4086-8ed8-7fc1c74cb566')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('821a793e-6803-4086-8ed8-7fc1c74cb566', '845f59db-52b9-4448-8209-c77b8fc1fe60', '81a688aa-25fb-47ee-92a7-03d006cb1c44', 0, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '9afbad1f-302e-4c1b-a02d-8698988257c6')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('9afbad1f-302e-4c1b-a02d-8698988257c6', '845f59db-52b9-4448-8209-c77b8fc1fe60', '20c696eb-b684-43c4-98af-aef826e0da4b', 3, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '069fdcb2-6ced-4ba3-af0a-89cd9a799343')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('069fdcb2-6ced-4ba3-af0a-89cd9a799343', '4606245e-9bbf-418a-9deb-3ab9d1890912', 'aaa4511b-caa4-4e33-b0ff-6f1c5ca02806', 3, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '4fb5cbbc-efbd-4383-b4f0-8eae298cb352')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('4fb5cbbc-efbd-4383-b4f0-8eae298cb352', '845f59db-52b9-4448-8209-c77b8fc1fe60', '5c0dcd19-cd4c-44bd-99ba-0b87eb1eabb0', 4, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '25e3d687-c25c-4955-acf8-92044c739111')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('25e3d687-c25c-4955-acf8-92044c739111', 'd32c2cb8-44c7-4243-8b8d-35a048ccf576', 'd577be59-2531-4947-b2cd-671de991a38b', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:50:44', '327cca4c-f450-49a9-bc5f-5f9228037177', '20141002 12:50:44')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = 'ed93b07f-5b8b-47e2-9532-92b4ab351ccc')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('ed93b07f-5b8b-47e2-9532-92b4ab351ccc', '0cf4d85a-9925-4c3b-b86a-2936640e1031', '81a688aa-25fb-47ee-92a7-03d006cb1c44', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:18', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:18:18')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '490511ba-aeb1-4a31-a0a0-a1fdbec6352c')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('490511ba-aeb1-4a31-a0a0-a1fdbec6352c', '4606245e-9bbf-418a-9deb-3ab9d1890912', '836d7b92-0fdb-4f6c-9319-b7c59d4525e9', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '06509790-5be7-47fe-9b88-a3e49c9baf30')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('06509790-5be7-47fe-9b88-a3e49c9baf30', '845f59db-52b9-4448-8209-c77b8fc1fe60', 'ef535a97-76f5-4c72-b0a1-e94681d38c99', 5, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '3909f690-0142-48c1-a84f-aec0e8ad6449')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('3909f690-0142-48c1-a84f-aec0e8ad6449', '678ee017-9ff0-42dc-acb9-73f03e73e830', '5fb57e67-9ecb-44ed-a759-b13edfbd285e', 6, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '599e7004-0e4f-4e8a-a2a5-b96b6220f6bd')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('599e7004-0e4f-4e8a-a2a5-b96b6220f6bd', '678ee017-9ff0-42dc-acb9-73f03e73e830', '8d312ffe-5661-4a5e-8d85-b2f33c450863', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '47e5cb9c-d9d4-4b80-9ac9-c5e293f254ad')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('47e5cb9c-d9d4-4b80-9ac9-c5e293f254ad', '678ee017-9ff0-42dc-acb9-73f03e73e830', '7b49886f-814c-45e8-ab19-233dd02dfa69', 4, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '0de84d40-c1f4-485a-a5db-d8fcbbc1b89c')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('0de84d40-c1f4-485a-a5db-d8fcbbc1b89c', '15a241b2-a762-4d0b-a6bd-474265d0858a', 'a39fd29d-32c1-4ce1-874b-e4c839209828', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:47')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '25618e0d-27f5-4fd2-8453-dfbcceb147f4')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('25618e0d-27f5-4fd2-8453-dfbcceb147f4', '678ee017-9ff0-42dc-acb9-73f03e73e830', 'ffcaf8ec-8d4a-4fbf-9540-a9fe380a86fe', 2, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:47:35')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '7ddae1f5-439d-4a2f-90ef-e24a84de928a')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('7ddae1f5-439d-4a2f-90ef-e24a84de928a', '4efa2deb-c864-491d-8792-ea92b538a585', '81a688aa-25fb-47ee-92a7-03d006cb1c44', 1, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:19:55', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150716 14:19:55')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = 'bf75b6fe-4ef5-4788-9380-ec1904563cee')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('bf75b6fe-4ef5-4788-9380-ec1904563cee', '4606245e-9bbf-418a-9deb-3ab9d1890912', '3ede8482-e141-4ae8-8689-474cc15d1425', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '0c67bbf7-a61a-4798-a535-eecfa5ebc608')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('0c67bbf7-a61a-4798-a535-eecfa5ebc608', '4606245e-9bbf-418a-9deb-3ab9d1890912', 'da3b20f6-0f3e-4816-affc-55e3e8d77904', 2, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150813 09:48:05')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '9b85f957-811a-4248-b272-f5dc26b7a895')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('9b85f957-811a-4248-b272-f5dc26b7a895', '845f59db-52b9-4448-8209-c77b8fc1fe60', 'aff2b818-cc19-44ed-a921-b40b9bb7f9ac', 2, 0, '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54', '879762ba-889b-432b-ae8b-3dac1a11af55', '20150819 16:03:54')
END
GO

IF NOT EXISTS (SELECT 1 FROM NotificationSetDetail WHERE NotificationSetDetailKey = '5adabc0f-a867-48ef-9780-f5e003642155')
BEGIN
    INSERT INTO NotificationSetDetail (NotificationSetDetailKey, NotificationSetKey, TaskDefinitionKey, NotificationSetDetailPriority, NotificationSetDetailIsDefault, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn)
    VALUES ('5adabc0f-a867-48ef-9780-f5e003642155', '497e2174-fb50-430c-a8eb-d1a62a9d53be', 'bf83275a-2965-4d7a-ac92-9335bb2519a1', 0, 0, '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06', '327cca4c-f450-49a9-bc5f-5f9228037177', '20150817 09:22:06')
END
GO

SET NOCOUNT OFF


DECLARE @managerKey uniqueidentifier;
SELECT @managerKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 
UPDATE t1 SET CreatedByUserKey = @managerKey FROM [dbo].[TaskDefinition] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[CreatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL
UPDATE t1 SET UpdatedByUserKey = @managerKey FROM [dbo].[TaskDefinition] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[UpdatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL
UPDATE t1 SET CreatedByUserKey = @managerKey FROM [dbo].[NotificationSet] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[CreatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL
UPDATE t1 SET UpdatedByUserKey = @managerKey FROM [dbo].[NotificationSet] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[UpdatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL
UPDATE t1 SET CreatedByUserKey = @managerKey FROM [dbo].[NotificationSetDetail] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[CreatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL
UPDATE t1 SET UpdatedByUserKey = @managerKey FROM [dbo].[NotificationSetDetail] t1 LEFT OUTER JOIN [UserMain] t2 ON t1.[UpdatedByUserKey] = t2.[UserKey] WHERE t2.[UserKey] IS NULL


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSet' AND [CONSTRAINT_NAME] = 'FK_NotificationSet_CreatedByUser')
    ALTER TABLE [dbo].[NotificationSet] WITH CHECK ADD CONSTRAINT [FK_NotificationSet_CreatedByUser]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NotificationSet] CHECK CONSTRAINT [FK_NotificationSet_CreatedByUser]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSet' AND [CONSTRAINT_NAME] = 'FK_NotificationSet_UpdatedByUser')
    ALTER TABLE [dbo].[NotificationSet] WITH CHECK ADD CONSTRAINT [FK_NotificationSet_UpdatedByUser]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NotificationSet] CHECK CONSTRAINT [FK_NotificationSet_UpdatedByUser]
go


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_CreatedByUser')
    ALTER TABLE [dbo].[NotificationSetDetail] WITH CHECK ADD CONSTRAINT [FK_NotificationSetDetail_CreatedByUser]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NotificationSetDetail] CHECK CONSTRAINT [FK_NotificationSetDetail_CreatedByUser]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_NotificationSet')
    ALTER TABLE [dbo].[NotificationSetDetail] WITH CHECK ADD CONSTRAINT [FK_NotificationSetDetail_NotificationSet]
    FOREIGN KEY (NotificationSetKey) REFERENCES [NotificationSet] (NotificationSetKey)
go
ALTER TABLE [dbo].[NotificationSetDetail] CHECK CONSTRAINT [FK_NotificationSetDetail_NotificationSet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_TaskDefinition')
    ALTER TABLE [dbo].[NotificationSetDetail] WITH CHECK ADD CONSTRAINT [FK_NotificationSetDetail_TaskDefinition]
    FOREIGN KEY (TaskDefinitionKey) REFERENCES [TaskDefinition] (TaskDefinitionKey)
go
ALTER TABLE [dbo].[NotificationSetDetail] CHECK CONSTRAINT [FK_NotificationSetDetail_TaskDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NotificationSetDetail' AND [CONSTRAINT_NAME] = 'FK_NotificationSetDetail_UpdatedByUser')
    ALTER TABLE [dbo].[NotificationSetDetail] WITH CHECK ADD CONSTRAINT [FK_NotificationSetDetail_UpdatedByUser]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NotificationSetDetail] CHECK CONSTRAINT [FK_NotificationSetDetail_UpdatedByUser]
go


