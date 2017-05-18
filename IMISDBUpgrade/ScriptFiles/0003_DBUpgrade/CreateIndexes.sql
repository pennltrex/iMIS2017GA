
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessArea]') AND [name] = N'IX_AccessArea_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessArea_UpdatedByUserKey ON [dbo].[AccessArea] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessArea]') AND [name] = N'IX_AccessArea_ProtectedAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessArea_ProtectedAccessKey ON [dbo].[AccessArea] (ProtectedAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessArea]') AND [name] = N'IX_AccessArea_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessArea_CreatedByUserKey ON [dbo].[AccessArea] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'PK_AccessItem')
BEGIN
  ALTER TABLE [dbo].[AccessItem]
  ADD CONSTRAINT PK_AccessItem PRIMARY KEY CLUSTERED (AccessKey, Grantee)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'IX_AccessItem_UserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessItem_UserKey ON [dbo].[AccessItem] (UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'IX_AccessItem_RoleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessItem_RoleKey ON [dbo].[AccessItem] (RoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'IX_AccessItem_Grantee')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessItem_Grantee ON [dbo].[AccessItem] (Grantee)
  INCLUDE (Permission, AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') AND [name] = N'IX_AccessItem_AccessKey_Permission_Grantee')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessItem_AccessKey_Permission_Grantee ON [dbo].[AccessItem] (AccessKey, Permission, Grantee)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessMain]') AND [name] = N'IX_AccessMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessMain_UpdatedByUserKey ON [dbo].[AccessMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccessMain]') AND [name] = N'IX_AccessMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccessMain_CreatedByUserKey ON [dbo].[AccessMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccountingMethodRef]') AND [name] = N'PK_AccountingMethodRef')
BEGIN
  ALTER TABLE [dbo].[AccountingMethodRef]
  ADD CONSTRAINT PK_AccountingMethodRef PRIMARY KEY CLUSTERED (AccountingMethodCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccountPending]') AND [name] = N'PK_AccountPending')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_AccountPending ON [dbo].[AccountPending] (AccountPendingID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AccountPending]') AND [name] = N'IX_AccountPending_LastName_Email')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AccountPending_LastName_Email ON [dbo].[AccountPending] (LastName, Email)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ActionPlan]') AND [name] = N'IX_ActionPlan_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ActionPlan_UpdatedByUserKey ON [dbo].[ActionPlan] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ActionPlan]') AND [name] = N'IX_ActionPlan_OpportunityTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ActionPlan_OpportunityTypeKey ON [dbo].[ActionPlan] (OpportunityTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ActionPlan]') AND [name] = N'IX_ActionPlan_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ActionPlan_CreatedByUserKey ON [dbo].[ActionPlan] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySEQNIDACTIVITY_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySEQNIDACTIVITY_TYPE ON [dbo].[Activity] (SEQN, ID, ACTIVITY_TYPE)
  INCLUDE (SOLICITOR_ID, SOURCE_SYSTEM, SOURCE_CODE, TRANSACTION_DATE, TAXABLE_VALUE, ACTION_CODES, UF_4, ORIGINATING_TRANS_NUM, PRODUCT_CODE, ORG_CODE, EFFECTIVE_DATE, CAMPAIGN_CODE, AMOUNT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivitySEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iActivitySEQN ON [dbo].[Activity] (SEQN)
  INCLUDE (SOURCE_CODE, ID, CAMPAIGN_CODE, ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityPRODUCT_CODE ON [dbo].[Activity] (PRODUCT_CODE)
  INCLUDE (SEQN, THRU_DATE, ACTION_CODES, ID, EFFECTIVE_DATE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityORIGINATING_TRANS_NUM2')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityORIGINATING_TRANS_NUM2 ON [dbo].[Activity] (ORIGINATING_TRANS_NUM)
  INCLUDE (MEM_TRIB_CODE, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityORIGINATING_TRANS_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityORIGINATING_TRANS_NUM ON [dbo].[Activity] (ORIGINATING_TRANS_NUM, SEQN)
  INCLUDE (PRODUCT_CODE, MEM_TRIB_CODE, ID, ORG_CODE, EFFECTIVE_DATE, CAMPAIGN_CODE, ACTION_CODES, ACTIVITY_TYPE, UF_4, TAXABLE_VALUE, SOURCE_SYSTEM, TRANSACTION_DATE, SOURCE_CODE, SOLICITOR_ID, AMOUNT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityORG_CODE ON [dbo].[Activity] (ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') AND [name] = N'iActivityIDSEQNTYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iActivityIDSEQNTYPE ON [dbo].[Activity] (ID)
  INCLUDE (ORIGINATING_TRANS_NUM, ACTIVITY_TYPE, TRANSACTION_DATE, SEQN)
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
  CREATE NONCLUSTERED INDEX iActivityACTIVITY_TYPE ON [dbo].[Activity] (ACTIVITY_TYPE, SOURCE_SYSTEM)
  INCLUDE (PRODUCT_CODE, SOURCE_CODE, TRANSACTION_DATE, CAMPAIGN_CODE, EFFECTIVE_DATE, ORIGINATING_TRANS_NUM, ORG_CODE, ID, AMOUNT)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Section_Ref]') AND [name] = N'IX_Admin_Section_Ref_ComponentCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Admin_Section_Ref_ComponentCode ON [dbo].[Admin_Section_Ref] (ComponentCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Security]') AND [name] = N'PK_Admin_Security')
BEGIN
  ALTER TABLE [dbo].[Admin_Security]
  ADD CONSTRAINT PK_Admin_Security PRIMARY KEY CLUSTERED (ContactID, AdminSectionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Appeal]') AND [name] = N'iAppealTITLE')
BEGIN
  CREATE NONCLUSTERED INDEX iAppealTITLE ON [dbo].[Appeal] (APPEAL_CODE, TITLE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'IX_AppealMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealMain_UpdatedByUserKey ON [dbo].[AppealMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'IX_AppealMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealMain_CreatedByUserKey ON [dbo].[AppealMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'IX_AppealMain_CampaignKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealMain_CampaignKey ON [dbo].[AppealMain] (CampaignKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'IX_AppealMain_AppealStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealMain_AppealStatusCode ON [dbo].[AppealMain] (AppealStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') AND [name] = N'IX_AppealMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealMain_AccessKey ON [dbo].[AppealMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'PK_AppealParticipation')
BEGIN
  ALTER TABLE [dbo].[AppealParticipation]
  ADD CONSTRAINT PK_AppealParticipation PRIMARY KEY CLUSTERED (AppealParticipationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_UpdatedByUserKey ON [dbo].[AppealParticipation] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_ResponseTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_ResponseTypeCode ON [dbo].[AppealParticipation] (ResponseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_RespondentUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_RespondentUserKey ON [dbo].[AppealParticipation] (RespondentUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') AND [name] = N'IX_AppealParticipation_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AppealParticipation_CreatedByUserKey ON [dbo].[AppealParticipation] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSData]') AND [name] = N'iAsiGPSDataSerialNo')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSDataSerialNo ON [dbo].[AsiGPSData] (SerialNo)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSData]') AND [name] = N'iAsiGPSDataRowType')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSDataRowType ON [dbo].[AsiGPSData] (RowType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSData]') AND [name] = N'iAsiGPSDataPeriodEnd')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSDataPeriodEnd ON [dbo].[AsiGPSData] (PeriodEnd)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSData]') AND [name] = N'iAsiGPSDataPeriodBegin')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSDataPeriodBegin ON [dbo].[AsiGPSData] (PeriodBegin)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSMeasureRef]') AND [name] = N'PK_AsiGPSMeasureRef')
BEGIN
  ALTER TABLE [dbo].[AsiGPSMeasureRef]
  ADD CONSTRAINT PK_AsiGPSMeasureRef PRIMARY KEY CLUSTERED (AsiGPSMeasureKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') AND [name] = N'iAsiGPSPivotDataSerialNo')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSPivotDataSerialNo ON [dbo].[AsiGPSPivotData] (SerialNo)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') AND [name] = N'iAsiGPSPivotDataRowType')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSPivotDataRowType ON [dbo].[AsiGPSPivotData] (RowType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') AND [name] = N'iAsiGPSPivotDataOrdinal')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSPivotDataOrdinal ON [dbo].[AsiGPSPivotData] (Ordinal)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') AND [name] = N'iAsiGPSPivotDataDimension')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSPivotDataDimension ON [dbo].[AsiGPSPivotData] (Dimension)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') AND [name] = N'iAsiGPSPivotDataDataYear')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiGPSPivotDataDataYear ON [dbo].[AsiGPSPivotData] (DataYear)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsAssociation]') AND [name] = N'PK_AsiNrdsAssociation')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsAssociation]
  ADD CONSTRAINT PK_AsiNrdsAssociation PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMember]') AND [name] = N'PK_AsiNrdsMember')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMember]
  ADD CONSTRAINT PK_AsiNrdsMember PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberDemographic]') AND [name] = N'PK_AsiNrdsMemberDemographic')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMemberDemographic]
  ADD CONSTRAINT PK_AsiNrdsMemberDemographic PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberDesignation]') AND [name] = N'PK_AsiNrdsMemberDesignation')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMemberDesignation]
  ADD CONSTRAINT PK_AsiNrdsMemberDesignation PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberEducation]') AND [name] = N'PK_AsiNrdsMemberEducation')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMemberEducation]
  ADD CONSTRAINT PK_AsiNrdsMemberEducation PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberFinancial]') AND [name] = N'PK_AsiNrdsMemberFinancial')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMemberFinancial]
  ADD CONSTRAINT PK_AsiNrdsMemberFinancial PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberSupplemental]') AND [name] = N'PK_AsiNrdsMemberSupplemental')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsMemberSupplemental]
  ADD CONSTRAINT PK_AsiNrdsMemberSupplemental PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsOffice]') AND [name] = N'PK_AsiNrdsOffice')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsOffice]
  ADD CONSTRAINT PK_AsiNrdsOffice PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsOfficeSupplemental]') AND [name] = N'PK_AsiNrdsOfficeSupplemental')
BEGIN
  ALTER TABLE [dbo].[AsiNrdsOfficeSupplemental]
  ADD CONSTRAINT PK_AsiNrdsOfficeSupplemental PRIMARY KEY CLUSTERED (ID, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsQueue]') AND [name] = N'iAsiNrdsQueueID')
