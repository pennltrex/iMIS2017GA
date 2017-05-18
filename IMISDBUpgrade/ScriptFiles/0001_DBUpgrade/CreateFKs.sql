
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessArea' AND [CONSTRAINT_NAME] = 'FK_AccessArea_AccessMain')
    ALTER TABLE [dbo].[AccessArea] WITH CHECK ADD CONSTRAINT [FK_AccessArea_AccessMain]
    FOREIGN KEY (ProtectedAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[AccessArea] CHECK CONSTRAINT [FK_AccessArea_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessArea' AND [CONSTRAINT_NAME] = 'FK_AccessArea_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AccessArea] WITH CHECK ADD CONSTRAINT [FK_AccessArea_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AccessArea] CHECK CONSTRAINT [FK_AccessArea_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessArea' AND [CONSTRAINT_NAME] = 'FK_AccessArea_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AccessArea] WITH CHECK ADD CONSTRAINT [FK_AccessArea_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AccessArea] CHECK CONSTRAINT [FK_AccessArea_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessItem' AND [CONSTRAINT_NAME] = 'FK_AccessItem_AccessMain')
    ALTER TABLE [dbo].[AccessItem] WITH CHECK ADD CONSTRAINT [FK_AccessItem_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[AccessItem] CHECK CONSTRAINT [FK_AccessItem_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessItem' AND [CONSTRAINT_NAME] = 'FK_AccessItem_GroupMain')
    ALTER TABLE [dbo].[AccessItem] WITH CHECK ADD CONSTRAINT [FK_AccessItem_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[AccessItem] CHECK CONSTRAINT [FK_AccessItem_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessItem' AND [CONSTRAINT_NAME] = 'FK_AccessItem_RoleMain')
    ALTER TABLE [dbo].[AccessItem] WITH CHECK ADD CONSTRAINT [FK_AccessItem_RoleMain]
    FOREIGN KEY (RoleKey) REFERENCES [RoleMain] (RoleKey)
go
ALTER TABLE [dbo].[AccessItem] CHECK CONSTRAINT [FK_AccessItem_RoleMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessItem' AND [CONSTRAINT_NAME] = 'FK_AccessItem_UserMain')
    ALTER TABLE [dbo].[AccessItem] WITH CHECK ADD CONSTRAINT [FK_AccessItem_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AccessItem] CHECK CONSTRAINT [FK_AccessItem_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessMain' AND [CONSTRAINT_NAME] = 'FK_AccessMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AccessMain] WITH CHECK ADD CONSTRAINT [FK_AccessMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AccessMain] CHECK CONSTRAINT [FK_AccessMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AccessMain' AND [CONSTRAINT_NAME] = 'FK_AccessMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AccessMain] WITH CHECK ADD CONSTRAINT [FK_AccessMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AccessMain] CHECK CONSTRAINT [FK_AccessMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ActionPlan' AND [CONSTRAINT_NAME] = 'FK_ActionPlan_OpportunityType')
    ALTER TABLE [dbo].[ActionPlan] WITH CHECK ADD CONSTRAINT [FK_ActionPlan_OpportunityType]
    FOREIGN KEY (OpportunityTypeKey) REFERENCES [OpportunityType] (OpportunityTypeKey)
go
ALTER TABLE [dbo].[ActionPlan] CHECK CONSTRAINT [FK_ActionPlan_OpportunityType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ActionPlan' AND [CONSTRAINT_NAME] = 'FK_ActionPlan_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ActionPlan] WITH CHECK ADD CONSTRAINT [FK_ActionPlan_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ActionPlan] CHECK CONSTRAINT [FK_ActionPlan_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ActionPlan' AND [CONSTRAINT_NAME] = 'FK_ActionPlan_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ActionPlan] WITH CHECK ADD CONSTRAINT [FK_ActionPlan_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ActionPlan] CHECK CONSTRAINT [FK_ActionPlan_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressCategoryPreferences' AND [CONSTRAINT_NAME] = 'FK_AddressCategoryPreferences_AddressCategoryRef')
    ALTER TABLE [dbo].[AddressCategoryPreferences] WITH CHECK ADD CONSTRAINT [FK_AddressCategoryPreferences_AddressCategoryRef]
    FOREIGN KEY (AddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[AddressCategoryPreferences] CHECK CONSTRAINT [FK_AddressCategoryPreferences_AddressCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressCategoryPreferences' AND [CONSTRAINT_NAME] = 'FK_AddressCategoryPreferences_ContactMain')
    ALTER TABLE [dbo].[AddressCategoryPreferences] WITH CHECK ADD CONSTRAINT [FK_AddressCategoryPreferences_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[AddressCategoryPreferences] CHECK CONSTRAINT [FK_AddressCategoryPreferences_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressFormatRef' AND [CONSTRAINT_NAME] = 'FK_AddressFormatRef_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AddressFormatRef] WITH CHECK ADD CONSTRAINT [FK_AddressFormatRef_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressFormatRef] CHECK CONSTRAINT [FK_AddressFormatRef_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressFormatRef' AND [CONSTRAINT_NAME] = 'FK_AddressFormatRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AddressFormatRef] WITH CHECK ADD CONSTRAINT [FK_AddressFormatRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressFormatRef] CHECK CONSTRAINT [FK_AddressFormatRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_AddressCategoryRef')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_AddressCategoryRef]
    FOREIGN KEY (AddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_AddressCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_AddressStatusRef')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_AddressStatusRef]
    FOREIGN KEY (AddressStatusCode) REFERENCES [AddressStatusRef] (AddressStatusCode)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_AddressStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_BadAddressRef')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_BadAddressRef]
    FOREIGN KEY (BadAddressReasonKey) REFERENCES [BadAddressReasonRef] (BadAddressReasonKey)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_BadAddressRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_ContactMain')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_ContactMain]
    FOREIGN KEY (OwnerContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_SystemEntity')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressMain' AND [CONSTRAINT_NAME] = 'FK_AddressMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AddressMain] WITH CHECK ADD CONSTRAINT [FK_AddressMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressMain] CHECK CONSTRAINT [FK_AddressMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressPurposeContactType' AND [CONSTRAINT_NAME] = 'FK_AddressPurposeContactType_AddressPurposeRef')
    ALTER TABLE [dbo].[AddressPurposeContactType] WITH CHECK ADD CONSTRAINT [FK_AddressPurposeContactType_AddressPurposeRef]
    FOREIGN KEY (AddressPurposeKey) REFERENCES [AddressPurposeRef] (AddressPurposeKey)
go
ALTER TABLE [dbo].[AddressPurposeContactType] CHECK CONSTRAINT [FK_AddressPurposeContactType_AddressPurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressPurposeContactType' AND [CONSTRAINT_NAME] = 'FK_AddressPurposeContactType_ContactTypeRef')
    ALTER TABLE [dbo].[AddressPurposeContactType] WITH CHECK ADD CONSTRAINT [FK_AddressPurposeContactType_ContactTypeRef]
    FOREIGN KEY (ContactTypeKey) REFERENCES [ContactTypeRef] (ContactTypeKey)
go
ALTER TABLE [dbo].[AddressPurposeContactType] CHECK CONSTRAINT [FK_AddressPurposeContactType_ContactTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressPurposeRef' AND [CONSTRAINT_NAME] = 'FK_AddressPurposeRef_UniformRegistry')
    ALTER TABLE [dbo].[AddressPurposeRef] WITH CHECK ADD CONSTRAINT [FK_AddressPurposeRef_UniformRegistry]
    FOREIGN KEY (AddressPurposeKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[AddressPurposeRef] CHECK CONSTRAINT [FK_AddressPurposeRef_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressPurposeRef' AND [CONSTRAINT_NAME] = 'FK_AddressPurposeRef_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AddressPurposeRef] WITH CHECK ADD CONSTRAINT [FK_AddressPurposeRef_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressPurposeRef] CHECK CONSTRAINT [FK_AddressPurposeRef_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressPurposeRef' AND [CONSTRAINT_NAME] = 'FK_AddressPurposeRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AddressPurposeRef] WITH CHECK ADD CONSTRAINT [FK_AddressPurposeRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AddressPurposeRef] CHECK CONSTRAINT [FK_AddressPurposeRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressToUse' AND [CONSTRAINT_NAME] = 'FK_AddressToUse_CommunicationReasonRef')
    ALTER TABLE [dbo].[AddressToUse] WITH CHECK ADD CONSTRAINT [FK_AddressToUse_CommunicationReasonRef]
    FOREIGN KEY (CommunicationReasonKey) REFERENCES [CommunicationReasonRef] (CommunicationReasonKey)
go
ALTER TABLE [dbo].[AddressToUse] CHECK CONSTRAINT [FK_AddressToUse_CommunicationReasonRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressToUse' AND [CONSTRAINT_NAME] = 'FK_AddressToUse_ContactMain')
    ALTER TABLE [dbo].[AddressToUse] WITH CHECK ADD CONSTRAINT [FK_AddressToUse_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[AddressToUse] CHECK CONSTRAINT [FK_AddressToUse_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressToUse' AND [CONSTRAINT_NAME] = 'FK_AddressToUse_FullAddress')
    ALTER TABLE [dbo].[AddressToUse] WITH CHECK ADD CONSTRAINT [FK_AddressToUse_FullAddress]
    FOREIGN KEY (FullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[AddressToUse] CHECK CONSTRAINT [FK_AddressToUse_FullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressToUse' AND [CONSTRAINT_NAME] = 'FK_AddressToUse_FullAddress_SeasonalRevertFullAddress')
    ALTER TABLE [dbo].[AddressToUse] WITH CHECK ADD CONSTRAINT [FK_AddressToUse_FullAddress_SeasonalRevertFullAddress]
    FOREIGN KEY (SeasonalRevertFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[AddressToUse] CHECK CONSTRAINT [FK_AddressToUse_FullAddress_SeasonalRevertFullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AddressTypeRef' AND [CONSTRAINT_NAME] = 'FK_AddressTypeRef_CommunicationMechanismRef')
    ALTER TABLE [dbo].[AddressTypeRef] WITH CHECK ADD CONSTRAINT [FK_AddressTypeRef_CommunicationMechanismRef]
    FOREIGN KEY (AddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[AddressTypeRef] CHECK CONSTRAINT [FK_AddressTypeRef_CommunicationMechanismRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Admin_Section_Ref' AND [CONSTRAINT_NAME] = 'FK_Admin_Section_Ref_Component_Ref')
    ALTER TABLE [dbo].[Admin_Section_Ref] WITH CHECK ADD CONSTRAINT [FK_Admin_Section_Ref_Component_Ref]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Admin_Section_Ref] CHECK CONSTRAINT [FK_Admin_Section_Ref_Component_Ref]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Admin_Security' AND [CONSTRAINT_NAME] = 'FK_ADMIN_SECURITY_ADMIN_SECTIO')
    ALTER TABLE [dbo].[Admin_Security] WITH CHECK ADD CONSTRAINT [FK_ADMIN_SECURITY_ADMIN_SECTIO]
    FOREIGN KEY (AdminSectionCode) REFERENCES [Admin_Section_Ref] (AdminSectionCode)
go
ALTER TABLE [dbo].[Admin_Security] CHECK CONSTRAINT [FK_ADMIN_SECURITY_ADMIN_SECTIO]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingSchedule' AND [CONSTRAINT_NAME] = 'FK_AgingSchedule_FinancialEntity')
    ALTER TABLE [dbo].[AgingSchedule] WITH CHECK ADD CONSTRAINT [FK_AgingSchedule_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[AgingSchedule] CHECK CONSTRAINT [FK_AgingSchedule_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingSchedule' AND [CONSTRAINT_NAME] = 'FK_AgingSchedule_SystemEntity')
    ALTER TABLE [dbo].[AgingSchedule] WITH CHECK ADD CONSTRAINT [FK_AgingSchedule_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[AgingSchedule] CHECK CONSTRAINT [FK_AgingSchedule_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingSchedule' AND [CONSTRAINT_NAME] = 'FK_AgingSchedule_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AgingSchedule] WITH CHECK ADD CONSTRAINT [FK_AgingSchedule_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AgingSchedule] CHECK CONSTRAINT [FK_AgingSchedule_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingSchedule' AND [CONSTRAINT_NAME] = 'FK_AgingSchedule_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AgingSchedule] WITH CHECK ADD CONSTRAINT [FK_AgingSchedule_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AgingSchedule] CHECK CONSTRAINT [FK_AgingSchedule_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingScheduleCategory' AND [CONSTRAINT_NAME] = 'FK_AgingScheduleCategory_AgingSchedule')
    ALTER TABLE [dbo].[AgingScheduleCategory] WITH CHECK ADD CONSTRAINT [FK_AgingScheduleCategory_AgingSchedule]
    FOREIGN KEY (AgingScheduleKey) REFERENCES [AgingSchedule] (AgingScheduleKey)
go
ALTER TABLE [dbo].[AgingScheduleCategory] CHECK CONSTRAINT [FK_AgingScheduleCategory_AgingSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingScheduleCategory' AND [CONSTRAINT_NAME] = 'FK_AgingScheduleCategory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AgingScheduleCategory] WITH CHECK ADD CONSTRAINT [FK_AgingScheduleCategory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AgingScheduleCategory] CHECK CONSTRAINT [FK_AgingScheduleCategory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AgingScheduleCategory' AND [CONSTRAINT_NAME] = 'FK_AgingScheduleCategory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AgingScheduleCategory] WITH CHECK ADD CONSTRAINT [FK_AgingScheduleCategory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AgingScheduleCategory] CHECK CONSTRAINT [FK_AgingScheduleCategory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_AccessMain')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_AppealStatusRef')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_AppealStatusRef]
    FOREIGN KEY (AppealStatusCode) REFERENCES [AppealStatusRef] (AppealStatusCode)
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_AppealStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_CampaignMain')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_CampaignMain]
    FOREIGN KEY (CampaignKey) REFERENCES [CampaignMain] (CampaignKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_CampaignMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_UniformRegistry')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_UniformRegistry]
    FOREIGN KEY (AppealKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealMain' AND [CONSTRAINT_NAME] = 'FK_AppealMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AppealMain] WITH CHECK ADD CONSTRAINT [FK_AppealMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AppealMain] CHECK CONSTRAINT [FK_AppealMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_AppealMain')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_AppealMain]
    FOREIGN KEY (AppealKey) REFERENCES [AppealMain] (AppealKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_AppealMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_ResponseTypeRef')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_ResponseTypeRef]
    FOREIGN KEY (ResponseTypeCode) REFERENCES [ResponseTypeRef] (ResponseTypeCode)
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_ResponseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_SolicitationMain')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_SolicitationMain]
    FOREIGN KEY (SolicitationKey) REFERENCES [SolicitationMain] (SolicitationKey)
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_SolicitationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_SourceCode')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_UserMain_CreatedBy')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealParticipation' AND [CONSTRAINT_NAME] = 'FK_AppealParticipation_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AppealParticipation] WITH CHECK ADD CONSTRAINT [FK_AppealParticipation_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AppealParticipation] CHECK CONSTRAINT [FK_AppealParticipation_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealProduct' AND [CONSTRAINT_NAME] = 'FK_AppealProduct_AppealMain')
    ALTER TABLE [dbo].[AppealProduct] WITH CHECK ADD CONSTRAINT [FK_AppealProduct_AppealMain]
    FOREIGN KEY (AppealKey) REFERENCES [AppealMain] (AppealKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[AppealProduct] CHECK CONSTRAINT [FK_AppealProduct_AppealMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AppealProduct' AND [CONSTRAINT_NAME] = 'FK_AppealProduct_ProductMain')
    ALTER TABLE [dbo].[AppealProduct] WITH CHECK ADD CONSTRAINT [FK_AppealProduct_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[AppealProduct] CHECK CONSTRAINT [FK_AppealProduct_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_AtomPanelFactoryStateRef')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_AtomPanelFactoryStateRef]
    FOREIGN KEY (AtomPanelFactoryStateCode) REFERENCES [AtomPanelFactoryStateRef] (AtomPanelFactoryStateCode)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_AtomPanelFactoryStateRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_AtomPanelPurposeRef')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_AtomPanelPurposeRef]
    FOREIGN KEY (AtomPanelPurposeCode) REFERENCES [AtomPanelPurposeRef] (AtomPanelPurposeCode)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_AtomPanelPurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_AtomPanelStatusRef')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_AtomPanelStatusRef]
    FOREIGN KEY (AtomPanelStatusCode) REFERENCES [AtomPanelStatusRef] (AtomPanelStatusCode)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_AtomPanelStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_AtomPanelTypeRef')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_AtomPanelTypeRef]
    FOREIGN KEY (AtomPanelTypeCode) REFERENCES [AtomPanelTypeRef] (AtomPanelTypeCode)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_AtomPanelTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_ComponentRegistry')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanel' AND [CONSTRAINT_NAME] = 'FK_AtomPanel_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[AtomPanel] WITH CHECK ADD CONSTRAINT [FK_AtomPanel_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AtomPanel] CHECK CONSTRAINT [FK_AtomPanel_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanelTemplate' AND [CONSTRAINT_NAME] = 'FK_AtomPanelTemplate_AtomPanelTemplateTypeRef')
    ALTER TABLE [dbo].[AtomPanelTemplate] WITH CHECK ADD CONSTRAINT [FK_AtomPanelTemplate_AtomPanelTemplateTypeRef]
    FOREIGN KEY (AtomPanelTemplateTypeCode) REFERENCES [AtomPanelTemplateTypeRef] (AtomPanelTemplateTypeCode)
go
ALTER TABLE [dbo].[AtomPanelTemplate] CHECK CONSTRAINT [FK_AtomPanelTemplate_AtomPanelTemplateTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanelTemplate' AND [CONSTRAINT_NAME] = 'FK_AtomPanelTemplate_Website')
    ALTER TABLE [dbo].[AtomPanelTemplate] WITH CHECK ADD CONSTRAINT [FK_AtomPanelTemplate_Website]
    FOREIGN KEY (WebsiteKey) REFERENCES [Website] (WebsiteKey)
go
ALTER TABLE [dbo].[AtomPanelTemplate] CHECK CONSTRAINT [FK_AtomPanelTemplate_Website]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanelWebsite' AND [CONSTRAINT_NAME] = 'FK_AtomPanelWebsite_AtomPanel')
    ALTER TABLE [dbo].[AtomPanelWebsite] WITH CHECK ADD CONSTRAINT [FK_AtomPanelWebsite_AtomPanel]
    FOREIGN KEY (AtomPanelKey) REFERENCES [AtomPanel] (AtomPanelKey)
go
ALTER TABLE [dbo].[AtomPanelWebsite] CHECK CONSTRAINT [FK_AtomPanelWebsite_AtomPanel]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AtomPanelWebsite' AND [CONSTRAINT_NAME] = 'FK_AtomPanelWebsite_Website')
    ALTER TABLE [dbo].[AtomPanelWebsite] WITH CHECK ADD CONSTRAINT [FK_AtomPanelWebsite_Website]
    FOREIGN KEY (WebsiteKey) REFERENCES [Website] (WebsiteKey)
go
ALTER TABLE [dbo].[AtomPanelWebsite] CHECK CONSTRAINT [FK_AtomPanelWebsite_Website]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchCriterionTemplate' AND [CONSTRAINT_NAME] = 'FK_BatchCriterionTemplate_BatchCriterionRef')
    ALTER TABLE [dbo].[BatchCriterionTemplate] WITH CHECK ADD CONSTRAINT [FK_BatchCriterionTemplate_BatchCriterionRef]
    FOREIGN KEY (BatchCriterionCode) REFERENCES [BatchCriterionRef] (BatchCriterionCode)
go
ALTER TABLE [dbo].[BatchCriterionTemplate] CHECK CONSTRAINT [FK_BatchCriterionTemplate_BatchCriterionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchCriterionTemplate' AND [CONSTRAINT_NAME] = 'FK_BatchCriterionTemplate_BatchTypeRef')
    ALTER TABLE [dbo].[BatchCriterionTemplate] WITH CHECK ADD CONSTRAINT [FK_BatchCriterionTemplate_BatchTypeRef]
    FOREIGN KEY (BatchTypeCode) REFERENCES [BatchTypeRef] (BatchTypeCode)
go
ALTER TABLE [dbo].[BatchCriterionTemplate] CHECK CONSTRAINT [FK_BatchCriterionTemplate_BatchTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_AccessMain')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_BatchStatusRef')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_BatchStatusRef]
    FOREIGN KEY (BatchStatusCode) REFERENCES [BatchStatusRef] (BatchStatusCode)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_BatchStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_BatchTypeRef')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_BatchTypeRef]
    FOREIGN KEY (BatchTypeCode) REFERENCES [BatchTypeRef] (BatchTypeCode)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_BatchTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_SystemEntity')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_UniformRegistry')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_UniformRegistry]
    FOREIGN KEY (BatchKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_UserMain_CreatedBy')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstance' AND [CONSTRAINT_NAME] = 'FK_BatchInstance_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[BatchInstance] WITH CHECK ADD CONSTRAINT [FK_BatchInstance_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[BatchInstance] CHECK CONSTRAINT [FK_BatchInstance_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstanceControl' AND [CONSTRAINT_NAME] = 'FK_BatchInstanceControl_BatchInstance')
    ALTER TABLE [dbo].[BatchInstanceControl] WITH CHECK ADD CONSTRAINT [FK_BatchInstanceControl_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[BatchInstanceControl] CHECK CONSTRAINT [FK_BatchInstanceControl_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchInstanceCriterion' AND [CONSTRAINT_NAME] = 'FK_BatchInstanceCriterion_BatchInstance')
    ALTER TABLE [dbo].[BatchInstanceCriterion] WITH CHECK ADD CONSTRAINT [FK_BatchInstanceCriterion_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[BatchInstanceCriterion] CHECK CONSTRAINT [FK_BatchInstanceCriterion_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchLookup' AND [CONSTRAINT_NAME] = 'FK_BatchLookup_BatchInstance')
    ALTER TABLE [dbo].[BatchLookup] WITH CHECK ADD CONSTRAINT [FK_BatchLookup_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[BatchLookup] CHECK CONSTRAINT [FK_BatchLookup_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchLookup' AND [CONSTRAINT_NAME] = 'FK_BatchLookup_BatchTypeRef')
    ALTER TABLE [dbo].[BatchLookup] WITH CHECK ADD CONSTRAINT [FK_BatchLookup_BatchTypeRef]
    FOREIGN KEY (BatchTypeCode) REFERENCES [BatchTypeRef] (BatchTypeCode)
go
ALTER TABLE [dbo].[BatchLookup] CHECK CONSTRAINT [FK_BatchLookup_BatchTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetup' AND [CONSTRAINT_NAME] = 'FK_BatchSetup_BatchTypeRef')
    ALTER TABLE [dbo].[BatchSetup] WITH CHECK ADD CONSTRAINT [FK_BatchSetup_BatchTypeRef]
    FOREIGN KEY (BatchTypeCode) REFERENCES [BatchTypeRef] (BatchTypeCode)
go
ALTER TABLE [dbo].[BatchSetup] CHECK CONSTRAINT [FK_BatchSetup_BatchTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetup' AND [CONSTRAINT_NAME] = 'FK_BatchSetup_SystemEntity')
    ALTER TABLE [dbo].[BatchSetup] WITH CHECK ADD CONSTRAINT [FK_BatchSetup_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[BatchSetup] CHECK CONSTRAINT [FK_BatchSetup_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetup' AND [CONSTRAINT_NAME] = 'FK_BatchSetup_UserMain_CreatedBy')
    ALTER TABLE [dbo].[BatchSetup] WITH CHECK ADD CONSTRAINT [FK_BatchSetup_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[BatchSetup] CHECK CONSTRAINT [FK_BatchSetup_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetup' AND [CONSTRAINT_NAME] = 'FK_BatchSetup_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[BatchSetup] WITH CHECK ADD CONSTRAINT [FK_BatchSetup_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[BatchSetup] CHECK CONSTRAINT [FK_BatchSetup_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetupAction' AND [CONSTRAINT_NAME] = 'FK_BatchSetupAction_BatchActionRef')
    ALTER TABLE [dbo].[BatchSetupAction] WITH CHECK ADD CONSTRAINT [FK_BatchSetupAction_BatchActionRef]
    FOREIGN KEY (BatchActionCode) REFERENCES [BatchActionRef] (BatchActionCode)
go
ALTER TABLE [dbo].[BatchSetupAction] CHECK CONSTRAINT [FK_BatchSetupAction_BatchActionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetupAction' AND [CONSTRAINT_NAME] = 'FK_BatchSetupAction_BatchSetup')
    ALTER TABLE [dbo].[BatchSetupAction] WITH CHECK ADD CONSTRAINT [FK_BatchSetupAction_BatchSetup]
    FOREIGN KEY (BatchSetupKey) REFERENCES [BatchSetup] (BatchSetupKey)
go
ALTER TABLE [dbo].[BatchSetupAction] CHECK CONSTRAINT [FK_BatchSetupAction_BatchSetup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetupControl' AND [CONSTRAINT_NAME] = 'FK_BatchSetupControl_BatchSetup')
    ALTER TABLE [dbo].[BatchSetupControl] WITH CHECK ADD CONSTRAINT [FK_BatchSetupControl_BatchSetup]
    FOREIGN KEY (BatchSetupKey) REFERENCES [BatchSetup] (BatchSetupKey)
go
ALTER TABLE [dbo].[BatchSetupControl] CHECK CONSTRAINT [FK_BatchSetupControl_BatchSetup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'BatchSetupCriterion' AND [CONSTRAINT_NAME] = 'FK_BatchSetupCriterion_BatchSetup')
    ALTER TABLE [dbo].[BatchSetupCriterion] WITH CHECK ADD CONSTRAINT [FK_BatchSetupCriterion_BatchSetup]
    FOREIGN KEY (BatchSetupKey) REFERENCES [BatchSetup] (BatchSetupKey)
go
ALTER TABLE [dbo].[BatchSetupCriterion] CHECK CONSTRAINT [FK_BatchSetupCriterion_BatchSetup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_AccessMain')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_CampaignStatusRef')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_CampaignStatusRef]
    FOREIGN KEY (CampaignStatusCode) REFERENCES [CampaignStatusRef] (CampaignStatusCode)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_CampaignStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_CampaignTypeRef')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_CampaignTypeRef]
    FOREIGN KEY (CampaignTypeCode) REFERENCES [CampaignTypeRef] (CampaignTypeCode)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_CampaignTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_SystemEntity')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_UniformRegistry')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_UniformRegistry]
    FOREIGN KEY (CampaignKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignMain' AND [CONSTRAINT_NAME] = 'FK_CampaignMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CampaignMain] WITH CHECK ADD CONSTRAINT [FK_CampaignMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CampaignMain] CHECK CONSTRAINT [FK_CampaignMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignParticipation' AND [CONSTRAINT_NAME] = 'FK_CampaignParticipation_CampaignMain')
    ALTER TABLE [dbo].[CampaignParticipation] WITH CHECK ADD CONSTRAINT [FK_CampaignParticipation_CampaignMain]
    FOREIGN KEY (CampaignKey) REFERENCES [CampaignMain] (CampaignKey)
go
ALTER TABLE [dbo].[CampaignParticipation] CHECK CONSTRAINT [FK_CampaignParticipation_CampaignMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignParticipation' AND [CONSTRAINT_NAME] = 'FK_CampaignParticipation_ResponseTypeRef')
    ALTER TABLE [dbo].[CampaignParticipation] WITH CHECK ADD CONSTRAINT [FK_CampaignParticipation_ResponseTypeRef]
    FOREIGN KEY (ResponseTypeCode) REFERENCES [ResponseTypeRef] (ResponseTypeCode)
go
ALTER TABLE [dbo].[CampaignParticipation] CHECK CONSTRAINT [FK_CampaignParticipation_ResponseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignParticipation' AND [CONSTRAINT_NAME] = 'FK_CampaignParticipation_SourceCode')
    ALTER TABLE [dbo].[CampaignParticipation] WITH CHECK ADD CONSTRAINT [FK_CampaignParticipation_SourceCode]
    FOREIGN KEY (OptOutSourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[CampaignParticipation] CHECK CONSTRAINT [FK_CampaignParticipation_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignParticipation' AND [CONSTRAINT_NAME] = 'FK_CampaignParticipation_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CampaignParticipation] WITH CHECK ADD CONSTRAINT [FK_CampaignParticipation_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CampaignParticipation] CHECK CONSTRAINT [FK_CampaignParticipation_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CampaignParticipation' AND [CONSTRAINT_NAME] = 'FK_CampaignParticipation_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CampaignParticipation] WITH CHECK ADD CONSTRAINT [FK_CampaignParticipation_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CampaignParticipation] CHECK CONSTRAINT [FK_CampaignParticipation_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CartBilling' AND [CONSTRAINT_NAME] = 'FK_CartBilling_CartItem')
    ALTER TABLE [dbo].[CartBilling] WITH CHECK ADD CONSTRAINT [FK_CartBilling_CartItem]
    FOREIGN KEY (CartItemId) REFERENCES [CartItem] (CartItemID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[CartBilling] CHECK CONSTRAINT [FK_CartBilling_CartItem]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CartEvent' AND [CONSTRAINT_NAME] = 'FK_CartEvent_CartItem')
    ALTER TABLE [dbo].[CartEvent] WITH CHECK ADD CONSTRAINT [FK_CartEvent_CartItem]
    FOREIGN KEY (CartItemID) REFERENCES [CartItem] (CartItemID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[CartEvent] CHECK CONSTRAINT [FK_CartEvent_CartItem]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CartEventFunction' AND [CONSTRAINT_NAME] = 'FK_CartEventFunction_CartEvent')
    ALTER TABLE [dbo].[CartEventFunction] WITH CHECK ADD CONSTRAINT [FK_CartEventFunction_CartEvent]
    FOREIGN KEY (CartEventID) REFERENCES [CartEvent] (CartEventID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[CartEventFunction] CHECK CONSTRAINT [FK_CartEventFunction_CartEvent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CartOrder' AND [CONSTRAINT_NAME] = 'FK_CartOrder_CartItem')
    ALTER TABLE [dbo].[CartOrder] WITH CHECK ADD CONSTRAINT [FK_CartOrder_CartItem]
    FOREIGN KEY (CartItemID) REFERENCES [CartItem] (CartItemID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[CartOrder] CHECK CONSTRAINT [FK_CartOrder_CartItem]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CartOrder' AND [CONSTRAINT_NAME] = 'FK_CartOrder_OrderProduct')
    ALTER TABLE [dbo].[CartOrder] WITH CHECK ADD CONSTRAINT [FK_CartOrder_OrderProduct]
    FOREIGN KEY (OrderProductID) REFERENCES [OrderProduct] (OrderProductID)
go
ALTER TABLE [dbo].[CartOrder] CHECK CONSTRAINT [FK_CartOrder_OrderProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationModule_CertificationModuleStatusRef')
    ALTER TABLE [dbo].[CertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationModule_CertificationModuleStatusRef]
    FOREIGN KEY (CertificationModuleStatusCode) REFERENCES [CertificationModuleStatusRef] (CertificationModuleStatusCode)
go
ALTER TABLE [dbo].[CertificationModule] CHECK CONSTRAINT [FK_CertificationModule_CertificationModuleStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationModule_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationModule_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModule] CHECK CONSTRAINT [FK_CertificationModule_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationModule_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationModule_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModule] CHECK CONSTRAINT [FK_CertificationModule_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleGrade' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleGrade_CertificationModule')
    ALTER TABLE [dbo].[CertificationModuleGrade] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleGrade_CertificationModule]
    FOREIGN KEY (CertificationModuleKey) REFERENCES [CertificationModule] (CertificationModuleKey)
go
ALTER TABLE [dbo].[CertificationModuleGrade] CHECK CONSTRAINT [FK_CertificationModuleGrade_CertificationModule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleGrade' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleGrade_GradeRef')
    ALTER TABLE [dbo].[CertificationModuleGrade] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleGrade_GradeRef]
    FOREIGN KEY (GradeKey) REFERENCES [GradeRef] (GradeKey)
go
ALTER TABLE [dbo].[CertificationModuleGrade] CHECK CONSTRAINT [FK_CertificationModuleGrade_GradeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleGrade' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleGrade_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationModuleGrade] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleGrade_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModuleGrade] CHECK CONSTRAINT [FK_CertificationModuleGrade_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleGrade' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleGrade_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationModuleGrade] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleGrade_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModuleGrade] CHECK CONSTRAINT [FK_CertificationModuleGrade_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleProduct_CertificationModule')
    ALTER TABLE [dbo].[CertificationModuleProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleProduct_CertificationModule]
    FOREIGN KEY (CertificationModuleKey) REFERENCES [CertificationModule] (CertificationModuleKey)
go
ALTER TABLE [dbo].[CertificationModuleProduct] CHECK CONSTRAINT [FK_CertificationModuleProduct_CertificationModule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleProduct_Product')
    ALTER TABLE [dbo].[CertificationModuleProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleProduct_Product]
    FOREIGN KEY (ProductCode) REFERENCES [Product] (PRODUCT_CODE)
go
ALTER TABLE [dbo].[CertificationModuleProduct] CHECK CONSTRAINT [FK_CertificationModuleProduct_Product]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleProduct_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationModuleProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleProduct_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModuleProduct] CHECK CONSTRAINT [FK_CertificationModuleProduct_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleProduct_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationModuleProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleProduct_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationModuleProduct] CHECK CONSTRAINT [FK_CertificationModuleProduct_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleRegistration_CertificationModule')
    ALTER TABLE [dbo].[CertificationModuleRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleRegistration_CertificationModule]
    FOREIGN KEY (CertificationModuleKey) REFERENCES [CertificationModule] (CertificationModuleKey)
go
ALTER TABLE [dbo].[CertificationModuleRegistration] CHECK CONSTRAINT [FK_CertificationModuleRegistration_CertificationModule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleRegistration_CertificationProgramRegistration')
    ALTER TABLE [dbo].[CertificationModuleRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleRegistration_CertificationProgramRegistration]
    FOREIGN KEY (CertificationProgramRegistrationKey) REFERENCES [CertificationProgramRegistration] (CertificationProgramRegistrationKey)
go
ALTER TABLE [dbo].[CertificationModuleRegistration] CHECK CONSTRAINT [FK_CertificationModuleRegistration_CertificationProgramRegistration]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleRegistration_OfferedCustomerExperience')
    ALTER TABLE [dbo].[CertificationModuleRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleRegistration_OfferedCustomerExperience]
    FOREIGN KEY (CustomerExperienceKey) REFERENCES [CustomerExperience] (CustomerExperienceKey)
go
ALTER TABLE [dbo].[CertificationModuleRegistration] CHECK CONSTRAINT [FK_CertificationModuleRegistration_OfferedCustomerExperience]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationModuleRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationModuleRegistration_RegistrationStatusRef')
    ALTER TABLE [dbo].[CertificationModuleRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationModuleRegistration_RegistrationStatusRef]
    FOREIGN KEY (RegistrationStatusCode) REFERENCES [RegistrationStatusRef] (RegistrationStatusCode)
go
ALTER TABLE [dbo].[CertificationModuleRegistration] CHECK CONSTRAINT [FK_CertificationModuleRegistration_RegistrationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_CertificationProgram')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_CertificationProgram]
    FOREIGN KEY (PreRequiredProgramKey) REFERENCES [CertificationProgram] (CertificationProgramKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_CertificationProgram]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_CertificationProgramGroup')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_CertificationProgramGroup]
    FOREIGN KEY (CertificationProgramGroupKey) REFERENCES [ProgramGroup] (ProgramGroupKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_CertificationProgramGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_ProgramStatusRef')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_ProgramStatusRef]
    FOREIGN KEY (CertificationProgramStatusCode) REFERENCES [ProgramStatusRef] (ProgramStatusCode)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_ProgramStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_Uom')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramCertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramCertificationModule_CertificationModule')
    ALTER TABLE [dbo].[CertificationProgramCertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramCertificationModule_CertificationModule]
    FOREIGN KEY (CertificationModuleKey) REFERENCES [CertificationModule] (CertificationModuleKey)
go
ALTER TABLE [dbo].[CertificationProgramCertificationModule] CHECK CONSTRAINT [FK_CertificationProgramCertificationModule_CertificationModule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramCertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramCertificationModule_CertificationProgram')
    ALTER TABLE [dbo].[CertificationProgramCertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramCertificationModule_CertificationProgram]
    FOREIGN KEY (CertificationProgramKey) REFERENCES [CertificationProgram] (CertificationProgramKey)
go
ALTER TABLE [dbo].[CertificationProgramCertificationModule] CHECK CONSTRAINT [FK_CertificationProgramCertificationModule_CertificationProgram]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramProduct_CertificationProgram')
    ALTER TABLE [dbo].[CertificationProgramProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramProduct_CertificationProgram]
    FOREIGN KEY (CertificationProgramKey) REFERENCES [CertificationProgram] (CertificationProgramKey)
go
ALTER TABLE [dbo].[CertificationProgramProduct] CHECK CONSTRAINT [FK_CertificationProgramProduct_CertificationProgram]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramProduct_Product')
    ALTER TABLE [dbo].[CertificationProgramProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramProduct_Product]
    FOREIGN KEY (ProductCode) REFERENCES [Product] (PRODUCT_CODE)
go
ALTER TABLE [dbo].[CertificationProgramProduct] CHECK CONSTRAINT [FK_CertificationProgramProduct_Product]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramProduct_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationProgramProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramProduct_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgramProduct] CHECK CONSTRAINT [FK_CertificationProgramProduct_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramProduct' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramProduct_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationProgramProduct] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramProduct_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgramProduct] CHECK CONSTRAINT [FK_CertificationProgramProduct_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_CertificationProgram')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_CertificationProgram]
    FOREIGN KEY (CertificationProgramKey) REFERENCES [CertificationProgram] (CertificationProgramKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_CertificationProgram]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_RegistrationStatusRef')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_RegistrationStatusRef]
    FOREIGN KEY (RegistrationStatusCode) REFERENCES [RegistrationStatusRef] (RegistrationStatusCode)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_RegistrationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_UserMain')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistrationCertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistrationCertificationModule_CertificationModule')
    ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistrationCertificationModule_CertificationModule]
    FOREIGN KEY (CertificationModuleKey) REFERENCES [CertificationModule] (CertificationModuleKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule] CHECK CONSTRAINT [FK_CertificationProgramRegistrationCertificationModule_CertificationModule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistrationCertificationModule' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistration')
    ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistration]
    FOREIGN KEY (CertificationProgramRegistrationKey) REFERENCES [CertificationProgramRegistration] (CertificationProgramRegistrationKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistrationCertificationModule] CHECK CONSTRAINT [FK_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistration]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ChangeLog' AND [CONSTRAINT_NAME] = 'FK_ChangeLog_OrganizationMain')
    ALTER TABLE [dbo].[ChangeLog] WITH CHECK ADD CONSTRAINT [FK_ChangeLog_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [FK_ChangeLog_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ChangeLog' AND [CONSTRAINT_NAME] = 'FK_ChangeLog_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ChangeLog] WITH CHECK ADD CONSTRAINT [FK_ChangeLog_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [FK_ChangeLog_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ChangeProperty' AND [CONSTRAINT_NAME] = 'FK_ChangeProperty_ChangeLog')
    ALTER TABLE [dbo].[ChangeProperty] WITH CHECK ADD CONSTRAINT [FK_ChangeProperty_ChangeLog]
    FOREIGN KEY (ChangeLogKey) REFERENCES [ChangeLog] (ChangeLogKey)
go
ALTER TABLE [dbo].[ChangeProperty] CHECK CONSTRAINT [FK_ChangeProperty_ChangeLog]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionCategory' AND [CONSTRAINT_NAME] = 'FK_CommissionCategory_SystemEntity')
    ALTER TABLE [dbo].[CommissionCategory] WITH CHECK ADD CONSTRAINT [FK_CommissionCategory_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[CommissionCategory] CHECK CONSTRAINT [FK_CommissionCategory_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionCategory' AND [CONSTRAINT_NAME] = 'FK_CommissionCategory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CommissionCategory] WITH CHECK ADD CONSTRAINT [FK_CommissionCategory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommissionCategory] CHECK CONSTRAINT [FK_CommissionCategory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionCategory' AND [CONSTRAINT_NAME] = 'FK_CommissionCategory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CommissionCategory] WITH CHECK ADD CONSTRAINT [FK_CommissionCategory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommissionCategory] CHECK CONSTRAINT [FK_CommissionCategory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlan' AND [CONSTRAINT_NAME] = 'FK_CommissionPlan_SystemEntity')
    ALTER TABLE [dbo].[CommissionPlan] WITH CHECK ADD CONSTRAINT [FK_CommissionPlan_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[CommissionPlan] CHECK CONSTRAINT [FK_CommissionPlan_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlan' AND [CONSTRAINT_NAME] = 'FK_CommissionPlan_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CommissionPlan] WITH CHECK ADD CONSTRAINT [FK_CommissionPlan_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommissionPlan] CHECK CONSTRAINT [FK_CommissionPlan_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlan' AND [CONSTRAINT_NAME] = 'FK_CommissionPlan_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CommissionPlan] WITH CHECK ADD CONSTRAINT [FK_CommissionPlan_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommissionPlan] CHECK CONSTRAINT [FK_CommissionPlan_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlanRate' AND [CONSTRAINT_NAME] = 'FK_CommissionPlanRate_CommissionCategory')
    ALTER TABLE [dbo].[CommissionPlanRate] WITH CHECK ADD CONSTRAINT [FK_CommissionPlanRate_CommissionCategory]
    FOREIGN KEY (CommissionCategoryKey) REFERENCES [CommissionCategory] (CommissionCategoryKey)
go
ALTER TABLE [dbo].[CommissionPlanRate] CHECK CONSTRAINT [FK_CommissionPlanRate_CommissionCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlanRate' AND [CONSTRAINT_NAME] = 'FK_CommissionPlanRate_CommissionPlan')
    ALTER TABLE [dbo].[CommissionPlanRate] WITH CHECK ADD CONSTRAINT [FK_CommissionPlanRate_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[CommissionPlanRate] CHECK CONSTRAINT [FK_CommissionPlanRate_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommissionPlanRate' AND [CONSTRAINT_NAME] = 'FK_CommissionPlanRate_CommissionRateTypeRef')
    ALTER TABLE [dbo].[CommissionPlanRate] WITH CHECK ADD CONSTRAINT [FK_CommissionPlanRate_CommissionRateTypeRef]
    FOREIGN KEY (CommissionRateTypeCode) REFERENCES [CommissionRateTypeRef] (CommissionRateTypeCode)
go
ALTER TABLE [dbo].[CommissionPlanRate] CHECK CONSTRAINT [FK_CommissionPlanRate_CommissionRateTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Commitment' AND [CONSTRAINT_NAME] = 'FK_Commitment_ProductInventory')
    ALTER TABLE [dbo].[Commitment] WITH CHECK ADD CONSTRAINT [FK_Commitment_ProductInventory]
    FOREIGN KEY (ProductInventoryKey) REFERENCES [ProductInventory] (ProductInventoryKey)
go
ALTER TABLE [dbo].[Commitment] CHECK CONSTRAINT [FK_Commitment_ProductInventory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Commitment' AND [CONSTRAINT_NAME] = 'FK_Commitment_UniformRegistry')
    ALTER TABLE [dbo].[Commitment] WITH CHECK ADD CONSTRAINT [FK_Commitment_UniformRegistry]
    FOREIGN KEY (CommitmentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Commitment] CHECK CONSTRAINT [FK_Commitment_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Commitment' AND [CONSTRAINT_NAME] = 'FK_Commitment_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Commitment] WITH CHECK ADD CONSTRAINT [FK_Commitment_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Commitment] CHECK CONSTRAINT [FK_Commitment_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Commitment' AND [CONSTRAINT_NAME] = 'FK_Commitment_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Commitment] WITH CHECK ADD CONSTRAINT [FK_Commitment_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Commitment] CHECK CONSTRAINT [FK_Commitment_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationReasonRef' AND [CONSTRAINT_NAME] = 'FK_CommunicationReasonRef_UniformRegistry')
    ALTER TABLE [dbo].[CommunicationReasonRef] WITH CHECK ADD CONSTRAINT [FK_CommunicationReasonRef_UniformRegistry]
    FOREIGN KEY (CommunicationReasonKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[CommunicationReasonRef] CHECK CONSTRAINT [FK_CommunicationReasonRef_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CompanyNaicsSic' AND [CONSTRAINT_NAME] = 'FK_CompanyNaicsSic_Institute')
    ALTER TABLE [dbo].[CompanyNaicsSic] WITH CHECK ADD CONSTRAINT [FK_CompanyNaicsSic_Institute]
    FOREIGN KEY (ContactKey) REFERENCES [Institute] (ContactKey)
go
ALTER TABLE [dbo].[CompanyNaicsSic] CHECK CONSTRAINT [FK_CompanyNaicsSic_Institute]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Email' AND [CONSTRAINT_NAME] = 'FK_ComponentEmail_Component')
    ALTER TABLE [dbo].[Component_Email] WITH CHECK ADD CONSTRAINT [FK_ComponentEmail_Component]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Component_Email] CHECK CONSTRAINT [FK_ComponentEmail_Component]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Email_Variable_Ref' AND [CONSTRAINT_NAME] = 'FK_ComponentEmailVar_CompEmail')
    ALTER TABLE [dbo].[Component_Email_Variable_Ref] WITH CHECK ADD CONSTRAINT [FK_ComponentEmailVar_CompEmail]
    FOREIGN KEY (ComponentCode, ComponentEmailCode, CustomForClientFlag) REFERENCES [Component_Email] (ComponentCode, ComponentEmailCode, CustomForClientFlag)
go
ALTER TABLE [dbo].[Component_Email_Variable_Ref] CHECK CONSTRAINT [FK_ComponentEmailVar_CompEmail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Interest_Category' AND [CONSTRAINT_NAME] = 'FK_ComponentIntCat_Comp')
    ALTER TABLE [dbo].[Component_Interest_Category] WITH CHECK ADD CONSTRAINT [FK_ComponentIntCat_Comp]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Component_Interest_Category] CHECK CONSTRAINT [FK_ComponentIntCat_Comp]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Interest_Category' AND [CONSTRAINT_NAME] = 'FK_ComponentIntCat_IntCat')
    ALTER TABLE [dbo].[Component_Interest_Category] WITH CHECK ADD CONSTRAINT [FK_ComponentIntCat_IntCat]
    FOREIGN KEY (InterestCategoryID) REFERENCES [Interest_Category] (InterestCategoryID)
go
ALTER TABLE [dbo].[Component_Interest_Category] CHECK CONSTRAINT [FK_ComponentIntCat_IntCat]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Interest_Group' AND [CONSTRAINT_NAME] = 'FK_Component_Interest_Group_Interest_Category')
    ALTER TABLE [dbo].[Component_Interest_Group] WITH CHECK ADD CONSTRAINT [FK_Component_Interest_Group_Interest_Category]
    FOREIGN KEY (InterestCategoryID) REFERENCES [Interest_Category] (InterestCategoryID)
go
ALTER TABLE [dbo].[Component_Interest_Group] CHECK CONSTRAINT [FK_Component_Interest_Group_Interest_Category]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Component_Script_Ref' AND [CONSTRAINT_NAME] = 'FK_ComponentScript_Component')
    ALTER TABLE [dbo].[Component_Script_Ref] WITH CHECK ADD CONSTRAINT [FK_ComponentScript_Component]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Component_Script_Ref] CHECK CONSTRAINT [FK_ComponentScript_Component]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ComponentRegistryCategory' AND [CONSTRAINT_NAME] = 'FK_ComponentRegistryCategory_ComponentCategoryRef')
    ALTER TABLE [dbo].[ComponentRegistryCategory] WITH CHECK ADD CONSTRAINT [FK_ComponentRegistryCategory_ComponentCategoryRef]
    FOREIGN KEY (ComponentCategoryKey) REFERENCES [ComponentCategoryRef] (ComponentCategoryKey)
go
ALTER TABLE [dbo].[ComponentRegistryCategory] CHECK CONSTRAINT [FK_ComponentRegistryCategory_ComponentCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ComponentRegistryCategory' AND [CONSTRAINT_NAME] = 'FK_ComponentRegistryCategory_ComponentRegistry')
    ALTER TABLE [dbo].[ComponentRegistryCategory] WITH CHECK ADD CONSTRAINT [FK_ComponentRegistryCategory_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[ComponentRegistryCategory] CHECK CONSTRAINT [FK_ComponentRegistryCategory_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ComponentResourceActionRef' AND [CONSTRAINT_NAME] = 'FK_ComponentResourceActionRef_ComponentRegistry')
    ALTER TABLE [dbo].[ComponentResourceActionRef] WITH CHECK ADD CONSTRAINT [FK_ComponentResourceActionRef_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[ComponentResourceActionRef] CHECK CONSTRAINT [FK_ComponentResourceActionRef_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ComponentResourceActionRef' AND [CONSTRAINT_NAME] = 'FK_ComponentResourceActionRef_ResourceActionRef')
    ALTER TABLE [dbo].[ComponentResourceActionRef] WITH CHECK ADD CONSTRAINT [FK_ComponentResourceActionRef_ResourceActionRef]
    FOREIGN KEY (ResourceActionKey) REFERENCES [ResourceActionRef] (ResourceActionKey)
go
ALTER TABLE [dbo].[ComponentResourceActionRef] CHECK CONSTRAINT [FK_ComponentResourceActionRef_ResourceActionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactAddress' AND [CONSTRAINT_NAME] = 'FK_ContactAddress_AddressCategoryRef')
    ALTER TABLE [dbo].[ContactAddress] WITH CHECK ADD CONSTRAINT [FK_ContactAddress_AddressCategoryRef]
    FOREIGN KEY (AddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_AddressCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactAddress' AND [CONSTRAINT_NAME] = 'FK_ContactAddress_AddressMain')
    ALTER TABLE [dbo].[ContactAddress] WITH CHECK ADD CONSTRAINT [FK_ContactAddress_AddressMain]
    FOREIGN KEY (AddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_AddressMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactAddress' AND [CONSTRAINT_NAME] = 'FK_ContactAddress_AddressTypeRef')
    ALTER TABLE [dbo].[ContactAddress] WITH CHECK ADD CONSTRAINT [FK_ContactAddress_AddressTypeRef]
    FOREIGN KEY (AddressTypeKey) REFERENCES [AddressTypeRef] (AddressTypeKey)
go
ALTER TABLE [dbo].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_AddressTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactAddress' AND [CONSTRAINT_NAME] = 'FK_ContactAddress_ContactMain')
    ALTER TABLE [dbo].[ContactAddress] WITH CHECK ADD CONSTRAINT [FK_ContactAddress_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactBiography' AND [CONSTRAINT_NAME] = 'FK_ContactBio_ContactMain')
    ALTER TABLE [dbo].[ContactBiography] WITH CHECK ADD CONSTRAINT [FK_ContactBio_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactBiography] CHECK CONSTRAINT [FK_ContactBio_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactBiography' AND [CONSTRAINT_NAME] = 'FK_ContactBiography_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ContactBiography] WITH CHECK ADD CONSTRAINT [FK_ContactBiography_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactBiography] CHECK CONSTRAINT [FK_ContactBiography_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_ContactMain')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_ContactMain_BillTo')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_GroupMain')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_PaymentTerms')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_PriceSheet')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommerce' AND [CONSTRAINT_NAME] = 'FK_ContactCommerce_TaxSchedule')
    ALTER TABLE [dbo].[ContactCommerce] WITH CHECK ADD CONSTRAINT [FK_ContactCommerce_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[ContactCommerce] CHECK CONSTRAINT [FK_ContactCommerce_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommunicationReasonPreferences' AND [CONSTRAINT_NAME] = 'FK_ContactCommunicationReasonPreferences_AddressCategoryRef')
    ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] WITH CHECK ADD CONSTRAINT [FK_ContactCommunicationReasonPreferences_AddressCategoryRef]
    FOREIGN KEY (PreferredAddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] CHECK CONSTRAINT [FK_ContactCommunicationReasonPreferences_AddressCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommunicationReasonPreferences' AND [CONSTRAINT_NAME] = 'FK_ContactCommunicationReasonPreferences_CommunicationReasonRef')
    ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] WITH CHECK ADD CONSTRAINT [FK_ContactCommunicationReasonPreferences_CommunicationReasonRef]
    FOREIGN KEY (CommunicationReasonKey) REFERENCES [CommunicationReasonRef] (CommunicationReasonKey)
go
ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] CHECK CONSTRAINT [FK_ContactCommunicationReasonPreferences_CommunicationReasonRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommunicationReasonPreferences' AND [CONSTRAINT_NAME] = 'FK_ContactCommunicationReasonPreferences_ContactMain')
    ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] WITH CHECK ADD CONSTRAINT [FK_ContactCommunicationReasonPreferences_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] CHECK CONSTRAINT [FK_ContactCommunicationReasonPreferences_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactDuplicateCheckFormula' AND [CONSTRAINT_NAME] = 'FK_ContactDuplicateCheckFormula_SystemEntity')
    ALTER TABLE [dbo].[ContactDuplicateCheckFormula] WITH CHECK ADD CONSTRAINT [FK_ContactDuplicateCheckFormula_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ContactDuplicateCheckFormula] CHECK CONSTRAINT [FK_ContactDuplicateCheckFormula_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactDuplicateCheckFormula' AND [CONSTRAINT_NAME] = 'FK_ContactDuplicateCheckFormula_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ContactDuplicateCheckFormula] WITH CHECK ADD CONSTRAINT [FK_ContactDuplicateCheckFormula_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactDuplicateCheckFormula] CHECK CONSTRAINT [FK_ContactDuplicateCheckFormula_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactDuplicateCheckFormula' AND [CONSTRAINT_NAME] = 'FK_ContactDuplicateCheckFormula_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ContactDuplicateCheckFormula] WITH CHECK ADD CONSTRAINT [FK_ContactDuplicateCheckFormula_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactDuplicateCheckFormula] CHECK CONSTRAINT [FK_ContactDuplicateCheckFormula_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactEducation' AND [CONSTRAINT_NAME] = 'FK_ContactEducation_EducationRef')
    ALTER TABLE [dbo].[ContactEducation] WITH CHECK ADD CONSTRAINT [FK_ContactEducation_EducationRef]
    FOREIGN KEY (EducationLevelCode) REFERENCES [EducationLevelRef] (EducationLevelCode)
go
ALTER TABLE [dbo].[ContactEducation] CHECK CONSTRAINT [FK_ContactEducation_EducationRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactEducation' AND [CONSTRAINT_NAME] = 'FK_ContactEducation_Individual')
    ALTER TABLE [dbo].[ContactEducation] WITH CHECK ADD CONSTRAINT [FK_ContactEducation_Individual]
    FOREIGN KEY (ContactKey) REFERENCES [Individual] (ContactKey)
go
ALTER TABLE [dbo].[ContactEducation] CHECK CONSTRAINT [FK_ContactEducation_Individual]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactEducation' AND [CONSTRAINT_NAME] = 'FK_ContactEducation_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ContactEducation] WITH CHECK ADD CONSTRAINT [FK_ContactEducation_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactEducation] CHECK CONSTRAINT [FK_ContactEducation_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactFundraising' AND [CONSTRAINT_NAME] = 'FK_ContactFundRaising_ContactMain')
    ALTER TABLE [dbo].[ContactFundraising] WITH CHECK ADD CONSTRAINT [FK_ContactFundRaising_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactFundraising] CHECK CONSTRAINT [FK_ContactFundRaising_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactFundraising' AND [CONSTRAINT_NAME] = 'FK_ContactFundraising_FundraisingPreferenceRef_Receipt')
    ALTER TABLE [dbo].[ContactFundraising] WITH CHECK ADD CONSTRAINT [FK_ContactFundraising_FundraisingPreferenceRef_Receipt]
    FOREIGN KEY (ReceiptPreferenceCode) REFERENCES [FundraisingPreferenceRef] (FundraisingPreferenceCode)
go
ALTER TABLE [dbo].[ContactFundraising] CHECK CONSTRAINT [FK_ContactFundraising_FundraisingPreferenceRef_Receipt]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactFundraising' AND [CONSTRAINT_NAME] = 'FK_ContactFundRaising_GroupMain_SoftCredit')
    ALTER TABLE [dbo].[ContactFundraising] WITH CHECK ADD CONSTRAINT [FK_ContactFundRaising_GroupMain_SoftCredit]
    FOREIGN KEY (SoftCreditGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ContactFundraising] CHECK CONSTRAINT [FK_ContactFundRaising_GroupMain_SoftCredit]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactFundraising' AND [CONSTRAINT_NAME] = 'FK_ContactFundRaising_GroupMain_Solicitor')
    ALTER TABLE [dbo].[ContactFundraising] WITH CHECK ADD CONSTRAINT [FK_ContactFundRaising_GroupMain_Solicitor]
    FOREIGN KEY (SolicitorGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ContactFundraising] CHECK CONSTRAINT [FK_ContactFundRaising_GroupMain_Solicitor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactLog' AND [CONSTRAINT_NAME] = 'FK_ContactLog_ContactMain')
    ALTER TABLE [dbo].[ContactLog] WITH CHECK ADD CONSTRAINT [FK_ContactLog_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactLog] CHECK CONSTRAINT [FK_ContactLog_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactLog' AND [CONSTRAINT_NAME] = 'FK_ContactLog_OrganizationMain')
    ALTER TABLE [dbo].[ContactLog] WITH CHECK ADD CONSTRAINT [FK_ContactLog_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[ContactLog] CHECK CONSTRAINT [FK_ContactLog_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactLog' AND [CONSTRAINT_NAME] = 'FK_ContactLog_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ContactLog] WITH CHECK ADD CONSTRAINT [FK_ContactLog_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactLog] CHECK CONSTRAINT [FK_ContactLog_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_AccessMain')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_AddressCategoryRef_Preferred')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_AddressCategoryRef_Preferred]
    FOREIGN KEY (PreferredAddressCategoryCode) REFERENCES [AddressCategoryRef] (AddressCategoryCode)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_AddressCategoryRef_Preferred]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_ContactStatusRef')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_ContactStatusRef]
    FOREIGN KEY (ContactStatusCode) REFERENCES [ContactStatusRef] (ContactStatusCode)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_ContactStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_ContactTypeRef')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_ContactTypeRef]
    FOREIGN KEY (ContactTypeKey) REFERENCES [ContactTypeRef] (ContactTypeKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_ContactTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_GroupMain_PrimaryMembership')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_GroupMain_PrimaryMembership]
    FOREIGN KEY (PrimaryMembershipGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_GroupMain_PrimaryMembership]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_UniformRegistry')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_UniformRegistry]
    FOREIGN KEY (ContactKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactMain' AND [CONSTRAINT_NAME] = 'FK_ContactMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ContactMain] WITH CHECK ADD CONSTRAINT [FK_ContactMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactMain] CHECK CONSTRAINT [FK_ContactMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactOffering' AND [CONSTRAINT_NAME] = 'FK_ContactOffering_ContactBio')
    ALTER TABLE [dbo].[ContactOffering] WITH CHECK ADD CONSTRAINT [FK_ContactOffering_ContactBio]
    FOREIGN KEY (ContactKey) REFERENCES [ContactBiography] (ContactKey)
go
ALTER TABLE [dbo].[ContactOffering] CHECK CONSTRAINT [FK_ContactOffering_ContactBio]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactOffering' AND [CONSTRAINT_NAME] = 'FK_ContactOffering_ContactOfferringRef')
    ALTER TABLE [dbo].[ContactOffering] WITH CHECK ADD CONSTRAINT [FK_ContactOffering_ContactOfferringRef]
    FOREIGN KEY (ContactOfferingKey) REFERENCES [ContactOfferingRef] (ContactOfferingKey)
go
ALTER TABLE [dbo].[ContactOffering] CHECK CONSTRAINT [FK_ContactOffering_ContactOfferringRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactPicture' AND [CONSTRAINT_NAME] = 'FK_ContactPicture_ContactMain')
    ALTER TABLE [dbo].[ContactPicture] WITH CHECK ADD CONSTRAINT [FK_ContactPicture_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactPicture] CHECK CONSTRAINT [FK_ContactPicture_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactPicture' AND [CONSTRAINT_NAME] = 'FK_ContactPicture_PicturePurposeRef')
    ALTER TABLE [dbo].[ContactPicture] WITH CHECK ADD CONSTRAINT [FK_ContactPicture_PicturePurposeRef]
    FOREIGN KEY (PicturePurposeKey) REFERENCES [PicturePurposeRef] (PicturePurposeKey)
go
ALTER TABLE [dbo].[ContactPicture] CHECK CONSTRAINT [FK_ContactPicture_PicturePurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactPicture' AND [CONSTRAINT_NAME] = 'FK_ContactPicture_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ContactPicture] WITH CHECK ADD CONSTRAINT [FK_ContactPicture_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactPicture] CHECK CONSTRAINT [FK_ContactPicture_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSalutation' AND [CONSTRAINT_NAME] = 'FK_ContactSalutation_ContactMain')
    ALTER TABLE [dbo].[ContactSalutation] WITH CHECK ADD CONSTRAINT [FK_ContactSalutation_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactSalutation] CHECK CONSTRAINT [FK_ContactSalutation_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSalutation' AND [CONSTRAINT_NAME] = 'FK_ContactSalutation_SalutationRef')
    ALTER TABLE [dbo].[ContactSalutation] WITH CHECK ADD CONSTRAINT [FK_ContactSalutation_SalutationRef]
    FOREIGN KEY (SalutationKey) REFERENCES [SalutationRef] (SalutationKey)
go
ALTER TABLE [dbo].[ContactSalutation] CHECK CONSTRAINT [FK_ContactSalutation_SalutationRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSkill' AND [CONSTRAINT_NAME] = 'FK_ContactSkill_ContactBio')
    ALTER TABLE [dbo].[ContactSkill] WITH CHECK ADD CONSTRAINT [FK_ContactSkill_ContactBio]
    FOREIGN KEY (ContactKey) REFERENCES [ContactBiography] (ContactKey)
go
ALTER TABLE [dbo].[ContactSkill] CHECK CONSTRAINT [FK_ContactSkill_ContactBio]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSkill' AND [CONSTRAINT_NAME] = 'FK_ContactSkill_ContactSkillRef')
    ALTER TABLE [dbo].[ContactSkill] WITH CHECK ADD CONSTRAINT [FK_ContactSkill_ContactSkillRef]
    FOREIGN KEY (ContactSkillKey) REFERENCES [ContactSkillRef] (ContactSkillKey)
go
ALTER TABLE [dbo].[ContactSkill] CHECK CONSTRAINT [FK_ContactSkill_ContactSkillRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactTypeRef' AND [CONSTRAINT_NAME] = 'FK_ContactTypeRef_GroupTypeRef')
    ALTER TABLE [dbo].[ContactTypeRef] WITH CHECK ADD CONSTRAINT [FK_ContactTypeRef_GroupTypeRef]
    FOREIGN KEY (GroupTypeKey) REFERENCES [GroupTypeRef] (GroupTypeKey)
go
ALTER TABLE [dbo].[ContactTypeRef] CHECK CONSTRAINT [FK_ContactTypeRef_GroupTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Component_Ref')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Component_Ref]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Component_Ref]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Content')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Content]
    FOREIGN KEY (PreviousContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Content_OriginalContentID')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Content_OriginalContentID]
    FOREIGN KEY (OriginalContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content_OriginalContentID]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_NavMenu')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_NavMenu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_NavMenu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_Producer')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_Producer]
    FOREIGN KEY (OwnerContactID) REFERENCES [Producer] (ContactID)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Producer]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content' AND [CONSTRAINT_NAME] = 'FK_Content_WorkflowStatus')
    ALTER TABLE [dbo].[Content] WITH CHECK ADD CONSTRAINT [FK_Content_WorkflowStatus]
    FOREIGN KEY (WorkflowStatusCode) REFERENCES [Workflow_Status_Ref] (WorkflowStatusCode)
go
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_WorkflowStatus]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Authority_Producer' AND [CONSTRAINT_NAME] = 'FK_ContentAuthorityProd_CAG')
    ALTER TABLE [dbo].[Content_Authority_Producer] WITH CHECK ADD CONSTRAINT [FK_ContentAuthorityProd_CAG]
    FOREIGN KEY (ContentAuthorityGroupID) REFERENCES [Content_Authority_Group] (ContentAuthorityGroupID)
go
ALTER TABLE [dbo].[Content_Authority_Producer] CHECK CONSTRAINT [FK_ContentAuthorityProd_CAG]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Authority_Producer' AND [CONSTRAINT_NAME] = 'FK_ContentAuthorityProd_Prod')
    ALTER TABLE [dbo].[Content_Authority_Producer] WITH CHECK ADD CONSTRAINT [FK_ContentAuthorityProd_Prod]
    FOREIGN KEY (ContactID) REFERENCES [Producer] (ContactID)
go
ALTER TABLE [dbo].[Content_Authority_Producer] CHECK CONSTRAINT [FK_ContentAuthorityProd_Prod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Change_Request' AND [CONSTRAINT_NAME] = 'FK_Content_Change_Request_Content')
    ALTER TABLE [dbo].[Content_Change_Request] WITH CHECK ADD CONSTRAINT [FK_Content_Change_Request_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_Change_Request] CHECK CONSTRAINT [FK_Content_Change_Request_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Change_Request' AND [CONSTRAINT_NAME] = 'FK_Content_Change_Request_Request_Status_Ref')
    ALTER TABLE [dbo].[Content_Change_Request] WITH CHECK ADD CONSTRAINT [FK_Content_Change_Request_Request_Status_Ref]
    FOREIGN KEY (RequestStatusCode) REFERENCES [Request_Status_Ref] (RequestStatusCode)
go
ALTER TABLE [dbo].[Content_Change_Request] CHECK CONSTRAINT [FK_Content_Change_Request_Request_Status_Ref]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_File' AND [CONSTRAINT_NAME] = 'FK_Content_File_Content')
    ALTER TABLE [dbo].[Content_File] WITH CHECK ADD CONSTRAINT [FK_Content_File_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_File] CHECK CONSTRAINT [FK_Content_File_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_File' AND [CONSTRAINT_NAME] = 'FK_Content_File_OriginalContentFileID')
    ALTER TABLE [dbo].[Content_File] WITH CHECK ADD CONSTRAINT [FK_Content_File_OriginalContentFileID]
    FOREIGN KEY (OriginalContentFileID) REFERENCES [Content_File] (ContentFileID)
go
ALTER TABLE [dbo].[Content_File] CHECK CONSTRAINT [FK_Content_File_OriginalContentFileID]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_File' AND [CONSTRAINT_NAME] = 'FK_Content_File_PreviousContentFileID')
    ALTER TABLE [dbo].[Content_File] WITH CHECK ADD CONSTRAINT [FK_Content_File_PreviousContentFileID]
    FOREIGN KEY (PreviousContentFileID) REFERENCES [Content_File] (ContentFileID)
go
ALTER TABLE [dbo].[Content_File] CHECK CONSTRAINT [FK_Content_File_PreviousContentFileID]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_File' AND [CONSTRAINT_NAME] = 'FK_ContentFile_FileType')
    ALTER TABLE [dbo].[Content_File] WITH CHECK ADD CONSTRAINT [FK_ContentFile_FileType]
    FOREIGN KEY (FileTypeCode) REFERENCES [File_Type_Ref] (FileTypeCode)
go
ALTER TABLE [dbo].[Content_File] CHECK CONSTRAINT [FK_ContentFile_FileType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_HTML' AND [CONSTRAINT_NAME] = 'FK_Content_HTML_Content')
    ALTER TABLE [dbo].[Content_HTML] WITH CHECK ADD CONSTRAINT [FK_Content_HTML_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_HTML] CHECK CONSTRAINT [FK_Content_HTML_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Link' AND [CONSTRAINT_NAME] = 'FK_Content_Link_Content')
    ALTER TABLE [dbo].[Content_Link] WITH CHECK ADD CONSTRAINT [FK_Content_Link_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_Link] CHECK CONSTRAINT [FK_Content_Link_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Link' AND [CONSTRAINT_NAME] = 'FK_Content_Link_PreviousContentLinkID')
    ALTER TABLE [dbo].[Content_Link] WITH CHECK ADD CONSTRAINT [FK_Content_Link_PreviousContentLinkID]
    FOREIGN KEY (PreviousContentLinkID) REFERENCES [Content_Link] (ContentLinkID)
go
ALTER TABLE [dbo].[Content_Link] CHECK CONSTRAINT [FK_Content_Link_PreviousContentLinkID]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Security_Group' AND [CONSTRAINT_NAME] = 'FK_Content_Security_Group_Content')
    ALTER TABLE [dbo].[Content_Security_Group] WITH CHECK ADD CONSTRAINT [FK_Content_Security_Group_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_Security_Group] CHECK CONSTRAINT [FK_Content_Security_Group_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_ContentWorkLog_Content')
    ALTER TABLE [dbo].[Content_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_ContentWorkLog_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Content_Workflow_Log] CHECK CONSTRAINT [FK_ContentWorkLog_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Content_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_ContentWorkLog_Workflow')
    ALTER TABLE [dbo].[Content_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_ContentWorkLog_Workflow]
    FOREIGN KEY (WorkflowStatusCode) REFERENCES [Workflow_Status_Ref] (WorkflowStatusCode)
go
ALTER TABLE [dbo].[Content_Workflow_Log] CHECK CONSTRAINT [FK_ContentWorkLog_Workflow]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentChangeRequest' AND [CONSTRAINT_NAME] = 'FK_ContentChangeRequest_UniformRegistry')
    ALTER TABLE [dbo].[ContentChangeRequest] WITH CHECK ADD CONSTRAINT [FK_ContentChangeRequest_UniformRegistry]
    FOREIGN KEY (ContentDocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ContentChangeRequest] CHECK CONSTRAINT [FK_ContentChangeRequest_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentChangeRequest' AND [CONSTRAINT_NAME] = 'FK_ContentChangeRequest_UserMain_AssignedBy')
    ALTER TABLE [dbo].[ContentChangeRequest] WITH CHECK ADD CONSTRAINT [FK_ContentChangeRequest_UserMain_AssignedBy]
    FOREIGN KEY (AssignedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContentChangeRequest] CHECK CONSTRAINT [FK_ContentChangeRequest_UserMain_AssignedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentChangeRequest' AND [CONSTRAINT_NAME] = 'FK_ContentChangeRequest_UserMain_AssignedTo')
    ALTER TABLE [dbo].[ContentChangeRequest] WITH CHECK ADD CONSTRAINT [FK_ContentChangeRequest_UserMain_AssignedTo]
    FOREIGN KEY (AssignedToUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContentChangeRequest] CHECK CONSTRAINT [FK_ContentChangeRequest_UserMain_AssignedTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentChangeRequest' AND [CONSTRAINT_NAME] = 'FK_ContentChangeRequest_UserMain_ReassignedTo')
    ALTER TABLE [dbo].[ContentChangeRequest] WITH CHECK ADD CONSTRAINT [FK_ContentChangeRequest_UserMain_ReassignedTo]
    FOREIGN KEY (ReassignedToUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContentChangeRequest] CHECK CONSTRAINT [FK_ContentChangeRequest_UserMain_ReassignedTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentManagerAuthorityGroup' AND [CONSTRAINT_NAME] = 'FK_ContentManagerAuthorityGroup_GroupMain')
    ALTER TABLE [dbo].[ContentManagerAuthorityGroup] WITH CHECK ADD CONSTRAINT [FK_ContentManagerAuthorityGroup_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ContentManagerAuthorityGroup] CHECK CONSTRAINT [FK_ContentManagerAuthorityGroup_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentUserDefinedFieldValue' AND [CONSTRAINT_NAME] = 'FK_ContentUserDefinedFieldValue_UserDefinedFieldRef')
    ALTER TABLE [dbo].[ContentUserDefinedFieldValue] WITH CHECK ADD CONSTRAINT [FK_ContentUserDefinedFieldValue_UserDefinedFieldRef]
    FOREIGN KEY (UserDefinedFieldKey) REFERENCES [UserDefinedFieldRef] (UserDefinedFieldKey)
go
ALTER TABLE [dbo].[ContentUserDefinedFieldValue] CHECK CONSTRAINT [FK_ContentUserDefinedFieldValue_UserDefinedFieldRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentWorkflowParameters' AND [CONSTRAINT_NAME] = 'FK_ContentWorkflowParameters_ContentManagerAuthorityGroup')
    ALTER TABLE [dbo].[ContentWorkflowParameters] WITH CHECK ADD CONSTRAINT [FK_ContentWorkflowParameters_ContentManagerAuthorityGroup]
    FOREIGN KEY (ContentAuthorityGroupKey) REFERENCES [ContentManagerAuthorityGroup] (GroupKey)
go
ALTER TABLE [dbo].[ContentWorkflowParameters] CHECK CONSTRAINT [FK_ContentWorkflowParameters_ContentManagerAuthorityGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentWorkflowParameters' AND [CONSTRAINT_NAME] = 'FK_ContentWorkflowParameters_GroupMember')
    ALTER TABLE [dbo].[ContentWorkflowParameters] WITH CHECK ADD CONSTRAINT [FK_ContentWorkflowParameters_GroupMember]
    FOREIGN KEY (OwnerGroupMemberKey) REFERENCES [GroupMember] (GroupMemberKey)
go
ALTER TABLE [dbo].[ContentWorkflowParameters] CHECK CONSTRAINT [FK_ContentWorkflowParameters_GroupMember]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContentWorkflowParameters' AND [CONSTRAINT_NAME] = 'FK_ContentWorkflowParameters_UniformRegistry')
    ALTER TABLE [dbo].[ContentWorkflowParameters] WITH CHECK ADD CONSTRAINT [FK_ContentWorkflowParameters_UniformRegistry]
    FOREIGN KEY (DocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ContentWorkflowParameters] CHECK CONSTRAINT [FK_ContentWorkflowParameters_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CostTier' AND [CONSTRAINT_NAME] = 'FK_CostTier_CostMethodRef')
    ALTER TABLE [dbo].[CostTier] WITH CHECK ADD CONSTRAINT [FK_CostTier_CostMethodRef]
    FOREIGN KEY (CostMethodCode) REFERENCES [CostMethodRef] (CostMethodCode)
go
ALTER TABLE [dbo].[CostTier] CHECK CONSTRAINT [FK_CostTier_CostMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CostTier' AND [CONSTRAINT_NAME] = 'FK_CostTier_ProductInventory')
    ALTER TABLE [dbo].[CostTier] WITH CHECK ADD CONSTRAINT [FK_CostTier_ProductInventory]
    FOREIGN KEY (ProductInventoryKey) REFERENCES [ProductInventory] (ProductInventoryKey)
go
ALTER TABLE [dbo].[CostTier] CHECK CONSTRAINT [FK_CostTier_ProductInventory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CostTier' AND [CONSTRAINT_NAME] = 'FK_CostTier_ProductMain')
    ALTER TABLE [dbo].[CostTier] WITH CHECK ADD CONSTRAINT [FK_CostTier_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[CostTier] CHECK CONSTRAINT [FK_CostTier_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CostTier' AND [CONSTRAINT_NAME] = 'FK_CostTier_Uom')
    ALTER TABLE [dbo].[CostTier] WITH CHECK ADD CONSTRAINT [FK_CostTier_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[CostTier] CHECK CONSTRAINT [FK_CostTier_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CostTier' AND [CONSTRAINT_NAME] = 'FK_CostTier_Warehouse')
    ALTER TABLE [dbo].[CostTier] WITH CHECK ADD CONSTRAINT [FK_CostTier_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[CostTier] CHECK CONSTRAINT [FK_CostTier_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CountryRef' AND [CONSTRAINT_NAME] = 'FK_CountryRef_AddressFormatRef')
    ALTER TABLE [dbo].[CountryRef] WITH CHECK ADD CONSTRAINT [FK_CountryRef_AddressFormatRef]
    FOREIGN KEY (AddressFormatKey) REFERENCES [AddressFormatRef] (AddressFormatKey)
go
ALTER TABLE [dbo].[CountryRef] CHECK CONSTRAINT [FK_CountryRef_AddressFormatRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CountryRef' AND [CONSTRAINT_NAME] = 'FK_CountryRef_GroupMain_Chapter')
    ALTER TABLE [dbo].[CountryRef] WITH CHECK ADD CONSTRAINT [FK_CountryRef_GroupMain_Chapter]
    FOREIGN KEY (ChapterGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[CountryRef] CHECK CONSTRAINT [FK_CountryRef_GroupMain_Chapter]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CountryRef' AND [CONSTRAINT_NAME] = 'FK_CountryRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CountryRef] WITH CHECK ADD CONSTRAINT [FK_CountryRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CountryRef] CHECK CONSTRAINT [FK_CountryRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Currency' AND [CONSTRAINT_NAME] = 'FK_Currency_CultureRef')
    ALTER TABLE [dbo].[Currency] WITH CHECK ADD CONSTRAINT [FK_Currency_CultureRef]
    FOREIGN KEY (CultureCode) REFERENCES [CultureRef] (CultureCode)
go
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_CultureRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Currency' AND [CONSTRAINT_NAME] = 'FK_Currency_RoundingMultipleRef')
    ALTER TABLE [dbo].[Currency] WITH CHECK ADD CONSTRAINT [FK_Currency_RoundingMultipleRef]
    FOREIGN KEY (RoundingMultipleKey) REFERENCES [RoundingMultipleRef] (RoundingMultipleKey)
go
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_RoundingMultipleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Currency' AND [CONSTRAINT_NAME] = 'FK_Currency_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Currency] WITH CHECK ADD CONSTRAINT [FK_Currency_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Currency' AND [CONSTRAINT_NAME] = 'FK_Currency_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Currency] WITH CHECK ADD CONSTRAINT [FK_Currency_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CurrencyConversion' AND [CONSTRAINT_NAME] = 'FK_CurrencyConversion_Currency_From')
    ALTER TABLE [dbo].[CurrencyConversion] WITH CHECK ADD CONSTRAINT [FK_CurrencyConversion_Currency_From]
    FOREIGN KEY (FromCurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[CurrencyConversion] CHECK CONSTRAINT [FK_CurrencyConversion_Currency_From]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CurrencyConversion' AND [CONSTRAINT_NAME] = 'FK_CurrencyConversion_Currency_To')
    ALTER TABLE [dbo].[CurrencyConversion] WITH CHECK ADD CONSTRAINT [FK_CurrencyConversion_Currency_To]
    FOREIGN KEY (ToCurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[CurrencyConversion] CHECK CONSTRAINT [FK_CurrencyConversion_Currency_To]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CurrencyConversion' AND [CONSTRAINT_NAME] = 'FK_CurrencyConversion_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CurrencyConversion] WITH CHECK ADD CONSTRAINT [FK_CurrencyConversion_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CurrencyConversion] CHECK CONSTRAINT [FK_CurrencyConversion_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CurrencyConversion' AND [CONSTRAINT_NAME] = 'FK_CurrencyConversion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CurrencyConversion] WITH CHECK ADD CONSTRAINT [FK_CurrencyConversion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CurrencyConversion] CHECK CONSTRAINT [FK_CurrencyConversion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_CustomerExperienceStatusRef')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_CustomerExperienceStatusRef]
    FOREIGN KEY (CustomerExperienceStatusCode) REFERENCES [CustomerExperienceStatusRef] (CustomerExperienceStatusCode)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_CustomerExperienceStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_UserMain')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_CustomerExperience')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_CustomerExperience]
    FOREIGN KEY (CustomerExperienceKey) REFERENCES [CustomerExperience] (CustomerExperienceKey)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_CustomerExperience]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_CustomerExperienceStatusRef')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_CustomerExperienceStatusRef]
    FOREIGN KEY (CustomerExperienceStatusCode) REFERENCES [CustomerExperienceStatusRef] (CustomerExperienceStatusCode)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_CustomerExperienceStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_UserMain_StatusChanged')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_StatusChanged]
    FOREIGN KEY (StatusChangedUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_StatusChanged]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataTypeRef' AND [CONSTRAINT_NAME] = 'FK_DataTypeRef_HIControlTypeRef')
    ALTER TABLE [dbo].[DataTypeRef] WITH CHECK ADD CONSTRAINT [FK_DataTypeRef_HIControlTypeRef]
    FOREIGN KEY (DefaultHIControlTypeCode) REFERENCES [HIControlTypeRef] (HIControlTypeCode)
go
ALTER TABLE [dbo].[DataTypeRef] CHECK CONSTRAINT [FK_DataTypeRef_HIControlTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrix' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrix_DeferralTerms')
    ALTER TABLE [dbo].[DeferralMatrix] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrix_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[DeferralMatrix] CHECK CONSTRAINT [FK_DeferralMatrix_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrix' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrix_OrganizationMain')
    ALTER TABLE [dbo].[DeferralMatrix] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrix_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[DeferralMatrix] CHECK CONSTRAINT [FK_DeferralMatrix_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrixLine' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrixLine_DeferralMatrix')
    ALTER TABLE [dbo].[DeferralMatrixLine] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrixLine_DeferralMatrix]
    FOREIGN KEY (DeferralMatrixKey) REFERENCES [DeferralMatrix] (DeferralMatrixKey)
go
ALTER TABLE [dbo].[DeferralMatrixLine] CHECK CONSTRAINT [FK_DeferralMatrixLine_DeferralMatrix]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrixLine' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrixLine_InvoiceLine')
    ALTER TABLE [dbo].[DeferralMatrixLine] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrixLine_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[DeferralMatrixLine] CHECK CONSTRAINT [FK_DeferralMatrixLine_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrixLine' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrixLine_InvoiceMain')
    ALTER TABLE [dbo].[DeferralMatrixLine] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrixLine_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[DeferralMatrixLine] CHECK CONSTRAINT [FK_DeferralMatrixLine_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrixLineDetail' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrixLineDetail_DeferralMatrix')
    ALTER TABLE [dbo].[DeferralMatrixLineDetail] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrix]
    FOREIGN KEY (DeferralMatrixKey) REFERENCES [DeferralMatrix] (DeferralMatrixKey)
go
ALTER TABLE [dbo].[DeferralMatrixLineDetail] CHECK CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrix]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralMatrixLineDetail' AND [CONSTRAINT_NAME] = 'FK_DeferralMatrixLineDetail_DeferralMatrixLine')
    ALTER TABLE [dbo].[DeferralMatrixLineDetail] WITH CHECK ADD CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrixLine]
    FOREIGN KEY (DeferralMatrixLineKey) REFERENCES [DeferralMatrixLine] (DeferralMatrixLineKey)
go
ALTER TABLE [dbo].[DeferralMatrixLineDetail] CHECK CONSTRAINT [FK_DeferralMatrixLineDetail_DeferralMatrixLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralTerms' AND [CONSTRAINT_NAME] = 'FK_DeferralTerms_DeferralIntervalTypeRef')
    ALTER TABLE [dbo].[DeferralTerms] WITH CHECK ADD CONSTRAINT [FK_DeferralTerms_DeferralIntervalTypeRef]
    FOREIGN KEY (DeferralIntervalTypeCode) REFERENCES [DeferralIntervalTypeRef] (DeferralIntervalTypeCode)
go
ALTER TABLE [dbo].[DeferralTerms] CHECK CONSTRAINT [FK_DeferralTerms_DeferralIntervalTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralTerms' AND [CONSTRAINT_NAME] = 'FK_DeferralTerms_SystemEntity')
    ALTER TABLE [dbo].[DeferralTerms] WITH CHECK ADD CONSTRAINT [FK_DeferralTerms_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[DeferralTerms] CHECK CONSTRAINT [FK_DeferralTerms_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralTerms' AND [CONSTRAINT_NAME] = 'FK_DeferralTerms_UserMain_CreatedBy')
    ALTER TABLE [dbo].[DeferralTerms] WITH CHECK ADD CONSTRAINT [FK_DeferralTerms_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DeferralTerms] CHECK CONSTRAINT [FK_DeferralTerms_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferralTerms' AND [CONSTRAINT_NAME] = 'FK_DeferralTerms_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[DeferralTerms] WITH CHECK ADD CONSTRAINT [FK_DeferralTerms_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DeferralTerms] CHECK CONSTRAINT [FK_DeferralTerms_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredConversionWork' AND [CONSTRAINT_NAME] = 'FK_DeferredConversionWork_InvoiceLine')
    ALTER TABLE [dbo].[DeferredConversionWork] WITH CHECK ADD CONSTRAINT [FK_DeferredConversionWork_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[DeferredConversionWork] CHECK CONSTRAINT [FK_DeferredConversionWork_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredConversionWork' AND [CONSTRAINT_NAME] = 'FK_DeferredConversionWork_InvoiceMain')
    ALTER TABLE [dbo].[DeferredConversionWork] WITH CHECK ADD CONSTRAINT [FK_DeferredConversionWork_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[DeferredConversionWork] CHECK CONSTRAINT [FK_DeferredConversionWork_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredConversionWork' AND [CONSTRAINT_NAME] = 'FK_DeferredConversionWork_OrganizationMain')
    ALTER TABLE [dbo].[DeferredConversionWork] WITH CHECK ADD CONSTRAINT [FK_DeferredConversionWork_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[DeferredConversionWork] CHECK CONSTRAINT [FK_DeferredConversionWork_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredIncomeWork' AND [CONSTRAINT_NAME] = 'FK_DeferredIncomeWork_DeferralTerms')
    ALTER TABLE [dbo].[DeferredIncomeWork] WITH CHECK ADD CONSTRAINT [FK_DeferredIncomeWork_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[DeferredIncomeWork] CHECK CONSTRAINT [FK_DeferredIncomeWork_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredIncomeWork' AND [CONSTRAINT_NAME] = 'FK_DeferredIncomeWork_InvoiceLine')
    ALTER TABLE [dbo].[DeferredIncomeWork] WITH CHECK ADD CONSTRAINT [FK_DeferredIncomeWork_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[DeferredIncomeWork] CHECK CONSTRAINT [FK_DeferredIncomeWork_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredIncomeWork' AND [CONSTRAINT_NAME] = 'FK_DeferredIncomeWork_InvoiceMain')
    ALTER TABLE [dbo].[DeferredIncomeWork] WITH CHECK ADD CONSTRAINT [FK_DeferredIncomeWork_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[DeferredIncomeWork] CHECK CONSTRAINT [FK_DeferredIncomeWork_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredIncomeWork' AND [CONSTRAINT_NAME] = 'FK_DeferredIncomeWork_OrganizationMain')
    ALTER TABLE [dbo].[DeferredIncomeWork] WITH CHECK ADD CONSTRAINT [FK_DeferredIncomeWork_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[DeferredIncomeWork] CHECK CONSTRAINT [FK_DeferredIncomeWork_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DialectGatewayAccount' AND [CONSTRAINT_NAME] = 'FK_DialectGatewayAccount_GatewayAccount')
    ALTER TABLE [dbo].[DialectGatewayAccount] WITH CHECK ADD CONSTRAINT [FK_DialectGatewayAccount_GatewayAccount]
    FOREIGN KEY (GatewayAccountKey) REFERENCES [GatewayAccount] (GatewayAccountKey)
go
ALTER TABLE [dbo].[DialectGatewayAccount] CHECK CONSTRAINT [FK_DialectGatewayAccount_GatewayAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DiscountRule' AND [CONSTRAINT_NAME] = 'FK_DiscountRule_PriceBasisRef')
    ALTER TABLE [dbo].[DiscountRule] WITH CHECK ADD CONSTRAINT [FK_DiscountRule_PriceBasisRef]
    FOREIGN KEY (PriceBasisCode) REFERENCES [PriceBasisRef] (PriceBasisCode)
go
ALTER TABLE [dbo].[DiscountRule] CHECK CONSTRAINT [FK_DiscountRule_PriceBasisRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DiscountRule' AND [CONSTRAINT_NAME] = 'FK_DiscountRule_ProductMain_Promo')
    ALTER TABLE [dbo].[DiscountRule] WITH CHECK ADD CONSTRAINT [FK_DiscountRule_ProductMain_Promo]
    FOREIGN KEY (PromoProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[DiscountRule] CHECK CONSTRAINT [FK_DiscountRule_ProductMain_Promo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_AccessMain')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_AccessMain_DefaultChild')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_AccessMain_DefaultChild]
    FOREIGN KEY (DefaultChildAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_AccessMain_DefaultChild]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_DocumentStatusRef')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_DocumentStatusRef]
    FOREIGN KEY (DocumentStatusCode) REFERENCES [DocumentStatusRef] (DocumentStatusCode)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_DocumentStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_DocumentTypeRef')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_DocumentTypeRef]
    FOREIGN KEY (DocumentTypeCode) REFERENCES [DocumentTypeRef] (DocumentTypeCode)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_DocumentTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UniformRegistry')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UniformRegistry]
    FOREIGN KEY (DocumentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UniformRegistry_DocumentVersionKey')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UniformRegistry_DocumentVersionKey]
    FOREIGN KEY (DocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UniformRegistry_DocumentVersionKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UserMain_LockedBy')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_LockedBy]
    FOREIGN KEY (LockedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_LockedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UserMain_StatusUpdatedBy')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_StatusUpdatedBy]
    FOREIGN KEY (StatusUpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_StatusUpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentMain' AND [CONSTRAINT_NAME] = 'FK_DocumentMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[DocumentMain] WITH CHECK ADD CONSTRAINT [FK_DocumentMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentMain] CHECK CONSTRAINT [FK_DocumentMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentStorage' AND [CONSTRAINT_NAME] = 'FK_DocumentStorage_FileTypeRef')
    ALTER TABLE [dbo].[DocumentStorage] WITH CHECK ADD CONSTRAINT [FK_DocumentStorage_FileTypeRef]
    FOREIGN KEY (FileTypeCode) REFERENCES [FileTypeRef] (FileTypeCode)
go
ALTER TABLE [dbo].[DocumentStorage] CHECK CONSTRAINT [FK_DocumentStorage_FileTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentStorage' AND [CONSTRAINT_NAME] = 'FK_DocumentStorage_UserMain_CreatedBy')
    ALTER TABLE [dbo].[DocumentStorage] WITH CHECK ADD CONSTRAINT [FK_DocumentStorage_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentStorage] CHECK CONSTRAINT [FK_DocumentStorage_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentStorage' AND [CONSTRAINT_NAME] = 'FK_DocumentStorage_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[DocumentStorage] WITH CHECK ADD CONSTRAINT [FK_DocumentStorage_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentStorage] CHECK CONSTRAINT [FK_DocumentStorage_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentStorage' AND [CONSTRAINT_NAME] = 'FK_DocumentStorage_UserMain_UploadedBy')
    ALTER TABLE [dbo].[DocumentStorage] WITH CHECK ADD CONSTRAINT [FK_DocumentStorage_UserMain_UploadedBy]
    FOREIGN KEY (UploadedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DocumentStorage] CHECK CONSTRAINT [FK_DocumentStorage_UserMain_UploadedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentTypeRef' AND [CONSTRAINT_NAME] = 'FK_DocumentTypeRef_DocumentMain_PublishWorkflow')
    ALTER TABLE [dbo].[DocumentTypeRef] WITH CHECK ADD CONSTRAINT [FK_DocumentTypeRef_DocumentMain_PublishWorkflow]
    FOREIGN KEY (PublishWorkflowDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[DocumentTypeRef] CHECK CONSTRAINT [FK_DocumentTypeRef_DocumentMain_PublishWorkflow]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DocumentTypeRef' AND [CONSTRAINT_NAME] = 'FK_DocumentTypeRef_DocumentMain_RecycleWorkflow')
    ALTER TABLE [dbo].[DocumentTypeRef] WITH CHECK ADD CONSTRAINT [FK_DocumentTypeRef_DocumentMain_RecycleWorkflow]
    FOREIGN KEY (RecycleWorkflowDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[DocumentTypeRef] CHECK CONSTRAINT [FK_DocumentTypeRef_DocumentMain_RecycleWorkflow]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_AccessMain')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_DocumentMain')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_DocumentMain]
    FOREIGN KEY (QueryDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_DocumentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_EvaluatorReasonCodeRef')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_EvaluatorReasonCodeRef]
    FOREIGN KEY (AutoReasonCodeKey) REFERENCES [EvaluatorReasonCodeRef] (EvaluatorReasonCodeKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_EvaluatorReasonCodeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_GroupMain')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_ScheduleCommon')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_ScheduleCommon]
    FOREIGN KEY (TimePeriodScheduleCommonKey) REFERENCES [ScheduleCommon] (ScheduleKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_ScheduleCommon]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_UniformRegistry')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_UniformRegistry]
    FOREIGN KEY (EvaluatorKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Evaluator' AND [CONSTRAINT_NAME] = 'FK_Evaluator_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Evaluator] WITH CHECK ADD CONSTRAINT [FK_Evaluator_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Evaluator] CHECK CONSTRAINT [FK_Evaluator_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EvaluatorLevel' AND [CONSTRAINT_NAME] = 'FK_EvaluatorLevel_Evaluator')
    ALTER TABLE [dbo].[EvaluatorLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluatorLevel_Evaluator]
    FOREIGN KEY (EvaluatorKey) REFERENCES [Evaluator] (EvaluatorKey)
go
ALTER TABLE [dbo].[EvaluatorLevel] CHECK CONSTRAINT [FK_EvaluatorLevel_Evaluator]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EvaluatorLevel' AND [CONSTRAINT_NAME] = 'FK_EvaluatorLevel_GroupRoleRef')
    ALTER TABLE [dbo].[EvaluatorLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluatorLevel_GroupRoleRef]
    FOREIGN KEY (GroupRoleKey) REFERENCES [GroupRoleRef] (GroupRoleKey)
go
ALTER TABLE [dbo].[EvaluatorLevel] CHECK CONSTRAINT [FK_EvaluatorLevel_GroupRoleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EvaluatorLevel' AND [CONSTRAINT_NAME] = 'FK_EvaluatorLevel_UniformRegistry')
    ALTER TABLE [dbo].[EvaluatorLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluatorLevel_UniformRegistry]
    FOREIGN KEY (EvaluatorLevelKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[EvaluatorLevel] CHECK CONSTRAINT [FK_EvaluatorLevel_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EvaluatorLevel' AND [CONSTRAINT_NAME] = 'FK_EvaluatorLevel_UserMain_CreatedBy')
    ALTER TABLE [dbo].[EvaluatorLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluatorLevel_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[EvaluatorLevel] CHECK CONSTRAINT [FK_EvaluatorLevel_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EvaluatorLevel' AND [CONSTRAINT_NAME] = 'FK_EvaluatorLevel_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[EvaluatorLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluatorLevel_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[EvaluatorLevel] CHECK CONSTRAINT [FK_EvaluatorLevel_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventGuest' AND [CONSTRAINT_NAME] = 'FK_EventGuest_CartEventFunction')
    ALTER TABLE [dbo].[EventGuest] WITH CHECK ADD CONSTRAINT [FK_EventGuest_CartEventFunction]
    FOREIGN KEY (CartEventFunctionID) REFERENCES [CartEventFunction] (CartEventFunctionID)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[EventGuest] CHECK CONSTRAINT [FK_EventGuest_CartEventFunction]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventGuest' AND [CONSTRAINT_NAME] = 'FK_EventGuest_EventRegistrant')
    ALTER TABLE [dbo].[EventGuest] WITH CHECK ADD CONSTRAINT [FK_EventGuest_EventRegistrant]
    FOREIGN KEY (RegistrantID, EventCode) REFERENCES [EventRegistrant] (RegistrantID, EventCode)
go
ALTER TABLE [dbo].[EventGuest] CHECK CONSTRAINT [FK_EventGuest_EventRegistrant]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventRegistrationAnswer' AND [CONSTRAINT_NAME] = 'FK_EventRegistrantAnswer_EventRegistrant')
    ALTER TABLE [dbo].[EventRegistrationAnswer] WITH CHECK ADD CONSTRAINT [FK_EventRegistrantAnswer_EventRegistrant]
    FOREIGN KEY (RegistrantID, EventCode) REFERENCES [EventRegistrant] (RegistrantID, EventCode)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[EventRegistrationAnswer] CHECK CONSTRAINT [FK_EventRegistrantAnswer_EventRegistrant]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventRegistrationAnswer' AND [CONSTRAINT_NAME] = 'FK_EventRegistrationAnswer_EventSetupQuestion')
    ALTER TABLE [dbo].[EventRegistrationAnswer] WITH CHECK ADD CONSTRAINT [FK_EventRegistrationAnswer_EventSetupQuestion]
    FOREIGN KEY (QuestionID) REFERENCES [EventSetupQuestion] (EventSetupQuestionID)
go
ALTER TABLE [dbo].[EventRegistrationAnswer] CHECK CONSTRAINT [FK_EventRegistrationAnswer_EventSetupQuestion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupFunctionGroup' AND [CONSTRAINT_NAME] = 'FK_EventSetupFunctionGroup_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupFunctionGroup] WITH CHECK ADD CONSTRAINT [FK_EventSetupFunctionGroup_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupFunctionGroup] CHECK CONSTRAINT [FK_EventSetupFunctionGroup_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupGroup' AND [CONSTRAINT_NAME] = 'FK_EventSetupGroup_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupGroup] WITH CHECK ADD CONSTRAINT [FK_EventSetupGroup_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupGroup] CHECK CONSTRAINT [FK_EventSetupGroup_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupGuest' AND [CONSTRAINT_NAME] = 'FK_EventSetupGuest_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupGuest] WITH CHECK ADD CONSTRAINT [FK_EventSetupGuest_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupGuest] CHECK CONSTRAINT [FK_EventSetupGuest_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupLabel' AND [CONSTRAINT_NAME] = 'FK_EventSetupLabel_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupLabel] WITH CHECK ADD CONSTRAINT [FK_EventSetupLabel_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupLabel] CHECK CONSTRAINT [FK_EventSetupLabel_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupQuestion' AND [CONSTRAINT_NAME] = 'FK_EventSetupQuestion_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupQuestion] WITH CHECK ADD CONSTRAINT [FK_EventSetupQuestion_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupQuestion] CHECK CONSTRAINT [FK_EventSetupQuestion_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupQuestionChoice' AND [CONSTRAINT_NAME] = 'FK_EventSetupQuestionChoice_EventSetupQuestion')
    ALTER TABLE [dbo].[EventSetupQuestionChoice] WITH CHECK ADD CONSTRAINT [FK_EventSetupQuestionChoice_EventSetupQuestion]
    FOREIGN KEY (EventSetupQuestionID) REFERENCES [EventSetupQuestion] (EventSetupQuestionID)
go
ALTER TABLE [dbo].[EventSetupQuestionChoice] CHECK CONSTRAINT [FK_EventSetupQuestionChoice_EventSetupQuestion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventSetupRegistrant' AND [CONSTRAINT_NAME] = 'FK_EventSetupRegistrant_EventSetupGeneral')
    ALTER TABLE [dbo].[EventSetupRegistrant] WITH CHECK ADD CONSTRAINT [FK_EventSetupRegistrant_EventSetupGeneral]
    FOREIGN KEY (EventCode) REFERENCES [EventSetupGeneral] (EventCode)
go
ALTER TABLE [dbo].[EventSetupRegistrant] CHECK CONSTRAINT [FK_EventSetupRegistrant_EventSetupGeneral]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ExperienceDefinition' AND [CONSTRAINT_NAME] = 'FK_ExperienceDefinition_ExperienceDefinitionStatusRef')
    ALTER TABLE [dbo].[ExperienceDefinition] WITH CHECK ADD CONSTRAINT [FK_ExperienceDefinition_ExperienceDefinitionStatusRef]
    FOREIGN KEY (ExperienceDefinitionStatusCode) REFERENCES [ExperienceDefinitionStatusRef] (ExperienceDefinitionStatusCode)
go
ALTER TABLE [dbo].[ExperienceDefinition] CHECK CONSTRAINT [FK_ExperienceDefinition_ExperienceDefinitionStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ExperienceDefinition' AND [CONSTRAINT_NAME] = 'FK_ExperienceDefinition_Program')
    ALTER TABLE [dbo].[ExperienceDefinition] WITH CHECK ADD CONSTRAINT [FK_ExperienceDefinition_Program]
    FOREIGN KEY (ProgramKey) REFERENCES [Program] (ProgramKey)
go
ALTER TABLE [dbo].[ExperienceDefinition] CHECK CONSTRAINT [FK_ExperienceDefinition_Program]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ExperienceDefinition' AND [CONSTRAINT_NAME] = 'FK_ExperienceDefinition_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ExperienceDefinition] WITH CHECK ADD CONSTRAINT [FK_ExperienceDefinition_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ExperienceDefinition] CHECK CONSTRAINT [FK_ExperienceDefinition_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ExperienceDefinition' AND [CONSTRAINT_NAME] = 'FK_ExperienceDefinition_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ExperienceDefinition] WITH CHECK ADD CONSTRAINT [FK_ExperienceDefinition_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ExperienceDefinition] CHECK CONSTRAINT [FK_ExperienceDefinition_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ExportType' AND [CONSTRAINT_NAME] = 'FK_ExportType_ProcessEngineType')
    ALTER TABLE [dbo].[ExportType] WITH CHECK ADD CONSTRAINT [FK_ExportType_ProcessEngineType]
    FOREIGN KEY (ProcessEngineTypeKey) REFERENCES [ProcessEngineType] (ProcessEngineTypeKey)
go
ALTER TABLE [dbo].[ExportType] CHECK CONSTRAINT [FK_ExportType_ProcessEngineType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FieldDesignSectionLookup' AND [CONSTRAINT_NAME] = 'FK_FieldDesignSectionLookup_FieldSection')
    ALTER TABLE [dbo].[FieldDesignSectionLookup] WITH CHECK ADD CONSTRAINT [FK_FieldDesignSectionLookup_FieldSection]
    FOREIGN KEY (FieldSectionId) REFERENCES [FieldSection] (FieldSectionId)
go
ALTER TABLE [dbo].[FieldDesignSectionLookup] CHECK CONSTRAINT [FK_FieldDesignSectionLookup_FieldSection]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_AccessMain')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_AddressMain')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_AddressMain]
    FOREIGN KEY (ContactKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_AddressMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_OrganizationMain')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_SystemEntity')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_UniformRegistry')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_UniformRegistry]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_UserMain_CreatedBy')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntity' AND [CONSTRAINT_NAME] = 'FK_FinancialEntity_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[FinancialEntity] WITH CHECK ADD CONSTRAINT [FK_FinancialEntity_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[FinancialEntity] CHECK CONSTRAINT [FK_FinancialEntity_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityDueTo' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityDueTo_FinancialEntity_From')
    ALTER TABLE [dbo].[FinancialEntityDueTo] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityDueTo_FinancialEntity_From]
    FOREIGN KEY (FromFinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[FinancialEntityDueTo] CHECK CONSTRAINT [FK_FinancialEntityDueTo_FinancialEntity_From]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityDueTo' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityDueTo_FinancialEntity_To')
    ALTER TABLE [dbo].[FinancialEntityDueTo] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityDueTo_FinancialEntity_To]
    FOREIGN KEY (ToFinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[FinancialEntityDueTo] CHECK CONSTRAINT [FK_FinancialEntityDueTo_FinancialEntity_To]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityDueTo' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityDueTo_GLAccount_From')
    ALTER TABLE [dbo].[FinancialEntityDueTo] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityDueTo_GLAccount_From]
    FOREIGN KEY (FromFinEntityGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[FinancialEntityDueTo] CHECK CONSTRAINT [FK_FinancialEntityDueTo_GLAccount_From]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityDueTo' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityDueTo_GLAccount_To')
    ALTER TABLE [dbo].[FinancialEntityDueTo] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityDueTo_GLAccount_To]
    FOREIGN KEY (ToFinEntityGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[FinancialEntityDueTo] CHECK CONSTRAINT [FK_FinancialEntityDueTo_GLAccount_To]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityGLAccount' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityGLAccount_FinancialEntity')
    ALTER TABLE [dbo].[FinancialEntityGLAccount] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityGLAccount_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[FinancialEntityGLAccount] CHECK CONSTRAINT [FK_FinancialEntityGLAccount_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityGLAccount' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityGLAccount_GLAccount')
    ALTER TABLE [dbo].[FinancialEntityGLAccount] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityGLAccount_GLAccount]
    FOREIGN KEY (GLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[FinancialEntityGLAccount] CHECK CONSTRAINT [FK_FinancialEntityGLAccount_GLAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FinancialEntityGLAccount' AND [CONSTRAINT_NAME] = 'FK_FinancialEntityGLAccount_GLAccountPurposeRef1')
    ALTER TABLE [dbo].[FinancialEntityGLAccount] WITH CHECK ADD CONSTRAINT [FK_FinancialEntityGLAccount_GLAccountPurposeRef1]
    FOREIGN KEY (GLAccountPurposeCode) REFERENCES [GLAccountPurposeRef] (GLAccountPurposeCode)
go
ALTER TABLE [dbo].[FinancialEntityGLAccount] CHECK CONSTRAINT [FK_FinancialEntityGLAccount_GLAccountPurposeRef1]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressMain_DaytimePhone')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressMain_DaytimePhone]
    FOREIGN KEY (DaytimePhoneAddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressMain_DaytimePhone]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressMain_Email')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressMain_Email]
    FOREIGN KEY (EmailAddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressMain_Email]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressMain_EveningPhone')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressMain_EveningPhone]
    FOREIGN KEY (EveningPhoneAddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressMain_EveningPhone]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressMain_Fax')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressMain_Fax]
    FOREIGN KEY (FaxAddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressMain_Fax]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressMain_Physical')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressMain_Physical]
    FOREIGN KEY (PhysicalAddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressMain_Physical]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_AddressPurposeRef')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_AddressPurposeRef]
    FOREIGN KEY (AddressPurposeKey) REFERENCES [AddressPurposeRef] (AddressPurposeKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_AddressPurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FullAddress' AND [CONSTRAINT_NAME] = 'FK_FullAddress_ContactMain')
    ALTER TABLE [dbo].[FullAddress] WITH CHECK ADD CONSTRAINT [FK_FullAddress_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_AccessMain')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_FinancialEntity')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_FundFamilyRef')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_FundFamilyRef]
    FOREIGN KEY (FundFamilyKey) REFERENCES [FundFamilyRef] (FundFamilyKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_FundFamilyRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_UniformRegistry')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_UniformRegistry]
    FOREIGN KEY (FundKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Fund' AND [CONSTRAINT_NAME] = 'FK_Fund_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Fund] WITH CHECK ADD CONSTRAINT [FK_Fund_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Fund] CHECK CONSTRAINT [FK_Fund_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FundFundType' AND [CONSTRAINT_NAME] = 'FK_FundFundType_Fund')
    ALTER TABLE [dbo].[FundFundType] WITH CHECK ADD CONSTRAINT [FK_FundFundType_Fund]
    FOREIGN KEY (FundKey) REFERENCES [Fund] (FundKey)
go
ALTER TABLE [dbo].[FundFundType] CHECK CONSTRAINT [FK_FundFundType_Fund]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FundFundType' AND [CONSTRAINT_NAME] = 'FK_FundFundType_FundTypeRef')
    ALTER TABLE [dbo].[FundFundType] WITH CHECK ADD CONSTRAINT [FK_FundFundType_FundTypeRef]
    FOREIGN KEY (FundTypeKey) REFERENCES [FundTypeRef] (FundTypeKey)
go
ALTER TABLE [dbo].[FundFundType] CHECK CONSTRAINT [FK_FundFundType_FundTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayAccount' AND [CONSTRAINT_NAME] = 'FK_GatewayAccount_GatewayTypeRef')
    ALTER TABLE [dbo].[GatewayAccount] WITH CHECK ADD CONSTRAINT [FK_GatewayAccount_GatewayTypeRef]
    FOREIGN KEY (GatewayTypeCode) REFERENCES [GatewayTypeRef] (GatewayTypeCode)
go
ALTER TABLE [dbo].[GatewayAccount] CHECK CONSTRAINT [FK_GatewayAccount_GatewayTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayAccount' AND [CONSTRAINT_NAME] = 'FK_GatewayAccount_SystemEntity')
    ALTER TABLE [dbo].[GatewayAccount] WITH CHECK ADD CONSTRAINT [FK_GatewayAccount_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[GatewayAccount] CHECK CONSTRAINT [FK_GatewayAccount_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayAccount' AND [CONSTRAINT_NAME] = 'FK_GatewayAccount_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GatewayAccount] WITH CHECK ADD CONSTRAINT [FK_GatewayAccount_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GatewayAccount] CHECK CONSTRAINT [FK_GatewayAccount_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayAccount' AND [CONSTRAINT_NAME] = 'FK_GatewayAccount_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GatewayAccount] WITH CHECK ADD CONSTRAINT [FK_GatewayAccount_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GatewayAccount] CHECK CONSTRAINT [FK_GatewayAccount_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_GatewayResultRef')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_GatewayResultRef]
    FOREIGN KEY (GatewayResultCode) REFERENCES [GatewayResultRef] (GatewayResultCode)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_GatewayResultRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_GatewayTransactionRef')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_GatewayTransactionRef]
    FOREIGN KEY (GatewayTransactionCode) REFERENCES [GatewayTransactionRef] (GatewayTransactionCode)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_GatewayTransactionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_PaymentDetail')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_PaymentDetail]
    FOREIGN KEY (PaymentDetailKey) REFERENCES [PaymentDetail] (PaymentDetailKey)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_PaymentDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_SystemEntity')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTransaction' AND [CONSTRAINT_NAME] = 'FK_GatewayTransaction_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GatewayTransaction] WITH CHECK ADD CONSTRAINT [FK_GatewayTransaction_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GatewayTransaction] CHECK CONSTRAINT [FK_GatewayTransaction_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayTypeRef' AND [CONSTRAINT_NAME] = 'FK_GatewayTypeRef_ComponentRegistry')
    ALTER TABLE [dbo].[GatewayTypeRef] WITH CHECK ADD CONSTRAINT [FK_GatewayTypeRef_ComponentRegistry]
    FOREIGN KEY (GatewayComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[GatewayTypeRef] CHECK CONSTRAINT [FK_GatewayTypeRef_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Generic' AND [CONSTRAINT_NAME] = 'FK_Generic_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Generic] WITH CHECK ADD CONSTRAINT [FK_Generic_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Generic] CHECK CONSTRAINT [FK_Generic_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Generic' AND [CONSTRAINT_NAME] = 'FK_Generic_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Generic] WITH CHECK ADD CONSTRAINT [FK_Generic_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Generic] CHECK CONSTRAINT [FK_Generic_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GenericLink' AND [CONSTRAINT_NAME] = 'FK_GenericLink_ComponentRegistry_Source')
    ALTER TABLE [dbo].[GenericLink] WITH CHECK ADD CONSTRAINT [FK_GenericLink_ComponentRegistry_Source]
    FOREIGN KEY (SourceComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[GenericLink] CHECK CONSTRAINT [FK_GenericLink_ComponentRegistry_Source]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GenericLink' AND [CONSTRAINT_NAME] = 'FK_GenericLink_ComponentRegistry_Target')
    ALTER TABLE [dbo].[GenericLink] WITH CHECK ADD CONSTRAINT [FK_GenericLink_ComponentRegistry_Target]
    FOREIGN KEY (TargetComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[GenericLink] CHECK CONSTRAINT [FK_GenericLink_ComponentRegistry_Target]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GenericLink' AND [CONSTRAINT_NAME] = 'FK_GenericLink_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GenericLink] WITH CHECK ADD CONSTRAINT [FK_GenericLink_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GenericLink] CHECK CONSTRAINT [FK_GenericLink_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidClaimDetail' AND [CONSTRAINT_NAME] = 'FK_GiftAidClaimDetail_GiftAidClaimHeader')
    ALTER TABLE [dbo].[GiftAidClaimDetail] WITH CHECK ADD CONSTRAINT [FK_GiftAidClaimDetail_GiftAidClaimHeader]
    FOREIGN KEY (GiftAidClaimHeaderKey) REFERENCES [GiftAidClaimHeader] (GiftAidClaimHeaderKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[GiftAidClaimDetail] CHECK CONSTRAINT [FK_GiftAidClaimDetail_GiftAidClaimHeader]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidClaimHeader' AND [CONSTRAINT_NAME] = 'FK_GiftAidClaimHeader_ContactMain_CreatedBy')
    ALTER TABLE [dbo].[GiftAidClaimHeader] WITH CHECK ADD CONSTRAINT [FK_GiftAidClaimHeader_ContactMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GiftAidClaimHeader] CHECK CONSTRAINT [FK_GiftAidClaimHeader_ContactMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidClaimHeader' AND [CONSTRAINT_NAME] = 'FK_GiftAidClaimHeader_ContactMain_UpdatedBy')
    ALTER TABLE [dbo].[GiftAidClaimHeader] WITH CHECK ADD CONSTRAINT [FK_GiftAidClaimHeader_ContactMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GiftAidClaimHeader] CHECK CONSTRAINT [FK_GiftAidClaimHeader_ContactMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidDeclaration' AND [CONSTRAINT_NAME] = 'FK_GiftAidDeclaration_ContactMain_CreatedBy')
    ALTER TABLE [dbo].[GiftAidDeclaration] WITH CHECK ADD CONSTRAINT [FK_GiftAidDeclaration_ContactMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GiftAidDeclaration] CHECK CONSTRAINT [FK_GiftAidDeclaration_ContactMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidDeclaration' AND [CONSTRAINT_NAME] = 'FK_GiftAidDeclaration_ContactMain_UpdatedBy')
    ALTER TABLE [dbo].[GiftAidDeclaration] WITH CHECK ADD CONSTRAINT [FK_GiftAidDeclaration_ContactMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GiftAidDeclaration] CHECK CONSTRAINT [FK_GiftAidDeclaration_ContactMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GiftAidDeclaration' AND [CONSTRAINT_NAME] = 'FK_GiftAidDeclaration_Name')
    ALTER TABLE [dbo].[GiftAidDeclaration] WITH CHECK ADD CONSTRAINT [FK_GiftAidDeclaration_Name]
    FOREIGN KEY (ID) REFERENCES [Name] (ID)
go
ALTER TABLE [dbo].[GiftAidDeclaration] CHECK CONSTRAINT [FK_GiftAidDeclaration_Name]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLAccount' AND [CONSTRAINT_NAME] = 'FK_GLAccount_FinancialEntity')
    ALTER TABLE [dbo].[GLAccount] WITH CHECK ADD CONSTRAINT [FK_GLAccount_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[GLAccount] CHECK CONSTRAINT [FK_GLAccount_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLAccount' AND [CONSTRAINT_NAME] = 'FK_GLAccount_SystemEntity')
    ALTER TABLE [dbo].[GLAccount] WITH CHECK ADD CONSTRAINT [FK_GLAccount_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[GLAccount] CHECK CONSTRAINT [FK_GLAccount_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLAccount' AND [CONSTRAINT_NAME] = 'FK_GLAccount_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GLAccount] WITH CHECK ADD CONSTRAINT [FK_GLAccount_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GLAccount] CHECK CONSTRAINT [FK_GLAccount_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLAccount' AND [CONSTRAINT_NAME] = 'FK_GLAccount_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GLAccount] WITH CHECK ADD CONSTRAINT [FK_GLAccount_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GLAccount] CHECK CONSTRAINT [FK_GLAccount_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExport' AND [CONSTRAINT_NAME] = 'FK_GLExport_FinancialEntity')
    ALTER TABLE [dbo].[GLExport] WITH CHECK ADD CONSTRAINT [FK_GLExport_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[GLExport] CHECK CONSTRAINT [FK_GLExport_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExport' AND [CONSTRAINT_NAME] = 'FK_GLExport_GLExportSummaryLevelRef')
    ALTER TABLE [dbo].[GLExport] WITH CHECK ADD CONSTRAINT [FK_GLExport_GLExportSummaryLevelRef]
    FOREIGN KEY (GLExportSummaryLevelCode) REFERENCES [GLExportSummaryLevelRef] (GLExportSummaryLevelCode)
go
ALTER TABLE [dbo].[GLExport] CHECK CONSTRAINT [FK_GLExport_GLExportSummaryLevelRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExport' AND [CONSTRAINT_NAME] = 'FK_GLExport_SystemEntity')
    ALTER TABLE [dbo].[GLExport] WITH CHECK ADD CONSTRAINT [FK_GLExport_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[GLExport] CHECK CONSTRAINT [FK_GLExport_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExport' AND [CONSTRAINT_NAME] = 'FK_GLExport_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GLExport] WITH CHECK ADD CONSTRAINT [FK_GLExport_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GLExport] CHECK CONSTRAINT [FK_GLExport_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExport' AND [CONSTRAINT_NAME] = 'FK_GLExport_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GLExport] WITH CHECK ADD CONSTRAINT [FK_GLExport_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GLExport] CHECK CONSTRAINT [FK_GLExport_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExportItem' AND [CONSTRAINT_NAME] = 'FK_GLExportItem_GLExport')
    ALTER TABLE [dbo].[GLExportItem] WITH CHECK ADD CONSTRAINT [FK_GLExportItem_GLExport]
    FOREIGN KEY (GLExportKey) REFERENCES [GLExport] (GLExportKey)
go
ALTER TABLE [dbo].[GLExportItem] CHECK CONSTRAINT [FK_GLExportItem_GLExport]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLExportItem' AND [CONSTRAINT_NAME] = 'FK_GLExportItem_GLTransactionMain')
    ALTER TABLE [dbo].[GLExportItem] WITH CHECK ADD CONSTRAINT [FK_GLExportItem_GLTransactionMain]
    FOREIGN KEY (GLTransactionKey) REFERENCES [GLTransactionMain] (GLTransactionKey)
go
ALTER TABLE [dbo].[GLExportItem] CHECK CONSTRAINT [FK_GLExportItem_GLTransactionMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_ContactMain')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_DeferralTerms')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_GLAccount')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_GLAccount]
    FOREIGN KEY (GLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_GLAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_GLAccount_TargetAccount')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_GLAccount_TargetAccount]
    FOREIGN KEY (TargetGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_GLAccount_TargetAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_GLTransactionMain')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_GLTransactionMain]
    FOREIGN KEY (GLTransactionKey) REFERENCES [GLTransactionMain] (GLTransactionKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_GLTransactionMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_InvoiceLine')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_PaymentMain')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_PaymentMain]
    FOREIGN KEY (PaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_PaymentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionLine' AND [CONSTRAINT_NAME] = 'FK_GLTransactionLine_ProductMain')
    ALTER TABLE [dbo].[GLTransactionLine] WITH CHECK ADD CONSTRAINT [FK_GLTransactionLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[GLTransactionLine] CHECK CONSTRAINT [FK_GLTransactionLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_ContactMain')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_FinancialEntity')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_InvoiceMain')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_JournalEntryTypeRef')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_JournalEntryTypeRef]
    FOREIGN KEY (JournalEntryTypeCode) REFERENCES [JournalEntryTypeRef] (JournalEntryTypeCode)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_JournalEntryTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_PaymentMain')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_PaymentMain]
    FOREIGN KEY (PaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_PaymentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupInstanceRole' AND [CONSTRAINT_NAME] = 'FK_GroupInstanceRole_GroupMain')
    ALTER TABLE [dbo].[GroupInstanceRole] WITH CHECK ADD CONSTRAINT [FK_GroupInstanceRole_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupInstanceRole] CHECK CONSTRAINT [FK_GroupInstanceRole_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupInstanceRole' AND [CONSTRAINT_NAME] = 'FK_GroupInstanceRole_GroupMemberStatusRef')
    ALTER TABLE [dbo].[GroupInstanceRole] WITH CHECK ADD CONSTRAINT [FK_GroupInstanceRole_GroupMemberStatusRef]
    FOREIGN KEY (DefaultMemberStatusCode) REFERENCES [GroupMemberStatusRef] (GroupMemberStatusCode)
go
ALTER TABLE [dbo].[GroupInstanceRole] CHECK CONSTRAINT [FK_GroupInstanceRole_GroupMemberStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupInstanceRole' AND [CONSTRAINT_NAME] = 'FK_GroupInstanceRole_GroupRoleRef')
    ALTER TABLE [dbo].[GroupInstanceRole] WITH CHECK ADD CONSTRAINT [FK_GroupInstanceRole_GroupRoleRef]
    FOREIGN KEY (GroupRoleKey) REFERENCES [GroupRoleRef] (GroupRoleKey)
go
ALTER TABLE [dbo].[GroupInstanceRole] CHECK CONSTRAINT [FK_GroupInstanceRole_GroupRoleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_AccessMain')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_AccessMain_Owner')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_AccessMain_Owner]
    FOREIGN KEY (OwnerAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_AccessMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_GroupMain_OverrideOwner')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_GroupMain_OverrideOwner]
    FOREIGN KEY (OverrideOwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_GroupMain_OverrideOwner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_GroupStatusRef')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_GroupStatusRef]
    FOREIGN KEY (GroupStatusCode) REFERENCES [GroupStatusRef] (GroupStatusCode)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_GroupStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_GroupTypeRef')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_GroupTypeRef]
    FOREIGN KEY (GroupTypeKey) REFERENCES [GroupTypeRef] (GroupTypeKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_GroupTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_SystemEntity')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_UniformRegistry')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_UniformRegistry]
    FOREIGN KEY (GroupKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMain' AND [CONSTRAINT_NAME] = 'FK_GroupMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GroupMain] WITH CHECK ADD CONSTRAINT [FK_GroupMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMain] CHECK CONSTRAINT [FK_GroupMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMember' AND [CONSTRAINT_NAME] = 'FK_GroupMember_ContactMain_Member')
    ALTER TABLE [dbo].[GroupMember] WITH CHECK ADD CONSTRAINT [FK_GroupMember_ContactMain_Member]
    FOREIGN KEY (MemberContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_ContactMain_Member]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMember' AND [CONSTRAINT_NAME] = 'FK_GroupMember_GroupMain')
    ALTER TABLE [dbo].[GroupMember] WITH CHECK ADD CONSTRAINT [FK_GroupMember_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMember' AND [CONSTRAINT_NAME] = 'FK_GroupMember_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GroupMember] WITH CHECK ADD CONSTRAINT [FK_GroupMember_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMember' AND [CONSTRAINT_NAME] = 'FK_GroupMember_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GroupMember] WITH CHECK ADD CONSTRAINT [FK_GroupMember_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_GroupMain')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_GroupMember')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_GroupMember]
    FOREIGN KEY (GroupMemberKey) REFERENCES [GroupMember] (GroupMemberKey)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_GroupMember]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_GroupMemberStatusRef')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_GroupMemberStatusRef]
    FOREIGN KEY (GroupMemberStatusCode) REFERENCES [GroupMemberStatusRef] (GroupMemberStatusCode)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_GroupMemberStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_GroupRoleRef')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_GroupRoleRef]
    FOREIGN KEY (GroupRoleKey) REFERENCES [GroupRoleRef] (GroupRoleKey)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_GroupRoleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberDetail' AND [CONSTRAINT_NAME] = 'FK_GroupMemberDetail_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GroupMemberDetail] WITH CHECK ADD CONSTRAINT [FK_GroupMemberDetail_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupMemberDetail] CHECK CONSTRAINT [FK_GroupMemberDetail_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberOptions' AND [CONSTRAINT_NAME] = 'FK_GroupMemberOptions_ContactMain')
    ALTER TABLE [dbo].[GroupMemberOptions] WITH CHECK ADD CONSTRAINT [FK_GroupMemberOptions_ContactMain]
    FOREIGN KEY (AlternativeBillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[GroupMemberOptions] CHECK CONSTRAINT [FK_GroupMemberOptions_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberOptions' AND [CONSTRAINT_NAME] = 'FK_GroupMemberOptions_FullAddress_Billing')
    ALTER TABLE [dbo].[GroupMemberOptions] WITH CHECK ADD CONSTRAINT [FK_GroupMemberOptions_FullAddress_Billing]
    FOREIGN KEY (GroupBillingFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[GroupMemberOptions] CHECK CONSTRAINT [FK_GroupMemberOptions_FullAddress_Billing]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberOptions' AND [CONSTRAINT_NAME] = 'FK_GroupMemberOptions_FullAddress_Contact')
    ALTER TABLE [dbo].[GroupMemberOptions] WITH CHECK ADD CONSTRAINT [FK_GroupMemberOptions_FullAddress_Contact]
    FOREIGN KEY (GroupContactFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[GroupMemberOptions] CHECK CONSTRAINT [FK_GroupMemberOptions_FullAddress_Contact]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupMemberOptions' AND [CONSTRAINT_NAME] = 'FK_GroupMemberOptions_GroupMember')
    ALTER TABLE [dbo].[GroupMemberOptions] WITH CHECK ADD CONSTRAINT [FK_GroupMemberOptions_GroupMember]
    FOREIGN KEY (GroupMemberKey) REFERENCES [GroupMember] (GroupMemberKey)
go
ALTER TABLE [dbo].[GroupMemberOptions] CHECK CONSTRAINT [FK_GroupMemberOptions_GroupMember]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupOpportunityType' AND [CONSTRAINT_NAME] = 'FK_GroupOpportunityType_GroupMain')
    ALTER TABLE [dbo].[GroupOpportunityType] WITH CHECK ADD CONSTRAINT [FK_GroupOpportunityType_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupOpportunityType] CHECK CONSTRAINT [FK_GroupOpportunityType_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupOpportunityType' AND [CONSTRAINT_NAME] = 'FK_GroupOpportunityType_OpportunityType')
    ALTER TABLE [dbo].[GroupOpportunityType] WITH CHECK ADD CONSTRAINT [FK_GroupOpportunityType_OpportunityType]
    FOREIGN KEY (OpportunityTypeKey) REFERENCES [OpportunityType] (OpportunityTypeKey)
go
ALTER TABLE [dbo].[GroupOpportunityType] CHECK CONSTRAINT [FK_GroupOpportunityType_OpportunityType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupPerspective' AND [CONSTRAINT_NAME] = 'FK_GroupPerspective_GroupMain')
    ALTER TABLE [dbo].[GroupPerspective] WITH CHECK ADD CONSTRAINT [FK_GroupPerspective_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupPerspective] CHECK CONSTRAINT [FK_GroupPerspective_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupPerspective' AND [CONSTRAINT_NAME] = 'FK_GroupPerspective_Perspective')
    ALTER TABLE [dbo].[GroupPerspective] WITH CHECK ADD CONSTRAINT [FK_GroupPerspective_Perspective]
    FOREIGN KEY (PerspectiveKey) REFERENCES [Perspective] (PerspectiveKey)
go
ALTER TABLE [dbo].[GroupPerspective] CHECK CONSTRAINT [FK_GroupPerspective_Perspective]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeMemberStatus' AND [CONSTRAINT_NAME] = 'FK_GroupTypeMemberStatus_GroupMemberStatusRef')
    ALTER TABLE [dbo].[GroupTypeMemberStatus] WITH CHECK ADD CONSTRAINT [FK_GroupTypeMemberStatus_GroupMemberStatusRef]
    FOREIGN KEY (GroupMemberStatusCode) REFERENCES [GroupMemberStatusRef] (GroupMemberStatusCode)
go
ALTER TABLE [dbo].[GroupTypeMemberStatus] CHECK CONSTRAINT [FK_GroupTypeMemberStatus_GroupMemberStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeMemberStatus' AND [CONSTRAINT_NAME] = 'FK_GroupTypeMemberStatus_GroupTypeRef')
    ALTER TABLE [dbo].[GroupTypeMemberStatus] WITH CHECK ADD CONSTRAINT [FK_GroupTypeMemberStatus_GroupTypeRef]
    FOREIGN KEY (GroupTypeKey) REFERENCES [GroupTypeRef] (GroupTypeKey)
go
ALTER TABLE [dbo].[GroupTypeMemberStatus] CHECK CONSTRAINT [FK_GroupTypeMemberStatus_GroupTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRef' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRef_DocumentMain')
    ALTER TABLE [dbo].[GroupTypeRef] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRef_DocumentMain]
    FOREIGN KEY (MemberQueryFolderKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[GroupTypeRef] CHECK CONSTRAINT [FK_GroupTypeRef_DocumentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRef' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRef_GroupStatusRef')
    ALTER TABLE [dbo].[GroupTypeRef] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRef_GroupStatusRef]
    FOREIGN KEY (DefaultGroupStatusCode) REFERENCES [GroupStatusRef] (GroupStatusCode)
go
ALTER TABLE [dbo].[GroupTypeRef] CHECK CONSTRAINT [FK_GroupTypeRef_GroupStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRef' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRef_UserMain_CreatedBy')
    ALTER TABLE [dbo].[GroupTypeRef] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRef_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupTypeRef] CHECK CONSTRAINT [FK_GroupTypeRef_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRef' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[GroupTypeRef] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[GroupTypeRef] CHECK CONSTRAINT [FK_GroupTypeRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRole' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRole_GroupMemberStatusRef')
    ALTER TABLE [dbo].[GroupTypeRole] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRole_GroupMemberStatusRef]
    FOREIGN KEY (DefaultMemberStatusCode) REFERENCES [GroupMemberStatusRef] (GroupMemberStatusCode)
go
ALTER TABLE [dbo].[GroupTypeRole] CHECK CONSTRAINT [FK_GroupTypeRole_GroupMemberStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRole' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRole_GroupRoleRef')
    ALTER TABLE [dbo].[GroupTypeRole] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRole_GroupRoleRef]
    FOREIGN KEY (GroupRoleKey) REFERENCES [GroupRoleRef] (GroupRoleKey)
go
ALTER TABLE [dbo].[GroupTypeRole] CHECK CONSTRAINT [FK_GroupTypeRole_GroupRoleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupTypeRole' AND [CONSTRAINT_NAME] = 'FK_GroupTypeRole_GroupTypeRef')
    ALTER TABLE [dbo].[GroupTypeRole] WITH CHECK ADD CONSTRAINT [FK_GroupTypeRole_GroupTypeRef]
    FOREIGN KEY (GroupTypeKey) REFERENCES [GroupTypeRef] (GroupTypeKey)
go
ALTER TABLE [dbo].[GroupTypeRole] CHECK CONSTRAINT [FK_GroupTypeRole_GroupTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HandlingPrice' AND [CONSTRAINT_NAME] = 'FK_HandlingPrice_HandlingPriceRef')
    ALTER TABLE [dbo].[HandlingPrice] WITH CHECK ADD CONSTRAINT [FK_HandlingPrice_HandlingPriceRef]
    FOREIGN KEY (HandlingPriceCode) REFERENCES [HandlingPriceRef] (HandlingPriceCode)
go
ALTER TABLE [dbo].[HandlingPrice] CHECK CONSTRAINT [FK_HandlingPrice_HandlingPriceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HandlingPrice' AND [CONSTRAINT_NAME] = 'FK_HandlingPrice_UserMain_CreatedBy')
    ALTER TABLE [dbo].[HandlingPrice] WITH CHECK ADD CONSTRAINT [FK_HandlingPrice_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[HandlingPrice] CHECK CONSTRAINT [FK_HandlingPrice_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HandlingPrice' AND [CONSTRAINT_NAME] = 'FK_HandlingPrice_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[HandlingPrice] WITH CHECK ADD CONSTRAINT [FK_HandlingPrice_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[HandlingPrice] CHECK CONSTRAINT [FK_HandlingPrice_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Hierarchy' AND [CONSTRAINT_NAME] = 'FK_Hierarchy_Hierarchy_Ancestor')
    ALTER TABLE [dbo].[Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_Hierarchy_Ancestor]
    FOREIGN KEY (RootHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_Hierarchy_Ancestor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Hierarchy' AND [CONSTRAINT_NAME] = 'FK_Hierarchy_Hierarchy_Parent')
    ALTER TABLE [dbo].[Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_Hierarchy_Parent]
    FOREIGN KEY (ParentHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_Hierarchy_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Hierarchy' AND [CONSTRAINT_NAME] = 'FK_Hierarchy_UniformTypeRef')
    ALTER TABLE [dbo].[Hierarchy] WITH CHECK ADD CONSTRAINT [FK_Hierarchy_UniformTypeRef]
    FOREIGN KEY (UniformType) REFERENCES [UniformTypeRef] (UniformType)
go
ALTER TABLE [dbo].[Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_UniformTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_AccessMain')
    ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_Hierarchy')
    ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_Hierarchy]
    FOREIGN KEY (RootHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_Hierarchy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_Organization')
    ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_Organization]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_Organization]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_UserMain_CreatedBy')
    ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HierarchyRoot' AND [CONSTRAINT_NAME] = 'FK_HierarchyRoot_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[HierarchyRoot] WITH CHECK ADD CONSTRAINT [FK_HierarchyRoot_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[HierarchyRoot] CHECK CONSTRAINT [FK_HierarchyRoot_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'HoldCode' AND [CONSTRAINT_NAME] = 'FK_HoldCode_OrganizationMain')
    ALTER TABLE [dbo].[HoldCode] WITH CHECK ADD CONSTRAINT [FK_HoldCode_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[HoldCode] CHECK CONSTRAINT [FK_HoldCode_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Individual' AND [CONSTRAINT_NAME] = 'FK_Individual_ContactMain')
    ALTER TABLE [dbo].[Individual] WITH CHECK ADD CONSTRAINT [FK_Individual_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Individual' AND [CONSTRAINT_NAME] = 'FK_Individual_Institute_Primary')
    ALTER TABLE [dbo].[Individual] WITH CHECK ADD CONSTRAINT [FK_Individual_Institute_Primary]
    FOREIGN KEY (PrimaryInstituteContactKey) REFERENCES [Institute] (ContactKey)
go
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_Institute_Primary]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Individual' AND [CONSTRAINT_NAME] = 'FK_Individual_PrefixRef')
    ALTER TABLE [dbo].[Individual] WITH CHECK ADD CONSTRAINT [FK_Individual_PrefixRef]
    FOREIGN KEY (PrefixCode) REFERENCES [PrefixRef] (PrefixCode)
go
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_PrefixRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Individual' AND [CONSTRAINT_NAME] = 'FK_Individual_SuffixRef')
    ALTER TABLE [dbo].[Individual] WITH CHECK ADD CONSTRAINT [FK_Individual_SuffixRef]
    FOREIGN KEY (SuffixCode) REFERENCES [SuffixRef] (SuffixCode)
go
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_SuffixRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Institute' AND [CONSTRAINT_NAME] = 'FK_Institute_ContactMain')
    ALTER TABLE [dbo].[Institute] WITH CHECK ADD CONSTRAINT [FK_Institute_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[Institute] CHECK CONSTRAINT [FK_Institute_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Institute' AND [CONSTRAINT_NAME] = 'FK_Institute_GroupMain_Institute')
    ALTER TABLE [dbo].[Institute] WITH CHECK ADD CONSTRAINT [FK_Institute_GroupMain_Institute]
    FOREIGN KEY (InstituteGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[Institute] CHECK CONSTRAINT [FK_Institute_GroupMain_Institute]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryBackOrder' AND [CONSTRAINT_NAME] = 'FK_InventoryBackOrder_OrderLine')
    ALTER TABLE [dbo].[InventoryBackOrder] WITH CHECK ADD CONSTRAINT [FK_InventoryBackOrder_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[InventoryBackOrder] CHECK CONSTRAINT [FK_InventoryBackOrder_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryBackOrder' AND [CONSTRAINT_NAME] = 'FK_InventoryBackOrder_ProductMain')
    ALTER TABLE [dbo].[InventoryBackOrder] WITH CHECK ADD CONSTRAINT [FK_InventoryBackOrder_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[InventoryBackOrder] CHECK CONSTRAINT [FK_InventoryBackOrder_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryLocation' AND [CONSTRAINT_NAME] = 'FK_InventoryLocation_UniformRegistry')
    ALTER TABLE [dbo].[InventoryLocation] WITH CHECK ADD CONSTRAINT [FK_InventoryLocation_UniformRegistry]
    FOREIGN KEY (LocationKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryLocation' AND [CONSTRAINT_NAME] = 'FK_InventoryLocation_UserMain_CreatedBy')
    ALTER TABLE [dbo].[InventoryLocation] WITH CHECK ADD CONSTRAINT [FK_InventoryLocation_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryLocation' AND [CONSTRAINT_NAME] = 'FK_InventoryLocation_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[InventoryLocation] WITH CHECK ADD CONSTRAINT [FK_InventoryLocation_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryLocation' AND [CONSTRAINT_NAME] = 'FK_InventoryLocation_Warehouse')
    ALTER TABLE [dbo].[InventoryLocation] WITH CHECK ADD CONSTRAINT [FK_InventoryLocation_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogCost' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionCost_InventoryTransactionMain')
    ALTER TABLE [dbo].[InventoryTransactionLogCost] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionCost_InventoryTransactionMain]
    FOREIGN KEY (InventoryTransactionLogKey) REFERENCES [InventoryTransactionLogMain] (InventoryTransactionLogKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogCost] CHECK CONSTRAINT [FK_InventoryTransactionCost_InventoryTransactionMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogCost' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogCost_CostMethodRef')
    ALTER TABLE [dbo].[InventoryTransactionLogCost] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogCost_CostMethodRef]
    FOREIGN KEY (CostMethodCode) REFERENCES [CostMethodRef] (CostMethodCode)
go
ALTER TABLE [dbo].[InventoryTransactionLogCost] CHECK CONSTRAINT [FK_InventoryTransactionLogCost_CostMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogCost' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogCost_ProductMain')
    ALTER TABLE [dbo].[InventoryTransactionLogCost] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogCost_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogCost] CHECK CONSTRAINT [FK_InventoryTransactionLogCost_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLine_InventoryLocation')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLine_InventoryLocation]
    FOREIGN KEY (InventoryLocationKey) REFERENCES [InventoryLocation] (LocationKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLine_InventoryLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLine_InventoryTransactionMain')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLine_InventoryTransactionMain]
    FOREIGN KEY (InventoryTransactionLogKey) REFERENCES [InventoryTransactionLogMain] (InventoryTransactionLogKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLine_InventoryTransactionMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLine_ProductMain')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLine_ReasonCode')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLine_ReasonCode]
    FOREIGN KEY (ReasonCodeKey) REFERENCES [ReasonCode] (ReasonCodeKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLine_ReasonCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLine_Uom')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLine_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLine_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogLine_TransactionTypeRef')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogLine_TransactionTypeRef]
    FOREIGN KEY (TransactionTypeCode) REFERENCES [TransactionTypeRef] (TransactionTypeCode)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLogLine_TransactionTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogLine_WareHouse')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogLine_WareHouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLogLine_WareHouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_BatchInstance_Final')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_BatchInstance_Final]
    FOREIGN KEY (FinalBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_BatchInstance_Final]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_GroupMain_Owner')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_SystemEntity')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogMain' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[InventoryTransactionLogMain] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InventoryTransactionLogMain] CHECK CONSTRAINT [FK_InventoryTransactionLogMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_DeferralTerms')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_FinancialEntity')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_GLAccount_AR')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_GLAccount_AR]
    FOREIGN KEY (ARGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_GLAccount_AR]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_GLAccount_DeferredIncome')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_GLAccount_DeferredIncome]
    FOREIGN KEY (DeferredIncomeGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_GLAccount_DeferredIncome]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_GLAccount_Income')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_GLAccount_Income]
    FOREIGN KEY (IncomeGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_GLAccount_Income]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_InvoiceLine')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_InvoiceMain')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_ShipMethod')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_InvoiceDistribution_Warehouse')
    ALTER TABLE [dbo].[InvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_InvoiceDistribution_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[InvoiceDistribution] CHECK CONSTRAINT [FK_InvoiceDistribution_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_ContactMain_ShipTo')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_ContactMain_ShipTo]
    FOREIGN KEY (ShipToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_ContactMain_ShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_FullAddress_ShipTo')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_FullAddress_ShipTo]
    FOREIGN KEY (ShipToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_FullAddress_ShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_GroupMain')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_InvoiceLine_Parent')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_InvoiceLine_Parent]
    FOREIGN KEY (ParentInvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_InvoiceLine_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_InvoiceMain')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_PriceSheet')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_ProductMain')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_ShipMethod')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceLine' AND [CONSTRAINT_NAME] = 'FK_InvoiceLine_SourceCode')
    ALTER TABLE [dbo].[InvoiceLine] WITH CHECK ADD CONSTRAINT [FK_InvoiceLine_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_AccessMain')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_AccountingMethodRef')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_AccountingMethodRef]
    FOREIGN KEY (AccountingMethodCode) REFERENCES [AccountingMethodRef] (AccountingMethodCode)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_AccountingMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_BatchInstance_Final')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_BatchInstance_Final]
    FOREIGN KEY (FinalBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_BatchInstance_Final]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_CommissionPlan')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_ContactMain_BillTo')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_ContactMain_SoldTo')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_ContactMain_SoldTo]
    FOREIGN KEY (SoldToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_ContactMain_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_Currency')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_FinancialEntity')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_GroupMain')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_GroupMain_Owner')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_InvoiceTypeRef')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_InvoiceTypeRef]
    FOREIGN KEY (InvoiceTypeCode) REFERENCES [InvoiceTypeRef] (InvoiceTypeCode)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_InvoiceTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_PaymentTerms')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_PriceSheet')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_SalesLocation')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_SalesLocation]
    FOREIGN KEY (SalesLocationKey) REFERENCES [SalesLocation] (SalesLocationKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_SalesLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_SystemEntity')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_UniformRegistry')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_UniformRegistry]
    FOREIGN KEY (InvoiceKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InvoiceMain' AND [CONSTRAINT_NAME] = 'FK_InvoiceMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[InvoiceMain] WITH CHECK ADD CONSTRAINT [FK_InvoiceMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[InvoiceMain] CHECK CONSTRAINT [FK_InvoiceMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseLegacyMap' AND [CONSTRAINT_NAME] = 'FK_LicenseLegacyMap_License')
    ALTER TABLE [dbo].[LicenseLegacyMap] WITH CHECK ADD CONSTRAINT [FK_LicenseLegacyMap_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseLegacyMap] CHECK CONSTRAINT [FK_LicenseLegacyMap_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMain' AND [CONSTRAINT_NAME] = 'FK_LicenseMain_License')
    ALTER TABLE [dbo].[LicenseMain] WITH CHECK ADD CONSTRAINT [FK_LicenseMain_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMain] CHECK CONSTRAINT [FK_LicenseMain_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMain' AND [CONSTRAINT_NAME] = 'FK_LicenseMain_LicenseMaster')
    ALTER TABLE [dbo].[LicenseMain] WITH CHECK ADD CONSTRAINT [FK_LicenseMain_LicenseMaster]
    FOREIGN KEY (LicenseMasterKey) REFERENCES [LicenseMaster] (LicenseMasterKey)
go
ALTER TABLE [dbo].[LicenseMain] CHECK CONSTRAINT [FK_LicenseMain_LicenseMaster]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMain' AND [CONSTRAINT_NAME] = 'FK_LicenseMain_OrganizationMain')
    ALTER TABLE [dbo].[LicenseMain] WITH CHECK ADD CONSTRAINT [FK_LicenseMain_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[LicenseMain] CHECK CONSTRAINT [FK_LicenseMain_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMap' AND [CONSTRAINT_NAME] = 'FK_LicenseMap_License')
    ALTER TABLE [dbo].[LicenseMap] WITH CHECK ADD CONSTRAINT [FK_LicenseMap_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMap] CHECK CONSTRAINT [FK_LicenseMap_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMap' AND [CONSTRAINT_NAME] = 'FK_LicenseMap_LicenseTypeRef')
    ALTER TABLE [dbo].[LicenseMap] WITH CHECK ADD CONSTRAINT [FK_LicenseMap_LicenseTypeRef]
    FOREIGN KEY (LicenseType) REFERENCES [LicenseTypeRef] (LicenseType)
go
ALTER TABLE [dbo].[LicenseMap] CHECK CONSTRAINT [FK_LicenseMap_LicenseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMapMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMapMaster_License')
    ALTER TABLE [dbo].[LicenseMapMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMapMaster_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMapMaster] CHECK CONSTRAINT [FK_LicenseMapMaster_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMapMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMapMaster_LicenseTypeRef')
    ALTER TABLE [dbo].[LicenseMapMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMapMaster_LicenseTypeRef]
    FOREIGN KEY (LicenseType) REFERENCES [LicenseTypeRef] (LicenseType)
go
ALTER TABLE [dbo].[LicenseMapMaster] CHECK CONSTRAINT [FK_LicenseMapMaster_LicenseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMapMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMapMaster_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseMapMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMapMaster_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseMapMaster] CHECK CONSTRAINT [FK_LicenseMapMaster_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMapMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMapMaster_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[LicenseMapMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMapMaster_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseMapMaster] CHECK CONSTRAINT [FK_LicenseMapMaster_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_License')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_LicenseOrganization')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_LicenseOrganization]
    FOREIGN KEY (LicenseOrganizationKey) REFERENCES [LicenseOrganization] (LicenseOrganizationKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_LicenseOrganization]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganization' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganization_ContactMain')
    ALTER TABLE [dbo].[LicenseOrganization] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganization_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[LicenseOrganization] CHECK CONSTRAINT [FK_LicenseOrganization_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganization' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganization_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseOrganization] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganization_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseOrganization] CHECK CONSTRAINT [FK_LicenseOrganization_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganization' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganization_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[LicenseOrganization] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganization_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseOrganization] CHECK CONSTRAINT [FK_LicenseOrganization_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseTypeRef' AND [CONSTRAINT_NAME] = 'FK_LicenseTypeRef_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseTypeRef] WITH CHECK ADD CONSTRAINT [FK_LicenseTypeRef_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseTypeRef] CHECK CONSTRAINT [FK_LicenseTypeRef_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseTypeRef' AND [CONSTRAINT_NAME] = 'FK_LicenseTypeRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[LicenseTypeRef] WITH CHECK ADD CONSTRAINT [FK_LicenseTypeRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseTypeRef] CHECK CONSTRAINT [FK_LicenseTypeRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseUser' AND [CONSTRAINT_NAME] = 'FK_LicenseUser_License')
    ALTER TABLE [dbo].[LicenseUser] WITH CHECK ADD CONSTRAINT [FK_LicenseUser_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseUser] CHECK CONSTRAINT [FK_LicenseUser_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseUser' AND [CONSTRAINT_NAME] = 'FK_LicenseUser_UserMain')
    ALTER TABLE [dbo].[LicenseUser] WITH CHECK ADD CONSTRAINT [FK_LicenseUser_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseUser] CHECK CONSTRAINT [FK_LicenseUser_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseUser' AND [CONSTRAINT_NAME] = 'FK_LicenseUser_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseUser] WITH CHECK ADD CONSTRAINT [FK_LicenseUser_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseUser] CHECK CONSTRAINT [FK_LicenseUser_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ListItem' AND [CONSTRAINT_NAME] = 'FK_ListItem_ListMain')
    ALTER TABLE [dbo].[ListItem] WITH CHECK ADD CONSTRAINT [FK_ListItem_ListMain]
    FOREIGN KEY (ListKey) REFERENCES [ListMain] (ListKey)
go
ALTER TABLE [dbo].[ListItem] CHECK CONSTRAINT [FK_ListItem_ListMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ListItem' AND [CONSTRAINT_NAME] = 'FK_ListItem_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ListItem] WITH CHECK ADD CONSTRAINT [FK_ListItem_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ListItem] CHECK CONSTRAINT [FK_ListItem_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Location' AND [CONSTRAINT_NAME] = 'FK_Location_ContactMain_Contact')
    ALTER TABLE [dbo].[Location] WITH CHECK ADD CONSTRAINT [FK_Location_ContactMain_Contact]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_ContactMain_Contact]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Location' AND [CONSTRAINT_NAME] = 'FK_Location_LocationStatusRef')
    ALTER TABLE [dbo].[Location] WITH CHECK ADD CONSTRAINT [FK_Location_LocationStatusRef]
    FOREIGN KEY (LocationStatusCode) REFERENCES [LocationStatusRef] (LocationStatusCode)
go
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_LocationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Location' AND [CONSTRAINT_NAME] = 'FK_Location_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Location] WITH CHECK ADD CONSTRAINT [FK_Location_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Location' AND [CONSTRAINT_NAME] = 'FK_Location_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Location] WITH CHECK ADD CONSTRAINT [FK_Location_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MailCodeRef' AND [CONSTRAINT_NAME] = 'FK_MailCodeRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[MailCodeRef] WITH CHECK ADD CONSTRAINT [FK_MailCodeRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MailCodeRef] CHECK CONSTRAINT [FK_MailCodeRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGift' AND [CONSTRAINT_NAME] = 'FK_MatchingGift_ContactMain_Matching')
    ALTER TABLE [dbo].[MatchingGift] WITH CHECK ADD CONSTRAINT [FK_MatchingGift_ContactMain_Matching]
    FOREIGN KEY (MatchingContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[MatchingGift] CHECK CONSTRAINT [FK_MatchingGift_ContactMain_Matching]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGift' AND [CONSTRAINT_NAME] = 'FK_MatchingGift_MatchingGiftPlan')
    ALTER TABLE [dbo].[MatchingGift] WITH CHECK ADD CONSTRAINT [FK_MatchingGift_MatchingGiftPlan]
    FOREIGN KEY (MatchingGiftPlanKey) REFERENCES [MatchingGiftPlan] (MatchingGiftPlanKey)
go
ALTER TABLE [dbo].[MatchingGift] CHECK CONSTRAINT [FK_MatchingGift_MatchingGiftPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGift' AND [CONSTRAINT_NAME] = 'FK_MatchingGift_Relationship')
    ALTER TABLE [dbo].[MatchingGift] WITH CHECK ADD CONSTRAINT [FK_MatchingGift_Relationship]
    FOREIGN KEY (MatchingGiftRelationshipKey) REFERENCES [RelationshipMain] (RelationshipKey)
go
ALTER TABLE [dbo].[MatchingGift] CHECK CONSTRAINT [FK_MatchingGift_Relationship]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_AccessMain')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_ContactMain_CorprateGift')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_ContactMain_CorprateGift]
    FOREIGN KEY (CorporateGiftContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_ContactMain_CorprateGift]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_ContactMain_MatchingGift')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_ContactMain_MatchingGift]
    FOREIGN KEY (MatchingGiftContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_ContactMain_MatchingGift]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_ContactMain_Owner')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_ContactMain_Owner]
    FOREIGN KEY (OwnerContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_ContactMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_MatchingGiftPlanTypeRef')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_MatchingGiftPlanTypeRef]
    FOREIGN KEY (MatchingGiftPlanTypeKey) REFERENCES [MatchingGiftPlanTypeRef] (MatchingGiftPlanTypeKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_MatchingGiftPlanTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_ProductFundRaising_PreferredMatching')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_ProductFundRaising_PreferredMatching]
    FOREIGN KEY (PreferredMatchingProductKey) REFERENCES [ProductFundraising] (ProductKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_ProductFundRaising_PreferredMatching]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_SystemEntity')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_UniformRegistry')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_UniformRegistry]
    FOREIGN KEY (MatchingGiftPlanKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_UserMain_CreatedBy')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlan' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlan_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[MatchingGiftPlan] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlan_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MatchingGiftPlan] CHECK CONSTRAINT [FK_MatchingGiftPlan_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlanFundType' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlanFundType_FundTypeRef')
    ALTER TABLE [dbo].[MatchingGiftPlanFundType] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlanFundType_FundTypeRef]
    FOREIGN KEY (FundTypeKey) REFERENCES [FundTypeRef] (FundTypeKey)
go
ALTER TABLE [dbo].[MatchingGiftPlanFundType] CHECK CONSTRAINT [FK_MatchingGiftPlanFundType_FundTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlanFundType' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlanFundType_MatchingGiftPlan')
    ALTER TABLE [dbo].[MatchingGiftPlanFundType] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlanFundType_MatchingGiftPlan]
    FOREIGN KEY (MatchingGiftPlanKey) REFERENCES [MatchingGiftPlan] (MatchingGiftPlanKey)
go
ALTER TABLE [dbo].[MatchingGiftPlanFundType] CHECK CONSTRAINT [FK_MatchingGiftPlanFundType_MatchingGiftPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlanRule' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlanRule_MatchingGiftPlan')
    ALTER TABLE [dbo].[MatchingGiftPlanRule] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlanRule_MatchingGiftPlan]
    FOREIGN KEY (MatchingGiftPlanKey) REFERENCES [MatchingGiftPlan] (MatchingGiftPlanKey)
go
ALTER TABLE [dbo].[MatchingGiftPlanRule] CHECK CONSTRAINT [FK_MatchingGiftPlanRule_MatchingGiftPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MatchingGiftPlanRule' AND [CONSTRAINT_NAME] = 'FK_MatchingGiftPlanRule_PromotionRule')
    ALTER TABLE [dbo].[MatchingGiftPlanRule] WITH CHECK ADD CONSTRAINT [FK_MatchingGiftPlanRule_PromotionRule]
    FOREIGN KEY (RuleKey) REFERENCES [PromotionRule] (RuleKey)
go
ALTER TABLE [dbo].[MatchingGiftPlanRule] CHECK CONSTRAINT [FK_MatchingGiftPlanRule_PromotionRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTribute' AND [CONSTRAINT_NAME] = 'FK_MemorialTribute_ContactMain')
    ALTER TABLE [dbo].[MemorialTribute] WITH CHECK ADD CONSTRAINT [FK_MemorialTribute_ContactMain]
    FOREIGN KEY (HonoreeContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[MemorialTribute] CHECK CONSTRAINT [FK_MemorialTribute_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTribute' AND [CONSTRAINT_NAME] = 'FK_MemorialTribute_GroupMain_Notification')
    ALTER TABLE [dbo].[MemorialTribute] WITH CHECK ADD CONSTRAINT [FK_MemorialTribute_GroupMain_Notification]
    FOREIGN KEY (NotificationGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[MemorialTribute] CHECK CONSTRAINT [FK_MemorialTribute_GroupMain_Notification]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTribute' AND [CONSTRAINT_NAME] = 'FK_MemorialTribute_MemorialTributeCodeRef')
    ALTER TABLE [dbo].[MemorialTribute] WITH CHECK ADD CONSTRAINT [FK_MemorialTribute_MemorialTributeCodeRef]
    FOREIGN KEY (MemorialTributeCodeKey) REFERENCES [MemorialTributeCodeRef] (MemorialTributeCodeKey)
go
ALTER TABLE [dbo].[MemorialTribute] CHECK CONSTRAINT [FK_MemorialTribute_MemorialTributeCodeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTribute' AND [CONSTRAINT_NAME] = 'FK_MemorialTribute_ProductFundraising')
    ALTER TABLE [dbo].[MemorialTribute] WITH CHECK ADD CONSTRAINT [FK_MemorialTribute_ProductFundraising]
    FOREIGN KEY (FRProductKey) REFERENCES [ProductFundraising] (ProductKey)
go
ALTER TABLE [dbo].[MemorialTribute] CHECK CONSTRAINT [FK_MemorialTribute_ProductFundraising]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTributeNotificationMember' AND [CONSTRAINT_NAME] = 'FK_MemorialTributeNotificationMember_FundraisingPreferenceRef')
    ALTER TABLE [dbo].[MemorialTributeNotificationMember] WITH CHECK ADD CONSTRAINT [FK_MemorialTributeNotificationMember_FundraisingPreferenceRef]
    FOREIGN KEY (MemorialTributeNotificationPreferenceCode) REFERENCES [FundraisingPreferenceRef] (FundraisingPreferenceCode)
go
ALTER TABLE [dbo].[MemorialTributeNotificationMember] CHECK CONSTRAINT [FK_MemorialTributeNotificationMember_FundraisingPreferenceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTributeNotificationMember' AND [CONSTRAINT_NAME] = 'FK_MemorialTributeNotificationMember_GroupMember')
    ALTER TABLE [dbo].[MemorialTributeNotificationMember] WITH CHECK ADD CONSTRAINT [FK_MemorialTributeNotificationMember_GroupMember]
    FOREIGN KEY (GroupMemberKey) REFERENCES [GroupMember] (GroupMemberKey)
go
ALTER TABLE [dbo].[MemorialTributeNotificationMember] CHECK CONSTRAINT [FK_MemorialTributeNotificationMember_GroupMember]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MemorialTributeNotificationMember' AND [CONSTRAINT_NAME] = 'FK_MemorialTributeNotificationMember_Relationship')
    ALTER TABLE [dbo].[MemorialTributeNotificationMember] WITH CHECK ADD CONSTRAINT [FK_MemorialTributeNotificationMember_Relationship]
    FOREIGN KEY (RelationshipKey) REFERENCES [RelationshipMain] (RelationshipKey)
go
ALTER TABLE [dbo].[MemorialTributeNotificationMember] CHECK CONSTRAINT [FK_MemorialTributeNotificationMember_Relationship]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MethodSet' AND [CONSTRAINT_NAME] = 'FK_MethodSet_MethodSetTypeRef')
    ALTER TABLE [dbo].[MethodSet] WITH CHECK ADD CONSTRAINT [FK_MethodSet_MethodSetTypeRef]
    FOREIGN KEY (MethodSetTypeCode) REFERENCES [MethodSetTypeRef] (MethodSetTypeCode)
go
ALTER TABLE [dbo].[MethodSet] CHECK CONSTRAINT [FK_MethodSet_MethodSetTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MethodSet' AND [CONSTRAINT_NAME] = 'FK_MethodSet_SystemEntity')
    ALTER TABLE [dbo].[MethodSet] WITH CHECK ADD CONSTRAINT [FK_MethodSet_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[MethodSet] CHECK CONSTRAINT [FK_MethodSet_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MethodSet' AND [CONSTRAINT_NAME] = 'FK_MethodSet_UserMain_CreatedBy')
    ALTER TABLE [dbo].[MethodSet] WITH CHECK ADD CONSTRAINT [FK_MethodSet_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MethodSet] CHECK CONSTRAINT [FK_MethodSet_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MethodSet' AND [CONSTRAINT_NAME] = 'FK_MethodSet_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[MethodSet] WITH CHECK ADD CONSTRAINT [FK_MethodSet_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MethodSet] CHECK CONSTRAINT [FK_MethodSet_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_MethodSetDetail_MethodSet')
    ALTER TABLE [dbo].[MethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_MethodSetDetail_MethodSet]
    FOREIGN KEY (MethodSetKey) REFERENCES [MethodSet] (MethodSetKey)
go
ALTER TABLE [dbo].[MethodSetDetail] CHECK CONSTRAINT [FK_MethodSetDetail_MethodSet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MiscCharge' AND [CONSTRAINT_NAME] = 'FK_MiscCharge_OrderShipTo')
    ALTER TABLE [dbo].[MiscCharge] WITH CHECK ADD CONSTRAINT [FK_MiscCharge_OrderShipTo]
    FOREIGN KEY (OrderShipToKey) REFERENCES [OrderShipTo] (OrderShipToKey)
go
ALTER TABLE [dbo].[MiscCharge] CHECK CONSTRAINT [FK_MiscCharge_OrderShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MiscCharge' AND [CONSTRAINT_NAME] = 'FK_MiscCharge_ProductMain')
    ALTER TABLE [dbo].[MiscCharge] WITH CHECK ADD CONSTRAINT [FK_MiscCharge_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[MiscCharge] CHECK CONSTRAINT [FK_MiscCharge_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MiscCharge' AND [CONSTRAINT_NAME] = 'FK_MiscCharge_UserMain_CreatedBy')
    ALTER TABLE [dbo].[MiscCharge] WITH CHECK ADD CONSTRAINT [FK_MiscCharge_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[MiscCharge] CHECK CONSTRAINT [FK_MiscCharge_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_BatchInstance')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_InvoiceDistribution')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_InvoiceDistribution]
    FOREIGN KEY (InvoiceDistributionKey) REFERENCES [InvoiceDistribution] (InvoiceDistributionKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_InvoiceDistribution]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_InvoiceLine')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_InvoiceLine_Src')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_InvoiceLine_Src]
    FOREIGN KEY (SrcInvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_InvoiceLine_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_InvoiceMain')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_PaymentMain_Src')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_PaymentMain_Src]
    FOREIGN KEY (SrcPaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_PaymentMain_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'MonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_MonetaryApplication_PaymentScheduleLine')
    ALTER TABLE [dbo].[MonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_MonetaryApplication_PaymentScheduleLine]
    FOREIGN KEY (PaymentScheduleLineKey) REFERENCES [PaymentScheduleLine] (PaymentScheduleLineKey)
go
ALTER TABLE [dbo].[MonetaryApplication] CHECK CONSTRAINT [FK_MonetaryApplication_PaymentScheduleLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_Nav_Menu_Website')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_Nav_Menu_Website]
    FOREIGN KEY (WebsiteKey) REFERENCES [Website] (WebsiteKey)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_Nav_Menu_Website]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_ComponentScript')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_ComponentScript]
    FOREIGN KEY (ComponentCode, ComponentScriptCode) REFERENCES [Component_Script_Ref] (ComponentCode, ComponentScriptCode)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_ComponentScript]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_Content')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_ContentAuthGroup')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_ContentAuthGroup]
    FOREIGN KEY (ContentAuthorityGroupID) REFERENCES [Content_Authority_Group] (ContentAuthorityGroupID)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_ContentAuthGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_Producer')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_Producer]
    FOREIGN KEY (OwnerContactID) REFERENCES [Producer] (ContactID)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_Producer]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_Producer2')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_Producer2]
    FOREIGN KEY (LastUpdatedByContactID) REFERENCES [Producer] (ContactID)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_Producer2]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu' AND [CONSTRAINT_NAME] = 'FK_NavMenu_WorkflowStatus')
    ALTER TABLE [dbo].[Nav_Menu] WITH CHECK ADD CONSTRAINT [FK_NavMenu_WorkflowStatus]
    FOREIGN KEY (WorkflowStatusCode) REFERENCES [Workflow_Status_Ref] (WorkflowStatusCode)
go
ALTER TABLE [dbo].[Nav_Menu] CHECK CONSTRAINT [FK_NavMenu_WorkflowStatus]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Feature' AND [CONSTRAINT_NAME] = 'FK_NavMenuFeature_NavMenu')
    ALTER TABLE [dbo].[Nav_Menu_Feature] WITH CHECK ADD CONSTRAINT [FK_NavMenuFeature_NavMenu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Nav_Menu_Feature] CHECK CONSTRAINT [FK_NavMenuFeature_NavMenu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Security_Group' AND [CONSTRAINT_NAME] = 'FK_Nav_Menu_Security_Group_Nav_Menu')
    ALTER TABLE [dbo].[Nav_Menu_Security_Group] WITH CHECK ADD CONSTRAINT [FK_Nav_Menu_Security_Group_Nav_Menu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Nav_Menu_Security_Group] CHECK CONSTRAINT [FK_Nav_Menu_Security_Group_Nav_Menu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Website' AND [CONSTRAINT_NAME] = 'FK_Nav_Menu_Website_Nav_Menu')
    ALTER TABLE [dbo].[Nav_Menu_Website] WITH CHECK ADD CONSTRAINT [FK_Nav_Menu_Website_Nav_Menu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Nav_Menu_Website] CHECK CONSTRAINT [FK_Nav_Menu_Website_Nav_Menu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Website' AND [CONSTRAINT_NAME] = 'FK_Nav_Menu_Website_Website')
    ALTER TABLE [dbo].[Nav_Menu_Website] WITH CHECK ADD CONSTRAINT [FK_Nav_Menu_Website_Website]
    FOREIGN KEY (WebsiteKey) REFERENCES [Website] (WebsiteKey)
go
ALTER TABLE [dbo].[Nav_Menu_Website] CHECK CONSTRAINT [FK_Nav_Menu_Website_Website]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_NavMenuWork_NavMenu')
    ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_NavMenuWork_NavMenu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] CHECK CONSTRAINT [FK_NavMenuWork_NavMenu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_NavMenuWork_Producer')
    ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_NavMenuWork_Producer]
    FOREIGN KEY (ContactID) REFERENCES [Producer] (ContactID)
go
ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] CHECK CONSTRAINT [FK_NavMenuWork_Producer]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Nav_Menu_Workflow_Log' AND [CONSTRAINT_NAME] = 'FK_NavMenuWork_WorkStatus')
    ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] WITH CHECK ADD CONSTRAINT [FK_NavMenuWork_WorkStatus]
    FOREIGN KEY (WorkflowStatusCode) REFERENCES [Workflow_Status_Ref] (WorkflowStatusCode)
go
ALTER TABLE [dbo].[Nav_Menu_Workflow_Log] CHECK CONSTRAINT [FK_NavMenuWork_WorkStatus]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NavigationExport' AND [CONSTRAINT_NAME] = 'FK_NavigationExport_UserMain_CreatedBy')
    ALTER TABLE [dbo].[NavigationExport] WITH CHECK ADD CONSTRAINT [FK_NavigationExport_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NavigationExport] CHECK CONSTRAINT [FK_NavigationExport_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NavigationExport' AND [CONSTRAINT_NAME] = 'FK_NavigationExport_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[NavigationExport] WITH CHECK ADD CONSTRAINT [FK_NavigationExport_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NavigationExport] CHECK CONSTRAINT [FK_NavigationExport_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NavigationMain' AND [CONSTRAINT_NAME] = 'FK_NavigationMain_AccessArea')
    ALTER TABLE [dbo].[NavigationMain] WITH CHECK ADD CONSTRAINT [FK_NavigationMain_AccessArea]
    FOREIGN KEY (AccessAreaKey) REFERENCES [AccessArea] (AccessAreaKey)
go
ALTER TABLE [dbo].[NavigationMain] CHECK CONSTRAINT [FK_NavigationMain_AccessArea]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NavigationMain' AND [CONSTRAINT_NAME] = 'FK_NavigationMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[NavigationMain] WITH CHECK ADD CONSTRAINT [FK_NavigationMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NavigationMain] CHECK CONSTRAINT [FK_NavigationMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'NavigationMain' AND [CONSTRAINT_NAME] = 'FK_NavigationMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[NavigationMain] WITH CHECK ADD CONSTRAINT [FK_NavigationMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[NavigationMain] CHECK CONSTRAINT [FK_NavigationMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_AccessMain')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_NotePurposeRef')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_NotePurposeRef]
    FOREIGN KEY (NotePurposeKey) REFERENCES [NotePurposeRef] (NotePurposeKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_NotePurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_UniformRegistry')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_UniformRegistry]
    FOREIGN KEY (NoteKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_UniformRegistry_NoteFor')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_UniformRegistry_NoteFor]
    FOREIGN KEY (NoteForUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_UniformRegistry_NoteFor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Note' AND [CONSTRAINT_NAME] = 'FK_Note_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Note] WITH CHECK ADD CONSTRAINT [FK_Note_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OfferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_OfferedCustomerExperience_CustomerExperience')
    ALTER TABLE [dbo].[OfferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_OfferedCustomerExperience_CustomerExperience]
    FOREIGN KEY (OfferedCustomerExperienceKey) REFERENCES [CustomerExperience] (CustomerExperienceKey)
go
ALTER TABLE [dbo].[OfferedCustomerExperience] CHECK CONSTRAINT [FK_OfferedCustomerExperience_CustomerExperience]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OfferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_OfferedCustomerExperience_GradeRef')
    ALTER TABLE [dbo].[OfferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_OfferedCustomerExperience_GradeRef]
    FOREIGN KEY (OfferedCustomerExperienceGradeKey) REFERENCES [GradeRef] (GradeKey)
go
ALTER TABLE [dbo].[OfferedCustomerExperience] CHECK CONSTRAINT [FK_OfferedCustomerExperience_GradeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OfferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_OfferedCustomerExperience_Offering')
    ALTER TABLE [dbo].[OfferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_OfferedCustomerExperience_Offering]
    FOREIGN KEY (OfferingKey) REFERENCES [Offering] (OfferingKey)
go
ALTER TABLE [dbo].[OfferedCustomerExperience] CHECK CONSTRAINT [FK_OfferedCustomerExperience_Offering]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Offering' AND [CONSTRAINT_NAME] = 'FK_Offering_ContactMain')
    ALTER TABLE [dbo].[Offering] WITH CHECK ADD CONSTRAINT [FK_Offering_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [FK_Offering_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Offering' AND [CONSTRAINT_NAME] = 'FK_Offering_OfferingStatusRef')
    ALTER TABLE [dbo].[Offering] WITH CHECK ADD CONSTRAINT [FK_Offering_OfferingStatusRef]
    FOREIGN KEY (OfferingStatusCode) REFERENCES [OfferingStatusRef] (OfferingStatusCode)
go
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [FK_Offering_OfferingStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Offering' AND [CONSTRAINT_NAME] = 'FK_Offering_Program')
    ALTER TABLE [dbo].[Offering] WITH CHECK ADD CONSTRAINT [FK_Offering_Program]
    FOREIGN KEY (LinkedProgramKey) REFERENCES [Program] (ProgramKey)
go
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [FK_Offering_Program]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Offering' AND [CONSTRAINT_NAME] = 'FK_Offering_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Offering] WITH CHECK ADD CONSTRAINT [FK_Offering_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [FK_Offering_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Offering' AND [CONSTRAINT_NAME] = 'FK_Offering_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Offering] WITH CHECK ADD CONSTRAINT [FK_Offering_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [FK_Offering_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityCompetitor' AND [CONSTRAINT_NAME] = 'FK_OpportunityCompetitor_OpportunityMain')
    ALTER TABLE [dbo].[OpportunityCompetitor] WITH CHECK ADD CONSTRAINT [FK_OpportunityCompetitor_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[OpportunityCompetitor] CHECK CONSTRAINT [FK_OpportunityCompetitor_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityCompetitor' AND [CONSTRAINT_NAME] = 'FK_OpportunityCompetitor_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OpportunityCompetitor] WITH CHECK ADD CONSTRAINT [FK_OpportunityCompetitor_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityCompetitor] CHECK CONSTRAINT [FK_OpportunityCompetitor_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityCompetitor' AND [CONSTRAINT_NAME] = 'FK_OpportunityCompetitor_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OpportunityCompetitor] WITH CHECK ADD CONSTRAINT [FK_OpportunityCompetitor_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityCompetitor] CHECK CONSTRAINT [FK_OpportunityCompetitor_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityHistory' AND [CONSTRAINT_NAME] = 'FK_OpportunityHistory_OpportunityMain')
    ALTER TABLE [dbo].[OpportunityHistory] WITH CHECK ADD CONSTRAINT [FK_OpportunityHistory_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[OpportunityHistory] CHECK CONSTRAINT [FK_OpportunityHistory_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityHistory' AND [CONSTRAINT_NAME] = 'FK_OpportunityHistory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OpportunityHistory] WITH CHECK ADD CONSTRAINT [FK_OpportunityHistory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityHistory] CHECK CONSTRAINT [FK_OpportunityHistory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityHistory' AND [CONSTRAINT_NAME] = 'FK_OpportunityHistory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OpportunityHistory] WITH CHECK ADD CONSTRAINT [FK_OpportunityHistory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityHistory] CHECK CONSTRAINT [FK_OpportunityHistory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_AccessMain')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_ContactMain')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_ContactMain]
    FOREIGN KEY (ProspectKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_OpportunityStatusRef')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_OpportunityStatusRef]
    FOREIGN KEY (OpportunityStatusCode) REFERENCES [OpportunityStatusRef] (OpportunityStatusCode)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_OpportunityStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_OpportunityType')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_OpportunityType]
    FOREIGN KEY (OpportunityTypeKey) REFERENCES [OpportunityType] (OpportunityTypeKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_OpportunityType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_ProductMain')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_UniformRegistry')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_UniformRegistry]
    FOREIGN KEY (OpportunityKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMain' AND [CONSTRAINT_NAME] = 'FK_OpportunityMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OpportunityMain] WITH CHECK ADD CONSTRAINT [FK_OpportunityMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityMain] CHECK CONSTRAINT [FK_OpportunityMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMainDonor' AND [CONSTRAINT_NAME] = 'FK_OpportunityMainDonor_OpportunityMain')
    ALTER TABLE [dbo].[OpportunityMainDonor] WITH CHECK ADD CONSTRAINT [FK_OpportunityMainDonor_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[OpportunityMainDonor] CHECK CONSTRAINT [FK_OpportunityMainDonor_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMainMember' AND [CONSTRAINT_NAME] = 'FK_OpportunityMainMember_OpportunityMain')
    ALTER TABLE [dbo].[OpportunityMainMember] WITH CHECK ADD CONSTRAINT [FK_OpportunityMainMember_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[OpportunityMainMember] CHECK CONSTRAINT [FK_OpportunityMainMember_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityMainSales' AND [CONSTRAINT_NAME] = 'FK_OpportunityMainSales_OpportunityMain')
    ALTER TABLE [dbo].[OpportunityMainSales] WITH CHECK ADD CONSTRAINT [FK_OpportunityMainSales_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[OpportunityMainSales] CHECK CONSTRAINT [FK_OpportunityMainSales_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityType' AND [CONSTRAINT_NAME] = 'FK_OpportunityType_AccessMain')
    ALTER TABLE [dbo].[OpportunityType] WITH CHECK ADD CONSTRAINT [FK_OpportunityType_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[OpportunityType] CHECK CONSTRAINT [FK_OpportunityType_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityType' AND [CONSTRAINT_NAME] = 'FK_OpportunityType_ActionPlan')
    ALTER TABLE [dbo].[OpportunityType] WITH CHECK ADD CONSTRAINT [FK_OpportunityType_ActionPlan]
    FOREIGN KEY (DefaultActionPlanKey) REFERENCES [ActionPlan] (ActionPlanKey)
go
ALTER TABLE [dbo].[OpportunityType] CHECK CONSTRAINT [FK_OpportunityType_ActionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityType' AND [CONSTRAINT_NAME] = 'FK_OpportunityType_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OpportunityType] WITH CHECK ADD CONSTRAINT [FK_OpportunityType_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityType] CHECK CONSTRAINT [FK_OpportunityType_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OpportunityType' AND [CONSTRAINT_NAME] = 'FK_OpportunityType_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OpportunityType] WITH CHECK ADD CONSTRAINT [FK_OpportunityType_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OpportunityType] CHECK CONSTRAINT [FK_OpportunityType_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderCategoryParentLookup' AND [CONSTRAINT_NAME] = 'FK_OrderCategoryParentLookup_OrderCategory')
    ALTER TABLE [dbo].[OrderCategoryParentLookup] WITH CHECK ADD CONSTRAINT [FK_OrderCategoryParentLookup_OrderCategory]
    FOREIGN KEY (OrderCategoryParentID) REFERENCES [OrderCategory] (OrderCategoryID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderCategoryParentLookup] CHECK CONSTRAINT [FK_OrderCategoryParentLookup_OrderCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderFulfillmentLine' AND [CONSTRAINT_NAME] = 'FK_OrderFulfillmentLine_Commitment')
    ALTER TABLE [dbo].[OrderFulfillmentLine] WITH CHECK ADD CONSTRAINT [FK_OrderFulfillmentLine_Commitment]
    FOREIGN KEY (InventoryCommitmentKey) REFERENCES [Commitment] (CommitmentKey)
go
ALTER TABLE [dbo].[OrderFulfillmentLine] CHECK CONSTRAINT [FK_OrderFulfillmentLine_Commitment]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderFulfillmentLine' AND [CONSTRAINT_NAME] = 'FK_OrderFulfillmentLine_OrderLine')
    ALTER TABLE [dbo].[OrderFulfillmentLine] WITH CHECK ADD CONSTRAINT [FK_OrderFulfillmentLine_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[OrderFulfillmentLine] CHECK CONSTRAINT [FK_OrderFulfillmentLine_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderFulfillmentLine' AND [CONSTRAINT_NAME] = 'FK_OrderFulfillmentLine_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderFulfillmentLine] WITH CHECK ADD CONSTRAINT [FK_OrderFulfillmentLine_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderFulfillmentLine] CHECK CONSTRAINT [FK_OrderFulfillmentLine_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderFulfillmentLine' AND [CONSTRAINT_NAME] = 'FK_OrderFulfillmentLine_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderFulfillmentLine] WITH CHECK ADD CONSTRAINT [FK_OrderFulfillmentLine_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderFulfillmentLine] CHECK CONSTRAINT [FK_OrderFulfillmentLine_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderFulfillmentLine' AND [CONSTRAINT_NAME] = 'FK_OrderFulfillmentLine_Warehouse')
    ALTER TABLE [dbo].[OrderFulfillmentLine] WITH CHECK ADD CONSTRAINT [FK_OrderFulfillmentLine_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[OrderFulfillmentLine] CHECK CONSTRAINT [FK_OrderFulfillmentLine_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_GroupMain')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_HoldCode')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_HoldCode]
    FOREIGN KEY (HoldCodeKey) REFERENCES [HoldCode] (HoldCodeKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_HoldCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_LinePricingRef')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_LinePricingRef]
    FOREIGN KEY (LinePricingCode) REFERENCES [LinePricingRef] (LinePricingCode)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_LinePricingRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_OrderLine_Parent')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderLine_Parent]
    FOREIGN KEY (ParentOrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderLine_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_OrderMain')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_OrderPromotion')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderPromotion]
    FOREIGN KEY (OrderPromotionKey) REFERENCES [OrderPromotion] (OrderPromotionKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderPromotion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_OrderShipTo')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderShipTo]
    FOREIGN KEY (OrderShipToKey) REFERENCES [OrderShipTo] (OrderShipToKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_OrderStateRef')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderStateRef]
    FOREIGN KEY (OrderStateCode) REFERENCES [OrderStateRef] (OrderStateCode)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderStateRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_PaymentTerms')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_PriceSheet')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_ProductMain')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_ProductType')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_ProductType]
    FOREIGN KEY (ProductTypeKey) REFERENCES [ProductType] (ProductTypeKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_ProductType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_SourceCode')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_TaxSchedule')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_Uom')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderLine' AND [CONSTRAINT_NAME] = 'FK_OrderLine_Warehouse_Default')
    ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_Warehouse_Default]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Warehouse_Default]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_AccessMain')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_BatchInstance_Final')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_BatchInstance_Final]
    FOREIGN KEY (FinalBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_BatchInstance_Final]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_CommissionPlan')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_ContactMain_BillTo')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_ContactMain_SoldTo')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_ContactMain_SoldTo]
    FOREIGN KEY (SoldToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_ContactMain_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_Currency')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_FinancialEntity')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_FullAddress_BillTo')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_FullAddress_BillTo]
    FOREIGN KEY (BillToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_FullAddress_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_FullAddress_SoldTo')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_FullAddress_SoldTo]
    FOREIGN KEY (SoldToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_FullAddress_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_GroupMain')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_GroupMain_Owner')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_HoldCode')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_HoldCode]
    FOREIGN KEY (HoldCodeKey) REFERENCES [HoldCode] (HoldCodeKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_HoldCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_Locale')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_Locale]
    FOREIGN KEY (CultureCode) REFERENCES [CultureRef] (CultureCode)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_Locale]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_OrderStateRef')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_OrderStateRef]
    FOREIGN KEY (OrderStateCode) REFERENCES [OrderStateRef] (OrderStateCode)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_OrderStateRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_OrderType')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_OrderType]
    FOREIGN KEY (OrderTypeKey) REFERENCES [OrderType] (OrderTypeKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_OrderType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_PaymentTerms')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_PriceSheet')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_ReasonCode')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_ReasonCode]
    FOREIGN KEY (ReasonCodeKey) REFERENCES [ReasonCode] (ReasonCodeKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_ReasonCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_ResponseMediaRef')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_ResponseMediaRef]
    FOREIGN KEY (ResponseMediaCode) REFERENCES [ResponseMediaRef] (ResponseMediaCode)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_ResponseMediaRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_SalesLocation')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_SalesLocation]
    FOREIGN KEY (SalesLocationKey) REFERENCES [SalesLocation] (SalesLocationKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_SalesLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_SystemEntity')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_UniformRegistry')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_UniformRegistry]
    FOREIGN KEY (OrderKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderMain' AND [CONSTRAINT_NAME] = 'FK_OrderMain_Warehouse_Default')
    ALTER TABLE [dbo].[OrderMain] WITH CHECK ADD CONSTRAINT [FK_OrderMain_Warehouse_Default]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_Warehouse_Default]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPickLine' AND [CONSTRAINT_NAME] = 'FK_OrderPickLine_OrderFulfillmentLine')
    ALTER TABLE [dbo].[OrderPickLine] WITH CHECK ADD CONSTRAINT [FK_OrderPickLine_OrderFulfillmentLine]
    FOREIGN KEY (OrderFulfillmentLineKey) REFERENCES [OrderFulfillmentLine] (OrderFulfillmentLineKey)
go
ALTER TABLE [dbo].[OrderPickLine] CHECK CONSTRAINT [FK_OrderPickLine_OrderFulfillmentLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPickLine' AND [CONSTRAINT_NAME] = 'FK_OrderShipLine_ProductInventory')
    ALTER TABLE [dbo].[OrderPickLine] WITH CHECK ADD CONSTRAINT [FK_OrderShipLine_ProductInventory]
    FOREIGN KEY (ProductInventoryKey) REFERENCES [ProductInventory] (ProductInventoryKey)
go
ALTER TABLE [dbo].[OrderPickLine] CHECK CONSTRAINT [FK_OrderShipLine_ProductInventory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderProductCategoryLookup' AND [CONSTRAINT_NAME] = 'FK_OrderProductCategoryLookup_OrderCategory')
    ALTER TABLE [dbo].[OrderProductCategoryLookup] WITH CHECK ADD CONSTRAINT [FK_OrderProductCategoryLookup_OrderCategory]
    FOREIGN KEY (OrderCategoryID) REFERENCES [OrderCategory] (OrderCategoryID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderProductCategoryLookup] CHECK CONSTRAINT [FK_OrderProductCategoryLookup_OrderCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderProductCategoryLookup' AND [CONSTRAINT_NAME] = 'FK_OrderProductCategoryLookup_OrderProduct')
    ALTER TABLE [dbo].[OrderProductCategoryLookup] WITH CHECK ADD CONSTRAINT [FK_OrderProductCategoryLookup_OrderProduct]
    FOREIGN KEY (OrderProductID) REFERENCES [OrderProduct] (OrderProductID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderProductCategoryLookup] CHECK CONSTRAINT [FK_OrderProductCategoryLookup_OrderProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderProductCrossSellLookup' AND [CONSTRAINT_NAME] = 'FK_OrderProductCrossSellLookup_OrderProduct')
    ALTER TABLE [dbo].[OrderProductCrossSellLookup] WITH CHECK ADD CONSTRAINT [FK_OrderProductCrossSellLookup_OrderProduct]
    FOREIGN KEY (OrderProductID) REFERENCES [OrderProduct] (OrderProductID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderProductCrossSellLookup] CHECK CONSTRAINT [FK_OrderProductCrossSellLookup_OrderProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderProductCrossSellLookup' AND [CONSTRAINT_NAME] = 'FK_OrderProductCrossSellLookup_OrderProduct_CrossSell')
    ALTER TABLE [dbo].[OrderProductCrossSellLookup] WITH CHECK ADD CONSTRAINT [FK_OrderProductCrossSellLookup_OrderProduct_CrossSell]
    FOREIGN KEY (CrossSellOrderProductID) REFERENCES [OrderProduct] (OrderProductID)
go
ALTER TABLE [dbo].[OrderProductCrossSellLookup] CHECK CONSTRAINT [FK_OrderProductCrossSellLookup_OrderProduct_CrossSell]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPromotion' AND [CONSTRAINT_NAME] = 'FK_OrderLinePromotion_OrderLine')
    ALTER TABLE [dbo].[OrderPromotion] WITH CHECK ADD CONSTRAINT [FK_OrderLinePromotion_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderLinePromotion_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPromotion' AND [CONSTRAINT_NAME] = 'FK_OrderLinePromotion_PromotionDiscount')
    ALTER TABLE [dbo].[OrderPromotion] WITH CHECK ADD CONSTRAINT [FK_OrderLinePromotion_PromotionDiscount]
    FOREIGN KEY (PromotionDiscountKey) REFERENCES [PromotionDiscount] (PromotionDiscountKey)
go
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderLinePromotion_PromotionDiscount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPromotion' AND [CONSTRAINT_NAME] = 'FK_OrderPromotion_OrderMain')
    ALTER TABLE [dbo].[OrderPromotion] WITH CHECK ADD CONSTRAINT [FK_OrderPromotion_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderPromotion_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPromotion' AND [CONSTRAINT_NAME] = 'FK_OrderPromotion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderPromotion] WITH CHECK ADD CONSTRAINT [FK_OrderPromotion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderPromotion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderShipTo' AND [CONSTRAINT_NAME] = 'FK_OrderShipTo_ContactMain')
    ALTER TABLE [dbo].[OrderShipTo] WITH CHECK ADD CONSTRAINT [FK_OrderShipTo_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[OrderShipTo] CHECK CONSTRAINT [FK_OrderShipTo_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderShipTo' AND [CONSTRAINT_NAME] = 'FK_OrderShipTo_FullAddress')
    ALTER TABLE [dbo].[OrderShipTo] WITH CHECK ADD CONSTRAINT [FK_OrderShipTo_FullAddress]
    FOREIGN KEY (FullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[OrderShipTo] CHECK CONSTRAINT [FK_OrderShipTo_FullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderShipTo' AND [CONSTRAINT_NAME] = 'FK_OrderShipTo_OrderMain')
    ALTER TABLE [dbo].[OrderShipTo] WITH CHECK ADD CONSTRAINT [FK_OrderShipTo_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[OrderShipTo] CHECK CONSTRAINT [FK_OrderShipTo_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderShipTo' AND [CONSTRAINT_NAME] = 'FK_OrderShipTo_ShipMethod')
    ALTER TABLE [dbo].[OrderShipTo] WITH CHECK ADD CONSTRAINT [FK_OrderShipTo_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[OrderShipTo] CHECK CONSTRAINT [FK_OrderShipTo_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderShipTo' AND [CONSTRAINT_NAME] = 'FK_OrderShipTo_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderShipTo] WITH CHECK ADD CONSTRAINT [FK_OrderShipTo_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderShipTo] CHECK CONSTRAINT [FK_OrderShipTo_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductAttributeLookup' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductAttributeLookup_OrderProduct')
    ALTER TABLE [dbo].[OrderSuperProductAttributeLookup] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductAttributeLookup_OrderProduct]
    FOREIGN KEY (OrderProductID) REFERENCES [OrderProduct] (OrderProductID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderSuperProductAttributeLookup] CHECK CONSTRAINT [FK_OrderSuperProductAttributeLookup_OrderProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductAttributeLookup' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductAttributeLookup_OrderSuperProductAttribute')
    ALTER TABLE [dbo].[OrderSuperProductAttributeLookup] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductAttributeLookup_OrderSuperProductAttribute]
    FOREIGN KEY (OrderSuperProductAttributeID) REFERENCES [OrderSuperProductAttribute] (OrderSuperProductAttributeID)
go
ALTER TABLE [dbo].[OrderSuperProductAttributeLookup] CHECK CONSTRAINT [FK_OrderSuperProductAttributeLookup_OrderSuperProductAttribute]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductAttributeValue' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductAttributeValue_OrderSuperProductAttribute')
    ALTER TABLE [dbo].[OrderSuperProductAttributeValue] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductAttributeValue_OrderSuperProductAttribute]
    FOREIGN KEY (OrderSuperProductAttributeID) REFERENCES [OrderSuperProductAttribute] (OrderSuperProductAttributeID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderSuperProductAttributeValue] CHECK CONSTRAINT [FK_OrderSuperProductAttributeValue_OrderSuperProductAttribute]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductChildProduct' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductChildProduct_OrderProduct')
    ALTER TABLE [dbo].[OrderSuperProductChildProduct] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductChildProduct_OrderProduct]
    FOREIGN KEY (OrderProductID) REFERENCES [OrderProduct] (OrderProductID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderSuperProductChildProduct] CHECK CONSTRAINT [FK_OrderSuperProductChildProduct_OrderProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductChildProductAttribute' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductChildProductAttribute_OrderSuperProductAttributeValue')
    ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductChildProductAttribute_OrderSuperProductAttributeValue]
    FOREIGN KEY (OrderSuperProductAttributeValueID) REFERENCES [OrderSuperProductAttributeValue] (OrderSuperProductAttributeValueID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute] CHECK CONSTRAINT [FK_OrderSuperProductChildProductAttribute_OrderSuperProductAttributeValue]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderSuperProductChildProductAttribute' AND [CONSTRAINT_NAME] = 'FK_OrderSuperProductChildProductAttribute_OrderSuperProductChildProduct')
    ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute] WITH CHECK ADD CONSTRAINT [FK_OrderSuperProductChildProductAttribute_OrderSuperProductChildProduct]
    FOREIGN KEY (OrderSuperProductChildProductID) REFERENCES [OrderSuperProductChildProduct] (OrderSuperProductChildProductID)
ON UPDATE CASCADE
ON DELETE CASCADE
go
ALTER TABLE [dbo].[OrderSuperProductChildProductAttribute] CHECK CONSTRAINT [FK_OrderSuperProductChildProductAttribute_OrderSuperProductChildProduct]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderTaxLine' AND [CONSTRAINT_NAME] = 'FK_OrderTaxLine_OrderLine')
    ALTER TABLE [dbo].[OrderTaxLine] WITH CHECK ADD CONSTRAINT [FK_OrderTaxLine_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[OrderTaxLine] CHECK CONSTRAINT [FK_OrderTaxLine_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderTaxLine' AND [CONSTRAINT_NAME] = 'FK_OrderTaxLine_OrderMain')
    ALTER TABLE [dbo].[OrderTaxLine] WITH CHECK ADD CONSTRAINT [FK_OrderTaxLine_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[OrderTaxLine] CHECK CONSTRAINT [FK_OrderTaxLine_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderTaxLine' AND [CONSTRAINT_NAME] = 'FK_OrderTaxLine_ProductMain')
    ALTER TABLE [dbo].[OrderTaxLine] WITH CHECK ADD CONSTRAINT [FK_OrderTaxLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[OrderTaxLine] CHECK CONSTRAINT [FK_OrderTaxLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderTaxLine' AND [CONSTRAINT_NAME] = 'FK_OrderTaxLine_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderTaxLine] WITH CHECK ADD CONSTRAINT [FK_OrderTaxLine_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderTaxLine] CHECK CONSTRAINT [FK_OrderTaxLine_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderTaxLine' AND [CONSTRAINT_NAME] = 'FK_OrderTaxLine_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderTaxLine] WITH CHECK ADD CONSTRAINT [FK_OrderTaxLine_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderTaxLine] CHECK CONSTRAINT [FK_OrderTaxLine_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderType' AND [CONSTRAINT_NAME] = 'FK_OrderType_ResponseMediaRef')
    ALTER TABLE [dbo].[OrderType] WITH CHECK ADD CONSTRAINT [FK_OrderType_ResponseMediaRef]
    FOREIGN KEY (ResponseMediaCode) REFERENCES [ResponseMediaRef] (ResponseMediaCode)
go
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_ResponseMediaRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderType' AND [CONSTRAINT_NAME] = 'FK_OrderType_SystemEntity')
    ALTER TABLE [dbo].[OrderType] WITH CHECK ADD CONSTRAINT [FK_OrderType_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderType' AND [CONSTRAINT_NAME] = 'FK_OrderType_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrderType] WITH CHECK ADD CONSTRAINT [FK_OrderType_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderType' AND [CONSTRAINT_NAME] = 'FK_OrderType_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrderType] WITH CHECK ADD CONSTRAINT [FK_OrderType_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderType' AND [CONSTRAINT_NAME] = 'FK_OrderType_Warehouse')
    ALTER TABLE [dbo].[OrderType] WITH CHECK ADD CONSTRAINT [FK_OrderType_Warehouse]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrganizationMain' AND [CONSTRAINT_NAME] = 'FK_OrganizationMain_GroupMain')
    ALTER TABLE [dbo].[OrganizationMain] WITH CHECK ADD CONSTRAINT [FK_OrganizationMain_GroupMain]
    FOREIGN KEY (DefaultDepartmentGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[OrganizationMain] CHECK CONSTRAINT [FK_OrganizationMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrganizationMain' AND [CONSTRAINT_NAME] = 'FK_OrganizationMain_UniformRegistry')
    ALTER TABLE [dbo].[OrganizationMain] WITH CHECK ADD CONSTRAINT [FK_OrganizationMain_UniformRegistry]
    FOREIGN KEY (OrganizationKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[OrganizationMain] CHECK CONSTRAINT [FK_OrganizationMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrganizationMain' AND [CONSTRAINT_NAME] = 'FK_OrganizationMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[OrganizationMain] WITH CHECK ADD CONSTRAINT [FK_OrganizationMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrganizationMain] CHECK CONSTRAINT [FK_OrganizationMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrganizationMain' AND [CONSTRAINT_NAME] = 'FK_OrganizationMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[OrganizationMain] WITH CHECK ADD CONSTRAINT [FK_OrganizationMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[OrganizationMain] CHECK CONSTRAINT [FK_OrganizationMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageItem' AND [CONSTRAINT_NAME] = 'FK_PackageItem_PackageMain')
    ALTER TABLE [dbo].[PackageItem] WITH CHECK ADD CONSTRAINT [FK_PackageItem_PackageMain]
    FOREIGN KEY (PackageKey) REFERENCES [PackageMain] (PackageKey)
go
ALTER TABLE [dbo].[PackageItem] CHECK CONSTRAINT [FK_PackageItem_PackageMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageItem' AND [CONSTRAINT_NAME] = 'FK_PackageItem_Supplement')
    ALTER TABLE [dbo].[PackageItem] WITH CHECK ADD CONSTRAINT [FK_PackageItem_Supplement]
    FOREIGN KEY (SupplementKey) REFERENCES [SupplementMain] (SupplementKey)
go
ALTER TABLE [dbo].[PackageItem] CHECK CONSTRAINT [FK_PackageItem_Supplement]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageItem' AND [CONSTRAINT_NAME] = 'FK_PackageItem_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PackageItem] WITH CHECK ADD CONSTRAINT [FK_PackageItem_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PackageItem] CHECK CONSTRAINT [FK_PackageItem_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageItem' AND [CONSTRAINT_NAME] = 'FK_PackageItem_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PackageItem] WITH CHECK ADD CONSTRAINT [FK_PackageItem_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PackageItem] CHECK CONSTRAINT [FK_PackageItem_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageMain' AND [CONSTRAINT_NAME] = 'FK_PackageMain_PackageStatus')
    ALTER TABLE [dbo].[PackageMain] WITH CHECK ADD CONSTRAINT [FK_PackageMain_PackageStatus]
    FOREIGN KEY (PackageStatusCode) REFERENCES [PackageStatusRef] (PackageStatusCode)
go
ALTER TABLE [dbo].[PackageMain] CHECK CONSTRAINT [FK_PackageMain_PackageStatus]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageMain' AND [CONSTRAINT_NAME] = 'FK_PackageMain_SystemEntity')
    ALTER TABLE [dbo].[PackageMain] WITH CHECK ADD CONSTRAINT [FK_PackageMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PackageMain] CHECK CONSTRAINT [FK_PackageMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageMain' AND [CONSTRAINT_NAME] = 'FK_PackageMain_UniformRegistry')
    ALTER TABLE [dbo].[PackageMain] WITH CHECK ADD CONSTRAINT [FK_PackageMain_UniformRegistry]
    FOREIGN KEY (PackageKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[PackageMain] CHECK CONSTRAINT [FK_PackageMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageMain' AND [CONSTRAINT_NAME] = 'FK_PackageMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PackageMain] WITH CHECK ADD CONSTRAINT [FK_PackageMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PackageMain] CHECK CONSTRAINT [FK_PackageMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageMain' AND [CONSTRAINT_NAME] = 'FK_PackageMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PackageMain] WITH CHECK ADD CONSTRAINT [FK_PackageMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PackageMain] CHECK CONSTRAINT [FK_PackageMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_AccessMain')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_DocumentMain')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_DocumentMain]
    FOREIGN KEY (QueueReleaseWorkflowKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_DocumentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_GroupMain')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_GroupMain]
    FOREIGN KEY (NotificationGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_PackageQueueReleaseTypeRef')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_PackageQueueReleaseTypeRef]
    FOREIGN KEY (PackageQueueReleaseTypeCode) REFERENCES [PackageQueueReleaseTypeRef] (PackageQueueReleaseTypeCode)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_PackageQueueReleaseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_ScheduledTask')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_ScheduledTask]
    FOREIGN KEY (ScheduledTaskKey) REFERENCES [ScheduledTask] (ScheduledTaskKey)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_ScheduledTask]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PackageQueue' AND [CONSTRAINT_NAME] = 'FK_PackageQueue_UniformRegistry')
    ALTER TABLE [dbo].[PackageQueue] WITH CHECK ADD CONSTRAINT [FK_PackageQueue_UniformRegistry]
    FOREIGN KEY (PackageQueueKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[PackageQueue] CHECK CONSTRAINT [FK_PackageQueue_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_ContactMain_Payor')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_ContactMain_Payor]
    FOREIGN KEY (PayorContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_ContactMain_Payor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_Currency')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_PaymentApplicationRestrictionRef')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_PaymentApplicationRestrictionRef]
    FOREIGN KEY (PaymentApplicationRestrictionCode) REFERENCES [PaymentApplicationRestrictionRef] (PaymentApplicationRestrictionCode)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_PaymentApplicationRestrictionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_PaymentDetailStatusRef')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_PaymentDetailStatusRef]
    FOREIGN KEY (PaymentDetailStatusCode) REFERENCES [PaymentDetailStatusRef] (PaymentDetailStatusCode)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_PaymentDetailStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_PaymentMethod')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_PaymentMethod]
    FOREIGN KEY (PaymentMethodKey) REFERENCES [PaymentMethod] (PaymentMethodKey)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_PaymentMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_PaymentType')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_PaymentType]
    FOREIGN KEY (PaymentTypeKey) REFERENCES [PaymentType] (PaymentTypeKey)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_PaymentType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentDetail_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PaymentDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentDetail_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_Payment_PaymentDetail')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_Payment_PaymentDetail]
    FOREIGN KEY (PaymentDetailKey) REFERENCES [PaymentDetail] (PaymentDetailKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_Payment_PaymentDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_AccessMain')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_BatchInstance_Final')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_BatchInstance_Final]
    FOREIGN KEY (FinalBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_BatchInstance_Final]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_ContactMain_Payor')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_ContactMain_Payor]
    FOREIGN KEY (PayorContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_ContactMain_Payor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_Currency')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_FinancialEntity')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_GroupMain_Owner')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_PaymentApplicationRestrictionRef')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_PaymentApplicationRestrictionRef]
    FOREIGN KEY (PaymentApplicationRestrictionCode) REFERENCES [PaymentApplicationRestrictionRef] (PaymentApplicationRestrictionCode)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_PaymentApplicationRestrictionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_PaymentMain_Original')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_PaymentMain_Original]
    FOREIGN KEY (OriginalPaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_PaymentMain_Original]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_PaymentMethod')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_PaymentMethod]
    FOREIGN KEY (PaymentMethodKey) REFERENCES [PaymentMethod] (PaymentMethodKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_PaymentMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_SystemEntity')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_UniformRegistry')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_UniformRegistry]
    FOREIGN KEY (PaymentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_Currency')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_FinancialEntity')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_GatewayAccount')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_GatewayAccount]
    FOREIGN KEY (GatewayAccountKey) REFERENCES [GatewayAccount] (GatewayAccountKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_GatewayAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_GLAccount')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_GLAccount]
    FOREIGN KEY (CashGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_GLAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_PaymentType')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_PaymentType]
    FOREIGN KEY (PaymentTypeKey) REFERENCES [PaymentType] (PaymentTypeKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_PaymentType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_SystemEntity')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethod' AND [CONSTRAINT_NAME] = 'FK_PaymentMethod_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PaymentMethod] WITH CHECK ADD CONSTRAINT [FK_PaymentMethod_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentMethod] CHECK CONSTRAINT [FK_PaymentMethod_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentMethodSetDetail_MethodSetDetail')
    ALTER TABLE [dbo].[PaymentMethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentMethodSetDetail_MethodSetDetail]
    FOREIGN KEY (MethodSetDetailKey) REFERENCES [MethodSetDetail] (MethodSetDetailKey)
go
ALTER TABLE [dbo].[PaymentMethodSetDetail] CHECK CONSTRAINT [FK_PaymentMethodSetDetail_MethodSetDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentMethodSetDetail_PaymentMethod')
    ALTER TABLE [dbo].[PaymentMethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentMethodSetDetail_PaymentMethod]
    FOREIGN KEY (PaymentMethodKey) REFERENCES [PaymentMethod] (PaymentMethodKey)
go
ALTER TABLE [dbo].[PaymentMethodSetDetail] CHECK CONSTRAINT [FK_PaymentMethodSetDetail_PaymentMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentScheduleLine' AND [CONSTRAINT_NAME] = 'FK_PaymentScheduleLine_InvoiceMain')
    ALTER TABLE [dbo].[PaymentScheduleLine] WITH CHECK ADD CONSTRAINT [FK_PaymentScheduleLine_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[PaymentScheduleLine] CHECK CONSTRAINT [FK_PaymentScheduleLine_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTerms' AND [CONSTRAINT_NAME] = 'FK_PaymentTerms_FirstPaymentDateTypeRef')
    ALTER TABLE [dbo].[PaymentTerms] WITH CHECK ADD CONSTRAINT [FK_PaymentTerms_FirstPaymentDateTypeRef]
    FOREIGN KEY (FirstPaymentDateTypeCode) REFERENCES [FirstPaymentDateTypeRef] (FirstPaymentDateTypeCode)
go
ALTER TABLE [dbo].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_FirstPaymentDateTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTerms' AND [CONSTRAINT_NAME] = 'FK_PaymentTerms_IntervalTypeRef')
    ALTER TABLE [dbo].[PaymentTerms] WITH CHECK ADD CONSTRAINT [FK_PaymentTerms_IntervalTypeRef]
    FOREIGN KEY (PaymentIntervalTypeCode) REFERENCES [IntervalTypeRef] (IntervalTypeCode)
go
ALTER TABLE [dbo].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_IntervalTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTerms' AND [CONSTRAINT_NAME] = 'FK_PaymentTerms_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PaymentTerms] WITH CHECK ADD CONSTRAINT [FK_PaymentTerms_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTerms' AND [CONSTRAINT_NAME] = 'FK_PaymentTerms_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PaymentTerms] WITH CHECK ADD CONSTRAINT [FK_PaymentTerms_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTermsCustomLine' AND [CONSTRAINT_NAME] = 'FK_PaymentTermsCustomLine_PaymentTerms')
    ALTER TABLE [dbo].[PaymentTermsCustomLine] WITH CHECK ADD CONSTRAINT [FK_PaymentTermsCustomLine_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[PaymentTermsCustomLine] CHECK CONSTRAINT [FK_PaymentTermsCustomLine_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentType' AND [CONSTRAINT_NAME] = 'FK_PaymentType_GatewayTypeRef')
    ALTER TABLE [dbo].[PaymentType] WITH CHECK ADD CONSTRAINT [FK_PaymentType_GatewayTypeRef]
    FOREIGN KEY (GatewayTypeCode) REFERENCES [GatewayTypeRef] (GatewayTypeCode)
go
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_GatewayTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentType' AND [CONSTRAINT_NAME] = 'FK_PaymentType_SystemEntity')
    ALTER TABLE [dbo].[PaymentType] WITH CHECK ADD CONSTRAINT [FK_PaymentType_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentType' AND [CONSTRAINT_NAME] = 'FK_PaymentType_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PaymentType] WITH CHECK ADD CONSTRAINT [FK_PaymentType_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentType' AND [CONSTRAINT_NAME] = 'FK_PaymentType_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PaymentType] WITH CHECK ADD CONSTRAINT [FK_PaymentType_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Perspective' AND [CONSTRAINT_NAME] = 'FK_Perspective_Hierarchy')
    ALTER TABLE [dbo].[Perspective] WITH CHECK ADD CONSTRAINT [FK_Perspective_Hierarchy]
    FOREIGN KEY (RootHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[Perspective] CHECK CONSTRAINT [FK_Perspective_Hierarchy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Perspective' AND [CONSTRAINT_NAME] = 'FK_Perspective_Hierarchy_HomePage')
    ALTER TABLE [dbo].[Perspective] WITH CHECK ADD CONSTRAINT [FK_Perspective_Hierarchy_HomePage]
    FOREIGN KEY (HomePageHierarchyKey) REFERENCES [Hierarchy] (HierarchyKey)
go
ALTER TABLE [dbo].[Perspective] CHECK CONSTRAINT [FK_Perspective_Hierarchy_HomePage]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Perspective' AND [CONSTRAINT_NAME] = 'FK_Perspective_HierarchyRoot')
    ALTER TABLE [dbo].[Perspective] WITH CHECK ADD CONSTRAINT [FK_Perspective_HierarchyRoot]
    FOREIGN KEY (RootHierarchyKey) REFERENCES [HierarchyRoot] (RootHierarchyKey)
go
ALTER TABLE [dbo].[Perspective] CHECK CONSTRAINT [FK_Perspective_HierarchyRoot]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_AddressMain')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_AddressMain]
    FOREIGN KEY (AddressKey) REFERENCES [AddressMain] (AddressKey)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_AddressMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_CountryRef')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_CountryRef]
    FOREIGN KEY (CountryCode) REFERENCES [CountryRef] (CountryCode)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_CountryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_MailCodeRef')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_MailCodeRef]
    FOREIGN KEY (MailCode) REFERENCES [MailCodeRef] (MailCode)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_MailCodeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_TaxSchedule')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_TimeZoneRef')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_TimeZoneRef]
    FOREIGN KEY (TimeZoneKey) REFERENCES [TimeZoneRef] (TimeZoneKey)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_TimeZoneRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PickList' AND [CONSTRAINT_NAME] = 'FK_PickList_SystemEntity')
    ALTER TABLE [dbo].[PickList] WITH CHECK ADD CONSTRAINT [FK_PickList_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PickList] CHECK CONSTRAINT [FK_PickList_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PickList' AND [CONSTRAINT_NAME] = 'FK_PickList_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PickList] WITH CHECK ADD CONSTRAINT [FK_PickList_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PickList] CHECK CONSTRAINT [FK_PickList_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PickList' AND [CONSTRAINT_NAME] = 'FK_PickList_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PickList] WITH CHECK ADD CONSTRAINT [FK_PickList_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PickList] CHECK CONSTRAINT [FK_PickList_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PickListItem' AND [CONSTRAINT_NAME] = 'FK_PickListItem_OrderFullfillmentLine')
    ALTER TABLE [dbo].[PickListItem] WITH CHECK ADD CONSTRAINT [FK_PickListItem_OrderFullfillmentLine]
    FOREIGN KEY (OrderFulfillmentLineKey) REFERENCES [OrderFulfillmentLine] (OrderFulfillmentLineKey)
go
ALTER TABLE [dbo].[PickListItem] CHECK CONSTRAINT [FK_PickListItem_OrderFullfillmentLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PickListItem' AND [CONSTRAINT_NAME] = 'FK_PickListItem_PickList')
    ALTER TABLE [dbo].[PickListItem] WITH CHECK ADD CONSTRAINT [FK_PickListItem_PickList]
    FOREIGN KEY (PickListKey) REFERENCES [PickList] (PickListKey)
go
ALTER TABLE [dbo].[PickListItem] CHECK CONSTRAINT [FK_PickListItem_PickList]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Pipeline' AND [CONSTRAINT_NAME] = 'FK_Pipeline_OrderType')
    ALTER TABLE [dbo].[Pipeline] WITH CHECK ADD CONSTRAINT [FK_Pipeline_OrderType]
    FOREIGN KEY (OrderTypeKey) REFERENCES [OrderType] (OrderTypeKey)
go
ALTER TABLE [dbo].[Pipeline] CHECK CONSTRAINT [FK_Pipeline_OrderType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PipelineStage' AND [CONSTRAINT_NAME] = 'FK_PipelineStage_ComponentRegistry')
    ALTER TABLE [dbo].[PipelineStage] WITH CHECK ADD CONSTRAINT [FK_PipelineStage_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[PipelineStage] CHECK CONSTRAINT [FK_PipelineStage_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PipelineStage' AND [CONSTRAINT_NAME] = 'FK_PipelineStage_Pipeline')
    ALTER TABLE [dbo].[PipelineStage] WITH CHECK ADD CONSTRAINT [FK_PipelineStage_Pipeline]
    FOREIGN KEY (PipelineKey) REFERENCES [Pipeline] (PipelineKey)
go
ALTER TABLE [dbo].[PipelineStage] CHECK CONSTRAINT [FK_PipelineStage_Pipeline]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PostalCodeRef' AND [CONSTRAINT_NAME] = 'FK_PostalCodeRef_CountryRef')
    ALTER TABLE [dbo].[PostalCodeRef] WITH CHECK ADD CONSTRAINT [FK_PostalCodeRef_CountryRef]
    FOREIGN KEY (CountryCode) REFERENCES [CountryRef] (CountryCode)
go
ALTER TABLE [dbo].[PostalCodeRef] CHECK CONSTRAINT [FK_PostalCodeRef_CountryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PostalCodeRef' AND [CONSTRAINT_NAME] = 'FK_PostalCodeRef_GroupMain_Chapter')
    ALTER TABLE [dbo].[PostalCodeRef] WITH CHECK ADD CONSTRAINT [FK_PostalCodeRef_GroupMain_Chapter]
    FOREIGN KEY (ChapterGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[PostalCodeRef] CHECK CONSTRAINT [FK_PostalCodeRef_GroupMain_Chapter]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PostalCodeRef' AND [CONSTRAINT_NAME] = 'FK_PostalCodeRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PostalCodeRef] WITH CHECK ADD CONSTRAINT [FK_PostalCodeRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PostalCodeRef] CHECK CONSTRAINT [FK_PostalCodeRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PotentialMatchingGift' AND [CONSTRAINT_NAME] = 'FK_PotentialMatchingGift_MatchingGiftPlan')
    ALTER TABLE [dbo].[PotentialMatchingGift] WITH CHECK ADD CONSTRAINT [FK_PotentialMatchingGift_MatchingGiftPlan]
    FOREIGN KEY (MatchingGiftPlanKey) REFERENCES [MatchingGiftPlan] (MatchingGiftPlanKey)
go
ALTER TABLE [dbo].[PotentialMatchingGift] CHECK CONSTRAINT [FK_PotentialMatchingGift_MatchingGiftPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PotentialMatchingGift' AND [CONSTRAINT_NAME] = 'FK_PotentialMatchingGift_Relationship_MatchingGift')
    ALTER TABLE [dbo].[PotentialMatchingGift] WITH CHECK ADD CONSTRAINT [FK_PotentialMatchingGift_Relationship_MatchingGift]
    FOREIGN KEY (MatchingGiftRelationshipKey) REFERENCES [RelationshipMain] (RelationshipKey)
go
ALTER TABLE [dbo].[PotentialMatchingGift] CHECK CONSTRAINT [FK_PotentialMatchingGift_Relationship_MatchingGift]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PotentialMatchingGift' AND [CONSTRAINT_NAME] = 'FK_PotentialMatchingGift_SystemEntity')
    ALTER TABLE [dbo].[PotentialMatchingGift] WITH CHECK ADD CONSTRAINT [FK_PotentialMatchingGift_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PotentialMatchingGift] CHECK CONSTRAINT [FK_PotentialMatchingGift_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PotentialMatchingGift' AND [CONSTRAINT_NAME] = 'FK_PotentialMatchingGift_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PotentialMatchingGift] WITH CHECK ADD CONSTRAINT [FK_PotentialMatchingGift_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PotentialMatchingGift] CHECK CONSTRAINT [FK_PotentialMatchingGift_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PotentialMatchingGift' AND [CONSTRAINT_NAME] = 'FK_PotentialMatchingGift_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PotentialMatchingGift] WITH CHECK ADD CONSTRAINT [FK_PotentialMatchingGift_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PotentialMatchingGift] CHECK CONSTRAINT [FK_PotentialMatchingGift_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceBreak' AND [CONSTRAINT_NAME] = 'FK_PriceBreak_PriceBasisRef')
    ALTER TABLE [dbo].[PriceBreak] WITH CHECK ADD CONSTRAINT [FK_PriceBreak_PriceBasisRef]
    FOREIGN KEY (PriceBasisCode) REFERENCES [PriceBasisRef] (PriceBasisCode)
go
ALTER TABLE [dbo].[PriceBreak] CHECK CONSTRAINT [FK_PriceBreak_PriceBasisRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceBreak' AND [CONSTRAINT_NAME] = 'FK_PriceBreak_PriceDetail')
    ALTER TABLE [dbo].[PriceBreak] WITH CHECK ADD CONSTRAINT [FK_PriceBreak_PriceDetail]
    FOREIGN KEY (PriceDetailKey) REFERENCES [PriceDetail] (PriceDetailKey)
go
ALTER TABLE [dbo].[PriceBreak] CHECK CONSTRAINT [FK_PriceBreak_PriceDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceBreak' AND [CONSTRAINT_NAME] = 'FK_PriceBreak_Uom')
    ALTER TABLE [dbo].[PriceBreak] WITH CHECK ADD CONSTRAINT [FK_PriceBreak_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[PriceBreak] CHECK CONSTRAINT [FK_PriceBreak_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceBreak' AND [CONSTRAINT_NAME] = 'FK_PriceBreak_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PriceBreak] WITH CHECK ADD CONSTRAINT [FK_PriceBreak_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceBreak] CHECK CONSTRAINT [FK_PriceBreak_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceBreak' AND [CONSTRAINT_NAME] = 'FK_PriceBreak_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceBreak] WITH CHECK ADD CONSTRAINT [FK_PriceBreak_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceBreak] CHECK CONSTRAINT [FK_PriceBreak_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceDetail' AND [CONSTRAINT_NAME] = 'FK_PriceDetail_Currency')
    ALTER TABLE [dbo].[PriceDetail] WITH CHECK ADD CONSTRAINT [FK_PriceDetail_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[PriceDetail] CHECK CONSTRAINT [FK_PriceDetail_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceDetail' AND [CONSTRAINT_NAME] = 'FK_PriceDetail_ProductMain')
    ALTER TABLE [dbo].[PriceDetail] WITH CHECK ADD CONSTRAINT [FK_PriceDetail_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[PriceDetail] CHECK CONSTRAINT [FK_PriceDetail_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceDetail' AND [CONSTRAINT_NAME] = 'FK_PriceDetail_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PriceDetail] WITH CHECK ADD CONSTRAINT [FK_PriceDetail_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceDetail] CHECK CONSTRAINT [FK_PriceDetail_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceDetail' AND [CONSTRAINT_NAME] = 'FK_PriceDetail_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceDetail] WITH CHECK ADD CONSTRAINT [FK_PriceDetail_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceDetail] CHECK CONSTRAINT [FK_PriceDetail_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheet' AND [CONSTRAINT_NAME] = 'FK_PriceSheet_PriceSheet_Comparison')
    ALTER TABLE [dbo].[PriceSheet] WITH CHECK ADD CONSTRAINT [FK_PriceSheet_PriceSheet_Comparison]
    FOREIGN KEY (ComparisonPriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[PriceSheet] CHECK CONSTRAINT [FK_PriceSheet_PriceSheet_Comparison]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheet' AND [CONSTRAINT_NAME] = 'FK_PriceSheet_PriceSheet_Parent')
    ALTER TABLE [dbo].[PriceSheet] WITH CHECK ADD CONSTRAINT [FK_PriceSheet_PriceSheet_Parent]
    FOREIGN KEY (ParentPriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[PriceSheet] CHECK CONSTRAINT [FK_PriceSheet_PriceSheet_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheet' AND [CONSTRAINT_NAME] = 'FK_PriceSheet_SystemEntity')
    ALTER TABLE [dbo].[PriceSheet] WITH CHECK ADD CONSTRAINT [FK_PriceSheet_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PriceSheet] CHECK CONSTRAINT [FK_PriceSheet_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheet' AND [CONSTRAINT_NAME] = 'FK_PriceSheet_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PriceSheet] WITH CHECK ADD CONSTRAINT [FK_PriceSheet_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceSheet] CHECK CONSTRAINT [FK_PriceSheet_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheet' AND [CONSTRAINT_NAME] = 'FK_PriceSheet_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceSheet] WITH CHECK ADD CONSTRAINT [FK_PriceSheet_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceSheet] CHECK CONSTRAINT [FK_PriceSheet_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetDiscount' AND [CONSTRAINT_NAME] = 'FK_PriceSheetDiscount_DiscountRule')
    ALTER TABLE [dbo].[PriceSheetDiscount] WITH CHECK ADD CONSTRAINT [FK_PriceSheetDiscount_DiscountRule]
    FOREIGN KEY (DiscountRuleKey) REFERENCES [DiscountRule] (RuleKey)
go
ALTER TABLE [dbo].[PriceSheetDiscount] CHECK CONSTRAINT [FK_PriceSheetDiscount_DiscountRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetDiscount' AND [CONSTRAINT_NAME] = 'FK_PriceSheetDiscount_PriceSheetVersion')
    ALTER TABLE [dbo].[PriceSheetDiscount] WITH CHECK ADD CONSTRAINT [FK_PriceSheetDiscount_PriceSheetVersion]
    FOREIGN KEY (PriceSheetVersionKey) REFERENCES [PriceSheetVersion] (PriceSheetVersionKey)
go
ALTER TABLE [dbo].[PriceSheetDiscount] CHECK CONSTRAINT [FK_PriceSheetDiscount_PriceSheetVersion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetDiscount' AND [CONSTRAINT_NAME] = 'FK_PriceSheetDiscount_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceSheetDiscount] WITH CHECK ADD CONSTRAINT [FK_PriceSheetDiscount_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceSheetDiscount] CHECK CONSTRAINT [FK_PriceSheetDiscount_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetVersion' AND [CONSTRAINT_NAME] = 'FK_PriceSheetVersion_PriceSheet')
    ALTER TABLE [dbo].[PriceSheetVersion] WITH CHECK ADD CONSTRAINT [FK_PriceSheetVersion_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[PriceSheetVersion] CHECK CONSTRAINT [FK_PriceSheetVersion_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetVersion' AND [CONSTRAINT_NAME] = 'FK_PriceSheetVersion_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PriceSheetVersion] WITH CHECK ADD CONSTRAINT [FK_PriceSheetVersion_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceSheetVersion] CHECK CONSTRAINT [FK_PriceSheetVersion_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceSheetVersion' AND [CONSTRAINT_NAME] = 'FK_PriceSheetVersion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceSheetVersion] WITH CHECK ADD CONSTRAINT [FK_PriceSheetVersion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceSheetVersion] CHECK CONSTRAINT [FK_PriceSheetVersion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceVersionDetail' AND [CONSTRAINT_NAME] = 'FK_PriceVersionDetail_PriceDetail')
    ALTER TABLE [dbo].[PriceVersionDetail] WITH CHECK ADD CONSTRAINT [FK_PriceVersionDetail_PriceDetail]
    FOREIGN KEY (PriceDetailKey) REFERENCES [PriceDetail] (PriceDetailKey)
go
ALTER TABLE [dbo].[PriceVersionDetail] CHECK CONSTRAINT [FK_PriceVersionDetail_PriceDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceVersionDetail' AND [CONSTRAINT_NAME] = 'FK_PriceVersionDetail_PriceDetail_Original')
    ALTER TABLE [dbo].[PriceVersionDetail] WITH CHECK ADD CONSTRAINT [FK_PriceVersionDetail_PriceDetail_Original]
    FOREIGN KEY (OriginalPriceDetailKey) REFERENCES [PriceDetail] (PriceDetailKey)
go
ALTER TABLE [dbo].[PriceVersionDetail] CHECK CONSTRAINT [FK_PriceVersionDetail_PriceDetail_Original]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceVersionDetail' AND [CONSTRAINT_NAME] = 'FK_PriceVersionDetail_PriceSheetVersion')
    ALTER TABLE [dbo].[PriceVersionDetail] WITH CHECK ADD CONSTRAINT [FK_PriceVersionDetail_PriceSheetVersion]
    FOREIGN KEY (PriceSheetVersionKey) REFERENCES [PriceSheetVersion] (PriceSheetVersionKey)
go
ALTER TABLE [dbo].[PriceVersionDetail] CHECK CONSTRAINT [FK_PriceVersionDetail_PriceSheetVersion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceVersionDetail' AND [CONSTRAINT_NAME] = 'FK_PriceVersionDetail_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PriceVersionDetail] WITH CHECK ADD CONSTRAINT [FK_PriceVersionDetail_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceVersionDetail] CHECK CONSTRAINT [FK_PriceVersionDetail_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PriceVersionDetail' AND [CONSTRAINT_NAME] = 'FK_PriceVersionDetail_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PriceVersionDetail] WITH CHECK ADD CONSTRAINT [FK_PriceVersionDetail_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PriceVersionDetail] CHECK CONSTRAINT [FK_PriceVersionDetail_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductBook' AND [CONSTRAINT_NAME] = 'FK_ProductBook_ProductMain')
    ALTER TABLE [dbo].[ProductBook] WITH CHECK ADD CONSTRAINT [FK_ProductBook_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductBook] CHECK CONSTRAINT [FK_ProductBook_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_AccessMain')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_AccountingMethodRef')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_AccountingMethodRef]
    FOREIGN KEY (AccountingMethodCode) REFERENCES [AccountingMethodRef] (AccountingMethodCode)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_AccountingMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_CommissionCategory')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_CommissionCategory]
    FOREIGN KEY (CommissionCategoryKey) REFERENCES [CommissionCategory] (CommissionCategoryKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_CommissionCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_DeferralTerms')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_FinancialEntity')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_PaymentTerms')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_SystemEntity')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_TaxCategory')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_TaxCategory]
    FOREIGN KEY (TaxCategoryKey) REFERENCES [TaxCategory] (TaxCategoryKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_TaxCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_TaxSchedule')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_UniformRegistry')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_UniformRegistry]
    FOREIGN KEY (ProductClassKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_Uom_Inventory')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_Uom_Inventory]
    FOREIGN KEY (InventoryUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_Uom_Inventory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_Uom_Purchase')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_Uom_Purchase]
    FOREIGN KEY (PurchaseUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_Uom_Purchase]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_Uom_Sales')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_Uom_Sales]
    FOREIGN KEY (DefaultSalesUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_Uom_Sales]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_UomGroup')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_UomGroup]
    FOREIGN KEY (UomGroupKey) REFERENCES [UomGroup] (UomGroupKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_UomGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClass' AND [CONSTRAINT_NAME] = 'FK_ProductClass_Warehouse_Default')
    ALTER TABLE [dbo].[ProductClass] WITH CHECK ADD CONSTRAINT [FK_ProductClass_Warehouse_Default]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[ProductClass] CHECK CONSTRAINT [FK_ProductClass_Warehouse_Default]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductClothing' AND [CONSTRAINT_NAME] = 'FK_ProductClothing_ProductMain')
    ALTER TABLE [dbo].[ProductClothing] WITH CHECK ADD CONSTRAINT [FK_ProductClothing_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductClothing] CHECK CONSTRAINT [FK_ProductClothing_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductDescription' AND [CONSTRAINT_NAME] = 'FK_ProductDescription_Locale')
    ALTER TABLE [dbo].[ProductDescription] WITH CHECK ADD CONSTRAINT [FK_ProductDescription_Locale]
    FOREIGN KEY (CultureCode) REFERENCES [CultureRef] (CultureCode)
go
ALTER TABLE [dbo].[ProductDescription] CHECK CONSTRAINT [FK_ProductDescription_Locale]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductDescription' AND [CONSTRAINT_NAME] = 'FK_ProductDescription_ProductMain')
    ALTER TABLE [dbo].[ProductDescription] WITH CHECK ADD CONSTRAINT [FK_ProductDescription_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductDescription] CHECK CONSTRAINT [FK_ProductDescription_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductFundraising' AND [CONSTRAINT_NAME] = 'FK_ProductFundraising_Fund')
    ALTER TABLE [dbo].[ProductFundraising] WITH CHECK ADD CONSTRAINT [FK_ProductFundraising_Fund]
    FOREIGN KEY (FundKey) REFERENCES [Fund] (FundKey)
go
ALTER TABLE [dbo].[ProductFundraising] CHECK CONSTRAINT [FK_ProductFundraising_Fund]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductFundraising' AND [CONSTRAINT_NAME] = 'FK_ProductFundraising_ProductMain')
    ALTER TABLE [dbo].[ProductFundraising] WITH CHECK ADD CONSTRAINT [FK_ProductFundraising_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductFundraising] CHECK CONSTRAINT [FK_ProductFundraising_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductGLAccount' AND [CONSTRAINT_NAME] = 'FK_ProductGLAccount_GLAccount')
    ALTER TABLE [dbo].[ProductGLAccount] WITH CHECK ADD CONSTRAINT [FK_ProductGLAccount_GLAccount]
    FOREIGN KEY (GLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[ProductGLAccount] CHECK CONSTRAINT [FK_ProductGLAccount_GLAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductGLAccount' AND [CONSTRAINT_NAME] = 'FK_ProductGLAccount_GLAccountPurposeRef')
    ALTER TABLE [dbo].[ProductGLAccount] WITH CHECK ADD CONSTRAINT [FK_ProductGLAccount_GLAccountPurposeRef]
    FOREIGN KEY (GLAccountPurposeCode) REFERENCES [GLAccountPurposeRef] (GLAccountPurposeCode)
go
ALTER TABLE [dbo].[ProductGLAccount] CHECK CONSTRAINT [FK_ProductGLAccount_GLAccountPurposeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_InventoryLocation')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_InventoryLocation]
    FOREIGN KEY (LocationKey) REFERENCES [InventoryLocation] (LocationKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_InventoryLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_ProductMain')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_UniformRegistry')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_UniformRegistry]
    FOREIGN KEY (ProductInventoryKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_Uom')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductInventory' AND [CONSTRAINT_NAME] = 'FK_ProductInventory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_AccessMain')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_AccountingMethodRef')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_AccountingMethodRef]
    FOREIGN KEY (AccountingMethodCode) REFERENCES [AccountingMethodRef] (AccountingMethodCode)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_AccountingMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_CommissionCategory')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_CommissionCategory]
    FOREIGN KEY (CommissionCategoryKey) REFERENCES [CommissionCategory] (CommissionCategoryKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_CommissionCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_DeferralTerms')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_GroupMain')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_GroupMain]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_PaymentTerms')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_ProductClass')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_ProductClass]
    FOREIGN KEY (ProductClassKey) REFERENCES [ProductClass] (ProductClassKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_ProductClass]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_ProductMain_Replacement')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_ProductMain_Replacement]
    FOREIGN KEY (ReplacementProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_ProductMain_Replacement]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_ProductSetTypeRef')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_ProductSetTypeRef]
    FOREIGN KEY (ProductSetTypeCode) REFERENCES [ProductSetTypeRef] (ProductSetTypeCode)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_ProductSetTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_ProductStatusRef')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_ProductStatusRef]
    FOREIGN KEY (ProductStatusCode) REFERENCES [ProductStatusRef] (ProductStatusCode)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_ProductStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_ProductType')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_ProductType]
    FOREIGN KEY (ProductTypeKey) REFERENCES [ProductType] (ProductTypeKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_ProductType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_SystemEntity')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_TaxCategory')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_TaxCategory]
    FOREIGN KEY (TaxCategoryKey) REFERENCES [TaxCategory] (TaxCategoryKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_TaxCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_TaxSchedule')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_UniformRegistry')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_UniformRegistry]
    FOREIGN KEY (ProductKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_Uom_Inventory')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_Uom_Inventory]
    FOREIGN KEY (InventoryUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_Uom_Inventory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_Uom_Purchase')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_Uom_Purchase]
    FOREIGN KEY (PurchaseUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_Uom_Purchase]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_Uom_Sales')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_Uom_Sales]
    FOREIGN KEY (DefaultSalesUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_Uom_Sales]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_UomGroup')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_UomGroup]
    FOREIGN KEY (UomGroupKey) REFERENCES [UomGroup] (UomGroupKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_UomGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMain' AND [CONSTRAINT_NAME] = 'FK_ProductMain_Warehouse_Default')
    ALTER TABLE [dbo].[ProductMain] WITH CHECK ADD CONSTRAINT [FK_ProductMain_Warehouse_Default]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[ProductMain] CHECK CONSTRAINT [FK_ProductMain_Warehouse_Default]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMaster' AND [CONSTRAINT_NAME] = 'FK_ProductMaster_ProductMain')
    ALTER TABLE [dbo].[ProductMaster] WITH CHECK ADD CONSTRAINT [FK_ProductMaster_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductMaster] CHECK CONSTRAINT [FK_ProductMaster_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMembership' AND [CONSTRAINT_NAME] = 'FK_ProductMembership_ComponentRegistry')
    ALTER TABLE [dbo].[ProductMembership] WITH CHECK ADD CONSTRAINT [FK_ProductMembership_ComponentRegistry]
    FOREIGN KEY (MembershipProcessingComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[ProductMembership] CHECK CONSTRAINT [FK_ProductMembership_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMembership' AND [CONSTRAINT_NAME] = 'FK_ProductMembership_PaymentTerms')
    ALTER TABLE [dbo].[ProductMembership] WITH CHECK ADD CONSTRAINT [FK_ProductMembership_PaymentTerms]
    FOREIGN KEY (SuggestedPaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[ProductMembership] CHECK CONSTRAINT [FK_ProductMembership_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMembership' AND [CONSTRAINT_NAME] = 'FK_ProductMembership_ProductMain')
    ALTER TABLE [dbo].[ProductMembership] WITH CHECK ADD CONSTRAINT [FK_ProductMembership_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductMembership] CHECK CONSTRAINT [FK_ProductMembership_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMembership' AND [CONSTRAINT_NAME] = 'FK_ProductMembership_ProductMain_Suggested')
    ALTER TABLE [dbo].[ProductMembership] WITH CHECK ADD CONSTRAINT [FK_ProductMembership_ProductMain_Suggested]
    FOREIGN KEY (SuggestedProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductMembership] CHECK CONSTRAINT [FK_ProductMembership_ProductMain_Suggested]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductMembership' AND [CONSTRAINT_NAME] = 'FK_ProductMembership_UniformRegistry')
    ALTER TABLE [dbo].[ProductMembership] WITH CHECK ADD CONSTRAINT [FK_ProductMembership_UniformRegistry]
    FOREIGN KEY (TargetUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ProductMembership] CHECK CONSTRAINT [FK_ProductMembership_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductSetItem' AND [CONSTRAINT_NAME] = 'FK_ProductSetItem_ProductMain_Child')
    ALTER TABLE [dbo].[ProductSetItem] WITH CHECK ADD CONSTRAINT [FK_ProductSetItem_ProductMain_Child]
    FOREIGN KEY (ChildProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductSetItem] CHECK CONSTRAINT [FK_ProductSetItem_ProductMain_Child]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductSetItem' AND [CONSTRAINT_NAME] = 'FK_ProductSetItem_ProductMain_Parent')
    ALTER TABLE [dbo].[ProductSetItem] WITH CHECK ADD CONSTRAINT [FK_ProductSetItem_ProductMain_Parent]
    FOREIGN KEY (ParentProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductSetItem] CHECK CONSTRAINT [FK_ProductSetItem_ProductMain_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductSetItem' AND [CONSTRAINT_NAME] = 'FK_ProductSetItem_Uom_Child')
    ALTER TABLE [dbo].[ProductSetItem] WITH CHECK ADD CONSTRAINT [FK_ProductSetItem_Uom_Child]
    FOREIGN KEY (ChildUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[ProductSetItem] CHECK CONSTRAINT [FK_ProductSetItem_Uom_Child]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductStatistics' AND [CONSTRAINT_NAME] = 'FK_ProductStatistics_ProductMain')
    ALTER TABLE [dbo].[ProductStatistics] WITH CHECK ADD CONSTRAINT [FK_ProductStatistics_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductStatistics] CHECK CONSTRAINT [FK_ProductStatistics_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductTax' AND [CONSTRAINT_NAME] = 'FK_ProductTax_ProductMain')
    ALTER TABLE [dbo].[ProductTax] WITH CHECK ADD CONSTRAINT [FK_ProductTax_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductTax] CHECK CONSTRAINT [FK_ProductTax_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductTax' AND [CONSTRAINT_NAME] = 'FK_ProductTax_TaxAuthority')
    ALTER TABLE [dbo].[ProductTax] WITH CHECK ADD CONSTRAINT [FK_ProductTax_TaxAuthority]
    FOREIGN KEY (TaxAuthorityKey) REFERENCES [TaxAuthority] (TaxAuthorityKey)
go
ALTER TABLE [dbo].[ProductTax] CHECK CONSTRAINT [FK_ProductTax_TaxAuthority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductTax' AND [CONSTRAINT_NAME] = 'FK_ProductTax_TaxCategory')
    ALTER TABLE [dbo].[ProductTax] WITH CHECK ADD CONSTRAINT [FK_ProductTax_TaxCategory]
    FOREIGN KEY (TaxCategoryKey) REFERENCES [TaxCategory] (TaxCategoryKey)
go
ALTER TABLE [dbo].[ProductTax] CHECK CONSTRAINT [FK_ProductTax_TaxCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductTest' AND [CONSTRAINT_NAME] = 'FK_ProductTest_ProductMain')
    ALTER TABLE [dbo].[ProductTest] WITH CHECK ADD CONSTRAINT [FK_ProductTest_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductTest] CHECK CONSTRAINT [FK_ProductTest_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductType' AND [CONSTRAINT_NAME] = 'FK_ProductType_ComponentRegistry_Fulfillment')
    ALTER TABLE [dbo].[ProductType] WITH CHECK ADD CONSTRAINT [FK_ProductType_ComponentRegistry_Fulfillment]
    FOREIGN KEY (FulfillmentComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ComponentRegistry_Fulfillment]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductType' AND [CONSTRAINT_NAME] = 'FK_ProductType_ComponentRegistry_Pricing')
    ALTER TABLE [dbo].[ProductType] WITH CHECK ADD CONSTRAINT [FK_ProductType_ComponentRegistry_Pricing]
    FOREIGN KEY (PricingComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ComponentRegistry_Pricing]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductType' AND [CONSTRAINT_NAME] = 'FK_ProductType_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProductType] WITH CHECK ADD CONSTRAINT [FK_ProductType_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductType' AND [CONSTRAINT_NAME] = 'FK_ProductType_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProductType] WITH CHECK ADD CONSTRAINT [FK_ProductType_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_ProductMain')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_ProductWarehouseStatusRef')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_ProductWarehouseStatusRef]
    FOREIGN KEY (ProductWarehouseStatusCode) REFERENCES [WarehouseStatusRef] (WarehouseStatusCode)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_ProductWarehouseStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_UniformRegistry')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_UniformRegistry]
    FOREIGN KEY (ProductWarehouseKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProductWarehouse' AND [CONSTRAINT_NAME] = 'FK_ProductWarehouse_Warehouse')
    ALTER TABLE [dbo].[ProductWarehouse] WITH CHECK ADD CONSTRAINT [FK_ProductWarehouse_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_ProgramStatusRef')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_ProgramStatusRef]
    FOREIGN KEY (ProgramStatusCode) REFERENCES [ProgramStatusRef] (ProgramStatusCode)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_ProgramStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_Uom')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProgramGroup' AND [CONSTRAINT_NAME] = 'FK_ProgramGroup_ProgramGroupStatusRef')
    ALTER TABLE [dbo].[ProgramGroup] WITH CHECK ADD CONSTRAINT [FK_ProgramGroup_ProgramGroupStatusRef]
    FOREIGN KEY (ProgramGroupStatusCode) REFERENCES [ProgramGroupStatusRef] (ProgramGroupStatusCode)
go
ALTER TABLE [dbo].[ProgramGroup] CHECK CONSTRAINT [FK_ProgramGroup_ProgramGroupStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProgramGroup' AND [CONSTRAINT_NAME] = 'FK_ProgramGroup_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ProgramGroup] WITH CHECK ADD CONSTRAINT [FK_ProgramGroup_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProgramGroup] CHECK CONSTRAINT [FK_ProgramGroup_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ProgramGroup' AND [CONSTRAINT_NAME] = 'FK_ProgramGroup_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ProgramGroup] WITH CHECK ADD CONSTRAINT [FK_ProgramGroup_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ProgramGroup] CHECK CONSTRAINT [FK_ProgramGroup_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PromotionDiscount' AND [CONSTRAINT_NAME] = 'FK_PromotionDiscount_DiscountRule')
    ALTER TABLE [dbo].[PromotionDiscount] WITH CHECK ADD CONSTRAINT [FK_PromotionDiscount_DiscountRule]
    FOREIGN KEY (DiscountRuleKey) REFERENCES [DiscountRule] (RuleKey)
go
ALTER TABLE [dbo].[PromotionDiscount] CHECK CONSTRAINT [FK_PromotionDiscount_DiscountRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PromotionDiscount' AND [CONSTRAINT_NAME] = 'FK_PromotionDiscount_PromotionRule')
    ALTER TABLE [dbo].[PromotionDiscount] WITH CHECK ADD CONSTRAINT [FK_PromotionDiscount_PromotionRule]
    FOREIGN KEY (PromotionRuleKey) REFERENCES [PromotionRule] (RuleKey)
go
ALTER TABLE [dbo].[PromotionDiscount] CHECK CONSTRAINT [FK_PromotionDiscount_PromotionRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PromotionDiscount' AND [CONSTRAINT_NAME] = 'FK_PromotionDiscount_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PromotionDiscount] WITH CHECK ADD CONSTRAINT [FK_PromotionDiscount_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PromotionDiscount] CHECK CONSTRAINT [FK_PromotionDiscount_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PromotionRule' AND [CONSTRAINT_NAME] = 'FK_PromotionRule_ContactMain')
    ALTER TABLE [dbo].[PromotionRule] WITH CHECK ADD CONSTRAINT [FK_PromotionRule_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[PromotionRule] CHECK CONSTRAINT [FK_PromotionRule_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PromotionRule' AND [CONSTRAINT_NAME] = 'FK_PromotionRule_PromotionRuleRef')
    ALTER TABLE [dbo].[PromotionRule] WITH CHECK ADD CONSTRAINT [FK_PromotionRule_PromotionRuleRef]
    FOREIGN KEY (PromotionRuleCode) REFERENCES [PromotionRuleRef] (PromotionRuleCode)
go
ALTER TABLE [dbo].[PromotionRule] CHECK CONSTRAINT [FK_PromotionRule_PromotionRuleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PropertyDefinition' AND [CONSTRAINT_NAME] = 'FK_PropertyDefinition_DataTypeRef')
    ALTER TABLE [dbo].[PropertyDefinition] WITH CHECK ADD CONSTRAINT [FK_PropertyDefinition_DataTypeRef]
    FOREIGN KEY (DataTypeCode) REFERENCES [DataTypeRef] (DataTypeCode)
go
ALTER TABLE [dbo].[PropertyDefinition] CHECK CONSTRAINT [FK_PropertyDefinition_DataTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PropertyDefinition' AND [CONSTRAINT_NAME] = 'FK_PropertyDefinition_HIControlTypeRef')
    ALTER TABLE [dbo].[PropertyDefinition] WITH CHECK ADD CONSTRAINT [FK_PropertyDefinition_HIControlTypeRef]
    FOREIGN KEY (HIControlTypeCode) REFERENCES [HIControlTypeRef] (HIControlTypeCode)
go
ALTER TABLE [dbo].[PropertyDefinition] CHECK CONSTRAINT [FK_PropertyDefinition_HIControlTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PropertyDefinition' AND [CONSTRAINT_NAME] = 'FK_PropertyDefinition_UniformRegistry')
    ALTER TABLE [dbo].[PropertyDefinition] WITH CHECK ADD CONSTRAINT [FK_PropertyDefinition_UniformRegistry]
    FOREIGN KEY (ForeignObjectDocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[PropertyDefinition] CHECK CONSTRAINT [FK_PropertyDefinition_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Message_Log' AND [CONSTRAINT_NAME] = 'FK_Publish_Message_Log_Publish_Server_Ref')
    ALTER TABLE [dbo].[Publish_Message_Log] WITH CHECK ADD CONSTRAINT [FK_Publish_Message_Log_Publish_Server_Ref]
    FOREIGN KEY (PublishServerCode) REFERENCES [Publish_Server_Ref] (PublishServerCode)
go
ALTER TABLE [dbo].[Publish_Message_Log] CHECK CONSTRAINT [FK_Publish_Message_Log_Publish_Server_Ref]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request' AND [CONSTRAINT_NAME] = 'FK_Publish_Request_Nav_Menu')
    ALTER TABLE [dbo].[Publish_Request] WITH CHECK ADD CONSTRAINT [FK_Publish_Request_Nav_Menu]
    FOREIGN KEY (NavMenuID) REFERENCES [Nav_Menu] (NavMenuID)
go
ALTER TABLE [dbo].[Publish_Request] CHECK CONSTRAINT [FK_Publish_Request_Nav_Menu]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request' AND [CONSTRAINT_NAME] = 'FK_Publish_Request_Publish_Priority')
    ALTER TABLE [dbo].[Publish_Request] WITH CHECK ADD CONSTRAINT [FK_Publish_Request_Publish_Priority]
    FOREIGN KEY (PublishPriorityCode) REFERENCES [Publish_Priority_Ref] (PublishPriorityCode)
go
ALTER TABLE [dbo].[Publish_Request] CHECK CONSTRAINT [FK_Publish_Request_Publish_Priority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_PUBLISH__REFERENCE_CONTENT')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_PUBLISH__REFERENCE_CONTENT]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_PUBLISH__REFERENCE_CONTENT]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_Publish_Request_Detail_Request')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_Publish_Request_Detail_Request]
    FOREIGN KEY (PublishRequestID) REFERENCES [Publish_Request] (PublishRequestID)
go
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_Publish_Request_Detail_Request]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_Publish_Request_Detail_Server')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_Publish_Request_Detail_Server]
    FOREIGN KEY (PublishServerCode) REFERENCES [Publish_Server_Ref] (PublishServerCode)
go
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_Publish_Request_Detail_Server]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_PublishRequestStatus')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_PublishRequestStatus]
    FOREIGN KEY (PublishRequestStatusCode) REFERENCES [Publish_Request_Status_Ref] (PublishRequestStatusCode)
go
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_PublishRequestDetail_PublishRequestStatus]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishMessageLog' AND [CONSTRAINT_NAME] = 'FK_PublishMessageLog_PublishRequest')
    ALTER TABLE [dbo].[PublishMessageLog] WITH CHECK ADD CONSTRAINT [FK_PublishMessageLog_PublishRequest]
    FOREIGN KEY (PublishRequestKey) REFERENCES [PublishRequest] (PublishRequestKey)
go
ALTER TABLE [dbo].[PublishMessageLog] CHECK CONSTRAINT [FK_PublishMessageLog_PublishRequest]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishMessageLog' AND [CONSTRAINT_NAME] = 'FK_PublishMessageLog_PublishRequestDetail')
    ALTER TABLE [dbo].[PublishMessageLog] WITH CHECK ADD CONSTRAINT [FK_PublishMessageLog_PublishRequestDetail]
    FOREIGN KEY (PublishRequestDetailKey) REFERENCES [PublishRequestDetail] (PublishRequestDetailKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[PublishMessageLog] CHECK CONSTRAINT [FK_PublishMessageLog_PublishRequestDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishMessageLog' AND [CONSTRAINT_NAME] = 'FK_PublishMessageLog_PublishServerRef')
    ALTER TABLE [dbo].[PublishMessageLog] WITH CHECK ADD CONSTRAINT [FK_PublishMessageLog_PublishServerRef]
    FOREIGN KEY (PublishServerCode) REFERENCES [PublishServerRef] (PublishServerCode)
go
ALTER TABLE [dbo].[PublishMessageLog] CHECK CONSTRAINT [FK_PublishMessageLog_PublishServerRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequest' AND [CONSTRAINT_NAME] = 'FK_PublishRequest_DocumentMain')
    ALTER TABLE [dbo].[PublishRequest] WITH CHECK ADD CONSTRAINT [FK_PublishRequest_DocumentMain]
    FOREIGN KEY (DocumentKey) REFERENCES [DocumentMain] (DocumentKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[PublishRequest] CHECK CONSTRAINT [FK_PublishRequest_DocumentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequest' AND [CONSTRAINT_NAME] = 'FK_PublishRequest_PublishPriorityRef')
    ALTER TABLE [dbo].[PublishRequest] WITH CHECK ADD CONSTRAINT [FK_PublishRequest_PublishPriorityRef]
    FOREIGN KEY (PublishPriorityCode) REFERENCES [PublishPriorityRef] (PublishPriorityCode)
go
ALTER TABLE [dbo].[PublishRequest] CHECK CONSTRAINT [FK_PublishRequest_PublishPriorityRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequest' AND [CONSTRAINT_NAME] = 'FK_PublishRequest_UserMain')
    ALTER TABLE [dbo].[PublishRequest] WITH CHECK ADD CONSTRAINT [FK_PublishRequest_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PublishRequest] CHECK CONSTRAINT [FK_PublishRequest_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PUblishRequestDetail_ContentDocumentKey')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PUblishRequestDetail_ContentDocumentKey]
    FOREIGN KEY (ContentDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PUblishRequestDetail_ContentDocumentKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_PublishRequest')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_PublishRequest]
    FOREIGN KEY (PublishRequestKey) REFERENCES [PublishRequest] (PublishRequestKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PublishRequestDetail_PublishRequest]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_PublishRequestStatusRef')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_PublishRequestStatusRef]
    FOREIGN KEY (PublishRequestStatusCode) REFERENCES [PublishRequestStatusRef] (PublishRequestStatusCode)
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PublishRequestDetail_PublishRequestStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_PublishServerRef')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_PublishServerRef]
    FOREIGN KEY (PublishServerCode) REFERENCES [PublishServerRef] (PublishServerCode)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PublishRequestDetail_PublishServerRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishServerRef' AND [CONSTRAINT_NAME] = 'FK_PublishServerRef_UserMain_CreatedBy')
    ALTER TABLE [dbo].[PublishServerRef] WITH CHECK ADD CONSTRAINT [FK_PublishServerRef_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PublishServerRef] CHECK CONSTRAINT [FK_PublishServerRef_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishServerRef' AND [CONSTRAINT_NAME] = 'FK_PublishServerRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[PublishServerRef] WITH CHECK ADD CONSTRAINT [FK_PublishServerRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[PublishServerRef] CHECK CONSTRAINT [FK_PublishServerRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'QueryResultItem' AND [CONSTRAINT_NAME] = 'FK_QueryResultItem_QueryResultMain')
    ALTER TABLE [dbo].[QueryResultItem] WITH CHECK ADD CONSTRAINT [FK_QueryResultItem_QueryResultMain]
    FOREIGN KEY (QueryResultKey) REFERENCES [QueryResultMain] (QueryResultKey)
go
ALTER TABLE [dbo].[QueryResultItem] CHECK CONSTRAINT [FK_QueryResultItem_QueryResultMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'QueryResultMain' AND [CONSTRAINT_NAME] = 'FK_QueryResultMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[QueryResultMain] WITH CHECK ADD CONSTRAINT [FK_QueryResultMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[QueryResultMain] CHECK CONSTRAINT [FK_QueryResultMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReasonCode' AND [CONSTRAINT_NAME] = 'FK_ReasonCode_OrganizationMain')
    ALTER TABLE [dbo].[ReasonCode] WITH CHECK ADD CONSTRAINT [FK_ReasonCode_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[ReasonCode] CHECK CONSTRAINT [FK_ReasonCode_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptLine' AND [CONSTRAINT_NAME] = 'FK_ReceiptLine_PaymentMain')
    ALTER TABLE [dbo].[ReceiptLine] WITH CHECK ADD CONSTRAINT [FK_ReceiptLine_PaymentMain]
    FOREIGN KEY (PaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[ReceiptLine] CHECK CONSTRAINT [FK_ReceiptLine_PaymentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptLine' AND [CONSTRAINT_NAME] = 'FK_ReceiptLine_ProductMain')
    ALTER TABLE [dbo].[ReceiptLine] WITH CHECK ADD CONSTRAINT [FK_ReceiptLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ReceiptLine] CHECK CONSTRAINT [FK_ReceiptLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptLine' AND [CONSTRAINT_NAME] = 'FK_ReceiptLine_Receipt')
    ALTER TABLE [dbo].[ReceiptLine] WITH CHECK ADD CONSTRAINT [FK_ReceiptLine_Receipt]
    FOREIGN KEY (ReceiptKey) REFERENCES [ReceiptMain] (ReceiptKey)
go
ALTER TABLE [dbo].[ReceiptLine] CHECK CONSTRAINT [FK_ReceiptLine_Receipt]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptLine' AND [CONSTRAINT_NAME] = 'FK_ReceiptLine_ReceiptLine')
    ALTER TABLE [dbo].[ReceiptLine] WITH CHECK ADD CONSTRAINT [FK_ReceiptLine_ReceiptLine]
    FOREIGN KEY (SourceReceiptLineKey) REFERENCES [ReceiptLine] (ReceiptLineKey)
go
ALTER TABLE [dbo].[ReceiptLine] CHECK CONSTRAINT [FK_ReceiptLine_ReceiptLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_Receipt_AccessMain')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_Receipt_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_Receipt_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_Receipt_ContactMain_IssuedTo')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_Receipt_ContactMain_IssuedTo]
    FOREIGN KEY (IssuedToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_Receipt_ContactMain_IssuedTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_Receipt_ReceiptTypeRef')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_Receipt_ReceiptTypeRef]
    FOREIGN KEY (ReceiptTypeKey) REFERENCES [ReceiptTypeRef] (ReceiptTypeKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_Receipt_ReceiptTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_Receipt_SystemEntity')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_Receipt_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_Receipt_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_ReceiptMain_UniformRegistry')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_ReceiptMain_UniformRegistry]
    FOREIGN KEY (ReceiptKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_ReceiptMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_ReceiptMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_ReceiptMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_ReceiptMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptMain' AND [CONSTRAINT_NAME] = 'FK_ReceiptMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ReceiptMain] WITH CHECK ADD CONSTRAINT [FK_ReceiptMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ReceiptMain] CHECK CONSTRAINT [FK_ReceiptMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationCommitment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationCommitment_ContactMain')
    ALTER TABLE [dbo].[RecurringDonationCommitment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationCommitment_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[RecurringDonationCommitment] CHECK CONSTRAINT [FK_RecurringDonationCommitment_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationCommitment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationCommitment_RecurringDonationFrequencyRef')
    ALTER TABLE [dbo].[RecurringDonationCommitment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationCommitment_RecurringDonationFrequencyRef]
    FOREIGN KEY (RecurringDonationFrequencyCode) REFERENCES [RecurringDonationFrequencyRef] (RecurringDonationFrequencyCode)
go
ALTER TABLE [dbo].[RecurringDonationCommitment] CHECK CONSTRAINT [FK_RecurringDonationCommitment_RecurringDonationFrequencyRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationCommitment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationCommitment_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RecurringDonationCommitment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationCommitment_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationCommitment] CHECK CONSTRAINT [FK_RecurringDonationCommitment_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationCommitment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationCommitment_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RecurringDonationCommitment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationCommitment_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationCommitment] CHECK CONSTRAINT [FK_RecurringDonationCommitment_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_OpportunityMain')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_OpportunityMain]
    FOREIGN KEY (OpportunityKey) REFERENCES [OpportunityMain] (OpportunityKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_OpportunityMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_RecurringDonationCommitment')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationCommitment]
    FOREIGN KEY (RecurringDonationCommitmentKey) REFERENCES [RecurringDonationCommitment] (RecurringDonationCommitmentKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationCommitment]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentSet')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentSet]
    FOREIGN KEY (RecurringDonationExpectedPaymentSetKey) REFERENCES [RecurringDonationExpectedPaymentSet] (RecurringDonationExpectedPaymentSetKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentSet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentStatusRef')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentStatusRef]
    FOREIGN KEY (RecurringDonationExpectedPaymentStatusCode) REFERENCES [RecurringDonationExpectedPaymentStatusRef] (RecurringDonationExpectedPaymentStatusCode)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_RecurringDonationExpectedPaymentStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPayment' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPayment_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RecurringDonationExpectedPayment] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPayment_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPayment] CHECK CONSTRAINT [FK_RecurringDonationExpectedPayment_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPaymentSet' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPaymentSet_RecurringDonationExpectedPaymentSetStatusRef')
    ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_RecurringDonationExpectedPaymentSetStatusRef]
    FOREIGN KEY (RecurringDonationExpectedPaymentSetStatusCode) REFERENCES [RecurringDonationExpectedPaymentSetStatusRef] (RecurringDonationExpectedPaymentSetStatusCode)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] CHECK CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_RecurringDonationExpectedPaymentSetStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPaymentSet' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPaymentSet_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] CHECK CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RecurringDonationExpectedPaymentSet' AND [CONSTRAINT_NAME] = 'FK_RecurringDonationExpectedPaymentSet_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] WITH CHECK ADD CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RecurringDonationExpectedPaymentSet] CHECK CONSTRAINT [FK_RecurringDonationExpectedPaymentSet_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Ref_Table_Ref' AND [CONSTRAINT_NAME] = 'FK_REF_TABL_REFERENCE_COMPONEN')
    ALTER TABLE [dbo].[Ref_Table_Ref] WITH CHECK ADD CONSTRAINT [FK_REF_TABL_REFERENCE_COMPONEN]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Ref_Table_Ref] CHECK CONSTRAINT [FK_REF_TABL_REFERENCE_COMPONEN]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_CertificationProgramRegistration')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_CertificationProgramRegistration]
    FOREIGN KEY (CertificationProgramRegistrationKey) REFERENCES [CertificationProgramRegistration] (CertificationProgramRegistrationKey)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_CertificationProgramRegistration]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_RegistrationStatusRef')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_RegistrationStatusRef]
    FOREIGN KEY (RegistrationStatusCode) REFERENCES [RegistrationStatusRef] (RegistrationStatusCode)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_RegistrationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_UserMain_StatusChanged')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_UserMain_StatusChanged]
    FOREIGN KEY (StatusChangedUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_UserMain_StatusChanged]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipMain' AND [CONSTRAINT_NAME] = 'FK_Relationship_RelationshipTypeRef')
    ALTER TABLE [dbo].[RelationshipMain] WITH CHECK ADD CONSTRAINT [FK_Relationship_RelationshipTypeRef]
    FOREIGN KEY (RelationshipTypeKey) REFERENCES [RelationshipTypeRef] (RelationshipTypeKey)
go
ALTER TABLE [dbo].[RelationshipMain] CHECK CONSTRAINT [FK_Relationship_RelationshipTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipMain' AND [CONSTRAINT_NAME] = 'FK_RelationshipMain_UniformRegistry_Subject')
    ALTER TABLE [dbo].[RelationshipMain] WITH CHECK ADD CONSTRAINT [FK_RelationshipMain_UniformRegistry_Subject]
    FOREIGN KEY (SubjectUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[RelationshipMain] CHECK CONSTRAINT [FK_RelationshipMain_UniformRegistry_Subject]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipMain' AND [CONSTRAINT_NAME] = 'FK_RelationshipMain_UniformRegistry_Target')
    ALTER TABLE [dbo].[RelationshipMain] WITH CHECK ADD CONSTRAINT [FK_RelationshipMain_UniformRegistry_Target]
    FOREIGN KEY (TargetUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[RelationshipMain] CHECK CONSTRAINT [FK_RelationshipMain_UniformRegistry_Target]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipTypeCategory' AND [CONSTRAINT_NAME] = 'FK_RelationshipTypeCategory_RelationshipCategoryRef')
    ALTER TABLE [dbo].[RelationshipTypeCategory] WITH CHECK ADD CONSTRAINT [FK_RelationshipTypeCategory_RelationshipCategoryRef]
    FOREIGN KEY (RelationshipCategoryKey) REFERENCES [RelationshipCategoryRef] (RelationshipCategoryKey)
go
ALTER TABLE [dbo].[RelationshipTypeCategory] CHECK CONSTRAINT [FK_RelationshipTypeCategory_RelationshipCategoryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipTypeCategory' AND [CONSTRAINT_NAME] = 'FK_RelationshipTypeCategory_RelationshipTypeRef')
    ALTER TABLE [dbo].[RelationshipTypeCategory] WITH CHECK ADD CONSTRAINT [FK_RelationshipTypeCategory_RelationshipTypeRef]
    FOREIGN KEY (RelationshipTypeKey) REFERENCES [RelationshipTypeRef] (RelationshipTypeKey)
go
ALTER TABLE [dbo].[RelationshipTypeCategory] CHECK CONSTRAINT [FK_RelationshipTypeCategory_RelationshipTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RelationshipTypeRef' AND [CONSTRAINT_NAME] = 'FK_RelationshipTypeRef_RelationshipType_ReciprocalRef')
    ALTER TABLE [dbo].[RelationshipTypeRef] WITH CHECK ADD CONSTRAINT [FK_RelationshipTypeRef_RelationshipType_ReciprocalRef]
    FOREIGN KEY (ReciprocalRelationshipTypeKey) REFERENCES [RelationshipTypeRef] (RelationshipTypeKey)
go
ALTER TABLE [dbo].[RelationshipTypeRef] CHECK CONSTRAINT [FK_RelationshipTypeRef_RelationshipType_ReciprocalRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Remittance' AND [CONSTRAINT_NAME] = 'FK_Remittance_FinancialEntity')
    ALTER TABLE [dbo].[Remittance] WITH CHECK ADD CONSTRAINT [FK_Remittance_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[Remittance] CHECK CONSTRAINT [FK_Remittance_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Remittance' AND [CONSTRAINT_NAME] = 'FK_Remittance_PaymentDetail')
    ALTER TABLE [dbo].[Remittance] WITH CHECK ADD CONSTRAINT [FK_Remittance_PaymentDetail]
    FOREIGN KEY (PaymentDetailKey) REFERENCES [PaymentDetail] (PaymentDetailKey)
go
ALTER TABLE [dbo].[Remittance] CHECK CONSTRAINT [FK_Remittance_PaymentDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Remittance' AND [CONSTRAINT_NAME] = 'FK_Remittance_SystemEntity')
    ALTER TABLE [dbo].[Remittance] WITH CHECK ADD CONSTRAINT [FK_Remittance_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[Remittance] CHECK CONSTRAINT [FK_Remittance_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Remittance' AND [CONSTRAINT_NAME] = 'FK_Remittance_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Remittance] WITH CHECK ADD CONSTRAINT [FK_Remittance_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Remittance] CHECK CONSTRAINT [FK_Remittance_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Remittance' AND [CONSTRAINT_NAME] = 'FK_Remittance_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Remittance] WITH CHECK ADD CONSTRAINT [FK_Remittance_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Remittance] CHECK CONSTRAINT [FK_Remittance_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RemittanceApplication' AND [CONSTRAINT_NAME] = 'FK_RemittanceApplication_InvoiceLine')
    ALTER TABLE [dbo].[RemittanceApplication] WITH CHECK ADD CONSTRAINT [FK_RemittanceApplication_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[RemittanceApplication] CHECK CONSTRAINT [FK_RemittanceApplication_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RemittanceApplication' AND [CONSTRAINT_NAME] = 'FK_RemittanceApplication_InvoiceMain')
    ALTER TABLE [dbo].[RemittanceApplication] WITH CHECK ADD CONSTRAINT [FK_RemittanceApplication_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[RemittanceApplication] CHECK CONSTRAINT [FK_RemittanceApplication_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RemittanceApplication' AND [CONSTRAINT_NAME] = 'FK_RemittanceApplication_Remittance')
    ALTER TABLE [dbo].[RemittanceApplication] WITH CHECK ADD CONSTRAINT [FK_RemittanceApplication_Remittance]
    FOREIGN KEY (RemittanceKey) REFERENCES [Remittance] (RemittanceKey)
go
ALTER TABLE [dbo].[RemittanceApplication] CHECK CONSTRAINT [FK_RemittanceApplication_Remittance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ResourceActionRef' AND [CONSTRAINT_NAME] = 'FK_ResourceActionRef_OrganizationMain')
    ALTER TABLE [dbo].[ResourceActionRef] WITH CHECK ADD CONSTRAINT [FK_ResourceActionRef_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[ResourceActionRef] CHECK CONSTRAINT [FK_ResourceActionRef_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RestockPrice' AND [CONSTRAINT_NAME] = 'FK_RestockPrice_RestockPriceRef')
    ALTER TABLE [dbo].[RestockPrice] WITH CHECK ADD CONSTRAINT [FK_RestockPrice_RestockPriceRef]
    FOREIGN KEY (RestockPriceCode) REFERENCES [RestockPriceRef] (RestockPriceCode)
go
ALTER TABLE [dbo].[RestockPrice] CHECK CONSTRAINT [FK_RestockPrice_RestockPriceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RestockPrice' AND [CONSTRAINT_NAME] = 'FK_RestockPrice_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RestockPrice] WITH CHECK ADD CONSTRAINT [FK_RestockPrice_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RestockPrice] CHECK CONSTRAINT [FK_RestockPrice_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RestockPrice' AND [CONSTRAINT_NAME] = 'FK_RestockPrice_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RestockPrice] WITH CHECK ADD CONSTRAINT [FK_RestockPrice_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RestockPrice] CHECK CONSTRAINT [FK_RestockPrice_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RFMDefinition' AND [CONSTRAINT_NAME] = 'FK_RFMDefinition_DocumentMain_Transaction')
    ALTER TABLE [dbo].[RFMDefinition] WITH CHECK ADD CONSTRAINT [FK_RFMDefinition_DocumentMain_Transaction]
    FOREIGN KEY (TransactionDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[RFMDefinition] CHECK CONSTRAINT [FK_RFMDefinition_DocumentMain_Transaction]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RFMDefinition' AND [CONSTRAINT_NAME] = 'FK_RFMDefinition_DocumentMain_User')
    ALTER TABLE [dbo].[RFMDefinition] WITH CHECK ADD CONSTRAINT [FK_RFMDefinition_DocumentMain_User]
    FOREIGN KEY (UserDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[RFMDefinition] CHECK CONSTRAINT [FK_RFMDefinition_DocumentMain_User]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RFMMain' AND [CONSTRAINT_NAME] = 'FK_RFMMain_ContactMain')
    ALTER TABLE [dbo].[RFMMain] WITH CHECK ADD CONSTRAINT [FK_RFMMain_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[RFMMain] CHECK CONSTRAINT [FK_RFMMain_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RoleMain' AND [CONSTRAINT_NAME] = 'FK_RoleMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RoleMain] WITH CHECK ADD CONSTRAINT [FK_RoleMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RoleMain] CHECK CONSTRAINT [FK_RoleMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleCriterion' AND [CONSTRAINT_NAME] = 'FK_RuleCriterion_Rule')
    ALTER TABLE [dbo].[RuleCriterion] WITH CHECK ADD CONSTRAINT [FK_RuleCriterion_Rule]
    FOREIGN KEY (RuleKey) REFERENCES [RuleMain] (RuleKey)
go
ALTER TABLE [dbo].[RuleCriterion] CHECK CONSTRAINT [FK_RuleCriterion_Rule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleCriterion' AND [CONSTRAINT_NAME] = 'FK_RuleCriterion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RuleCriterion] WITH CHECK ADD CONSTRAINT [FK_RuleCriterion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RuleCriterion] CHECK CONSTRAINT [FK_RuleCriterion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleFilter' AND [CONSTRAINT_NAME] = 'FK_RuleFilter_ComparisonRef')
    ALTER TABLE [dbo].[RuleFilter] WITH CHECK ADD CONSTRAINT [FK_RuleFilter_ComparisonRef]
    FOREIGN KEY (ComparisonCode) REFERENCES [ComparisonRef] (ComparisonCode)
go
ALTER TABLE [dbo].[RuleFilter] CHECK CONSTRAINT [FK_RuleFilter_ComparisonRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleFilter' AND [CONSTRAINT_NAME] = 'FK_RuleFilter_RuleCriterion')
    ALTER TABLE [dbo].[RuleFilter] WITH CHECK ADD CONSTRAINT [FK_RuleFilter_RuleCriterion]
    FOREIGN KEY (RuleCriterionKey) REFERENCES [RuleCriterion] (RuleCriterionKey)
go
ALTER TABLE [dbo].[RuleFilter] CHECK CONSTRAINT [FK_RuleFilter_RuleCriterion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleFilter' AND [CONSTRAINT_NAME] = 'FK_RuleFilter_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RuleFilter] WITH CHECK ADD CONSTRAINT [FK_RuleFilter_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RuleFilter] CHECK CONSTRAINT [FK_RuleFilter_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleMain' AND [CONSTRAINT_NAME] = 'FK_RuleMain_ComponentRegistry_ObjectMapper')
    ALTER TABLE [dbo].[RuleMain] WITH CHECK ADD CONSTRAINT [FK_RuleMain_ComponentRegistry_ObjectMapper]
    FOREIGN KEY (ObjectMapperComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[RuleMain] CHECK CONSTRAINT [FK_RuleMain_ComponentRegistry_ObjectMapper]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleMain' AND [CONSTRAINT_NAME] = 'FK_RuleMain_ComponentRegistry_RuleEvaluator')
    ALTER TABLE [dbo].[RuleMain] WITH CHECK ADD CONSTRAINT [FK_RuleMain_ComponentRegistry_RuleEvaluator]
    FOREIGN KEY (RuleEvaluatorComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[RuleMain] CHECK CONSTRAINT [FK_RuleMain_ComponentRegistry_RuleEvaluator]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleMain' AND [CONSTRAINT_NAME] = 'FK_RuleMain_SystemEntity')
    ALTER TABLE [dbo].[RuleMain] WITH CHECK ADD CONSTRAINT [FK_RuleMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[RuleMain] CHECK CONSTRAINT [FK_RuleMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleMain' AND [CONSTRAINT_NAME] = 'FK_RuleMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[RuleMain] WITH CHECK ADD CONSTRAINT [FK_RuleMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RuleMain] CHECK CONSTRAINT [FK_RuleMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RuleMain' AND [CONSTRAINT_NAME] = 'FK_RuleMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[RuleMain] WITH CHECK ADD CONSTRAINT [FK_RuleMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[RuleMain] CHECK CONSTRAINT [FK_RuleMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_AccessMain')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_CommissionPlan')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_ContactMain_BillTo')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_ContactMain_ShipTo')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_ContactMain_ShipTo]
    FOREIGN KEY (ShipToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_ContactMain_ShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_ContactMain_SoldTo')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_ContactMain_SoldTo]
    FOREIGN KEY (SoldToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_ContactMain_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_GroupMain_SalesTeam')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_GroupMain_SalesTeam]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_GroupMain_SalesTeam]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_InvoiceTypeRef')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_InvoiceTypeRef]
    FOREIGN KEY (InvoiceTypeCode) REFERENCES [InvoiceTypeRef] (InvoiceTypeCode)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_InvoiceTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_OrderType')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_OrderType]
    FOREIGN KEY (OrderTypeKey) REFERENCES [OrderType] (OrderTypeKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_OrderType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_PriceSheet')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_ProductMain')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_PromotionDiscount')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_PromotionDiscount]
    FOREIGN KEY (PromotionDiscountKey) REFERENCES [PromotionDiscount] (PromotionDiscountKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_PromotionDiscount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_ResponseMediaRef')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_ResponseMediaRef]
    FOREIGN KEY (ResponseMediaCode) REFERENCES [ResponseMediaRef] (ResponseMediaCode)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_ResponseMediaRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_SalesHistory')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_SalesHistory]
    FOREIGN KEY (SourceSalesHistoryKey) REFERENCES [SalesHistory] (SalesHistoryKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_SalesHistory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_SalesLocation')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_SalesLocation]
    FOREIGN KEY (SalesLocationKey) REFERENCES [SalesLocation] (SalesLocationKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_SalesLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_Uom')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_Warehouse')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistoryMemorialTribute' AND [CONSTRAINT_NAME] = 'FK_SalesHistoryMemorialTribute_ContactMain')
    ALTER TABLE [dbo].[SalesHistoryMemorialTribute] WITH CHECK ADD CONSTRAINT [FK_SalesHistoryMemorialTribute_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[SalesHistoryMemorialTribute] CHECK CONSTRAINT [FK_SalesHistoryMemorialTribute_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistoryMemorialTribute' AND [CONSTRAINT_NAME] = 'FK_SalesHistoryMemorialTribute_SalesHistory')
    ALTER TABLE [dbo].[SalesHistoryMemorialTribute] WITH CHECK ADD CONSTRAINT [FK_SalesHistoryMemorialTribute_SalesHistory]
    FOREIGN KEY (SalesHistoryKey) REFERENCES [SalesHistory] (SalesHistoryKey)
go
ALTER TABLE [dbo].[SalesHistoryMemorialTribute] CHECK CONSTRAINT [FK_SalesHistoryMemorialTribute_SalesHistory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistoryRelationship' AND [CONSTRAINT_NAME] = 'FK_SalesHistoryRelationship_SalesHistory_Source')
    ALTER TABLE [dbo].[SalesHistoryRelationship] WITH CHECK ADD CONSTRAINT [FK_SalesHistoryRelationship_SalesHistory_Source]
    FOREIGN KEY (SourceSalesHistoryKey) REFERENCES [SalesHistory] (SalesHistoryKey)
go
ALTER TABLE [dbo].[SalesHistoryRelationship] CHECK CONSTRAINT [FK_SalesHistoryRelationship_SalesHistory_Source]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistoryRelationship' AND [CONSTRAINT_NAME] = 'FK_SalesHistoryRelationship_SalesHistory_Target')
    ALTER TABLE [dbo].[SalesHistoryRelationship] WITH CHECK ADD CONSTRAINT [FK_SalesHistoryRelationship_SalesHistory_Target]
    FOREIGN KEY (TargetSalesHistorykey) REFERENCES [SalesHistory] (SalesHistoryKey)
go
ALTER TABLE [dbo].[SalesHistoryRelationship] CHECK CONSTRAINT [FK_SalesHistoryRelationship_SalesHistory_Target]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistoryRelationship' AND [CONSTRAINT_NAME] = 'FK_SalesHistoryRelationship_SalesHistoryRelationshipTypeRef')
    ALTER TABLE [dbo].[SalesHistoryRelationship] WITH CHECK ADD CONSTRAINT [FK_SalesHistoryRelationship_SalesHistoryRelationshipTypeRef]
    FOREIGN KEY (SalesHistoryRelationshipTypeCode) REFERENCES [SalesHistoryRelationshipTypeRef] (SalesHistoryRelationshipTypeCode)
go
ALTER TABLE [dbo].[SalesHistoryRelationship] CHECK CONSTRAINT [FK_SalesHistoryRelationship_SalesHistoryRelationshipTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistorySoftCredit' AND [CONSTRAINT_NAME] = 'FK_SalesHistorySoftCredit_ContactMain')
    ALTER TABLE [dbo].[SalesHistorySoftCredit] WITH CHECK ADD CONSTRAINT [FK_SalesHistorySoftCredit_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[SalesHistorySoftCredit] CHECK CONSTRAINT [FK_SalesHistorySoftCredit_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistorySoftCredit' AND [CONSTRAINT_NAME] = 'FK_SalesHistorySoftCredit_SalesHistory')
    ALTER TABLE [dbo].[SalesHistorySoftCredit] WITH CHECK ADD CONSTRAINT [FK_SalesHistorySoftCredit_SalesHistory]
    FOREIGN KEY (SalesHistoryKey) REFERENCES [SalesHistory] (SalesHistoryKey)
go
ALTER TABLE [dbo].[SalesHistorySoftCredit] CHECK CONSTRAINT [FK_SalesHistorySoftCredit_SalesHistory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesLocation' AND [CONSTRAINT_NAME] = 'FK_SalesLocation_FullAddress')
    ALTER TABLE [dbo].[SalesLocation] WITH CHECK ADD CONSTRAINT [FK_SalesLocation_FullAddress]
    FOREIGN KEY (FullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[SalesLocation] CHECK CONSTRAINT [FK_SalesLocation_FullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesLocation' AND [CONSTRAINT_NAME] = 'FK_SalesLocation_SalesLocationStatusRef')
    ALTER TABLE [dbo].[SalesLocation] WITH CHECK ADD CONSTRAINT [FK_SalesLocation_SalesLocationStatusRef]
    FOREIGN KEY (SalesLocationStatusCode) REFERENCES [SalesLocationStatusRef] (SalesLocationStatusCode)
go
ALTER TABLE [dbo].[SalesLocation] CHECK CONSTRAINT [FK_SalesLocation_SalesLocationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesTeamMember' AND [CONSTRAINT_NAME] = 'FK_SalesTeamMember_GroupMember')
    ALTER TABLE [dbo].[SalesTeamMember] WITH CHECK ADD CONSTRAINT [FK_SalesTeamMember_GroupMember]
    FOREIGN KEY (GroupMemberKey) REFERENCES [GroupMember] (GroupMemberKey)
go
ALTER TABLE [dbo].[SalesTeamMember] CHECK CONSTRAINT [FK_SalesTeamMember_GroupMember]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalutationRef' AND [CONSTRAINT_NAME] = 'FK_SalutationRef_UniformRegistry')
    ALTER TABLE [dbo].[SalutationRef] WITH CHECK ADD CONSTRAINT [FK_SalutationRef_UniformRegistry]
    FOREIGN KEY (SalutationKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SalutationRef] CHECK CONSTRAINT [FK_SalutationRef_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduleCommon' AND [CONSTRAINT_NAME] = 'FK_ScheduleCommon_IntervalTypeRef')
    ALTER TABLE [dbo].[ScheduleCommon] WITH CHECK ADD CONSTRAINT [FK_ScheduleCommon_IntervalTypeRef]
    FOREIGN KEY (IntervalTypeCode) REFERENCES [IntervalTypeRef] (IntervalTypeCode)
go
ALTER TABLE [dbo].[ScheduleCommon] CHECK CONSTRAINT [FK_ScheduleCommon_IntervalTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduleCommon' AND [CONSTRAINT_NAME] = 'FK_ScheduleCommon_SystemEntity')
    ALTER TABLE [dbo].[ScheduleCommon] WITH CHECK ADD CONSTRAINT [FK_ScheduleCommon_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ScheduleCommon] CHECK CONSTRAINT [FK_ScheduleCommon_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduleCommon' AND [CONSTRAINT_NAME] = 'FK_ScheduleCommon_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ScheduleCommon] WITH CHECK ADD CONSTRAINT [FK_ScheduleCommon_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScheduleCommon] CHECK CONSTRAINT [FK_ScheduleCommon_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduleCommon' AND [CONSTRAINT_NAME] = 'FK_ScheduleCommon_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ScheduleCommon] WITH CHECK ADD CONSTRAINT [FK_ScheduleCommon_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScheduleCommon] CHECK CONSTRAINT [FK_ScheduleCommon_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTask' AND [CONSTRAINT_NAME] = 'FK_ScheduledTask_ScheduledTaskService')
    ALTER TABLE [dbo].[ScheduledTask] WITH CHECK ADD CONSTRAINT [FK_ScheduledTask_ScheduledTaskService]
    FOREIGN KEY (SelectionLock) REFERENCES [ScheduledTaskService] (ScheduledTaskServiceKey)
go
ALTER TABLE [dbo].[ScheduledTask] CHECK CONSTRAINT [FK_ScheduledTask_ScheduledTaskService]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTask' AND [CONSTRAINT_NAME] = 'FK_ScheduledTask_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ScheduledTask] WITH CHECK ADD CONSTRAINT [FK_ScheduledTask_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScheduledTask] CHECK CONSTRAINT [FK_ScheduledTask_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTask' AND [CONSTRAINT_NAME] = 'FK_ScheduledTask_UserMain_RunAs')
    ALTER TABLE [dbo].[ScheduledTask] WITH CHECK ADD CONSTRAINT [FK_ScheduledTask_UserMain_RunAs]
    FOREIGN KEY (RunAsUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScheduledTask] CHECK CONSTRAINT [FK_ScheduledTask_UserMain_RunAs]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTask' AND [CONSTRAINT_NAME] = 'FK_ScheduledTask_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ScheduledTask] WITH CHECK ADD CONSTRAINT [FK_ScheduledTask_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScheduledTask] CHECK CONSTRAINT [FK_ScheduledTask_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTaskHistory' AND [CONSTRAINT_NAME] = 'FK_ScheduledTaskHistory_ScheduledTask')
    ALTER TABLE [dbo].[ScheduledTaskHistory] WITH CHECK ADD CONSTRAINT [FK_ScheduledTaskHistory_ScheduledTask]
    FOREIGN KEY (ScheduledTaskKey) REFERENCES [ScheduledTask] (ScheduledTaskKey)
go
ALTER TABLE [dbo].[ScheduledTaskHistory] CHECK CONSTRAINT [FK_ScheduledTaskHistory_ScheduledTask]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScheduledTaskService' AND [CONSTRAINT_NAME] = 'FK_ScheduledTaskService_ServiceStatusRef')
    ALTER TABLE [dbo].[ScheduledTaskService] WITH CHECK ADD CONSTRAINT [FK_ScheduledTaskService_ServiceStatusRef]
    FOREIGN KEY (ServiceStatus) REFERENCES [ServiceStatusRef] (ServiceStatusCode)
go
ALTER TABLE [dbo].[ScheduledTaskService] CHECK CONSTRAINT [FK_ScheduledTaskService_ServiceStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SeasonalFullAddress' AND [CONSTRAINT_NAME] = 'FK_SeasonalFullAddress_FullAddress')
    ALTER TABLE [dbo].[SeasonalFullAddress] WITH CHECK ADD CONSTRAINT [FK_SeasonalFullAddress_FullAddress]
    FOREIGN KEY (FullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[SeasonalFullAddress] CHECK CONSTRAINT [FK_SeasonalFullAddress_FullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SeasonalFullAddress' AND [CONSTRAINT_NAME] = 'FK_SeasonalFullAddress_FullAddress_Replaces')
    ALTER TABLE [dbo].[SeasonalFullAddress] WITH CHECK ADD CONSTRAINT [FK_SeasonalFullAddress_FullAddress_Replaces]
    FOREIGN KEY (ReplacesFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[SeasonalFullAddress] CHECK CONSTRAINT [FK_SeasonalFullAddress_FullAddress_Replaces]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_AccessMain')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_SystemEntity')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_UniformRegistry')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_UniformRegistry]
    FOREIGN KEY (SegmentationJobKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_UserMain_LastListCreatedBy')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_UserMain_LastListCreatedBy]
    FOREIGN KEY (LastListCreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_UserMain_LastListCreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentationJob' AND [CONSTRAINT_NAME] = 'FK_SegmentationJob_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SegmentationJob] WITH CHECK ADD CONSTRAINT [FK_SegmentationJob_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SegmentationJob] CHECK CONSTRAINT [FK_SegmentationJob_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentDefinition' AND [CONSTRAINT_NAME] = 'FK_SegmentDefinition_ListMain')
    ALTER TABLE [dbo].[SegmentDefinition] WITH CHECK ADD CONSTRAINT [FK_SegmentDefinition_ListMain]
    FOREIGN KEY (SegmentDefinitionKey) REFERENCES [ListMain] (ListKey)
go
ALTER TABLE [dbo].[SegmentDefinition] CHECK CONSTRAINT [FK_SegmentDefinition_ListMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentDefinition' AND [CONSTRAINT_NAME] = 'FK_SegmentDefinition_SegmentationJob')
    ALTER TABLE [dbo].[SegmentDefinition] WITH CHECK ADD CONSTRAINT [FK_SegmentDefinition_SegmentationJob]
    FOREIGN KEY (SegmentationJobKey) REFERENCES [SegmentationJob] (SegmentationJobKey)
go
ALTER TABLE [dbo].[SegmentDefinition] CHECK CONSTRAINT [FK_SegmentDefinition_SegmentationJob]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentDefinition' AND [CONSTRAINT_NAME] = 'FK_SegmentDefinition_UniformRegistry')
    ALTER TABLE [dbo].[SegmentDefinition] WITH CHECK ADD CONSTRAINT [FK_SegmentDefinition_UniformRegistry]
    FOREIGN KEY (SegmentDefinitionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SegmentDefinition] CHECK CONSTRAINT [FK_SegmentDefinition_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentDefinition' AND [CONSTRAINT_NAME] = 'FK_SegmentDefinition_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SegmentDefinition] WITH CHECK ADD CONSTRAINT [FK_SegmentDefinition_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SegmentDefinition] CHECK CONSTRAINT [FK_SegmentDefinition_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SegmentDefinition' AND [CONSTRAINT_NAME] = 'FK_SegmentDefinition_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SegmentDefinition] WITH CHECK ADD CONSTRAINT [FK_SegmentDefinition_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SegmentDefinition] CHECK CONSTRAINT [FK_SegmentDefinition_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SequenceCounter' AND [CONSTRAINT_NAME] = 'FK_SequenceCounter_OrganizationMain')
    ALTER TABLE [dbo].[SequenceCounter] WITH CHECK ADD CONSTRAINT [FK_SequenceCounter_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[SequenceCounter] CHECK CONSTRAINT [FK_SequenceCounter_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SequenceCounter' AND [CONSTRAINT_NAME] = 'FK_SequenceCounter_SystemEntity')
    ALTER TABLE [dbo].[SequenceCounter] WITH CHECK ADD CONSTRAINT [FK_SequenceCounter_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[SequenceCounter] CHECK CONSTRAINT [FK_SequenceCounter_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SequenceCounter' AND [CONSTRAINT_NAME] = 'FK_SequenceCounter_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SequenceCounter] WITH CHECK ADD CONSTRAINT [FK_SequenceCounter_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SequenceCounter] CHECK CONSTRAINT [FK_SequenceCounter_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SequenceCounter' AND [CONSTRAINT_NAME] = 'FK_SequenceCounter_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SequenceCounter] WITH CHECK ADD CONSTRAINT [FK_SequenceCounter_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SequenceCounter] CHECK CONSTRAINT [FK_SequenceCounter_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCarrier' AND [CONSTRAINT_NAME] = 'FK_ShipCarrier_SystemEntity')
    ALTER TABLE [dbo].[ShipCarrier] WITH CHECK ADD CONSTRAINT [FK_ShipCarrier_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ShipCarrier] CHECK CONSTRAINT [FK_ShipCarrier_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCarrier' AND [CONSTRAINT_NAME] = 'FK_ShipCarrier_UniformRegistry')
    ALTER TABLE [dbo].[ShipCarrier] WITH CHECK ADD CONSTRAINT [FK_ShipCarrier_UniformRegistry]
    FOREIGN KEY (ShipCarrierKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ShipCarrier] CHECK CONSTRAINT [FK_ShipCarrier_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCarrier' AND [CONSTRAINT_NAME] = 'FK_ShipCarrier_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipCarrier] WITH CHECK ADD CONSTRAINT [FK_ShipCarrier_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipCarrier] CHECK CONSTRAINT [FK_ShipCarrier_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCarrier' AND [CONSTRAINT_NAME] = 'FK_ShipCarrier_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipCarrier] WITH CHECK ADD CONSTRAINT [FK_ShipCarrier_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipCarrier] CHECK CONSTRAINT [FK_ShipCarrier_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCharge' AND [CONSTRAINT_NAME] = 'FK_ShipCharge_OrderShipTo')
    ALTER TABLE [dbo].[ShipCharge] WITH CHECK ADD CONSTRAINT [FK_ShipCharge_OrderShipTo]
    FOREIGN KEY (OrderShipToKey) REFERENCES [OrderShipTo] (OrderShipToKey)
go
ALTER TABLE [dbo].[ShipCharge] CHECK CONSTRAINT [FK_ShipCharge_OrderShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCharge' AND [CONSTRAINT_NAME] = 'FK_ShipCharge_ProductMain')
    ALTER TABLE [dbo].[ShipCharge] WITH CHECK ADD CONSTRAINT [FK_ShipCharge_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ShipCharge] CHECK CONSTRAINT [FK_ShipCharge_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCharge' AND [CONSTRAINT_NAME] = 'FK_ShipCharge_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipCharge] WITH CHECK ADD CONSTRAINT [FK_ShipCharge_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipCharge] CHECK CONSTRAINT [FK_ShipCharge_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipCharge' AND [CONSTRAINT_NAME] = 'FK_ShipCharge_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipCharge] WITH CHECK ADD CONSTRAINT [FK_ShipCharge_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipCharge] CHECK CONSTRAINT [FK_ShipCharge_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_MiscCharge')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_MiscCharge]
    FOREIGN KEY (MiscChargeKey) REFERENCES [MiscCharge] (MiscChargeKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_MiscCharge]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_OrderMain')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_OrderShipTo')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_OrderShipTo]
    FOREIGN KEY (OrderShipToKey) REFERENCES [OrderShipTo] (OrderShipToKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_OrderShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_ShipCarrier')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_ShipCarrier]
    FOREIGN KEY (ShipCarrierKey) REFERENCES [ShipCarrier] (ShipCarrierKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_ShipCarrier]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_ShipCharge')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_ShipCharge]
    FOREIGN KEY (ShipChargeKey) REFERENCES [ShipCharge] (ShipChargeKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_ShipCharge]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_ShipMethod')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_SystemEntity')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_UniformRegistry')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_UniformRegistry]
    FOREIGN KEY (ShipmentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Shipment' AND [CONSTRAINT_NAME] = 'FK_Shipment_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [FK_Shipment_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentLine_OrderFulfillmentLine')
    ALTER TABLE [dbo].[ShipmentLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentLine_OrderFulfillmentLine]
    FOREIGN KEY (OrderFulfillmentLineKey) REFERENCES [OrderFulfillmentLine] (OrderFulfillmentLineKey)
go
ALTER TABLE [dbo].[ShipmentLine] CHECK CONSTRAINT [FK_ShipmentLine_OrderFulfillmentLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentLine_Shipment')
    ALTER TABLE [dbo].[ShipmentLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentLine_Shipment]
    FOREIGN KEY (ShipmentKey) REFERENCES [Shipment] (ShipmentKey)
go
ALTER TABLE [dbo].[ShipmentLine] CHECK CONSTRAINT [FK_ShipmentLine_Shipment]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentLine_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipmentLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentLine_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipmentLine] CHECK CONSTRAINT [FK_ShipmentLine_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentTaxLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentTaxLine_OrderLine')
    ALTER TABLE [dbo].[ShipmentTaxLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentTaxLine_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[ShipmentTaxLine] CHECK CONSTRAINT [FK_ShipmentTaxLine_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentTaxLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentTaxLine_ProductMain')
    ALTER TABLE [dbo].[ShipmentTaxLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentTaxLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[ShipmentTaxLine] CHECK CONSTRAINT [FK_ShipmentTaxLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentTaxLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentTaxLine_Shipment')
    ALTER TABLE [dbo].[ShipmentTaxLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentTaxLine_Shipment]
    FOREIGN KEY (ShipmentKey) REFERENCES [Shipment] (ShipmentKey)
go
ALTER TABLE [dbo].[ShipmentTaxLine] CHECK CONSTRAINT [FK_ShipmentTaxLine_Shipment]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentTaxLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentTaxLine_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipmentTaxLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentTaxLine_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipmentTaxLine] CHECK CONSTRAINT [FK_ShipmentTaxLine_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipmentTaxLine' AND [CONSTRAINT_NAME] = 'FK_ShipmentTaxLine_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipmentTaxLine] WITH CHECK ADD CONSTRAINT [FK_ShipmentTaxLine_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipmentTaxLine] CHECK CONSTRAINT [FK_ShipmentTaxLine_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipMethod' AND [CONSTRAINT_NAME] = 'FK_ShipMethod_SystemEntity')
    ALTER TABLE [dbo].[ShipMethod] WITH CHECK ADD CONSTRAINT [FK_ShipMethod_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ShipMethod] CHECK CONSTRAINT [FK_ShipMethod_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipMethod' AND [CONSTRAINT_NAME] = 'FK_ShipMethod_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipMethod] WITH CHECK ADD CONSTRAINT [FK_ShipMethod_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipMethod] CHECK CONSTRAINT [FK_ShipMethod_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipMethod' AND [CONSTRAINT_NAME] = 'FK_ShipMethod_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipMethod] WITH CHECK ADD CONSTRAINT [FK_ShipMethod_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipMethod] CHECK CONSTRAINT [FK_ShipMethod_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipMethodMethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_ShipMethodMethodSetDetail_MethodSetDetail')
    ALTER TABLE [dbo].[ShipMethodMethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_ShipMethodMethodSetDetail_MethodSetDetail]
    FOREIGN KEY (MethodSetDetailKey) REFERENCES [MethodSetDetail] (MethodSetDetailKey)
go
ALTER TABLE [dbo].[ShipMethodMethodSetDetail] CHECK CONSTRAINT [FK_ShipMethodMethodSetDetail_MethodSetDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipMethodMethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_ShipMethodMethodSetDetail_ShipMethod')
    ALTER TABLE [dbo].[ShipMethodMethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_ShipMethodMethodSetDetail_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[ShipMethodMethodSetDetail] CHECK CONSTRAINT [FK_ShipMethodMethodSetDetail_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipOrigin' AND [CONSTRAINT_NAME] = 'FK_ShipOrigin_CountryRef')
    ALTER TABLE [dbo].[ShipOrigin] WITH CHECK ADD CONSTRAINT [FK_ShipOrigin_CountryRef]
    FOREIGN KEY (DefaultCountryCode) REFERENCES [CountryRef] (CountryCode)
go
ALTER TABLE [dbo].[ShipOrigin] CHECK CONSTRAINT [FK_ShipOrigin_CountryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipOrigin' AND [CONSTRAINT_NAME] = 'FK_ShipOrigin_SystemEntity')
    ALTER TABLE [dbo].[ShipOrigin] WITH CHECK ADD CONSTRAINT [FK_ShipOrigin_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[ShipOrigin] CHECK CONSTRAINT [FK_ShipOrigin_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipOrigin' AND [CONSTRAINT_NAME] = 'FK_ShipOrigin_UniformRegistry')
    ALTER TABLE [dbo].[ShipOrigin] WITH CHECK ADD CONSTRAINT [FK_ShipOrigin_UniformRegistry]
    FOREIGN KEY (ShipOriginKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[ShipOrigin] CHECK CONSTRAINT [FK_ShipOrigin_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipOrigin' AND [CONSTRAINT_NAME] = 'FK_ShipOrigin_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipOrigin] WITH CHECK ADD CONSTRAINT [FK_ShipOrigin_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipOrigin] CHECK CONSTRAINT [FK_ShipOrigin_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipOrigin' AND [CONSTRAINT_NAME] = 'FK_ShipOrigin_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipOrigin] WITH CHECK ADD CONSTRAINT [FK_ShipOrigin_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipOrigin] CHECK CONSTRAINT [FK_ShipOrigin_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipPrice' AND [CONSTRAINT_NAME] = 'FK_ShipPrice_ShipMethod')
    ALTER TABLE [dbo].[ShipPrice] WITH CHECK ADD CONSTRAINT [FK_ShipPrice_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[ShipPrice] CHECK CONSTRAINT [FK_ShipPrice_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipPrice' AND [CONSTRAINT_NAME] = 'FK_ShipPrice_ShipPriceRef')
    ALTER TABLE [dbo].[ShipPrice] WITH CHECK ADD CONSTRAINT [FK_ShipPrice_ShipPriceRef]
    FOREIGN KEY (PricingTypeCode) REFERENCES [ShipPriceRef] (ShipPriceCode)
go
ALTER TABLE [dbo].[ShipPrice] CHECK CONSTRAINT [FK_ShipPrice_ShipPriceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipPrice' AND [CONSTRAINT_NAME] = 'FK_ShipPrice_ShipZone')
    ALTER TABLE [dbo].[ShipPrice] WITH CHECK ADD CONSTRAINT [FK_ShipPrice_ShipZone]
    FOREIGN KEY (ShipZoneKey) REFERENCES [ShipZone] (ShipZoneKey)
go
ALTER TABLE [dbo].[ShipPrice] CHECK CONSTRAINT [FK_ShipPrice_ShipZone]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipPrice' AND [CONSTRAINT_NAME] = 'FK_ShipPrice_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipPrice] WITH CHECK ADD CONSTRAINT [FK_ShipPrice_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipPrice] CHECK CONSTRAINT [FK_ShipPrice_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipPrice' AND [CONSTRAINT_NAME] = 'FK_ShipPrice_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipPrice] WITH CHECK ADD CONSTRAINT [FK_ShipPrice_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipPrice] CHECK CONSTRAINT [FK_ShipPrice_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipZone' AND [CONSTRAINT_NAME] = 'FK_ShipZone_CountryRef')
    ALTER TABLE [dbo].[ShipZone] WITH CHECK ADD CONSTRAINT [FK_ShipZone_CountryRef]
    FOREIGN KEY (CountryCode) REFERENCES [CountryRef] (CountryCode)
go
ALTER TABLE [dbo].[ShipZone] CHECK CONSTRAINT [FK_ShipZone_CountryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipZone' AND [CONSTRAINT_NAME] = 'FK_ShipZone_ShipOrigin')
    ALTER TABLE [dbo].[ShipZone] WITH CHECK ADD CONSTRAINT [FK_ShipZone_ShipOrigin]
    FOREIGN KEY (ShipOriginKey) REFERENCES [ShipOrigin] (ShipOriginKey)
go
ALTER TABLE [dbo].[ShipZone] CHECK CONSTRAINT [FK_ShipZone_ShipOrigin]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipZone' AND [CONSTRAINT_NAME] = 'FK_ShipZone_UserMain_CreatedBy')
    ALTER TABLE [dbo].[ShipZone] WITH CHECK ADD CONSTRAINT [FK_ShipZone_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipZone] CHECK CONSTRAINT [FK_ShipZone_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ShipZone' AND [CONSTRAINT_NAME] = 'FK_ShipZone_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[ShipZone] WITH CHECK ADD CONSTRAINT [FK_ShipZone_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ShipZone] CHECK CONSTRAINT [FK_ShipZone_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SoftCreditRelationshipType' AND [CONSTRAINT_NAME] = 'FK_SoftCreditRelationshipType_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SoftCreditRelationshipType] WITH CHECK ADD CONSTRAINT [FK_SoftCreditRelationshipType_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SoftCreditRelationshipType] CHECK CONSTRAINT [FK_SoftCreditRelationshipType_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_AccessMain')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_AppealMain_AppealKey')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_AppealMain_AppealKey]
    FOREIGN KEY (AppealKey) REFERENCES [AppealMain] (AppealKey)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_AppealMain_AppealKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_SolicitationStatusRef')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_SolicitationStatusRef]
    FOREIGN KEY (SolicitationStatusCode) REFERENCES [SolicitationStatusRef] (SolicitationStatusCode)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_SolicitationStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_UniformRegistry')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_UniformRegistry]
    FOREIGN KEY (SolicitationKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationMain' AND [CONSTRAINT_NAME] = 'FK_SolicitationMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SolicitationMain] WITH CHECK ADD CONSTRAINT [FK_SolicitationMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SolicitationMain] CHECK CONSTRAINT [FK_SolicitationMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationSource' AND [CONSTRAINT_NAME] = 'FK_SolicitationSource_ComponentRegistry_Selector')
    ALTER TABLE [dbo].[SolicitationSource] WITH CHECK ADD CONSTRAINT [FK_SolicitationSource_ComponentRegistry_Selector]
    FOREIGN KEY (SelectorComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[SolicitationSource] CHECK CONSTRAINT [FK_SolicitationSource_ComponentRegistry_Selector]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationSource' AND [CONSTRAINT_NAME] = 'FK_SolicitationSource_SourceCode')
    ALTER TABLE [dbo].[SolicitationSource] WITH CHECK ADD CONSTRAINT [FK_SolicitationSource_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[SolicitationSource] CHECK CONSTRAINT [FK_SolicitationSource_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationSource' AND [CONSTRAINT_NAME] = 'FK_SolicitationSource_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SolicitationSource] WITH CHECK ADD CONSTRAINT [FK_SolicitationSource_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SolicitationSource] CHECK CONSTRAINT [FK_SolicitationSource_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SolicitationSource' AND [CONSTRAINT_NAME] = 'FK_SolicitationSource_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SolicitationSource] WITH CHECK ADD CONSTRAINT [FK_SolicitationSource_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SolicitationSource] CHECK CONSTRAINT [FK_SolicitationSource_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SortNameAdjustment' AND [CONSTRAINT_NAME] = 'FK_SortNameAdjustment_SortNameAdjustmentActionRef')
    ALTER TABLE [dbo].[SortNameAdjustment] WITH CHECK ADD CONSTRAINT [FK_SortNameAdjustment_SortNameAdjustmentActionRef]
    FOREIGN KEY (SortNameAdjustmentActionCode) REFERENCES [SortNameAdjustmentActionRef] (SortNameAdjustmentActionCode)
go
ALTER TABLE [dbo].[SortNameAdjustment] CHECK CONSTRAINT [FK_SortNameAdjustment_SortNameAdjustmentActionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_AccessMain')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_PackageMain')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_PackageMain]
    FOREIGN KEY (PackageKey) REFERENCES [PackageMain] (PackageKey)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_PackageMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_SolicitationMain')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_SolicitationMain]
    FOREIGN KEY (SolicitationKey) REFERENCES [SolicitationMain] (SolicitationKey)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_SolicitationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_SourceCodeStatusRef')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_SourceCodeStatusRef]
    FOREIGN KEY (SourceCodeStatusCode) REFERENCES [SourceCodeStatusRef] (SourceCodeStatusCode)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_SourceCodeStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_SourceCodeTypeRef')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_SourceCodeTypeRef]
    FOREIGN KEY (SourceCodeTypeCode) REFERENCES [SourceCodeTypeRef] (SourceCodeTypeCode)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_SourceCodeTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_UniformRegistry')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_UniformRegistry]
    FOREIGN KEY (SourceCodeKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceCode' AND [CONSTRAINT_NAME] = 'FK_SourceCode_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SourceCode] WITH CHECK ADD CONSTRAINT [FK_SourceCode_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SourceCode] CHECK CONSTRAINT [FK_SourceCode_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceLineOrderPromotion' AND [CONSTRAINT_NAME] = 'FK_SourceLineOrderPromotion_OrderLine')
    ALTER TABLE [dbo].[SourceLineOrderPromotion] WITH CHECK ADD CONSTRAINT [FK_SourceLineOrderPromotion_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[SourceLineOrderPromotion] CHECK CONSTRAINT [FK_SourceLineOrderPromotion_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceLineOrderPromotion' AND [CONSTRAINT_NAME] = 'FK_SourceLineOrderPromotion_OrderPromotion')
    ALTER TABLE [dbo].[SourceLineOrderPromotion] WITH CHECK ADD CONSTRAINT [FK_SourceLineOrderPromotion_OrderPromotion]
    FOREIGN KEY (OrderPromotionKey) REFERENCES [OrderPromotion] (OrderPromotionKey)
go
ALTER TABLE [dbo].[SourceLineOrderPromotion] CHECK CONSTRAINT [FK_SourceLineOrderPromotion_OrderPromotion]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceLineOrderPromotion' AND [CONSTRAINT_NAME] = 'FK_SourceLineOrderPromotion_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SourceLineOrderPromotion] WITH CHECK ADD CONSTRAINT [FK_SourceLineOrderPromotion_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SourceLineOrderPromotion] CHECK CONSTRAINT [FK_SourceLineOrderPromotion_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SourceLineOrderPromotion' AND [CONSTRAINT_NAME] = 'FK_SourceLineOrderPromotion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SourceLineOrderPromotion] WITH CHECK ADD CONSTRAINT [FK_SourceLineOrderPromotion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SourceLineOrderPromotion] CHECK CONSTRAINT [FK_SourceLineOrderPromotion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'StateProvinceRef' AND [CONSTRAINT_NAME] = 'FK_StateProvinceRef_CountryRef')
    ALTER TABLE [dbo].[StateProvinceRef] WITH CHECK ADD CONSTRAINT [FK_StateProvinceRef_CountryRef]
    FOREIGN KEY (CountryCode) REFERENCES [CountryRef] (CountryCode)
go
ALTER TABLE [dbo].[StateProvinceRef] CHECK CONSTRAINT [FK_StateProvinceRef_CountryRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'StateProvinceRef' AND [CONSTRAINT_NAME] = 'FK_StateProvinceRef_GroupMain_Chapter')
    ALTER TABLE [dbo].[StateProvinceRef] WITH CHECK ADD CONSTRAINT [FK_StateProvinceRef_GroupMain_Chapter]
    FOREIGN KEY (ChapterGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[StateProvinceRef] CHECK CONSTRAINT [FK_StateProvinceRef_GroupMain_Chapter]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'StateProvinceRef' AND [CONSTRAINT_NAME] = 'FK_StateProvinceRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[StateProvinceRef] WITH CHECK ADD CONSTRAINT [FK_StateProvinceRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[StateProvinceRef] CHECK CONSTRAINT [FK_StateProvinceRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_AccessMain')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_GroupMain')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_GroupMain]
    FOREIGN KEY (NotificationGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_SupplementStatusRef')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_SupplementStatusRef]
    FOREIGN KEY (SupplementStatusCode) REFERENCES [SupplementStatusRef] (SupplementStatusCode)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_SupplementStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_SupplementTypeRef')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_SupplementTypeRef]
    FOREIGN KEY (SupplementTypeKey) REFERENCES [SupplementTypeRef] (SupplementTypeKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_SupplementTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_SystemEntity')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_UniformRegistry')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_UniformRegistry]
    FOREIGN KEY (SupplementKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SupplementMain' AND [CONSTRAINT_NAME] = 'FK_SupplementMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SupplementMain] WITH CHECK ADD CONSTRAINT [FK_SupplementMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SupplementMain] CHECK CONSTRAINT [FK_SupplementMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'System_Variable' AND [CONSTRAINT_NAME] = 'FK_SystemVariable_DataType')
    ALTER TABLE [dbo].[System_Variable] WITH CHECK ADD CONSTRAINT [FK_SystemVariable_DataType]
    FOREIGN KEY (DataTypeCode) REFERENCES [Data_Type_Ref] (DataTypeCode)
go
ALTER TABLE [dbo].[System_Variable] CHECK CONSTRAINT [FK_SystemVariable_DataType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'System_Variable' AND [CONSTRAINT_NAME] = 'FK_SystemVariable_VariableType')
    ALTER TABLE [dbo].[System_Variable] WITH CHECK ADD CONSTRAINT [FK_SystemVariable_VariableType]
    FOREIGN KEY (VariableTypeCode) REFERENCES [Variable_Type_Ref] (VariableTypeCode)
go
ALTER TABLE [dbo].[System_Variable] CHECK CONSTRAINT [FK_SystemVariable_VariableType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfig' AND [CONSTRAINT_NAME] = 'FK_SystemConfig_OrganizationMain')
    ALTER TABLE [dbo].[SystemConfig] WITH CHECK ADD CONSTRAINT [FK_SystemConfig_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[SystemConfig] CHECK CONSTRAINT [FK_SystemConfig_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfig' AND [CONSTRAINT_NAME] = 'FK_SystemConfig_SystemEntity')
    ALTER TABLE [dbo].[SystemConfig] WITH CHECK ADD CONSTRAINT [FK_SystemConfig_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[SystemConfig] CHECK CONSTRAINT [FK_SystemConfig_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfig' AND [CONSTRAINT_NAME] = 'FK_SystemConfig_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SystemConfig] WITH CHECK ADD CONSTRAINT [FK_SystemConfig_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SystemConfig] CHECK CONSTRAINT [FK_SystemConfig_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfig' AND [CONSTRAINT_NAME] = 'FK_SystemConfig_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SystemConfig] WITH CHECK ADD CONSTRAINT [FK_SystemConfig_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SystemConfig] CHECK CONSTRAINT [FK_SystemConfig_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfigPageParameterRef' AND [CONSTRAINT_NAME] = 'FK_SystemConfigPageParameterRef_SystemConfigPageRef')
    ALTER TABLE [dbo].[SystemConfigPageParameterRef] WITH CHECK ADD CONSTRAINT [FK_SystemConfigPageParameterRef_SystemConfigPageRef]
    FOREIGN KEY (SystemConfigPageKey) REFERENCES [SystemConfigPageRef] (SystemConfigPageKey)
go
ALTER TABLE [dbo].[SystemConfigPageParameterRef] CHECK CONSTRAINT [FK_SystemConfigPageParameterRef_SystemConfigPageRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfigPageParameterRef' AND [CONSTRAINT_NAME] = 'FK_SystemConfigPageParameterRef_SystemConfigParameterRef')
    ALTER TABLE [dbo].[SystemConfigPageParameterRef] WITH CHECK ADD CONSTRAINT [FK_SystemConfigPageParameterRef_SystemConfigParameterRef]
    FOREIGN KEY (ParameterName) REFERENCES [SystemConfigParameterRef] (ParameterName)
go
ALTER TABLE [dbo].[SystemConfigPageParameterRef] CHECK CONSTRAINT [FK_SystemConfigPageParameterRef_SystemConfigParameterRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfigParameterRef' AND [CONSTRAINT_NAME] = 'FK_SystemConfigParameterRef_PropertyDefinition')
    ALTER TABLE [dbo].[SystemConfigParameterRef] WITH CHECK ADD CONSTRAINT [FK_SystemConfigParameterRef_PropertyDefinition]
    FOREIGN KEY (PropertyDefinitionKey) REFERENCES [PropertyDefinition] (PropertyDefinitionKey)
go
ALTER TABLE [dbo].[SystemConfigParameterRef] CHECK CONSTRAINT [FK_SystemConfigParameterRef_PropertyDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemConfigParameterRef' AND [CONSTRAINT_NAME] = 'FK_SystemConfigParameterRef_SystemRef')
    ALTER TABLE [dbo].[SystemConfigParameterRef] WITH CHECK ADD CONSTRAINT [FK_SystemConfigParameterRef_SystemRef]
    FOREIGN KEY (SystemKeyword) REFERENCES [SystemRef] (SystemKeyword)
go
ALTER TABLE [dbo].[SystemConfigParameterRef] CHECK CONSTRAINT [FK_SystemConfigParameterRef_SystemRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_AccessMain')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_AccessMain_ApplicationAccessKey')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_AccessMain_ApplicationAccessKey]
    FOREIGN KEY (ApplicationAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_AccessMain_ApplicationAccessKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_OrganizationMain')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_SystemRef')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_SystemRef]
    FOREIGN KEY (SystemKeyword) REFERENCES [SystemRef] (SystemKeyword)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_SystemRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_UniformRegistry')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_UniformRegistry]
    FOREIGN KEY (SystemEntityKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SystemEntity' AND [CONSTRAINT_NAME] = 'FK_SystemEntity_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[SystemEntity] WITH CHECK ADD CONSTRAINT [FK_SystemEntity_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SystemEntity] CHECK CONSTRAINT [FK_SystemEntity_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tag' AND [CONSTRAINT_NAME] = 'FK_Tag_AccessMain')
    ALTER TABLE [dbo].[Tag] WITH CHECK ADD CONSTRAINT [FK_Tag_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tag' AND [CONSTRAINT_NAME] = 'FK_Tag_AccessMain_Assign')
    ALTER TABLE [dbo].[Tag] WITH CHECK ADD CONSTRAINT [FK_Tag_AccessMain_Assign]
    FOREIGN KEY (AssignAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_AccessMain_Assign]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tag' AND [CONSTRAINT_NAME] = 'FK_Tag_UniformRegistry')
    ALTER TABLE [dbo].[Tag] WITH CHECK ADD CONSTRAINT [FK_Tag_UniformRegistry]
    FOREIGN KEY (TagKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tag' AND [CONSTRAINT_NAME] = 'FK_Tag_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Tag] WITH CHECK ADD CONSTRAINT [FK_Tag_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tag' AND [CONSTRAINT_NAME] = 'FK_Tag_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Tag] WITH CHECK ADD CONSTRAINT [FK_Tag_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Component_Column' AND [CONSTRAINT_NAME] = 'FK_TaggedPageComponentColumn_ComponentRef')
    ALTER TABLE [dbo].[Tagged_Page_Component_Column] WITH CHECK ADD CONSTRAINT [FK_TaggedPageComponentColumn_ComponentRef]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Tagged_Page_Component_Column] CHECK CONSTRAINT [FK_TaggedPageComponentColumn_ComponentRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Format_Ref' AND [CONSTRAINT_NAME] = 'FK_TaggedPageFormatRef_TaggedPageFormatTypeRef')
    ALTER TABLE [dbo].[Tagged_Page_Format_Ref] WITH CHECK ADD CONSTRAINT [FK_TaggedPageFormatRef_TaggedPageFormatTypeRef]
    FOREIGN KEY (TaggedPageFormatTypeCode) REFERENCES [Tagged_Page_Format_Type_Ref] (TaggedPageFormatTypeCode)
go
ALTER TABLE [dbo].[Tagged_Page_Format_Ref] CHECK CONSTRAINT [FK_TaggedPageFormatRef_TaggedPageFormatTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Interest_Category' AND [CONSTRAINT_NAME] = 'FK_TaggedPageInterestCategory_Content')
    ALTER TABLE [dbo].[Tagged_Page_Interest_Category] WITH CHECK ADD CONSTRAINT [FK_TaggedPageInterestCategory_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Tagged_Page_Interest_Category] CHECK CONSTRAINT [FK_TaggedPageInterestCategory_Content]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Interest_Category' AND [CONSTRAINT_NAME] = 'FK_TaggedPageInterestCategory_InterestCategory')
    ALTER TABLE [dbo].[Tagged_Page_Interest_Category] WITH CHECK ADD CONSTRAINT [FK_TaggedPageInterestCategory_InterestCategory]
    FOREIGN KEY (InterestCategoryID) REFERENCES [Interest_Category] (InterestCategoryID)
go
ALTER TABLE [dbo].[Tagged_Page_Interest_Category] CHECK CONSTRAINT [FK_TaggedPageInterestCategory_InterestCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Layout' AND [CONSTRAINT_NAME] = 'FK_TaggedPageLayout_TaggedPageFormatRef')
    ALTER TABLE [dbo].[Tagged_Page_Layout] WITH CHECK ADD CONSTRAINT [FK_TaggedPageLayout_TaggedPageFormatRef]
    FOREIGN KEY (TaggedPageFormatID) REFERENCES [Tagged_Page_Format_Ref] (TaggedPageFormatID)
go
ALTER TABLE [dbo].[Tagged_Page_Layout] CHECK CONSTRAINT [FK_TaggedPageLayout_TaggedPageFormatRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Layout' AND [CONSTRAINT_NAME] = 'FK_TaggedPageLayout_TaggedPageTitleRef')
    ALTER TABLE [dbo].[Tagged_Page_Layout] WITH CHECK ADD CONSTRAINT [FK_TaggedPageLayout_TaggedPageTitleRef]
    FOREIGN KEY (TaggedPageTitleCode) REFERENCES [Tagged_Page_Title_Ref] (TaggedPageTitleCode)
go
ALTER TABLE [dbo].[Tagged_Page_Layout] CHECK CONSTRAINT [FK_TaggedPageLayout_TaggedPageTitleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Portlet' AND [CONSTRAINT_NAME] = 'FK_TaggedPagePortlet_TaggedPageSection')
    ALTER TABLE [dbo].[Tagged_Page_Portlet] WITH CHECK ADD CONSTRAINT [FK_TaggedPagePortlet_TaggedPageSection]
    FOREIGN KEY (TaggedPageSectionID) REFERENCES [Tagged_Page_Section] (TaggedPageSectionID)
go
ALTER TABLE [dbo].[Tagged_Page_Portlet] CHECK CONSTRAINT [FK_TaggedPagePortlet_TaggedPageSection]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Portlet' AND [CONSTRAINT_NAME] = 'FK_TaggedPagePortlet_TaggedPortlet')
    ALTER TABLE [dbo].[Tagged_Page_Portlet] WITH CHECK ADD CONSTRAINT [FK_TaggedPagePortlet_TaggedPortlet]
    FOREIGN KEY (TaggedPortletID) REFERENCES [Tagged_Portlet] (TaggedPortletID)
go
ALTER TABLE [dbo].[Tagged_Page_Portlet] CHECK CONSTRAINT [FK_TaggedPagePortlet_TaggedPortlet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_PortletIC' AND [CONSTRAINT_NAME] = 'FK_TaggedPagePortletIC_InterestCategory')
    ALTER TABLE [dbo].[Tagged_Page_PortletIC] WITH CHECK ADD CONSTRAINT [FK_TaggedPagePortletIC_InterestCategory]
    FOREIGN KEY (InterestCategoryID) REFERENCES [Interest_Category] (InterestCategoryID)
go
ALTER TABLE [dbo].[Tagged_Page_PortletIC] CHECK CONSTRAINT [FK_TaggedPagePortletIC_InterestCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_PortletIC' AND [CONSTRAINT_NAME] = 'FK_TaggedPagePortletIC_TaggedPagePortlet')
    ALTER TABLE [dbo].[Tagged_Page_PortletIC] WITH CHECK ADD CONSTRAINT [FK_TaggedPagePortletIC_TaggedPagePortlet]
    FOREIGN KEY (TaggedPagePortletID) REFERENCES [Tagged_Page_Portlet] (TaggedPagePortletID)
go
ALTER TABLE [dbo].[Tagged_Page_PortletIC] CHECK CONSTRAINT [FK_TaggedPagePortletIC_TaggedPagePortlet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Section' AND [CONSTRAINT_NAME] = 'FK_TaggedPageSection_TaggedPageLayout')
    ALTER TABLE [dbo].[Tagged_Page_Section] WITH CHECK ADD CONSTRAINT [FK_TaggedPageSection_TaggedPageLayout]
    FOREIGN KEY (TaggedPageLayoutID) REFERENCES [Tagged_Page_Layout] (TaggedPageLayoutID)
go
ALTER TABLE [dbo].[Tagged_Page_Section] CHECK CONSTRAINT [FK_TaggedPageSection_TaggedPageLayout]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Page_Section' AND [CONSTRAINT_NAME] = 'FK_TaggedPageSection_TaggedSection')
    ALTER TABLE [dbo].[Tagged_Page_Section] WITH CHECK ADD CONSTRAINT [FK_TaggedPageSection_TaggedSection]
    FOREIGN KEY (TaggedSectionID) REFERENCES [Tagged_Section] (TaggedSectionID)
go
ALTER TABLE [dbo].[Tagged_Page_Section] CHECK CONSTRAINT [FK_TaggedPageSection_TaggedSection]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Portlet' AND [CONSTRAINT_NAME] = 'FK_TaggedPortlet_TaggedTemplate')
    ALTER TABLE [dbo].[Tagged_Portlet] WITH CHECK ADD CONSTRAINT [FK_TaggedPortlet_TaggedTemplate]
    FOREIGN KEY (TaggedTemplateID) REFERENCES [Tagged_Template] (TaggedTemplateID)
go
ALTER TABLE [dbo].[Tagged_Portlet] CHECK CONSTRAINT [FK_TaggedPortlet_TaggedTemplate]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Section' AND [CONSTRAINT_NAME] = 'FK_TaggedSection_TaggedPageFormatRef')
    ALTER TABLE [dbo].[Tagged_Section] WITH CHECK ADD CONSTRAINT [FK_TaggedSection_TaggedPageFormatRef]
    FOREIGN KEY (TaggedPageFormatID) REFERENCES [Tagged_Page_Format_Ref] (TaggedPageFormatID)
go
ALTER TABLE [dbo].[Tagged_Section] CHECK CONSTRAINT [FK_TaggedSection_TaggedPageFormatRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Section_Template' AND [CONSTRAINT_NAME] = 'FK_TaggedSectionTemplate_TaggedSection')
    ALTER TABLE [dbo].[Tagged_Section_Template] WITH CHECK ADD CONSTRAINT [FK_TaggedSectionTemplate_TaggedSection]
    FOREIGN KEY (TaggedSectionID) REFERENCES [Tagged_Section] (TaggedSectionID)
go
ALTER TABLE [dbo].[Tagged_Section_Template] CHECK CONSTRAINT [FK_TaggedSectionTemplate_TaggedSection]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Section_Template' AND [CONSTRAINT_NAME] = 'FK_TaggedSectionTemplate_TaggedTemplate')
    ALTER TABLE [dbo].[Tagged_Section_Template] WITH CHECK ADD CONSTRAINT [FK_TaggedSectionTemplate_TaggedTemplate]
    FOREIGN KEY (TaggedTemplateID) REFERENCES [Tagged_Template] (TaggedTemplateID)
go
ALTER TABLE [dbo].[Tagged_Section_Template] CHECK CONSTRAINT [FK_TaggedSectionTemplate_TaggedTemplate]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Template' AND [CONSTRAINT_NAME] = 'FK_TaggedTemplate_ComponentRef')
    ALTER TABLE [dbo].[Tagged_Template] WITH CHECK ADD CONSTRAINT [FK_TaggedTemplate_ComponentRef]
    FOREIGN KEY (ComponentCode) REFERENCES [Component_Ref] (ComponentCode)
go
ALTER TABLE [dbo].[Tagged_Template] CHECK CONSTRAINT [FK_TaggedTemplate_ComponentRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Tagged_Template_Field' AND [CONSTRAINT_NAME] = 'FK_TaggedTemplateField_TaggedTemplate')
    ALTER TABLE [dbo].[Tagged_Template_Field] WITH CHECK ADD CONSTRAINT [FK_TaggedTemplateField_TaggedTemplate]
    FOREIGN KEY (TaggedTemplateID) REFERENCES [Tagged_Template] (TaggedTemplateID)
go
ALTER TABLE [dbo].[Tagged_Template_Field] CHECK CONSTRAINT [FK_TaggedTemplateField_TaggedTemplate]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TagRelatedName' AND [CONSTRAINT_NAME] = 'FK_TagRelatedName_Tag')
    ALTER TABLE [dbo].[TagRelatedName] WITH CHECK ADD CONSTRAINT [FK_TagRelatedName_Tag]
    FOREIGN KEY (TagKey) REFERENCES [Tag] (TagKey)
go
ALTER TABLE [dbo].[TagRelatedName] CHECK CONSTRAINT [FK_TagRelatedName_Tag]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TagRelatedName' AND [CONSTRAINT_NAME] = 'FK_TagRelatedName_TagRelationshipTypeRef')
    ALTER TABLE [dbo].[TagRelatedName] WITH CHECK ADD CONSTRAINT [FK_TagRelatedName_TagRelationshipTypeRef]
    FOREIGN KEY (TagRelationshipTypeCode) REFERENCES [TagRelationshipTypeRef] (TagRelationshipTypeCode)
go
ALTER TABLE [dbo].[TagRelatedName] CHECK CONSTRAINT [FK_TagRelatedName_TagRelationshipTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TagRelationship' AND [CONSTRAINT_NAME] = 'FK_TagRelationship_Tag_Subject')
    ALTER TABLE [dbo].[TagRelationship] WITH CHECK ADD CONSTRAINT [FK_TagRelationship_Tag_Subject]
    FOREIGN KEY (SubjectTagKey) REFERENCES [Tag] (TagKey)
go
ALTER TABLE [dbo].[TagRelationship] CHECK CONSTRAINT [FK_TagRelationship_Tag_Subject]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TagRelationship' AND [CONSTRAINT_NAME] = 'FK_TagRelationship_Tag_Target')
    ALTER TABLE [dbo].[TagRelationship] WITH CHECK ADD CONSTRAINT [FK_TagRelationship_Tag_Target]
    FOREIGN KEY (TargetTagKey) REFERENCES [Tag] (TagKey)
go
ALTER TABLE [dbo].[TagRelationship] CHECK CONSTRAINT [FK_TagRelationship_Tag_Target]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TagRelationship' AND [CONSTRAINT_NAME] = 'FK_TagRelationship_TagRelationshipTypeRef')
    ALTER TABLE [dbo].[TagRelationship] WITH CHECK ADD CONSTRAINT [FK_TagRelationship_TagRelationshipTypeRef]
    FOREIGN KEY (TagRelationshipTypeCode) REFERENCES [TagRelationshipTypeRef] (TagRelationshipTypeCode)
go
ALTER TABLE [dbo].[TagRelationship] CHECK CONSTRAINT [FK_TagRelationship_TagRelationshipTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_AccessMain')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_TaskItemStatusRef')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_TaskItemStatusRef]
    FOREIGN KEY (TaskItemStatusCode) REFERENCES [TaskItemStatusRef] (TaskItemStatusCode)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_TaskItemStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_UniformRegistry')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_UniformRegistry]
    FOREIGN KEY (TaskItemKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_UserMain_CompletedBy')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_UserMain_CompletedBy]
    FOREIGN KEY (CompletedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_UserMain_CompletedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskItem' AND [CONSTRAINT_NAME] = 'FK_TaskItem_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaskItem] WITH CHECK ADD CONSTRAINT [FK_TaskItem_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskItem] CHECK CONSTRAINT [FK_TaskItem_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_AccessMain')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_GroupMain')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_GroupMain]
    FOREIGN KEY (AssigneeGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_TaskStatusRef')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_TaskStatusRef]
    FOREIGN KEY (TaskStatusCode) REFERENCES [TaskStatusRef] (TaskStatusCode)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_TaskStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_TaskTypeRef')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_TaskTypeRef]
    FOREIGN KEY (TaskTypeCode) REFERENCES [TaskTypeRef] (TaskTypeCode)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_TaskTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_UniformRegistry')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_UniformRegistry]
    FOREIGN KEY (TaskKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_UserMain_Assignee')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_UserMain_Assignee]
    FOREIGN KEY (AssigneeUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_UserMain_Assignee]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_UserMain_CompletedBy')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_UserMain_CompletedBy]
    FOREIGN KEY (CompletedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_UserMain_CompletedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskMain' AND [CONSTRAINT_NAME] = 'FK_TaskPriorityRef_TaskMain_PriorityCode')
    ALTER TABLE [dbo].[TaskMain] WITH CHECK ADD CONSTRAINT [FK_TaskPriorityRef_TaskMain_PriorityCode]
    FOREIGN KEY (TaskPriorityCode) REFERENCES [TaskPriorityRef] (TaskPriorityCode)
go
ALTER TABLE [dbo].[TaskMain] CHECK CONSTRAINT [FK_TaskPriorityRef_TaskMain_PriorityCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxAuthority_SystemEntity')
    ALTER TABLE [dbo].[TaxAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxAuthority_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[TaxAuthority] CHECK CONSTRAINT [FK_TaxAuthority_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxAuthority_TaxAuthorityLevelRef1')
    ALTER TABLE [dbo].[TaxAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxAuthority_TaxAuthorityLevelRef1]
    FOREIGN KEY (TaxAuthorityLevelKey) REFERENCES [TaxAuthorityLevelRef] (TaxAuthorityLevelKey)
go
ALTER TABLE [dbo].[TaxAuthority] CHECK CONSTRAINT [FK_TaxAuthority_TaxAuthorityLevelRef1]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxAuthority_UniformRegistry')
    ALTER TABLE [dbo].[TaxAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxAuthority_UniformRegistry]
    FOREIGN KEY (TaxAuthorityKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[TaxAuthority] CHECK CONSTRAINT [FK_TaxAuthority_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxAuthority_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxAuthority_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthority] CHECK CONSTRAINT [FK_TaxAuthority_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxAuthority_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxAuthority_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthority] CHECK CONSTRAINT [FK_TaxAuthority_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityCategory' AND [CONSTRAINT_NAME] = 'FK_TaxAuthCat_TaxAuthority')
    ALTER TABLE [dbo].[TaxAuthorityCategory] WITH CHECK ADD CONSTRAINT [FK_TaxAuthCat_TaxAuthority]
    FOREIGN KEY (TaxAuthorityKey) REFERENCES [TaxAuthority] (TaxAuthorityKey)
go
ALTER TABLE [dbo].[TaxAuthorityCategory] CHECK CONSTRAINT [FK_TaxAuthCat_TaxAuthority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityCategory' AND [CONSTRAINT_NAME] = 'FK_TaxAuthCat_TaxCategory')
    ALTER TABLE [dbo].[TaxAuthorityCategory] WITH CHECK ADD CONSTRAINT [FK_TaxAuthCat_TaxCategory]
    FOREIGN KEY (TaxCategoryKey) REFERENCES [TaxCategory] (TaxCategoryKey)
go
ALTER TABLE [dbo].[TaxAuthorityCategory] CHECK CONSTRAINT [FK_TaxAuthCat_TaxCategory]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityCategory' AND [CONSTRAINT_NAME] = 'FK_TaxAuthorityCategory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxAuthorityCategory] WITH CHECK ADD CONSTRAINT [FK_TaxAuthorityCategory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthorityCategory] CHECK CONSTRAINT [FK_TaxAuthorityCategory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityCategory' AND [CONSTRAINT_NAME] = 'FK_TaxAuthorityCategory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxAuthorityCategory] WITH CHECK ADD CONSTRAINT [FK_TaxAuthorityCategory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthorityCategory] CHECK CONSTRAINT [FK_TaxAuthorityCategory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityFinancialEntity' AND [CONSTRAINT_NAME] = 'FK_TaxAuthFinancialEntity_FinancialEntity')
    ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] WITH CHECK ADD CONSTRAINT [FK_TaxAuthFinancialEntity_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] CHECK CONSTRAINT [FK_TaxAuthFinancialEntity_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityFinancialEntity' AND [CONSTRAINT_NAME] = 'FK_TaxAuthFinancialEntity_GLAccount')
    ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] WITH CHECK ADD CONSTRAINT [FK_TaxAuthFinancialEntity_GLAccount]
    FOREIGN KEY (TaxLiabilityGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] CHECK CONSTRAINT [FK_TaxAuthFinancialEntity_GLAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityFinancialEntity' AND [CONSTRAINT_NAME] = 'FK_TaxAuthFinancialEntity_TaxAuthority')
    ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] WITH CHECK ADD CONSTRAINT [FK_TaxAuthFinancialEntity_TaxAuthority]
    FOREIGN KEY (TaxAuthorityKey) REFERENCES [TaxAuthority] (TaxAuthorityKey)
go
ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] CHECK CONSTRAINT [FK_TaxAuthFinancialEntity_TaxAuthority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityFinancialEntity' AND [CONSTRAINT_NAME] = 'FK_TaxAuthorityFinancialEntity_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] WITH CHECK ADD CONSTRAINT [FK_TaxAuthorityFinancialEntity_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] CHECK CONSTRAINT [FK_TaxAuthorityFinancialEntity_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxAuthorityFinancialEntity' AND [CONSTRAINT_NAME] = 'FK_TaxAuthorityFinancialEntity_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] WITH CHECK ADD CONSTRAINT [FK_TaxAuthorityFinancialEntity_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxAuthorityFinancialEntity] CHECK CONSTRAINT [FK_TaxAuthorityFinancialEntity_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxCategory' AND [CONSTRAINT_NAME] = 'FK_TaxCategory_SystemEntity')
    ALTER TABLE [dbo].[TaxCategory] WITH CHECK ADD CONSTRAINT [FK_TaxCategory_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[TaxCategory] CHECK CONSTRAINT [FK_TaxCategory_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxCategory' AND [CONSTRAINT_NAME] = 'FK_TaxCategory_UniformRegistry')
    ALTER TABLE [dbo].[TaxCategory] WITH CHECK ADD CONSTRAINT [FK_TaxCategory_UniformRegistry]
    FOREIGN KEY (TaxCategoryKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[TaxCategory] CHECK CONSTRAINT [FK_TaxCategory_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxCategory' AND [CONSTRAINT_NAME] = 'FK_TaxCategory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxCategory] WITH CHECK ADD CONSTRAINT [FK_TaxCategory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxCategory] CHECK CONSTRAINT [FK_TaxCategory_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxCategory' AND [CONSTRAINT_NAME] = 'FK_TaxCategory_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxCategory] WITH CHECK ADD CONSTRAINT [FK_TaxCategory_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxCategory] CHECK CONSTRAINT [FK_TaxCategory_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxExemptionInfo' AND [CONSTRAINT_NAME] = 'FK_TaxExemptionInfo_ContactMain')
    ALTER TABLE [dbo].[TaxExemptionInfo] WITH CHECK ADD CONSTRAINT [FK_TaxExemptionInfo_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[TaxExemptionInfo] CHECK CONSTRAINT [FK_TaxExemptionInfo_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxExemptionInfo' AND [CONSTRAINT_NAME] = 'FK_TaxExemptionInfo_TaxAuthority')
    ALTER TABLE [dbo].[TaxExemptionInfo] WITH CHECK ADD CONSTRAINT [FK_TaxExemptionInfo_TaxAuthority]
    FOREIGN KEY (ExemptTaxAuthorityKey) REFERENCES [TaxAuthority] (TaxAuthorityKey)
go
ALTER TABLE [dbo].[TaxExemptionInfo] CHECK CONSTRAINT [FK_TaxExemptionInfo_TaxAuthority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxExemptionInfo' AND [CONSTRAINT_NAME] = 'FK_TaxExemptionInfo_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxExemptionInfo] WITH CHECK ADD CONSTRAINT [FK_TaxExemptionInfo_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxExemptionInfo] CHECK CONSTRAINT [FK_TaxExemptionInfo_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxExemptionInfo' AND [CONSTRAINT_NAME] = 'FK_TaxExemptionInfo_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxExemptionInfo] WITH CHECK ADD CONSTRAINT [FK_TaxExemptionInfo_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxExemptionInfo] CHECK CONSTRAINT [FK_TaxExemptionInfo_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxSchedule' AND [CONSTRAINT_NAME] = 'FK_TaxSchedule_SystemEntity')
    ALTER TABLE [dbo].[TaxSchedule] WITH CHECK ADD CONSTRAINT [FK_TaxSchedule_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[TaxSchedule] CHECK CONSTRAINT [FK_TaxSchedule_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxSchedule' AND [CONSTRAINT_NAME] = 'FK_TaxSchedule_UniformRegistry')
    ALTER TABLE [dbo].[TaxSchedule] WITH CHECK ADD CONSTRAINT [FK_TaxSchedule_UniformRegistry]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[TaxSchedule] CHECK CONSTRAINT [FK_TaxSchedule_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxSchedule' AND [CONSTRAINT_NAME] = 'FK_TaxSchedule_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxSchedule] WITH CHECK ADD CONSTRAINT [FK_TaxSchedule_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxSchedule] CHECK CONSTRAINT [FK_TaxSchedule_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxSchedule' AND [CONSTRAINT_NAME] = 'FK_TaxSchedule_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxSchedule] WITH CHECK ADD CONSTRAINT [FK_TaxSchedule_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxSchedule] CHECK CONSTRAINT [FK_TaxSchedule_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxScheduleAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxSchedAuth_TaxAuthority')
    ALTER TABLE [dbo].[TaxScheduleAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxSchedAuth_TaxAuthority]
    FOREIGN KEY (TaxAuthorityKey) REFERENCES [TaxAuthority] (TaxAuthorityKey)
go
ALTER TABLE [dbo].[TaxScheduleAuthority] CHECK CONSTRAINT [FK_TaxSchedAuth_TaxAuthority]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxScheduleAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxSchedAuth_TaxSchedule')
    ALTER TABLE [dbo].[TaxScheduleAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxSchedAuth_TaxSchedule]
    FOREIGN KEY (TaxScheduleKey) REFERENCES [TaxSchedule] (TaxScheduleKey)
go
ALTER TABLE [dbo].[TaxScheduleAuthority] CHECK CONSTRAINT [FK_TaxSchedAuth_TaxSchedule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxScheduleAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxScheduleAuthority_UserMain_CreatedBy')
    ALTER TABLE [dbo].[TaxScheduleAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxScheduleAuthority_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxScheduleAuthority] CHECK CONSTRAINT [FK_TaxScheduleAuthority_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaxScheduleAuthority' AND [CONSTRAINT_NAME] = 'FK_TaxScheduleAuthority_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TaxScheduleAuthority] WITH CHECK ADD CONSTRAINT [FK_TaxScheduleAuthority_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaxScheduleAuthority] CHECK CONSTRAINT [FK_TaxScheduleAuthority_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TimeZoneRef' AND [CONSTRAINT_NAME] = 'FK_TimeZoneRef_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[TimeZoneRef] WITH CHECK ADD CONSTRAINT [FK_TimeZoneRef_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TimeZoneRef] CHECK CONSTRAINT [FK_TimeZoneRef_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformDistribution' AND [CONSTRAINT_NAME] = 'FK_UniformDistribution_UserMain')
    ALTER TABLE [dbo].[UniformDistribution] WITH CHECK ADD CONSTRAINT [FK_UniformDistribution_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UniformDistribution] CHECK CONSTRAINT [FK_UniformDistribution_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformItemUniformResourceRef' AND [CONSTRAINT_NAME] = 'FK_UniformItemUniformResourceRef_UniformRegistry')
    ALTER TABLE [dbo].[UniformItemUniformResourceRef] WITH CHECK ADD CONSTRAINT [FK_UniformItemUniformResourceRef_UniformRegistry]
    FOREIGN KEY (UniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[UniformItemUniformResourceRef] CHECK CONSTRAINT [FK_UniformItemUniformResourceRef_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformItemUniformResourceRef' AND [CONSTRAINT_NAME] = 'FK_UniformItemUniformResourceRef_UniformResourceRef')
    ALTER TABLE [dbo].[UniformItemUniformResourceRef] WITH CHECK ADD CONSTRAINT [FK_UniformItemUniformResourceRef_UniformResourceRef]
    FOREIGN KEY (UniformResourceKey) REFERENCES [UniformResourceRef] (UniformResourceKey)
go
ALTER TABLE [dbo].[UniformItemUniformResourceRef] CHECK CONSTRAINT [FK_UniformItemUniformResourceRef_UniformResourceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformLicense' AND [CONSTRAINT_NAME] = 'FK_UniformLicense_License')
    ALTER TABLE [dbo].[UniformLicense] WITH CHECK ADD CONSTRAINT [FK_UniformLicense_License]
    FOREIGN KEY (LicenseKey) REFERENCES [License] (LicenseKey)
go
ALTER TABLE [dbo].[UniformLicense] CHECK CONSTRAINT [FK_UniformLicense_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformLink' AND [CONSTRAINT_NAME] = 'FK_UniformLink_SystemEntity')
    ALTER TABLE [dbo].[UniformLink] WITH CHECK ADD CONSTRAINT [FK_UniformLink_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[UniformLink] CHECK CONSTRAINT [FK_UniformLink_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformLink' AND [CONSTRAINT_NAME] = 'FK_UniformLink_UniformRegistry_Subject')
    ALTER TABLE [dbo].[UniformLink] WITH CHECK ADD CONSTRAINT [FK_UniformLink_UniformRegistry_Subject]
    FOREIGN KEY (SubjectUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[UniformLink] CHECK CONSTRAINT [FK_UniformLink_UniformRegistry_Subject]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformLink' AND [CONSTRAINT_NAME] = 'FK_UniformLink_UniformRegistry_Target')
    ALTER TABLE [dbo].[UniformLink] WITH CHECK ADD CONSTRAINT [FK_UniformLink_UniformRegistry_Target]
    FOREIGN KEY (TargetUniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[UniformLink] CHECK CONSTRAINT [FK_UniformLink_UniformRegistry_Target]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformRegistry' AND [CONSTRAINT_NAME] = 'FK_UniformRegistry_ComponentRegistry')
    ALTER TABLE [dbo].[UniformRegistry] WITH CHECK ADD CONSTRAINT [FK_UniformRegistry_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[UniformRegistry] CHECK CONSTRAINT [FK_UniformRegistry_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformResourceAction' AND [CONSTRAINT_NAME] = 'FK_UniformResourceAction_UniformResourceRef')
    ALTER TABLE [dbo].[UniformResourceAction] WITH CHECK ADD CONSTRAINT [FK_UniformResourceAction_UniformResourceRef]
    FOREIGN KEY (UniformResourceKey) REFERENCES [UniformResourceRef] (UniformResourceKey)
go
ALTER TABLE [dbo].[UniformResourceAction] CHECK CONSTRAINT [FK_UniformResourceAction_UniformResourceRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformResourceAction' AND [CONSTRAINT_NAME] = 'FK_UniformResourceActionRef_ComponentRegistry')
    ALTER TABLE [dbo].[UniformResourceAction] WITH CHECK ADD CONSTRAINT [FK_UniformResourceActionRef_ComponentRegistry]
    FOREIGN KEY (ComponentKey) REFERENCES [ComponentRegistry] (ComponentKey)
go
ALTER TABLE [dbo].[UniformResourceAction] CHECK CONSTRAINT [FK_UniformResourceActionRef_ComponentRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformResourceAction' AND [CONSTRAINT_NAME] = 'FK_UniformResourceActionRef_DocumentMain')
    ALTER TABLE [dbo].[UniformResourceAction] WITH CHECK ADD CONSTRAINT [FK_UniformResourceActionRef_DocumentMain]
    FOREIGN KEY (WorkflowDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[UniformResourceAction] CHECK CONSTRAINT [FK_UniformResourceActionRef_DocumentMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformResourceAction' AND [CONSTRAINT_NAME] = 'FK_UniformResourceActionRef_ResourceActionRef')
    ALTER TABLE [dbo].[UniformResourceAction] WITH CHECK ADD CONSTRAINT [FK_UniformResourceActionRef_ResourceActionRef]
    FOREIGN KEY (ResourceActionKey) REFERENCES [ResourceActionRef] (ResourceActionKey)
go
ALTER TABLE [dbo].[UniformResourceAction] CHECK CONSTRAINT [FK_UniformResourceActionRef_ResourceActionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformResourceRef' AND [CONSTRAINT_NAME] = 'FK_UniformResourceRef_OrganizationMain')
    ALTER TABLE [dbo].[UniformResourceRef] WITH CHECK ADD CONSTRAINT [FK_UniformResourceRef_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[UniformResourceRef] CHECK CONSTRAINT [FK_UniformResourceRef_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformTag' AND [CONSTRAINT_NAME] = 'FK_UniformTag_Tag')
    ALTER TABLE [dbo].[UniformTag] WITH CHECK ADD CONSTRAINT [FK_UniformTag_Tag]
    FOREIGN KEY (TagKey) REFERENCES [Tag] (TagKey)
go
ALTER TABLE [dbo].[UniformTag] CHECK CONSTRAINT [FK_UniformTag_Tag]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformTag' AND [CONSTRAINT_NAME] = 'FK_UniformTag_UniformRegistry')
    ALTER TABLE [dbo].[UniformTag] WITH CHECK ADD CONSTRAINT [FK_UniformTag_UniformRegistry]
    FOREIGN KEY (UniformKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[UniformTag] CHECK CONSTRAINT [FK_UniformTag_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformTag' AND [CONSTRAINT_NAME] = 'FK_UniformTag_UserMain_CreatedBy')
    ALTER TABLE [dbo].[UniformTag] WITH CHECK ADD CONSTRAINT [FK_UniformTag_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UniformTag] CHECK CONSTRAINT [FK_UniformTag_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UnofferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_UnofferedCustomerExperience_CustomerExperience')
    ALTER TABLE [dbo].[UnofferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_UnofferedCustomerExperience_CustomerExperience]
    FOREIGN KEY (UnofferedCustomerExperienceKey) REFERENCES [CustomerExperience] (CustomerExperienceKey)
go
ALTER TABLE [dbo].[UnofferedCustomerExperience] CHECK CONSTRAINT [FK_UnofferedCustomerExperience_CustomerExperience]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UnofferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_UnofferedCustomerExperience_ExperienceDefinition')
    ALTER TABLE [dbo].[UnofferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_UnofferedCustomerExperience_ExperienceDefinition]
    FOREIGN KEY (ExperienceDefinitionKey) REFERENCES [ExperienceDefinition] (ExperienceDefinitionKey)
go
ALTER TABLE [dbo].[UnofferedCustomerExperience] CHECK CONSTRAINT [FK_UnofferedCustomerExperience_ExperienceDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Uom' AND [CONSTRAINT_NAME] = 'FK_Uom_SystemEntity')
    ALTER TABLE [dbo].[Uom] WITH CHECK ADD CONSTRAINT [FK_Uom_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[Uom] CHECK CONSTRAINT [FK_Uom_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Uom' AND [CONSTRAINT_NAME] = 'FK_Uom_UomGroup')
    ALTER TABLE [dbo].[Uom] WITH CHECK ADD CONSTRAINT [FK_Uom_UomGroup]
    FOREIGN KEY (UomGroupKey) REFERENCES [UomGroup] (UomGroupKey)
go
ALTER TABLE [dbo].[Uom] CHECK CONSTRAINT [FK_Uom_UomGroup]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Uom' AND [CONSTRAINT_NAME] = 'FK_Uom_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Uom] WITH CHECK ADD CONSTRAINT [FK_Uom_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Uom] CHECK CONSTRAINT [FK_Uom_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Uom' AND [CONSTRAINT_NAME] = 'FK_Uom_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Uom] WITH CHECK ADD CONSTRAINT [FK_Uom_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Uom] CHECK CONSTRAINT [FK_Uom_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UomConversion' AND [CONSTRAINT_NAME] = 'FK_UomConversion_Uom_From')
    ALTER TABLE [dbo].[UomConversion] WITH CHECK ADD CONSTRAINT [FK_UomConversion_Uom_From]
    FOREIGN KEY (FromUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[UomConversion] CHECK CONSTRAINT [FK_UomConversion_Uom_From]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UomConversion' AND [CONSTRAINT_NAME] = 'FK_UomConversion_Uom_To')
    ALTER TABLE [dbo].[UomConversion] WITH CHECK ADD CONSTRAINT [FK_UomConversion_Uom_To]
    FOREIGN KEY (ToUomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[UomConversion] CHECK CONSTRAINT [FK_UomConversion_Uom_To]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UomGroup' AND [CONSTRAINT_NAME] = 'FK_UomGroup_SystemEntity')
    ALTER TABLE [dbo].[UomGroup] WITH CHECK ADD CONSTRAINT [FK_UomGroup_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[UomGroup] CHECK CONSTRAINT [FK_UomGroup_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UomGroup' AND [CONSTRAINT_NAME] = 'FK_UomGroup_UserMain_CreatedBy')
    ALTER TABLE [dbo].[UomGroup] WITH CHECK ADD CONSTRAINT [FK_UomGroup_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UomGroup] CHECK CONSTRAINT [FK_UomGroup_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UomGroup' AND [CONSTRAINT_NAME] = 'FK_UomGroup_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[UomGroup] WITH CHECK ADD CONSTRAINT [FK_UomGroup_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UomGroup] CHECK CONSTRAINT [FK_UomGroup_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_UserDefinedCustomerExperience_CustomerExperience')
    ALTER TABLE [dbo].[UserDefinedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_UserDefinedCustomerExperience_CustomerExperience]
    FOREIGN KEY (UserDefinedCustomerExperienceKey) REFERENCES [CustomerExperience] (CustomerExperienceKey)
go
ALTER TABLE [dbo].[UserDefinedCustomerExperience] CHECK CONSTRAINT [FK_UserDefinedCustomerExperience_CustomerExperience]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_UserDefinedCustomerExperience_Program')
    ALTER TABLE [dbo].[UserDefinedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_UserDefinedCustomerExperience_Program]
    FOREIGN KEY (ProgramKey) REFERENCES [Program] (ProgramKey)
go
ALTER TABLE [dbo].[UserDefinedCustomerExperience] CHECK CONSTRAINT [FK_UserDefinedCustomerExperience_Program]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedFieldRef' AND [CONSTRAINT_NAME] = 'FK_UserDefinedField_Ref_SystemEntity')
    ALTER TABLE [dbo].[UserDefinedFieldRef] WITH CHECK ADD CONSTRAINT [FK_UserDefinedField_Ref_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[UserDefinedFieldRef] CHECK CONSTRAINT [FK_UserDefinedField_Ref_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedFieldRef' AND [CONSTRAINT_NAME] = 'FK_UserDefinedFieldRef_PropertyDefinition')
    ALTER TABLE [dbo].[UserDefinedFieldRef] WITH CHECK ADD CONSTRAINT [FK_UserDefinedFieldRef_PropertyDefinition]
    FOREIGN KEY (PropertyDefinitionKey) REFERENCES [PropertyDefinition] (PropertyDefinitionKey)
go
ALTER TABLE [dbo].[UserDefinedFieldRef] CHECK CONSTRAINT [FK_UserDefinedFieldRef_PropertyDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserMain' AND [CONSTRAINT_NAME] = 'FK_UserMain_ContactMain')
    ALTER TABLE [dbo].[UserMain] WITH CHECK ADD CONSTRAINT [FK_UserMain_ContactMain]
    FOREIGN KEY (UserKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[UserMain] CHECK CONSTRAINT [FK_UserMain_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserMain' AND [CONSTRAINT_NAME] = 'FK_UserMain_GroupMain')
    ALTER TABLE [dbo].[UserMain] WITH CHECK ADD CONSTRAINT [FK_UserMain_GroupMain]
    FOREIGN KEY (DefaultDepartmentGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[UserMain] CHECK CONSTRAINT [FK_UserMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserMain' AND [CONSTRAINT_NAME] = 'FK_UserMain_Perspective')
    ALTER TABLE [dbo].[UserMain] WITH CHECK ADD CONSTRAINT [FK_UserMain_Perspective]
    FOREIGN KEY (DefaultPerspectiveKey) REFERENCES [Perspective] (PerspectiveKey)
go
ALTER TABLE [dbo].[UserMain] CHECK CONSTRAINT [FK_UserMain_Perspective]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserMain' AND [CONSTRAINT_NAME] = 'FK_UserMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[UserMain] WITH CHECK ADD CONSTRAINT [FK_UserMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserMain] CHECK CONSTRAINT [FK_UserMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserMain' AND [CONSTRAINT_NAME] = 'FK_UserMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[UserMain] WITH CHECK ADD CONSTRAINT [FK_UserMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserMain] CHECK CONSTRAINT [FK_UserMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserRole' AND [CONSTRAINT_NAME] = 'FK_UserRole_RoleMain')
    ALTER TABLE [dbo].[UserRole] WITH CHECK ADD CONSTRAINT [FK_UserRole_RoleMain]
    FOREIGN KEY (RoleKey) REFERENCES [RoleMain] (RoleKey)
go
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_RoleMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserRole' AND [CONSTRAINT_NAME] = 'FK_UserRole_UserMain')
    ALTER TABLE [dbo].[UserRole] WITH CHECK ADD CONSTRAINT [FK_UserRole_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserToken' AND [CONSTRAINT_NAME] = 'FK_UserToken_UserMain')
    ALTER TABLE [dbo].[UserToken] WITH CHECK ADD CONSTRAINT [FK_UserToken_UserMain]
    FOREIGN KEY (UserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK_UserToken_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'VerisignGatewayAccount' AND [CONSTRAINT_NAME] = 'FK_VerisignGatewayAccount_GatewayAccount')
    ALTER TABLE [dbo].[VerisignGatewayAccount] WITH CHECK ADD CONSTRAINT [FK_VerisignGatewayAccount_GatewayAccount]
    FOREIGN KEY (GatewayAccountKey) REFERENCES [GatewayAccount] (GatewayAccountKey)
go
ALTER TABLE [dbo].[VerisignGatewayAccount] CHECK CONSTRAINT [FK_VerisignGatewayAccount_GatewayAccount]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_AccessMain')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_FullAddress')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_FullAddress]
    FOREIGN KEY (FullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_FullAddress]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_OrganizationMain')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_ShipOrigin')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_ShipOrigin]
    FOREIGN KEY (ShipOriginKey) REFERENCES [ShipOrigin] (ShipOriginKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_ShipOrigin]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_ShipZone')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_ShipZone]
    FOREIGN KEY (ShipZoneKey) REFERENCES [ShipZone] (ShipZoneKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_ShipZone]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_SystemEntity')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_UniformRegistry')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_UniformRegistry]
    FOREIGN KEY (WarehouseKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_UserMain_CreatedBy')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_WarehouseStatusRef')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_WarehouseStatusRef]
    FOREIGN KEY (WarehouseStatusCode) REFERENCES [WarehouseStatusRef] (WarehouseStatusCode)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_WarehouseStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Warehouse' AND [CONSTRAINT_NAME] = 'FK_Warehouse_WarehouseTypeRef')
    ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [FK_Warehouse_WarehouseTypeRef]
    FOREIGN KEY (WarehouseTypeCode) REFERENCES [WarehouseTypeRef] (WarehouseTypeCode)
go
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_WarehouseTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrier' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrier_ShipCarrier')
    ALTER TABLE [dbo].[WarehouseCarrier] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrier_ShipCarrier]
    FOREIGN KEY (ShipCarrierKey) REFERENCES [ShipCarrier] (ShipCarrierKey)
go
ALTER TABLE [dbo].[WarehouseCarrier] CHECK CONSTRAINT [FK_WarehouseCarrier_ShipCarrier]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrier' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrier_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WarehouseCarrier] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrier_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WarehouseCarrier] CHECK CONSTRAINT [FK_WarehouseCarrier_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrier' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrier_Warehouse')
    ALTER TABLE [dbo].[WarehouseCarrier] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrier_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[WarehouseCarrier] CHECK CONSTRAINT [FK_WarehouseCarrier_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrierService' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrierService_ShipMethod')
    ALTER TABLE [dbo].[WarehouseCarrierService] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrierService_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[WarehouseCarrierService] CHECK CONSTRAINT [FK_WarehouseCarrierService_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrierService' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrierService_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WarehouseCarrierService] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrierService_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WarehouseCarrierService] CHECK CONSTRAINT [FK_WarehouseCarrierService_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrierService' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrierService_WarehouseCarrier')
    ALTER TABLE [dbo].[WarehouseCarrierService] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrierService_WarehouseCarrier]
    FOREIGN KEY (ShipCarrierKey, WarehouseKey) REFERENCES [WarehouseCarrier] (ShipCarrierKey, WarehouseKey)
go
ALTER TABLE [dbo].[WarehouseCarrierService] CHECK CONSTRAINT [FK_WarehouseCarrierService_WarehouseCarrier]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Website' AND [CONSTRAINT_NAME] = 'FK_Website_ScreenResolutionRef')
    ALTER TABLE [dbo].[Website] WITH CHECK ADD CONSTRAINT [FK_Website_ScreenResolutionRef]
    FOREIGN KEY (ScreenResolutionCode) REFERENCES [ScreenResolutionRef] (ScreenResolutionCode)
go
ALTER TABLE [dbo].[Website] CHECK CONSTRAINT [FK_Website_ScreenResolutionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Website_Content_Authority' AND [CONSTRAINT_NAME] = 'FK_Website_Content_Authority_Content_Authority_Group')
    ALTER TABLE [dbo].[Website_Content_Authority] WITH CHECK ADD CONSTRAINT [FK_Website_Content_Authority_Content_Authority_Group]
    FOREIGN KEY (ContentAuthorityGroupID) REFERENCES [Content_Authority_Group] (ContentAuthorityGroupID)
go
ALTER TABLE [dbo].[Website_Content_Authority] CHECK CONSTRAINT [FK_Website_Content_Authority_Content_Authority_Group]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Website_Security_Group' AND [CONSTRAINT_NAME] = 'FK_Website_Security_Group_Website')
    ALTER TABLE [dbo].[Website_Security_Group] WITH CHECK ADD CONSTRAINT [FK_Website_Security_Group_Website]
    FOREIGN KEY (WebsiteKey) REFERENCES [Website] (WebsiteKey)
go
ALTER TABLE [dbo].[Website_Security_Group] CHECK CONSTRAINT [FK_Website_Security_Group_Website]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowInstance' AND [CONSTRAINT_NAME] = 'FK_WorkflowInstance_UserMain_InitiatedBy')
    ALTER TABLE [dbo].[WorkflowInstance] WITH CHECK ADD CONSTRAINT [FK_WorkflowInstance_UserMain_InitiatedBy]
    FOREIGN KEY (InitiatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkflowInstance] CHECK CONSTRAINT [FK_WorkflowInstance_UserMain_InitiatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowInstance' AND [CONSTRAINT_NAME] = 'FK_WorkflowInstance_UserMain_LockedBy')
    ALTER TABLE [dbo].[WorkflowInstance] WITH CHECK ADD CONSTRAINT [FK_WorkflowInstance_UserMain_LockedBy]
    FOREIGN KEY (LockedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkflowInstance] CHECK CONSTRAINT [FK_WorkflowInstance_UserMain_LockedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowQueue' AND [CONSTRAINT_NAME] = 'FK_WorkflowQueue_AccessMain')
    ALTER TABLE [dbo].[WorkflowQueue] WITH CHECK ADD CONSTRAINT [FK_WorkflowQueue_AccessMain]
    FOREIGN KEY (TaskItemAccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[WorkflowQueue] CHECK CONSTRAINT [FK_WorkflowQueue_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowQueue' AND [CONSTRAINT_NAME] = 'FK_WorkflowQueue_TaskItem')
    ALTER TABLE [dbo].[WorkflowQueue] WITH CHECK ADD CONSTRAINT [FK_WorkflowQueue_TaskItem]
    FOREIGN KEY (TaskItemKey) REFERENCES [TaskItem] (TaskItemKey)
go
ALTER TABLE [dbo].[WorkflowQueue] CHECK CONSTRAINT [FK_WorkflowQueue_TaskItem]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowQueue' AND [CONSTRAINT_NAME] = 'FK_WorkflowQueue_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WorkflowQueue] WITH CHECK ADD CONSTRAINT [FK_WorkflowQueue_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkflowQueue] CHECK CONSTRAINT [FK_WorkflowQueue_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowQueue' AND [CONSTRAINT_NAME] = 'FK_WorkflowQueue_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[WorkflowQueue] WITH CHECK ADD CONSTRAINT [FK_WorkflowQueue_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkflowQueue] CHECK CONSTRAINT [FK_WorkflowQueue_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowService' AND [CONSTRAINT_NAME] = 'FK_WorkflowStatus_ServiceStatusRef')
    ALTER TABLE [dbo].[WorkflowService] WITH CHECK ADD CONSTRAINT [FK_WorkflowStatus_ServiceStatusRef]
    FOREIGN KEY (WorkFlowServiceStatusCode) REFERENCES [ServiceStatusRef] (ServiceStatusCode)
go
ALTER TABLE [dbo].[WorkflowService] CHECK CONSTRAINT [FK_WorkflowStatus_ServiceStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowServiceWorker' AND [CONSTRAINT_NAME] = 'FK_WorkflowServiceWorker_WorkflowInstance')
    ALTER TABLE [dbo].[WorkflowServiceWorker] WITH CHECK ADD CONSTRAINT [FK_WorkflowServiceWorker_WorkflowInstance]
    FOREIGN KEY (WorkflowInstanceKey) REFERENCES [WorkflowInstance] (WorkflowInstanceKey)
go
ALTER TABLE [dbo].[WorkflowServiceWorker] CHECK CONSTRAINT [FK_WorkflowServiceWorker_WorkflowInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowServiceWorker' AND [CONSTRAINT_NAME] = 'FK_WorkflowServiceWorker_WorkflowService')
    ALTER TABLE [dbo].[WorkflowServiceWorker] WITH CHECK ADD CONSTRAINT [FK_WorkflowServiceWorker_WorkflowService]
    FOREIGN KEY (WorkflowServiceKey) REFERENCES [WorkflowService] (WorkflowServiceKey)
go
ALTER TABLE [dbo].[WorkflowServiceWorker] CHECK CONSTRAINT [FK_WorkflowServiceWorker_WorkflowService]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkflowServiceWorker' AND [CONSTRAINT_NAME] = 'FK_WorkflowServiceWorker_WorkItemQueue')
    ALTER TABLE [dbo].[WorkflowServiceWorker] WITH CHECK ADD CONSTRAINT [FK_WorkflowServiceWorker_WorkItemQueue]
    FOREIGN KEY (WorkItemQueueKey) REFERENCES [WorkItemQueue] (WorkItemQueueKey)
go
ALTER TABLE [dbo].[WorkflowServiceWorker] CHECK CONSTRAINT [FK_WorkflowServiceWorker_WorkItemQueue]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_DeferralTerms')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_DeferralTerms]
    FOREIGN KEY (DeferralTermsKey) REFERENCES [DeferralTerms] (DeferralTermsKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_DeferralTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_FinancialEntity')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_GLAccount_AR')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_AR]
    FOREIGN KEY (ARGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_AR]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_GLAccount_DeferredIncome')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_DeferredIncome]
    FOREIGN KEY (DeferredIncomeGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_DeferredIncome]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_GLAccount_Income')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_Income]
    FOREIGN KEY (IncomeGLAccountKey) REFERENCES [GLAccount] (GLAccountKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_GLAccount_Income]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_ShipMethod')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_Warehouse')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_WorkInvoiceLine')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_WorkInvoiceLine]
    FOREIGN KEY (WorkInvoiceLineKey) REFERENCES [WorkInvoiceLine] (WorkInvoiceLineKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_WorkInvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceDistribution' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceDistribution_WorkInvoiceMain')
    ALTER TABLE [dbo].[WorkInvoiceDistribution] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceDistribution_WorkInvoiceMain]
    FOREIGN KEY (WorkInvoiceKey) REFERENCES [WorkInvoiceMain] (WorkInvoiceKey)
go
ALTER TABLE [dbo].[WorkInvoiceDistribution] CHECK CONSTRAINT [FK_WorkInvoiceDistribution_WorkInvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_ContactMain_ShipTo')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_ContactMain_ShipTo]
    FOREIGN KEY (ShipToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_ContactMain_ShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_FullAddress_ShipTo')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_FullAddress_ShipTo]
    FOREIGN KEY (ShipToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_FullAddress_ShipTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_GroupMain')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_PriceSheet')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_ProductMain')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_ShipMethod')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_ShipMethod]
    FOREIGN KEY (ShipMethodKey) REFERENCES [ShipMethod] (ShipMethodKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_ShipMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_SourceCode')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_WorkInvoiceLine_Parent')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_WorkInvoiceLine_Parent]
    FOREIGN KEY (ParentWorkInvoiceLineKey) REFERENCES [WorkInvoiceLine] (WorkInvoiceLineKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_WorkInvoiceLine_Parent]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceLine' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceLine_WorkInvoiceMain')
    ALTER TABLE [dbo].[WorkInvoiceLine] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceLine_WorkInvoiceMain]
    FOREIGN KEY (WorkInvoiceKey) REFERENCES [WorkInvoiceMain] (WorkInvoiceKey)
go
ALTER TABLE [dbo].[WorkInvoiceLine] CHECK CONSTRAINT [FK_WorkInvoiceLine_WorkInvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_AccessMain')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_AccountingMethodRef')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_AccountingMethodRef]
    FOREIGN KEY (AccountingMethodCode) REFERENCES [AccountingMethodRef] (AccountingMethodCode)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_AccountingMethodRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_BatchInstance')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_CommissionPlan')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_ContactMain_BillTo')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_ContactMain_SoldTo')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_ContactMain_SoldTo]
    FOREIGN KEY (SoldToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_ContactMain_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_Currency')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_FinancialEntity')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_GroupMain_Owner')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_GroupMain_SalesTeam')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_GroupMain_SalesTeam]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_GroupMain_SalesTeam]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_PaymentTerms')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_PriceSheet')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_SystemEntity')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_UniformRegistry')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_UniformRegistry]
    FOREIGN KEY (WorkInvoiceKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkInvoiceMain' AND [CONSTRAINT_NAME] = 'FK_WorkInvoiceMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[WorkInvoiceMain] WITH CHECK ADD CONSTRAINT [FK_WorkInvoiceMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkInvoiceMain] CHECK CONSTRAINT [FK_WorkInvoiceMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkItem' AND [CONSTRAINT_NAME] = 'FK_WorkItem_DocumentMain_ProcessEngine')
    ALTER TABLE [dbo].[WorkItem] WITH CHECK ADD CONSTRAINT [FK_WorkItem_DocumentMain_ProcessEngine]
    FOREIGN KEY (ProcessEngineKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[WorkItem] CHECK CONSTRAINT [FK_WorkItem_DocumentMain_ProcessEngine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkItem' AND [CONSTRAINT_NAME] = 'FK_WorkItem_DocumentMain_WorkflowDefinition')
    ALTER TABLE [dbo].[WorkItem] WITH CHECK ADD CONSTRAINT [FK_WorkItem_DocumentMain_WorkflowDefinition]
    FOREIGN KEY (WorkflowDefinitionKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[WorkItem] CHECK CONSTRAINT [FK_WorkItem_DocumentMain_WorkflowDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkItemQueue' AND [CONSTRAINT_NAME] = 'FK_WorkItemQueue_WorkflowInstance')
    ALTER TABLE [dbo].[WorkItemQueue] WITH CHECK ADD CONSTRAINT [FK_WorkItemQueue_WorkflowInstance]
    FOREIGN KEY (WorkflowInstanceKey) REFERENCES [WorkflowInstance] (WorkflowInstanceKey)
go
ALTER TABLE [dbo].[WorkItemQueue] CHECK CONSTRAINT [FK_WorkItemQueue_WorkflowInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_BatchInstance')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_InvoiceDistribution')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_InvoiceDistribution]
    FOREIGN KEY (InvoiceDistributionKey) REFERENCES [InvoiceDistribution] (InvoiceDistributionKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_InvoiceDistribution]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_InvoiceLine')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_InvoiceLine]
    FOREIGN KEY (InvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_InvoiceLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_InvoiceLine_Src')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_InvoiceLine_Src]
    FOREIGN KEY (SrcInvoiceLineKey) REFERENCES [InvoiceLine] (InvoiceLineKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_InvoiceLine_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_InvoiceMain')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_InvoiceMain]
    FOREIGN KEY (InvoiceKey) REFERENCES [InvoiceMain] (InvoiceKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_InvoiceMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_PaymentMain_Src')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_PaymentMain_Src]
    FOREIGN KEY (SrcPaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_PaymentMain_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_PaymentScheduleLine')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_PaymentScheduleLine]
    FOREIGN KEY (PaymentScheduleLineKey) REFERENCES [PaymentScheduleLine] (PaymentScheduleLineKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_PaymentScheduleLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_WorkInvoiceLine_Src')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_WorkInvoiceLine_Src]
    FOREIGN KEY (SrcWorkInvoiceLineKey) REFERENCES [WorkInvoiceLine] (WorkInvoiceLineKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_WorkInvoiceLine_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkMonetaryApplication' AND [CONSTRAINT_NAME] = 'FK_WorkMonetaryApplication_WorkPayment_Src')
    ALTER TABLE [dbo].[WorkMonetaryApplication] WITH CHECK ADD CONSTRAINT [FK_WorkMonetaryApplication_WorkPayment_Src]
    FOREIGN KEY (SrcWorkPaymentKey) REFERENCES [WorkPayment] (WorkPaymentKey)
go
ALTER TABLE [dbo].[WorkMonetaryApplication] CHECK CONSTRAINT [FK_WorkMonetaryApplication_WorkPayment_Src]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_AccessMain')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_BatchInstance')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_CommissionPlan')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_CommissionPlan]
    FOREIGN KEY (CommissionPlanKey) REFERENCES [CommissionPlan] (CommissionPlanKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_CommissionPlan]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_ContactMain_BillTo')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_ContactMain_BillTo]
    FOREIGN KEY (BillToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_ContactMain_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_ContactMain_SoldTo')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_ContactMain_SoldTo]
    FOREIGN KEY (SoldToContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_ContactMain_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_Currency')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_FinancialEntity')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_FullAddress_BillTo')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_FullAddress_BillTo]
    FOREIGN KEY (BillToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_FullAddress_BillTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_FullAddress_SoldTo')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_FullAddress_SoldTo]
    FOREIGN KEY (SoldToFullAddressKey) REFERENCES [FullAddress] (FullAddressKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_FullAddress_SoldTo]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_GroupMain')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_GroupMain]
    FOREIGN KEY (SalesTeamGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_GroupMain_Owner')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_HoldCode')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_HoldCode]
    FOREIGN KEY (HoldCodeKey) REFERENCES [HoldCode] (HoldCodeKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_HoldCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_Locale')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_Locale]
    FOREIGN KEY (CultureCode) REFERENCES [CultureRef] (CultureCode)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_Locale]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_OrderStateRef')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_OrderStateRef]
    FOREIGN KEY (OrderStateCode) REFERENCES [OrderStateRef] (OrderStateCode)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_OrderStateRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_OrderType')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_OrderType]
    FOREIGN KEY (OrderTypeKey) REFERENCES [OrderType] (OrderTypeKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_OrderType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_PaymentTerms')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_PriceSheet')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_PriceSheet]
    FOREIGN KEY (PriceSheetKey) REFERENCES [PriceSheet] (PriceSheetKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_PriceSheet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_ReasonCode')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_ReasonCode]
    FOREIGN KEY (ReasonCodeKey) REFERENCES [ReasonCode] (ReasonCodeKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_ReasonCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_ResponseMediaRef')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_ResponseMediaRef]
    FOREIGN KEY (ResponseMediaCode) REFERENCES [ResponseMediaRef] (ResponseMediaCode)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_ResponseMediaRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_SalesLocation')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_SalesLocation]
    FOREIGN KEY (SalesLocationKey) REFERENCES [SalesLocation] (SalesLocationKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_SalesLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_SystemEntity')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_UniformRegistry')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_UniformRegistry]
    FOREIGN KEY (WorkOrderKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_Warehouse_Default')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_Warehouse_Default]
    FOREIGN KEY (DefaultWarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_Warehouse_Default]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_AccessMain')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_BatchInstance')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_BatchInstance_Originating')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_ContactMain_Payor')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_ContactMain_Payor]
    FOREIGN KEY (PayorContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_ContactMain_Payor]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_Currency')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_Currency]
    FOREIGN KEY (CurrencyCode) REFERENCES [Currency] (CurrencyCode)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_Currency]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_FinancialEntity')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_FinancialEntity]
    FOREIGN KEY (FinancialEntityKey) REFERENCES [FinancialEntity] (FinancialEntityKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_FinancialEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_GroupMain_Owner')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_PaymentApplicationRestrictionRef')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_PaymentApplicationRestrictionRef]
    FOREIGN KEY (PaymentApplicationRestrictionCode) REFERENCES [PaymentApplicationRestrictionRef] (PaymentApplicationRestrictionCode)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_PaymentApplicationRestrictionRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_PaymentDetail')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_PaymentDetail]
    FOREIGN KEY (PaymentDetailKey) REFERENCES [PaymentDetail] (PaymentDetailKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_PaymentDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_PaymentMethod')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_PaymentMethod]
    FOREIGN KEY (PaymentMethodKey) REFERENCES [PaymentMethod] (PaymentMethodKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_PaymentMethod]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_SystemEntity')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_UniformRegistry')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_UniformRegistry]
    FOREIGN KEY (WorkPaymentKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkPayment' AND [CONSTRAINT_NAME] = 'FK_WorkPayment_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[WorkPayment] WITH CHECK ADD CONSTRAINT [FK_WorkPayment_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkPayment] CHECK CONSTRAINT [FK_WorkPayment_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_InventoryLocation')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_InventoryLocation]
    FOREIGN KEY (InventoryLocationKey) REFERENCES [InventoryLocation] (LocationKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_InventoryLocation]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_InventoryLocationTarget')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_InventoryLocationTarget]
    FOREIGN KEY (TargetLocationKey) REFERENCES [InventoryLocation] (LocationKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_InventoryLocationTarget]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_OrderLine')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_OrderLine]
    FOREIGN KEY (OrderLineKey) REFERENCES [OrderLine] (OrderLineKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_OrderLine]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_ProductMain')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_ProductMain]
    FOREIGN KEY (ProductKey) REFERENCES [ProductMain] (ProductKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_ProductMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_ReasonCode')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_ReasonCode]
    FOREIGN KEY (ReasonCodeKey) REFERENCES [ReasonCode] (ReasonCodeKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_ReasonCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_TransactionTypeRef')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_TransactionTypeRef]
    FOREIGN KEY (TransactionTypeCode) REFERENCES [TransactionTypeRef] (TransactionTypeCode)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_TransactionTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_Uom')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_Uom]
    FOREIGN KEY (UomKey) REFERENCES [Uom] (UomKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_Uom]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_Warehouse')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_Warehouse]
    FOREIGN KEY (WarehouseKey) REFERENCES [Warehouse] (WarehouseKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_Warehouse]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionLine' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionLine_WorkTransactionMain')
    ALTER TABLE [dbo].[WorkTransactionLine] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionLine_WorkTransactionMain]
    FOREIGN KEY (WorkTransactionKey) REFERENCES [WorkTransactionMain] (WorkTransactionKey)
go
ALTER TABLE [dbo].[WorkTransactionLine] CHECK CONSTRAINT [FK_WorkTransactionLine_WorkTransactionMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_BatchInstance')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_BatchInstance]
    FOREIGN KEY (BatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_BatchInstance]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_BatchInstance_Originating')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_BatchInstance_Originating]
    FOREIGN KEY (OriginatingBatchKey) REFERENCES [BatchInstance] (BatchKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_BatchInstance_Originating]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_GroupMain_Owner')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_GroupMain_Owner]
    FOREIGN KEY (OwnerGroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_GroupMain_Owner]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_OrderMain')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_OrderMain]
    FOREIGN KEY (OrderKey) REFERENCES [OrderMain] (OrderKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_OrderMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_SystemEntity')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_SystemEntity]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_SystemEntity]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkTransactionMain' AND [CONSTRAINT_NAME] = 'FK_WorkTransactionMain_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[WorkTransactionMain] WITH CHECK ADD CONSTRAINT [FK_WorkTransactionMain_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WorkTransactionMain] CHECK CONSTRAINT [FK_WorkTransactionMain_UserMain_UpdatedBy]
go

