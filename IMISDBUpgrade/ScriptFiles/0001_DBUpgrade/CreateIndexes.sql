
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF

go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessArea]') AND [name] = N'PK_AccessArea')
BEGIN
  ALTER TABLE [dbo].[AccessArea]
  ADD CONSTRAINT PK_AccessArea PRIMARY KEY CLUSTERED (AccessAreaKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'PK_AccessItem')
BEGIN
  ALTER TABLE [dbo].[AccessItem]
  ADD CONSTRAINT PK_AccessItem PRIMARY KEY CLUSTERED (AccessKey, Grantee)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'AK_AccessItem_GroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_AccessItem_GroupKey ON [dbo].[AccessItem] (GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessMain]') AND [name] = N'PK_AccessMain')
BEGIN
  ALTER TABLE [dbo].[AccessMain]
  ADD CONSTRAINT PK_AccessMain PRIMARY KEY CLUSTERED (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccountingMethodRef]') AND [name] = N'PK_AccountingMethodRef')
BEGIN
  ALTER TABLE [dbo].[AccountingMethodRef]
  ADD CONSTRAINT PK_AccountingMethodRef PRIMARY KEY CLUSTERED (AccountingMethodCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccountPending]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[AccountPending] (LastName, Email)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AclPermissionTypeRef]') AND [name] = N'PK_AclPermissionTypeRef')
BEGIN
  ALTER TABLE [dbo].[AclPermissionTypeRef]
  ADD CONSTRAINT PK_AclPermissionTypeRef PRIMARY KEY CLUSTERED (AclPermissionTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AclPermissionTypeRef]') AND [name] = N'AK_AclPermissionTypeRef_AclPermissionTypeName')
BEGIN
  ALTER TABLE [dbo].[AclPermissionTypeRef]
  ADD CONSTRAINT AK_AclPermissionTypeRef_AclPermissionTypeName UNIQUE NONCLUSTERED (AclPermissionTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AclPermissionTypeRef]') AND [name] = N'AK_AclPermissionTypeRef_AclPermissionTypeDesc')
BEGIN
  ALTER TABLE [dbo].[AclPermissionTypeRef]
  ADD CONSTRAINT AK_AclPermissionTypeRef_AclPermissionTypeDesc UNIQUE NONCLUSTERED (AclPermissionTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ActionPlan]') AND [name] = N'PK_ActionPlan')
BEGIN
  ALTER TABLE [dbo].[ActionPlan]
  ADD CONSTRAINT PK_ActionPlan PRIMARY KEY CLUSTERED (ActionPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'PK_Activity')
BEGIN
  ALTER TABLE [dbo].[Activity]
  ADD CONSTRAINT PK_Activity PRIMARY KEY NONCLUSTERED (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityUF_5')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityUF_5 ON [dbo].[Activity] (UF_5)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityUF_4')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityUF_4 ON [dbo].[Activity] (UF_4)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityTRANSACTION_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityTRANSACTION_DATE ON [dbo].[Activity] (TRANSACTION_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityTICKLER_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityTICKLER_DATE ON [dbo].[Activity] (TICKLER_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySOURCE_SYSTEM')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySOURCE_SYSTEM ON [dbo].[Activity] (SOURCE_SYSTEM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySOURCE_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySOURCE_CODE ON [dbo].[Activity] (SOURCE_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySOLICITOR_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySOLICITOR_ID ON [dbo].[Activity] (SOLICITOR_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySeqnActivityTypeID')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySeqnActivityTypeID ON [dbo].[Activity] (SEQN, ID, ACTIVITY_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityPRODUCT_CODE ON [dbo].[Activity] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityORIGINATING_TRANS_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityORIGINATING_TRANS_NUM ON [dbo].[Activity] (ORIGINATING_TRANS_NUM, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityORG_CODE ON [dbo].[Activity] (ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityID')
BEGIN
  CREATE CLUSTERED INDEX iActivityID ON [dbo].[Activity] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityCO_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityCO_ID ON [dbo].[Activity] (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityCAMPAIGN_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityCAMPAIGN_CODE ON [dbo].[Activity] (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityADDITIONAL_NAME_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityADDITIONAL_NAME_ID ON [dbo].[Activity] (OTHER_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityACTIVITY_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityACTIVITY_TYPE ON [dbo].[Activity] (ACTIVITY_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity_Attach]') AND [name] = N'PK_Activity_Attach')
BEGIN
  ALTER TABLE [dbo].[Activity_Attach]
  ADD CONSTRAINT PK_Activity_Attach PRIMARY KEY NONCLUSTERED (ATTACH_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity_Attach]') AND [name] = N'iActivity_AttachACTIVITY_SEQN')
BEGIN
  CREATE CLUSTERED INDEX iActivity_AttachACTIVITY_SEQN ON [dbo].[Activity_Attach] (ACTIVITY_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity_tmpID]') AND [name] = N'iActivity_tmpIDUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iActivity_tmpIDUserID_Date ON [dbo].[Activity_tmpID] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ActivityImporter]') AND [name] = N'iActivityImporterUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityImporterUserID_Date ON [dbo].[ActivityImporter] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryPreferences]') AND [name] = N'PK_AddressCategoryPreferences')
BEGIN
  ALTER TABLE [dbo].[AddressCategoryPreferences]
  ADD CONSTRAINT PK_AddressCategoryPreferences PRIMARY KEY CLUSTERED (ContactKey, AddressCategoryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryRef]') AND [name] = N'PK_AddressCategoryRef')
BEGIN
  ALTER TABLE [dbo].[AddressCategoryRef]
  ADD CONSTRAINT PK_AddressCategoryRef PRIMARY KEY CLUSTERED (AddressCategoryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryRef]') AND [name] = N'AK_AddressCategoryRef_AddressCategoryName')
BEGIN
  ALTER TABLE [dbo].[AddressCategoryRef]
  ADD CONSTRAINT AK_AddressCategoryRef_AddressCategoryName UNIQUE NONCLUSTERED (AddressCategoryName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryRef]') AND [name] = N'AK_AddressCategoryRef_AddressCategoryDesc')
BEGIN
  ALTER TABLE [dbo].[AddressCategoryRef]
  ADD CONSTRAINT AK_AddressCategoryRef_AddressCategoryDesc UNIQUE NONCLUSTERED (AddressCategoryDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressFormatRef]') AND [name] = N'PK_AddressFormatRef')
BEGIN
  ALTER TABLE [dbo].[AddressFormatRef]
  ADD CONSTRAINT PK_AddressFormatRef PRIMARY KEY CLUSTERED (AddressFormatKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressFormatRef]') AND [name] = N'AK_AddressFormatRef_AddressFormatDesc')
BEGIN
  ALTER TABLE [dbo].[AddressFormatRef]
  ADD CONSTRAINT AK_AddressFormatRef_AddressFormatDesc UNIQUE NONCLUSTERED (AddressFormatDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressMain]') AND [name] = N'PK_AddressMain')
BEGIN
  ALTER TABLE [dbo].[AddressMain]
  ADD CONSTRAINT PK_AddressMain PRIMARY KEY CLUSTERED (AddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressMain]') AND [name] = N'IX_AddressMain_FormattedAddress')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AddressMain_FormattedAddress ON [dbo].[AddressMain] (FormattedAddress)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeContactType]') AND [name] = N'PK_AddressPurposeContactType')
BEGIN
  ALTER TABLE [dbo].[AddressPurposeContactType]
  ADD CONSTRAINT PK_AddressPurposeContactType PRIMARY KEY CLUSTERED (AddressPurposeContactTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeContactType]') AND [name] = N'AK_AddressPurposeContactType')
BEGIN
  ALTER TABLE [dbo].[AddressPurposeContactType]
  ADD CONSTRAINT AK_AddressPurposeContactType UNIQUE NONCLUSTERED (AddressPurposeKey, ContactTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeRef]') AND [name] = N'PK_AddressPurposeRef')
BEGIN
  ALTER TABLE [dbo].[AddressPurposeRef]
  ADD CONSTRAINT PK_AddressPurposeRef PRIMARY KEY CLUSTERED (AddressPurposeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeRef]') AND [name] = N'AK_AddressPurposeRef_AddressPurposeDesc')
BEGIN
  ALTER TABLE [dbo].[AddressPurposeRef]
  ADD CONSTRAINT AK_AddressPurposeRef_AddressPurposeDesc UNIQUE NONCLUSTERED (AddressPurposeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressStatusRef]') AND [name] = N'PK_AddressStatusRef')
BEGIN
  ALTER TABLE [dbo].[AddressStatusRef]
  ADD CONSTRAINT PK_AddressStatusRef PRIMARY KEY CLUSTERED (AddressStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressStatusRef]') AND [name] = N'AK_AddressStatusRef_AddressStatusDesc')
BEGIN
  ALTER TABLE [dbo].[AddressStatusRef]
  ADD CONSTRAINT AK_AddressStatusRef_AddressStatusDesc UNIQUE NONCLUSTERED (AddressStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressToUse]') AND [name] = N'PK_AddressToUse')
BEGIN
  ALTER TABLE [dbo].[AddressToUse]
  ADD CONSTRAINT PK_AddressToUse PRIMARY KEY CLUSTERED (ContactKey, CommunicationReasonKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressTypeRef]') AND [name] = N'PK_AddressTypeRef')
BEGIN
  ALTER TABLE [dbo].[AddressTypeRef]
  ADD CONSTRAINT PK_AddressTypeRef PRIMARY KEY CLUSTERED (AddressTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AddressTypeRef]') AND [name] = N'AK_AddressTypeRef_AddressTypeName')
BEGIN
  ALTER TABLE [dbo].[AddressTypeRef]
  ADD CONSTRAINT AK_AddressTypeRef_AddressTypeName UNIQUE NONCLUSTERED (AddressTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Section_Ref]') AND [name] = N'PK_Admin_Section_Ref')
BEGIN
  ALTER TABLE [dbo].[Admin_Section_Ref]
  ADD CONSTRAINT PK_Admin_Section_Ref PRIMARY KEY CLUSTERED (AdminSectionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Security]') AND [name] = N'PK_Admin_Security')
BEGIN
  ALTER TABLE [dbo].[Admin_Security]
  ADD CONSTRAINT PK_Admin_Security PRIMARY KEY CLUSTERED (ContactID, AdminSectionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AgingSchedule]') AND [name] = N'PK_AgingSchedule')
BEGIN
  ALTER TABLE [dbo].[AgingSchedule]
  ADD CONSTRAINT PK_AgingSchedule PRIMARY KEY CLUSTERED (AgingScheduleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AgingSchedule]') AND [name] = N'IX_AgingSchedule_FinancialEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AgingSchedule_FinancialEntityKey ON [dbo].[AgingSchedule] (FinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AgingScheduleCategory]') AND [name] = N'PK_AgingScheduleCategory')
BEGIN
  ALTER TABLE [dbo].[AgingScheduleCategory]
  ADD CONSTRAINT PK_AgingScheduleCategory PRIMARY KEY CLUSTERED (AgingScheduleCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AgingScheduleCategory]') AND [name] = N'IX_AgingScheduleCategory_AgingScheduleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AgingScheduleCategory_AgingScheduleKey ON [dbo].[AgingScheduleCategory] (AgingScheduleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Appeal]') AND [name] = N'iAppealCAMPAIGN_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iAppealCAMPAIGN_CODE ON [dbo].[Appeal] (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Appeal]') AND [name] = N'iAppealAPPEAL_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iAppealAPPEAL_CODE ON [dbo].[Appeal] (APPEAL_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Appeal_Premiums]') AND [name] = N'iAppeal_PremiumsPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iAppeal_PremiumsPRODUCT_CODE ON [dbo].[Appeal_Premiums] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Appeal_Premiums]') AND [name] = N'iAppeal_PremiumsAPPEAL_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iAppeal_PremiumsAPPEAL_CODE ON [dbo].[Appeal_Premiums] (APPEAL_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'PK_AppealMain')
BEGIN
  ALTER TABLE [dbo].[AppealMain]
  ADD CONSTRAINT PK_AppealMain PRIMARY KEY CLUSTERED (AppealKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'PK_AppealParticipation')
BEGIN
  ALTER TABLE [dbo].[AppealParticipation]
  ADD CONSTRAINT PK_AppealParticipation PRIMARY KEY CLUSTERED (AppealParticipationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_SourceCodeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_SourceCodeKey ON [dbo].[AppealParticipation] (SourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_SolicitationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_SolicitationKey ON [dbo].[AppealParticipation] (SolicitationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_RespondentUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_RespondentUserKey ON [dbo].[AppealParticipation] (RespondentUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_AppealKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_AppealKey ON [dbo].[AppealParticipation] (AppealKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealProduct]') AND [name] = N'PK_AppealProduct')
BEGIN
  ALTER TABLE [dbo].[AppealProduct]
  ADD CONSTRAINT PK_AppealProduct PRIMARY KEY CLUSTERED (AppealProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealStatusRef]') AND [name] = N'PK_AppealStatusRef')
BEGIN
  ALTER TABLE [dbo].[AppealStatusRef]
  ADD CONSTRAINT PK_AppealStatusRef PRIMARY KEY CLUSTERED (AppealStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsyncStatusMonitor]') AND [name] = N'PK_AsyncStatusMonitor')
BEGIN
  ALTER TABLE [dbo].[AsyncStatusMonitor]
  ADD CONSTRAINT PK_AsyncStatusMonitor PRIMARY KEY CLUSTERED (AsyncStatusMonitorKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'PK_AtomPanel')
BEGIN
  ALTER TABLE [dbo].[AtomPanel]
  ADD CONSTRAINT PK_AtomPanel PRIMARY KEY CLUSTERED (AtomPanelKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_ComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_ComponentKey ON [dbo].[AtomPanel] (ComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'AK_AtomPanel_AtomPanelName')
BEGIN
  ALTER TABLE [dbo].[AtomPanel]
  ADD CONSTRAINT AK_AtomPanel_AtomPanelName UNIQUE NONCLUSTERED (AtomPanelName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelFactoryStateRef]') AND [name] = N'PK_AtomPanelFactoryStateRef')
BEGIN
  ALTER TABLE [dbo].[AtomPanelFactoryStateRef]
  ADD CONSTRAINT PK_AtomPanelFactoryStateRef PRIMARY KEY CLUSTERED (AtomPanelFactoryStateCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelFactoryStateRef]') AND [name] = N'AK_AtomPanelFactoryStateRef_AtomPanelFactoryStateName')
BEGIN
  ALTER TABLE [dbo].[AtomPanelFactoryStateRef]
  ADD CONSTRAINT AK_AtomPanelFactoryStateRef_AtomPanelFactoryStateName UNIQUE NONCLUSTERED (AtomPanelFactoryStateName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelFactoryStateRef]') AND [name] = N'AK_AtomPanelFactoryStateRef_AtomPanelFactoryStateDesc')
BEGIN
  ALTER TABLE [dbo].[AtomPanelFactoryStateRef]
  ADD CONSTRAINT AK_AtomPanelFactoryStateRef_AtomPanelFactoryStateDesc UNIQUE NONCLUSTERED (AtomPanelFactoryStateDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelPurposeRef]') AND [name] = N'PK_AtomPanelPurposeRef')
BEGIN
  ALTER TABLE [dbo].[AtomPanelPurposeRef]
  ADD CONSTRAINT PK_AtomPanelPurposeRef PRIMARY KEY CLUSTERED (AtomPanelPurposeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelPurposeRef]') AND [name] = N'AK_AtomPanelPurposeRef_AtomPanelPurposeName')
BEGIN
  ALTER TABLE [dbo].[AtomPanelPurposeRef]
  ADD CONSTRAINT AK_AtomPanelPurposeRef_AtomPanelPurposeName UNIQUE NONCLUSTERED (AtomPanelPurposeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelPurposeRef]') AND [name] = N'AK_AtomPanelPurposeRef_AtomPanelPurposeDesc')
BEGIN
  ALTER TABLE [dbo].[AtomPanelPurposeRef]
  ADD CONSTRAINT AK_AtomPanelPurposeRef_AtomPanelPurposeDesc UNIQUE NONCLUSTERED (AtomPanelPurposeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelStatusRef]') AND [name] = N'PK_AtomPanelStatusRef')
BEGIN
  ALTER TABLE [dbo].[AtomPanelStatusRef]
  ADD CONSTRAINT PK_AtomPanelStatusRef PRIMARY KEY CLUSTERED (AtomPanelStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplate]') AND [name] = N'PK_AtomPanelTemplate')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTemplate]
  ADD CONSTRAINT PK_AtomPanelTemplate PRIMARY KEY CLUSTERED (WebsiteKey, AtomPanelTemplateTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplateTypeRef]') AND [name] = N'PK_AtomPanelTemplateTypeRef')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTemplateTypeRef]
  ADD CONSTRAINT PK_AtomPanelTemplateTypeRef PRIMARY KEY CLUSTERED (AtomPanelTemplateTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplateTypeRef]') AND [name] = N'AK_AtomPanelTemplateTypeRef_AtomPanelTemplateTypeName')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTemplateTypeRef]
  ADD CONSTRAINT AK_AtomPanelTemplateTypeRef_AtomPanelTemplateTypeName UNIQUE NONCLUSTERED (AtomPanelTemplateTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplateTypeRef]') AND [name] = N'AK_AtomPanelTemplateTypeRef_AtomPanelTemplateTypeDesc')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTemplateTypeRef]
  ADD CONSTRAINT AK_AtomPanelTemplateTypeRef_AtomPanelTemplateTypeDesc UNIQUE NONCLUSTERED (AtomPanelTemplateTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTypeRef]') AND [name] = N'PK_AtomPanelTypeRef')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTypeRef]
  ADD CONSTRAINT PK_AtomPanelTypeRef PRIMARY KEY CLUSTERED (AtomPanelTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTypeRef]') AND [name] = N'AK_AtomPanelTypeRef_AtomPanelTypeName')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTypeRef]
  ADD CONSTRAINT AK_AtomPanelTypeRef_AtomPanelTypeName UNIQUE NONCLUSTERED (AtomPanelTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTypeRef]') AND [name] = N'AK_AtomPanelTypeRef_AtomPanelTypeDesc')
BEGIN
  ALTER TABLE [dbo].[AtomPanelTypeRef]
  ADD CONSTRAINT AK_AtomPanelTypeRef_AtomPanelTypeDesc UNIQUE NONCLUSTERED (AtomPanelTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelWebsite]') AND [name] = N'PK_AtomPanelWebsite')
BEGIN
  ALTER TABLE [dbo].[AtomPanelWebsite]
  ADD CONSTRAINT PK_AtomPanelWebsite PRIMARY KEY CLUSTERED (AtomPanelKey, WebsiteKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BadAddressReasonRef]') AND [name] = N'PK_BadAddressReasonRef')
BEGIN
  ALTER TABLE [dbo].[BadAddressReasonRef]
  ADD CONSTRAINT PK_BadAddressReasonRef PRIMARY KEY CLUSTERED (BadAddressReasonKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Function]') AND [name] = N'PK_Basket_Function')
BEGIN
  ALTER TABLE [dbo].[Basket_Function]
  ADD CONSTRAINT PK_Basket_Function PRIMARY KEY CLUSTERED (ID, IP_ADDRESS, ST_ID, PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Meeting]') AND [name] = N'PK_Basket_Meeting')
BEGIN
  ALTER TABLE [dbo].[Basket_Meeting]
  ADD CONSTRAINT PK_Basket_Meeting PRIMARY KEY CLUSTERED (ID, IP_ADDRESS, ST_ID, MEETING)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Payment]') AND [name] = N'PK_Basket_Payment')
BEGIN
  ALTER TABLE [dbo].[Basket_Payment]
  ADD CONSTRAINT PK_Basket_Payment PRIMARY KEY CLUSTERED (ID, IP_ADDRESS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Batch]') AND [name] = N'iBatchSTATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iBatchSTATUS ON [dbo].[Batch] (STATUS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Batch]') AND [name] = N'iBatchDATE_CREATED')
BEGIN
  CREATE NONCLUSTERED INDEX iBatchDATE_CREATED ON [dbo].[Batch] (DATE_CREATED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Batch]') AND [name] = N'iBatchBATCH_NUM')
BEGIN
  CREATE CLUSTERED INDEX iBatchBATCH_NUM ON [dbo].[Batch] (BATCH_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchActionRef]') AND [name] = N'PK_BatchActionRef')
BEGIN
  ALTER TABLE [dbo].[BatchActionRef]
  ADD CONSTRAINT PK_BatchActionRef PRIMARY KEY CLUSTERED (BatchActionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchActionRef]') AND [name] = N'AK_BatchActionRef_BatchActionName')
BEGIN
  ALTER TABLE [dbo].[BatchActionRef]
  ADD CONSTRAINT AK_BatchActionRef_BatchActionName UNIQUE NONCLUSTERED (BatchActionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchActionRef]') AND [name] = N'AK_BatchActionRef_BatchActionDesc')
BEGIN
  ALTER TABLE [dbo].[BatchActionRef]
  ADD CONSTRAINT AK_BatchActionRef_BatchActionDesc UNIQUE NONCLUSTERED (BatchActionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchCriterionRef]') AND [name] = N'PK_BatchCriterionRef')
BEGIN
  ALTER TABLE [dbo].[BatchCriterionRef]
  ADD CONSTRAINT PK_BatchCriterionRef PRIMARY KEY CLUSTERED (BatchCriterionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchCriterionTemplate]') AND [name] = N'PK_BatchCriterionTemplate')
BEGIN
  ALTER TABLE [dbo].[BatchCriterionTemplate]
  ADD CONSTRAINT PK_BatchCriterionTemplate PRIMARY KEY CLUSTERED (BatchTypeCode, BatchCriterionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchInstance]') AND [name] = N'PK_BatchInstance')
BEGIN
  ALTER TABLE [dbo].[BatchInstance]
  ADD CONSTRAINT PK_BatchInstance PRIMARY KEY CLUSTERED (BatchKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchInstance]') AND [name] = N'IX_BatchNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchNumber ON [dbo].[BatchInstance] (BatchNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchInstanceControl]') AND [name] = N'PK_BatchInstanceControl')
BEGIN
  ALTER TABLE [dbo].[BatchInstanceControl]
  ADD CONSTRAINT PK_BatchInstanceControl PRIMARY KEY CLUSTERED (BatchKey, ControlName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchInstanceCriterion]') AND [name] = N'PK_BatchInstanceCriterion')
BEGIN
  ALTER TABLE [dbo].[BatchInstanceCriterion]
  ADD CONSTRAINT PK_BatchInstanceCriterion PRIMARY KEY CLUSTERED (BatchKey, ObjectName, AttributeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchLineStatusRef]') AND [name] = N'PK_BatchLineStatusRef')
BEGIN
  ALTER TABLE [dbo].[BatchLineStatusRef]
  ADD CONSTRAINT PK_BatchLineStatusRef PRIMARY KEY CLUSTERED (BatchLineStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchLineStatusRef]') AND [name] = N'AK_BatchLineStatusRef_BatchLineStatusName')
BEGIN
  ALTER TABLE [dbo].[BatchLineStatusRef]
  ADD CONSTRAINT AK_BatchLineStatusRef_BatchLineStatusName UNIQUE NONCLUSTERED (BatchLineStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchLineStatusRef]') AND [name] = N'AK_BatchLineStatusRef_BatchLineStatusDesc')
BEGIN
  ALTER TABLE [dbo].[BatchLineStatusRef]
  ADD CONSTRAINT AK_BatchLineStatusRef_BatchLineStatusDesc UNIQUE NONCLUSTERED (BatchLineStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchLookup]') AND [name] = N'PK_BatchLookup')
BEGIN
  ALTER TABLE [dbo].[BatchLookup]
  ADD CONSTRAINT PK_BatchLookup PRIMARY KEY CLUSTERED (BatchKey, BatchTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchLookup]') AND [name] = N'IX_BatchLookup')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_BatchLookup ON [dbo].[BatchLookup] (BatchTypeCode, LookupValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'PK_BatchSetup')
BEGIN
  ALTER TABLE [dbo].[BatchSetup]
  ADD CONSTRAINT PK_BatchSetup PRIMARY KEY CLUSTERED (BatchSetupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup ON [dbo].[BatchSetup] (DepartmentGroupKey, WorkObjectName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetupAction]') AND [name] = N'PK_BatchSetupAction')
BEGIN
  ALTER TABLE [dbo].[BatchSetupAction]
  ADD CONSTRAINT PK_BatchSetupAction PRIMARY KEY CLUSTERED (BatchSetupKey, BatchActionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetupControl]') AND [name] = N'PK_BatchSetupControl')
BEGIN
  ALTER TABLE [dbo].[BatchSetupControl]
  ADD CONSTRAINT PK_BatchSetupControl PRIMARY KEY CLUSTERED (BatchSetupKey, ControlName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetupCriterion]') AND [name] = N'PK_BatchSetupCriterion')
BEGIN
  ALTER TABLE [dbo].[BatchSetupCriterion]
  ADD CONSTRAINT PK_BatchSetupCriterion PRIMARY KEY CLUSTERED (BatchSetupCriterionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetupCriterion]') AND [name] = N'IX_BatchSetupCriterion_BatchSetupKey_ObjectName_AttributeName')
BEGIN
  ALTER TABLE [dbo].[BatchSetupCriterion]
  ADD CONSTRAINT IX_BatchSetupCriterion_BatchSetupKey_ObjectName_AttributeName UNIQUE NONCLUSTERED (BatchSetupKey, ObjectName, AttributeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchStatusRef]') AND [name] = N'PK_BatchStatusRef')
BEGIN
  ALTER TABLE [dbo].[BatchStatusRef]
  ADD CONSTRAINT PK_BatchStatusRef PRIMARY KEY CLUSTERED (BatchStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchStatusRef]') AND [name] = N'AK_BatchStatusRef_BatchStatusName')
BEGIN
  ALTER TABLE [dbo].[BatchStatusRef]
  ADD CONSTRAINT AK_BatchStatusRef_BatchStatusName UNIQUE NONCLUSTERED (BatchStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchStatusRef]') AND [name] = N'AK_BatchStatusRef_BatchStatusDesc')
BEGIN
  ALTER TABLE [dbo].[BatchStatusRef]
  ADD CONSTRAINT AK_BatchStatusRef_BatchStatusDesc UNIQUE NONCLUSTERED (BatchStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchTypeRef]') AND [name] = N'PK_BatchTypeRef')
BEGIN
  ALTER TABLE [dbo].[BatchTypeRef]
  ADD CONSTRAINT PK_BatchTypeRef PRIMARY KEY CLUSTERED (BatchTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchTypeRef]') AND [name] = N'AK_BatchTypeRef_BatchTypeName')
BEGIN
  ALTER TABLE [dbo].[BatchTypeRef]
  ADD CONSTRAINT AK_BatchTypeRef_BatchTypeName UNIQUE NONCLUSTERED (BatchTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchTypeRef]') AND [name] = N'AK_BatchTypeRef_BatchTypeDesc')
BEGIN
  ALTER TABLE [dbo].[BatchTypeRef]
  ADD CONSTRAINT AK_BatchTypeRef_BatchTypeDesc UNIQUE NONCLUSTERED (BatchTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'PK_CampaignMain')
BEGIN
  ALTER TABLE [dbo].[CampaignMain]
  ADD CONSTRAINT PK_CampaignMain PRIMARY KEY CLUSTERED (CampaignKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_PrimaryOwnerUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_PrimaryOwnerUserKey ON [dbo].[CampaignMain] (PrimaryOwnerUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'PK_CampaignParticipation')
BEGIN
  ALTER TABLE [dbo].[CampaignParticipation]
  ADD CONSTRAINT PK_CampaignParticipation PRIMARY KEY CLUSTERED (CampaignParticipationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_RespondentUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_RespondentUserKey ON [dbo].[CampaignParticipation] (RespondentUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_CampaignKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_CampaignKey ON [dbo].[CampaignParticipation] (CampaignKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignStatusRef]') AND [name] = N'PK_CampaignStatusRef')
BEGIN
  ALTER TABLE [dbo].[CampaignStatusRef]
  ADD CONSTRAINT PK_CampaignStatusRef PRIMARY KEY CLUSTERED (CampaignStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignTypeRef]') AND [name] = N'PK_CampaignTypeRef')
BEGIN
  ALTER TABLE [dbo].[CampaignTypeRef]
  ADD CONSTRAINT PK_CampaignTypeRef PRIMARY KEY CLUSTERED (CampaignTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cart]') AND [name] = N'PK_Cart')
BEGIN
  ALTER TABLE [dbo].[Cart]
  ADD CONSTRAINT PK_Cart PRIMARY KEY CLUSTERED (CartKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cart]') AND [name] = N'IX_Cart_UserId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Cart_UserId ON [dbo].[Cart] (UserId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cart]') AND [name] = N'IX_Cart_UpdatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Cart_UpdatedOn ON [dbo].[Cart] (UpdatedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cart]') AND [name] = N'IX_Cart_CreatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Cart_CreatedOn ON [dbo].[Cart] (CreatedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartBilling]') AND [name] = N'PK_CartBilling')
BEGIN
  ALTER TABLE [dbo].[CartBilling]
  ADD CONSTRAINT PK_CartBilling PRIMARY KEY CLUSTERED (CartBillingId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartBilling]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[CartBilling] (ProductCode, DuesType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') AND [name] = N'PK_CartEvent')
BEGIN
  ALTER TABLE [dbo].[CartEvent]
  ADD CONSTRAINT PK_CartEvent PRIMARY KEY CLUSTERED (CartEventID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[CartEvent] (RegistrantID, EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') AND [name] = N'PK_CartEventFunction')
BEGIN
  ALTER TABLE [dbo].[CartEventFunction]
  ADD CONSTRAINT PK_CartEventFunction PRIMARY KEY CLUSTERED (CartEventFunctionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[CartEventFunction] (FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartItem]') AND [name] = N'PK_CartItem')
BEGIN
  ALTER TABLE [dbo].[CartItem]
  ADD CONSTRAINT PK_CartItem PRIMARY KEY CLUSTERED (CartItemID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartItem]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[CartItem] (UserID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartOrder]') AND [name] = N'PK_CartOrder')
BEGIN
  ALTER TABLE [dbo].[CartOrder]
  ADD CONSTRAINT PK_CartOrder PRIMARY KEY CLUSTERED (CartOrderID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartOrder]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[CartOrder] (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cash_Accounts]') AND [name] = N'PK_Cash_Accounts')
BEGIN
  ALTER TABLE [dbo].[Cash_Accounts]
  ADD CONSTRAINT PK_Cash_Accounts PRIMARY KEY CLUSTERED (CASH_ACCOUNT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cash_Accounts]') AND [name] = N'iCash_AccountsACCOUNT_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iCash_AccountsACCOUNT_TYPE ON [dbo].[Cash_Accounts] (ACCOUNT_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CCAuthAcct]') AND [name] = N'PK_CCAuthAcct')
BEGIN
  ALTER TABLE [dbo].[CCAuthAcct]
  ADD CONSTRAINT PK_CCAuthAcct PRIMARY KEY CLUSTERED (CCAuthAcctCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Comp_Cat]') AND [name] = N'PK_Cert_Comp_Cat')
BEGIN
  ALTER TABLE [dbo].[Cert_Comp_Cat]
  ADD CONSTRAINT PK_Cert_Comp_Cat PRIMARY KEY NONCLUSTERED (CATEGORY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Prog_Lines]') AND [name] = N'PK_Cert_Prog_Lines')
BEGIN
  ALTER TABLE [dbo].[Cert_Prog_Lines]
  ADD CONSTRAINT PK_Cert_Prog_Lines PRIMARY KEY CLUSTERED (PROGRAM_ID, REQUIREMENT_TYPE, LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Prog_Lines]') AND [name] = N'iCert_Prog_LinesCOMPONENT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iCert_Prog_LinesCOMPONENT_CODE ON [dbo].[Cert_Prog_Lines] (COMPONENT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Prog_Lines]') AND [name] = N'iCert_Prog_LinesCOMPONENT_CATE')
BEGIN
  CREATE NONCLUSTERED INDEX iCert_Prog_LinesCOMPONENT_CATE ON [dbo].[Cert_Prog_Lines] (COMPONENT_CATEGORY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Program]') AND [name] = N'PK_Cert_Program')
BEGIN
  ALTER TABLE [dbo].[Cert_Program]
  ADD CONSTRAINT PK_Cert_Program PRIMARY KEY NONCLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Program]') AND [name] = N'iCert_ProgramSTATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iCert_ProgramSTATUS ON [dbo].[Cert_Program] (STATUS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Register]') AND [name] = N'PK_Cert_Register')
BEGIN
  ALTER TABLE [dbo].[Cert_Register]
  ADD CONSTRAINT PK_Cert_Register PRIMARY KEY NONCLUSTERED (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Register]') AND [name] = N'iCert_RegisterSTUDENT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iCert_RegisterSTUDENT_ID ON [dbo].[Cert_Register] (STUDENT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Register]') AND [name] = N'iCert_RegisterREGISTRATION_ITE')
BEGIN
  CREATE NONCLUSTERED INDEX iCert_RegisterREGISTRATION_ITE ON [dbo].[Cert_Register] (REGISTRATION_ITEM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModule]') AND [name] = N'PK_CertificationModule_CertificationModuleKey')
BEGIN
  ALTER TABLE [dbo].[CertificationModule]
  ADD CONSTRAINT PK_CertificationModule_CertificationModuleKey PRIMARY KEY CLUSTERED (CertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'PK_CertificationModuleGradeKey')
BEGIN
  ALTER TABLE [dbo].[CertificationModuleGrade]
  ADD CONSTRAINT PK_CertificationModuleGradeKey PRIMARY KEY CLUSTERED (CertificationModuleGradeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleProduct]') AND [name] = N'PK_CertificationModuleProduct')
BEGIN
  ALTER TABLE [dbo].[CertificationModuleProduct]
  ADD CONSTRAINT PK_CertificationModuleProduct PRIMARY KEY CLUSTERED (CertificationModuleProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') AND [name] = N'PK_CertificationModuleRegistration')
BEGIN
  ALTER TABLE [dbo].[CertificationModuleRegistration]
  ADD CONSTRAINT PK_CertificationModuleRegistration PRIMARY KEY CLUSTERED (CertificationModuleRegistrationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleStatusRef]') AND [name] = N'PK_CertificationModuleStatusRef_CertificationModuleStatusCode')
BEGIN
  ALTER TABLE [dbo].[CertificationModuleStatusRef]
  ADD CONSTRAINT PK_CertificationModuleStatusRef_CertificationModuleStatusCode PRIMARY KEY CLUSTERED (CertificationModuleStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'PK_CertificationProgram_CertificationProgramKey')
BEGIN
  ALTER TABLE [dbo].[CertificationProgram]
  ADD CONSTRAINT PK_CertificationProgram_CertificationProgramKey PRIMARY KEY CLUSTERED (CertificationProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramCertificationModule]') AND [name] = N'PK_CertificationProgramCertificationModule')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramCertificationModule]
  ADD CONSTRAINT PK_CertificationProgramCertificationModule PRIMARY KEY CLUSTERED (CertificationProgramCertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramProduct]') AND [name] = N'PK_CertificationProgramProduct')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramProduct]
  ADD CONSTRAINT PK_CertificationProgramProduct PRIMARY KEY CLUSTERED (CertificationProgramProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'PK_CertificationProgramRegistration')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramRegistration]
  ADD CONSTRAINT PK_CertificationProgramRegistration PRIMARY KEY CLUSTERED (CertificationProgramRegistrationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistrationCertificationModule]') AND [name] = N'PK_CertificationProgramRegistrationCertificationModule')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule]
  ADD CONSTRAINT PK_CertificationProgramRegistrationCertificationModule PRIMARY KEY CLUSTERED (CertificationProgramRegistrationCertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'PK_ChangeLog')
BEGIN
  ALTER TABLE [dbo].[ChangeLog]
  ADD CONSTRAINT PK_ChangeLog PRIMARY KEY NONCLUSTERED (ChangeLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'IX_ChangeLog_ObjectTypeName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ChangeLog_ObjectTypeName ON [dbo].[ChangeLog] (ObjectTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'IX_ChangeLog_ObjectKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ChangeLog_ObjectKey ON [dbo].[ChangeLog] (ObjectKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeProperty]') AND [name] = N'PK_ChangeProperty')
BEGIN
  ALTER TABLE [dbo].[ChangeProperty]
  ADD CONSTRAINT PK_ChangeProperty PRIMARY KEY CLUSTERED (ChangeLogKey, PropertyName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CheckCategoryRef]') AND [name] = N'PK_CheckCategoryRef')
BEGIN
  ALTER TABLE [dbo].[CheckCategoryRef]
  ADD CONSTRAINT PK_CheckCategoryRef PRIMARY KEY CLUSTERED (CheckCategoryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CheckCategoryRef]') AND [name] = N'AK_CheckTypeRef_CheckTypeName')
BEGIN
  ALTER TABLE [dbo].[CheckCategoryRef]
  ADD CONSTRAINT AK_CheckTypeRef_CheckTypeName UNIQUE NONCLUSTERED (CheckCategoryName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CheckCategoryRef]') AND [name] = N'AK_CheckTypeRef_CheckTypeDesc')
BEGIN
  ALTER TABLE [dbo].[CheckCategoryRef]
  ADD CONSTRAINT AK_CheckTypeRef_CheckTypeDesc UNIQUE NONCLUSTERED (CheckCategoryDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CM5MigrationVariableMapping]') AND [name] = N'PK_CM5ImportVariableMapping')
BEGIN
  ALTER TABLE [dbo].[CM5MigrationVariableMapping]
  ADD CONSTRAINT PK_CM5ImportVariableMapping PRIMARY KEY CLUSTERED (SystemConfigParameterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Administrators]') AND [name] = N'PK_Cmty_Administrators')
BEGIN
  ALTER TABLE [dbo].[Cmty_Administrators]
  ADD CONSTRAINT PK_Cmty_Administrators PRIMARY KEY CLUSTERED (COMMUNITY_SEQ, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Discussion_Forums]') AND [name] = N'PK_Cmty_Discussion_Forums')
BEGIN
  ALTER TABLE [dbo].[Cmty_Discussion_Forums]
  ADD CONSTRAINT PK_Cmty_Discussion_Forums PRIMARY KEY CLUSTERED (FORUM_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Discussion_Posts]') AND [name] = N'PK_Cmty_Discussion_Posts')
BEGIN
  ALTER TABLE [dbo].[Cmty_Discussion_Posts]
  ADD CONSTRAINT PK_Cmty_Discussion_Posts PRIMARY KEY CLUSTERED (POST_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Email_Notification]') AND [name] = N'PK_Cmty_Email_Notification')
BEGIN
  ALTER TABLE [dbo].[Cmty_Email_Notification]
  ADD CONSTRAINT PK_Cmty_Email_Notification PRIMARY KEY CLUSTERED (COMMUNITY_SEQ, ID, NOTIFICATION_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Invitees]') AND [name] = N'PK_Cmty_Invitees')
BEGIN
  ALTER TABLE [dbo].[Cmty_Invitees]
  ADD CONSTRAINT PK_Cmty_Invitees PRIMARY KEY CLUSTERED (COMMUNITY_SEQ, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_News]') AND [name] = N'PK_Cmty_News')
BEGIN
  ALTER TABLE [dbo].[Cmty_News]
  ADD CONSTRAINT PK_Cmty_News PRIMARY KEY CLUSTERED (NEWS_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Read_Tracking]') AND [name] = N'PK_Cmty_Read_Tracking')
BEGIN
  ALTER TABLE [dbo].[Cmty_Read_Tracking]
  ADD CONSTRAINT PK_Cmty_Read_Tracking PRIMARY KEY CLUSTERED (ID, COMMUNITY_SEQ, FORUM_SEQ, ITEM_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Shared_Files]') AND [name] = N'PK_Cmty_Shared_Files')
BEGIN
  ALTER TABLE [dbo].[Cmty_Shared_Files]
  ADD CONSTRAINT PK_Cmty_Shared_Files PRIMARY KEY CLUSTERED (FILE_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Shared_Folders]') AND [name] = N'PK_Cmty_Shared_Folders')
BEGIN
  ALTER TABLE [dbo].[Cmty_Shared_Folders]
  ADD CONSTRAINT PK_Cmty_Shared_Folders PRIMARY KEY CLUSTERED (FOLDER_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Shared_Folders]') AND [name] = N'iCmty_Shared_FoldersFOLDER_PAR')
BEGIN
  CREATE NONCLUSTERED INDEX iCmty_Shared_FoldersFOLDER_PAR ON [dbo].[Cmty_Shared_Folders] (FOLDER_PARENT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Subscription]') AND [name] = N'PK_Cmty_Subscription')
BEGIN
  ALTER TABLE [dbo].[Cmty_Subscription]
  ADD CONSTRAINT PK_Cmty_Subscription PRIMARY KEY CLUSTERED (COMMUNITY_SEQ, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Comment_Log]') AND [name] = N'PK_Comment_Log')
BEGIN
  ALTER TABLE [dbo].[Comment_Log]
  ADD CONSTRAINT PK_Comment_Log PRIMARY KEY NONCLUSTERED (COMMENT_LOG_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Comment_Log]') AND [name] = N'iComment_LogCOMMENT_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iComment_LogCOMMENT_TYPE ON [dbo].[Comment_Log] (COMMENT_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Comment_Types]') AND [name] = N'iComment_TypesCOMMENT_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iComment_TypesCOMMENT_TYPE ON [dbo].[Comment_Types] (COMMENT_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionCategory]') AND [name] = N'PK_CommissionCategory')
BEGIN
  ALTER TABLE [dbo].[CommissionCategory]
  ADD CONSTRAINT PK_CommissionCategory PRIMARY KEY CLUSTERED (CommissionCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionCategory]') AND [name] = N'AK_CommissionCategory_Name')
BEGIN
  ALTER TABLE [dbo].[CommissionCategory]
  ADD CONSTRAINT AK_CommissionCategory_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionPlan]') AND [name] = N'PK_CommissionPlan')
BEGIN
  ALTER TABLE [dbo].[CommissionPlan]
  ADD CONSTRAINT PK_CommissionPlan PRIMARY KEY CLUSTERED (CommissionPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionPlan]') AND [name] = N'AK_CommissionPlan_Name')
BEGIN
  ALTER TABLE [dbo].[CommissionPlan]
  ADD CONSTRAINT AK_CommissionPlan_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionPlanRate]') AND [name] = N'PK_CommissionPlanRate')
BEGIN
  ALTER TABLE [dbo].[CommissionPlanRate]
  ADD CONSTRAINT PK_CommissionPlanRate PRIMARY KEY CLUSTERED (CommissionPlanKey, CommissionCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionPlanRate]') AND [name] = N'IX_CommissionPlanRate_CommissionCategoryKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CommissionPlanRate_CommissionCategoryKey ON [dbo].[CommissionPlanRate] (CommissionCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionRateTypeRef]') AND [name] = N'PK_CommissionRateTypeRef')
BEGIN
  ALTER TABLE [dbo].[CommissionRateTypeRef]
  ADD CONSTRAINT PK_CommissionRateTypeRef PRIMARY KEY CLUSTERED (CommissionRateTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommissionRateTypeRef]') AND [name] = N'AK_CommissionRateTypeRef_CommissionRateTypeDesc')
BEGIN
  ALTER TABLE [dbo].[CommissionRateTypeRef]
  ADD CONSTRAINT AK_CommissionRateTypeRef_CommissionRateTypeDesc UNIQUE NONCLUSTERED (CommissionRateTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Commitment]') AND [name] = N'PK_Commitment')
BEGIN
  ALTER TABLE [dbo].[Commitment]
  ADD CONSTRAINT PK_Commitment PRIMARY KEY CLUSTERED (CommitmentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Commitment]') AND [name] = N'IX_Commitment_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Commitment_OrderLineKey ON [dbo].[Commitment] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Commitment]') AND [name] = N'IX_Commitment_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Commitment_OrderKey ON [dbo].[Commitment] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Commitment]') AND [name] = N'IX_Commitment_ExpirationDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Commitment_ExpirationDate ON [dbo].[Commitment] (ExpirationDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Committee_Minutes]') AND [name] = N'PK_Committee_Minutes')
BEGIN
  ALTER TABLE [dbo].[Committee_Minutes]
  ADD CONSTRAINT PK_Committee_Minutes PRIMARY KEY CLUSTERED (PRODUCT_CODE, MEETING_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Committee_Position]') AND [name] = N'iCommittee_PositionPOSITION_CO')
BEGIN
  CREATE CLUSTERED INDEX iCommittee_PositionPOSITION_CO ON [dbo].[Committee_Position] (POSITION_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CommunicationReasonRef]') AND [name] = N'PK_CommunicationReasonRef')
BEGIN
  ALTER TABLE [dbo].[CommunicationReasonRef]
  ADD CONSTRAINT PK_CommunicationReasonRef PRIMARY KEY CLUSTERED (CommunicationReasonKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Community]') AND [name] = N'iCommunitySEQ')
BEGIN
  CREATE CLUSTERED INDEX iCommunitySEQ ON [dbo].[Community] (COMMUNITY_SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CompanyNaicsSic]') AND [name] = N'PK_CompanyNaicsSic')
BEGIN
  ALTER TABLE [dbo].[CompanyNaicsSic]
  ADD CONSTRAINT PK_CompanyNaicsSic PRIMARY KEY CLUSTERED (ContactKey, NaicsSicCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CompanyNaicsSic]') AND [name] = N'IX_CompanyNaicsSic_NaicsSicCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CompanyNaicsSic_NaicsSicCode ON [dbo].[CompanyNaicsSic] (NaicsSicCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComparisonRef]') AND [name] = N'PK_ComparisonRef')
BEGIN
  ALTER TABLE [dbo].[ComparisonRef]
  ADD CONSTRAINT PK_ComparisonRef PRIMARY KEY CLUSTERED (ComparisonCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComparisonRef]') AND [name] = N'AK_ComparisonRef_ComparisonName')
BEGIN
  ALTER TABLE [dbo].[ComparisonRef]
  ADD CONSTRAINT AK_ComparisonRef_ComparisonName UNIQUE NONCLUSTERED (ComparisonName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComparisonRef]') AND [name] = N'AK_ComparisonRef_ComparisonDesc')
BEGIN
  ALTER TABLE [dbo].[ComparisonRef]
  ADD CONSTRAINT AK_ComparisonRef_ComparisonDesc UNIQUE NONCLUSTERED (ComparisonDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Email]') AND [name] = N'PK_Component_Email')
BEGIN
  ALTER TABLE [dbo].[Component_Email]
  ADD CONSTRAINT PK_Component_Email PRIMARY KEY CLUSTERED (ComponentCode, ComponentEmailCode, CustomForClientFlag)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Email_Variable_Ref]') AND [name] = N'PK_Component_Email_Variable_Ref')
BEGIN
  ALTER TABLE [dbo].[Component_Email_Variable_Ref]
  ADD CONSTRAINT PK_Component_Email_Variable_Ref PRIMARY KEY CLUSTERED (ComponentCode, ComponentEmailCode, ComponentEmailVariableCode, CustomForClientFlag)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Category]') AND [name] = N'PK_Component_Interest_Category')
BEGIN
  ALTER TABLE [dbo].[Component_Interest_Category]
  ADD CONSTRAINT PK_Component_Interest_Category PRIMARY KEY CLUSTERED (ComponentCode, InterestCategoryID, ComponentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Category]') AND [name] = N'ix_Component_Interest_Category_1')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Component_Interest_Category_1 ON [dbo].[Component_Interest_Category] (InterestCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Category]') AND [name] = N'ix_Component_Interest_Category')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Component_Interest_Category ON [dbo].[Component_Interest_Category] (ComponentCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Group]') AND [name] = N'PK_Component_Interest_Group')
BEGIN
  ALTER TABLE [dbo].[Component_Interest_Group]
  ADD CONSTRAINT PK_Component_Interest_Group PRIMARY KEY CLUSTERED (ComponentCode, InterestCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Ref]') AND [name] = N'PK_Component_Ref')
BEGIN
  ALTER TABLE [dbo].[Component_Ref]
  ADD CONSTRAINT PK_Component_Ref PRIMARY KEY CLUSTERED (ComponentCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Component_Script_Ref]') AND [name] = N'PK_Component_Script_Ref')
BEGIN
  ALTER TABLE [dbo].[Component_Script_Ref]
  ADD CONSTRAINT PK_Component_Script_Ref PRIMARY KEY CLUSTERED (ComponentCode, ComponentScriptCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentCategoryRef]') AND [name] = N'PK_ComponentCategoryRef')
BEGIN
  ALTER TABLE [dbo].[ComponentCategoryRef]
  ADD CONSTRAINT PK_ComponentCategoryRef PRIMARY KEY CLUSTERED (ComponentCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentCategoryRef]') AND [name] = N'AK_ComponentCategoryRef_ComponentCategoryDesc')
BEGIN
  ALTER TABLE [dbo].[ComponentCategoryRef]
  ADD CONSTRAINT AK_ComponentCategoryRef_ComponentCategoryDesc UNIQUE NONCLUSTERED (ComponentCategoryName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistry]') AND [name] = N'PK_ComponentRegistry')
BEGIN
  ALTER TABLE [dbo].[ComponentRegistry]
  ADD CONSTRAINT PK_ComponentRegistry PRIMARY KEY CLUSTERED (ComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistry]') AND [name] = N'IX_ComponentRegistry_Name_InterfaceName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ComponentRegistry_Name_InterfaceName ON [dbo].[ComponentRegistry] (Name, InterfaceName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistryCategory]') AND [name] = N'PK_ComponentRegistryCategory')
BEGIN
  ALTER TABLE [dbo].[ComponentRegistryCategory]
  ADD CONSTRAINT PK_ComponentRegistryCategory PRIMARY KEY CLUSTERED (ComponentKey, ComponentCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentResourceActionRef]') AND [name] = N'PK_ComponentResourceActionRef')
BEGIN
  ALTER TABLE [dbo].[ComponentResourceActionRef]
  ADD CONSTRAINT PK_ComponentResourceActionRef PRIMARY KEY CLUSTERED (ComponentKey, ResourceActionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactAddress]') AND [name] = N'PK_ContactAddress')
BEGIN
  ALTER TABLE [dbo].[ContactAddress]
  ADD CONSTRAINT PK_ContactAddress PRIMARY KEY CLUSTERED (ContactAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactAddress]') AND [name] = N'IX_ContactAddress_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactAddress_ContactKey ON [dbo].[ContactAddress] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactAddress]') AND [name] = N'IX_ContactAddress_AddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactAddress_AddressKey ON [dbo].[ContactAddress] (AddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactAddress]') AND [name] = N'AK_ContactAddress')
BEGIN
  ALTER TABLE [dbo].[ContactAddress]
  ADD CONSTRAINT AK_ContactAddress UNIQUE NONCLUSTERED (ContactKey, AddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactBiography]') AND [name] = N'PK_ContactBiography')
BEGIN
  ALTER TABLE [dbo].[ContactBiography]
  ADD CONSTRAINT PK_ContactBiography PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommerce]') AND [name] = N'PK_ContactCommerce')
BEGIN
  ALTER TABLE [dbo].[ContactCommerce]
  ADD CONSTRAINT PK_ContactCommerce PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommerce]') AND [name] = N'IX_ContactCommerce_TaxScheduleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactCommerce_TaxScheduleKey ON [dbo].[ContactCommerce] (TaxScheduleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommerce]') AND [name] = N'IX_ContactCommerce_SalesTeamGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactCommerce_SalesTeamGroupKey ON [dbo].[ContactCommerce] (SalesTeamGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommerce]') AND [name] = N'IX_ContactCommerce_PriceSheetKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactCommerce_PriceSheetKey ON [dbo].[ContactCommerce] (PriceSheetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommunicationReasonPreferences]') AND [name] = N'PK_ContactCommunicationReasonPreferences')
BEGIN
  ALTER TABLE [dbo].[ContactCommunicationReasonPreferences]
  ADD CONSTRAINT PK_ContactCommunicationReasonPreferences PRIMARY KEY CLUSTERED (ContactCommunicationReasonPreferencesKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommunicationReasonPreferences]') AND [name] = N'AK_ContactCommunicationReasonPreferences')
BEGIN
  ALTER TABLE [dbo].[ContactCommunicationReasonPreferences]
  ADD CONSTRAINT AK_ContactCommunicationReasonPreferences UNIQUE NONCLUSTERED (ContactKey, CommunicationReasonKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormula]') AND [name] = N'PK_ContactDuplicateCheckFormula')
BEGIN
  ALTER TABLE [dbo].[ContactDuplicateCheckFormula]
  ADD CONSTRAINT PK_ContactDuplicateCheckFormula PRIMARY KEY CLUSTERED (ContactDuplicateCheckFormulaKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormulaTypeRef]') AND [name] = N'PK_ContactDuplicateCheckFormulaTypeRef')
BEGIN
  ALTER TABLE [dbo].[ContactDuplicateCheckFormulaTypeRef]
  ADD CONSTRAINT PK_ContactDuplicateCheckFormulaTypeRef PRIMARY KEY CLUSTERED (ContactDuplicateCheckFormulaTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactEducation]') AND [name] = N'PK_ContactEducation')
BEGIN
  ALTER TABLE [dbo].[ContactEducation]
  ADD CONSTRAINT PK_ContactEducation PRIMARY KEY CLUSTERED (ContactEducationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactEducation]') AND [name] = N'IX_ContactEducation_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactEducation_ContactKey ON [dbo].[ContactEducation] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactFundraising]') AND [name] = N'PK_ContactFundraising')
BEGIN
  ALTER TABLE [dbo].[ContactFundraising]
  ADD CONSTRAINT PK_ContactFundraising PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') AND [name] = N'PK_ContactLog')
BEGIN
  ALTER TABLE [dbo].[ContactLog]
  ADD CONSTRAINT PK_ContactLog PRIMARY KEY CLUSTERED (ContactLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') AND [name] = N'IX_ContactLog_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactLog_ContactKey ON [dbo].[ContactLog] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'PK_ContactMain')
BEGIN
  ALTER TABLE [dbo].[ContactMain]
  ADD CONSTRAINT PK_ContactMain PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_TaxIDNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_TaxIDNumber ON [dbo].[ContactMain] (TaxIDNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_SyncContactID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_SyncContactID ON [dbo].[ContactMain] (SyncContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_SortName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_SortName ON [dbo].[ContactMain] (SortName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_MajorKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_MajorKey ON [dbo].[ContactMain] (MajorKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_IsInstitute')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_IsInstitute ON [dbo].[ContactMain] (IsInstitute) INCLUDE (SyncContactID, ContactKey, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_ID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_ID ON [dbo].[ContactMain] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_FullName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_FullName ON [dbo].[ContactMain] (FullName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'AK_ContactMain_PrimaryMembershipGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_ContactMain_PrimaryMembershipGroupKey ON [dbo].[ContactMain] (PrimaryMembershipGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactOffering]') AND [name] = N'PK_ContactOffering')
BEGIN
  ALTER TABLE [dbo].[ContactOffering]
  ADD CONSTRAINT PK_ContactOffering PRIMARY KEY CLUSTERED (ContactKey, ContactOfferingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactOfferingRef]') AND [name] = N'PK_ContactOfferingRef')
BEGIN
  ALTER TABLE [dbo].[ContactOfferingRef]
  ADD CONSTRAINT PK_ContactOfferingRef PRIMARY KEY CLUSTERED (ContactOfferingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactOfferingRef]') AND [name] = N'AK_ContactOfferingRef_ContactOfferingDesc')
BEGIN
  ALTER TABLE [dbo].[ContactOfferingRef]
  ADD CONSTRAINT AK_ContactOfferingRef_ContactOfferingDesc UNIQUE NONCLUSTERED (ContactOfferingDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactPicture]') AND [name] = N'PK_ContactPicture')
BEGIN
  ALTER TABLE [dbo].[ContactPicture]
  ADD CONSTRAINT PK_ContactPicture PRIMARY KEY CLUSTERED (ContactPictureKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactPicture]') AND [name] = N'IX_ContactPicture_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactPicture_ContactKey ON [dbo].[ContactPicture] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Contacts]') AND [name] = N'PK_Contacts')
BEGIN
  ALTER TABLE [dbo].[Contacts]
  ADD CONSTRAINT PK_Contacts PRIMARY KEY NONCLUSTERED (CONTACT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSalutation]') AND [name] = N'PK_ContactSalutation')
BEGIN
  ALTER TABLE [dbo].[ContactSalutation]
  ADD CONSTRAINT PK_ContactSalutation PRIMARY KEY CLUSTERED (ContactSalutationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSalutation]') AND [name] = N'AK_ContactSalutation')
BEGIN
  ALTER TABLE [dbo].[ContactSalutation]
  ADD CONSTRAINT AK_ContactSalutation UNIQUE NONCLUSTERED (ContactKey, SalutationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSkill]') AND [name] = N'PK_ContactSkill')
BEGIN
  ALTER TABLE [dbo].[ContactSkill]
  ADD CONSTRAINT PK_ContactSkill PRIMARY KEY CLUSTERED (ContactKey, ContactSkillKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSkillRef]') AND [name] = N'PK_ContactSkillRef')
BEGIN
  ALTER TABLE [dbo].[ContactSkillRef]
  ADD CONSTRAINT PK_ContactSkillRef PRIMARY KEY CLUSTERED (ContactSkillKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSkillRef]') AND [name] = N'AK_ContactSkillRef_ContactSkillDesc')
BEGIN
  ALTER TABLE [dbo].[ContactSkillRef]
  ADD CONSTRAINT AK_ContactSkillRef_ContactSkillDesc UNIQUE NONCLUSTERED (ContactSkillDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactStatusRef]') AND [name] = N'PK_ContactStatusRef')
BEGIN
  ALTER TABLE [dbo].[ContactStatusRef]
  ADD CONSTRAINT PK_ContactStatusRef PRIMARY KEY CLUSTERED (ContactStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactStatusRef]') AND [name] = N'AK_ContactStatusRef_ContactStatusDesc')
BEGIN
  ALTER TABLE [dbo].[ContactStatusRef]
  ADD CONSTRAINT AK_ContactStatusRef_ContactStatusDesc UNIQUE NONCLUSTERED (ContactStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactTypeRef]') AND [name] = N'PK_ContactTypeRef')
BEGIN
  ALTER TABLE [dbo].[ContactTypeRef]
  ADD CONSTRAINT PK_ContactTypeRef PRIMARY KEY CLUSTERED (ContactTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactTypeRef]') AND [name] = N'IX_ContactTypeRef')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactTypeRef ON [dbo].[ContactTypeRef] (ContactTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'PK_Content')
BEGIN
  ALTER TABLE [dbo].[Content]
  ADD CONSTRAINT PK_Content PRIMARY KEY CLUSTERED (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'ix_Content_PreviousContentID')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Content_PreviousContentID ON [dbo].[Content] (PreviousContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'ix_Content_OriginalContentID')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Content_OriginalContentID ON [dbo].[Content] (OriginalContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'ix_Content')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Content ON [dbo].[Content] (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'AK_Content_ContentID')
BEGIN
  ALTER TABLE [dbo].[Content]
  ADD CONSTRAINT AK_Content_ContentID UNIQUE NONCLUSTERED (ContentID)
END
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Change_Request' AND [CONSTRAINT_NAME] = 'FK_Content_Change_Request_Content')
    ALTER TABLE [dbo].[Content_Change_Request] WITH CHECK ADD CONSTRAINT [FK_Content_Change_Request_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Content')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Content]
    FOREIGN KEY (PreviousContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Content_OriginalContentID')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Content_OriginalContentID]
    FOREIGN KEY (OriginalContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_File' AND [CONSTRAINT_NAME] = 'FK_Content_File_Content')
    ALTER TABLE [dbo].[Content_File] WITH CHECK ADD CONSTRAINT [FK_Content_File_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_HTML' AND [CONSTRAINT_NAME] = 'FK_Content_HTML_Content')
    ALTER TABLE [dbo].[Content_HTML] WITH CHECK ADD CONSTRAINT [FK_Content_HTML_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Link' AND [CONSTRAINT_NAME] = 'FK_Content_Link_Content')
    ALTER TABLE [dbo].[Content_Link] WITH CHECK ADD CONSTRAINT [FK_Content_Link_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Security_Group' AND [CONSTRAINT_NAME] = 'FK_Content_Security_Group_Content')
    ALTER TABLE [dbo].[Content_Security_Group] WITH CHECK ADD CONSTRAINT [FK_Content_Security_Group_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_ContentWorkLog_Content')
    ALTER TABLE [dbo].[Content_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_ContentWorkLog_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_Content')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_PUBLISH__REFERENCE_CONTENT')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_PUBLISH__REFERENCE_CONTENT]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Interest_Category' AND [CONSTRAINT_NAME] = 'FK_TaggedPageInterestCategory_Content')
    ALTER TABLE [dbo].[Tagged_Page_Interest_Category] WITH CHECK ADD CONSTRAINT [FK_TaggedPageInterestCategory_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Group]') AND [name] = N'PK_Content_Authority_Group')
BEGIN
  ALTER TABLE [dbo].[Content_Authority_Group]
  ADD CONSTRAINT PK_Content_Authority_Group PRIMARY KEY CLUSTERED (ContentAuthorityGroupID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Producer]') AND [name] = N'PK_Content_Authority_Producer')
BEGIN
  ALTER TABLE [dbo].[Content_Authority_Producer]
  ADD CONSTRAINT PK_Content_Authority_Producer PRIMARY KEY CLUSTERED (ContentAuthorityGroupID, ContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Ref]') AND [name] = N'PK_Content_Authority_Ref')
BEGIN
  ALTER TABLE [dbo].[Content_Authority_Ref]
  ADD CONSTRAINT PK_Content_Authority_Ref PRIMARY KEY CLUSTERED (ContentAuthorityID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Change_Request]') AND [name] = N'PK_Content_Change_Request')
BEGIN
  ALTER TABLE [dbo].[Content_Change_Request]
  ADD CONSTRAINT PK_Content_Change_Request PRIMARY KEY CLUSTERED (ContentChangeRequestID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') AND [name] = N'PK_Content_File')
BEGIN
  ALTER TABLE [dbo].[Content_File]
  ADD CONSTRAINT PK_Content_File PRIMARY KEY CLUSTERED (ContentFileID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') AND [name] = N'ix_ContentFile_PreviousContentFileID')
BEGIN
  CREATE NONCLUSTERED INDEX ix_ContentFile_PreviousContentFileID ON [dbo].[Content_File] (PreviousContentFileID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') AND [name] = N'ix_ContentFile_OriginalContentFileID')
BEGIN
  CREATE NONCLUSTERED INDEX ix_ContentFile_OriginalContentFileID ON [dbo].[Content_File] (OriginalContentFileID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') AND [name] = N'ix_Content_File')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Content_File ON [dbo].[Content_File] (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_HTML]') AND [name] = N'PK_Content_HTML')
BEGIN
  ALTER TABLE [dbo].[Content_HTML]
  ADD CONSTRAINT PK_Content_HTML PRIMARY KEY CLUSTERED (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Link]') AND [name] = N'PK_Content_Link')
BEGIN
  ALTER TABLE [dbo].[Content_Link]
  ADD CONSTRAINT PK_Content_Link PRIMARY KEY CLUSTERED (ContentLinkID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Link]') AND [name] = N'ix_ContentLink_PreviousContentLinkID')
BEGIN
  CREATE NONCLUSTERED INDEX ix_ContentLink_PreviousContentLinkID ON [dbo].[Content_Link] (PreviousContentLinkID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Link]') AND [name] = N'ix_Content_Link')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Content_Link ON [dbo].[Content_Link] (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Pages]') AND [name] = N'PK_Content_Pages')
BEGIN
  ALTER TABLE [dbo].[Content_Pages]
  ADD CONSTRAINT PK_Content_Pages PRIMARY KEY NONCLUSTERED (PAGE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Pages]') AND [name] = N'iContent_PagesPAGE_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iContent_PagesPAGE_TYPE ON [dbo].[Content_Pages] (PAGE_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Security_Group]') AND [name] = N'PK_Content_Security_Group')
BEGIN
  ALTER TABLE [dbo].[Content_Security_Group]
  ADD CONSTRAINT PK_Content_Security_Group PRIMARY KEY CLUSTERED (ContentID, SecurityGroupCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'PK_ContentChangeRequest')
BEGIN
  ALTER TABLE [dbo].[ContentChangeRequest]
  ADD CONSTRAINT PK_ContentChangeRequest PRIMARY KEY CLUSTERED (ContentChangeRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentManagerAuthorityGroup]') AND [name] = N'PK_ContentManagerAuthorityGroup')
BEGIN
  ALTER TABLE [dbo].[ContentManagerAuthorityGroup]
  ADD CONSTRAINT PK_ContentManagerAuthorityGroup PRIMARY KEY CLUSTERED (GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentUserDefinedFieldValue]') AND [name] = N'PK_ContentUserDefinedFieldValue')
BEGIN
  ALTER TABLE [dbo].[ContentUserDefinedFieldValue]
  ADD CONSTRAINT PK_ContentUserDefinedFieldValue PRIMARY KEY CLUSTERED (ContentDocumentVersionKey, UserDefinedFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentWorkflowParameters]') AND [name] = N'PK_ContentWorkflowParameters')
BEGIN
  ALTER TABLE [dbo].[ContentWorkflowParameters]
  ADD CONSTRAINT PK_ContentWorkflowParameters PRIMARY KEY CLUSTERED (DocumentVersionKey, PublishedVersion)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostMethodRef]') AND [name] = N'PK_CostMethodRef')
BEGIN
  ALTER TABLE [dbo].[CostMethodRef]
  ADD CONSTRAINT PK_CostMethodRef PRIMARY KEY CLUSTERED (CostMethodCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostMethodRef]') AND [name] = N'AK_CostMethodRef_CostMethodName')
BEGIN
  ALTER TABLE [dbo].[CostMethodRef]
  ADD CONSTRAINT AK_CostMethodRef_CostMethodName UNIQUE NONCLUSTERED (CostMethodName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostMethodRef]') AND [name] = N'AK_CostMethodRef_CostMethodDesc')
BEGIN
  ALTER TABLE [dbo].[CostMethodRef]
  ADD CONSTRAINT AK_CostMethodRef_CostMethodDesc UNIQUE NONCLUSTERED (CostMethodDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostTier]') AND [name] = N'PK_CostTier')
BEGIN
  ALTER TABLE [dbo].[CostTier]
  ADD CONSTRAINT PK_CostTier PRIMARY KEY CLUSTERED (CostTierKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostTier]') AND [name] = N'IX_CostTier_ProductKey_WarehouseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CostTier_ProductKey_WarehouseKey ON [dbo].[CostTier] (ProductKey, WarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Counter]') AND [name] = N'PK_Counter')
BEGIN
  ALTER TABLE [dbo].[Counter]
  ADD CONSTRAINT PK_Counter PRIMARY KEY CLUSTERED (COUNTER_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Country_Addr_Layouts]') AND [name] = N'PK_Country_Addr_Layouts')
BEGIN
  ALTER TABLE [dbo].[Country_Addr_Layouts]
  ADD CONSTRAINT PK_Country_Addr_Layouts PRIMARY KEY NONCLUSTERED (ADDRESS_FORMAT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Country_Names]') AND [name] = N'PK_Country_Names')
BEGIN
  ALTER TABLE [dbo].[Country_Names]
  ADD CONSTRAINT PK_Country_Names PRIMARY KEY CLUSTERED (COUNTRY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Country_Names]') AND [name] = N'iCountry_NamesDEFAULT_SHIPPING')
BEGIN
  CREATE NONCLUSTERED INDEX iCountry_NamesDEFAULT_SHIPPING ON [dbo].[Country_Names] (DEFAULT_SHIPPING_METHOD)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'PK_CountryRef')
BEGIN
  ALTER TABLE [dbo].[CountryRef]
  ADD CONSTRAINT PK_CountryRef PRIMARY KEY CLUSTERED (CountryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'IX_CountryRef_ISO3DigitCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CountryRef_ISO3DigitCode ON [dbo].[CountryRef] (ISO3DigitCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'IX_CountryRef_DefaultShippingMethod')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CountryRef_DefaultShippingMethod ON [dbo].[CountryRef] (DefaultShippingMethod)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'AK_CountryRef_CountryName')
BEGIN
  ALTER TABLE [dbo].[CountryRef]
  ADD CONSTRAINT AK_CountryRef_CountryName UNIQUE NONCLUSTERED (CountryName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'AK_CountryRef_CountryKey')
BEGIN
  ALTER TABLE [dbo].[CountryRef]
  ADD CONSTRAINT AK_CountryRef_CountryKey UNIQUE NONCLUSTERED (CountryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CreditTypeRef]') AND [name] = N'PK_CreditTypeRef')
BEGIN
  ALTER TABLE [dbo].[CreditTypeRef]
  ADD CONSTRAINT PK_CreditTypeRef PRIMARY KEY CLUSTERED (CreditTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CultureRef]') AND [name] = N'PK_CultureRef')
BEGIN
  ALTER TABLE [dbo].[CultureRef]
  ADD CONSTRAINT PK_CultureRef PRIMARY KEY CLUSTERED (CultureCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CultureRef]') AND [name] = N'AK_CultureRef_CultureDesc')
BEGIN
  ALTER TABLE [dbo].[CultureRef]
  ADD CONSTRAINT AK_CultureRef_CultureDesc UNIQUE NONCLUSTERED (CultureDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Currency]') AND [name] = N'PK_Currency')
BEGIN
  ALTER TABLE [dbo].[Currency]
  ADD CONSTRAINT PK_Currency PRIMARY KEY CLUSTERED (CurrencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Currency]') AND [name] = N'AK_Currency_Name')
BEGIN
  ALTER TABLE [dbo].[Currency]
  ADD CONSTRAINT AK_Currency_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CurrencyConversion]') AND [name] = N'PK_CurrencyConversion')
BEGIN
  ALTER TABLE [dbo].[CurrencyConversion]
  ADD CONSTRAINT PK_CurrencyConversion PRIMARY KEY CLUSTERED (FromCurrencyCode, ToCurrencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'PK_CustomerExperience')
BEGIN
  ALTER TABLE [dbo].[CustomerExperience]
  ADD CONSTRAINT PK_CustomerExperience PRIMARY KEY CLUSTERED (CustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'PK_CustomerExperienceStatusChange_CustomerExperienceStatusChangeKey')
BEGIN
  ALTER TABLE [dbo].[CustomerExperienceStatusChange]
  ADD CONSTRAINT PK_CustomerExperienceStatusChange_CustomerExperienceStatusChangeKey PRIMARY KEY CLUSTERED (CustomerExperienceStatusChangeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusRef]') AND [name] = N'PK_CustomerExperienceStatusRef')
BEGIN
  ALTER TABLE [dbo].[CustomerExperienceStatusRef]
  ADD CONSTRAINT PK_CustomerExperienceStatusRef PRIMARY KEY CLUSTERED (CustomerExperienceStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomTabFields]') AND [name] = N'PK_CustomTabFields')
BEGIN
  ALTER TABLE [dbo].[CustomTabFields]
  ADD CONSTRAINT PK_CustomTabFields PRIMARY KEY CLUSTERED (SEQ, TABLE_NAME, FIELD_NAME, TITLE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Data_Type_Ref]') AND [name] = N'PK_Data_Type_Ref')
BEGIN
  ALTER TABLE [dbo].[Data_Type_Ref]
  ADD CONSTRAINT PK_Data_Type_Ref PRIMARY KEY CLUSTERED (DataTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataTypeRef]') AND [name] = N'PK_DataTypeRef')
BEGIN
  ALTER TABLE [dbo].[DataTypeRef]
  ADD CONSTRAINT PK_DataTypeRef PRIMARY KEY CLUSTERED (DataTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Deferral_Matrix]') AND [name] = N'PK_Deferral_Matrix')
BEGIN
  ALTER TABLE [dbo].[Deferral_Matrix]
  ADD CONSTRAINT PK_Deferral_Matrix PRIMARY KEY CLUSTERED (OrgCode, DeferredAccount, IncomeAccount, BeginningPeriod, Term)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Deferral_Matrix]') AND [name] = N'iDeferral_MatrixDeferredAccoun')
BEGIN
  CREATE NONCLUSTERED INDEX iDeferral_MatrixDeferredAccoun ON [dbo].[Deferral_Matrix] (DeferredAccount)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Deferral_Matrix]') AND [name] = N'iDeferral_MatrixBeginningPerio')
BEGIN
  CREATE NONCLUSTERED INDEX iDeferral_MatrixBeginningPerio ON [dbo].[Deferral_Matrix] (BeginningPeriod)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralIntervalTypeRef]') AND [name] = N'PK_DeferralIntervalTypeRef')
BEGIN
  ALTER TABLE [dbo].[DeferralIntervalTypeRef]
  ADD CONSTRAINT PK_DeferralIntervalTypeRef PRIMARY KEY CLUSTERED (DeferralIntervalTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralIntervalTypeRef]') AND [name] = N'AK_DeferralIntervalTypeRef_Desc')
BEGIN
  ALTER TABLE [dbo].[DeferralIntervalTypeRef]
  ADD CONSTRAINT AK_DeferralIntervalTypeRef_Desc UNIQUE NONCLUSTERED (DeferralIntervalTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrix]') AND [name] = N'PK_DeferralMatrix')
BEGIN
  ALTER TABLE [dbo].[DeferralMatrix]
  ADD CONSTRAINT PK_DeferralMatrix PRIMARY KEY CLUSTERED (DeferralMatrixKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrix]') AND [name] = N'IX_DeferralMatrix')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferralMatrix ON [dbo].[DeferralMatrix] (DeferredIncomeGLAccountCode, TargetGLAccountCode, FinancialEntityCode, OrganizationKey, DeferralTermsKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrixLine]') AND [name] = N'PK_DeferralMatrixLine')
BEGIN
  ALTER TABLE [dbo].[DeferralMatrixLine]
  ADD CONSTRAINT PK_DeferralMatrixLine PRIMARY KEY CLUSTERED (DeferralMatrixLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrixLine]') AND [name] = N'IX_DeferralMatrixLine_InvoiceNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferralMatrixLine_InvoiceNumber ON [dbo].[DeferralMatrixLine] (InvoiceNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrixLine]') AND [name] = N'IX_DeferralMatrixLine_InvoiceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferralMatrixLine_InvoiceKey ON [dbo].[DeferralMatrixLine] (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrixLine]') AND [name] = N'IX_DeferralMatrixLine_DeferralMatrixKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferralMatrixLine_DeferralMatrixKey ON [dbo].[DeferralMatrixLine] (DeferralMatrixKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralMatrixLineDetail]') AND [name] = N'PK_DeferralMatrixLineDetail')
BEGIN
  ALTER TABLE [dbo].[DeferralMatrixLineDetail]
  ADD CONSTRAINT PK_DeferralMatrixLineDetail PRIMARY KEY CLUSTERED (DeferralMatrixLineDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralTerms]') AND [name] = N'PK_DeferralTerms')
BEGIN
  ALTER TABLE [dbo].[DeferralTerms]
  ADD CONSTRAINT PK_DeferralTerms PRIMARY KEY CLUSTERED (DeferralTermsKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferralTerms]') AND [name] = N'AK_DeferralTerms_DeferralTermsCode')
BEGIN
  ALTER TABLE [dbo].[DeferralTerms]
  ADD CONSTRAINT AK_DeferralTerms_DeferralTermsCode UNIQUE NONCLUSTERED (DeferralTermsCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredConversionWork]') AND [name] = N'PK_DeferredConversionWork')
BEGIN
  ALTER TABLE [dbo].[DeferredConversionWork]
  ADD CONSTRAINT PK_DeferredConversionWork PRIMARY KEY CLUSTERED (DeferredConversionWorkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredIncomeWork]') AND [name] = N'PK_DeferredIncomeWork')
BEGIN
  ALTER TABLE [dbo].[DeferredIncomeWork]
  ADD CONSTRAINT PK_DeferredIncomeWork PRIMARY KEY CLUSTERED (DeferredIncomeWorkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeploymentPackageRef]') AND [name] = N'PK_DeploymentPackageRef')
BEGIN
  ALTER TABLE [dbo].[DeploymentPackageRef]
  ADD CONSTRAINT PK_DeploymentPackageRef PRIMARY KEY CLUSTERED (DeploymentPackageCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeploymentPackageRef]') AND [name] = N'AK_DeploymentPackageRef_DeploymentPackageDesc')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX AK_DeploymentPackageRef_DeploymentPackageDesc ON [dbo].[DeploymentPackageRef] (DeploymentPackageDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DialectGatewayAccount]') AND [name] = N'PK_DialectGatewayAccount')
BEGIN
  ALTER TABLE [dbo].[DialectGatewayAccount]
  ADD CONSTRAINT PK_DialectGatewayAccount PRIMARY KEY CLUSTERED (GatewayAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DiscountRule]') AND [name] = N'PK_DiscountRule')
BEGIN
  ALTER TABLE [dbo].[DiscountRule]
  ADD CONSTRAINT PK_DiscountRule PRIMARY KEY CLUSTERED (RuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'PK_DocumentMain')
BEGIN
  ALTER TABLE [dbo].[DocumentMain]
  ADD CONSTRAINT PK_DocumentMain PRIMARY KEY CLUSTERED (DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DefaultChildAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DefaultChildAccessKey ON [dbo].[DocumentMain] (DefaultChildAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'idx_DocumentMain_DocumentVersionKey')
BEGIN
  CREATE NONCLUSTERED INDEX idx_DocumentMain_DocumentVersionKey ON [dbo].[DocumentMain] (DocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'AK_DocumentMain_DefaultChildAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_DocumentMain_DefaultChildAccessKey ON [dbo].[DocumentMain] (DefaultChildAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStatusRef]') AND [name] = N'PK_DocumentStatusRef')
BEGIN
  ALTER TABLE [dbo].[DocumentStatusRef]
  ADD CONSTRAINT PK_DocumentStatusRef PRIMARY KEY CLUSTERED (DocumentStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStatusRef]') AND [name] = N'AK_DocumentStatusRef_DocumentStatusName')
BEGIN
  ALTER TABLE [dbo].[DocumentStatusRef]
  ADD CONSTRAINT AK_DocumentStatusRef_DocumentStatusName UNIQUE NONCLUSTERED (DocumentStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStatusRef]') AND [name] = N'AK_DocumentStatusRef_DocumentStatusDesc')
BEGIN
  ALTER TABLE [dbo].[DocumentStatusRef]
  ADD CONSTRAINT AK_DocumentStatusRef_DocumentStatusDesc UNIQUE NONCLUSTERED (DocumentStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') AND [name] = N'PK_DocumentStorage')
BEGIN
  ALTER TABLE [dbo].[DocumentStorage]
  ADD CONSTRAINT PK_DocumentStorage PRIMARY KEY CLUSTERED (DocumentStorageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'PK_DocumentTypeRef')
BEGIN
  ALTER TABLE [dbo].[DocumentTypeRef]
  ADD CONSTRAINT PK_DocumentTypeRef PRIMARY KEY CLUSTERED (DocumentTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'AK_DocumentTypeRefKey')
BEGIN
  ALTER TABLE [dbo].[DocumentTypeRef]
  ADD CONSTRAINT AK_DocumentTypeRefKey UNIQUE NONCLUSTERED (DocumentTypeRefKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'AK_DocumentTypeRef_DocumentTypeName')
BEGIN
  ALTER TABLE [dbo].[DocumentTypeRef]
  ADD CONSTRAINT AK_DocumentTypeRef_DocumentTypeName UNIQUE NONCLUSTERED (DocumentTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'AK_DocumentTypeRef_DocumentTypeDesc')
BEGIN
  ALTER TABLE [dbo].[DocumentTypeRef]
  ADD CONSTRAINT AK_DocumentTypeRef_DocumentTypeDesc UNIQUE NONCLUSTERED (DocumentTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iDonationReportTransactionDate ON [dbo].[DonationReport] (TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportOriginalTransac')
BEGIN
  CREATE CLUSTERED INDEX iDonationReportOriginalTransac ON [dbo].[DonationReport] (OriginalTransaction)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportIDTransactionDa')
BEGIN
  CREATE NONCLUSTERED INDEX iDonationReportIDTransactionDa ON [dbo].[DonationReport] (ID, TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DuesCycles]') AND [name] = N'PK_DuesCycles')
BEGIN
  ALTER TABLE [dbo].[DuesCycles]
  ADD CONSTRAINT PK_DuesCycles PRIMARY KEY CLUSTERED (CYCLE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DueToDueFrom]') AND [name] = N'iDueToDueFromSourceDestKey')
BEGIN
  CREATE NONCLUSTERED INDEX iDueToDueFromSourceDestKey ON [dbo].[DueToDueFrom] (SourceDestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Duplicate]') AND [name] = N'iSEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iSEQN ON [dbo].[Duplicate] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Duplicate_Group]') AND [name] = N'iSEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iSEQN ON [dbo].[Duplicate_Group] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EducationLevelRef]') AND [name] = N'PK_EducationLevelRef')
BEGIN
  ALTER TABLE [dbo].[EducationLevelRef]
  ADD CONSTRAINT PK_EducationLevelRef PRIMARY KEY CLUSTERED (EducationLevelCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Email_Contact]') AND [name] = N'PK_Email_Contact')
BEGIN
  ALTER TABLE [dbo].[Email_Contact]
  ADD CONSTRAINT PK_Email_Contact PRIMARY KEY CLUSTERED (EMailContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Error]') AND [name] = N'PK_Error')
BEGIN
  ALTER TABLE [dbo].[Error]
  ADD CONSTRAINT PK_Error PRIMARY KEY CLUSTERED (ErrorID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Error]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[Error] (ErrorDate, UserID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Evaluator]') AND [name] = N'PK_Evaluator')
BEGIN
  ALTER TABLE [dbo].[Evaluator]
  ADD CONSTRAINT PK_Evaluator PRIMARY KEY CLUSTERED (EvaluatorKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EvaluatorLevel]') AND [name] = N'PK_EvaluatorLevel')
BEGIN
  ALTER TABLE [dbo].[EvaluatorLevel]
  ADD CONSTRAINT PK_EvaluatorLevel PRIMARY KEY CLUSTERED (EvaluatorLevelKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EvaluatorReasonCodeRef]') AND [name] = N'PK_EvaluatorReasonCodeRef')
BEGIN
  ALTER TABLE [dbo].[EvaluatorReasonCodeRef]
  ADD CONSTRAINT PK_EvaluatorReasonCodeRef PRIMARY KEY CLUSTERED (EvaluatorReasonCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'PK_EventGuest')
BEGIN
  ALTER TABLE [dbo].[EventGuest]
  ADD CONSTRAINT PK_EventGuest PRIMARY KEY CLUSTERED (EventGuestID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[EventGuest] (GuestBadge, LastName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrant]') AND [name] = N'PK_EventRegistrant')
BEGIN
  ALTER TABLE [dbo].[EventRegistrant]
  ADD CONSTRAINT PK_EventRegistrant PRIMARY KEY CLUSTERED (RegistrantID, EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrant]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[EventRegistrant] (UserID, RegistrantClass, LastName, Email)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrationAnswer]') AND [name] = N'PK_EventRegistrationAnswer')
BEGIN
  ALTER TABLE [dbo].[EventRegistrationAnswer]
  ADD CONSTRAINT PK_EventRegistrationAnswer PRIMARY KEY CLUSTERED (EventCode, RegistrantID, QuestionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') AND [name] = N'PK_EventSetupFunctionGroup')
BEGIN
  ALTER TABLE [dbo].[EventSetupFunctionGroup]
  ADD CONSTRAINT PK_EventSetupFunctionGroup PRIMARY KEY CLUSTERED (EventCode, FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[EventSetupFunctionGroup] (GroupName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGeneral]') AND [name] = N'PK_EventSetupGeneral')
BEGIN
  ALTER TABLE [dbo].[EventSetupGeneral]
  ADD CONSTRAINT PK_EventSetupGeneral PRIMARY KEY CLUSTERED (EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGroup]') AND [name] = N'PK_EventSetupGroup')
BEGIN
  ALTER TABLE [dbo].[EventSetupGroup]
  ADD CONSTRAINT PK_EventSetupGroup PRIMARY KEY CLUSTERED (EventCode, GroupName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGuest]') AND [name] = N'PK_EventSetupGuest')
BEGIN
  ALTER TABLE [dbo].[EventSetupGuest]
  ADD CONSTRAINT PK_EventSetupGuest PRIMARY KEY CLUSTERED (EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupLabel]') AND [name] = N'PK_EventSetupLabel')
BEGIN
  ALTER TABLE [dbo].[EventSetupLabel]
  ADD CONSTRAINT PK_EventSetupLabel PRIMARY KEY CLUSTERED (EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestion]') AND [name] = N'PK_EventSetupQuestion')
BEGIN
  ALTER TABLE [dbo].[EventSetupQuestion]
  ADD CONSTRAINT PK_EventSetupQuestion PRIMARY KEY CLUSTERED (EventSetupQuestionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestion]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[EventSetupQuestion] (FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestionChoice]') AND [name] = N'PK_EventSetupQuestionChoice')
BEGIN
  ALTER TABLE [dbo].[EventSetupQuestionChoice]
  ADD CONSTRAINT PK_EventSetupQuestionChoice PRIMARY KEY CLUSTERED (EventSetupQuestionChoiceID, EventSetupQuestionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupRegistrant]') AND [name] = N'PK_EventSetupRegistrant')
BEGIN
  ALTER TABLE [dbo].[EventSetupRegistrant]
  ADD CONSTRAINT PK_EventSetupRegistrant PRIMARY KEY CLUSTERED (EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exchange_Rate]') AND [name] = N'iExchange_RatepkCurrencyCode')
BEGIN
  CREATE NONCLUSTERED INDEX iExchange_RatepkCurrencyCode ON [dbo].[Exchange_Rate] (CurrencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExchangeRateHistory]') AND [name] = N'iExchangeRateHistorypkExchange')
BEGIN
  CREATE NONCLUSTERED INDEX iExchangeRateHistorypkExchange ON [dbo].[ExchangeRateHistory] (Ex_Hist_Id)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExecutionModeRef]') AND [name] = N'PK_ExecutionModeRef')
BEGIN
  ALTER TABLE [dbo].[ExecutionModeRef]
  ADD CONSTRAINT PK_ExecutionModeRef PRIMARY KEY CLUSTERED (ExecutionModeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Booth]') AND [name] = N'iExhb_BoothID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_BoothID ON [dbo].[Exhb_Booth] (EXHB_ID, MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Booth]') AND [name] = N'iExhb_BoothBOOTH_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_BoothBOOTH_TYPE ON [dbo].[Exhb_Booth] (BOOTH_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Booth_Hist]') AND [name] = N'iExhb_Booth_HistEXHB_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_Booth_HistEXHB_ID ON [dbo].[Exhb_Booth_Hist] (EXHB_ID, MEET_ID, BOOTH_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Form]') AND [name] = N'iExhb_FormID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_FormID ON [dbo].[Exhb_Form] (EXHB_ID, MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Form_Master]') AND [name] = N'iExhb_Form_MasterID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Form_MasterID ON [dbo].[Exhb_Form_Master] (FORM_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet]') AND [name] = N'PK_Exhb_Meet')
BEGIN
  ALTER TABLE [dbo].[Exhb_Meet]
  ADD CONSTRAINT PK_Exhb_Meet PRIMARY KEY CLUSTERED (EXHB_ID, MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet_Contact]') AND [name] = N'iExhb_Meet_ContactID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Meet_ContactID ON [dbo].[Exhb_Meet_Contact] (EXHB_ID, MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet_Form]') AND [name] = N'iExhb_Meet_FormID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Meet_FormID ON [dbo].[Exhb_Meet_Form] (MEET_ID, FORM_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Order_Pymt]') AND [name] = N'iExhb_Order_PymtORDER_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_Order_PymtORDER_NUMBER ON [dbo].[Exhb_Order_Pymt] (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod]') AND [name] = N'iExhb_ProdID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_ProdID ON [dbo].[Exhb_Prod] (EXHB_ID, MEET_ID, PRODUCT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod_Con]') AND [name] = N'iExhb_Prod_ConPRODUCT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_Prod_ConPRODUCT_ID ON [dbo].[Exhb_Prod_Con] (PRODUCT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod_Mast]') AND [name] = N'iExhb_Prod_MastID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Prod_MastID ON [dbo].[Exhb_Prod_Mast] (PRODUCT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Reg]') AND [name] = N'iExhb_RegID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_RegID ON [dbo].[Exhb_Reg] (EXHB_ID, LAST_NAME, FIRST_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Script]') AND [name] = N'iExhb_ScriptSECT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_ScriptSECT_ID ON [dbo].[Exhb_Script] (SECT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Script]') AND [name] = N'iExhb_ScriptSCRIPT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_ScriptSCRIPT_ID ON [dbo].[Exhb_Script] (SCRIPT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Setup]') AND [name] = N'iExhb_SetupID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_SetupID ON [dbo].[Exhb_Setup] (MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Srvc_Comp]') AND [name] = N'iExhb_Srvc_CompCLUSTERMEC')
BEGIN
  CREATE NONCLUSTERED INDEX iExhb_Srvc_CompCLUSTERMEC ON [dbo].[Exhb_Srvc_Comp] (MEET_ID, EXHB_ID, CONT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Srvc_Contr]') AND [name] = N'iExhb_Srvc_ContrID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Srvc_ContrID ON [dbo].[Exhb_Srvc_Contr] (MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Upsell]') AND [name] = N'iExhb_UpsellID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_UpsellID ON [dbo].[Exhb_Upsell] (MEET_ID, PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Wait_List]') AND [name] = N'iExhb_Wait_ListID')
BEGIN
  CREATE CLUSTERED INDEX iExhb_Wait_ListID ON [dbo].[Exhb_Wait_List] (EXHB_ID, MEET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItemMEETING')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItemMEETING ON [dbo].[ExpenseItem] (MEETING)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItemFUND')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItemFUND ON [dbo].[ExpenseItem] (FUND)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItemEXPENSE_SEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItemEXPENSE_SEQN ON [dbo].[ExpenseItem] (EXPENSE_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItemCAMPAIGN_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItemCAMPAIGN_CODE ON [dbo].[ExpenseItem] (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItemAPPEAL_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItemAPPEAL_CODE ON [dbo].[ExpenseItem] (APPEAL_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') AND [name] = N'iExpenseItem6')
BEGIN
  CREATE NONCLUSTERED INDEX iExpenseItem6 ON [dbo].[ExpenseItem] (EXPENSE_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') AND [name] = N'PK_ExperienceDefinition_ExperienceDefinitionKey')
BEGIN
  ALTER TABLE [dbo].[ExperienceDefinition]
  ADD CONSTRAINT PK_ExperienceDefinition_ExperienceDefinitionKey PRIMARY KEY CLUSTERED (ExperienceDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinitionStatusRef]') AND [name] = N'PK_ExperienceDefinitionStatusRef_ExperienceDefinitionStatusCode')
BEGIN
  ALTER TABLE [dbo].[ExperienceDefinitionStatusRef]
  ADD CONSTRAINT PK_ExperienceDefinitionStatusRef_ExperienceDefinitionStatusCode PRIMARY KEY CLUSTERED (ExperienceDefinitionStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Expo_Reg_Class]') AND [name] = N'PK_Expo_Reg_Class')
BEGIN
  ALTER TABLE [dbo].[Expo_Reg_Class]
  ADD CONSTRAINT PK_Expo_Reg_Class PRIMARY KEY CLUSTERED (REGISTRANT_CLASS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') AND [name] = N'PK_ExpoCad_Prod')
BEGIN
  ALTER TABLE [dbo].[ExpoCad_Prod]
  ADD CONSTRAINT PK_ExpoCad_Prod PRIMARY KEY NONCLUSTERED (Meet_ID, ExpoCad_Type)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') AND [name] = N'iExpoCad_ProdProduct_Code')
BEGIN
  CREATE NONCLUSTERED INDEX iExpoCad_ProdProduct_Code ON [dbo].[ExpoCad_Prod] (Product_Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') AND [name] = N'iExpoCad_ProdPremium_2')
BEGIN
  CREATE NONCLUSTERED INDEX iExpoCad_ProdPremium_2 ON [dbo].[ExpoCad_Prod] (Premium_2)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') AND [name] = N'iExpoCad_ProdPremium_1')
BEGIN
  CREATE NONCLUSTERED INDEX iExpoCad_ProdPremium_1 ON [dbo].[ExpoCad_Prod] (Premium_1)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') AND [name] = N'iExpoCad_ProdExpoCad_Type')
BEGIN
  CREATE NONCLUSTERED INDEX iExpoCad_ProdExpoCad_Type ON [dbo].[ExpoCad_Prod] (ExpoCad_Type)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExportType]') AND [name] = N'PK_ExportType')
BEGIN
  ALTER TABLE [dbo].[ExportType]
  ADD CONSTRAINT PK_ExportType PRIMARY KEY CLUSTERED (ExportTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExportType]') AND [name] = N'AK_ExportType_ExportType')
BEGIN
  ALTER TABLE [dbo].[ExportType]
  ADD CONSTRAINT AK_ExportType_ExportType UNIQUE NONCLUSTERED (ExportType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesign]') AND [name] = N'PK_FieldDesign')
BEGIN
  ALTER TABLE [dbo].[FieldDesign]
  ADD CONSTRAINT PK_FieldDesign PRIMARY KEY CLUSTERED (FieldDesignId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesign]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[FieldDesign] (TableName, FieldName, MemberTypes)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesignSectionLookup]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[FieldDesignSectionLookup] (TableName, FieldName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldSection]') AND [name] = N'PK_FieldSection')
BEGIN
  ALTER TABLE [dbo].[FieldSection]
  ADD CONSTRAINT PK_FieldSection PRIMARY KEY CLUSTERED (FieldSectionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldSection]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[FieldSection] (SectionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[File_Type_Ref]') AND [name] = N'PK_File_Type_Ref')
BEGIN
  ALTER TABLE [dbo].[File_Type_Ref]
  ADD CONSTRAINT PK_File_Type_Ref PRIMARY KEY CLUSTERED (FileTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FileTypeRef]') AND [name] = N'PK_FileTypeRef')
BEGIN
  ALTER TABLE [dbo].[FileTypeRef]
  ADD CONSTRAINT PK_FileTypeRef PRIMARY KEY CLUSTERED (FileTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntity]') AND [name] = N'PK_FinancialEntity')
BEGIN
  ALTER TABLE [dbo].[FinancialEntity]
  ADD CONSTRAINT PK_FinancialEntity PRIMARY KEY CLUSTERED (FinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntity]') AND [name] = N'AK_FinancialEntity_FinancialEntityName')
BEGIN
  ALTER TABLE [dbo].[FinancialEntity]
  ADD CONSTRAINT AK_FinancialEntity_FinancialEntityName UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntity]') AND [name] = N'AK_FinancialEntity_FinancialEntityCode')
BEGIN
  ALTER TABLE [dbo].[FinancialEntity]
  ADD CONSTRAINT AK_FinancialEntity_FinancialEntityCode UNIQUE NONCLUSTERED (FinancialEntityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityDueTo]') AND [name] = N'PK_FinancialEntityDueTo')
BEGIN
  ALTER TABLE [dbo].[FinancialEntityDueTo]
  ADD CONSTRAINT PK_FinancialEntityDueTo PRIMARY KEY CLUSTERED (FinancialEntityDueToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityGLAccount]') AND [name] = N'PK_FinancialEntityGLAccount')
BEGIN
  ALTER TABLE [dbo].[FinancialEntityGLAccount]
  ADD CONSTRAINT PK_FinancialEntityGLAccount PRIMARY KEY CLUSTERED (FinancialEntityGLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityGLAccount]') AND [name] = N'IX_FinancialEntityGLAccount_1')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FinancialEntityGLAccount_1 ON [dbo].[FinancialEntityGLAccount] (FinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityGLAccount]') AND [name] = N'IX_FinancialEntityGLAccount')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FinancialEntityGLAccount ON [dbo].[FinancialEntityGLAccount] (GLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FirstPaymentDateTypeRef]') AND [name] = N'PK_FirstPaymentDateTypeRef')
BEGIN
  ALTER TABLE [dbo].[FirstPaymentDateTypeRef]
  ADD CONSTRAINT PK_FirstPaymentDateTypeRef PRIMARY KEY CLUSTERED (FirstPaymentDateTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Dollar]') AND [name] = N'iFreight_DollarMIN_DOLLAR')
BEGIN
  CREATE NONCLUSTERED INDEX iFreight_DollarMIN_DOLLAR ON [dbo].[Freight_Dollar] (MIN_DOLLAR)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Qty]') AND [name] = N'iFreight_QtyMIN_QTY')
BEGIN
  CREATE NONCLUSTERED INDEX iFreight_QtyMIN_QTY ON [dbo].[Freight_Qty] (MIN_QTY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Rate]') AND [name] = N'PK_Freight_Rate')
BEGIN
  ALTER TABLE [dbo].[Freight_Rate]
  ADD CONSTRAINT PK_Freight_Rate PRIMARY KEY NONCLUSTERED (SHIP_METHOD, ZONE_ID, WEIGHT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'PK_FullAddress')
BEGIN
  ALTER TABLE [dbo].[FullAddress]
  ADD CONSTRAINT PK_FullAddress PRIMARY KEY CLUSTERED (FullAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_SalutationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_SalutationKey ON [dbo].[FullAddress] (SalutationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_PhysicalAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_PhysicalAddressKey ON [dbo].[FullAddress] (PhysicalAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_FaxAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_FaxAddressKey ON [dbo].[FullAddress] (FaxAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_EveningPhoneAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_EveningPhoneAddressKey ON [dbo].[FullAddress] (EveningPhoneAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_EmailAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_EmailAddressKey ON [dbo].[FullAddress] (EmailAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_DaytimePhoneAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_DaytimePhoneAddressKey ON [dbo].[FullAddress] (DaytimePhoneAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') AND [name] = N'IX_FullAddress_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FullAddress_ContactKey ON [dbo].[FullAddress] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') AND [name] = N'PK_Fund')
BEGIN
  ALTER TABLE [dbo].[Fund]
  ADD CONSTRAINT PK_Fund PRIMARY KEY CLUSTERED (FundKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundFamilyRef]') AND [name] = N'PK_FundFamilyRef')
BEGIN
  ALTER TABLE [dbo].[FundFamilyRef]
  ADD CONSTRAINT PK_FundFamilyRef PRIMARY KEY CLUSTERED (FundFamilyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundFundType]') AND [name] = N'PK_FundFundType')
BEGIN
  ALTER TABLE [dbo].[FundFundType]
  ADD CONSTRAINT PK_FundFundType PRIMARY KEY CLUSTERED (FundFundTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundraisingPreferenceRef]') AND [name] = N'PK_FundraisingPreferenceRef')
BEGIN
  ALTER TABLE [dbo].[FundraisingPreferenceRef]
  ADD CONSTRAINT PK_FundraisingPreferenceRef PRIMARY KEY CLUSTERED (FundraisingPreferenceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundTypeRef]') AND [name] = N'PK_FundTypeRef')
BEGIN
  ALTER TABLE [dbo].[FundTypeRef]
  ADD CONSTRAINT PK_FundTypeRef PRIMARY KEY CLUSTERED (FundTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundTypeRef]') AND [name] = N'AK_FundTypeRef_FundTypeDesc')
BEGIN
  ALTER TABLE [dbo].[FundTypeRef]
  ADD CONSTRAINT AK_FundTypeRef_FundTypeDesc UNIQUE NONCLUSTERED (Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayAccount]') AND [name] = N'PK_GatewayAccount')
BEGIN
  ALTER TABLE [dbo].[GatewayAccount]
  ADD CONSTRAINT PK_GatewayAccount PRIMARY KEY CLUSTERED (GatewayAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayResultRef]') AND [name] = N'PK_GatewayResultRef')
BEGIN
  ALTER TABLE [dbo].[GatewayResultRef]
  ADD CONSTRAINT PK_GatewayResultRef PRIMARY KEY CLUSTERED (GatewayResultCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransaction]') AND [name] = N'PK_GatewayTransaction')
BEGIN
  ALTER TABLE [dbo].[GatewayTransaction]
  ADD CONSTRAINT PK_GatewayTransaction PRIMARY KEY CLUSTERED (GatewayTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransactionRef]') AND [name] = N'PK_GatewayTransactionRef')
BEGIN
  ALTER TABLE [dbo].[GatewayTransactionRef]
  ADD CONSTRAINT PK_GatewayTransactionRef PRIMARY KEY CLUSTERED (GatewayTransactionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransactionRef]') AND [name] = N'AK_GatewayTransactionRef_GatewayTransactionName')
BEGIN
  ALTER TABLE [dbo].[GatewayTransactionRef]
  ADD CONSTRAINT AK_GatewayTransactionRef_GatewayTransactionName UNIQUE NONCLUSTERED (GatewayTransactionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransactionRef]') AND [name] = N'AK_GatewayTransactionRef_GatewayTransactionDesc')
BEGIN
  ALTER TABLE [dbo].[GatewayTransactionRef]
  ADD CONSTRAINT AK_GatewayTransactionRef_GatewayTransactionDesc UNIQUE NONCLUSTERED (GatewayTransactionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTypeRef]') AND [name] = N'PK_GatewayTypeRef')
BEGIN
  ALTER TABLE [dbo].[GatewayTypeRef]
  ADD CONSTRAINT PK_GatewayTypeRef PRIMARY KEY CLUSTERED (GatewayTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Gen_Descriptions]') AND [name] = N'PK_Gen_Descriptions')
BEGIN
  ALTER TABLE [dbo].[Gen_Descriptions]
  ADD CONSTRAINT PK_Gen_Descriptions PRIMARY KEY NONCLUSTERED (TABLE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Gen_Tables]') AND [name] = N'PK_Gen_Tables')
BEGIN
  ALTER TABLE [dbo].[Gen_Tables]
  ADD CONSTRAINT PK_Gen_Tables PRIMARY KEY CLUSTERED (TABLE_NAME, CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Generic]') AND [name] = N'PK_Generic')
BEGIN
  ALTER TABLE [dbo].[Generic]
  ADD CONSTRAINT PK_Generic PRIMARY KEY CLUSTERED (GenericKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'PK_GenericLink')
BEGIN
  ALTER TABLE [dbo].[GenericLink]
  ADD CONSTRAINT PK_GenericLink PRIMARY KEY CLUSTERED (GenericLinkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_TargetKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_TargetKey ON [dbo].[GenericLink] (TargetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_SourceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_SourceKey ON [dbo].[GenericLink] (SourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimDetail]') AND [name] = N'PK_GiftAidClaimDetail')
BEGIN
  ALTER TABLE [dbo].[GiftAidClaimDetail]
  ADD CONSTRAINT PK_GiftAidClaimDetail PRIMARY KEY CLUSTERED (GiftAidClaimDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'PK_GiftAidClaimHeader')
BEGIN
  ALTER TABLE [dbo].[GiftAidClaimHeader]
  ADD CONSTRAINT PK_GiftAidClaimHeader PRIMARY KEY CLUSTERED (GiftAidClaimHeaderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'IX_GiftAidClaimHeader_Reference')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_GiftAidClaimHeader_Reference ON [dbo].[GiftAidClaimHeader] (Reference)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') AND [name] = N'PK_GiftAidDeclaration')
BEGIN
  ALTER TABLE [dbo].[GiftAidDeclaration]
  ADD CONSTRAINT PK_GiftAidDeclaration PRIMARY KEY CLUSTERED (GiftAidDeclarationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportTransactionDate ON [dbo].[GiftReport] (TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportOriginalTransaction')
BEGIN
  CREATE CLUSTERED INDEX iGiftReportOriginalTransaction ON [dbo].[GiftReport] (OriginalTransaction)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportIDTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportIDTransactionDate ON [dbo].[GiftReport] (ID, TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLAccount]') AND [name] = N'PK_GLAccount')
BEGIN
  ALTER TABLE [dbo].[GLAccount]
  ADD CONSTRAINT PK_GLAccount PRIMARY KEY CLUSTERED (GLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLAccount]') AND [name] = N'IX_GLAccount_FinancialEntity')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLAccount_FinancialEntity ON [dbo].[GLAccount] (FinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLAccount]') AND [name] = N'IX_GLAccount')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLAccount ON [dbo].[GLAccount] (GLAccountCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLAccountPurposeRef]') AND [name] = N'PK_GLAccountPurposeRef')
BEGIN
  ALTER TABLE [dbo].[GLAccountPurposeRef]
  ADD CONSTRAINT PK_GLAccountPurposeRef PRIMARY KEY CLUSTERED (GLAccountPurposeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLAccountPurposeRef]') AND [name] = N'AK_GLAccountPurposeRef_GLAccountPurposeDesc')
BEGIN
  ALTER TABLE [dbo].[GLAccountPurposeRef]
  ADD CONSTRAINT AK_GLAccountPurposeRef_GLAccountPurposeDesc UNIQUE NONCLUSTERED (GLAccountPurposeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLEntryTypeRef]') AND [name] = N'PK_GLEntryTypeRef')
BEGIN
  ALTER TABLE [dbo].[GLEntryTypeRef]
  ADD CONSTRAINT PK_GLEntryTypeRef PRIMARY KEY CLUSTERED (GLEntryTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLEntryTypeRef]') AND [name] = N'AK_GLEntryTypeRef_GLEntryTypeName')
BEGIN
  ALTER TABLE [dbo].[GLEntryTypeRef]
  ADD CONSTRAINT AK_GLEntryTypeRef_GLEntryTypeName UNIQUE NONCLUSTERED (GLEntryTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLEntryTypeRef]') AND [name] = N'AK_GLEntryTypeRef_GLEntryTypeDesc')
BEGIN
  ALTER TABLE [dbo].[GLEntryTypeRef]
  ADD CONSTRAINT AK_GLEntryTypeRef_GLEntryTypeDesc UNIQUE NONCLUSTERED (GLEntryTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLExport]') AND [name] = N'PK_GLExport')
BEGIN
  ALTER TABLE [dbo].[GLExport]
  ADD CONSTRAINT PK_GLExport PRIMARY KEY CLUSTERED (GLExportKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLExport]') AND [name] = N'i_GLExport_RunNumber')
BEGIN
  ALTER TABLE [dbo].[GLExport]
  ADD CONSTRAINT i_GLExport_RunNumber UNIQUE NONCLUSTERED (RunNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLExportItem]') AND [name] = N'PK_GLExportItem')
BEGIN
  ALTER TABLE [dbo].[GLExportItem]
  ADD CONSTRAINT PK_GLExportItem PRIMARY KEY CLUSTERED (GLExportKey, GLTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLExportItem]') AND [name] = N'i_GLExportItem_GLTransactionKey')
BEGIN
  ALTER TABLE [dbo].[GLExportItem]
  ADD CONSTRAINT i_GLExportItem_GLTransactionKey UNIQUE NONCLUSTERED (GLTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLExportSummaryLevelRef]') AND [name] = N'PK_GLExportSummaryLevelRef')
BEGIN
  ALTER TABLE [dbo].[GLExportSummaryLevelRef]
  ADD CONSTRAINT PK_GLExportSummaryLevelRef PRIMARY KEY CLUSTERED (GLExportSummaryLevelCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLSourceItemTypeRef]') AND [name] = N'PK_GLSourceItemTypeRef')
BEGIN
  ALTER TABLE [dbo].[GLSourceItemTypeRef]
  ADD CONSTRAINT PK_GLSourceItemTypeRef PRIMARY KEY CLUSTERED (GLSourceItemTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLSourceItemTypeRef]') AND [name] = N'AK_GLSourceItemType_GLSourceItemTypeDesc')
BEGIN
  ALTER TABLE [dbo].[GLSourceItemTypeRef]
  ADD CONSTRAINT AK_GLSourceItemType_GLSourceItemTypeDesc UNIQUE NONCLUSTERED (GLSourceItemTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionLine]') AND [name] = N'PK_GLTransactionLine')
BEGIN
  ALTER TABLE [dbo].[GLTransactionLine]
  ADD CONSTRAINT PK_GLTransactionLine PRIMARY KEY CLUSTERED (GLTransactionLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionLine]') AND [name] = N'IX_GLTransactionLine_GLTransactionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionLine_GLTransactionKey ON [dbo].[GLTransactionLine] (GLTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionLine]') AND [name] = N'IX_GLTransactionLine_GLAccountKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionLine_GLAccountKey ON [dbo].[GLTransactionLine] (GLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'PK_GLTransactionMain')
BEGIN
  ALTER TABLE [dbo].[GLTransactionMain]
  ADD CONSTRAINT PK_GLTransactionMain PRIMARY KEY CLUSTERED (GLTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'IX_GLTransactionMain_TransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionMain_TransactionDate ON [dbo].[GLTransactionMain] (TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'IX_GLTransactionMain_FiscalPeriod')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionMain_FiscalPeriod ON [dbo].[GLTransactionMain] (FiscalPeriod)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'IX_GLTransactionMain_FinancialEntity')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionMain_FinancialEntity ON [dbo].[GLTransactionMain] (FinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GradeRef]') AND [name] = N'PK_GradeRef')
BEGIN
  ALTER TABLE [dbo].[GradeRef]
  ADD CONSTRAINT PK_GradeRef PRIMARY KEY CLUSTERED (GradeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupInstanceRole]') AND [name] = N'PK_GroupInstanceRole')
BEGIN
  ALTER TABLE [dbo].[GroupInstanceRole]
  ADD CONSTRAINT PK_GroupInstanceRole PRIMARY KEY CLUSTERED (GroupInstanceRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupInstanceRole]') AND [name] = N'AK_GroupInstanceRole')
BEGIN
  ALTER TABLE [dbo].[GroupInstanceRole]
  ADD CONSTRAINT AK_GroupInstanceRole UNIQUE NONCLUSTERED (GroupKey, GroupRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'PK_GroupMain')
BEGIN
  ALTER TABLE [dbo].[GroupMain]
  ADD CONSTRAINT PK_GroupMain PRIMARY KEY CLUSTERED (GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_OwnerAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_OwnerAccessKey ON [dbo].[GroupMain] (OwnerAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_OverrideOwnerGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_OverrideOwnerGroupKey ON [dbo].[GroupMain] (OverrideOwnerGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_Name ON [dbo].[GroupMain] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_AccessKey ON [dbo].[GroupMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'AK_GroupMain_OwnerAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_GroupMain_OwnerAccessKey ON [dbo].[GroupMain] (OwnerAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'AK_GroupMain_OverrideOwnerGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_GroupMain_OverrideOwnerGroupKey ON [dbo].[GroupMain] (OverrideOwnerGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'AK_GroupMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_GroupMain_AccessKey ON [dbo].[GroupMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'PK_GroupMember')
BEGIN
  ALTER TABLE [dbo].[GroupMember]
  ADD CONSTRAINT PK_GroupMember PRIMARY KEY CLUSTERED (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_MemberContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_MemberContactKey ON [dbo].[GroupMember] (MemberContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_GroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_GroupKey ON [dbo].[GroupMember] (GroupKey) INCLUDE (GroupMemberKey, MemberContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'PK_GroupMemberDetail')
BEGIN
  ALTER TABLE [dbo].[GroupMemberDetail]
  ADD CONSTRAINT PK_GroupMemberDetail PRIMARY KEY CLUSTERED (GroupMemberDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_TypeSpecificKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_TypeSpecificKey ON [dbo].[GroupMemberDetail] (TypeSpecificKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_GroupRoleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_GroupRoleKey ON [dbo].[GroupMemberDetail] (GroupRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_GroupMemberKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_GroupMemberKey ON [dbo].[GroupMemberDetail] (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_EffectiveDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_EffectiveDate ON [dbo].[GroupMemberDetail] (EffectiveDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'AK_GroupMemberRoleDate')
BEGIN
  ALTER TABLE [dbo].[GroupMemberDetail]
  ADD CONSTRAINT AK_GroupMemberRoleDate UNIQUE NONCLUSTERED (GroupMemberKey, GroupRoleKey, EffectiveDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'AK_GroupMemberDetail_GroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_GroupMemberDetail_GroupKey ON [dbo].[GroupMemberDetail] (GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberOptions]') AND [name] = N'PK_GroupMemberOptions')
BEGIN
  ALTER TABLE [dbo].[GroupMemberOptions]
  ADD CONSTRAINT PK_GroupMemberOptions PRIMARY KEY CLUSTERED (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberStatusRef]') AND [name] = N'PK_GroupMemberStatusRef')
BEGIN
  ALTER TABLE [dbo].[GroupMemberStatusRef]
  ADD CONSTRAINT PK_GroupMemberStatusRef PRIMARY KEY CLUSTERED (GroupMemberStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberStatusRef]') AND [name] = N'AK_GroupMemberStatusRef_GroupMemberStatusDesc')
BEGIN
  ALTER TABLE [dbo].[GroupMemberStatusRef]
  ADD CONSTRAINT AK_GroupMemberStatusRef_GroupMemberStatusDesc UNIQUE NONCLUSTERED (GroupMemberStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupOpportunityType]') AND [name] = N'PK_GroupOpportunityType')
BEGIN
  ALTER TABLE [dbo].[GroupOpportunityType]
  ADD CONSTRAINT PK_GroupOpportunityType PRIMARY KEY CLUSTERED (GroupKey, OpportunityTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupPerspective]') AND [name] = N'PK_GroupPerspective')
BEGIN
  ALTER TABLE [dbo].[GroupPerspective]
  ADD CONSTRAINT PK_GroupPerspective PRIMARY KEY CLUSTERED (GroupPerspectiveKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupPerspective]') AND [name] = N'IX_GroupPerspective')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_GroupPerspective ON [dbo].[GroupPerspective] (GroupKey, PerspectiveKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupRoleRef]') AND [name] = N'PK_GroupRoleRef')
BEGIN
  ALTER TABLE [dbo].[GroupRoleRef]
  ADD CONSTRAINT PK_GroupRoleRef PRIMARY KEY CLUSTERED (GroupRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupRoleRef]') AND [name] = N'AK_GroupRoleRef_GroupRoleDesc')
BEGIN
  ALTER TABLE [dbo].[GroupRoleRef]
  ADD CONSTRAINT AK_GroupRoleRef_GroupRoleDesc UNIQUE NONCLUSTERED (GroupRoleDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupStatusRef]') AND [name] = N'PK_GroupStatusRef')
BEGIN
  ALTER TABLE [dbo].[GroupStatusRef]
  ADD CONSTRAINT PK_GroupStatusRef PRIMARY KEY CLUSTERED (GroupStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeMemberStatus]') AND [name] = N'PK_GroupTypeMemberStatus')
BEGIN
  ALTER TABLE [dbo].[GroupTypeMemberStatus]
  ADD CONSTRAINT PK_GroupTypeMemberStatus PRIMARY KEY CLUSTERED (GroupTypeMemberStatusKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeMemberStatus]') AND [name] = N'AK_GroupTypeMemberStatus')
BEGIN
  ALTER TABLE [dbo].[GroupTypeMemberStatus]
  ADD CONSTRAINT AK_GroupTypeMemberStatus UNIQUE NONCLUSTERED (GroupTypeKey, GroupMemberStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'PK_GroupTypeRef')
BEGIN
  ALTER TABLE [dbo].[GroupTypeRef]
  ADD CONSTRAINT PK_GroupTypeRef PRIMARY KEY CLUSTERED (GroupTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'AK_GroupTypeRef_GroupTypeName')
BEGIN
  ALTER TABLE [dbo].[GroupTypeRef]
  ADD CONSTRAINT AK_GroupTypeRef_GroupTypeName UNIQUE NONCLUSTERED (GroupTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRole]') AND [name] = N'PK_GroupTypeRole')
BEGIN
  ALTER TABLE [dbo].[GroupTypeRole]
  ADD CONSTRAINT PK_GroupTypeRole PRIMARY KEY CLUSTERED (GroupTypeRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRole]') AND [name] = N'AK_GroupTypeRole')
BEGIN
  ALTER TABLE [dbo].[GroupTypeRole]
  ADD CONSTRAINT AK_GroupTypeRole UNIQUE NONCLUSTERED (GroupTypeKey, GroupRoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HandlingPrice]') AND [name] = N'PK_HandlingPrice')
BEGIN
  ALTER TABLE [dbo].[HandlingPrice]
  ADD CONSTRAINT PK_HandlingPrice PRIMARY KEY CLUSTERED (HandlingPriceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HandlingPriceRef]') AND [name] = N'PK_HandlingPriceRef')
BEGIN
  ALTER TABLE [dbo].[HandlingPriceRef]
  ADD CONSTRAINT PK_HandlingPriceRef PRIMARY KEY CLUSTERED (HandlingPriceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HIControlTypeRef]') AND [name] = N'PK_HIControlTypeRef')
BEGIN
  ALTER TABLE [dbo].[HIControlTypeRef]
  ADD CONSTRAINT PK_HIControlTypeRef PRIMARY KEY CLUSTERED (HIControlTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'PK_Hierarchy')
BEGIN
  ALTER TABLE [dbo].[Hierarchy]
  ADD CONSTRAINT PK_Hierarchy PRIMARY KEY CLUSTERED (HierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_RootHierarchyKey_SortOrder')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_RootHierarchyKey_SortOrder ON [dbo].[Hierarchy] (RootHierarchyKey, SortOrder)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_RootHierarchyKey_ParentHierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_RootHierarchyKey_ParentHierarchyKey ON [dbo].[Hierarchy] (RootHierarchyKey, ParentHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_ParentHierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_ParentHierarchyKey ON [dbo].[Hierarchy] (ParentHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_HierarchyCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_HierarchyCode ON [dbo].[Hierarchy] (HierarchyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') AND [name] = N'PK_HierarchyRoot')
BEGIN
  ALTER TABLE [dbo].[HierarchyRoot]
  ADD CONSTRAINT PK_HierarchyRoot PRIMARY KEY CLUSTERED (RootHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[History]') AND [name] = N'PK_History')
BEGIN
  ALTER TABLE [dbo].[History]
  ADD CONSTRAINT PK_History PRIMARY KEY CLUSTERED (HistoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HoldCode]') AND [name] = N'PK_HoldCode')
BEGIN
  ALTER TABLE [dbo].[HoldCode]
  ADD CONSTRAINT PK_HoldCode PRIMARY KEY CLUSTERED (HoldCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HoldCode]') AND [name] = N'AK_HoldCode_Code_OrganizationKey')
BEGIN
  ALTER TABLE [dbo].[HoldCode]
  ADD CONSTRAINT AK_HoldCode_Code_OrganizationKey UNIQUE NONCLUSTERED (Code, OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hotel_Log]') AND [name] = N'iHotel_LogORDER_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iHotel_LogORDER_NUMBER ON [dbo].[Hotel_Log] (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hotel_Log]') AND [name] = N'iHotel_LogMEETING')
BEGIN
  CREATE NONCLUSTERED INDEX iHotel_LogMEETING ON [dbo].[Hotel_Log] (MEETING)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hotel_Log]') AND [name] = N'iHotel_LogHOTEL_LOG_NUMBER')
BEGIN
  CREATE CLUSTERED INDEX iHotel_LogHOTEL_LOG_NUMBER ON [dbo].[Hotel_Log] (HOTEL_LOG_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hotel_Log]') AND [name] = N'iHotel_LogDATE_TIME')
BEGIN
  CREATE NONCLUSTERED INDEX iHotel_LogDATE_TIME ON [dbo].[Hotel_Log] (DATE_TIME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[IMISTable]') AND [name] = N'PK_IMISTable')
BEGIN
  ALTER TABLE [dbo].[IMISTable]
  ADD CONSTRAINT PK_IMISTable PRIMARY KEY CLUSTERED (IMISTableName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ImportFileTypeRef]') AND [name] = N'PK_ImportFileType')
BEGIN
  ALTER TABLE [dbo].[ImportFileTypeRef]
  ADD CONSTRAINT PK_ImportFileType PRIMARY KEY CLUSTERED (ImportFileTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'PK_Individual')
BEGIN
  ALTER TABLE [dbo].[Individual]
  ADD CONSTRAINT PK_Individual PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_PrimaryInstituteContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_PrimaryInstituteContactKey ON [dbo].[Individual] (PrimaryInstituteContactKey) INCLUDE (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_LastName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_LastName ON [dbo].[Individual] (LastName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_FirstName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_FirstName ON [dbo].[Individual] (FirstName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'AK_Individual_PrimaryInstituteContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_Individual_PrimaryInstituteContactKey ON [dbo].[Individual] (PrimaryInstituteContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Input_Type_Ref]') AND [name] = N'PK_Input_Type_Ref')
BEGIN
  ALTER TABLE [dbo].[Input_Type_Ref]
  ADD CONSTRAINT PK_Input_Type_Ref PRIMARY KEY CLUSTERED (InputTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Institute]') AND [name] = N'PK_Institute')
BEGIN
  ALTER TABLE [dbo].[Institute]
  ADD CONSTRAINT PK_Institute PRIMARY KEY CLUSTERED (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Institute]') AND [name] = N'IX_Institute_InstituteName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Institute_InstituteName ON [dbo].[Institute] (InstituteName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Institute]') AND [name] = N'AK_Institute_InstituteGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_Institute_InstituteGroupKey ON [dbo].[Institute] (InstituteGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Int_Code]') AND [name] = N'iInt_CodeCODE')
BEGIN
  CREATE NONCLUSTERED INDEX iInt_CodeCODE ON [dbo].[Int_Code] (CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Interest_Category]') AND [name] = N'PK_Interest_Category')
BEGIN
  ALTER TABLE [dbo].[Interest_Category]
  ADD CONSTRAINT PK_Interest_Category PRIMARY KEY CLUSTERED (InterestCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Interest_Category]') AND [name] = N'IX_CATEGORY_PARENT2')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CATEGORY_PARENT2 ON [dbo].[Interest_Category] (ParentCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[IntervalTypeRef]') AND [name] = N'PK_IntervalTypeRef')
BEGIN
  ALTER TABLE [dbo].[IntervalTypeRef]
  ADD CONSTRAINT PK_IntervalTypeRef PRIMARY KEY CLUSTERED (IntervalTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[IntervalTypeRef]') AND [name] = N'AK_IntervalTypeRef_IntervalTypeName')
BEGIN
  ALTER TABLE [dbo].[IntervalTypeRef]
  ADD CONSTRAINT AK_IntervalTypeRef_IntervalTypeName UNIQUE NONCLUSTERED (IntervalTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[IntervalTypeRef]') AND [name] = N'AK_IntervalTypeRef_IntervalTypeDesc')
BEGIN
  ALTER TABLE [dbo].[IntervalTypeRef]
  ADD CONSTRAINT AK_IntervalTypeRef_IntervalTypeDesc UNIQUE NONCLUSTERED (IntervalTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryBackOrder]') AND [name] = N'PK_InventoryBackOrder')
BEGIN
  ALTER TABLE [dbo].[InventoryBackOrder]
  ADD CONSTRAINT PK_InventoryBackOrder PRIMARY KEY CLUSTERED (BackOrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryBackOrder]') AND [name] = N'IX_InventoryBackOrder_Product')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryBackOrder_Product ON [dbo].[InventoryBackOrder] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryBackOrder]') AND [name] = N'AK_InventoryBackOrder_OrderLineKey')
BEGIN
  ALTER TABLE [dbo].[InventoryBackOrder]
  ADD CONSTRAINT AK_InventoryBackOrder_OrderLineKey UNIQUE NONCLUSTERED (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryLocation]') AND [name] = N'PK_InventoryLocation')
BEGIN
  ALTER TABLE [dbo].[InventoryLocation]
  ADD CONSTRAINT PK_InventoryLocation PRIMARY KEY CLUSTERED (LocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogCost]') AND [name] = N'PK_InventoryTransactionLogCost')
BEGIN
  ALTER TABLE [dbo].[InventoryTransactionLogCost]
  ADD CONSTRAINT PK_InventoryTransactionLogCost PRIMARY KEY CLUSTERED (InventoryTransactionLogCostKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogCost]') AND [name] = N'IX_InvetoryTransactionLogCost_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvetoryTransactionLogCost_ProductKey ON [dbo].[InventoryTransactionLogCost] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogCost]') AND [name] = N'IX_InvetoryTransactionLogCost_InventoryTransactionLogKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvetoryTransactionLogCost_InventoryTransactionLogKey ON [dbo].[InventoryTransactionLogCost] (InventoryTransactionLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogLine]') AND [name] = N'PK_InventoryTransactionLogLine')
BEGIN
  ALTER TABLE [dbo].[InventoryTransactionLogLine]
  ADD CONSTRAINT PK_InventoryTransactionLogLine PRIMARY KEY CLUSTERED (InventoryTransactionLogLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogLine]') AND [name] = N'IX_InventoryTransactionLogLine_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogLine_ProductKey ON [dbo].[InventoryTransactionLogLine] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogLine]') AND [name] = N'IX_InventoryTransactionLogLine_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogLine_OrderLineKey ON [dbo].[InventoryTransactionLogLine] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogLine]') AND [name] = N'IX_InventoryTransactionLogLine_InventoryTransactionLogKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogLine_InventoryTransactionLogKey ON [dbo].[InventoryTransactionLogLine] (InventoryTransactionLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogMain]') AND [name] = N'PK_InventoryTransactionLogMain')
BEGIN
  ALTER TABLE [dbo].[InventoryTransactionLogMain]
  ADD CONSTRAINT PK_InventoryTransactionLogMain PRIMARY KEY CLUSTERED (InventoryTransactionLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogMain]') AND [name] = N'IX_InventoryTransactionLogMain_ReceiptNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogMain_ReceiptNumber ON [dbo].[InventoryTransactionLogMain] (ReceiptNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogMain]') AND [name] = N'IX_InventoryTransactionLogMain_OrderNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogMain_OrderNumber ON [dbo].[InventoryTransactionLogMain] (OrderNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogMain]') AND [name] = N'IX_InventoryTransactionLogMain_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InventoryTransactionLogMain_OrderKey ON [dbo].[InventoryTransactionLogMain] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'PK_Invoice')
BEGIN
  ALTER TABLE [dbo].[Invoice]
  ADD CONSTRAINT PK_Invoice PRIMARY KEY NONCLUSTERED (REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceST_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceST_ID ON [dbo].[Invoice] (ST_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceSOURCE_SYSTEM')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceSOURCE_SYSTEM ON [dbo].[Invoice] (SOURCE_SYSTEM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceORIGINATING_TRANS_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceORIGINATING_TRANS_NUM ON [dbo].[Invoice] (ORIGINATING_TRANS_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceINVOICE_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceINVOICE_NUM ON [dbo].[Invoice] (INVOICE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceINVOICE_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceINVOICE_DATE ON [dbo].[Invoice] (INVOICE_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceINSTALL_BILL_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceINSTALL_BILL_DATE ON [dbo].[Invoice] (INSTALL_BILL_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceCREDIT_STATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceCREDIT_STATUS ON [dbo].[Invoice] (CREDIT_STATUS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceBT_ID')
BEGIN
  CREATE CLUSTERED INDEX iInvoiceBT_ID ON [dbo].[Invoice] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice_Lines]') AND [name] = N'iInvoice_LinesREFERENCE_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoice_LinesREFERENCE_NUM ON [dbo].[Invoice_Lines] (REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceDistribution]') AND [name] = N'PK_InvoiceDistribution')
BEGIN
  ALTER TABLE [dbo].[InvoiceDistribution]
  ADD CONSTRAINT PK_InvoiceDistribution PRIMARY KEY CLUSTERED (InvoiceDistributionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceDistribution]') AND [name] = N'IX_InvoiceDistribution_InvoiceLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceDistribution_InvoiceLineKey ON [dbo].[InvoiceDistribution] (InvoiceLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceDistribution]') AND [name] = N'IX_InvoiceDistribution_InvoiceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceDistribution_InvoiceKey ON [dbo].[InvoiceDistribution] (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceLine]') AND [name] = N'PK_InvoiceLine')
BEGIN
  ALTER TABLE [dbo].[InvoiceLine]
  ADD CONSTRAINT PK_InvoiceLine PRIMARY KEY CLUSTERED (InvoiceLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceLine]') AND [name] = N'IX_InvoiceLine_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceLine_ProductKey ON [dbo].[InvoiceLine] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceLine]') AND [name] = N'IX_InvoiceLine_OrderLineNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceLine_OrderLineNumber ON [dbo].[InvoiceLine] (OrderLineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceLine]') AND [name] = N'IX_InvoiceLine_InvoiceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceLine_InvoiceKey ON [dbo].[InvoiceLine] (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceLine]') AND [name] = N'AK_InvoiceLine_InvoiceNumber_InvoiceLineNumber')
BEGIN
  ALTER TABLE [dbo].[InvoiceLine]
  ADD CONSTRAINT AK_InvoiceLine_InvoiceNumber_InvoiceLineNumber UNIQUE NONCLUSTERED (InvoiceNumber, InvoiceLineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceMain]') AND [name] = N'PK_InvoiceMain')
BEGIN
  ALTER TABLE [dbo].[InvoiceMain]
  ADD CONSTRAINT PK_InvoiceMain PRIMARY KEY CLUSTERED (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceMain]') AND [name] = N'IX_InvoiceMain_SoldToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceMain_SoldToContactKey ON [dbo].[InvoiceMain] (SoldToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceMain]') AND [name] = N'IX_InvoiceMain_OrderNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceMain_OrderNumber ON [dbo].[InvoiceMain] (OrderNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceMain]') AND [name] = N'IX_InvoiceMain_BillToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_InvoiceMain_BillToContactKey ON [dbo].[InvoiceMain] (BillToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceMain]') AND [name] = N'AK_InvoiceMain_InvoiceNumber_SystemEntityKey')
BEGIN
  ALTER TABLE [dbo].[InvoiceMain]
  ADD CONSTRAINT AK_InvoiceMain_InvoiceNumber_SystemEntityKey UNIQUE NONCLUSTERED (InvoiceNumber, SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceTypeRef]') AND [name] = N'PK_InvoiceTypeRef')
BEGIN
  ALTER TABLE [dbo].[InvoiceTypeRef]
  ADD CONSTRAINT PK_InvoiceTypeRef PRIMARY KEY CLUSTERED (InvoiceTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceTypeRef]') AND [name] = N'AK_InvoiceTypeRef_InvoiceTypeDesc')
BEGIN
  ALTER TABLE [dbo].[InvoiceTypeRef]
  ADD CONSTRAINT AK_InvoiceTypeRef_InvoiceTypeDesc UNIQUE NONCLUSTERED (InvoiceTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[IQA_Query_Cache]') AND [name] = N'IX_IQA_Query_Cache')
BEGIN
  CREATE CLUSTERED INDEX IX_IQA_Query_Cache ON [dbo].[IQA_Query_Cache] (UserId, QueryId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Iso_Currency_Codes]') AND [name] = N'PK_Iso_Currency_Codes')
BEGIN
  ALTER TABLE [dbo].[Iso_Currency_Codes]
  ADD CONSTRAINT PK_Iso_Currency_Codes PRIMARY KEY NONCLUSTERED (CurrencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Job_Record]') AND [name] = N'PK_Job_Record')
BEGIN
  ALTER TABLE [dbo].[Job_Record]
  ADD CONSTRAINT PK_Job_Record PRIMARY KEY NONCLUSTERED (JobId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[JournalEntryTypeRef]') AND [name] = N'PK_JournalEntryTypeRef')
BEGIN
  ALTER TABLE [dbo].[JournalEntryTypeRef]
  ADD CONSTRAINT PK_JournalEntryTypeRef PRIMARY KEY CLUSTERED (JournalEntryTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[JournalEntryTypeRef]') AND [name] = N'AK_JournalEntryTypeRef_JournalEntryTypeName')
BEGIN
  ALTER TABLE [dbo].[JournalEntryTypeRef]
  ADD CONSTRAINT AK_JournalEntryTypeRef_JournalEntryTypeName UNIQUE NONCLUSTERED (JournalEntryTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[JournalEntryTypeRef]') AND [name] = N'AK_JournalEntryTypeRef_JournalEntryTypeDesc')
BEGIN
  ALTER TABLE [dbo].[JournalEntryTypeRef]
  ADD CONSTRAINT AK_JournalEntryTypeRef_JournalEntryTypeDesc UNIQUE NONCLUSTERED (JournalEntryTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LegacySecurityLevelRef]') AND [name] = N'PK_LegacySecurityLevelRef')
BEGIN
  ALTER TABLE [dbo].[LegacySecurityLevelRef]
  ADD CONSTRAINT PK_LegacySecurityLevelRef PRIMARY KEY CLUSTERED (LevelCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Legis_Bills]') AND [name] = N'iLegis_BillsBILL_ID')
BEGIN
  CREATE CLUSTERED INDEX iLegis_BillsBILL_ID ON [dbo].[Legis_Bills] (BILL_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Legis_Bills]') AND [name] = N'iLegis_BillsAUTHOR_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iLegis_BillsAUTHOR_CODE ON [dbo].[Legis_Bills] (AUTHOR_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[License]') AND [name] = N'PK_License')
BEGIN
  ALTER TABLE [dbo].[License]
  ADD CONSTRAINT PK_License PRIMARY KEY CLUSTERED (LicenseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyList]') AND [name] = N'PK_LicenseLegacyList')
BEGIN
  ALTER TABLE [dbo].[LicenseLegacyList]
  ADD CONSTRAINT PK_LicenseLegacyList PRIMARY KEY CLUSTERED (LicenseLegacyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyList]') AND [name] = N'IX_LicenseLegacyList')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseLegacyList ON [dbo].[LicenseLegacyList] (LegacyLicenseCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyMap]') AND [name] = N'PK_LicenseLegacyMap')
BEGIN
  ALTER TABLE [dbo].[LicenseLegacyMap]
  ADD CONSTRAINT PK_LicenseLegacyMap PRIMARY KEY CLUSTERED (LicenseKey, LegacyLicenseCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyMap]') AND [name] = N'IX_LicenseLegacyMap_LegacyLicenseCode_LicenseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseLegacyMap_LegacyLicenseCode_LicenseKey ON [dbo].[LicenseLegacyMap] (LegacyLicenseCode, LicenseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMain]') AND [name] = N'PK_LicenseMain')
BEGIN
  ALTER TABLE [dbo].[LicenseMain]
  ADD CONSTRAINT PK_LicenseMain PRIMARY KEY CLUSTERED (LicenseMasterKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMain]') AND [name] = N'IX_LicenseMain_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMain_OrganizationKey ON [dbo].[LicenseMain] (OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMain]') AND [name] = N'IX_LicenseMain_LicenseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMain_LicenseKey ON [dbo].[LicenseMain] (LicenseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMap]') AND [name] = N'PK_LicenseMap')
BEGIN
  ALTER TABLE [dbo].[LicenseMap]
  ADD CONSTRAINT PK_LicenseMap PRIMARY KEY CLUSTERED (LicenseKey, LicenseType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMapMaster]') AND [name] = N'PK_LicenseMapMaster')
BEGIN
  ALTER TABLE [dbo].[LicenseMapMaster]
  ADD CONSTRAINT PK_LicenseMapMaster PRIMARY KEY CLUSTERED (LicenseKey, LicenseType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'PK_LicenseMaster')
BEGIN
  ALTER TABLE [dbo].[LicenseMaster]
  ADD CONSTRAINT PK_LicenseMaster PRIMARY KEY CLUSTERED (LicenseMasterKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'IX_LicenseMaster_LicenseOrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMaster_LicenseOrganizationKey ON [dbo].[LicenseMaster] (LicenseOrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'IX_LicenseMaster_LicenseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMaster_LicenseKey ON [dbo].[LicenseMaster] (LicenseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') AND [name] = N'PK_LicenseOrganization')
BEGIN
  ALTER TABLE [dbo].[LicenseOrganization]
  ADD CONSTRAINT PK_LicenseOrganization PRIMARY KEY CLUSTERED (LicenseOrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseTypeRef]') AND [name] = N'PK_LicenseTypeRef')
BEGIN
  ALTER TABLE [dbo].[LicenseTypeRef]
  ADD CONSTRAINT PK_LicenseTypeRef PRIMARY KEY CLUSTERED (LicenseType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseUser]') AND [name] = N'PK_LicenseUser')
BEGIN
  ALTER TABLE [dbo].[LicenseUser]
  ADD CONSTRAINT PK_LicenseUser PRIMARY KEY CLUSTERED (LicenseKey, UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseUser]') AND [name] = N'IX_LicenseUser_UserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseUser_UserKey ON [dbo].[LicenseUser] (UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LinePricingRef]') AND [name] = N'PK_LinePricingRef')
BEGIN
  ALTER TABLE [dbo].[LinePricingRef]
  ADD CONSTRAINT PK_LinePricingRef PRIMARY KEY CLUSTERED (LinePricingCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LinePricingRef]') AND [name] = N'AK_LinePricingRef_LinePricingName')
BEGIN
  ALTER TABLE [dbo].[LinePricingRef]
  ADD CONSTRAINT AK_LinePricingRef_LinePricingName UNIQUE NONCLUSTERED (LinePricingName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LinePricingRef]') AND [name] = N'AK_LinePricingRef_LinePricingDesc')
BEGIN
  ALTER TABLE [dbo].[LinePricingRef]
  ADD CONSTRAINT AK_LinePricingRef_LinePricingDesc UNIQUE NONCLUSTERED (LinePricingDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ListItem]') AND [name] = N'PK_ListItem')
BEGIN
  ALTER TABLE [dbo].[ListItem]
  ADD CONSTRAINT PK_ListItem PRIMARY KEY NONCLUSTERED (ListItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ListItem]') AND [name] = N'IX_ListItem_ObjectKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ListItem_ObjectKey ON [dbo].[ListItem] (ObjectKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ListItem]') AND [name] = N'IX_ListItem_ListKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ListItem_ListKey ON [dbo].[ListItem] (ListKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ListMain]') AND [name] = N'PK_ListMain')
BEGIN
  ALTER TABLE [dbo].[ListMain]
  ADD CONSTRAINT PK_ListMain PRIMARY KEY CLUSTERED (ListKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocaleRef]') AND [name] = N'PK_LocaleRef')
BEGIN
  ALTER TABLE [dbo].[LocaleRef]
  ADD CONSTRAINT PK_LocaleRef PRIMARY KEY CLUSTERED (LocaleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'PK_Location_LocationKey')
BEGIN
  ALTER TABLE [dbo].[Location]
  ADD CONSTRAINT PK_Location_LocationKey PRIMARY KEY CLUSTERED (LocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocationStatusRef]') AND [name] = N'PK_LocationStatusRef_LocationStatusCode')
BEGIN
  ALTER TABLE [dbo].[LocationStatusRef]
  ADD CONSTRAINT PK_LocationStatusRef_LocationStatusCode PRIMARY KEY CLUSTERED (LocationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Mail_Lists]') AND [name] = N'PK_Mail_Lists')
BEGIN
  ALTER TABLE [dbo].[Mail_Lists]
  ADD CONSTRAINT PK_Mail_Lists PRIMARY KEY NONCLUSTERED (MAIL_LIST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Mail_Subscribers]') AND [name] = N'iMail_SubscribersMAIL_LIST')
BEGIN
  CREATE NONCLUSTERED INDEX iMail_SubscribersMAIL_LIST ON [dbo].[Mail_Subscribers] (MAIL_LIST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MailCodeRef]') AND [name] = N'PK_MailCodeRef')
BEGIN
  ALTER TABLE [dbo].[MailCodeRef]
  ADD CONSTRAINT PK_MailCodeRef PRIMARY KEY CLUSTERED (MailCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MailCodeRef]') AND [name] = N'AK_MailCodeRef_MailCodeDesc')
BEGIN
  ALTER TABLE [dbo].[MailCodeRef]
  ADD CONSTRAINT AK_MailCodeRef_MailCodeDesc UNIQUE NONCLUSTERED (MailCodeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Match_Interest]') AND [name] = N'iMatch_InterestMATCH_SEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iMatch_InterestMATCH_SEQN ON [dbo].[Match_Interest] (MATCH_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Match_Interest]') AND [name] = N'iMatch_InterestINTEREST_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iMatch_InterestINTEREST_CODE ON [dbo].[Match_Interest] (INTEREST_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') AND [name] = N'PK_MatchingGift')
BEGIN
  ALTER TABLE [dbo].[MatchingGift]
  ADD CONSTRAINT PK_MatchingGift PRIMARY KEY CLUSTERED (MatchingGiftKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') AND [name] = N'IX_MatchingGift_MatchingGiftPlanKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGift_MatchingGiftPlanKey ON [dbo].[MatchingGift] (MatchingGiftPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') AND [name] = N'IX_MatchingGift_MatchingDonationPartKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGift_MatchingDonationPartKey ON [dbo].[MatchingGift] (MatchingOrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') AND [name] = N'IX_MatchingGift_MatchingContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGift_MatchingContactKey ON [dbo].[MatchingGift] (MatchingContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') AND [name] = N'AK_MatchingGift_OriginalDonationPartkey_MatchingDonationPartKey_MatchingGiftPlanKey')
BEGIN
  ALTER TABLE [dbo].[MatchingGift]
  ADD CONSTRAINT AK_MatchingGift_OriginalDonationPartkey_MatchingDonationPartKey_MatchingGiftPlanKey UNIQUE NONCLUSTERED (OriginalOrderLineKey, MatchingOrderLineKey, MatchingGiftPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'PK_MatchingGiftPlan')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlan]
  ADD CONSTRAINT PK_MatchingGiftPlan PRIMARY KEY CLUSTERED (MatchingGiftPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_OwnerContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_OwnerContactKey ON [dbo].[MatchingGiftPlan] (OwnerContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_MatchingGiftContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_MatchingGiftContactKey ON [dbo].[MatchingGiftPlan] (MatchingGiftContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_CorporateGiftContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_CorporateGiftContactKey ON [dbo].[MatchingGiftPlan] (CorporateGiftContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanFundType]') AND [name] = N'PK_MatchingGiftPlanFundType')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanFundType]
  ADD CONSTRAINT PK_MatchingGiftPlanFundType PRIMARY KEY CLUSTERED (MatchingGiftPlanFundTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanRelationship]') AND [name] = N'PK_MatchingGiftPlanRelationship')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanRelationship]
  ADD CONSTRAINT PK_MatchingGiftPlanRelationship PRIMARY KEY CLUSTERED (MatchingGiftPlanRelationshipKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanRule]') AND [name] = N'PK_MatchingGiftPlanRule')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanRule]
  ADD CONSTRAINT PK_MatchingGiftPlanRule PRIMARY KEY CLUSTERED (MatchingGiftPlanRuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanTypeRef]') AND [name] = N'PK_MatchingGiftPlanTypeRef')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanTypeRef]
  ADD CONSTRAINT PK_MatchingGiftPlanTypeRef PRIMARY KEY CLUSTERED (MatchingGiftPlanTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanTypeRef]') AND [name] = N'AK_MatchingGiftPlanTypeRef_MatchingGiftPlanTypeDesc')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanTypeRef]
  ADD CONSTRAINT AK_MatchingGiftPlanTypeRef_MatchingGiftPlanTypeDesc UNIQUE NONCLUSTERED (MatchingGiftPlanDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingModeRef]') AND [name] = N'PK_MatchingModeRef')
BEGIN
  ALTER TABLE [dbo].[MatchingModeRef]
  ADD CONSTRAINT PK_MatchingModeRef PRIMARY KEY CLUSTERED (MatchingModeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingPeriodRef]') AND [name] = N'PK_MatchingPeriodRef')
BEGIN
  ALTER TABLE [dbo].[MatchingPeriodRef]
  ADD CONSTRAINT PK_MatchingPeriodRef PRIMARY KEY CLUSTERED (MatchingPeriodCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Hotel]') AND [name] = N'PK_Meet_Hotel')
BEGIN
  ALTER TABLE [dbo].[Meet_Hotel]
  ADD CONSTRAINT PK_Meet_Hotel PRIMARY KEY CLUSTERED (MEETING, HOTEL_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') AND [name] = N'PK_Meet_Master')
BEGIN
  ALTER TABLE [dbo].[Meet_Master]
  ADD CONSTRAINT PK_Meet_Master PRIMARY KEY CLUSTERED (MEETING)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') AND [name] = N'iMeet_MasterTITLE')
BEGIN
  CREATE NONCLUSTERED INDEX iMeet_MasterTITLE ON [dbo].[Meet_Master] (TITLE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') AND [name] = N'iMeet_MasterMEET_CATEGORY')
BEGIN
  CREATE NONCLUSTERED INDEX iMeet_MasterMEET_CATEGORY ON [dbo].[Meet_Master] (MEET_CATEGORY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') AND [name] = N'iMeet_MasterIS_FR_MEET')
BEGIN
  CREATE NONCLUSTERED INDEX iMeet_MasterIS_FR_MEET ON [dbo].[Meet_Master] (IS_FR_MEET)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') AND [name] = N'iMeet_MasterBEGIN_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iMeet_MasterBEGIN_DATE ON [dbo].[Meet_Master] (BEGIN_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Reg_Class]') AND [name] = N'PK_Meet_Reg_Class')
BEGIN
  ALTER TABLE [dbo].[Meet_Reg_Class]
  ADD CONSTRAINT PK_Meet_Reg_Class PRIMARY KEY CLUSTERED (REGISTRANT_CLASS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Resources]') AND [name] = N'PK_Meet_Resources')
BEGIN
  ALTER TABLE [dbo].[Meet_Resources]
  ADD CONSTRAINT PK_Meet_Resources PRIMARY KEY CLUSTERED (PRODUCT_CODE, RESOURCE_TYPE, RES_GROUP, CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Std_Resrc]') AND [name] = N'PK_Meet_Std_Resrc')
BEGIN
  ALTER TABLE [dbo].[Meet_Std_Resrc]
  ADD CONSTRAINT PK_Meet_Std_Resrc PRIMARY KEY CLUSTERED (RESOURCE_TYPE, RES_GROUP, CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Mem_Trib_Code]') AND [name] = N'iMem_Trib_CodeMEM_TRIB_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iMem_Trib_CodeMEM_TRIB_CODE ON [dbo].[Mem_Trib_Code] (CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Member_Types]') AND [name] = N'PK_Member_Types')
BEGIN
  ALTER TABLE [dbo].[Member_Types]
  ADD CONSTRAINT PK_Member_Types PRIMARY KEY CLUSTERED (MEMBER_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Member_Types]') AND [name] = N'IX_MemberTypes_Description')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MemberTypes_Description ON [dbo].[Member_Types] (DESCRIPTION)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTribute]') AND [name] = N'UN_MemorialTribute_HonoreeContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX UN_MemorialTribute_HonoreeContactKey ON [dbo].[MemorialTribute] (HonoreeContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTribute]') AND [name] = N'PK_MemorialTribute')
BEGIN
  ALTER TABLE [dbo].[MemorialTribute]
  ADD CONSTRAINT PK_MemorialTribute PRIMARY KEY CLUSTERED (MemorialTributeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeCodeRef]') AND [name] = N'PK_MemorialTributeCodeRef')
BEGIN
  ALTER TABLE [dbo].[MemorialTributeCodeRef]
  ADD CONSTRAINT PK_MemorialTributeCodeRef PRIMARY KEY CLUSTERED (MemorialTributeCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeCodeRef]') AND [name] = N'AK_MemorialTributeCodeRef_MemorialTributeCodeDesc')
BEGIN
  ALTER TABLE [dbo].[MemorialTributeCodeRef]
  ADD CONSTRAINT AK_MemorialTributeCodeRef_MemorialTributeCodeDesc UNIQUE NONCLUSTERED (Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeNotificationMember]') AND [name] = N'PK_MemorialTributeNotificationMember')
BEGIN
  ALTER TABLE [dbo].[MemorialTributeNotificationMember]
  ADD CONSTRAINT PK_MemorialTributeNotificationMember PRIMARY KEY CLUSTERED (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSet]') AND [name] = N'PK_MethodSet')
BEGIN
  ALTER TABLE [dbo].[MethodSet]
  ADD CONSTRAINT PK_MethodSet PRIMARY KEY CLUSTERED (MethodSetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSet]') AND [name] = N'IX_MethodSet_MethodSetName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MethodSet_MethodSetName ON [dbo].[MethodSet] (MethodSetName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetDetail]') AND [name] = N'PK_MethodSetDetail')
BEGIN
  ALTER TABLE [dbo].[MethodSetDetail]
  ADD CONSTRAINT PK_MethodSetDetail PRIMARY KEY CLUSTERED (MethodSetDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetDetail]') AND [name] = N'IX_MethodSetDetail_VisibleName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MethodSetDetail_VisibleName ON [dbo].[MethodSetDetail] (VisibleName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetDetail]') AND [name] = N'IX_MethodSetDetail_MethodSetKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MethodSetDetail_MethodSetKey ON [dbo].[MethodSetDetail] (MethodSetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetTypeRef]') AND [name] = N'PK_MethodSetTypeRef')
BEGIN
  ALTER TABLE [dbo].[MethodSetTypeRef]
  ADD CONSTRAINT PK_MethodSetTypeRef PRIMARY KEY CLUSTERED (MethodSetTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetTypeRef]') AND [name] = N'AK_MethodSetTypeRef_MethodSetTypeDesc')
BEGIN
  ALTER TABLE [dbo].[MethodSetTypeRef]
  ADD CONSTRAINT AK_MethodSetTypeRef_MethodSetTypeDesc UNIQUE NONCLUSTERED (MethodSetTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MiscCharge]') AND [name] = N'PK_MiscCharge')
BEGIN
  ALTER TABLE [dbo].[MiscCharge]
  ADD CONSTRAINT PK_MiscCharge PRIMARY KEY CLUSTERED (MiscChargeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MiscCharge]') AND [name] = N'IX_MiscCharge_OrderShipToKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MiscCharge_OrderShipToKey ON [dbo].[MiscCharge] (OrderShipToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MonetaryApplication]') AND [name] = N'PK_MonetaryApplication')
BEGIN
  ALTER TABLE [dbo].[MonetaryApplication]
  ADD CONSTRAINT PK_MonetaryApplication PRIMARY KEY CLUSTERED (MonetaryApplicationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'PK_Name')
BEGIN
  ALTER TABLE [dbo].[Name]
  ADD CONSTRAINT PK_Name PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameMEMBER_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iNameMEMBER_TYPE ON [dbo].[Name] (MEMBER_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameMAJOR_KEY')
BEGIN
  CREATE NONCLUSTERED INDEX iNameMAJOR_KEY ON [dbo].[Name] (MAJOR_KEY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameMAIL_ADDRESS_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iNameMAIL_ADDRESS_NUM ON [dbo].[Name] (MAIL_ADDRESS_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameLAST_FIRST')
BEGIN
  CREATE NONCLUSTERED INDEX iNameLAST_FIRST ON [dbo].[Name] (LAST_FIRST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameEMAIL')
BEGIN
  CREATE NONCLUSTERED INDEX iNameEMAIL ON [dbo].[Name] (EMAIL)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameDUP_MATCH_KEY')
BEGIN
  CREATE NONCLUSTERED INDEX iNameDUP_MATCH_KEY ON [dbo].[Name] (DUP_MATCH_KEY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameCOMPANY_SORT')
BEGIN
  CREATE NONCLUSTERED INDEX iNameCOMPANY_SORT ON [dbo].[Name] (COMPANY_SORT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameCO_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iNameCO_ID ON [dbo].[Name] (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iNameBT_ID ON [dbo].[Name] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') AND [name] = N'PK_Name_Address')
BEGIN
  ALTER TABLE [dbo].[Name_Address]
  ADD CONSTRAINT PK_Name_Address PRIMARY KEY NONCLUSTERED (ADDRESS_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') AND [name] = N'iName_AddressLAST_VERIFIED')
BEGIN
  CREATE NONCLUSTERED INDEX iName_AddressLAST_VERIFIED ON [dbo].[Name_Address] (LAST_VERIFIED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') AND [name] = N'iName_AddressLAST_QAS_BATCH')
BEGIN
  CREATE NONCLUSTERED INDEX iName_AddressLAST_QAS_BATCH ON [dbo].[Name_Address] (LAST_QAS_BATCH)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') AND [name] = N'iName_AddressID')
BEGIN
  CREATE CLUSTERED INDEX iName_AddressID ON [dbo].[Name_Address] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_AlternateId]') AND [name] = N'PK_Name_AlternateId')
BEGIN
  ALTER TABLE [dbo].[Name_AlternateId]
  ADD CONSTRAINT PK_Name_AlternateId PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_AlternateId]') AND [name] = N'IX_Name_AlternateId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Name_AlternateId ON [dbo].[Name_AlternateId] (IdType, AlternateId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Annuity]') AND [name] = N'PK_Name_Annuity')
BEGIN
  ALTER TABLE [dbo].[Name_Annuity]
  ADD CONSTRAINT PK_Name_Annuity PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Estates]') AND [name] = N'PK_Name_Estates')
BEGIN
  ALTER TABLE [dbo].[Name_Estates]
  ADD CONSTRAINT PK_Name_Estates PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Fin]') AND [name] = N'PK_Name_Fin')
BEGIN
  ALTER TABLE [dbo].[Name_Fin]
  ADD CONSTRAINT PK_Name_Fin PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Fin]') AND [name] = N'iName_FinBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FinBT_ID ON [dbo].[Name_Fin] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FR]') AND [name] = N'iName_FRSOLICITOR_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FRSOLICITOR_ID ON [dbo].[Name_FR] (SOLICITOR_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FR]') AND [name] = N'iName_FRLast_Receipt_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FRLast_Receipt_Date ON [dbo].[Name_FR] (Last_Receipt_Printed_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FR]') AND [name] = N'iName_FRID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FRID ON [dbo].[Name_FR] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FR]') AND [name] = N'iName_FRBatch_Receipt_Interval')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FRBatch_Receipt_Interval ON [dbo].[Name_FR] (Receipt_Interval)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRAdditionalInfo]') AND [name] = N'PK_Name_FRAdditionalInfo')
BEGIN
  ALTER TABLE [dbo].[Name_FRAdditionalInfo]
  ADD CONSTRAINT PK_Name_FRAdditionalInfo PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FREventInformation]') AND [name] = N'PK_Name_FREventInformation')
BEGIN
  ALTER TABLE [dbo].[Name_FREventInformation]
  ADD CONSTRAINT PK_Name_FREventInformation PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRSurveyQuestion]') AND [name] = N'PK_Name_FRSurveyQuestion')
BEGIN
  ALTER TABLE [dbo].[Name_FRSurveyQuestion]
  ADD CONSTRAINT PK_Name_FRSurveyQuestion PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRTeamInformation]') AND [name] = N'PK_Name_FRTeamInformation')
BEGIN
  ALTER TABLE [dbo].[Name_FRTeamInformation]
  ADD CONSTRAINT PK_Name_FRTeamInformation PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRTransactionLog]') AND [name] = N'PK_Name_FRTransactionLog')
BEGIN
  ALTER TABLE [dbo].[Name_FRTransactionLog]
  ADD CONSTRAINT PK_Name_FRTransactionLog PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRTransactionLog]') AND [name] = N'IX_Name_FRTransactionLog_TransactionID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Name_FRTransactionLog_TransactionID ON [dbo].[Name_FRTransactionLog] (TransactionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Indexes]') AND [name] = N'iName_IndexesINDEX_NAME')
BEGIN
  CREATE CLUSTERED INDEX iName_IndexesINDEX_NAME ON [dbo].[Name_Indexes] (ID, INDEX_NAME, INDEX_VALUE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Indexes]') AND [name] = N'iName_IndexesID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_IndexesID ON [dbo].[Name_Indexes] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Log]') AND [name] = N'iName_LogID')
BEGIN
  CREATE CLUSTERED INDEX iName_LogID ON [dbo].[Name_Log] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Log]') AND [name] = N'iName_LogDATE_TIME')
BEGIN
  CREATE NONCLUSTERED INDEX iName_LogDATE_TIME ON [dbo].[Name_Log] (DATE_TIME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_MatchPlan]') AND [name] = N'iName_MatchPlanSEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iName_MatchPlanSEQN ON [dbo].[Name_MatchPlan] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_MatchPlan]') AND [name] = N'iName_MatchPlanID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_MatchPlanID ON [dbo].[Name_MatchPlan] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Note]') AND [name] = N'PK_Name_Note')
BEGIN
  ALTER TABLE [dbo].[Name_Note]
  ADD CONSTRAINT PK_Name_Note PRIMARY KEY NONCLUSTERED (NOTE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Note]') AND [name] = N'iName_NoteID')
BEGIN
  CREATE CLUSTERED INDEX iName_NoteID ON [dbo].[Name_Note] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Notify]') AND [name] = N'iName_NotifyNOTIFY_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_NotifyNOTIFY_ID ON [dbo].[Name_Notify] (NOTIFY_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Notify]') AND [name] = N'iName_NotifyID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_NotifyID ON [dbo].[Name_Notify] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Picture]') AND [name] = N'PK_Name_Picture')
BEGIN
  ALTER TABLE [dbo].[Name_Picture]
  ADD CONSTRAINT PK_Name_Picture PRIMARY KEY NONCLUSTERED (PICTURE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Picture]') AND [name] = N'iName_PictureID')
BEGIN
  CREATE CLUSTERED INDEX iName_PictureID ON [dbo].[Name_Picture] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_PL_Pref]') AND [name] = N'PK_Name_PL_Pref')
BEGIN
  ALTER TABLE [dbo].[Name_PL_Pref]
  ADD CONSTRAINT PK_Name_PL_Pref PRIMARY KEY CLUSTERED (NAME_ID, PLP_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_PL_Pref]') AND [name] = N'iName_PL_PrefNAME_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_PL_PrefNAME_ID ON [dbo].[Name_PL_Pref] (NAME_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_PlannedGiving]') AND [name] = N'PK_Name_PlannedGiving')
BEGIN
  ALTER TABLE [dbo].[Name_PlannedGiving]
  ADD CONSTRAINT PK_Name_PlannedGiving PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Research]') AND [name] = N'PK_Name_Research')
BEGIN
  ALTER TABLE [dbo].[Name_Research]
  ADD CONSTRAINT PK_Name_Research PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Salutation]') AND [name] = N'iName_SalutationSALUTATION_TYP')
BEGIN
  CREATE NONCLUSTERED INDEX iName_SalutationSALUTATION_TYP ON [dbo].[Name_Salutation] (SALUTATION_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Salutation]') AND [name] = N'iName_SalutationID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_SalutationID ON [dbo].[Name_Salutation] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security]') AND [name] = N'PK_Name_Security')
BEGIN
  ALTER TABLE [dbo].[Name_Security]
  ADD CONSTRAINT PK_Name_Security PRIMARY KEY NONCLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security]') AND [name] = N'iName_SecurityLOGIN')
BEGIN
  CREATE CLUSTERED INDEX iName_SecurityLOGIN ON [dbo].[Name_Security] (WEB_LOGIN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security]') AND [name] = N'iName_SecurityContactID')
BEGIN
  CREATE NONCLUSTERED INDEX iName_SecurityContactID ON [dbo].[Name_Security] (ContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security_Groups]') AND [name] = N'PK_Name_Security_Groups')
BEGIN
  ALTER TABLE [dbo].[Name_Security_Groups]
  ADD CONSTRAINT PK_Name_Security_Groups PRIMARY KEY CLUSTERED (ID, SECURITY_GROUP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security_Groups]') AND [name] = N'iName_Security_GroupsSECURITY_')
BEGIN
  CREATE NONCLUSTERED INDEX iName_Security_GroupsSECURITY_ ON [dbo].[Name_Security_Groups] (SECURITY_GROUP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'PK_Nav_Menu')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu]
  ADD CONSTRAINT PK_Nav_Menu PRIMARY KEY CLUSTERED (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'ix_Nav_Menu_2')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Nav_Menu_2 ON [dbo].[Nav_Menu] (AncestorNavMenuID, NavContentGroupInd, SortOrder)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'ix_Nav_Menu_1')
BEGIN
  CREATE NONCLUSTERED INDEX ix_Nav_Menu_1 ON [dbo].[Nav_Menu] (ParentNavMenuID, NavContentGroupInd, SortOrder)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'ak_nav_menu_sortorder')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu]
  ADD CONSTRAINT ak_nav_menu_sortorder UNIQUE NONCLUSTERED (SortOrder)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'ak_nav_menu_name')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu]
  ADD CONSTRAINT ak_nav_menu_name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Feature]') AND [name] = N'PK_Nav_Menu_Feature')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu_Feature]
  ADD CONSTRAINT PK_Nav_Menu_Feature PRIMARY KEY CLUSTERED (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Security_Group]') AND [name] = N'PK_Nav_Menu_Security_Group')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu_Security_Group]
  ADD CONSTRAINT PK_Nav_Menu_Security_Group PRIMARY KEY CLUSTERED (NavMenuID, SecurityGroupCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Setup_Log]') AND [name] = N'PK_Nav_Menu_Setup_Log')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu_Setup_Log]
  ADD CONSTRAINT PK_Nav_Menu_Setup_Log PRIMARY KEY CLUSTERED (AncestorNavMenuID, NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Website]') AND [name] = N'PK_Nav_Menu_Website')
BEGIN
  ALTER TABLE [dbo].[Nav_Menu_Website]
  ADD CONSTRAINT PK_Nav_Menu_Website PRIMARY KEY CLUSTERED (NavMenuID, WebsiteKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationExport]') AND [name] = N'PK_NavigationExport')
BEGIN
  ALTER TABLE [dbo].[NavigationExport]
  ADD CONSTRAINT PK_NavigationExport PRIMARY KEY CLUSTERED (NavigationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationLegacySecurityRolesExport]') AND [name] = N'PK_NavigationLegacySecurityRolesExport')
BEGIN
  ALTER TABLE [dbo].[NavigationLegacySecurityRolesExport]
  ADD CONSTRAINT PK_NavigationLegacySecurityRolesExport PRIMARY KEY CLUSTERED (NavigationKey, RoleName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationMain]') AND [name] = N'PK_NavigationMain')
BEGIN
  ALTER TABLE [dbo].[NavigationMain]
  ADD CONSTRAINT PK_NavigationMain PRIMARY KEY CLUSTERED (NavigationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationPaneRef]') AND [name] = N'PK_NavigationPaneRef')
BEGIN
  ALTER TABLE [dbo].[NavigationPaneRef]
  ADD CONSTRAINT PK_NavigationPaneRef PRIMARY KEY CLUSTERED (NavigationPaneCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationSecurityGroupsExport]') AND [name] = N'PK_NavigationSecurityGroupsExport')
BEGIN
  ALTER TABLE [dbo].[NavigationSecurityGroupsExport]
  ADD CONSTRAINT PK_NavigationSecurityGroupsExport PRIMARY KEY CLUSTERED (NavigationKey, GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationSecurityRolesExport]') AND [name] = N'PK_NavigationSecurityRolesExport')
BEGIN
  ALTER TABLE [dbo].[NavigationSecurityRolesExport]
  ADD CONSTRAINT PK_NavigationSecurityRolesExport PRIMARY KEY CLUSTERED (NavigationKey, RoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationWorkflowParameters]') AND [name] = N'PK_NavigationWorkflowParameters')
BEGIN
  ALTER TABLE [dbo].[NavigationWorkflowParameters]
  ADD CONSTRAINT PK_NavigationWorkflowParameters PRIMARY KEY CLUSTERED (DocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'PK_Note')
BEGIN
  ALTER TABLE [dbo].[Note]
  ADD CONSTRAINT PK_Note PRIMARY KEY CLUSTERED (NoteKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_NoteForUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_NoteForUniformKey ON [dbo].[Note] (NoteForUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NotePurposeRef]') AND [name] = N'PK_NotePurposeRef')
BEGIN
  ALTER TABLE [dbo].[NotePurposeRef]
  ADD CONSTRAINT PK_NotePurposeRef PRIMARY KEY CLUSTERED (NotePurposeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NotePurposeRef]') AND [name] = N'AK_NotePurposeRef_NotePurposeDesc')
BEGIN
  ALTER TABLE [dbo].[NotePurposeRef]
  ADD CONSTRAINT AK_NotePurposeRef_NotePurposeDesc UNIQUE NONCLUSTERED (NotePurposeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ObjectMetaData]') AND [name] = N'PK_ObjectMetaData')
BEGIN
  ALTER TABLE [dbo].[ObjectMetaData]
  ADD CONSTRAINT PK_ObjectMetaData PRIMARY KEY CLUSTERED (ObjectName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OfferedCustomerExperience]') AND [name] = N'PK_OfferedCustomerExperience_OfferedCustomerExperienceKey')
BEGIN
  ALTER TABLE [dbo].[OfferedCustomerExperience]
  ADD CONSTRAINT PK_OfferedCustomerExperience_OfferedCustomerExperienceKey PRIMARY KEY CLUSTERED (OfferedCustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'PK_Offering_OfferingKey')
BEGIN
  ALTER TABLE [dbo].[Offering]
  ADD CONSTRAINT PK_Offering_OfferingKey PRIMARY KEY CLUSTERED (OfferingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OfferingStatusRef]') AND [name] = N'PK_OfferingStatusRef')
BEGIN
  ALTER TABLE [dbo].[OfferingStatusRef]
  ADD CONSTRAINT PK_OfferingStatusRef PRIMARY KEY CLUSTERED (OfferingStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityClassRef]') AND [name] = N'PK_OpportunityClassRef')
BEGIN
  ALTER TABLE [dbo].[OpportunityClassRef]
  ADD CONSTRAINT PK_OpportunityClassRef PRIMARY KEY CLUSTERED (OpportunityClassCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'PK_OpportunityCompetitor')
BEGIN
  ALTER TABLE [dbo].[OpportunityCompetitor]
  ADD CONSTRAINT PK_OpportunityCompetitor PRIMARY KEY CLUSTERED (OpportunityCompetitorKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'IX_OpportunityCompetitor_OpportunityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityCompetitor_OpportunityKey ON [dbo].[OpportunityCompetitor] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'IX_OpportunityCompetitor_CompetitorKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityCompetitor_CompetitorKey ON [dbo].[OpportunityCompetitor] (CompetitorContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityDefaultStatusRef]') AND [name] = N'PK_OpportunityDefaultStatusRef')
BEGIN
  ALTER TABLE [dbo].[OpportunityDefaultStatusRef]
  ADD CONSTRAINT PK_OpportunityDefaultStatusRef PRIMARY KEY CLUSTERED (OpportunityDefaultStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') AND [name] = N'PK_OpportunityHistory')
BEGIN
  ALTER TABLE [dbo].[OpportunityHistory]
  ADD CONSTRAINT PK_OpportunityHistory PRIMARY KEY CLUSTERED (OpportunityHistoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') AND [name] = N'IX_OpportunityHistory_OpportunityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityHistory_OpportunityKey ON [dbo].[OpportunityHistory] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'PK_OpportunityMain')
BEGIN
  ALTER TABLE [dbo].[OpportunityMain]
  ADD CONSTRAINT PK_OpportunityMain PRIMARY KEY CLUSTERED (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_ProductKey ON [dbo].[OpportunityMain] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_OpportunityTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_OpportunityTypeKey ON [dbo].[OpportunityMain] (OpportunityTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_OpportunityOwnerGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_OpportunityOwnerGroupKey ON [dbo].[OpportunityMain] (OpportunityOwnerGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_OpportunityContactGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_OpportunityContactGroupKey ON [dbo].[OpportunityMain] (OpportunityContactGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'AK_OpportunityMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_OpportunityMain_AccessKey ON [dbo].[OpportunityMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainDonor]') AND [name] = N'PK_OpportunityMainDonor')
BEGIN
  ALTER TABLE [dbo].[OpportunityMainDonor]
  ADD CONSTRAINT PK_OpportunityMainDonor PRIMARY KEY CLUSTERED (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainDonor]') AND [name] = N'IX_OpportunityMainDonor')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMainDonor ON [dbo].[OpportunityMainDonor] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainMember]') AND [name] = N'PK_OpportunityMainMember')
BEGIN
  ALTER TABLE [dbo].[OpportunityMainMember]
  ADD CONSTRAINT PK_OpportunityMainMember PRIMARY KEY CLUSTERED (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainMember]') AND [name] = N'IX_OpportunityMainMember')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMainMember ON [dbo].[OpportunityMainMember] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainSales]') AND [name] = N'PK_OpportunityMainSales')
BEGIN
  ALTER TABLE [dbo].[OpportunityMainSales]
  ADD CONSTRAINT PK_OpportunityMainSales PRIMARY KEY CLUSTERED (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainSales]') AND [name] = N'IX_OpportunityMainSales')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMainSales ON [dbo].[OpportunityMainSales] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityStatusRef]') AND [name] = N'PK_OpportunityStatusRef')
BEGIN
  ALTER TABLE [dbo].[OpportunityStatusRef]
  ADD CONSTRAINT PK_OpportunityStatusRef PRIMARY KEY CLUSTERED (OpportunityStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'PK_OpportunityType')
BEGIN
  ALTER TABLE [dbo].[OpportunityType]
  ADD CONSTRAINT PK_OpportunityType PRIMARY KEY CLUSTERED (OpportunityTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'IX_OpportunityType_DefaultOwnerKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityType_DefaultOwnerKey ON [dbo].[OpportunityType] (DefaultOwnerKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'IX_OpportunityType_DefaultActionPlanKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityType_DefaultActionPlanKey ON [dbo].[OpportunityType] (DefaultActionPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Badge]') AND [name] = N'PK_Order_Badge')
BEGIN
  ALTER TABLE [dbo].[Order_Badge]
  ADD CONSTRAINT PK_Order_Badge PRIMARY KEY CLUSTERED (ORDER_NUMBER, BADGE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Lines]') AND [name] = N'PK_Order_Lines')
BEGIN
  ALTER TABLE [dbo].[Order_Lines]
  ADD CONSTRAINT PK_Order_Lines PRIMARY KEY CLUSTERED (ORDER_NUMBER, LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Lines]') AND [name] = N'iOrder_LinesPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iOrder_LinesPRODUCT_CODE ON [dbo].[Order_Lines] (PRODUCT_CODE, LOCATION, LOT_SERIAL)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Meet]') AND [name] = N'PK_Order_Meet')
BEGIN
  ALTER TABLE [dbo].[Order_Meet]
  ADD CONSTRAINT PK_Order_Meet PRIMARY KEY NONCLUSTERED (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Meet]') AND [name] = N'iOrder_MeetREGISTRANT_CLASS')
BEGIN
  CREATE NONCLUSTERED INDEX iOrder_MeetREGISTRANT_CLASS ON [dbo].[Order_Meet] (REGISTRANT_CLASS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Meet]') AND [name] = N'iOrder_MeetMEETING')
BEGIN
  CREATE CLUSTERED INDEX iOrder_MeetMEETING ON [dbo].[Order_Meet] (MEETING)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Payments]') AND [name] = N'PK_Order_Payments')
BEGIN
  ALTER TABLE [dbo].[Order_Payments]
  ADD CONSTRAINT PK_Order_Payments PRIMARY KEY CLUSTERED (ORDER_NUMBER, PAYMENT_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Order_Type]') AND [name] = N'PK_Order_Type')
BEGIN
  ALTER TABLE [dbo].[Order_Type]
  ADD CONSTRAINT PK_Order_Type PRIMARY KEY CLUSTERED (CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderAnswer]') AND [name] = N'PK_OrderAnswer')
BEGIN
  ALTER TABLE [dbo].[OrderAnswer]
  ADD CONSTRAINT PK_OrderAnswer PRIMARY KEY CLUSTERED (OrderNumber, QuestionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderCategory]') AND [name] = N'PK_OrderCategory')
BEGIN
  ALTER TABLE [dbo].[OrderCategory]
  ADD CONSTRAINT PK_OrderCategory PRIMARY KEY CLUSTERED (OrderCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderCategoryParentLookup]') AND [name] = N'PK_OrderCategoryParentLookup')
BEGIN
  ALTER TABLE [dbo].[OrderCategoryParentLookup]
  ADD CONSTRAINT PK_OrderCategoryParentLookup PRIMARY KEY CLUSTERED (OrderCategoryID, OrderCategoryParentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderCheckout]') AND [name] = N'PK_OrderCheckout')
BEGIN
  ALTER TABLE [dbo].[OrderCheckout]
  ADD CONSTRAINT PK_OrderCheckout PRIMARY KEY CLUSTERED (OrderCheckoutID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderCheckout]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[OrderCheckout] (UserID, Email)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentLine]') AND [name] = N'PK_OrderFulfillmentLine')
BEGIN
  ALTER TABLE [dbo].[OrderFulfillmentLine]
  ADD CONSTRAINT PK_OrderFulfillmentLine PRIMARY KEY CLUSTERED (OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentLine]') AND [name] = N'IX_OrderFulfillmentLine_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderFulfillmentLine_OrderLineKey ON [dbo].[OrderFulfillmentLine] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentStatusRef]') AND [name] = N'PK_OrderFulfillmentStatusRef')
BEGIN
  ALTER TABLE [dbo].[OrderFulfillmentStatusRef]
  ADD CONSTRAINT PK_OrderFulfillmentStatusRef PRIMARY KEY CLUSTERED (OrderFulfillmentStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentStatusRef]') AND [name] = N'AK_OrderFulfillmentStatusRef_OrderFulfillmentStatusName')
BEGIN
  ALTER TABLE [dbo].[OrderFulfillmentStatusRef]
  ADD CONSTRAINT AK_OrderFulfillmentStatusRef_OrderFulfillmentStatusName UNIQUE NONCLUSTERED (OrderFulfillmentStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentStatusRef]') AND [name] = N'AK_OrderFulfillmentStatusRef_OrderFulfillmentStatusDesc')
BEGIN
  ALTER TABLE [dbo].[OrderFulfillmentStatusRef]
  ADD CONSTRAINT AK_OrderFulfillmentStatusRef_OrderFulfillmentStatusDesc UNIQUE NONCLUSTERED (OrderFulfillmentStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderLine]') AND [name] = N'PK_OrderLine')
BEGIN
  ALTER TABLE [dbo].[OrderLine]
  ADD CONSTRAINT PK_OrderLine PRIMARY KEY CLUSTERED (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderLine]') AND [name] = N'IX_OrderLine_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderLine_ProductKey ON [dbo].[OrderLine] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderLine]') AND [name] = N'IX_OrderLine_OrderShipToKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderLine_OrderShipToKey ON [dbo].[OrderLine] (OrderShipToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderLine]') AND [name] = N'IX_OrderLine_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderLine_OrderKey ON [dbo].[OrderLine] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'PK_OrderMain')
BEGIN
  ALTER TABLE [dbo].[OrderMain]
  ADD CONSTRAINT PK_OrderMain PRIMARY KEY CLUSTERED (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_SourceCodeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_SourceCodeKey ON [dbo].[OrderMain] (SourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_SoldToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_SoldToContactKey ON [dbo].[OrderMain] (SoldToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_SellingLocationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_SellingLocationKey ON [dbo].[OrderMain] (SalesLocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_SalesTeamGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_SalesTeamGroupKey ON [dbo].[OrderMain] (SalesTeamGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_OrderDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_OrderDate ON [dbo].[OrderMain] (OrderDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'IX_OrderMain_BillToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderMain_BillToContactKey ON [dbo].[OrderMain] (BillToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderMain]') AND [name] = N'AK_OrderMain_OrderNumber_SystemEntityKey')
BEGIN
  ALTER TABLE [dbo].[OrderMain]
  ADD CONSTRAINT AK_OrderMain_OrderNumber_SystemEntityKey UNIQUE NONCLUSTERED (OrderNumber, SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPickLine]') AND [name] = N'PK_OrderPickLine')
BEGIN
  ALTER TABLE [dbo].[OrderPickLine]
  ADD CONSTRAINT PK_OrderPickLine PRIMARY KEY CLUSTERED (OrderPickLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPickLine]') AND [name] = N'IX_OrderPickLine_OrderFulfillmentLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderPickLine_OrderFulfillmentLineKey ON [dbo].[OrderPickLine] (OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderProduct]') AND [name] = N'PK_OrderProduct')
BEGIN
  ALTER TABLE [dbo].[OrderProduct]
  ADD CONSTRAINT PK_OrderProduct PRIMARY KEY CLUSTERED (OrderProductID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderProduct]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[OrderProduct] (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderProductCategoryLookup]') AND [name] = N'PK_OrderProductCategoryLookup')
BEGIN
  ALTER TABLE [dbo].[OrderProductCategoryLookup]
  ADD CONSTRAINT PK_OrderProductCategoryLookup PRIMARY KEY CLUSTERED (OrderProductID, OrderCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderProductCrossSellLookup]') AND [name] = N'PK_OrderProductCrossSellLookup')
BEGIN
  ALTER TABLE [dbo].[OrderProductCrossSellLookup]
  ADD CONSTRAINT PK_OrderProductCrossSellLookup PRIMARY KEY CLUSTERED (OrderProductID, CrossSellOrderProductID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') AND [name] = N'PK_OrderPromotion')
BEGIN
  ALTER TABLE [dbo].[OrderPromotion]
  ADD CONSTRAINT PK_OrderPromotion PRIMARY KEY CLUSTERED (OrderPromotionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') AND [name] = N'IX_OrderPromotion_PromotionDiscountKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderPromotion_PromotionDiscountKey ON [dbo].[OrderPromotion] (PromotionDiscountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') AND [name] = N'IX_OrderPromotion_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderPromotion_OrderLineKey ON [dbo].[OrderPromotion] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') AND [name] = N'IX_OrderPromotion_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderPromotion_OrderKey ON [dbo].[OrderPromotion] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'PK_Orders')
BEGIN
  ALTER TABLE [dbo].[Orders]
  ADD CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersSTATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersSTATUS ON [dbo].[Orders] (STATUS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersSTAGE')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersSTAGE ON [dbo].[Orders] (STAGE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersST_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersST_ID ON [dbo].[Orders] (ST_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersLAST_FIRST')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersLAST_FIRST ON [dbo].[Orders] (LAST_FIRST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersIS_FR_ORDER')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersIS_FR_ORDER ON [dbo].[Orders] (IS_FR_ORDER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersINVOICE_REF_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersINVOICE_REF_NUM ON [dbo].[Orders] (INVOICE_REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersCOMPANY_SORT')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersCOMPANY_SORT ON [dbo].[Orders] (COMPANY_SORT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersCO_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersCO_ID ON [dbo].[Orders] (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersBT_ID ON [dbo].[Orders] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders_VAT]') AND [name] = N'PK_Orders_VAT')
BEGIN
  ALTER TABLE [dbo].[Orders_VAT]
  ADD CONSTRAINT PK_Orders_VAT PRIMARY KEY CLUSTERED (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderShipTo]') AND [name] = N'PK_OrderShipTo')
BEGIN
  ALTER TABLE [dbo].[OrderShipTo]
  ADD CONSTRAINT PK_OrderShipTo PRIMARY KEY CLUSTERED (OrderShipToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderShipTo]') AND [name] = N'IX_OrderShipTo_ShipMethodKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderShipTo_ShipMethodKey ON [dbo].[OrderShipTo] (ShipMethodKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderShipTo]') AND [name] = N'IX_OrderShipTo_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderShipTo_OrderKey ON [dbo].[OrderShipTo] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderShipTo]') AND [name] = N'IX_OrderShipTo_FullAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderShipTo_FullAddressKey ON [dbo].[OrderShipTo] (FullAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderShipTo]') AND [name] = N'IX_OrderShipTo_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderShipTo_ContactKey ON [dbo].[OrderShipTo] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderStateRef]') AND [name] = N'PK_OrderStateRef')
BEGIN
  ALTER TABLE [dbo].[OrderStateRef]
  ADD CONSTRAINT PK_OrderStateRef PRIMARY KEY CLUSTERED (OrderStateCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderStateRef]') AND [name] = N'AK_OrderStateRef_OrderStateName')
BEGIN
  ALTER TABLE [dbo].[OrderStateRef]
  ADD CONSTRAINT AK_OrderStateRef_OrderStateName UNIQUE NONCLUSTERED (OrderStateName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderStateRef]') AND [name] = N'AK_OrderStateRef_OrderStateDesc')
BEGIN
  ALTER TABLE [dbo].[OrderStateRef]
  ADD CONSTRAINT AK_OrderStateRef_OrderStateDesc UNIQUE NONCLUSTERED (OrderStateDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttribute]') AND [name] = N'PK_OrderSuperProductAttribute')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductAttribute]
  ADD CONSTRAINT PK_OrderSuperProductAttribute PRIMARY KEY CLUSTERED (OrderSuperProductAttributeID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttribute]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[OrderSuperProductAttribute] (Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttributeLookup]') AND [name] = N'PK_OrderSuperProductAttributeLookup')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductAttributeLookup]
  ADD CONSTRAINT PK_OrderSuperProductAttributeLookup PRIMARY KEY CLUSTERED (OrderProductID, OrderSuperProductAttributeID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttributeValue]') AND [name] = N'PK_OrderSuperProductAttributeValue')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductAttributeValue]
  ADD CONSTRAINT PK_OrderSuperProductAttributeValue PRIMARY KEY CLUSTERED (OrderSuperProductAttributeValueID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProduct]') AND [name] = N'PK_OrderSuperProductChildProduct')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductChildProduct]
  ADD CONSTRAINT PK_OrderSuperProductChildProduct PRIMARY KEY CLUSTERED (OrderSuperProductChildProductID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProduct]') AND [name] = N'iWC')
BEGIN
  CREATE NONCLUSTERED INDEX iWC ON [dbo].[OrderSuperProductChildProduct] (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProductAttribute]') AND [name] = N'PK_OrderSuperProductChildProductAttribute')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute]
  ADD CONSTRAINT PK_OrderSuperProductChildProductAttribute PRIMARY KEY CLUSTERED (OrderSuperProductChildProductID, OrderSuperProductAttributeValueID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderTaxLine]') AND [name] = N'PK_OrderTaxLine')
BEGIN
  ALTER TABLE [dbo].[OrderTaxLine]
  ADD CONSTRAINT PK_OrderTaxLine PRIMARY KEY CLUSTERED (OrderTaxLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderTaxLine]') AND [name] = N'IX_OrderTaxLine_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderTaxLine_OrderLineKey ON [dbo].[OrderTaxLine] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderTaxLine]') AND [name] = N'IX_OrderTaxLine_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderTaxLine_OrderKey ON [dbo].[OrderTaxLine] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderType]') AND [name] = N'PK_OrderType')
BEGIN
  ALTER TABLE [dbo].[OrderType]
  ADD CONSTRAINT PK_OrderType PRIMARY KEY CLUSTERED (OrderTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Org_Control]') AND [name] = N'PK_Org_Control')
BEGIN
  ALTER TABLE [dbo].[Org_Control]
  ADD CONSTRAINT PK_Org_Control PRIMARY KEY CLUSTERED (OrgCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Org_Control]') AND [name] = N'iOrg_ControlRegistration_Num')
BEGIN
  CREATE NONCLUSTERED INDEX iOrg_ControlRegistration_Num ON [dbo].[Org_Control] (Registration_Num)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Org_Control]') AND [name] = N'iOrg_ControlDefaultFlag')
BEGIN
  CREATE NONCLUSTERED INDEX iOrg_ControlDefaultFlag ON [dbo].[Org_Control] (DefaultFlag)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Org_Interest]') AND [name] = N'iOrg_InterestORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iOrg_InterestORG_CODE ON [dbo].[Org_Interest] (ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Org_Interest]') AND [name] = N'iOrg_InterestINTEREST_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iOrg_InterestINTEREST_CODE ON [dbo].[Org_Interest] (INTEREST_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') AND [name] = N'PK_OrganizationMain')
BEGIN
  ALTER TABLE [dbo].[OrganizationMain]
  ADD CONSTRAINT PK_OrganizationMain PRIMARY KEY CLUSTERED (OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') AND [name] = N'AK_OrganizationMain_Name')
BEGIN
  ALTER TABLE [dbo].[OrganizationMain]
  ADD CONSTRAINT AK_OrganizationMain_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OutboundCommunicationStatusRef]') AND [name] = N'PK_OutboundCommunicationStatusRef')
BEGIN
  ALTER TABLE [dbo].[OutboundCommunicationStatusRef]
  ADD CONSTRAINT PK_OutboundCommunicationStatusRef PRIMARY KEY CLUSTERED (OutboundCommunicationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'PK_PackageItem')
BEGIN
  ALTER TABLE [dbo].[PackageItem]
  ADD CONSTRAINT PK_PackageItem PRIMARY KEY CLUSTERED (PackageItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'IX_PackageItem_PackageKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageItem_PackageKey ON [dbo].[PackageItem] (PackageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageLogStatusRef]') AND [name] = N'PK_PackageLogStatusRef')
BEGIN
  ALTER TABLE [dbo].[PackageLogStatusRef]
  ADD CONSTRAINT PK_PackageLogStatusRef PRIMARY KEY CLUSTERED (PackageLogStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') AND [name] = N'PK_PackageMain')
BEGIN
  ALTER TABLE [dbo].[PackageMain]
  ADD CONSTRAINT PK_PackageMain PRIMARY KEY CLUSTERED (PackageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'PK_PackageQueue')
BEGIN
  ALTER TABLE [dbo].[PackageQueue]
  ADD CONSTRAINT PK_PackageQueue PRIMARY KEY CLUSTERED (PackageQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueueReleaseTypeRef]') AND [name] = N'PK_PackageQueueReleaseTypeRef')
BEGIN
  ALTER TABLE [dbo].[PackageQueueReleaseTypeRef]
  ADD CONSTRAINT PK_PackageQueueReleaseTypeRef PRIMARY KEY CLUSTERED (PackageQueueReleaseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageStatusRef]') AND [name] = N'PK_PackageStatusRef')
BEGIN
  ALTER TABLE [dbo].[PackageStatusRef]
  ADD CONSTRAINT PK_PackageStatusRef PRIMARY KEY CLUSTERED (PackageStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageStatusRef]') AND [name] = N'AK_PackageStatusRef_PackageStatusName')
BEGIN
  ALTER TABLE [dbo].[PackageStatusRef]
  ADD CONSTRAINT AK_PackageStatusRef_PackageStatusName UNIQUE NONCLUSTERED (PackageStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageStatusRef]') AND [name] = N'AK_PackageStatusRef_PackageStatusDesc')
BEGIN
  ALTER TABLE [dbo].[PackageStatusRef]
  ADD CONSTRAINT AK_PackageStatusRef_PackageStatusDesc UNIQUE NONCLUSTERED (PackageStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PanelDefinition]') AND [name] = N'PK_PanelDefinition')
BEGIN
  ALTER TABLE [dbo].[PanelDefinition]
  ADD CONSTRAINT PK_PanelDefinition PRIMARY KEY CLUSTERED (PanelDefinitionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaperSizeRef]') AND [name] = N'PK_PaperSizeRef')
BEGIN
  ALTER TABLE [dbo].[PaperSizeRef]
  ADD CONSTRAINT PK_PaperSizeRef PRIMARY KEY CLUSTERED (PaperSizeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaperSizeRef]') AND [name] = N'AK_PaperSizeRef_PaperSizeDesc')
BEGIN
  ALTER TABLE [dbo].[PaperSizeRef]
  ADD CONSTRAINT AK_PaperSizeRef_PaperSizeDesc UNIQUE NONCLUSTERED (PaperSizeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentApplicationRestrictionRef]') AND [name] = N'PK_PaymentApplicationRestrictionRef')
BEGIN
  ALTER TABLE [dbo].[PaymentApplicationRestrictionRef]
  ADD CONSTRAINT PK_PaymentApplicationRestrictionRef PRIMARY KEY CLUSTERED (PaymentApplicationRestrictionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentApplicationRestrictionRef]') AND [name] = N'AK_PaymentApplicationRestrictionRef_PaymentApplicationRestrictionName')
BEGIN
  ALTER TABLE [dbo].[PaymentApplicationRestrictionRef]
  ADD CONSTRAINT AK_PaymentApplicationRestrictionRef_PaymentApplicationRestrictionName UNIQUE NONCLUSTERED (PaymentApplicationRestrictionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentApplicationRestrictionRef]') AND [name] = N'AK_PaymentApplicationRestrictionRef_PaymentApplicationRestrictionDesc')
BEGIN
  ALTER TABLE [dbo].[PaymentApplicationRestrictionRef]
  ADD CONSTRAINT AK_PaymentApplicationRestrictionRef_PaymentApplicationRestrictionDesc UNIQUE NONCLUSTERED (PaymentApplicationRestrictionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentDetail]') AND [name] = N'PK_PaymentDetail')
BEGIN
  ALTER TABLE [dbo].[PaymentDetail]
  ADD CONSTRAINT PK_PaymentDetail PRIMARY KEY CLUSTERED (PaymentDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentDetailStatusRef]') AND [name] = N'PK_PaymentDetailStatusRef')
BEGIN
  ALTER TABLE [dbo].[PaymentDetailStatusRef]
  ADD CONSTRAINT PK_PaymentDetailStatusRef PRIMARY KEY CLUSTERED (PaymentDetailStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentDetailStatusRef]') AND [name] = N'AK_PaymentDetailStatusRef_PaymentDetailStatusName')
BEGIN
  ALTER TABLE [dbo].[PaymentDetailStatusRef]
  ADD CONSTRAINT AK_PaymentDetailStatusRef_PaymentDetailStatusName UNIQUE NONCLUSTERED (PaymentDetailStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentDetailStatusRef]') AND [name] = N'AK_PaymentDetailStatusRef_PaymentDetailStatusDesc')
BEGIN
  ALTER TABLE [dbo].[PaymentDetailStatusRef]
  ADD CONSTRAINT AK_PaymentDetailStatusRef_PaymentDetailStatusDesc UNIQUE NONCLUSTERED (PaymentDetailStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMain]') AND [name] = N'PK_PaymentMain')
BEGIN
  ALTER TABLE [dbo].[PaymentMain]
  ADD CONSTRAINT PK_PaymentMain PRIMARY KEY CLUSTERED (PaymentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMain]') AND [name] = N'IX_PaymentMain_PayorContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PaymentMain_PayorContactKey ON [dbo].[PaymentMain] (PayorContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethod]') AND [name] = N'PK_PaymentMethod')
BEGIN
  ALTER TABLE [dbo].[PaymentMethod]
  ADD CONSTRAINT PK_PaymentMethod PRIMARY KEY CLUSTERED (PaymentMethodKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethod]') AND [name] = N'AK_PaymentMethod_PaymentMethodName')
BEGIN
  ALTER TABLE [dbo].[PaymentMethod]
  ADD CONSTRAINT AK_PaymentMethod_PaymentMethodName UNIQUE NONCLUSTERED (PaymentMethodName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethodSetDetail]') AND [name] = N'PK_PaymentMethodSetDetail')
BEGIN
  ALTER TABLE [dbo].[PaymentMethodSetDetail]
  ADD CONSTRAINT PK_PaymentMethodSetDetail PRIMARY KEY CLUSTERED (MethodSetDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentScheduleLine]') AND [name] = N'PK_PaymentScheduleLine')
BEGIN
  ALTER TABLE [dbo].[PaymentScheduleLine]
  ADD CONSTRAINT PK_PaymentScheduleLine PRIMARY KEY CLUSTERED (PaymentScheduleLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentScheduleLine]') AND [name] = N'IX_PaymentScheduleLine_PaymentScheduleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PaymentScheduleLine_PaymentScheduleKey ON [dbo].[PaymentScheduleLine] (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentScheduleLine]') AND [name] = N'IX_PaymentScheduleLine_DateDue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PaymentScheduleLine_DateDue ON [dbo].[PaymentScheduleLine] (DueDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentTerms]') AND [name] = N'PK_PaymentTerms')
BEGIN
  ALTER TABLE [dbo].[PaymentTerms]
  ADD CONSTRAINT PK_PaymentTerms PRIMARY KEY CLUSTERED (PaymentTermsKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentTermsCustomLine]') AND [name] = N'PK_PaymentTermsCustomLine')
BEGIN
  ALTER TABLE [dbo].[PaymentTermsCustomLine]
  ADD CONSTRAINT PK_PaymentTermsCustomLine PRIMARY KEY CLUSTERED (PaymentTermsCustomLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentTermsCustomLine]') AND [name] = N'IX_PaymentTermsCustomLine_PaymentTermsKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PaymentTermsCustomLine_PaymentTermsKey ON [dbo].[PaymentTermsCustomLine] (PaymentTermsKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentType]') AND [name] = N'PK_PaymentType')
BEGIN
  ALTER TABLE [dbo].[PaymentType]
  ADD CONSTRAINT PK_PaymentType PRIMARY KEY CLUSTERED (PaymentTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentType]') AND [name] = N'AK_PaymentType_PaymentTypeName')
BEGIN
  ALTER TABLE [dbo].[PaymentType]
  ADD CONSTRAINT AK_PaymentType_PaymentTypeName UNIQUE NONCLUSTERED (PaymentTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PciAuditLog]') AND [name] = N'PK_PciAuditLog')
BEGIN
  ALTER TABLE [dbo].[PciAuditLog]
  ADD CONSTRAINT PK_PciAuditLog PRIMARY KEY CLUSTERED (PciAuditLogId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PciAuditLog]') AND [name] = N'IX_PciAuditLog')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PciAuditLog ON [dbo].[PciAuditLog] (EventTimestamp)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Perspective]') AND [name] = N'PK_Perspective')
BEGIN
  ALTER TABLE [dbo].[Perspective]
  ADD CONSTRAINT PK_Perspective PRIMARY KEY CLUSTERED (PerspectiveKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Perspective]') AND [name] = N'IX_Perspective_RootHierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Perspective_RootHierarchyKey ON [dbo].[Perspective] (RootHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Perspective]') AND [name] = N'AK_Perspective_PerspectiveName')
BEGIN
  ALTER TABLE [dbo].[Perspective]
  ADD CONSTRAINT AK_Perspective_PerspectiveName UNIQUE NONCLUSTERED (PerspectiveName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') AND [name] = N'PK_PhysicalAddress')
BEGIN
  ALTER TABLE [dbo].[PhysicalAddress]
  ADD CONSTRAINT PK_PhysicalAddress PRIMARY KEY CLUSTERED (AddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') AND [name] = N'IX_PhysicalAddress_StateProvinceCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PhysicalAddress_StateProvinceCode ON [dbo].[PhysicalAddress] (StateProvinceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') AND [name] = N'IX_PhysicalAddress_PostalCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PhysicalAddress_PostalCode ON [dbo].[PhysicalAddress] (PostalCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') AND [name] = N'IX_PhysicalAddress_CountryCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PhysicalAddress_CountryCode ON [dbo].[PhysicalAddress] (CountryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') AND [name] = N'IX_PhysicalAddress_City')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PhysicalAddress_City ON [dbo].[PhysicalAddress] (City)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PickList]') AND [name] = N'PK_PickList')
BEGIN
  ALTER TABLE [dbo].[PickList]
  ADD CONSTRAINT PK_PickList PRIMARY KEY CLUSTERED (PickListKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PickListItem]') AND [name] = N'PK_PickListItem')
BEGIN
  ALTER TABLE [dbo].[PickListItem]
  ADD CONSTRAINT PK_PickListItem PRIMARY KEY CLUSTERED (PickListItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PickListItem]') AND [name] = N'IX_PickListItem_OrderFulfillmentLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PickListItem_OrderFulfillmentLineKey ON [dbo].[PickListItem] (OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PickListItem]') AND [name] = N'AK_PickListItem_PickListKey_OrderFulfillmentLineKey')
BEGIN
  ALTER TABLE [dbo].[PickListItem]
  ADD CONSTRAINT AK_PickListItem_PickListKey_OrderFulfillmentLineKey UNIQUE NONCLUSTERED (PickListKey, OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Picture]') AND [name] = N'PK_Picture')
BEGIN
  ALTER TABLE [dbo].[Picture]
  ADD CONSTRAINT PK_Picture PRIMARY KEY CLUSTERED (ImageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PicturePurposeRef]') AND [name] = N'PK_PicturePurposeRef')
BEGIN
  ALTER TABLE [dbo].[PicturePurposeRef]
  ADD CONSTRAINT PK_PicturePurposeRef PRIMARY KEY CLUSTERED (PicturePurposeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PicturePurposeRef]') AND [name] = N'AK_PicturePurposeRef_PicturePurposeDesc')
BEGIN
  ALTER TABLE [dbo].[PicturePurposeRef]
  ADD CONSTRAINT AK_PicturePurposeRef_PicturePurposeDesc UNIQUE NONCLUSTERED (PicturePurposeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Pipeline]') AND [name] = N'PK_Pipeline')
BEGIN
  ALTER TABLE [dbo].[Pipeline]
  ADD CONSTRAINT PK_Pipeline PRIMARY KEY CLUSTERED (PipelineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Pipeline]') AND [name] = N'AK_Pipeline_OrderTypeKey_Name')
BEGIN
  ALTER TABLE [dbo].[Pipeline]
  ADD CONSTRAINT AK_Pipeline_OrderTypeKey_Name UNIQUE NONCLUSTERED (OrderTypeKey, Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PipelineStage]') AND [name] = N'PK_PipelineStage')
BEGIN
  ALTER TABLE [dbo].[PipelineStage]
  ADD CONSTRAINT PK_PipelineStage PRIMARY KEY CLUSTERED (PipelineStageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PipelineStage]') AND [name] = N'AK_PipelineStage_PipelineKey_ComponentKey')
BEGIN
  ALTER TABLE [dbo].[PipelineStage]
  ADD CONSTRAINT AK_PipelineStage_PipelineKey_ComponentKey UNIQUE NONCLUSTERED (PipelineKey, ComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PledgeReport]') AND [name] = N'iPledgeReportTransactionNumber')
BEGIN
  CREATE CLUSTERED INDEX iPledgeReportTransactionNumber ON [dbo].[PledgeReport] (TransactionNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PledgeReport]') AND [name] = N'iPledgeReportTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iPledgeReportTransactionDate ON [dbo].[PledgeReport] (TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PledgeReport]') AND [name] = N'iPledgeReportIDTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iPledgeReportIDTransactionDate ON [dbo].[PledgeReport] (ID, TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'PK_PostalCodeRef')
BEGIN
  ALTER TABLE [dbo].[PostalCodeRef]
  ADD CONSTRAINT PK_PostalCodeRef PRIMARY KEY CLUSTERED (PostalCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'IX_PostalCodeRef_StateProvinceCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PostalCodeRef_StateProvinceCode ON [dbo].[PostalCodeRef] (StateProvinceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'IX_PostalCodeRef_CountryCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PostalCodeRef_CountryCode ON [dbo].[PostalCodeRef] (CountryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'IX_PostalCodeRef_City')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PostalCodeRef_City ON [dbo].[PostalCodeRef] (City)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'IX_PostalCodeRef')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_PostalCodeRef ON [dbo].[PostalCodeRef] (PostalCode, CountryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'AK_PostalCodeRef_ChapterGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_PostalCodeRef_ChapterGroupKey ON [dbo].[PostalCodeRef] (ChapterGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'PK_PotentialMatchingGift')
BEGIN
  ALTER TABLE [dbo].[PotentialMatchingGift]
  ADD CONSTRAINT PK_PotentialMatchingGift PRIMARY KEY CLUSTERED (PotentialMatchingGiftKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'IX_PotentialMatchingGift_MatchingGiftPlanKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PotentialMatchingGift_MatchingGiftPlanKey ON [dbo].[PotentialMatchingGift] (MatchingGiftPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'IX_PotentialMatchingGift_DonationPartKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PotentialMatchingGift_DonationPartKey ON [dbo].[PotentialMatchingGift] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PrefixRef]') AND [name] = N'PK_PrefixRef')
BEGIN
  ALTER TABLE [dbo].[PrefixRef]
  ADD CONSTRAINT PK_PrefixRef PRIMARY KEY CLUSTERED (PrefixCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PrefixRef]') AND [name] = N'AX_PrefixRef_PrefixKey')
BEGIN
  ALTER TABLE [dbo].[PrefixRef]
  ADD CONSTRAINT AX_PrefixRef_PrefixKey UNIQUE NONCLUSTERED (PrefixKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBasisRef]') AND [name] = N'PK_PriceBasisRef')
BEGIN
  ALTER TABLE [dbo].[PriceBasisRef]
  ADD CONSTRAINT PK_PriceBasisRef PRIMARY KEY CLUSTERED (PriceBasisCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBasisRef]') AND [name] = N'AK_PriceBasisRef_PriceBasisName')
BEGIN
  ALTER TABLE [dbo].[PriceBasisRef]
  ADD CONSTRAINT AK_PriceBasisRef_PriceBasisName UNIQUE NONCLUSTERED (PriceBasisName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBasisRef]') AND [name] = N'AK_PriceBasisRef_PriceBasisDesc')
BEGIN
  ALTER TABLE [dbo].[PriceBasisRef]
  ADD CONSTRAINT AK_PriceBasisRef_PriceBasisDesc UNIQUE NONCLUSTERED (PriceBasisDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBreak]') AND [name] = N'PK_PriceBreak')
BEGIN
  ALTER TABLE [dbo].[PriceBreak]
  ADD CONSTRAINT PK_PriceBreak PRIMARY KEY CLUSTERED (PriceBreakKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBreak]') AND [name] = N'IX_PriceBreak_PriceDetailKey_UomKey_MinQuantity')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceBreak_PriceDetailKey_UomKey_MinQuantity ON [dbo].[PriceBreak] (PriceDetailKey, UomKey, MinQuantity)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceBreak]') AND [name] = N'IX_PriceBreak_PriceDetailKey_MinQuantity')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceBreak_PriceDetailKey_MinQuantity ON [dbo].[PriceBreak] (PriceDetailKey, MinQuantity)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceDetail]') AND [name] = N'PK_PriceDetail')
BEGIN
  ALTER TABLE [dbo].[PriceDetail]
  ADD CONSTRAINT PK_PriceDetail PRIMARY KEY CLUSTERED (PriceDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceDetail]') AND [name] = N'IX_PriceDetail_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceDetail_ProductKey ON [dbo].[PriceDetail] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheet]') AND [name] = N'PK_PriceSheet')
BEGIN
  ALTER TABLE [dbo].[PriceSheet]
  ADD CONSTRAINT PK_PriceSheet PRIMARY KEY CLUSTERED (PriceSheetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheet]') AND [name] = N'IX_PriceSheet_ParentPriceSheetKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceSheet_ParentPriceSheetKey ON [dbo].[PriceSheet] (ParentPriceSheetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheet]') AND [name] = N'IX_PriceSheet_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceSheet_Name ON [dbo].[PriceSheet] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheetDiscount]') AND [name] = N'PK_PriceSheetDiscount')
BEGIN
  ALTER TABLE [dbo].[PriceSheetDiscount]
  ADD CONSTRAINT PK_PriceSheetDiscount PRIMARY KEY CLUSTERED (PriceSheetVersionKey, DiscountRuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheetVersion]') AND [name] = N'PK_PriceSheetVersion')
BEGIN
  ALTER TABLE [dbo].[PriceSheetVersion]
  ADD CONSTRAINT PK_PriceSheetVersion PRIMARY KEY CLUSTERED (PriceSheetVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheetVersion]') AND [name] = N'IX_PriceSheetVersion_PriceSheetKey_Version')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceSheetVersion_PriceSheetKey_Version ON [dbo].[PriceSheetVersion] (PriceSheetKey, Version)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceSheetVersion]') AND [name] = N'IX_PriceSheetVersion_PriceSheetKey_BeginDate_EndDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceSheetVersion_PriceSheetKey_BeginDate_EndDate ON [dbo].[PriceSheetVersion] (PriceSheetKey, BeginDate, EndDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceVersionDetail]') AND [name] = N'PK_PriceVersionDetail')
BEGIN
  ALTER TABLE [dbo].[PriceVersionDetail]
  ADD CONSTRAINT PK_PriceVersionDetail PRIMARY KEY CLUSTERED (PriceSheetVersionKey, PriceDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceVersionDetail]') AND [name] = N'IX_PriceVersionDetail_PriceDetailKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceVersionDetail_PriceDetailKey ON [dbo].[PriceVersionDetail] (PriceDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PriceVersionDetail]') AND [name] = N'IX_PriceVersionDetail_OriginalPriceDetailKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PriceVersionDetail_OriginalPriceDetailKey ON [dbo].[PriceVersionDetail] (OriginalPriceDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PricingTypeRef]') AND [name] = N'PK_PricingTypeRef')
BEGIN
  ALTER TABLE [dbo].[PricingTypeRef]
  ADD CONSTRAINT PK_PricingTypeRef PRIMARY KEY CLUSTERED (PricingTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PricingTypeRef]') AND [name] = N'AK_PricingTypeRef_PricingTypeName')
BEGIN
  ALTER TABLE [dbo].[PricingTypeRef]
  ADD CONSTRAINT AK_PricingTypeRef_PricingTypeName UNIQUE NONCLUSTERED (PricingTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PricingTypeRef]') AND [name] = N'AK_PricingTypeRef_PricingTypeDesc')
BEGIN
  ALTER TABLE [dbo].[PricingTypeRef]
  ADD CONSTRAINT AK_PricingTypeRef_PricingTypeDesc UNIQUE NONCLUSTERED (PricingTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProcessEngineType]') AND [name] = N'PK_ProcessEngineType')
BEGIN
  ALTER TABLE [dbo].[ProcessEngineType]
  ADD CONSTRAINT PK_ProcessEngineType PRIMARY KEY CLUSTERED (ProcessEngineTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProcessEngineType]') AND [name] = N'AK_ProcessEngineType_Name')
BEGIN
  ALTER TABLE [dbo].[ProcessEngineType]
  ADD CONSTRAINT AK_ProcessEngineType_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prod_Label_Pref]') AND [name] = N'PK_Prod_Label_Pref')
BEGIN
  ALTER TABLE [dbo].[Prod_Label_Pref]
  ADD CONSTRAINT PK_Prod_Label_Pref PRIMARY KEY CLUSTERED (CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Producer]') AND [name] = N'PK_Producer')
BEGIN
  ALTER TABLE [dbo].[Producer]
  ADD CONSTRAINT PK_Producer PRIMARY KEY CLUSTERED (ContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'PK_Product')
BEGIN
  ALTER TABLE [dbo].[Product]
  ADD CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductTITLE_KEY')
BEGIN
  CREATE NONCLUSTERED INDEX iProductTITLE_KEY ON [dbo].[Product] (TITLE_KEY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductPRODUCT_MAJOR')
BEGIN
  CREATE NONCLUSTERED INDEX iProductPRODUCT_MAJOR ON [dbo].[Product] (PRODUCT_MAJOR)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductPROD_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iProductPROD_TYPE ON [dbo].[Product] (PROD_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductCATEGORY')
BEGIN
  CREATE NONCLUSTERED INDEX iProductCATEGORY ON [dbo].[Product] (CATEGORY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'AK_Product_ProductKey')
BEGIN
  ALTER TABLE [dbo].[Product]
  ADD CONSTRAINT AK_Product_ProductKey UNIQUE NONCLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Cat]') AND [name] = N'PK_Product_Cat')
BEGIN
  ALTER TABLE [dbo].[Product_Cat]
  ADD CONSTRAINT PK_Product_Cat PRIMARY KEY NONCLUSTERED (PRODUCT_CATEGORY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Cert]') AND [name] = N'PK_Product_Cert')
BEGIN
  ALTER TABLE [dbo].[Product_Cert]
  ADD CONSTRAINT PK_Product_Cert PRIMARY KEY NONCLUSTERED (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_FR]') AND [name] = N'iProduct_FRTYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_FRTYPE ON [dbo].[Product_FR] (FR_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Function]') AND [name] = N'PK_Product_Function')
BEGIN
  ALTER TABLE [dbo].[Product_Function]
  ADD CONSTRAINT PK_Product_Function PRIMARY KEY CLUSTERED (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Instance]') AND [name] = N'PK_Product_Instance')
BEGIN
  ALTER TABLE [dbo].[Product_Instance]
  ADD CONSTRAINT PK_Product_Instance PRIMARY KEY NONCLUSTERED (PRODUCT_CODE, INSTANCE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Inventory]') AND [name] = N'PK_Product_Inventory')
BEGIN
  ALTER TABLE [dbo].[Product_Inventory]
  ADD CONSTRAINT PK_Product_Inventory PRIMARY KEY CLUSTERED (PRODUCT_CODE, LOCATION)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Inventory]') AND [name] = N'iProduct_InventoryLOCATION')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_InventoryLOCATION ON [dbo].[Product_Inventory] (LOCATION)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Kit]') AND [name] = N'PK_Product_Kit')
BEGIN
  ALTER TABLE [dbo].[Product_Kit]
  ADD CONSTRAINT PK_Product_Kit PRIMARY KEY NONCLUSTERED (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Kit]') AND [name] = N'iProduct_KitPRODUCT_CODE')
BEGIN
  CREATE CLUSTERED INDEX iProduct_KitPRODUCT_CODE ON [dbo].[Product_Kit] (PRODUCT_CODE, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Kit]') AND [name] = N'iProduct_KitITEM_PRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_KitITEM_PRODUCT_CODE ON [dbo].[Product_Kit] (ITEM_PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Location]') AND [name] = N'iProduct_LocationLOCATION_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_LocationLOCATION_CODE ON [dbo].[Product_Location] (LOCATION_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Lot]') AND [name] = N'PK_Product_Lot')
BEGIN
  ALTER TABLE [dbo].[Product_Lot]
  ADD CONSTRAINT PK_Product_Lot PRIMARY KEY CLUSTERED (PRODUCT_CODE, LOCATION, LOT_SERIAL)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Lot]') AND [name] = N'iProduct_LotAVAILABLE_KEY')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_LotAVAILABLE_KEY ON [dbo].[Product_Lot] (AVAILABLE_KEY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Price]') AND [name] = N'PK_Product_Price')
BEGIN
  ALTER TABLE [dbo].[Product_Price]
  ADD CONSTRAINT PK_Product_Price PRIMARY KEY CLUSTERED (PRODUCT_CODE, RULE_TYPE, CUSTOMER_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Price]') AND [name] = N'iProduct_PriceRULE_KEY')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_PriceRULE_KEY ON [dbo].[Product_Price] (RULE_KEY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Pub]') AND [name] = N'iProduct_PubPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_PubPRODUCT_CODE ON [dbo].[Product_Pub] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Sub]') AND [name] = N'PK_Product_Sub')
BEGIN
  ALTER TABLE [dbo].[Product_Sub]
  ADD CONSTRAINT PK_Product_Sub PRIMARY KEY CLUSTERED (PRODUCT_CODE, LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Sub]') AND [name] = N'iProduct_SubCHILD_PRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_SubCHILD_PRODUCT_CODE ON [dbo].[Product_Sub] (CHILD_PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Substitute]') AND [name] = N'iProduct_SubstituteSUBSTITUTE_')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_SubstituteSUBSTITUTE_ ON [dbo].[Product_Substitute] (SUBSTITUTE_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Substitute]') AND [name] = N'iProduct_SubstituteSUB_PRODUCT')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_SubstituteSUB_PRODUCT ON [dbo].[Product_Substitute] (SUB_PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Substitute]') AND [name] = N'iProduct_SubstituteSEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_SubstituteSEQN ON [dbo].[Product_Substitute] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Substitute]') AND [name] = N'iProduct_SubstitutePRODUCT_COD')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_SubstitutePRODUCT_COD ON [dbo].[Product_Substitute] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Tax]') AND [name] = N'iProduct_TaxPRODUCT_CODE')
BEGIN
  CREATE CLUSTERED INDEX iProduct_TaxPRODUCT_CODE ON [dbo].[Product_Tax] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'PK_Product_Trans')
BEGIN
  ALTER TABLE [dbo].[Product_Trans]
  ADD CONSTRAINT PK_Product_Trans PRIMARY KEY CLUSTERED (PTRANS_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransTRANSACTION_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransTRANSACTION_DATE ON [dbo].[Product_Trans] (TRANSACTION_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransTRANS_GROUP_NUMB')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransTRANS_GROUP_NUMB ON [dbo].[Product_Trans] (TRANS_GROUP_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransTO_BIN')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransTO_BIN ON [dbo].[Product_Trans] (TO_BIN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransPRODUCT_CODE ON [dbo].[Product_Trans] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransPO_REFERENCE_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransPO_REFERENCE_NUM ON [dbo].[Product_Trans] (PO_REFERENCE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') AND [name] = N'iProduct_TransFROM_LOCATION')
BEGIN
  CREATE NONCLUSTERED INDEX iProduct_TransFROM_LOCATION ON [dbo].[Product_Trans] (FROM_LOCATION)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product_Type]') AND [name] = N'PK_Product_Type')
BEGIN
  ALTER TABLE [dbo].[Product_Type]
  ADD CONSTRAINT PK_Product_Type PRIMARY KEY CLUSTERED (PROD_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductBook]') AND [name] = N'PK_ProductBook')
BEGIN
  ALTER TABLE [dbo].[ProductBook]
  ADD CONSTRAINT PK_ProductBook PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductBook]') AND [name] = N'IX_ProductBook_Publisher')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductBook_Publisher ON [dbo].[ProductBook] (Publisher)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductBook]') AND [name] = N'IX_ProductBook_Author')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductBook_Author ON [dbo].[ProductBook] (Author)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductClass]') AND [name] = N'PK_ProductClass')
BEGIN
  ALTER TABLE [dbo].[ProductClass]
  ADD CONSTRAINT PK_ProductClass PRIMARY KEY CLUSTERED (ProductClassKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductClass]') AND [name] = N'AK_ProductClass_SystemEntityKey_Name')
BEGIN
  ALTER TABLE [dbo].[ProductClass]
  ADD CONSTRAINT AK_ProductClass_SystemEntityKey_Name UNIQUE NONCLUSTERED (SystemEntityKey, Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductClothing]') AND [name] = N'PK_ProductClothing')
BEGIN
  ALTER TABLE [dbo].[ProductClothing]
  ADD CONSTRAINT PK_ProductClothing PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductDescription]') AND [name] = N'PK_ProductDescription')
BEGIN
  ALTER TABLE [dbo].[ProductDescription]
  ADD CONSTRAINT PK_ProductDescription PRIMARY KEY CLUSTERED (ProductKey, CultureCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductDescription]') AND [name] = N'IX_ProductDescription_Title')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductDescription_Title ON [dbo].[ProductDescription] (Title)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductFundraising]') AND [name] = N'PK_ProductFundraising')
BEGIN
  ALTER TABLE [dbo].[ProductFundraising]
  ADD CONSTRAINT PK_ProductFundraising PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductFundraising]') AND [name] = N'IX_ProductFundraising_FundKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductFundraising_FundKey ON [dbo].[ProductFundraising] (FundKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductGLAccount]') AND [name] = N'PK_ProductGLAccount')
BEGIN
  ALTER TABLE [dbo].[ProductGLAccount]
  ADD CONSTRAINT PK_ProductGLAccount PRIMARY KEY CLUSTERED (ProductGLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductGLAccount]') AND [name] = N'IX_ProductGLAccount_ParentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductGLAccount_ParentKey ON [dbo].[ProductGLAccount] (ParentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductGLAccount]') AND [name] = N'IX_ProductGLAccount_GLAccountPurposeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductGLAccount_GLAccountPurposeCode ON [dbo].[ProductGLAccount] (GLAccountPurposeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductGLAccount]') AND [name] = N'IX_ProductGLAccount_GLAccountKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductGLAccount_GLAccountKey ON [dbo].[ProductGLAccount] (GLAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductInventory]') AND [name] = N'PK_ProductInventory')
BEGIN
  ALTER TABLE [dbo].[ProductInventory]
  ADD CONSTRAINT PK_ProductInventory PRIMARY KEY CLUSTERED (ProductInventoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductInventory]') AND [name] = N'IX_ProductInventory_Product_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductInventory_Product_ProductKey ON [dbo].[ProductInventory] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductInventory]') AND [name] = N'IX_ProductInventory_Location_LocationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductInventory_Location_LocationKey ON [dbo].[ProductInventory] (LocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductInventory]') AND [name] = N'AK_ProductInventory_ProductKey_LocationKey_LotID')
BEGIN
  ALTER TABLE [dbo].[ProductInventory]
  ADD CONSTRAINT AK_ProductInventory_ProductKey_LocationKey_LotID UNIQUE NONCLUSTERED (ProductKey, LocationKey, LotId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMain]') AND [name] = N'PK_ProductMain')
BEGIN
  ALTER TABLE [dbo].[ProductMain]
  ADD CONSTRAINT PK_ProductMain PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMain]') AND [name] = N'IX_ProductMain_UomGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductMain_UomGroupKey ON [dbo].[ProductMain] (UomGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMain]') AND [name] = N'IX_ProductMain_ProductTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductMain_ProductTypeKey ON [dbo].[ProductMain] (ProductTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMain]') AND [name] = N'IX_ProductMain_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductMain_Name ON [dbo].[ProductMain] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMain]') AND [name] = N'AK_ProductMain_ProductCode')
BEGIN
  ALTER TABLE [dbo].[ProductMain]
  ADD CONSTRAINT AK_ProductMain_ProductCode UNIQUE NONCLUSTERED (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMaster]') AND [name] = N'PK_ProductMaster')
BEGIN
  ALTER TABLE [dbo].[ProductMaster]
  ADD CONSTRAINT PK_ProductMaster PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMaster]') AND [name] = N'IX_ProductMaster_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductMaster_ProductKey ON [dbo].[ProductMaster] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductMembership]') AND [name] = N'PK_ProductMembership')
BEGIN
  ALTER TABLE [dbo].[ProductMembership]
  ADD CONSTRAINT PK_ProductMembership PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductSetItem]') AND [name] = N'PK_ProductSetItem')
BEGIN
  ALTER TABLE [dbo].[ProductSetItem]
  ADD CONSTRAINT PK_ProductSetItem PRIMARY KEY CLUSTERED (ProductSetItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductSetItem]') AND [name] = N'IX_ProductSetItem_ChildProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductSetItem_ChildProductKey ON [dbo].[ProductSetItem] (ChildProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductSetItem]') AND [name] = N'AK_ProductSetItem_ParentProductKey_ChildProductKey')
BEGIN
  ALTER TABLE [dbo].[ProductSetItem]
  ADD CONSTRAINT AK_ProductSetItem_ParentProductKey_ChildProductKey UNIQUE NONCLUSTERED (ParentProductKey, ChildProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductSetTypeRef]') AND [name] = N'PK_ProductSetTypeRef')
BEGIN
  ALTER TABLE [dbo].[ProductSetTypeRef]
  ADD CONSTRAINT PK_ProductSetTypeRef PRIMARY KEY CLUSTERED (ProductSetTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductSetTypeRef]') AND [name] = N'AK_ProductSetTypeRef_ProductSetTypeDesc')
BEGIN
  ALTER TABLE [dbo].[ProductSetTypeRef]
  ADD CONSTRAINT AK_ProductSetTypeRef_ProductSetTypeDesc UNIQUE NONCLUSTERED (ProductSetTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductStatistics]') AND [name] = N'PK_ProductStatistics')
BEGIN
  ALTER TABLE [dbo].[ProductStatistics]
  ADD CONSTRAINT PK_ProductStatistics PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductStatusRef]') AND [name] = N'PK_ProductStatusRef')
BEGIN
  ALTER TABLE [dbo].[ProductStatusRef]
  ADD CONSTRAINT PK_ProductStatusRef PRIMARY KEY CLUSTERED (ProductStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductStatusRef]') AND [name] = N'AK_ProductStatusRef_ProductStatusName')
BEGIN
  ALTER TABLE [dbo].[ProductStatusRef]
  ADD CONSTRAINT AK_ProductStatusRef_ProductStatusName UNIQUE NONCLUSTERED (ProductStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductStatusRef]') AND [name] = N'AK_ProductStatusRef_ProductStatusDesc')
BEGIN
  ALTER TABLE [dbo].[ProductStatusRef]
  ADD CONSTRAINT AK_ProductStatusRef_ProductStatusDesc UNIQUE NONCLUSTERED (ProductStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductTax]') AND [name] = N'PK_ProductTax')
BEGIN
  ALTER TABLE [dbo].[ProductTax]
  ADD CONSTRAINT PK_ProductTax PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductTest]') AND [name] = N'PK_ProductTest')
BEGIN
  ALTER TABLE [dbo].[ProductTest]
  ADD CONSTRAINT PK_ProductTest PRIMARY KEY CLUSTERED (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductType]') AND [name] = N'PK_ProductType')
BEGIN
  ALTER TABLE [dbo].[ProductType]
  ADD CONSTRAINT PK_ProductType PRIMARY KEY CLUSTERED (ProductTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductType]') AND [name] = N'IX_ProductType_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductType_Name ON [dbo].[ProductType] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductType]') AND [name] = N'AK_ProductType_Name')
BEGIN
  ALTER TABLE [dbo].[ProductType]
  ADD CONSTRAINT AK_ProductType_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductWarehouse]') AND [name] = N'PK_ProductWarehouse')
BEGIN
  ALTER TABLE [dbo].[ProductWarehouse]
  ADD CONSTRAINT PK_ProductWarehouse PRIMARY KEY CLUSTERED (ProductWarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductWarehouse]') AND [name] = N'IX_ProductWarehouse_WarehouseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductWarehouse_WarehouseKey ON [dbo].[ProductWarehouse] (WarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductWarehouse]') AND [name] = N'IX_ProductWarehouse_ProductKey_WarehouseKey')
BEGIN
  ALTER TABLE [dbo].[ProductWarehouse]
  ADD CONSTRAINT IX_ProductWarehouse_ProductKey_WarehouseKey UNIQUE NONCLUSTERED (ProductKey, WarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProductWarehouse]') AND [name] = N'IX_ProductWarehouse_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProductWarehouse_ProductKey ON [dbo].[ProductWarehouse] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'PK_Program_ProgramKey')
BEGIN
  ALTER TABLE [dbo].[Program]
  ADD CONSTRAINT PK_Program_ProgramKey PRIMARY KEY CLUSTERED (ProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') AND [name] = N'PK_ProgramGroup_ProgramGroupKey')
BEGIN
  ALTER TABLE [dbo].[ProgramGroup]
  ADD CONSTRAINT PK_ProgramGroup_ProgramGroupKey PRIMARY KEY CLUSTERED (ProgramGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroupStatusRef]') AND [name] = N'PK_ProgramGroupStatusRef_ProgramGroupStatusCode')
BEGIN
  ALTER TABLE [dbo].[ProgramGroupStatusRef]
  ADD CONSTRAINT PK_ProgramGroupStatusRef_ProgramGroupStatusCode PRIMARY KEY CLUSTERED (ProgramGroupStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramStatusRef]') AND [name] = N'PK_ProgramStatusRef_ProgramStatusCode')
BEGIN
  ALTER TABLE [dbo].[ProgramStatusRef]
  ADD CONSTRAINT PK_ProgramStatusRef_ProgramStatusCode PRIMARY KEY CLUSTERED (ProgramStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionDiscount]') AND [name] = N'PK_PromotionDiscount')
BEGIN
  ALTER TABLE [dbo].[PromotionDiscount]
  ADD CONSTRAINT PK_PromotionDiscount PRIMARY KEY CLUSTERED (PromotionDiscountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionDiscount]') AND [name] = N'IX_PromotionDiscount_PromotionRuleKey_DiscountRuleKey')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_PromotionDiscount_PromotionRuleKey_DiscountRuleKey ON [dbo].[PromotionDiscount] (PromotionRuleKey, DiscountRuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRule]') AND [name] = N'PK_PromotionRule')
BEGIN
  ALTER TABLE [dbo].[PromotionRule]
  ADD CONSTRAINT PK_PromotionRule PRIMARY KEY CLUSTERED (RuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRule]') AND [name] = N'IX_PromotionRule_PromotionRuleCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PromotionRule_PromotionRuleCode ON [dbo].[PromotionRule] (PromotionRuleCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRule]') AND [name] = N'IX_PromotionRule_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PromotionRule_ContactKey ON [dbo].[PromotionRule] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRule]') AND [name] = N'AK_PromotionRule_Code')
BEGIN
  ALTER TABLE [dbo].[PromotionRule]
  ADD CONSTRAINT AK_PromotionRule_Code UNIQUE NONCLUSTERED (Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRuleRef]') AND [name] = N'PK_PromotionRuleRef')
BEGIN
  ALTER TABLE [dbo].[PromotionRuleRef]
  ADD CONSTRAINT PK_PromotionRuleRef PRIMARY KEY CLUSTERED (PromotionRuleCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRuleRef]') AND [name] = N'AK_PromotionRuleRef_PromotionRuleName')
BEGIN
  ALTER TABLE [dbo].[PromotionRuleRef]
  ADD CONSTRAINT AK_PromotionRuleRef_PromotionRuleName UNIQUE NONCLUSTERED (PromotionRuleName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRuleRef]') AND [name] = N'AK_PromotionRuleRef_PromotionRuleDesc')
BEGIN
  ALTER TABLE [dbo].[PromotionRuleRef]
  ADD CONSTRAINT AK_PromotionRuleRef_PromotionRuleDesc UNIQUE NONCLUSTERED (PromotionRuleDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefinition]') AND [name] = N'PK_PropertyDefinition')
BEGIN
  ALTER TABLE [dbo].[PropertyDefinition]
  ADD CONSTRAINT PK_PropertyDefinition PRIMARY KEY CLUSTERED (PropertyDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'PK_Prospect')
BEGIN
  ALTER TABLE [dbo].[Prospect]
  ADD CONSTRAINT PK_Prospect PRIMARY KEY CLUSTERED (ProspectKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_StateProvince')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_StateProvince ON [dbo].[Prospect] (StateProvince)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_ProspectID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_ProspectID ON [dbo].[Prospect] (ProspectID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_PostalCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_PostalCode ON [dbo].[Prospect] (PostalCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_LastFirst')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_LastFirst ON [dbo].[Prospect] (LastFirst)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_ImportDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_ImportDate ON [dbo].[Prospect] (ImportDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_Country')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_Country ON [dbo].[Prospect] (Country)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_CompanySort')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_CompanySort ON [dbo].[Prospect] (CompanySort)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') AND [name] = N'IX_Prospect_City')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Prospect_City ON [dbo].[Prospect] (City)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Message_Log]') AND [name] = N'PK_Publish_Message_Log')
BEGIN
  ALTER TABLE [dbo].[Publish_Message_Log]
  ADD CONSTRAINT PK_Publish_Message_Log PRIMARY KEY CLUSTERED (PublishMessageLogID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Priority_Ref]') AND [name] = N'PK_Publish_Priority_Ref')
BEGIN
  ALTER TABLE [dbo].[Publish_Priority_Ref]
  ADD CONSTRAINT PK_Publish_Priority_Ref PRIMARY KEY CLUSTERED (PublishPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request]') AND [name] = N'PK_Publish_Request')
BEGIN
  ALTER TABLE [dbo].[Publish_Request]
  ADD CONSTRAINT PK_Publish_Request PRIMARY KEY CLUSTERED (PublishRequestID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'PK_Publish_Request_Detail')
BEGIN
  ALTER TABLE [dbo].[Publish_Request_Detail]
  ADD CONSTRAINT PK_Publish_Request_Detail PRIMARY KEY CLUSTERED (PublishRequestDetailID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Status_Ref]') AND [name] = N'PK_Publish_Request_Status_Ref')
BEGIN
  ALTER TABLE [dbo].[Publish_Request_Status_Ref]
  ADD CONSTRAINT PK_Publish_Request_Status_Ref PRIMARY KEY CLUSTERED (PublishRequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Server_Ref]') AND [name] = N'PK_Publish_Server_Ref')
BEGIN
  ALTER TABLE [dbo].[Publish_Server_Ref]
  ADD CONSTRAINT PK_Publish_Server_Ref PRIMARY KEY CLUSTERED (PublishServerCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishMessageLog]') AND [name] = N'PK_PublishMessageLog')
BEGIN
  ALTER TABLE [dbo].[PublishMessageLog]
  ADD CONSTRAINT PK_PublishMessageLog PRIMARY KEY CLUSTERED (PublishMessageLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishPriorityRef]') AND [name] = N'PK_PublishPriorityRef')
BEGIN
  ALTER TABLE [dbo].[PublishPriorityRef]
  ADD CONSTRAINT PK_PublishPriorityRef PRIMARY KEY CLUSTERED (PublishPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') AND [name] = N'PK_PublishRequest')
BEGIN
  ALTER TABLE [dbo].[PublishRequest]
  ADD CONSTRAINT PK_PublishRequest PRIMARY KEY CLUSTERED (PublishRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'PK_PublishRequestDetail')
BEGIN
  ALTER TABLE [dbo].[PublishRequestDetail]
  ADD CONSTRAINT PK_PublishRequestDetail PRIMARY KEY CLUSTERED (PublishRequestDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestStatusRef]') AND [name] = N'PK_PublishRequestStatusRef')
BEGIN
  ALTER TABLE [dbo].[PublishRequestStatusRef]
  ADD CONSTRAINT PK_PublishRequestStatusRef PRIMARY KEY CLUSTERED (PublishRequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishServerRef]') AND [name] = N'PK_PublishServerRef')
BEGIN
  ALTER TABLE [dbo].[PublishServerRef]
  ADD CONSTRAINT PK_PublishServerRef PRIMARY KEY CLUSTERED (PublishServerCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[QualityRef]') AND [name] = N'PK_QualityRef')
BEGIN
  ALTER TABLE [dbo].[QualityRef]
  ADD CONSTRAINT PK_QualityRef PRIMARY KEY CLUSTERED (QualityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[QueryResultItem]') AND [name] = N'IX_QueryResultItem_QueryResultKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_QueryResultItem_QueryResultKey ON [dbo].[QueryResultItem] (QueryResultKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[QueryResultMain]') AND [name] = N'PK_QueryResultMain')
BEGIN
  ALTER TABLE [dbo].[QueryResultMain]
  ADD CONSTRAINT PK_QueryResultMain PRIMARY KEY CLUSTERED (QueryResultKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReasonCode]') AND [name] = N'PK_ReasonCode')
BEGIN
  ALTER TABLE [dbo].[ReasonCode]
  ADD CONSTRAINT PK_ReasonCode PRIMARY KEY CLUSTERED (ReasonCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReasonCode]') AND [name] = N'AK_ReasonCode_Code_OrganizationKey')
BEGIN
  ALTER TABLE [dbo].[ReasonCode]
  ADD CONSTRAINT AK_ReasonCode_Code_OrganizationKey UNIQUE NONCLUSTERED (Code, OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptName_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptName_ID ON [dbo].[Receipt] (Name_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptManual_Receipt_Num')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptManual_Receipt_Num ON [dbo].[Receipt] (Manual_Receipt_Num)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptID')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptID ON [dbo].[Receipt] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptDate_Issued')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptDate_Issued ON [dbo].[Receipt] (Date_Issued)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptCanceled_Receipt_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptCanceled_Receipt_ID ON [dbo].[Receipt] (Canceled_Receipt_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptCanceled')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptCanceled ON [dbo].[Receipt] (Canceled)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptBatch_Num')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptBatch_Num ON [dbo].[Receipt] (Batch_Num)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptAuto_Receipt_Num')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptAuto_Receipt_Num ON [dbo].[Receipt] (Auto_Receipt_Num)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptAmount')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptAmount ON [dbo].[Receipt] (Amount)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') AND [name] = N'iReceiptAggregate_Payment')
BEGIN
  CREATE NONCLUSTERED INDEX iReceiptAggregate_Payment ON [dbo].[Receipt] (Aggregate_Indicator)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptLine]') AND [name] = N'PK_ReceiptLine')
BEGIN
  ALTER TABLE [dbo].[ReceiptLine]
  ADD CONSTRAINT PK_ReceiptLine PRIMARY KEY CLUSTERED (ReceiptLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptLine]') AND [name] = N'IX_ReceiptLine_ReceiptKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptLine_ReceiptKey ON [dbo].[ReceiptLine] (ReceiptKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'PK_ReceiptMain')
BEGIN
  ALTER TABLE [dbo].[ReceiptMain]
  ADD CONSTRAINT PK_ReceiptMain PRIMARY KEY CLUSTERED (ReceiptKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'AK_Receipt_ReceiptNumber')
BEGIN
  ALTER TABLE [dbo].[ReceiptMain]
  ADD CONSTRAINT AK_Receipt_ReceiptNumber UNIQUE NONCLUSTERED (ReceiptNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptTypeRef]') AND [name] = N'PK_ReceiptTypeRef')
BEGIN
  ALTER TABLE [dbo].[ReceiptTypeRef]
  ADD CONSTRAINT PK_ReceiptTypeRef PRIMARY KEY CLUSTERED (ReceiptTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptTypeRef]') AND [name] = N'AK_ReceiptTypeRef_ReceiptTypeDesc')
BEGIN
  ALTER TABLE [dbo].[ReceiptTypeRef]
  ADD CONSTRAINT AK_ReceiptTypeRef_ReceiptTypeDesc UNIQUE NONCLUSTERED (ReceiptTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') AND [name] = N'PK_RecurringDonationCommitment')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationCommitment]
  ADD CONSTRAINT PK_RecurringDonationCommitment PRIMARY KEY CLUSTERED (RecurringDonationCommitmentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPayment]') AND [name] = N'PK_RecurringDonationExpectedPayment')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationExpectedPayment]
  ADD CONSTRAINT PK_RecurringDonationExpectedPayment PRIMARY KEY CLUSTERED (RecurringDonationExpectedPaymentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentSet]') AND [name] = N'PK_RecurringDonationExpectedPaymentSet')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet]
  ADD CONSTRAINT PK_RecurringDonationExpectedPaymentSet PRIMARY KEY CLUSTERED (RecurringDonationExpectedPaymentSetKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentSet]') AND [name] = N'IX_RecurringDonationExpectedPaymentSet_ExpectedPaymentDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RecurringDonationExpectedPaymentSet_ExpectedPaymentDate ON [dbo].[RecurringDonationExpectedPaymentSet] (ExpectedPaymentDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentSetStatusRef]') AND [name] = N'PK_RecurringDonationExpectedPaymentSetStatusRef')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSetStatusRef]
  ADD CONSTRAINT PK_RecurringDonationExpectedPaymentSetStatusRef PRIMARY KEY CLUSTERED (RecurringDonationExpectedPaymentSetStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentStatusRef]') AND [name] = N'PK_RecurringDonationExpectedPaymentStatusRef')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationExpectedPaymentStatusRef]
  ADD CONSTRAINT PK_RecurringDonationExpectedPaymentStatusRef PRIMARY KEY CLUSTERED (RecurringDonationExpectedPaymentStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationFrequencyRef]') AND [name] = N'PK_RecurringDonationFrequencyRef')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationFrequencyRef]
  ADD CONSTRAINT PK_RecurringDonationFrequencyRef PRIMARY KEY CLUSTERED (RecurringDonationFrequencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationFrequencyRef]') AND [name] = N'IX_RecurringDonationFrequencyRef_Name')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationFrequencyRef]
  ADD CONSTRAINT IX_RecurringDonationFrequencyRef_Name UNIQUE NONCLUSTERED (RecurringDonationFrequencyName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationMatchStatusRef]') AND [name] = N'PK_RecurringDonationMatchStatusRef')
BEGIN
  ALTER TABLE [dbo].[RecurringDonationMatchStatusRef]
  ADD CONSTRAINT PK_RecurringDonationMatchStatusRef PRIMARY KEY CLUSTERED (RecurringDonationMatchStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Client]') AND [name] = N'PK_Ref_Client')
BEGIN
  ALTER TABLE [dbo].[Ref_Client]
  ADD CONSTRAINT PK_Ref_Client PRIMARY KEY NONCLUSTERED (CLIENT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Client]') AND [name] = N'iRef_ClientLAST_FIRST')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ClientLAST_FIRST ON [dbo].[Ref_Client] (LAST_FIRST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Client]') AND [name] = N'iRef_ClientDATE_UPDATED')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ClientDATE_UPDATED ON [dbo].[Ref_Client] (DATE_UPDATED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Client]') AND [name] = N'iRef_ClientDATE_CREATED')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ClientDATE_CREATED ON [dbo].[Ref_Client] (DATE_CREATED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderZIP')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderZIP ON [dbo].[Ref_Provider] (ZIP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderSTATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderSTATUS ON [dbo].[Ref_Provider] (STATUS)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderPROVIDER_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderPROVIDER_ID ON [dbo].[Ref_Provider] (PROVIDER_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderLAST_REFERRED')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderLAST_REFERRED ON [dbo].[Ref_Provider] (LAST_REFERRED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderLAST_FIRST')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderLAST_FIRST ON [dbo].[Ref_Provider] (LAST_FIRST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_6')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_6 ON [dbo].[Ref_Provider] (INDEX_6)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_5')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_5 ON [dbo].[Ref_Provider] (INDEX_5)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_4')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_4 ON [dbo].[Ref_Provider] (INDEX_4)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_3')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_3 ON [dbo].[Ref_Provider] (INDEX_3)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_2')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_2 ON [dbo].[Ref_Provider] (INDEX_2)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') AND [name] = N'iRef_ProviderINDEX_1')
BEGIN
  CREATE NONCLUSTERED INDEX iRef_ProviderINDEX_1 ON [dbo].[Ref_Provider] (INDEX_1)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Table_Ref]') AND [name] = N'PK_Ref_Table_Ref')
BEGIN
  ALTER TABLE [dbo].[Ref_Table_Ref]
  ADD CONSTRAINT PK_Ref_Table_Ref PRIMARY KEY CLUSTERED (RefTableName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'PK_Referral')
BEGIN
  ALTER TABLE [dbo].[Referral]
  ADD CONSTRAINT PK_Referral PRIMARY KEY CLUSTERED (REFERRAL_ID, CLIENT_ID, PROVIDER_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralZIP')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralZIP ON [dbo].[Referral] (ZIP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralPROVIDER_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralPROVIDER_ID ON [dbo].[Referral] (PROVIDER_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralGEN_TAB_4')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralGEN_TAB_4 ON [dbo].[Referral] (GEN_TABLE_4_CHOICE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralGEN_TAB_3')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralGEN_TAB_3 ON [dbo].[Referral] (GEN_TABLE_3_CHOICE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralGEN_TAB_2')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralGEN_TAB_2 ON [dbo].[Referral] (GEN_TABLE_2_CHOICE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralGEN_TAB_1')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralGEN_TAB_1 ON [dbo].[Referral] (GEN_TABLE_1_CHOICE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralDATE_CREATED')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralDATE_CREATED ON [dbo].[Referral] (DATE_CREATED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') AND [name] = N'iReferralCLIENT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iReferralCLIENT_ID ON [dbo].[Referral] (CLIENT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'PK_RegistrationStatusChange')
BEGIN
  ALTER TABLE [dbo].[RegistrationStatusChange]
  ADD CONSTRAINT PK_RegistrationStatusChange PRIMARY KEY CLUSTERED (RegistrationStatusChangeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusRef]') AND [name] = N'PK_RegistrationStatusRef')
BEGIN
  ALTER TABLE [dbo].[RegistrationStatusRef]
  ADD CONSTRAINT PK_RegistrationStatusRef PRIMARY KEY CLUSTERED (RegistrationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Relationship]') AND [name] = N'PK_Relationship')
BEGIN
  ALTER TABLE [dbo].[Relationship]
  ADD CONSTRAINT PK_Relationship PRIMARY KEY NONCLUSTERED (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Relationship]') AND [name] = N'iRelationshipTARGET_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iRelationshipTARGET_ID ON [dbo].[Relationship] (TARGET_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Relationship]') AND [name] = N'iRelationshipID')
BEGIN
  CREATE CLUSTERED INDEX iRelationshipID ON [dbo].[Relationship] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Relationship]') AND [name] = N'iRelationshipGROUP_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iRelationshipGROUP_CODE ON [dbo].[Relationship] (GROUP_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Relationship_Types]') AND [name] = N'PK_Relationship_Types')
BEGIN
  ALTER TABLE [dbo].[Relationship_Types]
  ADD CONSTRAINT PK_Relationship_Types PRIMARY KEY CLUSTERED (RELATION_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipCategoryRef]') AND [name] = N'PK_RelationshipCategoryRef')
BEGIN
  ALTER TABLE [dbo].[RelationshipCategoryRef]
  ADD CONSTRAINT PK_RelationshipCategoryRef PRIMARY KEY CLUSTERED (RelationshipCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipCategoryRef]') AND [name] = N'IX_RelationshipCategoryRef')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_RelationshipCategoryRef ON [dbo].[RelationshipCategoryRef] (RelationshipCategoryName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipMain]') AND [name] = N'PK_RelationshipMain')
BEGIN
  ALTER TABLE [dbo].[RelationshipMain]
  ADD CONSTRAINT PK_RelationshipMain PRIMARY KEY CLUSTERED (RelationshipKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipMain]') AND [name] = N'IX_Relationship_TargetUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Relationship_TargetUniformKey ON [dbo].[RelationshipMain] (TargetUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipMain]') AND [name] = N'IX_Relationship_SubjectUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Relationship_SubjectUniformKey ON [dbo].[RelationshipMain] (SubjectUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeCategory]') AND [name] = N'PK_RelationshipTypeCategory')
BEGIN
  ALTER TABLE [dbo].[RelationshipTypeCategory]
  ADD CONSTRAINT PK_RelationshipTypeCategory PRIMARY KEY CLUSTERED (RelationshipTypeCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeCategory]') AND [name] = N'AK_RelationshipTypeCategory')
BEGIN
  ALTER TABLE [dbo].[RelationshipTypeCategory]
  ADD CONSTRAINT AK_RelationshipTypeCategory UNIQUE NONCLUSTERED (RelationshipTypeKey, RelationshipCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeRef]') AND [name] = N'PK_RelationshipTypeRef')
BEGIN
  ALTER TABLE [dbo].[RelationshipTypeRef]
  ADD CONSTRAINT PK_RelationshipTypeRef PRIMARY KEY CLUSTERED (RelationshipTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeRef]') AND [name] = N'AK_RelationshipTypeRef')
BEGIN
  ALTER TABLE [dbo].[RelationshipTypeRef]
  ADD CONSTRAINT AK_RelationshipTypeRef UNIQUE NONCLUSTERED (RelationshipTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Remittance]') AND [name] = N'PK_Remittance')
BEGIN
  ALTER TABLE [dbo].[Remittance]
  ADD CONSTRAINT PK_Remittance PRIMARY KEY CLUSTERED (RemittanceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RemittanceApplication]') AND [name] = N'PK_RemittanceApplication')
BEGIN
  ALTER TABLE [dbo].[RemittanceApplication]
  ADD CONSTRAINT PK_RemittanceApplication PRIMARY KEY CLUSTERED (RemittanceApplicationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RemittanceApplication]') AND [name] = N'IX_RemittanceApplication_InvoiceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RemittanceApplication_InvoiceKey ON [dbo].[RemittanceApplication] (InvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Report_Desc]') AND [name] = N'PK_Report_Desc')
BEGIN
  ALTER TABLE [dbo].[Report_Desc]
  ADD CONSTRAINT PK_Report_Desc PRIMARY KEY CLUSTERED (ImisSystem, Category, Title)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Request_Status_Ref]') AND [name] = N'PK_Request_Status_Ref')
BEGIN
  ALTER TABLE [dbo].[Request_Status_Ref]
  ADD CONSTRAINT PK_Request_Status_Ref PRIMARY KEY CLUSTERED (RequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResourceActionRef]') AND [name] = N'PK_ResourceActionRef')
BEGIN
  ALTER TABLE [dbo].[ResourceActionRef]
  ADD CONSTRAINT PK_ResourceActionRef PRIMARY KEY CLUSTERED (ResourceActionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResourceActionRef]') AND [name] = N'AK_ResourceActionRef_ResourceActionName')
BEGIN
  ALTER TABLE [dbo].[ResourceActionRef]
  ADD CONSTRAINT AK_ResourceActionRef_ResourceActionName UNIQUE NONCLUSTERED (ResourceActionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResourceActionRef]') AND [name] = N'AK_ResourceActionRef_ResourceActionDesc')
BEGIN
  ALTER TABLE [dbo].[ResourceActionRef]
  ADD CONSTRAINT AK_ResourceActionRef_ResourceActionDesc UNIQUE NONCLUSTERED (ResourceActionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResponseMediaRef]') AND [name] = N'PK_ResponseMediaRef')
BEGIN
  ALTER TABLE [dbo].[ResponseMediaRef]
  ADD CONSTRAINT PK_ResponseMediaRef PRIMARY KEY CLUSTERED (ResponseMediaCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResponseMediaRef]') AND [name] = N'AK_ResponseMediaRef_ResponseMediaDesc')
BEGIN
  ALTER TABLE [dbo].[ResponseMediaRef]
  ADD CONSTRAINT AK_ResponseMediaRef_ResponseMediaDesc UNIQUE NONCLUSTERED (ResponseMediaDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ResponseTypeRef]') AND [name] = N'PK_ResponseTypeRef')
BEGIN
  ALTER TABLE [dbo].[ResponseTypeRef]
  ADD CONSTRAINT PK_ResponseTypeRef PRIMARY KEY CLUSTERED (ResponseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RestockPrice]') AND [name] = N'PK_RestockPrice')
BEGIN
  ALTER TABLE [dbo].[RestockPrice]
  ADD CONSTRAINT PK_RestockPrice PRIMARY KEY CLUSTERED (RestockPriceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RestockPrice]') AND [name] = N'IX_RestockPrice_RestockPriceCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RestockPrice_RestockPriceCode ON [dbo].[RestockPrice] (RestockPriceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RestockPriceRef]') AND [name] = N'PK_RestockPriceRef')
BEGIN
  ALTER TABLE [dbo].[RestockPriceRef]
  ADD CONSTRAINT PK_RestockPriceRef PRIMARY KEY CLUSTERED (RestockPriceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition]') AND [name] = N'PK_RFMDefinition')
BEGIN
  ALTER TABLE [dbo].[RFMDefinition]
  ADD CONSTRAINT PK_RFMDefinition PRIMARY KEY CLUSTERED (RFMKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition_Detail]') AND [name] = N'PK_RFMDefinition_Detail')
BEGIN
  ALTER TABLE [dbo].[RFMDefinition_Detail]
  ADD CONSTRAINT PK_RFMDefinition_Detail PRIMARY KEY CLUSTERED (RFMKey, Type)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMMain]') AND [name] = N'PK_RFMMain')
BEGIN
  ALTER TABLE [dbo].[RFMMain]
  ADD CONSTRAINT PK_RFMMain PRIMARY KEY CLUSTERED (RFMKey, ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMMain]') AND [name] = N'IX_RFMMain_UserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RFMMain_UserKey ON [dbo].[RFMMain] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RoleMain]') AND [name] = N'PK_RoleMain')
BEGIN
  ALTER TABLE [dbo].[RoleMain]
  ADD CONSTRAINT PK_RoleMain PRIMARY KEY CLUSTERED (RoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RoundingMultipleRef]') AND [name] = N'PK_RoundingMultipleRef')
BEGIN
  ALTER TABLE [dbo].[RoundingMultipleRef]
  ADD CONSTRAINT PK_RoundingMultipleRef PRIMARY KEY CLUSTERED (RoundingMultipleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_3rdPartyPayerInfo]') AND [name] = N'iRpt_3rdPartyPayerInfoBT_ID')
BEGIN
  CREATE CLUSTERED INDEX iRpt_3rdPartyPayerInfoBT_ID ON [dbo].[Rpt_3rdPartyPayerInfo] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_3rdPartyPayerInfo]') AND [name] = N'iRpt_3rdPartyPayerInfo2')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_3rdPartyPayerInfo2 ON [dbo].[Rpt_3rdPartyPayerInfo] (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_BadgeTbl]') AND [name] = N'iRpt_BadgeTblUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_BadgeTblUserID_Date ON [dbo].[Rpt_BadgeTbl] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_BadgeTbl]') AND [name] = N'iRpt_BadgeTblTICKET_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_BadgeTblTICKET_NUMBER ON [dbo].[Rpt_BadgeTbl] (BADGE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_BadgeTbl]') AND [name] = N'iRpt_BadgeTblORDER_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_BadgeTblORDER_NUMBER ON [dbo].[Rpt_BadgeTbl] (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_InvoiceTbl]') AND [name] = N'iRpt_InvoiceTblUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_InvoiceTblUserID_Date ON [dbo].[Rpt_InvoiceTbl] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_InvoiceTbl]') AND [name] = N'iRpt_InvoiceTbl2')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_InvoiceTbl2 ON [dbo].[Rpt_InvoiceTbl] (BEGIN_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_KitTbl]') AND [name] = N'iRpt_KitTblPRODUCT_CATEGORY')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_KitTblPRODUCT_CATEGORY ON [dbo].[Rpt_KitTbl] (LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_TicketTbl]') AND [name] = N'iRpt_TicketTblUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_TicketTblUserID_Date ON [dbo].[Rpt_TicketTbl] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_TicketTbl]') AND [name] = N'iRpt_TicketTblORDER_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_TicketTblORDER_NUMBER ON [dbo].[Rpt_TicketTbl] (ORDER_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') AND [name] = N'iRpt_WorkingTblUserID_Date')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_WorkingTblUserID_Date ON [dbo].[Rpt_WorkingTbl] (UserID_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') AND [name] = N'iRpt_WorkingTblTransaction_Dat')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_WorkingTblTransaction_Dat ON [dbo].[Rpt_WorkingTbl] (Transaction_Date)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') AND [name] = N'iRpt_WorkingTblReceiptID')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_WorkingTblReceiptID ON [dbo].[Rpt_WorkingTbl] (ReceiptID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') AND [name] = N'iRpt_WorkingTblOrg_Code')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_WorkingTblOrg_Code ON [dbo].[Rpt_WorkingTbl] (Org_Code)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') AND [name] = N'iRpt_WorkingTblID')
BEGIN
  CREATE NONCLUSTERED INDEX iRpt_WorkingTblID ON [dbo].[Rpt_WorkingTbl] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleCriterion]') AND [name] = N'PK_RuleCriterion')
BEGIN
  ALTER TABLE [dbo].[RuleCriterion]
  ADD CONSTRAINT PK_RuleCriterion PRIMARY KEY CLUSTERED (RuleCriterionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleCriterion]') AND [name] = N'IX_RuleCriterion_RuleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleCriterion_RuleKey ON [dbo].[RuleCriterion] (RuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleCriterion]') AND [name] = N'IX_RuleCriterion_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleCriterion_Name ON [dbo].[RuleCriterion] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') AND [name] = N'PK_RuleFilter')
BEGIN
  ALTER TABLE [dbo].[RuleFilter]
  ADD CONSTRAINT PK_RuleFilter PRIMARY KEY CLUSTERED (RuleFilterKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') AND [name] = N'IX_RuleFilter_RuleCriterionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleFilter_RuleCriterionKey ON [dbo].[RuleFilter] (RuleCriterionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'PK_RuleMain')
BEGIN
  ALTER TABLE [dbo].[RuleMain]
  ADD CONSTRAINT PK_RuleMain PRIMARY KEY CLUSTERED (RuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_BeginDate_EndDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_BeginDate_EndDate ON [dbo].[RuleMain] (BeginDate, EndDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleSourceDesign]') AND [name] = N'PK_RuleSourceDesign')
BEGIN
  ALTER TABLE [dbo].[RuleSourceDesign]
  ADD CONSTRAINT PK_RuleSourceDesign PRIMARY KEY CLUSTERED (RuleName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleSourcePublish]') AND [name] = N'PK_RuleSourcePublish')
BEGIN
  ALTER TABLE [dbo].[RuleSourcePublish]
  ADD CONSTRAINT PK_RuleSourcePublish PRIMARY KEY CLUSTERED (RuleName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') AND [name] = N'PK_SalesHistory')
BEGIN
  ALTER TABLE [dbo].[SalesHistory]
  ADD CONSTRAINT PK_SalesHistory PRIMARY KEY CLUSTERED (SalesHistoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') AND [name] = N'IX_SalesHistory_SoldToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SalesHistory_SoldToContactKey ON [dbo].[SalesHistory] (SoldToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') AND [name] = N'IX_SalesHistory_ShipToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SalesHistory_ShipToContactKey ON [dbo].[SalesHistory] (ShipToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') AND [name] = N'IX_SalesHistory_ProductKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SalesHistory_ProductKey ON [dbo].[SalesHistory] (ProductKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') AND [name] = N'IX_SalesHistory_BillToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SalesHistory_BillToContactKey ON [dbo].[SalesHistory] (BillToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistoryMemorialTribute]') AND [name] = N'PK_SalesHistoryMemorialTribute')
BEGIN
  ALTER TABLE [dbo].[SalesHistoryMemorialTribute]
  ADD CONSTRAINT PK_SalesHistoryMemorialTribute PRIMARY KEY CLUSTERED (SalesHistoryMemorialTributeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistoryRelationship]') AND [name] = N'PK_SalesHistoryRelationship')
BEGIN
  ALTER TABLE [dbo].[SalesHistoryRelationship]
  ADD CONSTRAINT PK_SalesHistoryRelationship PRIMARY KEY CLUSTERED (SalesHistoryRelationshipKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistoryRelationshipTypeRef]') AND [name] = N'PK_SalesHistoryRelationshipTypeRef')
BEGIN
  ALTER TABLE [dbo].[SalesHistoryRelationshipTypeRef]
  ADD CONSTRAINT PK_SalesHistoryRelationshipTypeRef PRIMARY KEY CLUSTERED (SalesHistoryRelationshipTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistorySoftCredit]') AND [name] = N'PK_SalesHistorySoftCredit')
BEGIN
  ALTER TABLE [dbo].[SalesHistorySoftCredit]
  ADD CONSTRAINT PK_SalesHistorySoftCredit PRIMARY KEY CLUSTERED (SalesHistorySoftCreditKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesLocation]') AND [name] = N'PK_SalesLocation')
BEGIN
  ALTER TABLE [dbo].[SalesLocation]
  ADD CONSTRAINT PK_SalesLocation PRIMARY KEY CLUSTERED (SalesLocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesLocation]') AND [name] = N'IX_SalesLocation_Name')
BEGIN
  ALTER TABLE [dbo].[SalesLocation]
  ADD CONSTRAINT IX_SalesLocation_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesLocationStatusRef]') AND [name] = N'PK_SalesLocationStatusRef')
BEGIN
  ALTER TABLE [dbo].[SalesLocationStatusRef]
  ADD CONSTRAINT PK_SalesLocationStatusRef PRIMARY KEY CLUSTERED (SalesLocationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesTeamMember]') AND [name] = N'PK_SalesTeamMember')
BEGIN
  ALTER TABLE [dbo].[SalesTeamMember]
  ADD CONSTRAINT PK_SalesTeamMember PRIMARY KEY CLUSTERED (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalutationRef]') AND [name] = N'PK_SalutationRef')
BEGIN
  ALTER TABLE [dbo].[SalutationRef]
  ADD CONSTRAINT PK_SalutationRef PRIMARY KEY CLUSTERED (SalutationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalutationRef]') AND [name] = N'AK_SalutationRef_SalutationDesc')
BEGIN
  ALTER TABLE [dbo].[SalutationRef]
  ADD CONSTRAINT AK_SalutationRef_SalutationDesc UNIQUE NONCLUSTERED (SalutationDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduleCommon]') AND [name] = N'PK_ScheduleCommon')
BEGIN
  ALTER TABLE [dbo].[ScheduleCommon]
  ADD CONSTRAINT PK_ScheduleCommon PRIMARY KEY CLUSTERED (ScheduleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'PK_ScheduledTask')
BEGIN
  ALTER TABLE [dbo].[ScheduledTask]
  ADD CONSTRAINT PK_ScheduledTask PRIMARY KEY CLUSTERED (ScheduledTaskKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskHistory]') AND [name] = N'PK_ScheduledTaskHistory')
BEGIN
  ALTER TABLE [dbo].[ScheduledTaskHistory]
  ADD CONSTRAINT PK_ScheduledTaskHistory PRIMARY KEY CLUSTERED (ScheduledTaskHistoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskHistory]') AND [name] = N'IX_ScheduledTaskHistory_ScheduledTaskKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTaskHistory_ScheduledTaskKey ON [dbo].[ScheduledTaskHistory] (ScheduledTaskKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskService]') AND [name] = N'PK_ScheduledTaskService')
BEGIN
  ALTER TABLE [dbo].[ScheduledTaskService]
  ADD CONSTRAINT PK_ScheduledTaskService PRIMARY KEY CLUSTERED (ScheduledTaskServiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScreenResolutionRef]') AND [name] = N'PK_ScreenResolutionRef')
BEGIN
  ALTER TABLE [dbo].[ScreenResolutionRef]
  ADD CONSTRAINT PK_ScreenResolutionRef PRIMARY KEY CLUSTERED (ScreenResolutionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScreenResolutionRef]') AND [name] = N'AK_ScreenResolutionRef_ScreenResolutionDesc')
BEGIN
  ALTER TABLE [dbo].[ScreenResolutionRef]
  ADD CONSTRAINT AK_ScreenResolutionRef_ScreenResolutionDesc UNIQUE NONCLUSTERED (ScreenResolutionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Search_Requests]') AND [name] = N'PK_Search_Requests')
BEGIN
  ALTER TABLE [dbo].[Search_Requests]
  ADD CONSTRAINT PK_Search_Requests PRIMARY KEY NONCLUSTERED (ImisSystem, Title)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SeasonalFullAddress]') AND [name] = N'PK_SeasonalFullAddress')
BEGIN
  ALTER TABLE [dbo].[SeasonalFullAddress]
  ADD CONSTRAINT PK_SeasonalFullAddress PRIMARY KEY CLUSTERED (SeasonalFullAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SeasonalFullAddress]') AND [name] = N'IX_SeasonalFullAddress_ReplacesFullAddressKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SeasonalFullAddress_ReplacesFullAddressKey ON [dbo].[SeasonalFullAddress] (ReplacesFullAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Filters]') AND [name] = N'PK_Security_Filters')
BEGIN
  ALTER TABLE [dbo].[Security_Filters]
  ADD CONSTRAINT PK_Security_Filters PRIMARY KEY NONCLUSTERED (SECURITY_GROUP, SECURITY_MODE, TABLE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Group_Rule]') AND [name] = N'PK_Security_Group_Rule')
BEGIN
  ALTER TABLE [dbo].[Security_Group_Rule]
  ADD CONSTRAINT PK_Security_Group_Rule PRIMARY KEY CLUSTERED (SecurityGroupRuleID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Group_Sync]') AND [name] = N'PK_Security_Group_Sync')
BEGIN
  ALTER TABLE [dbo].[Security_Group_Sync]
  ADD CONSTRAINT PK_Security_Group_Sync PRIMARY KEY CLUSTERED (SecurityGroupCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Groups]') AND [name] = N'PK_Security_Groups')
BEGIN
  ALTER TABLE [dbo].[Security_Groups]
  ADD CONSTRAINT PK_Security_Groups PRIMARY KEY NONCLUSTERED (SECURITY_GROUP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Modes]') AND [name] = N'PK_Security_Modes')
BEGIN
  ALTER TABLE [dbo].[Security_Modes]
  ADD CONSTRAINT PK_Security_Modes PRIMARY KEY NONCLUSTERED (SECURITY_MODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Security_Tables]') AND [name] = N'iSecurity_TablesTABLE_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iSecurity_TablesTABLE_NAME ON [dbo].[Security_Tables] (TABLE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'PK_SegmentationJob')
BEGIN
  ALTER TABLE [dbo].[SegmentationJob]
  ADD CONSTRAINT PK_SegmentationJob PRIMARY KEY CLUSTERED (SegmentationJobKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJobStatusRef]') AND [name] = N'PK_SegmentationJobStatusRef')
BEGIN
  ALTER TABLE [dbo].[SegmentationJobStatusRef]
  ADD CONSTRAINT PK_SegmentationJobStatusRef PRIMARY KEY CLUSTERED (SegmentationJobStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentDefinition]') AND [name] = N'PK_SegmentDefinition')
BEGIN
  ALTER TABLE [dbo].[SegmentDefinition]
  ADD CONSTRAINT PK_SegmentDefinition PRIMARY KEY CLUSTERED (SegmentDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Sender_Codes]') AND [name] = N'iSender_CodesSENDER_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iSender_CodesSENDER_CODE ON [dbo].[Sender_Codes] (SENDER_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SequenceCounter]') AND [name] = N'PK_SequenceCounter')
BEGIN
  ALTER TABLE [dbo].[SequenceCounter]
  ADD CONSTRAINT PK_SequenceCounter PRIMARY KEY CLUSTERED (OrganizationKey, SystemEntityKey, CounterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'PK_Service_Request')
BEGIN
  ALTER TABLE [dbo].[Service_Request]
  ADD CONSTRAINT PK_Service_Request PRIMARY KEY CLUSTERED (ServiceReference)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestSubmitterName')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestSubmitterName ON [dbo].[Service_Request] (SubmitterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestSubmitterId')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestSubmitterId ON [dbo].[Service_Request] (SubmitterId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestSubmitterCompa')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestSubmitterCompa ON [dbo].[Service_Request] (SubmitterCompany)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestStatus')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestStatus ON [dbo].[Service_Request] (Status)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestIssueReference')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestIssueReference ON [dbo].[Service_Request] (IssueReference)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestDateTimeSubmit')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestDateTimeSubmit ON [dbo].[Service_Request] (DateTimeSubmitted)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestClient')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestClient ON [dbo].[Service_Request] (Client)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') AND [name] = N'iService_RequestAssignedTo')
BEGIN
  CREATE NONCLUSTERED INDEX iService_RequestAssignedTo ON [dbo].[Service_Request] (AssignedTo)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ServiceStatusRef]') AND [name] = N'PK_ServiceStatusRef')
BEGIN
  ALTER TABLE [dbo].[ServiceStatusRef]
  ADD CONSTRAINT PK_ServiceStatusRef PRIMARY KEY CLUSTERED (ServiceStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ServiceStatusRef]') AND [name] = N'AK_ServiceStatusRef_ServiceStatusDesc')
BEGIN
  ALTER TABLE [dbo].[ServiceStatusRef]
  ADD CONSTRAINT AK_ServiceStatusRef_ServiceStatusDesc UNIQUE NONCLUSTERED (ServiceStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipCarrier]') AND [name] = N'PK_ShipCarrier')
BEGIN
  ALTER TABLE [dbo].[ShipCarrier]
  ADD CONSTRAINT PK_ShipCarrier PRIMARY KEY CLUSTERED (ShipCarrierKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipCarrier]') AND [name] = N'AK_ShipCarrier_Name')
BEGIN
  ALTER TABLE [dbo].[ShipCarrier]
  ADD CONSTRAINT AK_ShipCarrier_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipCharge]') AND [name] = N'PK_ShipCharge')
BEGIN
  ALTER TABLE [dbo].[ShipCharge]
  ADD CONSTRAINT PK_ShipCharge PRIMARY KEY CLUSTERED (ShipChargeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipCharge]') AND [name] = N'IX_ShipCharge_OrderShipToKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipCharge_OrderShipToKey ON [dbo].[ShipCharge] (OrderShipToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Shipment]') AND [name] = N'PK_Shipment')
BEGIN
  ALTER TABLE [dbo].[Shipment]
  ADD CONSTRAINT PK_Shipment PRIMARY KEY CLUSTERED (ShipmentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Shipment]') AND [name] = N'IX_Shipment_OrderShipToKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Shipment_OrderShipToKey ON [dbo].[Shipment] (OrderShipToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Shipment]') AND [name] = N'IX_Shipment_OrderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Shipment_OrderKey ON [dbo].[Shipment] (OrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentLine]') AND [name] = N'PK_ShipmentLine')
BEGIN
  ALTER TABLE [dbo].[ShipmentLine]
  ADD CONSTRAINT PK_ShipmentLine PRIMARY KEY CLUSTERED (ShipmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentLine]') AND [name] = N'IX_ShipmentLine_OrderFulfillmentLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipmentLine_OrderFulfillmentLineKey ON [dbo].[ShipmentLine] (OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentLine]') AND [name] = N'AK_ShipmentLine_ShipmentKey_OrderFulfillmentLineKey')
BEGIN
  ALTER TABLE [dbo].[ShipmentLine]
  ADD CONSTRAINT AK_ShipmentLine_ShipmentKey_OrderFulfillmentLineKey UNIQUE NONCLUSTERED (ShipmentKey, OrderFulfillmentLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentTaxLine]') AND [name] = N'PK_ShipmentTaxLine')
BEGIN
  ALTER TABLE [dbo].[ShipmentTaxLine]
  ADD CONSTRAINT PK_ShipmentTaxLine PRIMARY KEY CLUSTERED (ShipmentTaxLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentTaxLine]') AND [name] = N'IX_ShipmentTaxLine_ShipmentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipmentTaxLine_ShipmentKey ON [dbo].[ShipmentTaxLine] (ShipmentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipmentTaxLine]') AND [name] = N'IX_ShipmentTaxLine_OrderLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipmentTaxLine_OrderLineKey ON [dbo].[ShipmentTaxLine] (OrderLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipMethod]') AND [name] = N'PK_ShipMethod')
BEGIN
  ALTER TABLE [dbo].[ShipMethod]
  ADD CONSTRAINT PK_ShipMethod PRIMARY KEY CLUSTERED (ShipMethodKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipMethod]') AND [name] = N'IX_ShipMethod_Name')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipMethod_Name ON [dbo].[ShipMethod] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipMethodMethodSetDetail]') AND [name] = N'PK_ShipMethodMethodSetDetail')
BEGIN
  ALTER TABLE [dbo].[ShipMethodMethodSetDetail]
  ADD CONSTRAINT PK_ShipMethodMethodSetDetail PRIMARY KEY CLUSTERED (ShipMethodKey, MethodSetDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipOrigin]') AND [name] = N'PK_ShipOrigin')
BEGIN
  ALTER TABLE [dbo].[ShipOrigin]
  ADD CONSTRAINT PK_ShipOrigin PRIMARY KEY CLUSTERED (ShipOriginKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipPrice]') AND [name] = N'PK_ShipPrice')
BEGIN
  ALTER TABLE [dbo].[ShipPrice]
  ADD CONSTRAINT PK_ShipPrice PRIMARY KEY CLUSTERED (ShipPriceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipPrice]') AND [name] = N'IX_ShipPrice_ShipZoneKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipPrice_ShipZoneKey ON [dbo].[ShipPrice] (ShipZoneKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipPriceRef]') AND [name] = N'PK_ShipPriceRef')
BEGIN
  ALTER TABLE [dbo].[ShipPriceRef]
  ADD CONSTRAINT PK_ShipPriceRef PRIMARY KEY CLUSTERED (ShipPriceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipZone]') AND [name] = N'PK_ShipZone')
BEGIN
  ALTER TABLE [dbo].[ShipZone]
  ADD CONSTRAINT PK_ShipZone PRIMARY KEY CLUSTERED (ShipZoneKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipZone]') AND [name] = N'IX_ShipZone_ShipOriginKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipZone_ShipOriginKey ON [dbo].[ShipZone] (ShipOriginKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipZone]') AND [name] = N'IX_ShipZone_CountryCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ShipZone_CountryCode ON [dbo].[ShipZone] (CountryCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipZone]') AND [name] = N'AK_ShipZone_Name')
BEGIN
  ALTER TABLE [dbo].[ShipZone]
  ADD CONSTRAINT AK_ShipZone_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SoftCreditRelationshipType]') AND [name] = N'PK_SoftCreditRelationshipType')
BEGIN
  ALTER TABLE [dbo].[SoftCreditRelationshipType]
  ADD CONSTRAINT PK_SoftCreditRelationshipType PRIMARY KEY CLUSTERED (SoftCreditRelationshipKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'PK_SolicitationMain')
BEGIN
  ALTER TABLE [dbo].[SolicitationMain]
  ADD CONSTRAINT PK_SolicitationMain PRIMARY KEY CLUSTERED (SolicitationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'PK_SolicitationSource')
BEGIN
  ALTER TABLE [dbo].[SolicitationSource]
  ADD CONSTRAINT PK_SolicitationSource PRIMARY KEY CLUSTERED (SolicitationSourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationStatusRef]') AND [name] = N'PK_SolicitationStatusRef')
BEGIN
  ALTER TABLE [dbo].[SolicitationStatusRef]
  ADD CONSTRAINT PK_SolicitationStatusRef PRIMARY KEY CLUSTERED (SolicitationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustment]') AND [name] = N'PK_SortNameAdjustment')
BEGIN
  ALTER TABLE [dbo].[SortNameAdjustment]
  ADD CONSTRAINT PK_SortNameAdjustment PRIMARY KEY CLUSTERED (SortNameTargetWord)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustmentActionRef]') AND [name] = N'PK_SortNameAdjustmentActionRef')
BEGIN
  ALTER TABLE [dbo].[SortNameAdjustmentActionRef]
  ADD CONSTRAINT PK_SortNameAdjustmentActionRef PRIMARY KEY CLUSTERED (SortNameAdjustmentActionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustmentActionRef]') AND [name] = N'AK_SortNameAdjustmentActionRef_SortNameAdjustmentActionName')
BEGIN
  ALTER TABLE [dbo].[SortNameAdjustmentActionRef]
  ADD CONSTRAINT AK_SortNameAdjustmentActionRef_SortNameAdjustmentActionName UNIQUE NONCLUSTERED (SortNameAdjustmentActionName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustmentActionRef]') AND [name] = N'AK_SortNameAdjustmentActionRef_SortNameAdjustmentActionDesc')
BEGIN
  ALTER TABLE [dbo].[SortNameAdjustmentActionRef]
  ADD CONSTRAINT AK_SortNameAdjustmentActionRef_SortNameAdjustmentActionDesc UNIQUE NONCLUSTERED (SortNameAdjustmentActionDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Source_Codes]') AND [name] = N'iSource_CodesSOURCE_CODE')
BEGIN
  CREATE CLUSTERED INDEX iSource_CodesSOURCE_CODE ON [dbo].[Source_Codes] (SOURCE_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'PK_SourceCode')
BEGIN
  ALTER TABLE [dbo].[SourceCode]
  ADD CONSTRAINT PK_SourceCode PRIMARY KEY CLUSTERED (SourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCodeStatusRef]') AND [name] = N'PK_SourceCodeStatusRef')
BEGIN
  ALTER TABLE [dbo].[SourceCodeStatusRef]
  ADD CONSTRAINT PK_SourceCodeStatusRef PRIMARY KEY CLUSTERED (SourceCodeStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCodeTypeRef]') AND [name] = N'PK_SourceCodeTypeRef')
BEGIN
  ALTER TABLE [dbo].[SourceCodeTypeRef]
  ADD CONSTRAINT PK_SourceCodeTypeRef PRIMARY KEY CLUSTERED (SourceCodeTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceLineOrderPromotion]') AND [name] = N'PK_SourceLineOrderPromotion')
BEGIN
  ALTER TABLE [dbo].[SourceLineOrderPromotion]
  ADD CONSTRAINT PK_SourceLineOrderPromotion PRIMARY KEY CLUSTERED (SourceLineOrderPromotionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StandardPageRef]') AND [name] = N'PK__StandardPageRef__0AF398B7')
BEGIN
  ALTER TABLE [dbo].[StandardPageRef]
  ADD CONSTRAINT PK__StandardPageRef__0AF398B7 PRIMARY KEY CLUSTERED (StandardPageCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[State_Codes]') AND [name] = N'PK_State_Codes')
BEGIN
  ALTER TABLE [dbo].[State_Codes]
  ADD CONSTRAINT PK_State_Codes PRIMARY KEY CLUSTERED (STATE_PROVINCE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND [name] = N'PK_StateProvinceRef')
BEGIN
  ALTER TABLE [dbo].[StateProvinceRef]
  ADD CONSTRAINT PK_StateProvinceRef PRIMARY KEY CLUSTERED (CountryCode, StateProvinceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND [name] = N'IX_StateProvinceRef_StateProvinceCode')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_StateProvinceRef_StateProvinceCode ON [dbo].[StateProvinceRef] (StateProvinceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Stored_List]') AND [name] = N'iStored_ListNumberSequence')
BEGIN
  CREATE NONCLUSTERED INDEX iStored_ListNumberSequence ON [dbo].[Stored_List] (NumberSequence)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Stored_List]') AND [name] = N'iStored_ListListType')
BEGIN
  CREATE NONCLUSTERED INDEX iStored_ListListType ON [dbo].[Stored_List] (ListType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Stored_List]') AND [name] = N'iStored_ListListName')
BEGIN
  CREATE NONCLUSTERED INDEX iStored_ListListName ON [dbo].[Stored_List] (ListName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Stored_List]') AND [name] = N'iStored_ListExpires')
BEGIN
  CREATE NONCLUSTERED INDEX iStored_ListExpires ON [dbo].[Stored_List] (Expires)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Style_Options]') AND [name] = N'PK_Style_Options')
BEGIN
  ALTER TABLE [dbo].[Style_Options]
  ADD CONSTRAINT PK_Style_Options PRIMARY KEY NONCLUSTERED (STYLE_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Sub_Component_Ref]') AND [name] = N'PK_Sub_Component_Ref')
BEGIN
  ALTER TABLE [dbo].[Sub_Component_Ref]
  ADD CONSTRAINT PK_Sub_Component_Ref PRIMARY KEY CLUSTERED (ComponentCode, SubComponentCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'PK_Subscriptions')
BEGIN
  ALTER TABLE [dbo].[Subscriptions]
  ADD CONSTRAINT PK_Subscriptions PRIMARY KEY CLUSTERED (ID, PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsPRODUCT_CODE ON [dbo].[Subscriptions] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsINVOICE_REFERENC')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsINVOICE_REFERENC ON [dbo].[Subscriptions] (INVOICE_REFERENCE_NUM, INVOICE_LINE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsBT_ID ON [dbo].[Subscriptions] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SuffixRef]') AND [name] = N'PK_SuffixRef')
BEGIN
  ALTER TABLE [dbo].[SuffixRef]
  ADD CONSTRAINT PK_SuffixRef PRIMARY KEY CLUSTERED (SuffixCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SuffixRef]') AND [name] = N'AK_SuffixRef_SuffixKey')
BEGIN
  ALTER TABLE [dbo].[SuffixRef]
  ADD CONSTRAINT AK_SuffixRef_SuffixKey UNIQUE NONCLUSTERED (SuffixKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'PK_SupplementMain')
BEGIN
  ALTER TABLE [dbo].[SupplementMain]
  ADD CONSTRAINT PK_SupplementMain PRIMARY KEY CLUSTERED (SupplementKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementStatusRef]') AND [name] = N'PK_SupplementStatusRef')
BEGIN
  ALTER TABLE [dbo].[SupplementStatusRef]
  ADD CONSTRAINT PK_SupplementStatusRef PRIMARY KEY CLUSTERED (SupplementStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementTypeRef]') AND [name] = N'PK_SupplementTypeRef')
BEGIN
  ALTER TABLE [dbo].[SupplementTypeRef]
  ADD CONSTRAINT PK_SupplementTypeRef PRIMARY KEY CLUSTERED (SupplementTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'PK_Tag')
BEGIN
  ALTER TABLE [dbo].[Tag]
  ADD CONSTRAINT PK_Tag PRIMARY KEY CLUSTERED (TagKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'AK_Tag')
BEGIN
  ALTER TABLE [dbo].[Tag]
  ADD CONSTRAINT AK_Tag UNIQUE NONCLUSTERED (TagName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Color_Ref]') AND [name] = N'PK_Tagged_Page_Color_Ref')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Color_Ref]
  ADD CONSTRAINT PK_Tagged_Page_Color_Ref PRIMARY KEY CLUSTERED (TaggedPageColor)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Component_Column]') AND [name] = N'PK_Tagged_Page_Component_Column')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Component_Column]
  ADD CONSTRAINT PK_Tagged_Page_Component_Column PRIMARY KEY CLUSTERED (ComponentCode, ColumnName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Format_Ref]') AND [name] = N'PK_Tagged_Page_Format_Ref')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Format_Ref]
  ADD CONSTRAINT PK_Tagged_Page_Format_Ref PRIMARY KEY CLUSTERED (TaggedPageFormatID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Format_Type_Ref]') AND [name] = N'PK_Tagged_Page_Format_Type_Ref')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Format_Type_Ref]
  ADD CONSTRAINT PK_Tagged_Page_Format_Type_Ref PRIMARY KEY CLUSTERED (TaggedPageFormatTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Interest_Category]') AND [name] = N'PK_Tagged_Page_Interest_Category')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Interest_Category]
  ADD CONSTRAINT PK_Tagged_Page_Interest_Category PRIMARY KEY CLUSTERED (ContentID, InterestCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Layout]') AND [name] = N'PK_Tagged_Page_Layout')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Layout]
  ADD CONSTRAINT PK_Tagged_Page_Layout PRIMARY KEY CLUSTERED (TaggedPageLayoutID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Portlet]') AND [name] = N'PK_Tagged_Page_Portlet')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Portlet]
  ADD CONSTRAINT PK_Tagged_Page_Portlet PRIMARY KEY CLUSTERED (TaggedPagePortletID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_PortletIC]') AND [name] = N'PK_Tagged_Page_PortletIC')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_PortletIC]
  ADD CONSTRAINT PK_Tagged_Page_PortletIC PRIMARY KEY CLUSTERED (TaggedPagePortletID, InterestCategoryID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Section]') AND [name] = N'PK_Tagged_Page_Section')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Section]
  ADD CONSTRAINT PK_Tagged_Page_Section PRIMARY KEY CLUSTERED (TaggedPageSectionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Title_Ref]') AND [name] = N'PK_Tagged_Page_Title_Ref')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Title_Ref]
  ADD CONSTRAINT PK_Tagged_Page_Title_Ref PRIMARY KEY CLUSTERED (TaggedPageTitleCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Portlet]') AND [name] = N'PK_Tagged_Portlet')
BEGIN
  ALTER TABLE [dbo].[Tagged_Portlet]
  ADD CONSTRAINT PK_Tagged_Portlet PRIMARY KEY CLUSTERED (TaggedPortletID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section]') AND [name] = N'PK_Tagged_Section')
BEGIN
  ALTER TABLE [dbo].[Tagged_Section]
  ADD CONSTRAINT PK_Tagged_Section PRIMARY KEY CLUSTERED (TaggedSectionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section_Template]') AND [name] = N'PK_Tagged_Section_Template')
BEGIN
  ALTER TABLE [dbo].[Tagged_Section_Template]
  ADD CONSTRAINT PK_Tagged_Section_Template PRIMARY KEY CLUSTERED (TaggedSectionID, TaggedTemplateID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Template]') AND [name] = N'PK_Tagged_Template')
BEGIN
  ALTER TABLE [dbo].[Tagged_Template]
  ADD CONSTRAINT PK_Tagged_Template PRIMARY KEY CLUSTERED (TaggedTemplateID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Template_Field]') AND [name] = N'PK_Tagged_Template_Field')
BEGIN
  ALTER TABLE [dbo].[Tagged_Template_Field]
  ADD CONSTRAINT PK_Tagged_Template_Field PRIMARY KEY CLUSTERED (TaggedTemplateID, FieldName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelatedName]') AND [name] = N'PK_TagRelatedName')
BEGIN
  ALTER TABLE [dbo].[TagRelatedName]
  ADD CONSTRAINT PK_TagRelatedName PRIMARY KEY CLUSTERED (TagKey, RelatedName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelatedName]') AND [name] = N'IX_TagRelatedName_RelatedName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TagRelatedName_RelatedName ON [dbo].[TagRelatedName] (RelatedName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationship]') AND [name] = N'PK_TagRelationship')
BEGIN
  ALTER TABLE [dbo].[TagRelationship]
  ADD CONSTRAINT PK_TagRelationship PRIMARY KEY CLUSTERED (TagRelationshipKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationship]') AND [name] = N'IX_TagRelationship_TargetTagKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TagRelationship_TargetTagKey ON [dbo].[TagRelationship] (TargetTagKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationship]') AND [name] = N'AK_TagRelationship')
BEGIN
  ALTER TABLE [dbo].[TagRelationship]
  ADD CONSTRAINT AK_TagRelationship UNIQUE NONCLUSTERED (SubjectTagKey, TargetTagKey, TagRelationshipTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationshipTypeRef]') AND [name] = N'PK_TagRelationshipTypeRef')
BEGIN
  ALTER TABLE [dbo].[TagRelationshipTypeRef]
  ADD CONSTRAINT PK_TagRelationshipTypeRef PRIMARY KEY CLUSTERED (TagRelationshipTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationshipTypeRef]') AND [name] = N'AK_TagRelationshipTypeRef_TagRelationshipTypeName')
BEGIN
  ALTER TABLE [dbo].[TagRelationshipTypeRef]
  ADD CONSTRAINT AK_TagRelationshipTypeRef_TagRelationshipTypeName UNIQUE NONCLUSTERED (TagRelationshipTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationshipTypeRef]') AND [name] = N'AK_TagRelationshipTypeRef_TagRelationshipTypeDesc')
BEGIN
  ALTER TABLE [dbo].[TagRelationshipTypeRef]
  ADD CONSTRAINT AK_TagRelationshipTypeRef_TagRelationshipTypeDesc UNIQUE NONCLUSTERED (TagRelationshipTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'PK_TaskItem')
BEGIN
  ALTER TABLE [dbo].[TaskItem]
  ADD CONSTRAINT PK_TaskItem PRIMARY KEY CLUSTERED (TaskItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'IX_TaskItem_CompletedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskItem_CompletedByUserKey ON [dbo].[TaskItem] (CompletedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'IX_TaskItem_AssignedToKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskItem_AssignedToKey ON [dbo].[TaskItem] (AssignedToKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'AK_TaskItem_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX AK_TaskItem_AccessKey ON [dbo].[TaskItem] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItemStatusRef]') AND [name] = N'PK_TaskItemStatusRef')
BEGIN
  ALTER TABLE [dbo].[TaskItemStatusRef]
  ADD CONSTRAINT PK_TaskItemStatusRef PRIMARY KEY CLUSTERED (TaskItemStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'PK_TaskMain')
BEGIN
  ALTER TABLE [dbo].[TaskMain]
  ADD CONSTRAINT PK_TaskMain PRIMARY KEY CLUSTERED (TaskKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_AssigneeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_AssigneeKey ON [dbo].[TaskMain] (AssigneeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskNotifyCreatorRef]') AND [name] = N'PK_TaskNotifyCreatorRef')
BEGIN
  ALTER TABLE [dbo].[TaskNotifyCreatorRef]
  ADD CONSTRAINT PK_TaskNotifyCreatorRef PRIMARY KEY CLUSTERED (TaskNotifyCreatorCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskPriorityRef]') AND [name] = N'PK_TaskPriorityRef')
BEGIN
  ALTER TABLE [dbo].[TaskPriorityRef]
  ADD CONSTRAINT PK_TaskPriorityRef PRIMARY KEY CLUSTERED (TaskPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskPriorityRef]') AND [name] = N'AK_TaskPriorityRef_TaskPriorityName')
BEGIN
  ALTER TABLE [dbo].[TaskPriorityRef]
  ADD CONSTRAINT AK_TaskPriorityRef_TaskPriorityName UNIQUE NONCLUSTERED (TaskPriorityName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskStatusRef]') AND [name] = N'PK_TaskStatusRef')
BEGIN
  ALTER TABLE [dbo].[TaskStatusRef]
  ADD CONSTRAINT PK_TaskStatusRef PRIMARY KEY CLUSTERED (TaskStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskStatusRef]') AND [name] = N'AK_TaskStatusRef_TaskStatusName')
BEGIN
  ALTER TABLE [dbo].[TaskStatusRef]
  ADD CONSTRAINT AK_TaskStatusRef_TaskStatusName UNIQUE NONCLUSTERED (TaskStatusName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskStatusRef]') AND [name] = N'AK_TaskStatusRef_TaskStatusDesc')
BEGIN
  ALTER TABLE [dbo].[TaskStatusRef]
  ADD CONSTRAINT AK_TaskStatusRef_TaskStatusDesc UNIQUE NONCLUSTERED (TaskStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskTypeRef]') AND [name] = N'PK_TaskTypeRef')
BEGIN
  ALTER TABLE [dbo].[TaskTypeRef]
  ADD CONSTRAINT PK_TaskTypeRef PRIMARY KEY CLUSTERED (TaskTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskTypeRef]') AND [name] = N'AK_TaskTypeRef_TaskTypeName')
BEGIN
  ALTER TABLE [dbo].[TaskTypeRef]
  ADD CONSTRAINT AK_TaskTypeRef_TaskTypeName UNIQUE NONCLUSTERED (TaskTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskTypeRef]') AND [name] = N'AK_TaskTypeRef_TaskTypeDesc')
BEGIN
  ALTER TABLE [dbo].[TaskTypeRef]
  ADD CONSTRAINT AK_TaskTypeRef_TaskTypeDesc UNIQUE NONCLUSTERED (TaskTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthority]') AND [name] = N'PK_TaxAuthority')
BEGIN
  ALTER TABLE [dbo].[TaxAuthority]
  ADD CONSTRAINT PK_TaxAuthority PRIMARY KEY CLUSTERED (TaxAuthorityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthority]') AND [name] = N'AK_TaxAuthority_Name')
BEGIN
  ALTER TABLE [dbo].[TaxAuthority]
  ADD CONSTRAINT AK_TaxAuthority_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityCategory]') AND [name] = N'PK_TaxAuthorityCategory')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityCategory]
  ADD CONSTRAINT PK_TaxAuthorityCategory PRIMARY KEY CLUSTERED (TaxAuthorityCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityFinancialEntity]') AND [name] = N'PK_TaxAuthorityFinancialEntity')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityFinancialEntity]
  ADD CONSTRAINT PK_TaxAuthorityFinancialEntity PRIMARY KEY CLUSTERED (TaxAuthorityFinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityLevelRef]') AND [name] = N'PK_TaxAuthorityLevelRef')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityLevelRef]
  ADD CONSTRAINT PK_TaxAuthorityLevelRef PRIMARY KEY CLUSTERED (TaxAuthorityLevelKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxCategory]') AND [name] = N'PK_TaxCategory')
BEGIN
  ALTER TABLE [dbo].[TaxCategory]
  ADD CONSTRAINT PK_TaxCategory PRIMARY KEY CLUSTERED (TaxCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxCategory]') AND [name] = N'AK_TaxCategory_Code')
BEGIN
  ALTER TABLE [dbo].[TaxCategory]
  ADD CONSTRAINT AK_TaxCategory_Code UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxExemptionInfo]') AND [name] = N'PK_TaxExemptionInfo')
BEGIN
  ALTER TABLE [dbo].[TaxExemptionInfo]
  ADD CONSTRAINT PK_TaxExemptionInfo PRIMARY KEY CLUSTERED (TaxExemptionInfoKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxExemptionInfo]') AND [name] = N'IX_TaxExemptionInfo_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxExemptionInfo_ContactKey ON [dbo].[TaxExemptionInfo] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxSchedule]') AND [name] = N'PK_TaxSchedule')
BEGIN
  ALTER TABLE [dbo].[TaxSchedule]
  ADD CONSTRAINT PK_TaxSchedule PRIMARY KEY CLUSTERED (TaxScheduleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxSchedule]') AND [name] = N'IX_TaxSchedule')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxSchedule ON [dbo].[TaxSchedule] (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxScheduleAuthority]') AND [name] = N'PK_TaxScheduleAuthority')
BEGIN
  ALTER TABLE [dbo].[TaxScheduleAuthority]
  ADD CONSTRAINT PK_TaxScheduleAuthority PRIMARY KEY CLUSTERED (TaxScheduleAuthorityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Terms]') AND [name] = N'PK_Terms')
BEGIN
  ALTER TABLE [dbo].[Terms]
  ADD CONSTRAINT PK_Terms PRIMARY KEY CLUSTERED (TERMS_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TimeZoneRef]') AND [name] = N'PK_TimeZoneRef')
BEGIN
  ALTER TABLE [dbo].[TimeZoneRef]
  ADD CONSTRAINT PK_TimeZoneRef PRIMARY KEY CLUSTERED (TimeZoneKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TimeZoneRef]') AND [name] = N'AK_TimeZoneRef_TimeZoneDesc')
BEGIN
  ALTER TABLE [dbo].[TimeZoneRef]
  ADD CONSTRAINT AK_TimeZoneRef_TimeZoneDesc UNIQUE NONCLUSTERED (TimeZoneDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'PK_Trans')
BEGIN
  ALTER TABLE [dbo].[Trans]
  ADD CONSTRAINT PK_Trans PRIMARY KEY CLUSTERED (TRANS_NUMBER, LINE_NUMBER, SUB_LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransTRANSACTION_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransTRANSACTION_TYPE ON [dbo].[Trans] (TRANSACTION_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransTRANSACTION_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransTRANSACTION_DATE ON [dbo].[Trans] (TRANSACTION_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransSUB_LINE_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iTransSUB_LINE_NUMBER ON [dbo].[Trans] (SUB_LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransST_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTransST_ID ON [dbo].[Trans] (ST_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransSOURCE_SYSTEM')
BEGIN
  CREATE NONCLUSTERED INDEX iTransSOURCE_SYSTEM ON [dbo].[Trans] (SOURCE_SYSTEM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransSOLICITOR_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTransSOLICITOR_ID ON [dbo].[Trans] (SOLICITOR_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransRECEIPT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTransRECEIPT_ID ON [dbo].[Trans] (RECEIPT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransPRODUCT_CODE ON [dbo].[Trans] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransPOSTED')
BEGIN
  CREATE NONCLUSTERED INDEX iTransPOSTED ON [dbo].[Trans] (POSTED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransOWNER_ORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransOWNER_ORG_CODE ON [dbo].[Trans] (OWNER_ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransMEM_TRIB_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTransMEM_TRIB_ID ON [dbo].[Trans] (MEM_TRIB_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransMATCH_GIFT_TRANS_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iTransMATCH_GIFT_TRANS_NUM ON [dbo].[Trans] (MATCH_GIFT_TRANS_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransMATCH_ACTIVITY_SEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iTransMATCH_ACTIVITY_SEQN ON [dbo].[Trans] (MATCH_ACTIVITY_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransLINE_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iTransLINE_NUMBER ON [dbo].[Trans] (LINE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransJOURNAL_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransJOURNAL_TYPE ON [dbo].[Trans] (JOURNAL_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransIS_MATCH_GIFT')
BEGIN
  CREATE NONCLUSTERED INDEX iTransIS_MATCH_GIFT ON [dbo].[Trans] (IS_MATCH_GIFT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransINVOICE_REF_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iTransINVOICE_REF_NUM ON [dbo].[Trans] (INVOICE_REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransINSTALL_BILL_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransINSTALL_BILL_DATE ON [dbo].[Trans] (INSTALL_BILL_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransGL_EXPORT_DATE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransGL_EXPORT_DATE ON [dbo].[Trans] (GL_EXPORT_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransGL_ACCT_ORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransGL_ACCT_ORG_CODE ON [dbo].[Trans] (GL_ACCT_ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransDO_NOT_RECEIPT')
BEGIN
  CREATE NONCLUSTERED INDEX iTransDO_NOT_RECEIPT ON [dbo].[Trans] (DO_NOT_RECEIPT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransCHECK_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iTransCHECK_NUMBER ON [dbo].[Trans] (CHECK_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTransBT_ID ON [dbo].[Trans] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransBATCH_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iTransBATCH_NUMBER ON [dbo].[Trans] (BATCH_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransACKNOWLEDGE_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransACKNOWLEDGE_CODE ON [dbo].[Trans] (MERGE_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_Notify]') AND [name] = N'iTrans_NotifyTRANS_NUMBER')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_NotifyTRANS_NUMBER ON [dbo].[Trans_Notify] (TRANS_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_Notify]') AND [name] = N'iTrans_NotifyNOTIFY_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_NotifyNOTIFY_ID ON [dbo].[Trans_Notify] (NOTIFY_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_SoftCredit]') AND [name] = N'PK_Trans_SoftCredit')
BEGIN
  ALTER TABLE [dbo].[Trans_SoftCredit]
  ADD CONSTRAINT PK_Trans_SoftCredit PRIMARY KEY CLUSTERED (TRANS_NUMBER, SOFT_CREDIT_ID, ORIGINATING_ACTIVITY_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_SoftCredit]') AND [name] = N'iTrans_SoftCreditSOFT_CREDIT_I')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_SoftCreditSOFT_CREDIT_I ON [dbo].[Trans_SoftCredit] (SOFT_CREDIT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_SoftCredit]') AND [name] = N'iTrans_SoftCreditPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_SoftCreditPRODUCT_CODE ON [dbo].[Trans_SoftCredit] (PRODUCT_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_SoftCredit]') AND [name] = N'iTrans_SoftCreditACTIVITY_SEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_SoftCreditACTIVITY_SEQN ON [dbo].[Trans_SoftCredit] (ORIGINATING_ACTIVITY_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TransactionTypeRef]') AND [name] = N'PK_TransactionTypeRef')
BEGIN
  ALTER TABLE [dbo].[TransactionTypeRef]
  ADD CONSTRAINT PK_TransactionTypeRef PRIMARY KEY CLUSTERED (TransactionTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TransactionTypeRef]') AND [name] = N'AK_TransactionTypeRef_TransactionTypeName')
BEGIN
  ALTER TABLE [dbo].[TransactionTypeRef]
  ADD CONSTRAINT AK_TransactionTypeRef_TransactionTypeName UNIQUE NONCLUSTERED (TransactionTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TransactionTypeRef]') AND [name] = N'AK_TransactionTypeRef_TransactionTypeDesc')
BEGIN
  ALTER TABLE [dbo].[TransactionTypeRef]
  ADD CONSTRAINT AK_TransactionTypeRef_TransactionTypeDesc UNIQUE NONCLUSTERED (TransactionTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TransWatch]') AND [name] = N'iTransWatchTransactionNumber')
BEGIN
  CREATE CLUSTERED INDEX iTransWatchTransactionNumber ON [dbo].[TransWatch] (TransactionNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_Field]') AND [name] = N'PK_UD_Field')
BEGIN
  ALTER TABLE [dbo].[UD_Field]
  ADD CONSTRAINT PK_UD_Field PRIMARY KEY CLUSTERED (TABLE_NAME, FIELD_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_Table]') AND [name] = N'PK_UD_Table')
BEGIN
  ALTER TABLE [dbo].[UD_Table]
  ADD CONSTRAINT PK_UD_Table PRIMARY KEY CLUSTERED (TABLE_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowFields]') AND [name] = N'PK_UD_WindowFields')
BEGIN
  ALTER TABLE [dbo].[UD_WindowFields]
  ADD CONSTRAINT PK_UD_WindowFields PRIMARY KEY CLUSTERED (WINDOW_NAME, SEQ)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowFields]') AND [name] = N'iUD_WindowFieldsTABLE_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iUD_WindowFieldsTABLE_NAME ON [dbo].[UD_WindowFields] (TABLE_NAME, FIELD_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowHeader]') AND [name] = N'PK_UD_WindowHeader')
BEGIN
  ALTER TABLE [dbo].[UD_WindowHeader]
  ADD CONSTRAINT PK_UD_WindowHeader PRIMARY KEY NONCLUSTERED (WINDOW_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowHeader]') AND [name] = N'iUD_WindowHeaderAPPLICATION')
BEGIN
  CREATE CLUSTERED INDEX iUD_WindowHeaderAPPLICATION ON [dbo].[UD_WindowHeader] (APPLICATION)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformDistribution]') AND [name] = N'PK_UniformDistribution')
BEGIN
  ALTER TABLE [dbo].[UniformDistribution]
  ADD CONSTRAINT PK_UniformDistribution PRIMARY KEY CLUSTERED (UniformKey, UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformItemUniformResourceRef]') AND [name] = N'PK_UniformItemUniformResourceRef')
BEGIN
  ALTER TABLE [dbo].[UniformItemUniformResourceRef]
  ADD CONSTRAINT PK_UniformItemUniformResourceRef PRIMARY KEY CLUSTERED (UniformKey, UniformResourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLicense]') AND [name] = N'PK_UniformLicense')
BEGIN
  ALTER TABLE [dbo].[UniformLicense]
  ADD CONSTRAINT PK_UniformLicense PRIMARY KEY CLUSTERED (LicenseKey, UniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLicense]') AND [name] = N'IX_UniformLicense_UniformKey_LicenseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformLicense_UniformKey_LicenseKey ON [dbo].[UniformLicense] (UniformKey, LicenseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLink]') AND [name] = N'PK_UniformLink')
BEGIN
  ALTER TABLE [dbo].[UniformLink]
  ADD CONSTRAINT PK_UniformLink PRIMARY KEY CLUSTERED (UniformLinkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformRegistry]') AND [name] = N'PK_UniformRegistry')
BEGIN
  ALTER TABLE [dbo].[UniformRegistry]
  ADD CONSTRAINT PK_UniformRegistry PRIMARY KEY CLUSTERED (UniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformResourceAction]') AND [name] = N'PK_UniformResourceAction')
BEGIN
  ALTER TABLE [dbo].[UniformResourceAction]
  ADD CONSTRAINT PK_UniformResourceAction PRIMARY KEY CLUSTERED (UniformResourceActionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformResourceAction]') AND [name] = N'AK_UniformResourceActionRef_UniformResourceKey_ResourceActionKey_ComponentKey')
BEGIN
  ALTER TABLE [dbo].[UniformResourceAction]
  ADD CONSTRAINT AK_UniformResourceActionRef_UniformResourceKey_ResourceActionKey_ComponentKey UNIQUE NONCLUSTERED (UniformResourceKey, ResourceActionKey, ComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformResourceRef]') AND [name] = N'PK_UniformResourceRef')
BEGIN
  ALTER TABLE [dbo].[UniformResourceRef]
  ADD CONSTRAINT PK_UniformResourceRef PRIMARY KEY CLUSTERED (UniformResourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformResourceRef]') AND [name] = N'AK_UniformResourceRef_UniformResourceName')
BEGIN
  ALTER TABLE [dbo].[UniformResourceRef]
  ADD CONSTRAINT AK_UniformResourceRef_UniformResourceName UNIQUE NONCLUSTERED (UniformResourceName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformResourceRef]') AND [name] = N'AK_UniformResourceRef_UniformResourceDesc')
BEGIN
  ALTER TABLE [dbo].[UniformResourceRef]
  ADD CONSTRAINT AK_UniformResourceRef_UniformResourceDesc UNIQUE NONCLUSTERED (UniformResourceDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformTag]') AND [name] = N'PK_UniformTag')
BEGIN
  ALTER TABLE [dbo].[UniformTag]
  ADD CONSTRAINT PK_UniformTag PRIMARY KEY CLUSTERED (UniformKey, TagKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformTag]') AND [name] = N'IX_UniformTag_TagKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformTag_TagKey ON [dbo].[UniformTag] (TagKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformTypeRef]') AND [name] = N'PK_UniformTypeRef')
BEGIN
  ALTER TABLE [dbo].[UniformTypeRef]
  ADD CONSTRAINT PK_UniformTypeRef PRIMARY KEY CLUSTERED (UniformType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformTypeRef]') AND [name] = N'AK_UniformTypeRef_UniformTypeDesc')
BEGIN
  ALTER TABLE [dbo].[UniformTypeRef]
  ADD CONSTRAINT AK_UniformTypeRef_UniformTypeDesc UNIQUE NONCLUSTERED (UniformTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UnofferedCustomerExperience]') AND [name] = N'PK_UnofferedCustomerExperience_UnofferedCustomerExperienceKey')
BEGIN
  ALTER TABLE [dbo].[UnofferedCustomerExperience]
  ADD CONSTRAINT PK_UnofferedCustomerExperience_UnofferedCustomerExperienceKey PRIMARY KEY CLUSTERED (UnofferedCustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Uom]') AND [name] = N'PK_Uom')
BEGIN
  ALTER TABLE [dbo].[Uom]
  ADD CONSTRAINT PK_Uom PRIMARY KEY CLUSTERED (UomKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UomConversion]') AND [name] = N'PK_UomConversion')
BEGIN
  ALTER TABLE [dbo].[UomConversion]
  ADD CONSTRAINT PK_UomConversion PRIMARY KEY CLUSTERED (UomConversionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UomConversion]') AND [name] = N'AK_UomConversion')
BEGIN
  ALTER TABLE [dbo].[UomConversion]
  ADD CONSTRAINT AK_UomConversion UNIQUE NONCLUSTERED (FromUomKey, ToUomKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UomGroup]') AND [name] = N'PK_UomGroup')
BEGIN
  ALTER TABLE [dbo].[UomGroup]
  ADD CONSTRAINT PK_UomGroup PRIMARY KEY CLUSTERED (UomGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UomGroup]') AND [name] = N'AK_UomGroup_Name')
BEGIN
  ALTER TABLE [dbo].[UomGroup]
  ADD CONSTRAINT AK_UomGroup_Name UNIQUE NONCLUSTERED (Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URL_Mapping]') AND [name] = N'PK_URL_Mapping')
BEGIN
  ALTER TABLE [dbo].[URL_Mapping]
  ADD CONSTRAINT PK_URL_Mapping PRIMARY KEY CLUSTERED (URLMappingID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URLMapping]') AND [name] = N'PK_URLMapping')
BEGIN
  ALTER TABLE [dbo].[URLMapping]
  ADD CONSTRAINT PK_URLMapping PRIMARY KEY CLUSTERED (URLMappingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URLs]') AND [name] = N'iURLsURL_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iURLsURL_TYPE ON [dbo].[URLs] (URL_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URLs]') AND [name] = N'iURLsURL')
BEGIN
  CREATE NONCLUSTERED INDEX iURLsURL ON [dbo].[URLs] (URL)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UsedSourceCode]') AND [name] = N'PK_UsedSourceCode')
BEGIN
  ALTER TABLE [dbo].[UsedSourceCode]
  ADD CONSTRAINT PK_UsedSourceCode PRIMARY KEY CLUSTERED (SourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[User_Defined_Field]') AND [name] = N'PK_User_Defined_Field')
BEGIN
  ALTER TABLE [dbo].[User_Defined_Field]
  ADD CONSTRAINT PK_User_Defined_Field PRIMARY KEY CLUSTERED (ColumnName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[User_Tab_Pref]') AND [name] = N'PK_User_Tab_Pref')
BEGIN
  ALTER TABLE [dbo].[User_Tab_Pref]
  ADD CONSTRAINT PK_User_Tab_Pref PRIMARY KEY NONCLUSTERED (PREF_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[User_Tab_Pref_Detail]') AND [name] = N'PK_User_Tab_Pref_Detail')
BEGIN
  ALTER TABLE [dbo].[User_Tab_Pref_Detail]
  ADD CONSTRAINT PK_User_Tab_Pref_Detail PRIMARY KEY NONCLUSTERED (PREF_ID, TAB_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedCustomerExperience]') AND [name] = N'PK_UserDefinedCustomerExperience_UserDefinedCustomerExperienceKey')
BEGIN
  ALTER TABLE [dbo].[UserDefinedCustomerExperience]
  ADD CONSTRAINT PK_UserDefinedCustomerExperience_UserDefinedCustomerExperienceKey PRIMARY KEY CLUSTERED (UserDefinedCustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedFieldRef]') AND [name] = N'PK_UserDefinedFieldRef')
BEGIN
  ALTER TABLE [dbo].[UserDefinedFieldRef]
  ADD CONSTRAINT PK_UserDefinedFieldRef PRIMARY KEY CLUSTERED (UserDefinedFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'PK_UserDefinedMultiInstanceProperty')
BEGIN
  ALTER TABLE [dbo].[UserDefinedMultiInstanceProperty]
  ADD CONSTRAINT PK_UserDefinedMultiInstanceProperty PRIMARY KEY CLUSTERED (TableName, PropertyName, RowID, RowKey, RowSequence)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'PK_UserDefinedSingleInstanceProperty')
BEGIN
  ALTER TABLE [dbo].[UserDefinedSingleInstanceProperty]
  ADD CONSTRAINT PK_UserDefinedSingleInstanceProperty PRIMARY KEY CLUSTERED (TableName, PropertyName, RowID, RowKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_StringValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_StringValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyStringValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_IntValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_IntValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyIntValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_GuidValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_GuidValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyGuidValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_DecimalValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_DecimalValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyDecimalValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_DateTimeValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_DateTimeValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyDateTimeValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_BooleanValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_BooleanValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyBooleanValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_StringValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_StringValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyStringValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_IntValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_IntValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyIntValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_GuidValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_GuidValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyGuidValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_DateTimeValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_DateTimeValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyDateTimeValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_BooleanValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_BooleanValue ON [dbo].[UserDefinedSingleInstanceProperty] (PropertyBooleanValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'PK_UserMain')
BEGIN
  ALTER TABLE [dbo].[UserMain]
  ADD CONSTRAINT PK_UserMain PRIMARY KEY CLUSTERED (UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_ContactMaster')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMaster ON [dbo].[UserMain] (ContactMaster)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'AK_UserMain_UserID')
BEGIN
  CREATE NONCLUSTERED INDEX AK_UserMain_UserID ON [dbo].[UserMain] (UserId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserRole]') AND [name] = N'PK_UserRole')
BEGIN
  ALTER TABLE [dbo].[UserRole]
  ADD CONSTRAINT PK_UserRole PRIMARY KEY CLUSTERED (UserKey, RoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Users]') AND [name] = N'PK_Users')
BEGIN
  ALTER TABLE [dbo].[Users]
  ADD CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (UserId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserToken]') AND [name] = N'PK_UserToken')
BEGIN
  ALTER TABLE [dbo].[UserToken]
  ADD CONSTRAINT PK_UserToken PRIMARY KEY CLUSTERED (UserKey, Grantee)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Variable_Type_Ref]') AND [name] = N'PK_Variable_Type_Ref')
BEGIN
  ALTER TABLE [dbo].[Variable_Type_Ref]
  ADD CONSTRAINT PK_Variable_Type_Ref PRIMARY KEY CLUSTERED (VariableTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Vat_Rule]') AND [name] = N'IX_Vat_Rule_VAT_RULESET')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Vat_Rule_VAT_RULESET ON [dbo].[Vat_Rule] (VAT_RULESET)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Vat_Rule_Set]') AND [name] = N'PK_Vat_Rule_Set')
BEGIN
  ALTER TABLE [dbo].[Vat_Rule_Set]
  ADD CONSTRAINT PK_Vat_Rule_Set PRIMARY KEY CLUSTERED (VAT_RULESET)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[VAT_Trans]') AND [name] = N'PK_VAT_Trans')
BEGIN
  ALTER TABLE [dbo].[VAT_Trans]
  ADD CONSTRAINT PK_VAT_Trans PRIMARY KEY NONCLUSTERED (TYPE, REFERENCE_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[VerisignGatewayAccount]') AND [name] = N'PK_VerisignGatewayAccount')
BEGIN
  ALTER TABLE [dbo].[VerisignGatewayAccount]
  ADD CONSTRAINT PK_VerisignGatewayAccount PRIMARY KEY CLUSTERED (GatewayAccountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[VerticalAlignmentRef]') AND [name] = N'PK_VerticalAlignmentRef')
BEGIN
  ALTER TABLE [dbo].[VerticalAlignmentRef]
  ADD CONSTRAINT PK_VerticalAlignmentRef PRIMARY KEY CLUSTERED (VerticalAlignmentCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[VerticalAlignmentRef]') AND [name] = N'AK_VerticalAlignmentRef_VerticalAlignmentName')
BEGIN
  ALTER TABLE [dbo].[VerticalAlignmentRef]
  ADD CONSTRAINT AK_VerticalAlignmentRef_VerticalAlignmentName UNIQUE NONCLUSTERED (VerticalAlignmentName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[VerticalAlignmentRef]') AND [name] = N'AK_VerticalAlignmentRef_VerticalAlignmentDesc')
BEGIN
  ALTER TABLE [dbo].[VerticalAlignmentRef]
  ADD CONSTRAINT AK_VerticalAlignmentRef_VerticalAlignmentDesc UNIQUE NONCLUSTERED (VerticalAlignmentDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailCommittee]') AND [name] = N'PK_vSoaGroupMemberDetailCommittee')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailCommittee ON [dbo].[vSoaGroupMemberDetailCommittee] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailCommittee]') AND [name] = N'IX_vSoaGroupMemberDetailCommittee_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailCommittee_GroupMemberId ON [dbo].[vSoaGroupMemberDetailCommittee] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization]') AND [name] = N'PK_vSoaGroupMemberDetailOrganization')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailOrganization ON [dbo].[vSoaGroupMemberDetailOrganization] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization]') AND [name] = N'IX_vSoaGroupMemberDetailOrganization_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailOrganization_GroupMemberId ON [dbo].[vSoaGroupMemberDetailOrganization] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailRelationship]') AND [name] = N'PK_vSoaGroupMemberDetailRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailRelationship ON [dbo].[vSoaGroupMemberDetailRelationship] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailRelationship]') AND [name] = N'IX_vSoaGroupMemberDetailRelationship_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailRelationship_GroupMemberId ON [dbo].[vSoaGroupMemberDetailRelationship] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscription]') AND [name] = N'PK_vSoaGroupMemberDetailSubscription')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailSubscription ON [dbo].[vSoaGroupMemberDetailSubscription] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscription]') AND [name] = N'IX_vSoaGroupMemberDetailSubscription_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailSubscription_GroupMemberId ON [dbo].[vSoaGroupMemberDetailSubscription] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'PK_vSoaGroupMemberSummaryCommittee')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryCommittee ON [dbo].[vSoaGroupMemberSummaryCommittee] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee_PartyId ON [dbo].[vSoaGroupMemberSummaryCommittee] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee_GroupId ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'PK_vSoaGroupMemberSummaryMT')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryMT ON [dbo].[vSoaGroupMemberSummaryMT] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'IX_vSoaGroupMemberSummaryMT_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryMT_PartyId ON [dbo].[vSoaGroupMemberSummaryMT] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'IX_vSoaGroupMemberSummaryMT_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryMT_GroupId ON [dbo].[vSoaGroupMemberSummaryMT] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization]') AND [name] = N'PK_vSoaGroupMemberSummaryOrganization')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryOrganization ON [dbo].[vSoaGroupMemberSummaryOrganization] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_PartyId ON [dbo].[vSoaGroupMemberSummaryOrganization] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_GroupId ON [dbo].[vSoaGroupMemberSummaryOrganization] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'PK_vSoaGroupMemberSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryRelationship ON [dbo].[vSoaGroupMemberSummaryRelationship] (SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_PartyIdId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_PartyIdId ON [dbo].[vSoaGroupMemberSummaryRelationship] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_GroupId ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'PK_vSoaGroupMemberSummarySubscription')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummarySubscription ON [dbo].[vSoaGroupMemberSummarySubscription] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'IX_vSoaGroupMemberSummarySubscription_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummarySubscription_PartyId ON [dbo].[vSoaGroupMemberSummarySubscription] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'IX_vSoaGroupMemberSummarySubscription_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummarySubscription_GroupId ON [dbo].[vSoaGroupMemberSummarySubscription] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]') AND [name] = N'PK_vSoaGroupSummaryMeeting')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryMeeting ON [dbo].[vSoaGroupSummaryMeeting] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMT]') AND [name] = N'PK_vSoaGroupSummaryMT')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryMT ON [dbo].[vSoaGroupSummaryMT] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'PK_vSoaGroupSummaryOrganization')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryOrganization ON [dbo].[vSoaGroupSummaryOrganization] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]') AND [name] = N'PK_vSoaGroupSummaryProduct')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryProduct ON [dbo].[vSoaGroupSummaryProduct] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]') AND [name] = N'PK_vSoaGroupSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryRelationship ON [dbo].[vSoaGroupSummaryRelationship] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaItemEvent]') AND [name] = N'PK_vSoaItemEvent')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaItemEvent ON [dbo].[vSoaItemEvent] (ItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaItemEvent]') AND [name] = N'IX_vSoaItemEvent')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaItemEvent ON [dbo].[vSoaItemEvent] (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[W_Reports]') AND [name] = N'iW_ReportsSECURITY_GROUP')
BEGIN
  CREATE NONCLUSTERED INDEX iW_ReportsSECURITY_GROUP ON [dbo].[W_Reports] (SECURITY_GROUP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[W_Reports]') AND [name] = N'iW_ReportsREPORT_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iW_ReportsREPORT_TYPE ON [dbo].[W_Reports] (REPORT_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[W_Reports]') AND [name] = N'iW_ReportsREPORT_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iW_ReportsREPORT_NUM ON [dbo].[W_Reports] (REPORT_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Warehouse]') AND [name] = N'PK_Warehouse')
BEGIN
  ALTER TABLE [dbo].[Warehouse]
  ADD CONSTRAINT PK_Warehouse PRIMARY KEY CLUSTERED (WarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Warehouse]') AND [name] = N'IX_Warehouse_ShipZoneKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Warehouse_ShipZoneKey ON [dbo].[Warehouse] (ShipZoneKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Warehouse]') AND [name] = N'IX_Warehouse_ShipOriginKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Warehouse_ShipOriginKey ON [dbo].[Warehouse] (ShipOriginKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Warehouse]') AND [name] = N'IX_Warehouse_Address')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Warehouse_Address ON [dbo].[Warehouse] (FullAddressKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseCarrier]') AND [name] = N'PK_WarehouseCarrier')
BEGIN
  ALTER TABLE [dbo].[WarehouseCarrier]
  ADD CONSTRAINT PK_WarehouseCarrier PRIMARY KEY CLUSTERED (ShipCarrierKey, WarehouseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseCarrier]') AND [name] = N'IX_WarehouseCarrier_ShipCarrierKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WarehouseCarrier_ShipCarrierKey ON [dbo].[WarehouseCarrier] (ShipCarrierKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseCarrierService]') AND [name] = N'PK_WarehouseCarrierService')
BEGIN
  ALTER TABLE [dbo].[WarehouseCarrierService]
  ADD CONSTRAINT PK_WarehouseCarrierService PRIMARY KEY CLUSTERED (ShipMethodKey, WarehouseKey, ShipCarrierKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseCarrierService]') AND [name] = N'IX_WarehouseCarrierService_ShipCarrierKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WarehouseCarrierService_ShipCarrierKey ON [dbo].[WarehouseCarrierService] (ShipCarrierKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseStatusRef]') AND [name] = N'PK_WarehouseStatusRef')
BEGIN
  ALTER TABLE [dbo].[WarehouseStatusRef]
  ADD CONSTRAINT PK_WarehouseStatusRef PRIMARY KEY CLUSTERED (WarehouseStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseStatusRef]') AND [name] = N'AK_WarehouseStatusRef_WarehouseStatusDesc')
BEGIN
  ALTER TABLE [dbo].[WarehouseStatusRef]
  ADD CONSTRAINT AK_WarehouseStatusRef_WarehouseStatusDesc UNIQUE NONCLUSTERED (WarehouseStatusDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseTypeRef]') AND [name] = N'PK_WarehouseTypeRef')
BEGIN
  ALTER TABLE [dbo].[WarehouseTypeRef]
  ADD CONSTRAINT PK_WarehouseTypeRef PRIMARY KEY CLUSTERED (WarehouseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseTypeRef]') AND [name] = N'AK_WarehouseTypeRef_WarehouseTypeName')
BEGIN
  ALTER TABLE [dbo].[WarehouseTypeRef]
  ADD CONSTRAINT AK_WarehouseTypeRef_WarehouseTypeName UNIQUE NONCLUSTERED (WarehouseTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseTypeRef]') AND [name] = N'AK_WarehouseTypeRef_WarehouseTypeDesc')
BEGIN
  ALTER TABLE [dbo].[WarehouseTypeRef]
  ADD CONSTRAINT AK_WarehouseTypeRef_WarehouseTypeDesc UNIQUE NONCLUSTERED (WarehouseTypeDesc)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Web_Counter]') AND [name] = N'PK_Web_Counter')
BEGIN
  ALTER TABLE [dbo].[Web_Counter]
  ADD CONSTRAINT PK_Web_Counter PRIMARY KEY NONCLUSTERED (PAGE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Website]') AND [name] = N'PK_Website')
BEGIN
  ALTER TABLE [dbo].[Website]
  ADD CONSTRAINT PK_Website PRIMARY KEY CLUSTERED (WebsiteKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Website_Content_Authority]') AND [name] = N'PK_Website_Content_Authority')
BEGIN
  ALTER TABLE [dbo].[Website_Content_Authority]
  ADD CONSTRAINT PK_Website_Content_Authority PRIMARY KEY CLUSTERED (WebsiteKey, ContentAuthorityGroupID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Website_Security_Group]') AND [name] = N'PK_Website_Security_Group')
BEGIN
  ALTER TABLE [dbo].[Website_Security_Group]
  ADD CONSTRAINT PK_Website_Security_Group PRIMARY KEY CLUSTERED (WebsiteKey, SecurityGroupCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WebUserControlRef]') AND [name] = N'UQ__WebUserControlRe__274D7E3E')
BEGIN
  ALTER TABLE [dbo].[WebUserControlRef]
  ADD CONSTRAINT UQ__WebUserControlRe__274D7E3E UNIQUE NONCLUSTERED (WebUserControlPath)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WebUserControlRef]') AND [name] = N'PK__WebUserControlRe__26595A05')
BEGIN
  ALTER TABLE [dbo].[WebUserControlRef]
  ADD CONSTRAINT PK__WebUserControlRe__26595A05 PRIMARY KEY CLUSTERED (WebUserControlName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Workflow_Status_Ref]') AND [name] = N'PK_Workflow_Status_Ref')
BEGIN
  ALTER TABLE [dbo].[Workflow_Status_Ref]
  ADD CONSTRAINT PK_Workflow_Status_Ref PRIMARY KEY CLUSTERED (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowDemoLog]') AND [name] = N'PK_WorkflowDemoLog')
BEGIN
  ALTER TABLE [dbo].[WorkflowDemoLog]
  ADD CONSTRAINT PK_WorkflowDemoLog PRIMARY KEY CLUSTERED (LoginUser, LogTimeStamp)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowInstance]') AND [name] = N'PK_WorkflowInstance')
BEGIN
  ALTER TABLE [dbo].[WorkflowInstance]
  ADD CONSTRAINT PK_WorkflowInstance PRIMARY KEY CLUSTERED (WorkflowInstanceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'PK_WorkflowQueue')
BEGIN
  ALTER TABLE [dbo].[WorkflowQueue]
  ADD CONSTRAINT PK_WorkflowQueue PRIMARY KEY CLUSTERED (WorkFlowQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_TaskItemKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_TaskItemKey ON [dbo].[WorkflowQueue] (TaskItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueueStatusRef]') AND [name] = N'PK_WorkflowQueueStatusRef')
BEGIN
  ALTER TABLE [dbo].[WorkflowQueueStatusRef]
  ADD CONSTRAINT PK_WorkflowQueueStatusRef PRIMARY KEY CLUSTERED (WorkflowQueueStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowService]') AND [name] = N'PK_WorkflowService')
BEGIN
  ALTER TABLE [dbo].[WorkflowService]
  ADD CONSTRAINT PK_WorkflowService PRIMARY KEY CLUSTERED (WorkflowServiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowService]') AND [name] = N'IX_WorkflowService_MachineName_ServiceName')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_WorkflowService_MachineName_ServiceName ON [dbo].[WorkflowService] (MachineName, ServiceName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowServiceWorker]') AND [name] = N'PK_WorkflowServiceWorker')
BEGIN
  ALTER TABLE [dbo].[WorkflowServiceWorker]
  ADD CONSTRAINT PK_WorkflowServiceWorker PRIMARY KEY CLUSTERED (WorkflowServiceKey, WorkItemQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowServiceWorker]') AND [name] = N'IX_WorkflowServiceWorker_WorkItemQueueKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowServiceWorker_WorkItemQueueKey ON [dbo].[WorkflowServiceWorker] (WorkItemQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowServiceWorker]') AND [name] = N'IX_WorkflowServiceWorker_WorkflowInstanceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowServiceWorker_WorkflowInstanceKey ON [dbo].[WorkflowServiceWorker] (WorkflowInstanceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowStatusRef]') AND [name] = N'PK_WorkflowStatusRef')
BEGIN
  ALTER TABLE [dbo].[WorkflowStatusRef]
  ADD CONSTRAINT PK_WorkflowStatusRef PRIMARY KEY CLUSTERED (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkInvoiceDistribution]') AND [name] = N'PK_WorkInvoiceDistribution')
BEGIN
  ALTER TABLE [dbo].[WorkInvoiceDistribution]
  ADD CONSTRAINT PK_WorkInvoiceDistribution PRIMARY KEY CLUSTERED (WorkInvoiceDistributionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkInvoiceLine]') AND [name] = N'PK_WorkInvoiceLine')
BEGIN
  ALTER TABLE [dbo].[WorkInvoiceLine]
  ADD CONSTRAINT PK_WorkInvoiceLine PRIMARY KEY CLUSTERED (WorkInvoiceLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkInvoiceMain]') AND [name] = N'PK_WorkInvoiceMain')
BEGIN
  ALTER TABLE [dbo].[WorkInvoiceMain]
  ADD CONSTRAINT PK_WorkInvoiceMain PRIMARY KEY CLUSTERED (WorkInvoiceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItem]') AND [name] = N'PK_WorkItem')
BEGIN
  ALTER TABLE [dbo].[WorkItem]
  ADD CONSTRAINT PK_WorkItem PRIMARY KEY CLUSTERED (WorkItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItemQueue]') AND [name] = N'PK_WorkItemQueue')
BEGIN
  ALTER TABLE [dbo].[WorkItemQueue]
  ADD CONSTRAINT PK_WorkItemQueue PRIMARY KEY CLUSTERED (WorkItemQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItemQueue]') AND [name] = N'IX_WorkItemQueue_WorkflowInstanceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkItemQueue_WorkflowInstanceKey ON [dbo].[WorkItemQueue] (WorkflowInstanceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItemQueue]') AND [name] = N'IX_WorkItemQueue_Priority_EnqueuedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkItemQueue_Priority_EnqueuedOn ON [dbo].[WorkItemQueue] (Priority, EnqueuedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkMonetaryApplication]') AND [name] = N'PK_WorkMonetaryApplication')
BEGIN
  ALTER TABLE [dbo].[WorkMonetaryApplication]
  ADD CONSTRAINT PK_WorkMonetaryApplication PRIMARY KEY CLUSTERED (WorkMonetaryApplicationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkOrderMain]') AND [name] = N'PK_WorkOrderMain')
BEGIN
  ALTER TABLE [dbo].[WorkOrderMain]
  ADD CONSTRAINT PK_WorkOrderMain PRIMARY KEY CLUSTERED (WorkOrderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkPayment]') AND [name] = N'PK_WorkPayment')
BEGIN
  ALTER TABLE [dbo].[WorkPayment]
  ADD CONSTRAINT PK_WorkPayment PRIMARY KEY CLUSTERED (WorkPaymentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkTransactionLine]') AND [name] = N'PK_WorkTransactionLine')
BEGIN
  ALTER TABLE [dbo].[WorkTransactionLine]
  ADD CONSTRAINT PK_WorkTransactionLine PRIMARY KEY CLUSTERED (WorkTransactionLineKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkTransactionMain]') AND [name] = N'PK_WorkTransactionMain')
BEGIN
  ALTER TABLE [dbo].[WorkTransactionMain]
  ADD CONSTRAINT PK_WorkTransactionMain PRIMARY KEY CLUSTERED (WorkTransactionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Zip_Code]') AND [name] = N'PK_Zip_Code')
BEGIN
  ALTER TABLE [dbo].[Zip_Code]
  ADD CONSTRAINT PK_Zip_Code PRIMARY KEY CLUSTERED (ZIP)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Zip3]') AND [name] = N'PK_Zip3')
BEGIN
  ALTER TABLE [dbo].[Zip3]
  ADD CONSTRAINT PK_Zip3 PRIMARY KEY CLUSTERED (ZIP_3)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Zone_Code]') AND [name] = N'iZone_CodeZONE_TABLE_ID')
BEGIN
  CREATE CLUSTERED INDEX iZone_CodeZONE_TABLE_ID ON [dbo].[Zone_Code] (ZONE_TABLE_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Zone_Code]') AND [name] = N'iZone_CodeVendor')
BEGIN
  CREATE NONCLUSTERED INDEX iZone_CodeVendor ON [dbo].[Zone_Code] (SHIP_METHOD)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Zone_Code]') AND [name] = N'iZone_CodeCOUNTRY_NAMES')
BEGIN
  CREATE NONCLUSTERED INDEX iZone_CodeCOUNTRY_NAMES ON [dbo].[Zone_Code] (COUNTRY)
END
go