BEGIN
  CREATE NONCLUSTERED INDEX iAsiNrdsQueueID ON [dbo].[AsiNrdsQueue] (ID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_UpdatedByUserKey ON [dbo].[AtomPanel] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_ComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_ComponentKey ON [dbo].[AtomPanel] (ComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_AtomPanelTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_AtomPanelTypeCode ON [dbo].[AtomPanel] (AtomPanelTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_AtomPanelStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_AtomPanelStatusCode ON [dbo].[AtomPanel] (AtomPanelStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_AtomPanelPurposeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_AtomPanelPurposeCode ON [dbo].[AtomPanel] (AtomPanelPurposeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') AND [name] = N'IX_AtomPanel_AtomPanelFactoryStateCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AtomPanel_AtomPanelFactoryStateCode ON [dbo].[AtomPanel] (AtomPanelFactoryStateCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'PK_AutoPayInstruction')
BEGIN
  ALTER TABLE [dbo].[AutoPayInstruction]
  ADD CONSTRAINT PK_AutoPayInstruction PRIMARY KEY CLUSTERED (InstructionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_Status_SourceSystem')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AutoPayInstruction_Status_SourceSystem ON [dbo].[AutoPayInstruction] (Status, SourceSystem)
  INCLUDE (AuthorizedPaymentAmount, StartDate, ProductCode, InstructionId, IntervalTypeCode, CustomerId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_Status')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AutoPayInstruction_Status ON [dbo].[AutoPayInstruction] (Status)
  INCLUDE (InstructionId, CustomerId, StartDate, IntervalTypeCode, EndDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_PaymentToken')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_AutoPayInstruction_PaymentToken ON [dbo].[AutoPayInstruction] (PaymentToken)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_IntervalTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AutoPayInstruction_IntervalTypeCode ON [dbo].[AutoPayInstruction] (IntervalTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_CustomerId_PaymentToken')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AutoPayInstruction_CustomerId_PaymentToken ON [dbo].[AutoPayInstruction] (SourceSystem, CancelledOn)
  INCLUDE (CustomerId, PaymentToken)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') AND [name] = N'IX_AutoPayInstruction_CustomerId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_AutoPayInstruction_CustomerId ON [dbo].[AutoPayInstruction] (CustomerId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[AVSBillingLog]') AND [name] = N'PK_AVSBillingLog')
BEGIN
  ALTER TABLE [dbo].[AVSBillingLog]
  ADD CONSTRAINT PK_AVSBillingLog PRIMARY KEY CLUSTERED (AVSBillingLogKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'PK_BatchSetup')
BEGIN
  ALTER TABLE [dbo].[BatchSetup]
  ADD CONSTRAINT PK_BatchSetup PRIMARY KEY CLUSTERED (BatchSetupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup_UpdatedByUserKey ON [dbo].[BatchSetup] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup_SystemEntityKey ON [dbo].[BatchSetup] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup_CreatedByUserKey ON [dbo].[BatchSetup] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup_BatchTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup_BatchTypeCode ON [dbo].[BatchSetup] (BatchTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') AND [name] = N'IX_BatchSetup')
BEGIN
  CREATE NONCLUSTERED INDEX IX_BatchSetup ON [dbo].[BatchSetup] (DepartmentGroupKey, WorkObjectName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Campaign]') AND [name] = N'PK_Campaign')
BEGIN
  ALTER TABLE [dbo].[Campaign]
  ADD CONSTRAINT PK_Campaign PRIMARY KEY CLUSTERED (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Campaign]') AND [name] = N'iCampaign_Title')
BEGIN
  CREATE NONCLUSTERED INDEX iCampaign_Title ON [dbo].[Campaign] (TITLE)
  INCLUDE (CAMPAIGN_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'PK_CampaignMain')
BEGIN
  ALTER TABLE [dbo].[CampaignMain]
  ADD CONSTRAINT PK_CampaignMain PRIMARY KEY CLUSTERED (CampaignKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_UpdatedByUserKey ON [dbo].[CampaignMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_SystemEntityKey ON [dbo].[CampaignMain] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_PrimaryOwnerUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_PrimaryOwnerUserKey ON [dbo].[CampaignMain] (PrimaryOwnerUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_CreatedByUserKey ON [dbo].[CampaignMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_CampaignTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_CampaignTypeCode ON [dbo].[CampaignMain] (CampaignTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_CampaignStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_CampaignStatusCode ON [dbo].[CampaignMain] (CampaignStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') AND [name] = N'IX_CampaignMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignMain_AccessKey ON [dbo].[CampaignMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'PK_CampaignParticipation')
BEGIN
  ALTER TABLE [dbo].[CampaignParticipation]
  ADD CONSTRAINT PK_CampaignParticipation PRIMARY KEY CLUSTERED (CampaignParticipationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_UpdatedByUserKey ON [dbo].[CampaignParticipation] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_ResponseTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_ResponseTypeCode ON [dbo].[CampaignParticipation] (ResponseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_RespondentUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_RespondentUserKey ON [dbo].[CampaignParticipation] (RespondentUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_OptOutSourceCodeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_OptOutSourceCodeKey ON [dbo].[CampaignParticipation] (OptOutSourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') AND [name] = N'IX_CampaignParticipation_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CampaignParticipation_CreatedByUserKey ON [dbo].[CampaignParticipation] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartBilling]') AND [name] = N'IX_CartBilling_ProductCode_DuesType')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartBilling_ProductCode_DuesType ON [dbo].[CartBilling] (ProductCode, DuesType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartBilling]') AND [name] = N'IX_CartBilling_CartItemId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartBilling_CartItemId ON [dbo].[CartBilling] (CartItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') AND [name] = N'PK_CartEvent')
BEGIN
  ALTER TABLE [dbo].[CartEvent]
  ADD CONSTRAINT PK_CartEvent PRIMARY KEY CLUSTERED (CartEventID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') AND [name] = N'IX_CartEvent_RegistrantID_EventCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartEvent_RegistrantID_EventCode ON [dbo].[CartEvent] (RegistrantID, EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') AND [name] = N'IX_CartEvent_CartItemID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartEvent_CartItemID ON [dbo].[CartEvent] (CartItemID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') AND [name] = N'PK_CartEventFunction')
BEGIN
  ALTER TABLE [dbo].[CartEventFunction]
  ADD CONSTRAINT PK_CartEventFunction PRIMARY KEY CLUSTERED (CartEventFunctionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') AND [name] = N'IX_CartEventFunction_FunctionCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartEventFunction_FunctionCode ON [dbo].[CartEventFunction] (FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') AND [name] = N'IX_CartEventFunction_CartEventID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartEventFunction_CartEventID ON [dbo].[CartEventFunction] (CartEventID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartItem]') AND [name] = N'PK_CartItem')
BEGIN
  ALTER TABLE [dbo].[CartItem]
  ADD CONSTRAINT PK_CartItem PRIMARY KEY CLUSTERED (CartItemID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartItem]') AND [name] = N'IX_CartItem_UserID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartItem_UserID ON [dbo].[CartItem] (UserID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartOrder]') AND [name] = N'PK_CartOrder')
BEGIN
  ALTER TABLE [dbo].[CartOrder]
  ADD CONSTRAINT PK_CartOrder PRIMARY KEY CLUSTERED (CartOrderID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CartOrder]') AND [name] = N'IX_CartOrder_ProductCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CartOrder_ProductCode ON [dbo].[CartOrder] (ProductCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModule]') AND [name] = N'IX_CertificationModule_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModule_UpdatedByUserKey ON [dbo].[CertificationModule] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModule]') AND [name] = N'IX_CertificationModule_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModule_CreatedByUserKey ON [dbo].[CertificationModule] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModule]') AND [name] = N'IX_CertificationModule_CertificationModuleStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModule_CertificationModuleStatusCode ON [dbo].[CertificationModule] (CertificationModuleStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'PK_CertificationModuleGradeKey')
BEGIN
  ALTER TABLE [dbo].[CertificationModuleGrade]
  ADD CONSTRAINT PK_CertificationModuleGradeKey PRIMARY KEY CLUSTERED (CertificationModuleGradeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'IX_CertificationModuleGrade_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleGrade_UpdatedByUserKey ON [dbo].[CertificationModuleGrade] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'IX_CertificationModuleGrade_GradeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleGrade_GradeKey ON [dbo].[CertificationModuleGrade] (GradeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'IX_CertificationModuleGrade_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleGrade_CreatedByUserKey ON [dbo].[CertificationModuleGrade] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') AND [name] = N'IX_CertificationModuleGrade_CertificationModuleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleGrade_CertificationModuleKey ON [dbo].[CertificationModuleGrade] (CertificationModuleKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') AND [name] = N'IX_CertificationModuleRegistration_RegistrationStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleRegistration_RegistrationStatusCode ON [dbo].[CertificationModuleRegistration] (RegistrationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') AND [name] = N'IX_CertificationModuleRegistration_CustomerExperienceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleRegistration_CustomerExperienceKey ON [dbo].[CertificationModuleRegistration] (CustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') AND [name] = N'IX_CertificationModuleRegistration_CertificationProgramRegistrationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleRegistration_CertificationProgramRegistrationKey ON [dbo].[CertificationModuleRegistration] (CertificationProgramRegistrationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') AND [name] = N'IX_CertificationModuleRegistration_CertificationModuleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationModuleRegistration_CertificationModuleKey ON [dbo].[CertificationModuleRegistration] (CertificationModuleKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_UpdatedByUserKey ON [dbo].[CertificationProgram] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_PreRequiredProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_PreRequiredProgramKey ON [dbo].[CertificationProgram] (PreRequiredProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_ExperienceUnitKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_ExperienceUnitKey ON [dbo].[CertificationProgram] (ExperienceUnitKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_CreatedByUserKey ON [dbo].[CertificationProgram] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_CertificationProgramStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_CertificationProgramStatusCode ON [dbo].[CertificationProgram] (CertificationProgramStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') AND [name] = N'IX_CertificationProgram_CertificationProgramGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgram_CertificationProgramGroupKey ON [dbo].[CertificationProgram] (CertificationProgramGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramCertificationModule]') AND [name] = N'PK_CertificationProgramCertificationModule')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramCertificationModule]
  ADD CONSTRAINT PK_CertificationProgramCertificationModule PRIMARY KEY CLUSTERED (CertificationProgramCertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramCertificationModule]') AND [name] = N'IX_CertificationProgramCertificationModule_CertificationProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramCertificationModule_CertificationProgramKey ON [dbo].[CertificationProgramCertificationModule] (CertificationProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramCertificationModule]') AND [name] = N'IX_CertificationProgramCertificationModule_CertificationModuleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramCertificationModule_CertificationModuleKey ON [dbo].[CertificationProgramCertificationModule] (CertificationModuleKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistration_UpdatedByUserKey ON [dbo].[CertificationProgramRegistration] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_RegistrationStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistration_RegistrationStatusCode ON [dbo].[CertificationProgramRegistration] (RegistrationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistration_CreatedByUserKey ON [dbo].[CertificationProgramRegistration] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistration_ContactKey ON [dbo].[CertificationProgramRegistration] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') AND [name] = N'IX_CertificationProgramRegistration_CertificationProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistration_CertificationProgramKey ON [dbo].[CertificationProgramRegistration] (CertificationProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistrationCertificationModule]') AND [name] = N'PK_CertificationProgramRegistrationCertificationModule')
BEGIN
  ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule]
  ADD CONSTRAINT PK_CertificationProgramRegistrationCertificationModule PRIMARY KEY CLUSTERED (CertificationProgramRegistrationCertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistrationCertificationModule]') AND [name] = N'IX_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistrationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistrationKey ON [dbo].[CertificationProgramRegistrationCertificationModule] (CertificationProgramRegistrationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistrationCertificationModule]') AND [name] = N'IX_CertificationProgramRegistrationCertificationModule_CertificationModuleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CertificationProgramRegistrationCertificationModule_CertificationModuleKey ON [dbo].[CertificationProgramRegistrationCertificationModule] (CertificationModuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'PK_ChangeLog')
BEGIN
  ALTER TABLE [dbo].[ChangeLog]
  ADD CONSTRAINT PK_ChangeLog PRIMARY KEY NONCLUSTERED (ChangeLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'IX_ChangeLog_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ChangeLog_OrganizationKey ON [dbo].[ChangeLog] (OrganizationKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') AND [name] = N'IX_ChangeLog_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ChangeLog_CreatedByUserKey ON [dbo].[ChangeLog] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistry]') AND [name] = N'IX_ComponentRegistry_InterfaceName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ComponentRegistry_InterfaceName ON [dbo].[ComponentRegistry] (InterfaceName)
  INCLUDE (IsBusinessItem, Name, ComponentKey, TypeName, IsTyped, AssemblyName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistryCategory]') AND [name] = N'PK_ComponentRegistryCategory')
BEGIN
  ALTER TABLE [dbo].[ComponentRegistryCategory]
  ADD CONSTRAINT PK_ComponentRegistryCategory PRIMARY KEY CLUSTERED (ComponentKey, ComponentCategoryKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactBiography]') AND [name] = N'IX_ContactBiography_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactBiography_UpdatedByUserKey ON [dbo].[ContactBiography] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormula]') AND [name] = N'IX_ContactDuplicateCheckFormula_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactDuplicateCheckFormula_UpdatedByUserKey ON [dbo].[ContactDuplicateCheckFormula] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormula]') AND [name] = N'IX_ContactDuplicateCheckFormula_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactDuplicateCheckFormula_SystemEntityKey ON [dbo].[ContactDuplicateCheckFormula] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormula]') AND [name] = N'IX_ContactDuplicateCheckFormula_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactDuplicateCheckFormula_CreatedByUserKey ON [dbo].[ContactDuplicateCheckFormula] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactEducation]') AND [name] = N'IX_ContactEducation_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactEducation_UpdatedByUserKey ON [dbo].[ContactEducation] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactEducation]') AND [name] = N'IX_ContactEducation_EducationLevelCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactEducation_EducationLevelCode ON [dbo].[ContactEducation] (EducationLevelCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactFundraising]') AND [name] = N'IX_ContactFundraising_SolicitorGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactFundraising_SolicitorGroupKey ON [dbo].[ContactFundraising] (SolicitorGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactFundraising]') AND [name] = N'IX_ContactFundraising_SoftCreditGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactFundraising_SoftCreditGroupKey ON [dbo].[ContactFundraising] (SoftCreditGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactFundraising]') AND [name] = N'IX_ContactFundraising_ReceiptPreferenceCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactFundraising_ReceiptPreferenceCode ON [dbo].[ContactFundraising] (ReceiptPreferenceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') AND [name] = N'PK_ContactLog')
BEGIN
  ALTER TABLE [dbo].[ContactLog]
  ADD CONSTRAINT PK_ContactLog PRIMARY KEY CLUSTERED (ContactLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') AND [name] = N'IX_ContactLog_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactLog_OrganizationKey ON [dbo].[ContactLog] (OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') AND [name] = N'IX_ContactLog_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactLog_CreatedByUserKey ON [dbo].[ContactLog] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_UpdatedByUserKey ON [dbo].[ContactMain] (UpdatedByUserKey)
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
  INCLUDE (FullName, AccessKey)
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
  CREATE NONCLUSTERED INDEX IX_ContactMain_IsInstitute ON [dbo].[ContactMain] (IsInstitute)
  INCLUDE (ID, SyncContactID, ContactKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_CreatedByUserKey ON [dbo].[ContactMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_ContactTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_ContactTypeKey ON [dbo].[ContactMain] (ContactTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_ContactStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_ContactStatusCode ON [dbo].[ContactMain] (ContactStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_ContactKey ON [dbo].[ContactMain] (ContactKey)
  INCLUDE (ID, IsInstitute, ContactStatusCode, SyncContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') AND [name] = N'IX_ContactMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMain_AccessKey ON [dbo].[ContactMain] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactPicture]') AND [name] = N'IX_ContactPicture_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactPicture_UpdatedByUserKey ON [dbo].[ContactPicture] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactPicture]') AND [name] = N'IX_ContactPicture_PicturePurposeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactPicture_PicturePurposeKey ON [dbo].[ContactPicture] (PicturePurposeKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactSocialNetwork]') AND [name] = N'PK_ContactSocialNetwork')
BEGIN
  ALTER TABLE [dbo].[ContactSocialNetwork]
  ADD CONSTRAINT PK_ContactSocialNetwork PRIMARY KEY CLUSTERED (ContactSocialNetworkKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContactTypeRef]') AND [name] = N'IX_ContactTypeRef_GroupTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactTypeRef_GroupTypeKey ON [dbo].[ContactTypeRef] (GroupTypeKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_WorkflowStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_WorkflowStatusCode ON [dbo].[Content] (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_PreviousContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_PreviousContentID ON [dbo].[Content] (PreviousContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_OwnerContactID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_OwnerContactID ON [dbo].[Content] (OwnerContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_OriginalContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_OriginalContentID ON [dbo].[Content] (OriginalContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_NavMenuID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_NavMenuID ON [dbo].[Content] (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_ContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_ContentID ON [dbo].[Content] (ContentID)
  INCLUDE (OriginalContentID, PublishDateTime)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content]') AND [name] = N'IX_Content_ComponentCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_ComponentCode ON [dbo].[Content] (ComponentCode)
END
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Change_Request]') AND [name] = N'IX_Content_Change_Request_RequestStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_Change_Request_RequestStatusCode ON [dbo].[Content_Change_Request] (RequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Change_Request]') AND [name] = N'IX_Content_Change_Request_ContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_Change_Request_ContentID ON [dbo].[Content_Change_Request] (ContentID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') AND [name] = N'IX_Content_File_FileTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_File_FileTypeCode ON [dbo].[Content_File] (FileTypeCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Workflow_Log]') AND [name] = N'IX_Content_Workflow_Log_WorkflowStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_Workflow_Log_WorkflowStatusCode ON [dbo].[Content_Workflow_Log] (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Content_Workflow_Log]') AND [name] = N'IX_Content_Workflow_Log_ContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Content_Workflow_Log_ContentID ON [dbo].[Content_Workflow_Log] (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'PK_ContentChangeRequest')
BEGIN
  ALTER TABLE [dbo].[ContentChangeRequest]
  ADD CONSTRAINT PK_ContentChangeRequest PRIMARY KEY CLUSTERED (ContentChangeRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'IX_ContentChangeRequest_ReassignedToUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentChangeRequest_ReassignedToUserKey ON [dbo].[ContentChangeRequest] (ReassignedToUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'IX_ContentChangeRequest_ContentDocumentVersionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentChangeRequest_ContentDocumentVersionKey ON [dbo].[ContentChangeRequest] (ContentDocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'IX_ContentChangeRequest_AssignedToUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentChangeRequest_AssignedToUserKey ON [dbo].[ContentChangeRequest] (AssignedToUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') AND [name] = N'IX_ContentChangeRequest_AssignedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentChangeRequest_AssignedByUserKey ON [dbo].[ContentChangeRequest] (AssignedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentFilter]') AND [name] = N'PK_ContentFilter')
BEGIN
  ALTER TABLE [dbo].[ContentFilter]
  ADD CONSTRAINT PK_ContentFilter PRIMARY KEY CLUSTERED (DocumentVersionKey, PropertyName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentWorkflowParameters]') AND [name] = N'IX_ContentWorkflowParameters_OwnerGroupMemberKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentWorkflowParameters_OwnerGroupMemberKey ON [dbo].[ContentWorkflowParameters] (OwnerGroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ContentWorkflowParameters]') AND [name] = N'IX_ContentWorkflowParameters_ContentAuthorityGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContentWorkflowParameters_ContentAuthorityGroupKey ON [dbo].[ContentWorkflowParameters] (ContentAuthorityGroupKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CostTier]') AND [name] = N'IX_CostTier_CostMethodCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CostTier_CostMethodCode ON [dbo].[CostTier] (CostMethodCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'IX_CountryRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CountryRef_UpdatedByUserKey ON [dbo].[CountryRef] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') AND [name] = N'IX_CountryRef_ChapterGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CountryRef_ChapterGroupKey ON [dbo].[CountryRef] (ChapterGroupKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'PK_CustomerExperience')
BEGIN
  ALTER TABLE [dbo].[CustomerExperience]
  ADD CONSTRAINT PK_CustomerExperience PRIMARY KEY CLUSTERED (CustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'IX_CustomerExperience_CustomerExperienceStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperience_CustomerExperienceStatusCode ON [dbo].[CustomerExperience] (CustomerExperienceStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'IX_CustomerExperience_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperience_CreatedByUserKey ON [dbo].[CustomerExperience] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') AND [name] = N'IX_CustomerExperience_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperience_ContactKey ON [dbo].[CustomerExperience] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'PK_CustomerExperienceStatusChange_CustomerExperienceStatusChangeKey')
BEGIN
  ALTER TABLE [dbo].[CustomerExperienceStatusChange]
  ADD CONSTRAINT PK_CustomerExperienceStatusChange_CustomerExperienceStatusChangeKey PRIMARY KEY CLUSTERED (CustomerExperienceStatusChangeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperienceStatusChange_UpdatedByUserKey ON [dbo].[CustomerExperienceStatusChange] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_StatusChangedContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperienceStatusChange_StatusChangedContactKey ON [dbo].[CustomerExperienceStatusChange] (StatusChangedContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_CustomerExperienceStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperienceStatusChange_CustomerExperienceStatusCode ON [dbo].[CustomerExperienceStatusChange] (CustomerExperienceStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_CustomerExperienceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperienceStatusChange_CustomerExperienceKey ON [dbo].[CustomerExperienceStatusChange] (CustomerExperienceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') AND [name] = N'IX_CustomerExperienceStatusChange_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_CustomerExperienceStatusChange_CreatedByUserKey ON [dbo].[CustomerExperienceStatusChange] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataTypeRef]') AND [name] = N'IX_DataTypeRef_DefaultHIControlTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataTypeRef_DefaultHIControlTypeCode ON [dbo].[DataTypeRef] (DefaultHIControlTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') AND [name] = N'PK_DataVaultAttempt')
BEGIN
  ALTER TABLE [dbo].[DataVaultAttempt]
  ADD CONSTRAINT PK_DataVaultAttempt PRIMARY KEY CLUSTERED (DataVaultAttemptKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') AND [name] = N'IX_DataVaultAttempt_Status')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultAttempt_Status ON [dbo].[DataVaultAttempt] (Status)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') AND [name] = N'IX_DataVaultAttempt_DataVaultLogKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultAttempt_DataVaultLogKey ON [dbo].[DataVaultAttempt] (DataVaultLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') AND [name] = N'IX_DataVaultAttempt_DataVaultLogDetailKey_Attempt')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_DataVaultAttempt_DataVaultLogDetailKey_Attempt ON [dbo].[DataVaultAttempt] (DataVaultLogDetailKey, Attempt)
  INCLUDE (Status, DataVaultLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') AND [name] = N'IX_DataVaultAttempt_DataVaultLogDetailKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultAttempt_DataVaultLogDetailKey ON [dbo].[DataVaultAttempt] (DataVaultLogDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttemptStatusRef]') AND [name] = N'PK_DataVaultAttemptStatusRef')
BEGIN
  ALTER TABLE [dbo].[DataVaultAttemptStatusRef]
  ADD CONSTRAINT PK_DataVaultAttemptStatusRef PRIMARY KEY CLUSTERED (DataVaultAttemptStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLog]') AND [name] = N'PK_DataVaultLog')
BEGIN
  ALTER TABLE [dbo].[DataVaultLog]
  ADD CONSTRAINT PK_DataVaultLog PRIMARY KEY CLUSTERED (DataVaultLogKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLog]') AND [name] = N'IX_DataVaultLog_Status')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultLog_Status ON [dbo].[DataVaultLog] (Status)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLog]') AND [name] = N'IX_DataVaultLog_BatchKey_BatchPart')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_DataVaultLog_BatchKey_BatchPart ON [dbo].[DataVaultLog] (BatchKey, BatchPart)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLogDetail]') AND [name] = N'PK_DataVaultLogDetail')
BEGIN
  ALTER TABLE [dbo].[DataVaultLogDetail]
  ADD CONSTRAINT PK_DataVaultLogDetail PRIMARY KEY CLUSTERED (DataVaultLogDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLogDetail]') AND [name] = N'IX_DataVaultLogDetail_PaymentToken')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultLogDetail_PaymentToken ON [dbo].[DataVaultLogDetail] (PaymentToken)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLogDetail]') AND [name] = N'IX_DataVaultLogDetail_InvoiceNumber_PaymentToken_Balance')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_DataVaultLogDetail_InvoiceNumber_PaymentToken_Balance ON [dbo].[DataVaultLogDetail] (InvoiceNumber, PaymentToken, Balance)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLogDetail]') AND [name] = N'IX_DataVaultLogDetail_InvoiceNumber')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DataVaultLogDetail_InvoiceNumber ON [dbo].[DataVaultLogDetail] (InvoiceNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultStatusRef]') AND [name] = N'PK_DataVaultStatusRef')
BEGIN
  ALTER TABLE [dbo].[DataVaultStatusRef]
  ADD CONSTRAINT PK_DataVaultStatusRef PRIMARY KEY CLUSTERED (DataVaultStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredConversionWork]') AND [name] = N'PK_DeferredConversionWork')
BEGIN
  ALTER TABLE [dbo].[DeferredConversionWork]
  ADD CONSTRAINT PK_DeferredConversionWork PRIMARY KEY CLUSTERED (DeferredConversionWorkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredConversionWork]') AND [name] = N'IX_DeferredConversionWork_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferredConversionWork_OrganizationKey ON [dbo].[DeferredConversionWork] (OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredIncomeWork]') AND [name] = N'PK_DeferredIncomeWork')
BEGIN
  ALTER TABLE [dbo].[DeferredIncomeWork]
  ADD CONSTRAINT PK_DeferredIncomeWork PRIMARY KEY CLUSTERED (DeferredIncomeWorkKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DeferredIncomeWork]') AND [name] = N'IX_DeferredIncomeWork_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DeferredIncomeWork_OrganizationKey ON [dbo].[DeferredIncomeWork] (OrganizationKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'PK_DocumentMain')
BEGIN
  ALTER TABLE [dbo].[DocumentMain]
  ADD CONSTRAINT PK_DocumentMain PRIMARY KEY CLUSTERED (DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_UpdatedByUserKey ON [dbo].[DocumentMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_StatusUpdatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_StatusUpdatedOn ON [dbo].[DocumentMain] (StatusUpdatedOn)
  INCLUDE (DocumentKey, DocumentVersionKey, DocumentName, DocumentStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_StatusUpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_StatusUpdatedByUserKey ON [dbo].[DocumentMain] (StatusUpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_StatusKey_VersionKey_Key_Name_Typecode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_StatusKey_VersionKey_Key_Name_Typecode ON [dbo].[DocumentMain] (DocumentStatusCode, DocumentVersionKey, DocumentKey, DocumentName, DocumentTypeCode)
  INCLUDE (RelatedDocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_RelatedDocumentVersionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_RelatedDocumentVersionKey ON [dbo].[DocumentMain] (RelatedDocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_LockedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_LockedByUserKey ON [dbo].[DocumentMain] (LockedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentVersionKey_DocumentStatusCode_UpdatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentVersionKey_DocumentStatusCode_UpdatedOn ON [dbo].[DocumentMain] (DocumentVersionKey, DocumentStatusCode, UpdatedOn)
  INCLUDE (AccessKey, DocumentTypeCode, DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentVersionKey_DocumentStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentVersionKey_DocumentStatusCode ON [dbo].[DocumentMain] (DocumentVersionKey, DocumentStatusCode)
  INCLUDE (AccessKey, DocumentTypeCode, DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentVersionKey_DocumentName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentVersionKey_DocumentName ON [dbo].[DocumentMain] (DocumentVersionKey, DocumentName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentVersionKey_DocumentKey_AccessKey_CreatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentVersionKey_DocumentKey_AccessKey_CreatedOn ON [dbo].[DocumentMain] (DocumentVersionKey, DocumentKey, AccessKey, CreatedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentVersionKey_CreatedOn_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentVersionKey_CreatedOn_AccessKey ON [dbo].[DocumentMain] (DocumentVersionKey, CreatedOn, AccessKey)
  INCLUDE (DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentTypeCode_DocumentStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentTypeCode_DocumentStatusCode ON [dbo].[DocumentMain] (DocumentTypeCode, DocumentStatusCode)
  INCLUDE (DocumentVersionKey, UpdatedOn, AccessKey, DocumentKey, DocumentName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentStatusCode ON [dbo].[DocumentMain] (DocumentStatusCode)
  INCLUDE (DocumentVersionKey, DocumentName, DocumentKey, UpdatedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DocumentName_DocumentVersionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DocumentName_DocumentVersionKey ON [dbo].[DocumentMain] (DocumentName, DocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_DefaultChildAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_DefaultChildAccessKey ON [dbo].[DocumentMain] (DefaultChildAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') AND [name] = N'IX_DocumentMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentMain_CreatedByUserKey ON [dbo].[DocumentMain] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') AND [name] = N'IX_DocumentStorage_UploadedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentStorage_UploadedByUserKey ON [dbo].[DocumentStorage] (UploadedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') AND [name] = N'IX_DocumentStorage_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentStorage_UpdatedByUserKey ON [dbo].[DocumentStorage] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') AND [name] = N'IX_DocumentStorage_FileTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentStorage_FileTypeCode ON [dbo].[DocumentStorage] (FileTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') AND [name] = N'IX_DocumentStorage_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentStorage_CreatedByUserKey ON [dbo].[DocumentStorage] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'PK_DocumentTypeRef')
BEGIN
  ALTER TABLE [dbo].[DocumentTypeRef]
  ADD CONSTRAINT PK_DocumentTypeRef PRIMARY KEY CLUSTERED (DocumentTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'IX_DocumentTypeRef_RecycleWorkflowDocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentTypeRef_RecycleWorkflowDocumentKey ON [dbo].[DocumentTypeRef] (RecycleWorkflowDocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') AND [name] = N'IX_DocumentTypeRef_PublishWorkflowDocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_DocumentTypeRef_PublishWorkflowDocumentKey ON [dbo].[DocumentTypeRef] (PublishWorkflowDocumentKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportSourceSystem')
BEGIN
  CREATE NONCLUSTERED INDEX iDonationReportSourceSystem ON [dbo].[DonationReport] (SourceSystem)
  INCLUDE (OriginalTransaction, InvoiceRefNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportOriginalTransac')
BEGIN
  CREATE CLUSTERED INDEX iDonationReportOriginalTransac ON [dbo].[DonationReport] (OriginalTransaction)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') AND [name] = N'iDonationReportInvoiceRefNum')
BEGIN
  CREATE NONCLUSTERED INDEX iDonationReportInvoiceRefNum ON [dbo].[DonationReport] (InvoiceRefNum)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Error]') AND [name] = N'IX_Error_ErrorDate_UserId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Error_ErrorDate_UserId ON [dbo].[Error] (ErrorDate, UserID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'PK_EventGuest')
BEGIN
  ALTER TABLE [dbo].[EventGuest]
  ADD CONSTRAINT PK_EventGuest PRIMARY KEY CLUSTERED (EventGuestID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'IX_EventGuest_RegistrantID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventGuest_RegistrantID ON [dbo].[EventGuest] (RegistrantID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'IX_EventGuest_GuestBadge_LastName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventGuest_GuestBadge_LastName ON [dbo].[EventGuest] (GuestBadge, LastName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'IX_EventGuest_EventCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventGuest_EventCode ON [dbo].[EventGuest] (EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') AND [name] = N'IX_EventGuest_CartEventFunctionID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventGuest_CartEventFunctionID ON [dbo].[EventGuest] (CartEventFunctionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrant]') AND [name] = N'PK_EventRegistrant')
BEGIN
  ALTER TABLE [dbo].[EventRegistrant]
  ADD CONSTRAINT PK_EventRegistrant PRIMARY KEY CLUSTERED (RegistrantID, EventCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrant]') AND [name] = N'IX_EventRegistrant_UserID_RegistrantClass_LastName_Email')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventRegistrant_UserID_RegistrantClass_LastName_Email ON [dbo].[EventRegistrant] (UserID, RegistrantClass, LastName, Email)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrationAnswer]') AND [name] = N'PK_EventRegistrationAnswer')
BEGIN
  ALTER TABLE [dbo].[EventRegistrationAnswer]
  ADD CONSTRAINT PK_EventRegistrationAnswer PRIMARY KEY CLUSTERED (EventCode, RegistrantID, QuestionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRelatedFunction]') AND [name] = N'PK_EventRelatedFunction')
BEGIN
  ALTER TABLE [dbo].[EventRelatedFunction]
  ADD CONSTRAINT PK_EventRelatedFunction PRIMARY KEY CLUSTERED (EventRelatedFunctionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRelatedFunction]') AND [name] = N'IX_EventRelatedFunction_EventRegistrationOptionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventRelatedFunction_EventRegistrationOptionKey ON [dbo].[EventRelatedFunction] (EventRegistrationOptionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventRelatedFunction]') AND [name] = N'IX_EventRelatedFunction_EventFunctionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventRelatedFunction_EventFunctionKey ON [dbo].[EventRelatedFunction] (EventFunctionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') AND [name] = N'PK_EventSetupFunctionGroup')
BEGIN
  ALTER TABLE [dbo].[EventSetupFunctionGroup]
  ADD CONSTRAINT PK_EventSetupFunctionGroup PRIMARY KEY CLUSTERED (EventCode, FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') AND [name] = N'IX_EventSetupFunctionGroup_GroupName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventSetupFunctionGroup_GroupName ON [dbo].[EventSetupFunctionGroup] (GroupName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestion]') AND [name] = N'IX_EventSetupQuestion_FunctionCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventSetupQuestion_FunctionCode ON [dbo].[EventSetupQuestion] (FunctionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestion]') AND [name] = N'IX_EventSetupQuestion_EventCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_EventSetupQuestion_EventCode ON [dbo].[EventSetupQuestion] (EventCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') AND [name] = N'IX_ExperienceDefinition_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ExperienceDefinition_UpdatedByUserKey ON [dbo].[ExperienceDefinition] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') AND [name] = N'IX_ExperienceDefinition_ProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ExperienceDefinition_ProgramKey ON [dbo].[ExperienceDefinition] (ProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') AND [name] = N'IX_ExperienceDefinition_ExperienceDefinitionStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ExperienceDefinition_ExperienceDefinitionStatusCode ON [dbo].[ExperienceDefinition] (ExperienceDefinitionStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') AND [name] = N'IX_ExperienceDefinition_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ExperienceDefinition_CreatedByUserKey ON [dbo].[ExperienceDefinition] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinitionStatusRef]') AND [name] = N'PK_ExperienceDefinitionStatusRef_ExperienceDefinitionStatusCode')
BEGIN
  ALTER TABLE [dbo].[ExperienceDefinitionStatusRef]
  ADD CONSTRAINT PK_ExperienceDefinitionStatusRef_ExperienceDefinitionStatusCode PRIMARY KEY CLUSTERED (ExperienceDefinitionStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceUnit]') AND [name] = N'PK_ExperienceUnit')
BEGIN
  ALTER TABLE [dbo].[ExperienceUnit]
  ADD CONSTRAINT PK_ExperienceUnit PRIMARY KEY CLUSTERED (ExperienceUnitKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceUnit]') AND [name] = N'IX_ExperienceUnit_ExperienceUnitName')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_ExperienceUnit_ExperienceUnitName ON [dbo].[ExperienceUnit] (ExperienceUnitName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ExportType]') AND [name] = N'IX_ExportType_ProcessEngineTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ExportType_ProcessEngineTypeKey ON [dbo].[ExportType] (ProcessEngineTypeKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesign]') AND [name] = N'IX_FieldDesign_TableName_FieldName_MemberTypes')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FieldDesign_TableName_FieldName_MemberTypes ON [dbo].[FieldDesign] (TableName, FieldName, MemberTypes)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesignSectionLookup]') AND [name] = N'IX_FieldDesignSectionLookup_TableName_FieldName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FieldDesignSectionLookup_TableName_FieldName ON [dbo].[FieldDesignSectionLookup] (TableName, FieldName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesignSectionLookup]') AND [name] = N'IX_FieldDesignSectionLookup_FieldSectionId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FieldDesignSectionLookup_FieldSectionId ON [dbo].[FieldDesignSectionLookup] (FieldSectionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldSection]') AND [name] = N'PK_FieldSection')
BEGIN
  ALTER TABLE [dbo].[FieldSection]
  ADD CONSTRAINT PK_FieldSection PRIMARY KEY CLUSTERED (FieldSectionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FieldSection]') AND [name] = N'IX_FieldSection_SectionName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FieldSection_SectionName ON [dbo].[FieldSection] (SectionName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinition]') AND [name] = N'PK_FormDefinition')
BEGIN
  ALTER TABLE [dbo].[FormDefinition]
  ADD CONSTRAINT PK_FormDefinition PRIMARY KEY CLUSTERED (FormDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionField]') AND [name] = N'PK_FormDefinitionField')
BEGIN
  ALTER TABLE [dbo].[FormDefinitionField]
  ADD CONSTRAINT PK_FormDefinitionField PRIMARY KEY CLUSTERED (FormDefinitionFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionField]') AND [name] = N'IX_FormDefinitionField_FormDefinitionSectionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormDefinitionField_FormDefinitionSectionKey ON [dbo].[FormDefinitionField] (FormDefinitionSectionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionSection]') AND [name] = N'PK_FormDefinitionSection')
BEGIN
  ALTER TABLE [dbo].[FormDefinitionSection]
  ADD CONSTRAINT PK_FormDefinitionSection PRIMARY KEY CLUSTERED (FormDefinitionSectionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionSection]') AND [name] = N'IX_FormDefinitionSection_FormDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormDefinitionSection_FormDefinitionKey ON [dbo].[FormDefinitionSection] (FormDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponse]') AND [name] = N'PK_FormResponse')
BEGIN
  ALTER TABLE [dbo].[FormResponse]
  ADD CONSTRAINT PK_FormResponse PRIMARY KEY CLUSTERED (FormResponseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponse]') AND [name] = N'IX_FormResponse_FormDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponse_FormDefinitionKey ON [dbo].[FormResponse] (FormDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'PK_FormResponseField')
BEGIN
  ALTER TABLE [dbo].[FormResponseField]
  ADD CONSTRAINT PK_FormResponseField PRIMARY KEY CLUSTERED (FormResponseFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FormResponseKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FormResponseKey ON [dbo].[FormResponseField] (FormResponseKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FormDefinitionFieldKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FormDefinitionFieldKey ON [dbo].[FormResponseField] (FormDefinitionFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FieldStringValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FieldStringValue ON [dbo].[FormResponseField] (FieldStringValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FieldIntegerValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FieldIntegerValue ON [dbo].[FormResponseField] (FieldIntegerValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FieldDecimalValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FieldDecimalValue ON [dbo].[FormResponseField] (FieldDecimalValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FieldDateTimeValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FieldDateTimeValue ON [dbo].[FormResponseField] (FieldDateTimeValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') AND [name] = N'IX_FormResponseField_FieldBooleanValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FormResponseField_FieldBooleanValue ON [dbo].[FormResponseField] (FieldBooleanValue)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') AND [name] = N'IX_Fund_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Fund_UpdatedByUserKey ON [dbo].[Fund] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') AND [name] = N'IX_Fund_FundFamilyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Fund_FundFamilyKey ON [dbo].[Fund] (FundFamilyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') AND [name] = N'IX_Fund_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Fund_CreatedByUserKey ON [dbo].[Fund] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') AND [name] = N'IX_Fund_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Fund_AccessKey ON [dbo].[Fund] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundFundType]') AND [name] = N'IX_FundFundType_FundTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FundFundType_FundTypeKey ON [dbo].[FundFundType] (FundTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[FundFundType]') AND [name] = N'IX_FundFundType_FundKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_FundFundType_FundKey ON [dbo].[FundFundType] (FundKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransaction]') AND [name] = N'iGatewayTransactionTransactionId')
BEGIN
  CREATE NONCLUSTERED INDEX iGatewayTransactionTransactionId ON [dbo].[GatewayTransaction] (TransactionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransaction]') AND [name] = N'iGatewayTransactionContactId')
BEGIN
  CREATE NONCLUSTERED INDEX iGatewayTransactionContactId ON [dbo].[GatewayTransaction] (ContactId)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTypeRef]') AND [name] = N'IX_GatewayTypeRef_GatewayComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GatewayTypeRef_GatewayComponentKey ON [dbo].[GatewayTypeRef] (GatewayComponentKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Gen_Tables]') AND [name] = N'iGenTables_TableName_Description')
BEGIN
  CREATE NONCLUSTERED INDEX iGenTables_TableName_Description ON [dbo].[Gen_Tables] (TABLE_NAME, DESCRIPTION, CODE)
  INCLUDE (SUBSTITUTE, UPPER_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Generic]') AND [name] = N'PK_Generic')
BEGIN
  ALTER TABLE [dbo].[Generic]
  ADD CONSTRAINT PK_Generic PRIMARY KEY CLUSTERED (GenericKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Generic]') AND [name] = N'IX_Generic_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Generic_UpdatedByUserKey ON [dbo].[Generic] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Generic]') AND [name] = N'IX_Generic_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Generic_CreatedByUserKey ON [dbo].[Generic] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_TargetComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_TargetComponentKey ON [dbo].[GenericLink] (TargetComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_SourceKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_SourceKey ON [dbo].[GenericLink] (SourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_SourceComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_SourceComponentKey ON [dbo].[GenericLink] (SourceComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') AND [name] = N'IX_GenericLink_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GenericLink_CreatedByUserKey ON [dbo].[GenericLink] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimDetail]') AND [name] = N'PK_GiftAidClaimDetail')
BEGIN
  ALTER TABLE [dbo].[GiftAidClaimDetail]
  ADD CONSTRAINT PK_GiftAidClaimDetail PRIMARY KEY CLUSTERED (GiftAidClaimDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimDetail]') AND [name] = N'IX_GiftAidClaimDetail_GiftAidClaimHeaderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidClaimDetail_GiftAidClaimHeaderKey ON [dbo].[GiftAidClaimDetail] (GiftAidClaimHeaderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'PK_GiftAidClaimHeader')
BEGIN
  ALTER TABLE [dbo].[GiftAidClaimHeader]
  ADD CONSTRAINT PK_GiftAidClaimHeader PRIMARY KEY CLUSTERED (GiftAidClaimHeaderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'IX_GiftAidClaimHeader_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidClaimHeader_UpdatedByUserKey ON [dbo].[GiftAidClaimHeader] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'IX_GiftAidClaimHeader_Reference')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX IX_GiftAidClaimHeader_Reference ON [dbo].[GiftAidClaimHeader] (Reference)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') AND [name] = N'IX_GiftAidClaimHeader_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidClaimHeader_CreatedByUserKey ON [dbo].[GiftAidClaimHeader] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') AND [name] = N'PK_GiftAidDeclaration')
BEGIN
  ALTER TABLE [dbo].[GiftAidDeclaration]
  ADD CONSTRAINT PK_GiftAidDeclaration PRIMARY KEY CLUSTERED (GiftAidDeclarationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') AND [name] = N'IX_GiftAidDeclaration_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidDeclaration_UpdatedByUserKey ON [dbo].[GiftAidDeclaration] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') AND [name] = N'IX_GiftAidDeclaration_ID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidDeclaration_ID ON [dbo].[GiftAidDeclaration] (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') AND [name] = N'IX_GiftAidDeclaration_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GiftAidDeclaration_CreatedByUserKey ON [dbo].[GiftAidDeclaration] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidStatusLog]') AND [name] = N'PK_GiftAidStatusLog')
BEGIN
  ALTER TABLE [dbo].[GiftAidStatusLog]
  ADD CONSTRAINT PK_GiftAidStatusLog PRIMARY KEY CLUSTERED (GiftAidStatusLogID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidSubmissionLog]') AND [name] = N'PK_GiftAidSubmissionLog')
BEGIN
  ALTER TABLE [dbo].[GiftAidSubmissionLog]
  ADD CONSTRAINT PK_GiftAidSubmissionLog PRIMARY KEY CLUSTERED (GALogID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftHistorySummary]') AND [name] = N'PK_DonorId')
BEGIN
  ALTER TABLE [dbo].[GiftHistorySummary]
  ADD CONSTRAINT PK_DonorId PRIMARY KEY CLUSTERED (DonorId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportTransactionNumber')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportTransactionNumber ON [dbo].[GiftReport] (OriginalTransaction, TransactionNumber)
  INCLUDE (InvoiceReferenceNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportTransactionDate ON [dbo].[GiftReport] (TransactionDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportSourceSystemInvoiceNum')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportSourceSystemInvoiceNum ON [dbo].[GiftReport] (SourceSystem, InvoiceReferenceNumber)
  INCLUDE (Amount, ID, FiscalYear, TransactionDate, OriginalTransaction, DateReceived, FiscalMonth)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportSourceSystemGiftType')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportSourceSystemGiftType ON [dbo].[GiftReport] (SourceSystem, GiftType)
  INCLUDE (InvoiceReferenceNumber, Fund, FiscalYear, ID, OriginalTransaction, PaymentType, RequestNumber, MemorialNameText, TransactionDate, IsMatchingGift, ListAs, MatchingTransaction, MemorialID, Amount, SolicitorID, FiscalMonth, AppealCode, DateReceived, CampaignCode, CheckNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportOriginalTransactionId')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportOriginalTransactionId ON [dbo].[GiftReport] (OriginalTransaction)
  INCLUDE (ID, TransactionNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportOriginalTransaction')
BEGIN
  CREATE CLUSTERED INDEX iGiftReportOriginalTransaction ON [dbo].[GiftReport] (OriginalTransaction)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportInvoiceReferenceNumber')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportInvoiceReferenceNumber ON [dbo].[GiftReport] (InvoiceReferenceNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportIDTransactionDate')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportIDTransactionDate ON [dbo].[GiftReport] (ID, TransactionDate)
  INCLUDE (DateReceived)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportIDOriginalTrans')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportIDOriginalTrans ON [dbo].[GiftReport] (ID, OriginalTransaction)
  INCLUDE (Amount, TransactionDate, AppealCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportId')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportId ON [dbo].[GiftReport] (ID)
  INCLUDE (OriginalTransaction, Amount, TransactionDate, TransactionNumber, AppealCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportGetType')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportGetType ON [dbo].[GiftReport] (GiftType)
  INCLUDE (InvoiceReferenceNumber, Fund, Amount)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') AND [name] = N'iGiftReportFund')
BEGIN
  CREATE NONCLUSTERED INDEX iGiftReportFund ON [dbo].[GiftReport] (Fund)
  INCLUDE (Amount, TransactionDate)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'IX_GLTransactionMain_JournalEntryTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionMain_JournalEntryTypeCode ON [dbo].[GLTransactionMain] (JournalEntryTypeCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') AND [name] = N'IX_GLTransactionMain_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GLTransactionMain_ContactKey ON [dbo].[GLTransactionMain] (ContactKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupInstanceRole]') AND [name] = N'IX_GroupInstanceRole_DefaultMemberStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupInstanceRole_DefaultMemberStatusCode ON [dbo].[GroupInstanceRole] (DefaultMemberStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_UpdatedByUserKey ON [dbo].[GroupMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_SystemEntityKey ON [dbo].[GroupMain] (SystemEntityKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_GroupTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_GroupTypeKey ON [dbo].[GroupMain] (GroupTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_GroupStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_GroupStatusCode ON [dbo].[GroupMain] (GroupStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_CreatedByUserKey ON [dbo].[GroupMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') AND [name] = N'IX_GroupMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMain_AccessKey ON [dbo].[GroupMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'PK_GroupMember')
BEGIN
  ALTER TABLE [dbo].[GroupMember]
  ADD CONSTRAINT PK_GroupMember PRIMARY KEY CLUSTERED (GroupMemberKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_UpdatedByUserKey ON [dbo].[GroupMember] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_MemberContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_MemberContactKey ON [dbo].[GroupMember] (MemberContactKey)
  INCLUDE (JoinDate, DropDate, IsActive, GroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_GroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_GroupKey ON [dbo].[GroupMember] (GroupKey)
  INCLUDE (GroupMemberKey, MemberContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') AND [name] = N'IX_GroupMember_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMember_CreatedByUserKey ON [dbo].[GroupMember] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'PK_GroupMemberDetail')
BEGIN
  ALTER TABLE [dbo].[GroupMemberDetail]
  ADD CONSTRAINT PK_GroupMemberDetail PRIMARY KEY CLUSTERED (GroupMemberDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_UpdatedByUserKey ON [dbo].[GroupMemberDetail] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_GroupMemberStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_GroupMemberStatusCode ON [dbo].[GroupMemberDetail] (GroupMemberStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') AND [name] = N'IX_GroupMemberDetail_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberDetail_CreatedByUserKey ON [dbo].[GroupMemberDetail] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberOptions]') AND [name] = N'IX_GroupMemberOptions_AlternativeBillToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupMemberOptions_AlternativeBillToContactKey ON [dbo].[GroupMemberOptions] (AlternativeBillToContactKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'IX_GroupTypeRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupTypeRef_UpdatedByUserKey ON [dbo].[GroupTypeRef] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'IX_GroupTypeRef_MemberQueryFolderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupTypeRef_MemberQueryFolderKey ON [dbo].[GroupTypeRef] (MemberQueryFolderKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'IX_GroupTypeRef_DefaultGroupStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupTypeRef_DefaultGroupStatusCode ON [dbo].[GroupTypeRef] (DefaultGroupStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') AND [name] = N'IX_GroupTypeRef_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupTypeRef_CreatedByUserKey ON [dbo].[GroupTypeRef] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRole]') AND [name] = N'IX_GroupTypeRole_DefaultMemberStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_GroupTypeRole_DefaultMemberStatusCode ON [dbo].[GroupTypeRole] (DefaultMemberStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRole]') AND [name] = N'AK_GroupTypeRole')
BEGIN
  ALTER TABLE [dbo].[GroupTypeRole]
  ADD CONSTRAINT AK_GroupTypeRole UNIQUE NONCLUSTERED (GroupTypeKey, GroupRoleKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_UniformKey_RootHierarchyKey_HierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_UniformKey_RootHierarchyKey_HierarchyKey ON [dbo].[Hierarchy] (UniformKey, RootHierarchyKey, HierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_RootHierarchyKey_SortOrder_Depth')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_RootHierarchyKey_SortOrder_Depth ON [dbo].[Hierarchy] (RootHierarchyKey, SortOrder, Depth)
  INCLUDE (HierarchyCode, ParentHierarchyKey, HierarchyKey, IsChildAMemberOfParent, UniformType, UniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_RootHierarchyKey_ParentHierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_RootHierarchyKey_ParentHierarchyKey ON [dbo].[Hierarchy] (RootHierarchyKey, ParentHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_ParentHierarchyKey_SortOrder_Depth_UniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_ParentHierarchyKey_SortOrder_Depth_UniformKey ON [dbo].[Hierarchy] (ParentHierarchyKey, SortOrder, Depth, UniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_ParentHierarchyKey_HierarchyKey_UniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_ParentHierarchyKey_HierarchyKey_UniformKey ON [dbo].[Hierarchy] (ParentHierarchyKey, HierarchyKey, UniformKey)
  INCLUDE (SortOrder, RootHierarchyKey, IsChildAMemberOfParent, MarkedForDeleteOn, HierarchyCode, UniformType, Depth)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') AND [name] = N'IX_Hierarchy_HierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Hierarchy_HierarchyKey ON [dbo].[Hierarchy] (HierarchyKey)
  INCLUDE (RootHierarchyKey, UniformKey, ParentHierarchyKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') AND [name] = N'IX_HierarchyRoot_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_HierarchyRoot_UpdatedByUserKey ON [dbo].[HierarchyRoot] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') AND [name] = N'IX_HierarchyRoot_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_HierarchyRoot_OrganizationKey ON [dbo].[HierarchyRoot] (OrganizationKey)
  INCLUDE (AccessKey, HierarchyRootName, RootHierarchyKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') AND [name] = N'IX_HierarchyRoot_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_HierarchyRoot_CreatedByUserKey ON [dbo].[HierarchyRoot] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') AND [name] = N'IX_HierarchyRoot_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_HierarchyRoot_AccessKey ON [dbo].[HierarchyRoot] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[History]') AND [name] = N'PK_History')
BEGIN
  ALTER TABLE [dbo].[History]
  ADD CONSTRAINT PK_History PRIMARY KEY CLUSTERED (HistoryID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_SuffixCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_SuffixCode ON [dbo].[Individual] (SuffixCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_PrimaryInstituteContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_PrimaryInstituteContactKey ON [dbo].[Individual] (PrimaryInstituteContactKey)
  INCLUDE (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') AND [name] = N'IX_Individual_PrefixCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Individual_PrefixCode ON [dbo].[Individual] (PrefixCode)
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
  INCLUDE (BT_ID, REFERENCE_NUM, ORIGINATING_TRANS_NUM, INVOICE_NUM, DUE_DATE, INSTALL_BILL_DATE, INVOICE_DATE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoiceCUSTOMER_REFERENCE')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoiceCUSTOMER_REFERENCE ON [dbo].[Invoice] (CUSTOMER_REFERENCE)
  INCLUDE (DUE_DATE, INVOICE_NUM, REFERENCE_NUM)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') AND [name] = N'iInvoice_BTID')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoice_BTID ON [dbo].[Invoice] (BT_ID)
  INCLUDE (REFERENCE_NUM, ORIGINATING_TRANS_NUM, INVOICE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice_Lines]') AND [name] = N'iInvoice_LinesST_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoice_LinesST_ID ON [dbo].[Invoice_Lines] (REFERENCE_NUM, ST_ID)
  INCLUDE (LINE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Invoice_Lines]') AND [name] = N'iInvoice_LinesREFERENCE_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iInvoice_LinesREFERENCE_NUM ON [dbo].[Invoice_Lines] (REFERENCE_NUM, LINE_NUM)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMapMaster]') AND [name] = N'IX_LicenseMapMaster_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMapMaster_UpdatedByUserKey ON [dbo].[LicenseMapMaster] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMapMaster]') AND [name] = N'IX_LicenseMapMaster_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMapMaster_CreatedByUserKey ON [dbo].[LicenseMapMaster] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'PK_LicenseMaster')
BEGIN
  ALTER TABLE [dbo].[LicenseMaster]
  ADD CONSTRAINT PK_LicenseMaster PRIMARY KEY CLUSTERED (LicenseMasterKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'IX_LicenseMaster_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMaster_UpdatedByUserKey ON [dbo].[LicenseMaster] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') AND [name] = N'IX_LicenseMaster_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseMaster_CreatedByUserKey ON [dbo].[LicenseMaster] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') AND [name] = N'PK_LicenseOrganization')
BEGIN
  ALTER TABLE [dbo].[LicenseOrganization]
  ADD CONSTRAINT PK_LicenseOrganization PRIMARY KEY CLUSTERED (LicenseOrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') AND [name] = N'IX_LicenseOrganization_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseOrganization_UpdatedByUserKey ON [dbo].[LicenseOrganization] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') AND [name] = N'IX_LicenseOrganization_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseOrganization_CreatedByUserKey ON [dbo].[LicenseOrganization] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') AND [name] = N'IX_LicenseOrganization_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseOrganization_ContactKey ON [dbo].[LicenseOrganization] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseTypeRef]') AND [name] = N'PK_LicenseTypeRef')
BEGIN
  ALTER TABLE [dbo].[LicenseTypeRef]
  ADD CONSTRAINT PK_LicenseTypeRef PRIMARY KEY CLUSTERED (LicenseType)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseTypeRef]') AND [name] = N'IX_LicenseTypeRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseTypeRef_UpdatedByUserKey ON [dbo].[LicenseTypeRef] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseTypeRef]') AND [name] = N'IX_LicenseTypeRef_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseTypeRef_CreatedByUserKey ON [dbo].[LicenseTypeRef] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LicenseUser]') AND [name] = N'IX_LicenseUser_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LicenseUser_CreatedByUserKey ON [dbo].[LicenseUser] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ListItem]') AND [name] = N'IX_ListItem_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ListItem_CreatedByUserKey ON [dbo].[ListItem] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationApplication]') AND [name] = N'PK_Application')
BEGIN
  ALTER TABLE [dbo].[LocalizationApplication]
  ADD CONSTRAINT PK_Application PRIMARY KEY CLUSTERED (LocalizationApplicationId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationControlProperty]') AND [name] = N'PK_ControlProperty')
BEGIN
  ALTER TABLE [dbo].[LocalizationControlProperty]
  ADD CONSTRAINT PK_ControlProperty PRIMARY KEY CLUSTERED (LocalizationControlPropertyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationControlProperty]') AND [name] = N'IX_LocalizationControlProperty_LocalizationControlTypeId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationControlProperty_LocalizationControlTypeId ON [dbo].[LocalizationControlProperty] (LocalizationControlTypeId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationControlType]') AND [name] = N'PK_ControlType')
BEGIN
  ALTER TABLE [dbo].[LocalizationControlType]
  ADD CONSTRAINT PK_ControlType PRIMARY KEY CLUSTERED (LocalizationControlTypeId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationCulture]') AND [name] = N'PK_Culture')
BEGIN
  ALTER TABLE [dbo].[LocalizationCulture]
  ADD CONSTRAINT PK_Culture PRIMARY KEY CLUSTERED (LocalizationCultureId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationLookup]') AND [name] = N'PK_LocalizationLookup')
BEGIN
  ALTER TABLE [dbo].[LocalizationLookup]
  ADD CONSTRAINT PK_LocalizationLookup PRIMARY KEY CLUSTERED (LocalizationLookup, LocalizationCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhrase]') AND [name] = N'PK_Phrase')
BEGIN
  ALTER TABLE [dbo].[LocalizationPhrase]
  ADD CONSTRAINT PK_Phrase PRIMARY KEY CLUSTERED (LocalizationPhraseId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhrase]') AND [name] = N'IX_LocalizationPhrase_Phrase')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationPhrase_Phrase ON [dbo].[LocalizationPhrase] (Phrase)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhrase]') AND [name] = N'IX_LocalizationPhrase_LocalizationApplicationId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationPhrase_LocalizationApplicationId ON [dbo].[LocalizationPhrase] (LocalizationApplicationId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhraseTranslated]') AND [name] = N'PK_TranslatedPhrase')
BEGIN
  ALTER TABLE [dbo].[LocalizationPhraseTranslated]
  ADD CONSTRAINT PK_TranslatedPhrase PRIMARY KEY CLUSTERED (LocalizationPhraseTranslatedId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhraseTranslated]') AND [name] = N'IX_LocalizationPhraseTranslated_LocalizationPhraseId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationPhraseTranslated_LocalizationPhraseId ON [dbo].[LocalizationPhraseTranslated] (LocalizationPhraseId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhraseTranslated]') AND [name] = N'IX_LocalizationPhraseTranslated_LocalizationCultureId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationPhraseTranslated_LocalizationCultureId ON [dbo].[LocalizationPhraseTranslated] (LocalizationCultureId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationStatus]') AND [name] = N'PK_LocalizationStatus')
BEGIN
  ALTER TABLE [dbo].[LocalizationStatus]
  ADD CONSTRAINT PK_LocalizationStatus PRIMARY KEY CLUSTERED (StatusID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersion]') AND [name] = N'PK_Version')
BEGIN
  ALTER TABLE [dbo].[LocalizationVersion]
  ADD CONSTRAINT PK_Version PRIMARY KEY CLUSTERED (LocalizationVersionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersion]') AND [name] = N'IX_LocalizationVersion_CultureId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationVersion_CultureId ON [dbo].[LocalizationVersion] (CultureId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersionPhrase]') AND [name] = N'PK_VersionPhrase')
BEGIN
  ALTER TABLE [dbo].[LocalizationVersionPhrase]
  ADD CONSTRAINT PK_VersionPhrase PRIMARY KEY CLUSTERED (LocalizationVersionPhraseId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersionPhrase]') AND [name] = N'IX_LocalizationVersionPhrase_LocalizationVersionId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LocalizationVersionPhrase_LocalizationVersionId ON [dbo].[LocalizationVersionPhrase] (LocalizationVersionId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersionPhraseTransfer]') AND [name] = N'PK_LocalizationVersionPhraseTransfer')
BEGIN
  ALTER TABLE [dbo].[LocalizationVersionPhraseTransfer]
  ADD CONSTRAINT PK_LocalizationVersionPhraseTransfer PRIMARY KEY CLUSTERED (LocalizationVersionPhraseId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'PK_Location_LocationKey')
BEGIN
  ALTER TABLE [dbo].[Location]
  ADD CONSTRAINT PK_Location_LocationKey PRIMARY KEY CLUSTERED (LocationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'IX_Location_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Location_UpdatedByUserKey ON [dbo].[Location] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'IX_Location_LocationStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Location_LocationStatusCode ON [dbo].[Location] (LocationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'IX_Location_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Location_CreatedByUserKey ON [dbo].[Location] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Location]') AND [name] = N'IX_Location_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Location_ContactKey ON [dbo].[Location] (ContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LocationStatusRef]') AND [name] = N'PK_LocationStatusRef_LocationStatusCode')
BEGIN
  ALTER TABLE [dbo].[LocationStatusRef]
  ADD CONSTRAINT PK_LocationStatusRef_LocationStatusCode PRIMARY KEY CLUSTERED (LocationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LoginToken]') AND [name] = N'PK_LoginToken')
BEGIN
  ALTER TABLE [dbo].[LoginToken]
  ADD CONSTRAINT PK_LoginToken PRIMARY KEY CLUSTERED (Token)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[LoginToken]') AND [name] = N'IX_LoginToken_CreatedOn')
BEGIN
  CREATE NONCLUSTERED INDEX IX_LoginToken_CreatedOn ON [dbo].[LoginToken] (CreatedOn)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MailCodeRef]') AND [name] = N'IX_MailCodeRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MailCodeRef_UpdatedByUserKey ON [dbo].[MailCodeRef] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_UpdatedByUserKey ON [dbo].[MatchingGiftPlan] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_SystemEntityKey ON [dbo].[MatchingGiftPlan] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_OwnerContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_OwnerContactKey ON [dbo].[MatchingGiftPlan] (OwnerContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_MatchingGiftPlanTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_MatchingGiftPlanTypeKey ON [dbo].[MatchingGiftPlan] (MatchingGiftPlanTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_MatchingGiftContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_MatchingGiftContactKey ON [dbo].[MatchingGiftPlan] (MatchingGiftContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_CreatedByUserKey ON [dbo].[MatchingGiftPlan] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_CorporateGiftContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_CorporateGiftContactKey ON [dbo].[MatchingGiftPlan] (CorporateGiftContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') AND [name] = N'IX_MatchingGiftPlan_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlan_AccessKey ON [dbo].[MatchingGiftPlan] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanFundType]') AND [name] = N'PK_MatchingGiftPlanFundType')
BEGIN
  ALTER TABLE [dbo].[MatchingGiftPlanFundType]
  ADD CONSTRAINT PK_MatchingGiftPlanFundType PRIMARY KEY CLUSTERED (MatchingGiftPlanFundTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanFundType]') AND [name] = N'IX_MatchingGiftPlanFundType_MatchingGiftPlanKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlanFundType_MatchingGiftPlanKey ON [dbo].[MatchingGiftPlanFundType] (MatchingGiftPlanKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanFundType]') AND [name] = N'IX_MatchingGiftPlanFundType_FundTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlanFundType_FundTypeKey ON [dbo].[MatchingGiftPlanFundType] (FundTypeKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanRule]') AND [name] = N'IX_MatchingGiftPlanRule_MatchingGiftPlanKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MatchingGiftPlanRule_MatchingGiftPlanKey ON [dbo].[MatchingGiftPlanRule] (MatchingGiftPlanKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTribute]') AND [name] = N'IX_MemorialTribute_NotificationGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MemorialTribute_NotificationGroupKey ON [dbo].[MemorialTribute] (NotificationGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTribute]') AND [name] = N'IX_MemorialTribute_MemorialTributeCodeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MemorialTribute_MemorialTributeCodeKey ON [dbo].[MemorialTribute] (MemorialTributeCodeKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeNotificationMember]') AND [name] = N'IX_MemorialTributeNotificationMember_MemorialTributeNotificationPreferenceCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_MemorialTributeNotificationMember_MemorialTributeNotificationPreferenceCode ON [dbo].[MemorialTributeNotificationMember] (MemorialTributeNotificationPreferenceCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'PK_Name')
BEGIN
  ALTER TABLE [dbo].[Name]
  ADD CONSTRAINT PK_Name PRIMARY KEY CLUSTERED (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameSTATUSCO_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iNameSTATUSCO_ID ON [dbo].[Name] (STATUS, CO_ID)
  INCLUDE (ID)
  WHERE ([CO_ID]<>'')
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameSTATUSCO')
BEGIN
  CREATE NONCLUSTERED INDEX iNameSTATUSCO ON [dbo].[Name] (STATUS, COMPANY_RECORD)
  INCLUDE (ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameSTATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iNameSTATUS ON [dbo].[Name] (STATUS, MEMBER_RECORD, COMPANY_RECORD)
  INCLUDE (MEMBER_TYPE, ID, JOIN_DATE, FULL_NAME, COUNTRY, CO_ID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameLAST_UPDATED')
BEGIN
  CREATE NONCLUSTERED INDEX iNameLAST_UPDATED ON [dbo].[Name] (LAST_UPDATED)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameLAST_FIRST')
BEGIN
  CREATE NONCLUSTERED INDEX iNameLAST_FIRST ON [dbo].[Name] (LAST_FIRST)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameID_COMPANY')
BEGIN
  CREATE NONCLUSTERED INDEX iNameID_COMPANY ON [dbo].[Name] (ID)
  INCLUDE (LAST_FIRST, MEMBER_TYPE, MT_CHANGE_DATE, COMPANY_SORT, FULL_NAME, COMPANY, COMPANY_RECORD, PREVIOUS_MT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameEMAIL')
BEGIN
  CREATE NONCLUSTERED INDEX iNameEMAIL ON [dbo].[Name] (EMAIL)
  WHERE ([EMAIL]<>'')
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
  INCLUDE (ID, TITLE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iNameBT_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iNameBT_ID ON [dbo].[Name] (BT_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iName_LAST_NAME_FIRST_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iName_LAST_NAME_FIRST_NAME ON [dbo].[Name] (LAST_NAME, FIRST_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iName_FULL_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FULL_NAME ON [dbo].[Name] (FULL_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iName_FIRST_NAME_LAST_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iName_FIRST_NAME_LAST_NAME ON [dbo].[Name] (FIRST_NAME, LAST_NAME)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iName_CompanyRecord')
BEGIN
  CREATE NONCLUSTERED INDEX iName_CompanyRecord ON [dbo].[Name] (COMPANY_RECORD)
  INCLUDE (ID, FULL_NAME, COMPANY)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name]') AND [name] = N'iName_COMPANY')
BEGIN
  CREATE NONCLUSTERED INDEX iName_COMPANY ON [dbo].[Name] (COMPANY)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') AND [name] = N'iName_AddressEmail')
BEGIN
  CREATE NONCLUSTERED INDEX iName_AddressEmail ON [dbo].[Name_Address] (EMAIL)
  WHERE ([EMAIL]<>'')
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Indexes]') AND [name] = N'PK_Name_Indexes')
BEGIN
  ALTER TABLE [dbo].[Name_Indexes]
  ADD CONSTRAINT PK_Name_Indexes PRIMARY KEY CLUSTERED (ID, INDEX_NAME, INDEX_VALUE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Name_Indexes]') AND [name] = N'iName_IndexesINDEX_NAME')
BEGIN
  CREATE NONCLUSTERED INDEX iName_IndexesINDEX_NAME ON [dbo].[Name_Indexes] (INDEX_NAME, INDEX_VALUE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_WorkflowStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_WorkflowStatusCode ON [dbo].[Nav_Menu] (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_WebsiteKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_WebsiteKey ON [dbo].[Nav_Menu] (WebsiteKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_OwnerContactID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_OwnerContactID ON [dbo].[Nav_Menu] (OwnerContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_LastUpdatedByContactID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_LastUpdatedByContactID ON [dbo].[Nav_Menu] (LastUpdatedByContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_ContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_ContentID ON [dbo].[Nav_Menu] (ContentID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_ContentAuthorityGroupID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_ContentAuthorityGroupID ON [dbo].[Nav_Menu] (ContentAuthorityGroupID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_ComponentScriptCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_ComponentScriptCode ON [dbo].[Nav_Menu] (ComponentScriptCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') AND [name] = N'IX_Nav_Menu_ComponentCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_ComponentCode ON [dbo].[Nav_Menu] (ComponentCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Workflow_Log]') AND [name] = N'IX_Nav_Menu_Workflow_Log_WorkflowStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_Workflow_Log_WorkflowStatusCode ON [dbo].[Nav_Menu_Workflow_Log] (WorkflowStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Workflow_Log]') AND [name] = N'IX_Nav_Menu_Workflow_Log_NavMenuID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_Workflow_Log_NavMenuID ON [dbo].[Nav_Menu_Workflow_Log] (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Workflow_Log]') AND [name] = N'IX_Nav_Menu_Workflow_Log_ContactID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Nav_Menu_Workflow_Log_ContactID ON [dbo].[Nav_Menu_Workflow_Log] (ContactID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationExport]') AND [name] = N'PK_NavigationExport')
BEGIN
  ALTER TABLE [dbo].[NavigationExport]
  ADD CONSTRAINT PK_NavigationExport PRIMARY KEY CLUSTERED (NavigationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationExport]') AND [name] = N'IX_NavigationExport_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_NavigationExport_UpdatedByUserKey ON [dbo].[NavigationExport] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationExport]') AND [name] = N'IX_NavigationExport_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_NavigationExport_CreatedByUserKey ON [dbo].[NavigationExport] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationMain]') AND [name] = N'IX_NavigationMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_NavigationMain_UpdatedByUserKey ON [dbo].[NavigationMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationMain]') AND [name] = N'IX_NavigationMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_NavigationMain_CreatedByUserKey ON [dbo].[NavigationMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[NavigationMain]') AND [name] = N'IX_NavigationMain_AccessAreaKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_NavigationMain_AccessAreaKey ON [dbo].[NavigationMain] (AccessAreaKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_UpdatedByUserKey ON [dbo].[Note] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_NotePurposeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_NotePurposeKey ON [dbo].[Note] (NotePurposeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_NoteForUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_NoteForUniformKey ON [dbo].[Note] (NoteForUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_CreatedByUserKey ON [dbo].[Note] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Note]') AND [name] = N'IX_Note_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Note_AccessKey ON [dbo].[Note] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OfferedCustomerExperience]') AND [name] = N'IX_OfferedCustomerExperience_OfferingKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OfferedCustomerExperience_OfferingKey ON [dbo].[OfferedCustomerExperience] (OfferingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OfferedCustomerExperience]') AND [name] = N'IX_OfferedCustomerExperience_OfferedCustomerExperienceGradeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OfferedCustomerExperience_OfferedCustomerExperienceGradeKey ON [dbo].[OfferedCustomerExperience] (OfferedCustomerExperienceGradeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'PK_Offering_OfferingKey')
BEGIN
  ALTER TABLE [dbo].[Offering]
  ADD CONSTRAINT PK_Offering_OfferingKey PRIMARY KEY CLUSTERED (OfferingKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'IX_Offering_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Offering_UpdatedByUserKey ON [dbo].[Offering] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'IX_Offering_OfferingStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Offering_OfferingStatusCode ON [dbo].[Offering] (OfferingStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'IX_Offering_LinkedProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Offering_LinkedProgramKey ON [dbo].[Offering] (LinkedProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'IX_Offering_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Offering_CreatedByUserKey ON [dbo].[Offering] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') AND [name] = N'IX_Offering_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Offering_ContactKey ON [dbo].[Offering] (ContactKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'IX_OpportunityCompetitor_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityCompetitor_UpdatedByUserKey ON [dbo].[OpportunityCompetitor] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'IX_OpportunityCompetitor_OpportunityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityCompetitor_OpportunityKey ON [dbo].[OpportunityCompetitor] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') AND [name] = N'IX_OpportunityCompetitor_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityCompetitor_CreatedByUserKey ON [dbo].[OpportunityCompetitor] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') AND [name] = N'IX_OpportunityHistory_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityHistory_UpdatedByUserKey ON [dbo].[OpportunityHistory] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') AND [name] = N'IX_OpportunityHistory_OpportunityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityHistory_OpportunityKey ON [dbo].[OpportunityHistory] (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') AND [name] = N'IX_OpportunityHistory_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityHistory_CreatedByUserKey ON [dbo].[OpportunityHistory] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'PK_OpportunityMain')
BEGIN
  ALTER TABLE [dbo].[OpportunityMain]
  ADD CONSTRAINT PK_OpportunityMain PRIMARY KEY CLUSTERED (OpportunityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_UpdatedByUserKey ON [dbo].[OpportunityMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_ProspectKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_ProspectKey ON [dbo].[OpportunityMain] (ProspectKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_OpportunityStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_OpportunityStatusCode ON [dbo].[OpportunityMain] (OpportunityStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') AND [name] = N'IX_OpportunityMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityMain_CreatedByUserKey ON [dbo].[OpportunityMain] (CreatedByUserKey)
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
  INCLUDE (DecisionDate)
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
  INCLUDE (DecisionDate)
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
  INCLUDE (DecisionDate)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'IX_OpportunityType_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityType_UpdatedByUserKey ON [dbo].[OpportunityType] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'IX_OpportunityType_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityType_CreatedByUserKey ON [dbo].[OpportunityType] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') AND [name] = N'IX_OpportunityType_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OpportunityType_AccessKey ON [dbo].[OpportunityType] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderCheckout]') AND [name] = N'IX_OrderCheckout_UserID_Email')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderCheckout_UserID_Email ON [dbo].[OrderCheckout] (UserID, Email)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderProduct]') AND [name] = N'IX_OrderProduct_ProductCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderProduct_ProductCode ON [dbo].[OrderProduct] (ProductCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') AND [name] = N'AK_OrderPromotion_OrderPromotionCode')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX AK_OrderPromotion_OrderPromotionCode ON [dbo].[OrderPromotion] (OrderPromotionCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotionDiscount]') AND [name] = N'PK_OrderPromotionDiscount')
BEGIN
  ALTER TABLE [dbo].[OrderPromotionDiscount]
  ADD CONSTRAINT PK_OrderPromotionDiscount PRIMARY KEY CLUSTERED (OrderPromotionDiscountKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotionDiscount]') AND [name] = N'IX_OrderPromotionDiscount_OrderPromotionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderPromotionDiscount_OrderPromotionKey ON [dbo].[OrderPromotionDiscount] (OrderPromotionKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') AND [name] = N'iOrdersSTAGE_STATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iOrdersSTAGE_STATUS ON [dbo].[Orders] (STAGE, STATUS)
  INCLUDE (ST_ID, ORDER_NUMBER, ORDER_DATE)
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
  INCLUDE (BT_ID, BALANCE, TOTAL_CHARGES, SOURCE_SYSTEM, ORDER_DATE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttribute]') AND [name] = N'IX_OrderSuperProductAttribute_Code')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderSuperProductAttribute_Code ON [dbo].[OrderSuperProductAttribute] (Code)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProduct]') AND [name] = N'IX_OrderSuperProductChildProduct_ProductCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrderSuperProductChildProduct_ProductCode ON [dbo].[OrderSuperProductChildProduct] (ProductCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProductAttribute]') AND [name] = N'PK_OrderSuperProductChildProductAttribute')
BEGIN
  ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute]
  ADD CONSTRAINT PK_OrderSuperProductChildProductAttribute PRIMARY KEY CLUSTERED (OrderSuperProductChildProductID, OrderSuperProductAttributeValueID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') AND [name] = N'IX_OrganizationMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrganizationMain_UpdatedByUserKey ON [dbo].[OrganizationMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') AND [name] = N'IX_OrganizationMain_DefaultDepartmentGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrganizationMain_DefaultDepartmentGroupKey ON [dbo].[OrganizationMain] (DefaultDepartmentGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') AND [name] = N'IX_OrganizationMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_OrganizationMain_CreatedByUserKey ON [dbo].[OrganizationMain] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'IX_PackageItem_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageItem_UpdatedByUserKey ON [dbo].[PackageItem] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'IX_PackageItem_SupplementKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageItem_SupplementKey ON [dbo].[PackageItem] (SupplementKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'IX_PackageItem_PackageKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageItem_PackageKey ON [dbo].[PackageItem] (PackageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') AND [name] = N'IX_PackageItem_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageItem_CreatedByUserKey ON [dbo].[PackageItem] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') AND [name] = N'IX_PackageMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageMain_UpdatedByUserKey ON [dbo].[PackageMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') AND [name] = N'IX_PackageMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageMain_SystemEntityKey ON [dbo].[PackageMain] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') AND [name] = N'IX_PackageMain_PackageStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageMain_PackageStatusCode ON [dbo].[PackageMain] (PackageStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') AND [name] = N'IX_PackageMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageMain_CreatedByUserKey ON [dbo].[PackageMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'PK_PackageQueue')
BEGIN
  ALTER TABLE [dbo].[PackageQueue]
  ADD CONSTRAINT PK_PackageQueue PRIMARY KEY CLUSTERED (PackageQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'IX_PackageQueue_ScheduledTaskKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageQueue_ScheduledTaskKey ON [dbo].[PackageQueue] (ScheduledTaskKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'IX_PackageQueue_QueueReleaseWorkflowKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageQueue_QueueReleaseWorkflowKey ON [dbo].[PackageQueue] (QueueReleaseWorkflowKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'IX_PackageQueue_PackageQueueReleaseTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageQueue_PackageQueueReleaseTypeCode ON [dbo].[PackageQueue] (PackageQueueReleaseTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'IX_PackageQueue_NotificationGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageQueue_NotificationGroupKey ON [dbo].[PackageQueue] (NotificationGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') AND [name] = N'IX_PackageQueue_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PackageQueue_AccessKey ON [dbo].[PackageQueue] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethodSet]') AND [name] = N'PK_PaymentMethodSet')
BEGIN
  ALTER TABLE [dbo].[PaymentMethodSet]
  ADD CONSTRAINT PK_PaymentMethodSet PRIMARY KEY CLUSTERED (PaymentMethodSetId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethodSetDetail]') AND [name] = N'PK_PaymentMethodSetDetail')
BEGIN
  ALTER TABLE [dbo].[PaymentMethodSetDetail]
  ADD CONSTRAINT PK_PaymentMethodSetDetail PRIMARY KEY CLUSTERED (PaymentMethodSetId, PaymentMethodId)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Perspective]') AND [name] = N'IX_Perspective_HomePageHierarchyKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Perspective_HomePageHierarchyKey ON [dbo].[Perspective] (HomePageHierarchyKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PledgeReport]') AND [name] = N'iPledgeReportInvoiceReferenceNumber')
BEGIN
  CREATE NONCLUSTERED INDEX iPledgeReportInvoiceReferenceNumber ON [dbo].[PledgeReport] (InvoiceReferenceNumber)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') AND [name] = N'IX_PostalCodeRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PostalCodeRef_UpdatedByUserKey ON [dbo].[PostalCodeRef] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'IX_PotentialMatchingGift_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PotentialMatchingGift_UpdatedByUserKey ON [dbo].[PotentialMatchingGift] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'IX_PotentialMatchingGift_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PotentialMatchingGift_SystemEntityKey ON [dbo].[PotentialMatchingGift] (SystemEntityKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') AND [name] = N'IX_PotentialMatchingGift_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PotentialMatchingGift_CreatedByUserKey ON [dbo].[PotentialMatchingGift] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iProductPRODUCT_CODE ON [dbo].[Product] (PRODUCT_CODE)
  INCLUDE (PRODUCT_MAJOR, PRODUCT_MINOR, CATEGORY, STATUS, PROD_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Product]') AND [name] = N'iProductPROD_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iProductPROD_TYPE ON [dbo].[Product] (PROD_TYPE)
  INCLUDE (PRODUCT_CODE, TITLE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'PK_Program_ProgramKey')
BEGIN
  ALTER TABLE [dbo].[Program]
  ADD CONSTRAINT PK_Program_ProgramKey PRIMARY KEY CLUSTERED (ProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'IX_Program_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Program_UpdatedByUserKey ON [dbo].[Program] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'IX_Program_ProgramStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Program_ProgramStatusCode ON [dbo].[Program] (ProgramStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'IX_Program_ExperienceUnitKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Program_ExperienceUnitKey ON [dbo].[Program] (ExperienceUnitKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Program]') AND [name] = N'IX_Program_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Program_CreatedByUserKey ON [dbo].[Program] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') AND [name] = N'PK_ProgramGroup_ProgramGroupKey')
BEGIN
  ALTER TABLE [dbo].[ProgramGroup]
  ADD CONSTRAINT PK_ProgramGroup_ProgramGroupKey PRIMARY KEY CLUSTERED (ProgramGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') AND [name] = N'IX_ProgramGroup_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProgramGroup_UpdatedByUserKey ON [dbo].[ProgramGroup] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') AND [name] = N'IX_ProgramGroup_ProgramGroupStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProgramGroup_ProgramGroupStatusCode ON [dbo].[ProgramGroup] (ProgramGroupStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') AND [name] = N'IX_ProgramGroup_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ProgramGroup_CreatedByUserKey ON [dbo].[ProgramGroup] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefinition]') AND [name] = N'IX_PropertyDefinition_HIControlTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PropertyDefinition_HIControlTypeCode ON [dbo].[PropertyDefinition] (HIControlTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefinition]') AND [name] = N'IX_PropertyDefinition_ForeignObjectDocumentVersionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PropertyDefinition_ForeignObjectDocumentVersionKey ON [dbo].[PropertyDefinition] (ForeignObjectDocumentVersionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefinition]') AND [name] = N'IX_PropertyDefinition_DataTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PropertyDefinition_DataTypeCode ON [dbo].[PropertyDefinition] (DataTypeCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Message_Log]') AND [name] = N'IX_Publish_Message_Log_PublishServerCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Message_Log_PublishServerCode ON [dbo].[Publish_Message_Log] (PublishServerCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request]') AND [name] = N'IX_Publish_Request_PublishPriorityCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_PublishPriorityCode ON [dbo].[Publish_Request] (PublishPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request]') AND [name] = N'IX_Publish_Request_NavMenuID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_NavMenuID ON [dbo].[Publish_Request] (NavMenuID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'PK_Publish_Request_Detail')
BEGIN
  ALTER TABLE [dbo].[Publish_Request_Detail]
  ADD CONSTRAINT PK_Publish_Request_Detail PRIMARY KEY CLUSTERED (PublishRequestDetailID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'IX_Publish_Request_Detail_PublishServerCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_Detail_PublishServerCode ON [dbo].[Publish_Request_Detail] (PublishServerCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'IX_Publish_Request_Detail_PublishRequestStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_Detail_PublishRequestStatusCode ON [dbo].[Publish_Request_Detail] (PublishRequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'IX_Publish_Request_Detail_PublishRequestID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_Detail_PublishRequestID ON [dbo].[Publish_Request_Detail] (PublishRequestID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') AND [name] = N'IX_Publish_Request_Detail_ContentID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Publish_Request_Detail_ContentID ON [dbo].[Publish_Request_Detail] (ContentID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishMessageLog]') AND [name] = N'IX_PublishMessageLog_PublishServerCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishMessageLog_PublishServerCode ON [dbo].[PublishMessageLog] (PublishServerCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishMessageLog]') AND [name] = N'IX_PublishMessageLog_PublishRequestKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishMessageLog_PublishRequestKey ON [dbo].[PublishMessageLog] (PublishRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishMessageLog]') AND [name] = N'IX_PublishMessageLog_PublishRequestDetailKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishMessageLog_PublishRequestDetailKey ON [dbo].[PublishMessageLog] (PublishRequestDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishPriorityRef]') AND [name] = N'PK_PublishPriorityRef')
BEGIN
  ALTER TABLE [dbo].[PublishPriorityRef]
  ADD CONSTRAINT PK_PublishPriorityRef PRIMARY KEY CLUSTERED (PublishPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishQueue]') AND [name] = N'PK_PublishQueue')
BEGIN
  ALTER TABLE [dbo].[PublishQueue]
  ADD CONSTRAINT PK_PublishQueue PRIMARY KEY CLUSTERED (Id)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') AND [name] = N'PK_PublishRequest')
BEGIN
  ALTER TABLE [dbo].[PublishRequest]
  ADD CONSTRAINT PK_PublishRequest PRIMARY KEY CLUSTERED (PublishRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') AND [name] = N'IX_PublishRequest_UserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequest_UserKey ON [dbo].[PublishRequest] (UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') AND [name] = N'IX_PublishRequest_PublishPriorityCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequest_PublishPriorityCode ON [dbo].[PublishRequest] (PublishPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') AND [name] = N'IX_PublishRequest_DocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequest_DocumentKey ON [dbo].[PublishRequest] (DocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'PK_PublishRequestDetail')
BEGIN
  ALTER TABLE [dbo].[PublishRequestDetail]
  ADD CONSTRAINT PK_PublishRequestDetail PRIMARY KEY CLUSTERED (PublishRequestDetailKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'IX_PublishRequestDetail_PublishServerCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequestDetail_PublishServerCode ON [dbo].[PublishRequestDetail] (PublishServerCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'IX_PublishRequestDetail_PublishRequestStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequestDetail_PublishRequestStatusCode ON [dbo].[PublishRequestDetail] (PublishRequestStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'IX_PublishRequestDetail_PublishRequestKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequestDetail_PublishRequestKey ON [dbo].[PublishRequestDetail] (PublishRequestKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') AND [name] = N'IX_PublishRequestDetail_ContentDocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishRequestDetail_ContentDocumentKey ON [dbo].[PublishRequestDetail] (ContentDocumentKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishServerRef]') AND [name] = N'IX_PublishServerRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishServerRef_UpdatedByUserKey ON [dbo].[PublishServerRef] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[PublishServerRef]') AND [name] = N'IX_PublishServerRef_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_PublishServerRef_CreatedByUserKey ON [dbo].[PublishServerRef] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[QueryResultMain]') AND [name] = N'IX_QueryResultMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_QueryResultMain_CreatedByUserKey ON [dbo].[QueryResultMain] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptLine]') AND [name] = N'IX_ReceiptLine_SourceReceiptLineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptLine_SourceReceiptLineKey ON [dbo].[ReceiptLine] (SourceReceiptLineKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_UpdatedByUserKey ON [dbo].[ReceiptMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_SystemEntityKey ON [dbo].[ReceiptMain] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_ReceiptTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_ReceiptTypeKey ON [dbo].[ReceiptMain] (ReceiptTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_IssuedToContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_IssuedToContactKey ON [dbo].[ReceiptMain] (IssuedToContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_CreatedByUserKey ON [dbo].[ReceiptMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') AND [name] = N'IX_ReceiptMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ReceiptMain_AccessKey ON [dbo].[ReceiptMain] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') AND [name] = N'IX_RecurringDonationCommitment_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RecurringDonationCommitment_UpdatedByUserKey ON [dbo].[RecurringDonationCommitment] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') AND [name] = N'IX_RecurringDonationCommitment_RecurringDonationFrequencyCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RecurringDonationCommitment_RecurringDonationFrequencyCode ON [dbo].[RecurringDonationCommitment] (RecurringDonationFrequencyCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') AND [name] = N'IX_RecurringDonationCommitment_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RecurringDonationCommitment_CreatedByUserKey ON [dbo].[RecurringDonationCommitment] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') AND [name] = N'IX_RecurringDonationCommitment_ContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RecurringDonationCommitment_ContactKey ON [dbo].[RecurringDonationCommitment] (ContactKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Table_Ref]') AND [name] = N'IX_Ref_Table_Ref_ComponentCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Ref_Table_Ref_ComponentCode ON [dbo].[Ref_Table_Ref] (ComponentCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RegistrationStatusChange_UpdatedByUserKey ON [dbo].[RegistrationStatusChange] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_StatusChangedContactKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RegistrationStatusChange_StatusChangedContactKey ON [dbo].[RegistrationStatusChange] (StatusChangedContactKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_RegistrationStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RegistrationStatusChange_RegistrationStatusCode ON [dbo].[RegistrationStatusChange] (RegistrationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RegistrationStatusChange_CreatedByUserKey ON [dbo].[RegistrationStatusChange] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') AND [name] = N'IX_RegistrationStatusChange_CertificationProgramRegistrationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RegistrationStatusChange_CertificationProgramRegistrationKey ON [dbo].[RegistrationStatusChange] (CertificationProgramRegistrationKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition]') AND [name] = N'IX_RFMDefinition_UserDocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RFMDefinition_UserDocumentKey ON [dbo].[RFMDefinition] (UserDocumentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition]') AND [name] = N'IX_RFMDefinition_TransactionDocumentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RFMDefinition_TransactionDocumentKey ON [dbo].[RFMDefinition] (TransactionDocumentKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RoleMain]') AND [name] = N'IX_RoleMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RoleMain_UpdatedByUserKey ON [dbo].[RoleMain] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleCriterion]') AND [name] = N'IX_RuleCriterion_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleCriterion_UpdatedByUserKey ON [dbo].[RuleCriterion] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') AND [name] = N'IX_RuleFilter_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleFilter_UpdatedByUserKey ON [dbo].[RuleFilter] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') AND [name] = N'IX_RuleFilter_RuleCriterionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleFilter_RuleCriterionKey ON [dbo].[RuleFilter] (RuleCriterionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') AND [name] = N'IX_RuleFilter_ComparisonCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleFilter_ComparisonCode ON [dbo].[RuleFilter] (ComparisonCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'PK_RuleMain')
BEGIN
  ALTER TABLE [dbo].[RuleMain]
  ADD CONSTRAINT PK_RuleMain PRIMARY KEY CLUSTERED (RuleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_UpdatedByUserKey ON [dbo].[RuleMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_SystemEntityKey ON [dbo].[RuleMain] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_RuleEvaluatorComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_RuleEvaluatorComponentKey ON [dbo].[RuleMain] (RuleEvaluatorComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_ObjectMapperComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_ObjectMapperComponentKey ON [dbo].[RuleMain] (ObjectMapperComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_CreatedByUserKey ON [dbo].[RuleMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') AND [name] = N'IX_RuleMain_BeginDate_EndDate')
BEGIN
  CREATE NONCLUSTERED INDEX IX_RuleMain_BeginDate_EndDate ON [dbo].[RuleMain] (BeginDate, EndDate)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SalesLocationStatusRef]') AND [name] = N'PK_SalesLocationStatusRef')
BEGIN
  ALTER TABLE [dbo].[SalesLocationStatusRef]
  ADD CONSTRAINT PK_SalesLocationStatusRef PRIMARY KEY CLUSTERED (SalesLocationStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'PK_ScheduledTask')
BEGIN
  ALTER TABLE [dbo].[ScheduledTask]
  ADD CONSTRAINT PK_ScheduledTask PRIMARY KEY CLUSTERED (ScheduledTaskKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'IX_ScheduledTask_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTask_UpdatedByUserKey ON [dbo].[ScheduledTask] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'IX_ScheduledTask_SelectionLock')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTask_SelectionLock ON [dbo].[ScheduledTask] (SelectionLock)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'IX_ScheduledTask_RunAsUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTask_RunAsUserKey ON [dbo].[ScheduledTask] (RunAsUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') AND [name] = N'IX_ScheduledTask_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTask_CreatedByUserKey ON [dbo].[ScheduledTask] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskService]') AND [name] = N'IX_ScheduledTaskService_ServiceStatus')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ScheduledTaskService_ServiceStatus ON [dbo].[ScheduledTaskService] (ServiceStatus)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'IX_SegmentationJob_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentationJob_UpdatedByUserKey ON [dbo].[SegmentationJob] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'IX_SegmentationJob_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentationJob_SystemEntityKey ON [dbo].[SegmentationJob] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'IX_SegmentationJob_LastListCreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentationJob_LastListCreatedByUserKey ON [dbo].[SegmentationJob] (LastListCreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'IX_SegmentationJob_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentationJob_CreatedByUserKey ON [dbo].[SegmentationJob] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') AND [name] = N'IX_SegmentationJob_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentationJob_AccessKey ON [dbo].[SegmentationJob] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentDefinition]') AND [name] = N'IX_SegmentDefinition_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentDefinition_UpdatedByUserKey ON [dbo].[SegmentDefinition] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentDefinition]') AND [name] = N'IX_SegmentDefinition_SegmentationJobKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentDefinition_SegmentationJobKey ON [dbo].[SegmentDefinition] (SegmentationJobKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SegmentDefinition]') AND [name] = N'IX_SegmentDefinition_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SegmentDefinition_CreatedByUserKey ON [dbo].[SegmentDefinition] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SequenceCounter]') AND [name] = N'IX_SequenceCounter_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SequenceCounter_UpdatedByUserKey ON [dbo].[SequenceCounter] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SequenceCounter]') AND [name] = N'IX_SequenceCounter_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SequenceCounter_CreatedByUserKey ON [dbo].[SequenceCounter] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[ShipPriceRef]') AND [name] = N'PK_ShipPriceRef')
BEGIN
  ALTER TABLE [dbo].[ShipPriceRef]
  ADD CONSTRAINT PK_ShipPriceRef PRIMARY KEY CLUSTERED (ShipPriceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SocialNetworkRef]') AND [name] = N'PK_SocialNetworkRef')
BEGIN
  ALTER TABLE [dbo].[SocialNetworkRef]
  ADD CONSTRAINT PK_SocialNetworkRef PRIMARY KEY CLUSTERED (SocialNetworkKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'IX_SolicitationMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationMain_UpdatedByUserKey ON [dbo].[SolicitationMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'IX_SolicitationMain_SolicitationStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationMain_SolicitationStatusCode ON [dbo].[SolicitationMain] (SolicitationStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'IX_SolicitationMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationMain_CreatedByUserKey ON [dbo].[SolicitationMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'IX_SolicitationMain_AppealKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationMain_AppealKey ON [dbo].[SolicitationMain] (AppealKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') AND [name] = N'IX_SolicitationMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationMain_AccessKey ON [dbo].[SolicitationMain] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'PK_SolicitationSource')
BEGIN
  ALTER TABLE [dbo].[SolicitationSource]
  ADD CONSTRAINT PK_SolicitationSource PRIMARY KEY CLUSTERED (SolicitationSourceKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'IX_SolicitationSource_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationSource_UpdatedByUserKey ON [dbo].[SolicitationSource] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'IX_SolicitationSource_SourceCodeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationSource_SourceCodeKey ON [dbo].[SolicitationSource] (SourceCodeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'IX_SolicitationSource_SelectorComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationSource_SelectorComponentKey ON [dbo].[SolicitationSource] (SelectorComponentKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') AND [name] = N'IX_SolicitationSource_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SolicitationSource_CreatedByUserKey ON [dbo].[SolicitationSource] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustment]') AND [name] = N'IX_SortNameAdjustment_SortNameAdjustmentActionCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SortNameAdjustment_SortNameAdjustmentActionCode ON [dbo].[SortNameAdjustment] (SortNameAdjustmentActionCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_UpdatedByUserKey ON [dbo].[SourceCode] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_SourceCodeTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_SourceCodeTypeCode ON [dbo].[SourceCode] (SourceCodeTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_SourceCodeStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_SourceCodeStatusCode ON [dbo].[SourceCode] (SourceCodeStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_SolicitationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_SolicitationKey ON [dbo].[SourceCode] (SolicitationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_PackageKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_PackageKey ON [dbo].[SourceCode] (PackageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_CreatedByUserKey ON [dbo].[SourceCode] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') AND [name] = N'IX_SourceCode_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SourceCode_AccessKey ON [dbo].[SourceCode] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[State_Codes]') AND [name] = N'iStateCodes_Title')
BEGIN
  CREATE NONCLUSTERED INDEX iStateCodes_Title ON [dbo].[State_Codes] (TITLE)
  INCLUDE (STATE_PROVINCE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND [name] = N'PK_StateProvinceRef')
BEGIN
  ALTER TABLE [dbo].[StateProvinceRef]
  ADD CONSTRAINT PK_StateProvinceRef PRIMARY KEY CLUSTERED (CountryCode, StateProvinceCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND [name] = N'IX_StateProvinceRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_StateProvinceRef_UpdatedByUserKey ON [dbo].[StateProvinceRef] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') AND [name] = N'IX_StateProvinceRef_ChapterGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_StateProvinceRef_ChapterGroupKey ON [dbo].[StateProvinceRef] (ChapterGroupKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsSTATUS_INVOICE_REFERENCE_NUM')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsSTATUS_INVOICE_REFERENCE_NUM ON [dbo].[Subscriptions] (STATUS, INVOICE_REFERENCE_NUM)
  INCLUDE (PAYMENT_AMOUNT, PROD_TYPE, ADJUSTMENT_AMOUNT, BALANCE, BILL_AMOUNT, BILL_DATE, PRODUCT_CODE, ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsPRODUCT_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsPRODUCT_CODE ON [dbo].[Subscriptions] (PRODUCT_CODE)
  INCLUDE (BILL_DATE, BALANCE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsINVOICE_REFERENC')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsINVOICE_REFERENC ON [dbo].[Subscriptions] (INVOICE_REFERENCE_NUM, INVOICE_LINE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsID_STATUS')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsID_STATUS ON [dbo].[Subscriptions] (ID, STATUS)
  INCLUDE (INVOICE_REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') AND [name] = N'iSubscriptionsFLAG')
BEGIN
  CREATE NONCLUSTERED INDEX iSubscriptionsFLAG ON [dbo].[Subscriptions] (FLAG)
  WHERE ([FLAG]<>'')
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_UpdatedByUserKey ON [dbo].[SupplementMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_SystemEntityKey ON [dbo].[SupplementMain] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_SupplementTypeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_SupplementTypeKey ON [dbo].[SupplementMain] (SupplementTypeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_SupplementStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_SupplementStatusCode ON [dbo].[SupplementMain] (SupplementStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_NotificationGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_NotificationGroupKey ON [dbo].[SupplementMain] (NotificationGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_CreatedByUserKey ON [dbo].[SupplementMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') AND [name] = N'IX_SupplementMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SupplementMain_AccessKey ON [dbo].[SupplementMain] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[System_Params]') AND [name] = N'PK_System_Params')
BEGIN
  ALTER TABLE [dbo].[System_Params]
  ADD CONSTRAINT PK_System_Params PRIMARY KEY CLUSTERED (ParameterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[System_Variable]') AND [name] = N'PK_System_Variable')
BEGIN
  ALTER TABLE [dbo].[System_Variable]
  ADD CONSTRAINT PK_System_Variable PRIMARY KEY CLUSTERED (ComponentCode, VariableTypeCode, Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[System_Variable]') AND [name] = N'IX_System_Variable_DataTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_System_Variable_DataTypeCode ON [dbo].[System_Variable] (DataTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') AND [name] = N'PK_SystemConfig')
BEGIN
  ALTER TABLE [dbo].[SystemConfig]
  ADD CONSTRAINT PK_SystemConfig PRIMARY KEY CLUSTERED (SystemConfigKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') AND [name] = N'IX_SystemConfig_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfig_UpdatedByUserKey ON [dbo].[SystemConfig] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') AND [name] = N'IX_SystemConfig_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfig_SystemEntityKey ON [dbo].[SystemConfig] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') AND [name] = N'IX_SystemConfig_ParameterName_OrganizationKey_SystemConfigKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfig_ParameterName_OrganizationKey_SystemConfigKey ON [dbo].[SystemConfig] (ParameterName, OrganizationKey, SystemConfigKey)
  INCLUDE (ParameterValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') AND [name] = N'IX_SystemConfig_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfig_CreatedByUserKey ON [dbo].[SystemConfig] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigPageParameterRef]') AND [name] = N'PK_SystemConfigPageParameterRef')
BEGIN
  ALTER TABLE [dbo].[SystemConfigPageParameterRef]
  ADD CONSTRAINT PK_SystemConfigPageParameterRef PRIMARY KEY CLUSTERED (SystemConfigPageKey, ParameterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigPageRef]') AND [name] = N'PK_SystemConfigPageRef')
BEGIN
  ALTER TABLE [dbo].[SystemConfigPageRef]
  ADD CONSTRAINT PK_SystemConfigPageRef PRIMARY KEY CLUSTERED (SystemConfigPageKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigPageRef]') AND [name] = N'AK_SystemConfigPageRef')
BEGIN
  ALTER TABLE [dbo].[SystemConfigPageRef]
  ADD CONSTRAINT AK_SystemConfigPageRef UNIQUE NONCLUSTERED (SystemConfigPageName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND [name] = N'PK_SystemConfigParameterRef')
BEGIN
  ALTER TABLE [dbo].[SystemConfigParameterRef]
  ADD CONSTRAINT PK_SystemConfigParameterRef PRIMARY KEY CLUSTERED (ParameterName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND [name] = N'IX_SystemConfigParameterRef_SystemKeyword')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfigParameterRef_SystemKeyword ON [dbo].[SystemConfigParameterRef] (SystemKeyword)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND [name] = N'IX_SystemConfigParameterRef_PropertyDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfigParameterRef_PropertyDefinitionKey ON [dbo].[SystemConfigParameterRef] (PropertyDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') AND [name] = N'IX_SystemConfigParameterRef_ParameterName')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemConfigParameterRef_ParameterName ON [dbo].[SystemConfigParameterRef] (ParameterName)
  INCLUDE (SystemKeyword, PropertyDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigXml]') AND [name] = N'PK_SystemConfigXml')
BEGIN
  ALTER TABLE [dbo].[SystemConfigXml]
  ADD CONSTRAINT PK_SystemConfigXml PRIMARY KEY CLUSTERED (SystemConfigXmlCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'PK_SystemEntity')
BEGIN
  ALTER TABLE [dbo].[SystemEntity]
  ADD CONSTRAINT PK_SystemEntity PRIMARY KEY CLUSTERED (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_UpdatedByUserKey ON [dbo].[SystemEntity] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_SystemKeyword')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_SystemKeyword ON [dbo].[SystemEntity] (SystemKeyword)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_OrganizationKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_OrganizationKey ON [dbo].[SystemEntity] (OrganizationKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_CreatedByUserKey ON [dbo].[SystemEntity] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_ApplicationAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_ApplicationAccessKey ON [dbo].[SystemEntity] (ApplicationAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') AND [name] = N'IX_SystemEntity_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_SystemEntity_AccessKey ON [dbo].[SystemEntity] (AccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemRef]') AND [name] = N'PK_SystemRef')
BEGIN
  ALTER TABLE [dbo].[SystemRef]
  ADD CONSTRAINT PK_SystemRef PRIMARY KEY CLUSTERED (SystemKeyword)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[SystemRef]') AND [name] = N'AK_SystemRef_SystemKey')
BEGIN
  CREATE UNIQUE NONCLUSTERED INDEX AK_SystemRef_SystemKey ON [dbo].[SystemRef] (SystemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'PK_Tag')
BEGIN
  ALTER TABLE [dbo].[Tag]
  ADD CONSTRAINT PK_Tag PRIMARY KEY CLUSTERED (TagKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'IX_Tag_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tag_UpdatedByUserKey ON [dbo].[Tag] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'IX_Tag_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tag_CreatedByUserKey ON [dbo].[Tag] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'IX_Tag_AssignAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tag_AssignAccessKey ON [dbo].[Tag] (AssignAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') AND [name] = N'IX_Tag_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tag_AccessKey ON [dbo].[Tag] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Format_Ref]') AND [name] = N'IX_Tagged_Page_Format_Ref_TaggedPageFormatTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Format_Ref_TaggedPageFormatTypeCode ON [dbo].[Tagged_Page_Format_Ref] (TaggedPageFormatTypeCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Layout]') AND [name] = N'IX_Tagged_Page_Layout_TaggedPageTitleCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Layout_TaggedPageTitleCode ON [dbo].[Tagged_Page_Layout] (TaggedPageTitleCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Layout]') AND [name] = N'IX_Tagged_Page_Layout_TaggedPageFormatID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Layout_TaggedPageFormatID ON [dbo].[Tagged_Page_Layout] (TaggedPageFormatID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Portlet]') AND [name] = N'PK_Tagged_Page_Portlet')
BEGIN
  ALTER TABLE [dbo].[Tagged_Page_Portlet]
  ADD CONSTRAINT PK_Tagged_Page_Portlet PRIMARY KEY CLUSTERED (TaggedPagePortletID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Portlet]') AND [name] = N'IX_Tagged_Page_Portlet_TaggedPortletID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Portlet_TaggedPortletID ON [dbo].[Tagged_Page_Portlet] (TaggedPortletID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Portlet]') AND [name] = N'IX_Tagged_Page_Portlet_TaggedPageSectionID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Portlet_TaggedPageSectionID ON [dbo].[Tagged_Page_Portlet] (TaggedPageSectionID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Section]') AND [name] = N'IX_Tagged_Page_Section_TaggedSectionID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Section_TaggedSectionID ON [dbo].[Tagged_Page_Section] (TaggedSectionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Section]') AND [name] = N'IX_Tagged_Page_Section_TaggedPageLayoutID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Page_Section_TaggedPageLayoutID ON [dbo].[Tagged_Page_Section] (TaggedPageLayoutID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Portlet]') AND [name] = N'IX_Tagged_Portlet_TaggedTemplateID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Portlet_TaggedTemplateID ON [dbo].[Tagged_Portlet] (TaggedTemplateID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section]') AND [name] = N'PK_Tagged_Section')
BEGIN
  ALTER TABLE [dbo].[Tagged_Section]
  ADD CONSTRAINT PK_Tagged_Section PRIMARY KEY CLUSTERED (TaggedSectionID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section]') AND [name] = N'IX_Tagged_Section_TaggedPageFormatID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Section_TaggedPageFormatID ON [dbo].[Tagged_Section] (TaggedPageFormatID)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Template]') AND [name] = N'IX_Tagged_Template_ComponentCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Tagged_Template_ComponentCode ON [dbo].[Tagged_Template] (ComponentCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'IX_TaskItem_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskItem_UpdatedByUserKey ON [dbo].[TaskItem] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'IX_TaskItem_TaskItemStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskItem_TaskItemStatusCode ON [dbo].[TaskItem] (TaskItemStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') AND [name] = N'IX_TaskItem_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskItem_CreatedByUserKey ON [dbo].[TaskItem] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_UpdatedByUserKey ON [dbo].[TaskMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_TaskTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_TaskTypeCode ON [dbo].[TaskMain] (TaskTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_TaskStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_TaskStatusCode ON [dbo].[TaskMain] (TaskStatusCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_TaskPriorityCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_TaskPriorityCode ON [dbo].[TaskMain] (TaskPriorityCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_CreatedByUserKey ON [dbo].[TaskMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_CompletedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_CompletedByUserKey ON [dbo].[TaskMain] (CompletedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_AssigneeUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_AssigneeUserKey ON [dbo].[TaskMain] (AssigneeUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_AssigneeKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_AssigneeKey ON [dbo].[TaskMain] (AssigneeKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_AssigneeGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_AssigneeGroupKey ON [dbo].[TaskMain] (AssigneeGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') AND [name] = N'IX_TaskMain_AccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaskMain_AccessKey ON [dbo].[TaskMain] (AccessKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityCategory]') AND [name] = N'PK_TaxAuthorityCategory')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityCategory]
  ADD CONSTRAINT PK_TaxAuthorityCategory PRIMARY KEY CLUSTERED (TaxAuthorityCategoryKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityCategory]') AND [name] = N'IX_TaxAuthorityCategory_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxAuthorityCategory_UpdatedByUserKey ON [dbo].[TaxAuthorityCategory] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityCategory]') AND [name] = N'IX_TaxAuthorityCategory_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxAuthorityCategory_CreatedByUserKey ON [dbo].[TaxAuthorityCategory] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityFinancialEntity]') AND [name] = N'PK_TaxAuthorityFinancialEntity')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityFinancialEntity]
  ADD CONSTRAINT PK_TaxAuthorityFinancialEntity PRIMARY KEY CLUSTERED (TaxAuthorityFinancialEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityFinancialEntity]') AND [name] = N'IX_TaxAuthorityFinancialEntity_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxAuthorityFinancialEntity_UpdatedByUserKey ON [dbo].[TaxAuthorityFinancialEntity] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityFinancialEntity]') AND [name] = N'IX_TaxAuthorityFinancialEntity_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxAuthorityFinancialEntity_CreatedByUserKey ON [dbo].[TaxAuthorityFinancialEntity] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityLevelRef]') AND [name] = N'PK_TaxAuthorityLevelRef')
BEGIN
  ALTER TABLE [dbo].[TaxAuthorityLevelRef]
  ADD CONSTRAINT PK_TaxAuthorityLevelRef PRIMARY KEY CLUSTERED (TaxAuthorityLevelKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxScheduleAuthority]') AND [name] = N'PK_TaxScheduleAuthority')
BEGIN
  ALTER TABLE [dbo].[TaxScheduleAuthority]
  ADD CONSTRAINT PK_TaxScheduleAuthority PRIMARY KEY CLUSTERED (TaxScheduleAuthorityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxScheduleAuthority]') AND [name] = N'IX_TaxScheduleAuthority_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxScheduleAuthority_UpdatedByUserKey ON [dbo].[TaxScheduleAuthority] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TaxScheduleAuthority]') AND [name] = N'IX_TaxScheduleAuthority_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TaxScheduleAuthority_CreatedByUserKey ON [dbo].[TaxScheduleAuthority] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[TimeZoneRef]') AND [name] = N'IX_TimeZoneRef_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_TimeZoneRef_UpdatedByUserKey ON [dbo].[TimeZoneRef] (UpdatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransTRANSACTION_TYPE_JOURNAL_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransTRANSACTION_TYPE_JOURNAL_TYPE ON [dbo].[Trans] (TRANSACTION_TYPE, JOURNAL_TYPE)
  INCLUDE (TRANS_NUMBER, TRANSACTION_DATE, SOLICITOR_ID, SOURCE_CODE, SOURCE_SYSTEM, ST_ID, PRODUCT_CODE, OWNER_ORG_CODE, IS_FR_ITEM, INVOICE_REFERENCE_NUM, INVOICE_CREDITS, INSTALL_BILL_DATE, INVOICE_CHARGES, GL_ACCT_ORG_CODE, CAMPAIGN_CODE, AMOUNT)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransTRANSACTION_TYPE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransTRANSACTION_TYPE ON [dbo].[Trans] (TRANSACTION_TYPE, IS_FR_ITEM)
  INCLUDE (INVOICE_REFERENCE_NUM, PRODUCT_CODE, TRANS_NUMBER, ST_ID, CHECK_NUMBER, FISCAL_PERIOD, INVOICE_LINE_NUM, AMOUNT)
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
  INCLUDE (TRANSACTION_DATE, OWNER_ORG_CODE, JOURNAL_TYPE, IS_FR_ITEM, INVOICE_REFERENCE_NUM, PRODUCT_CODE, INVOICE_LINE_NUM, FISCAL_PERIOD, AMOUNT, EFFECTIVE_DATE, BT_ID, TRANSACTION_TYPE, ACTIVITY_SEQN)
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
  INCLUDE (JOURNAL_TYPE, INVOICE_LINE_NUM, INVOICE_REFERENCE_NUM, INVOICE_CHARGES, INVOICE_CREDITS, TRANSACTION_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransOWNER_ORG_CODE')
BEGIN
  CREATE NONCLUSTERED INDEX iTransOWNER_ORG_CODE ON [dbo].[Trans] (OWNER_ORG_CODE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransNUMSEQN')
BEGIN
  CREATE NONCLUSTERED INDEX iTransNUMSEQN ON [dbo].[Trans] (TRANS_NUMBER, LINE_NUMBER, SUB_LINE_NUMBER)
  INCLUDE (IS_FR_ITEM, INVOICE_REFERENCE_NUM, ACTIVITY_SEQN)
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
  CREATE NONCLUSTERED INDEX iTransJOURNAL_TYPE ON [dbo].[Trans] (JOURNAL_TYPE, TRANSACTION_TYPE)
  INCLUDE (MEM_TRIB_ID, MEM_TRIB_NAME_TEXT, MATCH_GIFT_TRANS_NUM, IS_MATCH_GIFT, PRODUCT_CODE, INVOICE_REFERENCE_NUM, INVOICE_LINE_NUM, FISCAL_PERIOD, CHECK_NUMBER, ACTIVITY_SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransIS_FR_ITEM')
BEGIN
  CREATE NONCLUSTERED INDEX iTransIS_FR_ITEM ON [dbo].[Trans] (IS_FR_ITEM)
  INCLUDE (TRANSACTION_TYPE, JOURNAL_TYPE, INVOICE_REFERENCE_NUM, RECEIPT_ID, OWNER_ORG_CODE, ST_ID, PRODUCT_CODE, TRANS_NUMBER, TRANSACTION_DATE, TAXABLE_VALUE, CHECK_NUMBER, FISCAL_PERIOD, GL_ACCT_ORG_CODE, INVOICE_LINE_NUM, BT_ID, AMOUNT)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') AND [name] = N'iTransDATE_ENTERED_GATEWAY_REF')
BEGIN
  CREATE NONCLUSTERED INDEX iTransDATE_ENTERED_GATEWAY_REF ON [dbo].[Trans] (DATE_ENTERED, GATEWAY_REF)
  INCLUDE (DESCRIPTION, LINE_NUMBER, SUB_LINE_NUMBER, TRANS_NUMBER)
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
  INCLUDE (FISCAL_PERIOD, INVOICE_LINE_NUM, TRANSACTION_DATE, JOURNAL_TYPE, IS_FR_ITEM, INVOICE_REFERENCE_NUM, TRANSACTION_TYPE, ACTIVITY_SEQN)
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
  CREATE NONCLUSTERED INDEX iTrans_NotifyTRANS_NUMBER ON [dbo].[Trans_Notify] (NOTIFY_ID, TRANS_NUMBER)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Trans_Notify]') AND [name] = N'iTrans_NotifyNOTIFY_ID')
BEGIN
  CREATE NONCLUSTERED INDEX iTrans_NotifyNOTIFY_ID ON [dbo].[Trans_Notify] (NOTIFY_ID)
  INCLUDE (TRANS_NUMBER)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLink]') AND [name] = N'IX_UniformLink_TargetUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformLink_TargetUniformKey ON [dbo].[UniformLink] (TargetUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLink]') AND [name] = N'IX_UniformLink_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformLink_SystemEntityKey ON [dbo].[UniformLink] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformLink]') AND [name] = N'IX_UniformLink_SubjectUniformKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformLink_SubjectUniformKey ON [dbo].[UniformLink] (SubjectUniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformRegistry]') AND [name] = N'PK_UniformRegistry')
BEGIN
  ALTER TABLE [dbo].[UniformRegistry]
  ADD CONSTRAINT PK_UniformRegistry PRIMARY KEY CLUSTERED (UniformKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformRegistry]') AND [name] = N'IX_UniformRegistry_ComponentKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformRegistry_ComponentKey ON [dbo].[UniformRegistry] (ComponentKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UniformTag]') AND [name] = N'IX_UniformTag_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UniformTag_CreatedByUserKey ON [dbo].[UniformTag] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UnofferedCustomerExperience]') AND [name] = N'IX_UnofferedCustomerExperience_ExperienceDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UnofferedCustomerExperience_ExperienceDefinitionKey ON [dbo].[UnofferedCustomerExperience] (ExperienceDefinitionKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URLMapping]') AND [name] = N'IX_URLMapping_URLMappingTypeCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_URLMapping_URLMappingTypeCode ON [dbo].[URLMapping] (URLMappingTypeCode)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[URLMappingTypeRef]') AND [name] = N'PK_URLMappingTypeRef')
BEGIN
  ALTER TABLE [dbo].[URLMappingTypeRef]
  ADD CONSTRAINT PK_URLMappingTypeRef PRIMARY KEY CLUSTERED (URLMappingTypeCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedCustomerExperience]') AND [name] = N'IX_UserDefinedCustomerExperience_ProgramKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedCustomerExperience_ProgramKey ON [dbo].[UserDefinedCustomerExperience] (ProgramKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedFieldRef]') AND [name] = N'PK_UserDefinedFieldRef')
BEGIN
  ALTER TABLE [dbo].[UserDefinedFieldRef]
  ADD CONSTRAINT PK_UserDefinedFieldRef PRIMARY KEY CLUSTERED (UserDefinedFieldKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedFieldRef]') AND [name] = N'IX_UserDefinedFieldRef_SystemEntityKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedFieldRef_SystemEntityKey ON [dbo].[UserDefinedFieldRef] (SystemEntityKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedFieldRef]') AND [name] = N'IX_UserDefinedFieldRef_PropertyDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedFieldRef_PropertyDefinitionKey ON [dbo].[UserDefinedFieldRef] (PropertyDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'PK_UserDefinedMultiInstanceProperty')
BEGIN
  ALTER TABLE [dbo].[UserDefinedMultiInstanceProperty]
  ADD CONSTRAINT PK_UserDefinedMultiInstanceProperty PRIMARY KEY CLUSTERED (TableName, PropertyName, RowID, RowKey, RowSequence)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_TableProperty')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_TableProperty ON [dbo].[UserDefinedMultiInstanceProperty] (TableName, PropertyName)
  INCLUDE (RowSequence, RowKey, RowID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_TableID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_TableID ON [dbo].[UserDefinedMultiInstanceProperty] (TableName, RowID)
  INCLUDE (PropertyName, RowKey, RowSequence)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_StringValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_StringValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyStringValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_IntValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_IntValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyIntValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_GuidValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_GuidValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyGuidValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_DecimalValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_DecimalValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyDecimalValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_DateTimeValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_DateTimeValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyDateTimeValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') AND [name] = N'IX_UserDefinedMultiInstanceProperty_BooleanValue')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedMultiInstanceProperty_BooleanValue ON [dbo].[UserDefinedMultiInstanceProperty] (PropertyBooleanValue)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'PK_UserDefinedSingleInstanceProperty')
BEGIN
  ALTER TABLE [dbo].[UserDefinedSingleInstanceProperty]
  ADD CONSTRAINT PK_UserDefinedSingleInstanceProperty PRIMARY KEY CLUSTERED (TableName, PropertyName, RowID, RowKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_TableProperty')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_TableProperty ON [dbo].[UserDefinedSingleInstanceProperty] (TableName, PropertyName)
  INCLUDE (RowKey, RowID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') AND [name] = N'IX_UserDefinedSingleInstanceProperty_TableID')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserDefinedSingleInstanceProperty_TableID ON [dbo].[UserDefinedSingleInstanceProperty] (TableName, RowID)
  INCLUDE (RowKey, PropertyName)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserLegacyInfo]') AND [name] = N'IX_UserLegacyInfo_UPPERUserId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserLegacyInfo_UPPERUserId ON [dbo].[UserLegacyInfo] (Password, UPPERUserId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'PK_UserMain')
BEGIN
  ALTER TABLE [dbo].[UserMain]
  ADD CONSTRAINT PK_UserMain PRIMARY KEY CLUSTERED (UserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_UserId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_UserId ON [dbo].[UserMain] (UserId)
  INCLUDE (ProviderKey, ContactMaster)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_UpdatedByUserKey ON [dbo].[UserMain] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_ProviderKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_ProviderKey ON [dbo].[UserMain] (ProviderKey)
  INCLUDE (UserId, EffectiveDate, ExpirationDate, IsDisabled, ContactMaster)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_DefaultPerspectiveKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_DefaultPerspectiveKey ON [dbo].[UserMain] (DefaultPerspectiveKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_DefaultDepartmentGroupKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_DefaultDepartmentGroupKey ON [dbo].[UserMain] (DefaultDepartmentGroupKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_UserMain_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserMain_CreatedByUserKey ON [dbo].[UserMain] (CreatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') AND [name] = N'IX_ContactMaster')
BEGIN
  CREATE NONCLUSTERED INDEX IX_ContactMaster ON [dbo].[UserMain] (ContactMaster)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserRole]') AND [name] = N'PK_UserRole')
BEGIN
  ALTER TABLE [dbo].[UserRole]
  ADD CONSTRAINT PK_UserRole PRIMARY KEY CLUSTERED (UserKey, RoleKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[UserRole]') AND [name] = N'IX_UserRole_RoleKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_UserRole_RoleKey ON [dbo].[UserRole] (RoleKey)
  INCLUDE (UserKey)
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
  ADD CONSTRAINT PK_VAT_Trans PRIMARY KEY CLUSTERED (REFERENCE_NUMBER)
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
  INCLUDE (GroupMemberId, GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee_GroupId ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupId)
  INCLUDE (GroupMemberId, PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'PK_vSoaGroupMemberSummaryEvent')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryEvent ON [dbo].[vSoaGroupMemberSummaryEvent] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'IX_vSoaGroupMemberSummaryEvent_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryEvent_PartyId ON [dbo].[vSoaGroupMemberSummaryEvent] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'IX_vSoaGroupMemberSummaryEvent_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryEvent_GroupId ON [dbo].[vSoaGroupMemberSummaryEvent] (GroupId)
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
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryMT_GroupId ON [dbo].[vSoaGroupMemberSummaryMT] (GroupId, IsActive)
  INCLUDE (PartyName, JoinDate, PartyId, GroupMemberId, DropDate)
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
  INCLUDE (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_GroupId ON [dbo].[vSoaGroupMemberSummaryOrganization] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'PK_vSoaGroupMemberSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryRelationship ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupMemberId, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_PartyId ON [dbo].[vSoaGroupMemberSummaryRelationship] (PartyId)
  INCLUDE (PartyName, GroupOwnerId, GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_GroupId ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupId)
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
  INCLUDE (PartyName, GroupMemberId, JoinDate, PAID_THRU, PartyId, BEGIN_DATE, DropDate)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]') AND [name] = N'PK_vSoaGroupSummaryMeeting')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryMeeting ON [dbo].[vSoaGroupSummaryMeeting] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]') AND [name] = N'IX_vSoaGroupSummaryMeeting_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryMeeting_ParentEntityId ON [dbo].[vSoaGroupSummaryMeeting] (ParentEntityId)
  INCLUDE (Name, ParentEntityTypeName, GroupClassId)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'IX_vSoaGroupSummaryOrganization_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryOrganization_ParentEntityId ON [dbo].[vSoaGroupSummaryOrganization] (ParentEntityId, COMPANY_RECORD)
  INCLUDE (Name, ParentEntityTypeName, GroupClassId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'IX_vSoaGroupSummaryOrganization_CompanyRecord')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryOrganization_CompanyRecord ON [dbo].[vSoaGroupSummaryOrganization] (COMPANY_RECORD)
  INCLUDE (ParentEntityId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]') AND [name] = N'PK_vSoaGroupSummaryProduct')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryProduct ON [dbo].[vSoaGroupSummaryProduct] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]') AND [name] = N'IX_vSoaGroupSummaryProduct_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryProduct_ParentEntityId ON [dbo].[vSoaGroupSummaryProduct] (ParentEntityId)
  INCLUDE (Name, GroupClassId, ParentEntityTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]') AND [name] = N'PK_vSoaGroupSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryRelationship ON [dbo].[vSoaGroupSummaryRelationship] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]') AND [name] = N'IX_vSoaGroupSummaryRelationship_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryRelationship_ParentEntityId ON [dbo].[vSoaGroupSummaryRelationship] (ParentEntityId)
  INCLUDE (Name, GroupClassId, ParentEntityTypeName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'PK_vSoaInvoiceLineARBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineARBase ON [dbo].[vSoaInvoiceLineARBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineARBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_ReferenceNum ON [dbo].[vSoaInvoiceLineARBase] (REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_InvoiceId ON [dbo].[vSoaInvoiceLineARBase] (InvoiceId, LineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'PK_vSoaInvoiceLineCashBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineCashBase ON [dbo].[vSoaInvoiceLineCashBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'IX_vSoaInvoiceLineCashBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineCashBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineCashBase] (ShipToPartyId)
  INCLUDE (ItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'IX_vSoaInvoiceLineCashBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineCashBase_InvoiceId ON [dbo].[vSoaInvoiceLineCashBase] (InvoiceId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'PK_vSoaInvoiceLineRegularBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularBase ON [dbo].[vSoaInvoiceLineRegularBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularBase] (ShipToPartyId)
  INCLUDE (Quantity, LineNumber, ExtendedAmount, InvoiceId, UnitPrice, ItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularBase] (InvoiceId, LineNumber)
  INCLUDE (ItemId, Quantity, ShipToPartyId, UnitPrice, ExtendedAmount)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'PK_vSoaInvoiceLineRegularFreightBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularFreightBase ON [dbo].[vSoaInvoiceLineRegularFreightBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularFreightBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularFreightBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularFreightBase] (InvoiceId, LineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'PK_vSoaInvoiceLineRegularHandlingBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularHandlingBase ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (InvoiceId, LineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'PK_vSoaInvoiceLineRegularTaxBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularTaxBase ON [dbo].[vSoaInvoiceLineRegularTaxBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularTaxBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularTaxBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularTaxBase] (InvoiceId, LineNumber)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'PK_vSoaInvoiceSummaryInvoiceBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceSummaryInvoiceBase ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (InvoiceId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'IX_vSoaInvoiceSummaryInvoiceBase_SoldToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceSummaryInvoiceBase_SoldToPartyId ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (SoldToPartyId, INVOICE_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'IX_vSoaInvoiceSummaryInvoiceBase_BillToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceSummaryInvoiceBase_BillToPartyId ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (BillToPartyId, INVOICE_TYPE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaPendingARPaymentAdjustment]') AND [name] = N'PK_vSoaPendingARPaymentAdjustment')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaPendingARPaymentAdjustment ON [dbo].[vSoaPendingARPaymentAdjustment] (INVOICE_REFERENCE_NUM, INVOICE_LINE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaPendingCashPaymentAdjustment]') AND [name] = N'PK_vSoaPendingCashPaymentAdjustment')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaPendingCashPaymentAdjustment ON [dbo].[vSoaPendingCashPaymentAdjustment] (ST_ID, PRODUCT_CODE)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[Website]') AND [name] = N'IX_Website_ScreenResolutionCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_Website_ScreenResolutionCode ON [dbo].[Website] (ScreenResolutionCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowInstance]') AND [name] = N'IX_WorkflowInstance_LockedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowInstance_LockedByUserKey ON [dbo].[WorkflowInstance] (LockedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowInstance]') AND [name] = N'IX_WorkflowInstance_InitiatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowInstance_InitiatedByUserKey ON [dbo].[WorkflowInstance] (InitiatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'PK_WorkflowQueue')
BEGIN
  ALTER TABLE [dbo].[WorkflowQueue]
  ADD CONSTRAINT PK_WorkflowQueue PRIMARY KEY CLUSTERED (WorkFlowQueueKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_UpdatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_UpdatedByUserKey ON [dbo].[WorkflowQueue] (UpdatedByUserKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_TaskItemKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_TaskItemKey ON [dbo].[WorkflowQueue] (TaskItemKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_TaskItemAccessKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_TaskItemAccessKey ON [dbo].[WorkflowQueue] (TaskItemAccessKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_SelectionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_SelectionKey ON [dbo].[WorkflowQueue] (SelectionKey)
  INCLUDE (WorkFlowQueueKey, CreatedOn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') AND [name] = N'IX_WorkflowQueue_CreatedByUserKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowQueue_CreatedByUserKey ON [dbo].[WorkflowQueue] (CreatedByUserKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowService]') AND [name] = N'IX_WorkflowService_WorkFlowServiceStatusCode')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkflowService_WorkFlowServiceStatusCode ON [dbo].[WorkflowService] (WorkFlowServiceStatusCode)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItem]') AND [name] = N'IX_WorkItem_WorkflowDefinitionKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkItem_WorkflowDefinitionKey ON [dbo].[WorkItem] (WorkflowDefinitionKey)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkItem]') AND [name] = N'IX_WorkItem_ProcessEngineKey')
BEGIN
  CREATE NONCLUSTERED INDEX IX_WorkItem_ProcessEngineKey ON [dbo].[WorkItem] (ProcessEngineKey)
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

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[WorkOrderMain]') AND [name] = N'PK_WorkOrderMain')
BEGIN
  ALTER TABLE [dbo].[WorkOrderMain]
  ADD CONSTRAINT PK_WorkOrderMain PRIMARY KEY CLUSTERED (WorkOrderKey)
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


