
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AutoPayInstruction' AND [CONSTRAINT_NAME] = 'FK_AutoPayInstruction_PaymentTerms')
    ALTER TABLE [dbo].[AutoPayInstruction] WITH CHECK ADD CONSTRAINT [FK_AutoPayInstruction_PaymentTerms]
    FOREIGN KEY (PaymentTermsKey) REFERENCES [PaymentTerms] (PaymentTermsKey)
go
ALTER TABLE [dbo].[AutoPayInstruction] CHECK CONSTRAINT [FK_AutoPayInstruction_PaymentTerms]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AutoPayInstruction' AND [CONSTRAINT_NAME] = 'FK_AutoPayInstruction_UserMain')
    ALTER TABLE [dbo].[AutoPayInstruction] WITH CHECK ADD CONSTRAINT [FK_AutoPayInstruction_UserMain]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AutoPayInstruction] CHECK CONSTRAINT [FK_AutoPayInstruction_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AutoPayInstruction' AND [CONSTRAINT_NAME] = 'FK_AutoPayInstruction_UserMain2')
    ALTER TABLE [dbo].[AutoPayInstruction] WITH CHECK ADD CONSTRAINT [FK_AutoPayInstruction_UserMain2]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[AutoPayInstruction] CHECK CONSTRAINT [FK_AutoPayInstruction_UserMain2]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AutoPayInstruction' AND [CONSTRAINT_NAME] = 'FK_AutoPayInstrution_IntervalTypeRef')
    ALTER TABLE [dbo].[AutoPayInstruction] WITH CHECK ADD CONSTRAINT [FK_AutoPayInstrution_IntervalTypeRef]
    FOREIGN KEY (IntervalTypeCode) REFERENCES [IntervalTypeRef] (IntervalTypeCode)
go
ALTER TABLE [dbo].[AutoPayInstruction] CHECK CONSTRAINT [FK_AutoPayInstrution_IntervalTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'AutoPayInstruction' AND [CONSTRAINT_NAME] = 'FK_AutoPayInstrution_Product')
    ALTER TABLE [dbo].[AutoPayInstruction] WITH CHECK ADD CONSTRAINT [FK_AutoPayInstrution_Product]
    FOREIGN KEY (ProductCode) REFERENCES [Product] (PRODUCT_CODE)
go
ALTER TABLE [dbo].[AutoPayInstruction] CHECK CONSTRAINT [FK_AutoPayInstrution_Product]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_ExperienceUnit')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_ExperienceUnit]
    FOREIGN KEY (ExperienceUnitKey) REFERENCES [ExperienceUnit] (ExperienceUnitKey)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_ExperienceUnit]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgram' AND [CONSTRAINT_NAME] = 'FK_CertificationProgram_ProgramStatusRef')
    ALTER TABLE [dbo].[CertificationProgram] WITH CHECK ADD CONSTRAINT [FK_CertificationProgram_ProgramStatusRef]
    FOREIGN KEY (CertificationProgramStatusCode) REFERENCES [ProgramStatusRef] (ProgramStatusCode)
go
ALTER TABLE [dbo].[CertificationProgram] CHECK CONSTRAINT [FK_CertificationProgram_ProgramStatusRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_ContactMain')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CertificationProgramRegistration' AND [CONSTRAINT_NAME] = 'FK_CertificationProgramRegistration_RegistrationStatusRef')
    ALTER TABLE [dbo].[CertificationProgramRegistration] WITH CHECK ADD CONSTRAINT [FK_CertificationProgramRegistration_RegistrationStatusRef]
    FOREIGN KEY (RegistrationStatusCode) REFERENCES [RegistrationStatusRef] (RegistrationStatusCode)
go
ALTER TABLE [dbo].[CertificationProgramRegistration] CHECK CONSTRAINT [FK_CertificationProgramRegistration_RegistrationStatusRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLog' AND [CONSTRAINT_NAME] = 'FK_CommunicationLog_CommunicationLogStatusRef')
    ALTER TABLE [dbo].[CommunicationLog] WITH CHECK ADD CONSTRAINT [FK_CommunicationLog_CommunicationLogStatusRef]
    FOREIGN KEY (CommunicationLogStatusCode) REFERENCES [CommunicationLogStatusRef] (CommunicationLogStatusCode)
go
ALTER TABLE [dbo].[CommunicationLog] CHECK CONSTRAINT [FK_CommunicationLog_CommunicationLogStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLog' AND [CONSTRAINT_NAME] = 'FK_CommunicationLog_CommunicationReasonRef')
    ALTER TABLE [dbo].[CommunicationLog] WITH CHECK ADD CONSTRAINT [FK_CommunicationLog_CommunicationReasonRef]
    FOREIGN KEY (CommunicationReasonKey) REFERENCES [CommunicationReasonRef] (CommunicationReasonKey)
go
ALTER TABLE [dbo].[CommunicationLog] CHECK CONSTRAINT [FK_CommunicationLog_CommunicationReasonRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLog' AND [CONSTRAINT_NAME] = 'FK_CommunicationLog_CreatedByUserMain')
    ALTER TABLE [dbo].[CommunicationLog] WITH CHECK ADD CONSTRAINT [FK_CommunicationLog_CreatedByUserMain]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommunicationLog] CHECK CONSTRAINT [FK_CommunicationLog_CreatedByUserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLog' AND [CONSTRAINT_NAME] = 'FK_CommunicationLog_SourceCode')
    ALTER TABLE [dbo].[CommunicationLog] WITH CHECK ADD CONSTRAINT [FK_CommunicationLog_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[CommunicationLog] CHECK CONSTRAINT [FK_CommunicationLog_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogEvent' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogEvent_CommunicationLogEventTypeRef')
    ALTER TABLE [dbo].[CommunicationLogEvent] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogEvent_CommunicationLogEventTypeRef]
    FOREIGN KEY (CommunicationLogEventTypeCode) REFERENCES [CommunicationLogEventTypeRef] (CommunicationLogEventTypeCode)
go
ALTER TABLE [dbo].[CommunicationLogEvent] CHECK CONSTRAINT [FK_CommunicationLogEvent_CommunicationLogEventTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogEvent' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogEvent_CommunicationLogRecipient')
    ALTER TABLE [dbo].[CommunicationLogEvent] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogEvent_CommunicationLogRecipient]
    FOREIGN KEY (CommunicationLogRecipientKey) REFERENCES [CommunicationLogRecipient] (CommunicationLogRecipientKey)
go
ALTER TABLE [dbo].[CommunicationLogEvent] CHECK CONSTRAINT [FK_CommunicationLogEvent_CommunicationLogRecipient]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogEvent' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogEvent_CreatedByUserMain')
    ALTER TABLE [dbo].[CommunicationLogEvent] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogEvent_CreatedByUserMain]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommunicationLogEvent] CHECK CONSTRAINT [FK_CommunicationLogEvent_CreatedByUserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_CommunicationLog')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_CommunicationLog]
    FOREIGN KEY (CommunicationLogKey) REFERENCES [CommunicationLog] (CommunicationLogKey)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_CommunicationLog]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_CommunicationMessageTypeRef')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_CommunicationMessageTypeRef]
    FOREIGN KEY (MessageType) REFERENCES [CommunicationMessageTypeRef] (CommunicationMessageTypeCode)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_CommunicationMessageTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_ContactMain')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_CrearedByUserMain')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_CrearedByUserMain]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_CrearedByUserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_LastCommunicationLogEventTypeRef')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_LastCommunicationLogEventTypeRef]
    FOREIGN KEY (LastCommunicationLogEventTypeCode) REFERENCES [CommunicationLogEventTypeRef] (CommunicationLogEventTypeCode)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_LastCommunicationLogEventTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CommunicationLogRecipient' AND [CONSTRAINT_NAME] = 'FK_CommunicationLogRecipient_UpdatedByUserMain')
    ALTER TABLE [dbo].[CommunicationLogRecipient] WITH CHECK ADD CONSTRAINT [FK_CommunicationLogRecipient_UpdatedByUserMain]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CommunicationLogRecipient] CHECK CONSTRAINT [FK_CommunicationLogRecipient_UpdatedByUserMain]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommunicationReasonPreferences' AND [CONSTRAINT_NAME] = 'FK_ContactCommunicationReasonPreferences_CreatedBy')
    ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] WITH CHECK ADD CONSTRAINT [FK_ContactCommunicationReasonPreferences_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] CHECK CONSTRAINT [FK_ContactCommunicationReasonPreferences_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactCommunicationReasonPreferences' AND [CONSTRAINT_NAME] = 'FK_ContactCommunicationReasonPreferences_UpdatedBy')
    ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] WITH CHECK ADD CONSTRAINT [FK_ContactCommunicationReasonPreferences_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ContactCommunicationReasonPreferences] CHECK CONSTRAINT [FK_ContactCommunicationReasonPreferences_UpdatedBy]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSocialNetwork' AND [CONSTRAINT_NAME] = 'FK_ContactSocialNetwork_ContactMain')
    ALTER TABLE [dbo].[ContactSocialNetwork] WITH CHECK ADD CONSTRAINT [FK_ContactSocialNetwork_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[ContactSocialNetwork] CHECK CONSTRAINT [FK_ContactSocialNetwork_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ContactSocialNetwork' AND [CONSTRAINT_NAME] = 'FK_ContactSocialNetwork_SocialNetworkRef')
    ALTER TABLE [dbo].[ContactSocialNetwork] WITH CHECK ADD CONSTRAINT [FK_ContactSocialNetwork_SocialNetworkRef]
    FOREIGN KEY (SocialNetworkKey) REFERENCES [SocialNetworkRef] (SocialNetworkKey)
go
ALTER TABLE [dbo].[ContactSocialNetwork] CHECK CONSTRAINT [FK_ContactSocialNetwork_SocialNetworkRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_ContactMain')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_ContactMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_CustomerExperienceStatusRef')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_CustomerExperienceStatusRef]
    FOREIGN KEY (CustomerExperienceStatusCode) REFERENCES [CustomerExperienceStatusRef] (CustomerExperienceStatusCode)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_CustomerExperienceStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperience' AND [CONSTRAINT_NAME] = 'FK_CustomerExperience_UserMain_CreatedBy')
    ALTER TABLE [dbo].[CustomerExperience] WITH CHECK ADD CONSTRAINT [FK_CustomerExperience_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[CustomerExperience] CHECK CONSTRAINT [FK_CustomerExperience_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'CustomerExperienceStatusChange' AND [CONSTRAINT_NAME] = 'FK_CustomerExperienceStatusChange_ContactMain_StatusChanged')
    ALTER TABLE [dbo].[CustomerExperienceStatusChange] WITH CHECK ADD CONSTRAINT [FK_CustomerExperienceStatusChange_ContactMain_StatusChanged]
    FOREIGN KEY (StatusChangedContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[CustomerExperienceStatusChange] CHECK CONSTRAINT [FK_CustomerExperienceStatusChange_ContactMain_StatusChanged]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultAttempt' AND [CONSTRAINT_NAME] = 'FK_DataVaultAttempt_DataVaultAttemptStatusRef')
    ALTER TABLE [dbo].[DataVaultAttempt] WITH CHECK ADD CONSTRAINT [FK_DataVaultAttempt_DataVaultAttemptStatusRef]
    FOREIGN KEY (Status) REFERENCES [DataVaultAttemptStatusRef] (DataVaultAttemptStatusCode)
go
ALTER TABLE [dbo].[DataVaultAttempt] CHECK CONSTRAINT [FK_DataVaultAttempt_DataVaultAttemptStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultAttempt' AND [CONSTRAINT_NAME] = 'FK_DataVaultAttempt_DataVaultLog')
    ALTER TABLE [dbo].[DataVaultAttempt] WITH CHECK ADD CONSTRAINT [FK_DataVaultAttempt_DataVaultLog]
    FOREIGN KEY (DataVaultLogKey) REFERENCES [DataVaultLog] (DataVaultLogKey)
go
ALTER TABLE [dbo].[DataVaultAttempt] CHECK CONSTRAINT [FK_DataVaultAttempt_DataVaultLog]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultAttempt' AND [CONSTRAINT_NAME] = 'FK_DataVaultAttempt_DataVaultLogDetail')
    ALTER TABLE [dbo].[DataVaultAttempt] WITH CHECK ADD CONSTRAINT [FK_DataVaultAttempt_DataVaultLogDetail]
    FOREIGN KEY (DataVaultLogDetailKey) REFERENCES [DataVaultLogDetail] (DataVaultLogDetailKey)
go
ALTER TABLE [dbo].[DataVaultAttempt] CHECK CONSTRAINT [FK_DataVaultAttempt_DataVaultLogDetail]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultLog' AND [CONSTRAINT_NAME] = 'FK_DataVaultLog_DataVaultStatusRef')
    ALTER TABLE [dbo].[DataVaultLog] WITH CHECK ADD CONSTRAINT [FK_DataVaultLog_DataVaultStatusRef]
    FOREIGN KEY (Status) REFERENCES [DataVaultStatusRef] (DataVaultStatusCode)
go
ALTER TABLE [dbo].[DataVaultLog] CHECK CONSTRAINT [FK_DataVaultLog_DataVaultStatusRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultLog' AND [CONSTRAINT_NAME] = 'FK_DataVaultLog_UserMain')
    ALTER TABLE [dbo].[DataVaultLog] WITH CHECK ADD CONSTRAINT [FK_DataVaultLog_UserMain]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DataVaultLog] CHECK CONSTRAINT [FK_DataVaultLog_UserMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DataVaultLog' AND [CONSTRAINT_NAME] = 'FK_DataVaultLog_UserMain2')
    ALTER TABLE [dbo].[DataVaultLog] WITH CHECK ADD CONSTRAINT [FK_DataVaultLog_UserMain2]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[DataVaultLog] CHECK CONSTRAINT [FK_DataVaultLog_UserMain2]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredConversionWork' AND [CONSTRAINT_NAME] = 'FK_DeferredConversionWork_OrganizationMain')
    ALTER TABLE [dbo].[DeferredConversionWork] WITH CHECK ADD CONSTRAINT [FK_DeferredConversionWork_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[DeferredConversionWork] CHECK CONSTRAINT [FK_DeferredConversionWork_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DeferredIncomeWork' AND [CONSTRAINT_NAME] = 'FK_DeferredIncomeWork_OrganizationMain')
    ALTER TABLE [dbo].[DeferredIncomeWork] WITH CHECK ADD CONSTRAINT [FK_DeferredIncomeWork_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[DeferredIncomeWork] CHECK CONSTRAINT [FK_DeferredIncomeWork_OrganizationMain]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DonationPremiumRuleGift' AND [CONSTRAINT_NAME] = 'FK_DonationPremiumRuleGift_DonationPremiumRule')
    ALTER TABLE [dbo].[DonationPremiumRuleGift] WITH CHECK ADD CONSTRAINT [FK_DonationPremiumRuleGift_DonationPremiumRule]
    FOREIGN KEY (DonationPremiumRuleID) REFERENCES [DonationPremiumRule] (DonationPremiumRuleID)
go
ALTER TABLE [dbo].[DonationPremiumRuleGift] CHECK CONSTRAINT [FK_DonationPremiumRuleGift_DonationPremiumRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DonationPremiumRuleSourceCode' AND [CONSTRAINT_NAME] = 'FK_DonationPremiumRuleSourceCode_DonationPremiumRule')
    ALTER TABLE [dbo].[DonationPremiumRuleSourceCode] WITH CHECK ADD CONSTRAINT [FK_DonationPremiumRuleSourceCode_DonationPremiumRule]
    FOREIGN KEY (DonationPremiumRuleID) REFERENCES [DonationPremiumRule] (DonationPremiumRuleID)
go
ALTER TABLE [dbo].[DonationPremiumRuleSourceCode] CHECK CONSTRAINT [FK_DonationPremiumRuleSourceCode_DonationPremiumRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DonationPremiumRuleSourceCode' AND [CONSTRAINT_NAME] = 'FK_DonationPremiumRuleSourceCode_SourceCode')
    ALTER TABLE [dbo].[DonationPremiumRuleSourceCode] WITH CHECK ADD CONSTRAINT [FK_DonationPremiumRuleSourceCode_SourceCode]
    FOREIGN KEY (SourceCodeKey) REFERENCES [SourceCode] (SourceCodeKey)
go
ALTER TABLE [dbo].[DonationPremiumRuleSourceCode] CHECK CONSTRAINT [FK_DonationPremiumRuleSourceCode_SourceCode]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DonationPremiumSet' AND [CONSTRAINT_NAME] = 'FK_DonationPremiumSet_DonationPremiumRule')
    ALTER TABLE [dbo].[DonationPremiumSet] WITH CHECK ADD CONSTRAINT [FK_DonationPremiumSet_DonationPremiumRule]
    FOREIGN KEY (DonationPremiumRuleID) REFERENCES [DonationPremiumRule] (DonationPremiumRuleID)
go
ALTER TABLE [dbo].[DonationPremiumSet] CHECK CONSTRAINT [FK_DonationPremiumSet_DonationPremiumRule]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DonationPremiumSetProduct' AND [CONSTRAINT_NAME] = 'FK_DonationPremiumSetProduct_DonationPremiumSet')
    ALTER TABLE [dbo].[DonationPremiumSetProduct] WITH CHECK ADD CONSTRAINT [FK_DonationPremiumSetProduct_DonationPremiumSet]
    FOREIGN KEY (DonationPremiumSetID) REFERENCES [DonationPremiumSet] (DonationPremiumSetID)
go
ALTER TABLE [dbo].[DonationPremiumSetProduct] CHECK CONSTRAINT [FK_DonationPremiumSetProduct_DonationPremiumSet]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DynamicGroup' AND [CONSTRAINT_NAME] = 'FK_DynamicGroup_GroupMain')
    ALTER TABLE [dbo].[DynamicGroup] WITH CHECK ADD CONSTRAINT [FK_DynamicGroup_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[DynamicGroup] CHECK CONSTRAINT [FK_DynamicGroup_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DynamicGroup' AND [CONSTRAINT_NAME] = 'FK_DynamicGroup_ScheduleFrequencyRef')
    ALTER TABLE [dbo].[DynamicGroup] WITH CHECK ADD CONSTRAINT [FK_DynamicGroup_ScheduleFrequencyRef]
    FOREIGN KEY (ScheduleFrequencyCode) REFERENCES [ScheduleFrequencyRef] (ScheduleFrequencyCode)
go
ALTER TABLE [dbo].[DynamicGroup] CHECK CONSTRAINT [FK_DynamicGroup_ScheduleFrequencyRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'DynamicGroup' AND [CONSTRAINT_NAME] = 'FK_DynamicGroup_UniformRegistry')
    ALTER TABLE [dbo].[DynamicGroup] WITH CHECK ADD CONSTRAINT [FK_DynamicGroup_UniformRegistry]
    FOREIGN KEY (QueryDocumentVersionKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[DynamicGroup] CHECK CONSTRAINT [FK_DynamicGroup_UniformRegistry]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EngagementScore' AND [CONSTRAINT_NAME] = 'FK_EngagementScore_CreatedByUser')
    ALTER TABLE [dbo].[EngagementScore] WITH CHECK ADD CONSTRAINT [FK_EngagementScore_CreatedByUser]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[EngagementScore] CHECK CONSTRAINT [FK_EngagementScore_CreatedByUser]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EngagementScore' AND [CONSTRAINT_NAME] = 'FK_EngagementScore_UpdatedByUser')
    ALTER TABLE [dbo].[EngagementScore] WITH CHECK ADD CONSTRAINT [FK_EngagementScore_UpdatedByUser]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[EngagementScore] CHECK CONSTRAINT [FK_EngagementScore_UpdatedByUser]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventDetails' AND [CONSTRAINT_NAME] = 'FK_EventDetails_UniformRegistry_EventDefaultDisplayLayoutKey')
    ALTER TABLE [dbo].[EventDetails] WITH CHECK ADD CONSTRAINT [FK_EventDetails_UniformRegistry_EventDefaultDisplayLayoutKey]
    FOREIGN KEY (EventDefaultDisplayLayoutKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[EventDetails] CHECK CONSTRAINT [FK_EventDetails_UniformRegistry_EventDefaultDisplayLayoutKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventDetails' AND [CONSTRAINT_NAME] = 'FK_EventDetails_UniformRegistry_EventOwnerDisplayLayoutKey')
    ALTER TABLE [dbo].[EventDetails] WITH CHECK ADD CONSTRAINT [FK_EventDetails_UniformRegistry_EventOwnerDisplayLayoutKey]
    FOREIGN KEY (EventOwnerDisplayLayoutKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[EventDetails] CHECK CONSTRAINT [FK_EventDetails_UniformRegistry_EventOwnerDisplayLayoutKey]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventRelatedFunction' AND [CONSTRAINT_NAME] = 'FK_EventRelatedFunction_EventFunctionKey')
    ALTER TABLE [dbo].[EventRelatedFunction] WITH CHECK ADD CONSTRAINT [FK_EventRelatedFunction_EventFunctionKey]
    FOREIGN KEY (EventFunctionKey) REFERENCES [Product_Function] (PRODUCT_CODE)
go
ALTER TABLE [dbo].[EventRelatedFunction] CHECK CONSTRAINT [FK_EventRelatedFunction_EventFunctionKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'EventRelatedFunction' AND [CONSTRAINT_NAME] = 'FK_EventRelatedFunction_EventRegistrationOptionKey')
    ALTER TABLE [dbo].[EventRelatedFunction] WITH CHECK ADD CONSTRAINT [FK_EventRelatedFunction_EventRegistrationOptionKey]
    FOREIGN KEY (EventRegistrationOptionKey) REFERENCES [Product_Function] (PRODUCT_CODE)
go
ALTER TABLE [dbo].[EventRelatedFunction] CHECK CONSTRAINT [FK_EventRelatedFunction_EventRegistrationOptionKey]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormDefinitionField' AND [CONSTRAINT_NAME] = 'FK_FormDefinitionField_FormDefinitionSection')
    ALTER TABLE [dbo].[FormDefinitionField] WITH CHECK ADD CONSTRAINT [FK_FormDefinitionField_FormDefinitionSection]
    FOREIGN KEY (FormDefinitionSectionKey) REFERENCES [FormDefinitionSection] (FormDefinitionSectionKey)
go
ALTER TABLE [dbo].[FormDefinitionField] CHECK CONSTRAINT [FK_FormDefinitionField_FormDefinitionSection]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormDefinitionSection' AND [CONSTRAINT_NAME] = 'FK_FormDefinitionSection_FormDefinition')
    ALTER TABLE [dbo].[FormDefinitionSection] WITH CHECK ADD CONSTRAINT [FK_FormDefinitionSection_FormDefinition]
    FOREIGN KEY (FormDefinitionKey) REFERENCES [FormDefinition] (FormDefinitionKey)
go
ALTER TABLE [dbo].[FormDefinitionSection] CHECK CONSTRAINT [FK_FormDefinitionSection_FormDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormResponse' AND [CONSTRAINT_NAME] = 'FK_FormResponse_FormDefinition')
    ALTER TABLE [dbo].[FormResponse] WITH CHECK ADD CONSTRAINT [FK_FormResponse_FormDefinition]
    FOREIGN KEY (FormDefinitionKey) REFERENCES [FormDefinition] (FormDefinitionKey)
go
ALTER TABLE [dbo].[FormResponse] CHECK CONSTRAINT [FK_FormResponse_FormDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormResponse' AND [CONSTRAINT_NAME] = 'FK_FormResponse_UserMain_CreatedBy')
    ALTER TABLE [dbo].[FormResponse] WITH CHECK ADD CONSTRAINT [FK_FormResponse_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[FormResponse] CHECK CONSTRAINT [FK_FormResponse_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormResponse' AND [CONSTRAINT_NAME] = 'FK_FormResponse_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[FormResponse] WITH CHECK ADD CONSTRAINT [FK_FormResponse_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[FormResponse] CHECK CONSTRAINT [FK_FormResponse_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormResponseField' AND [CONSTRAINT_NAME] = 'FK_FormResponseField_FormDefinitionField')
    ALTER TABLE [dbo].[FormResponseField] WITH CHECK ADD CONSTRAINT [FK_FormResponseField_FormDefinitionField]
    FOREIGN KEY (FormDefinitionFieldKey) REFERENCES [FormDefinitionField] (FormDefinitionFieldKey)
go
ALTER TABLE [dbo].[FormResponseField] CHECK CONSTRAINT [FK_FormResponseField_FormDefinitionField]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'FormResponseField' AND [CONSTRAINT_NAME] = 'FK_FormResponseField_FormResponse')
    ALTER TABLE [dbo].[FormResponseField] WITH CHECK ADD CONSTRAINT [FK_FormResponseField_FormResponse]
    FOREIGN KEY (FormResponseKey) REFERENCES [FormResponse] (FormResponseKey)
go
ALTER TABLE [dbo].[FormResponseField] CHECK CONSTRAINT [FK_FormResponseField_FormResponse]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GatewayAccountLink' AND [CONSTRAINT_NAME] = 'FK_GatewayAccountLink_CCAuthAcctCode')
    ALTER TABLE [dbo].[GatewayAccountLink] WITH CHECK ADD CONSTRAINT [FK_GatewayAccountLink_CCAuthAcctCode]
    FOREIGN KEY (CCAuthAcctCode) REFERENCES [CCAuthAcct] (CCAuthAcctCode)
go
ALTER TABLE [dbo].[GatewayAccountLink] CHECK CONSTRAINT [FK_GatewayAccountLink_CCAuthAcctCode]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GLTransactionMain' AND [CONSTRAINT_NAME] = 'FK_GLTransactionMain_ContactMain')
    ALTER TABLE [dbo].[GLTransactionMain] WITH CHECK ADD CONSTRAINT [FK_GLTransactionMain_ContactMain]
    FOREIGN KEY (ContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[GLTransactionMain] CHECK CONSTRAINT [FK_GLTransactionMain_ContactMain]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupUpdateInstruction' AND [CONSTRAINT_NAME] = 'FK_GroupUpdateInstruction_GroupMain')
    ALTER TABLE [dbo].[GroupUpdateInstruction] WITH CHECK ADD CONSTRAINT [FK_GroupUpdateInstruction_GroupMain]
    FOREIGN KEY (GroupKey) REFERENCES [GroupMain] (GroupKey)
go
ALTER TABLE [dbo].[GroupUpdateInstruction] CHECK CONSTRAINT [FK_GroupUpdateInstruction_GroupMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupUpdateInstruction' AND [CONSTRAINT_NAME] = 'FK_GroupUpdateInstruction_GroupRoleRef')
    ALTER TABLE [dbo].[GroupUpdateInstruction] WITH CHECK ADD CONSTRAINT [FK_GroupUpdateInstruction_GroupRoleRef]
    FOREIGN KEY (GroupRoleKey) REFERENCES [GroupRoleRef] (GroupRoleKey)
go
ALTER TABLE [dbo].[GroupUpdateInstruction] CHECK CONSTRAINT [FK_GroupUpdateInstruction_GroupRoleRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'GroupUpdateInstruction' AND [CONSTRAINT_NAME] = 'FK_GroupUpdateInstruction_TermTypeCode')
    ALTER TABLE [dbo].[GroupUpdateInstruction] WITH CHECK ADD CONSTRAINT [FK_GroupUpdateInstruction_TermTypeCode]
    FOREIGN KEY (TermTypeCode) REFERENCES [GroupUpdateTermTypeRef] (GroupUpdateTermTypeCode)
go
ALTER TABLE [dbo].[GroupUpdateInstruction] CHECK CONSTRAINT [FK_GroupUpdateInstruction_TermTypeCode]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'InventoryTransactionLogLine' AND [CONSTRAINT_NAME] = 'FK_InventoryTransactionLogLine_TransactionTypeRef')
    ALTER TABLE [dbo].[InventoryTransactionLogLine] WITH CHECK ADD CONSTRAINT [FK_InventoryTransactionLogLine_TransactionTypeRef]
    FOREIGN KEY (TransactionTypeCode) REFERENCES [TransactionTypeRef] (TransactionTypeCode)
go
ALTER TABLE [dbo].[InventoryTransactionLogLine] CHECK CONSTRAINT [FK_InventoryTransactionLogLine_TransactionTypeRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseLegacyMap' AND [CONSTRAINT_NAME] = 'FK_LicenseLegacyMap_License')
    ALTER TABLE [dbo].[LicenseLegacyMap] WITH CHECK ADD CONSTRAINT [FK_LicenseLegacyMap_License]
    FOREIGN KEY (LicenseKey) REFERENCES [LicenseRef] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseLegacyMap] CHECK CONSTRAINT [FK_LicenseLegacyMap_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMain' AND [CONSTRAINT_NAME] = 'FK_LicenseMain_License')
    ALTER TABLE [dbo].[LicenseMain] WITH CHECK ADD CONSTRAINT [FK_LicenseMain_License]
    FOREIGN KEY (LicenseKey) REFERENCES [LicenseRef] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMain] CHECK CONSTRAINT [FK_LicenseMain_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMain' AND [CONSTRAINT_NAME] = 'FK_LicenseMain_OrganizationMain')
    ALTER TABLE [dbo].[LicenseMain] WITH CHECK ADD CONSTRAINT [FK_LicenseMain_OrganizationMain]
    FOREIGN KEY (OrganizationKey) REFERENCES [OrganizationMain] (OrganizationKey)
go
ALTER TABLE [dbo].[LicenseMain] CHECK CONSTRAINT [FK_LicenseMain_OrganizationMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_License')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_License]
    FOREIGN KEY (LicenseKey) REFERENCES [LicenseRef] (LicenseKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_License]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseMaster' AND [CONSTRAINT_NAME] = 'FK_LicenseMaster_LicenseOrganizationVersion')
    ALTER TABLE [dbo].[LicenseMaster] WITH CHECK ADD CONSTRAINT [FK_LicenseMaster_LicenseOrganizationVersion]
    FOREIGN KEY (LicenseOrganizationVersionKey) REFERENCES [LicenseOrganizationVersion] (LicenseOrganizationVersionKey)
go
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_LicenseOrganizationVersion]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganizationVersion' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganizationVersion_LicenseOrganization')
    ALTER TABLE [dbo].[LicenseOrganizationVersion] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganizationVersion_LicenseOrganization]
    FOREIGN KEY (LicenseOrganizationKey) REFERENCES [LicenseOrganization] (LicenseOrganizationKey)
go
ALTER TABLE [dbo].[LicenseOrganizationVersion] CHECK CONSTRAINT [FK_LicenseOrganizationVersion_LicenseOrganization]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganizationVersion' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganizationVersion_UserMain_CreatedBy')
    ALTER TABLE [dbo].[LicenseOrganizationVersion] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganizationVersion_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseOrganizationVersion] CHECK CONSTRAINT [FK_LicenseOrganizationVersion_UserMain_CreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseOrganizationVersion' AND [CONSTRAINT_NAME] = 'FK_LicenseOrganizationVersion_UserMain_UpdatedBy')
    ALTER TABLE [dbo].[LicenseOrganizationVersion] WITH CHECK ADD CONSTRAINT [FK_LicenseOrganizationVersion_UserMain_UpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[LicenseOrganizationVersion] CHECK CONSTRAINT [FK_LicenseOrganizationVersion_UserMain_UpdatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LicenseUser' AND [CONSTRAINT_NAME] = 'FK_LicenseUser_License')
    ALTER TABLE [dbo].[LicenseUser] WITH CHECK ADD CONSTRAINT [FK_LicenseUser_License]
    FOREIGN KEY (LicenseKey) REFERENCES [LicenseRef] (LicenseKey)
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationControlProperty' AND [CONSTRAINT_NAME] = 'FK_ControlProperty_ControlType')
    ALTER TABLE [dbo].[LocalizationControlProperty] WITH CHECK ADD CONSTRAINT [FK_ControlProperty_ControlType]
    FOREIGN KEY (LocalizationControlTypeId) REFERENCES [LocalizationControlType] (LocalizationControlTypeId)
go
ALTER TABLE [dbo].[LocalizationControlProperty] CHECK CONSTRAINT [FK_ControlProperty_ControlType]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationPhrase' AND [CONSTRAINT_NAME] = 'FK_Phrase_Application')
    ALTER TABLE [dbo].[LocalizationPhrase] WITH CHECK ADD CONSTRAINT [FK_Phrase_Application]
    FOREIGN KEY (LocalizationApplicationId) REFERENCES [LocalizationApplication] (LocalizationApplicationId)
go
ALTER TABLE [dbo].[LocalizationPhrase] CHECK CONSTRAINT [FK_Phrase_Application]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationPhraseTranslated' AND [CONSTRAINT_NAME] = 'FK_PhraseTranslated_Phrase')
    ALTER TABLE [dbo].[LocalizationPhraseTranslated] WITH CHECK ADD CONSTRAINT [FK_PhraseTranslated_Phrase]
    FOREIGN KEY (LocalizationPhraseId) REFERENCES [LocalizationPhrase] (LocalizationPhraseId)
ON DELETE CASCADE
go
ALTER TABLE [dbo].[LocalizationPhraseTranslated] CHECK CONSTRAINT [FK_PhraseTranslated_Phrase]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationPhraseTranslated' AND [CONSTRAINT_NAME] = 'FK_TranslatedPhrase_Culture')
    ALTER TABLE [dbo].[LocalizationPhraseTranslated] WITH CHECK ADD CONSTRAINT [FK_TranslatedPhrase_Culture]
    FOREIGN KEY (LocalizationCultureId) REFERENCES [LocalizationCulture] (LocalizationCultureId)
go
ALTER TABLE [dbo].[LocalizationPhraseTranslated] CHECK CONSTRAINT [FK_TranslatedPhrase_Culture]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationVersion' AND [CONSTRAINT_NAME] = 'FK_LocalizationVersion_LocalizationCulture')
    ALTER TABLE [dbo].[LocalizationVersion] WITH CHECK ADD CONSTRAINT [FK_LocalizationVersion_LocalizationCulture]
    FOREIGN KEY (CultureId) REFERENCES [LocalizationCulture] (LocalizationCultureId)
go
ALTER TABLE [dbo].[LocalizationVersion] CHECK CONSTRAINT [FK_LocalizationVersion_LocalizationCulture]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'LocalizationVersionPhrase' AND [CONSTRAINT_NAME] = 'FK_LocalizationVersionPhrase_LocalizationVersion')
    ALTER TABLE [dbo].[LocalizationVersionPhrase] WITH CHECK ADD CONSTRAINT [FK_LocalizationVersionPhrase_LocalizationVersion]
    FOREIGN KEY (LocalizationVersionId) REFERENCES [LocalizationVersion] (LocalizationVersionId)
go
ALTER TABLE [dbo].[LocalizationVersionPhrase] CHECK CONSTRAINT [FK_LocalizationVersionPhrase_LocalizationVersion]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ObjectPropertyMetaData' AND [CONSTRAINT_NAME] = 'FK_ObjectPropertyMetaData_ObjectMetaData')
    ALTER TABLE [dbo].[ObjectPropertyMetaData] WITH CHECK ADD CONSTRAINT [FK_ObjectPropertyMetaData_ObjectMetaData]
    FOREIGN KEY (ObjectName) REFERENCES [ObjectMetaData] (ObjectName)
go
ALTER TABLE [dbo].[ObjectPropertyMetaData] CHECK CONSTRAINT [FK_ObjectPropertyMetaData_ObjectMetaData]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'OrderPromotionDiscount' AND [CONSTRAINT_NAME] = 'FK__OrderProm__Order__46DA6CD9')
    ALTER TABLE [dbo].[OrderPromotionDiscount] WITH CHECK ADD CONSTRAINT [FK__OrderProm__Order__46DA6CD9]
    FOREIGN KEY (OrderPromotionKey) REFERENCES [OrderPromotion] (OrderPromotionKey)
go
ALTER TABLE [dbo].[OrderPromotionDiscount] CHECK CONSTRAINT [FK__OrderProm__Order__46DA6CD9]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_AccessMain')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_AccessMain]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMain' AND [CONSTRAINT_NAME] = 'FK_PaymentMain_ContactMain_Payor')
    ALTER TABLE [dbo].[PaymentMain] WITH CHECK ADD CONSTRAINT [FK_PaymentMain_ContactMain_Payor]
    FOREIGN KEY (PayorContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[PaymentMain] CHECK CONSTRAINT [FK_PaymentMain_ContactMain_Payor]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentMethodSetDetail' AND [CONSTRAINT_NAME] = 'FK_PaymentMethodSetDetail_PaymentMethodSetId')
    ALTER TABLE [dbo].[PaymentMethodSetDetail] WITH CHECK ADD CONSTRAINT [FK_PaymentMethodSetDetail_PaymentMethodSetId]
    FOREIGN KEY (PaymentMethodSetId) REFERENCES [PaymentMethodSet] (PaymentMethodSetId)
go
ALTER TABLE [dbo].[PaymentMethodSetDetail] CHECK CONSTRAINT [FK_PaymentMethodSetDetail_PaymentMethodSetId]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PaymentTerms' AND [CONSTRAINT_NAME] = 'FK_PaymentTerms_SystemEntity_SystemEntityKey')
    ALTER TABLE [dbo].[PaymentTerms] WITH CHECK ADD CONSTRAINT [FK_PaymentTerms_SystemEntity_SystemEntityKey]
    FOREIGN KEY (SystemEntityKey) REFERENCES [SystemEntity] (SystemEntityKey)
go
ALTER TABLE [dbo].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_SystemEntity_SystemEntityKey]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PhysicalAddress' AND [CONSTRAINT_NAME] = 'FK_PhysicalAddress_TimeZoneRef')
    ALTER TABLE [dbo].[PhysicalAddress] WITH CHECK ADD CONSTRAINT [FK_PhysicalAddress_TimeZoneRef]
    FOREIGN KEY (TimeZoneKey) REFERENCES [TimeZoneRef] (TimeZoneKey)
go
ALTER TABLE [dbo].[PhysicalAddress] CHECK CONSTRAINT [FK_PhysicalAddress_TimeZoneRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_ExperienceUnit')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_ExperienceUnit]
    FOREIGN KEY (ExperienceUnitKey) REFERENCES [ExperienceUnit] (ExperienceUnitKey)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_ExperienceUnit]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Program' AND [CONSTRAINT_NAME] = 'FK_Program_ProgramStatusRef')
    ALTER TABLE [dbo].[Program] WITH CHECK ADD CONSTRAINT [FK_Program_ProgramStatusRef]
    FOREIGN KEY (ProgramStatusCode) REFERENCES [ProgramStatusRef] (ProgramStatusCode)
go
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_ProgramStatusRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Publish_Request_Detail' AND [CONSTRAINT_NAME] = 'FK_Publish_Request_Content')
    ALTER TABLE [dbo].[Publish_Request_Detail] WITH CHECK ADD CONSTRAINT [FK_Publish_Request_Content]
    FOREIGN KEY (ContentID) REFERENCES [Content] (ContentID)
go
ALTER TABLE [dbo].[Publish_Request_Detail] CHECK CONSTRAINT [FK_Publish_Request_Content]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'PublishRequestDetail' AND [CONSTRAINT_NAME] = 'FK_PublishRequestDetail_ContentDocumentKey')
    ALTER TABLE [dbo].[PublishRequestDetail] WITH CHECK ADD CONSTRAINT [FK_PublishRequestDetail_ContentDocumentKey]
    FOREIGN KEY (ContentDocumentKey) REFERENCES [DocumentMain] (DocumentKey)
go
ALTER TABLE [dbo].[PublishRequestDetail] CHECK CONSTRAINT [FK_PublishRequestDetail_ContentDocumentKey]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ReceiptLine' AND [CONSTRAINT_NAME] = 'FK_ReceiptLine_PaymentMain')
    ALTER TABLE [dbo].[ReceiptLine] WITH CHECK ADD CONSTRAINT [FK_ReceiptLine_PaymentMain]
    FOREIGN KEY (PaymentKey) REFERENCES [PaymentMain] (PaymentKey)
go
ALTER TABLE [dbo].[ReceiptLine] CHECK CONSTRAINT [FK_ReceiptLine_PaymentMain]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'RegistrationStatusChange' AND [CONSTRAINT_NAME] = 'FK_RegistrationStatusChange_ContactMain_StatusChanged')
    ALTER TABLE [dbo].[RegistrationStatusChange] WITH CHECK ADD CONSTRAINT [FK_RegistrationStatusChange_ContactMain_StatusChanged]
    FOREIGN KEY (StatusChangedContactKey) REFERENCES [ContactMain] (ContactKey)
go
ALTER TABLE [dbo].[RegistrationStatusChange] CHECK CONSTRAINT [FK_RegistrationStatusChange_ContactMain_StatusChanged]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalesHistory' AND [CONSTRAINT_NAME] = 'FK_SalesHistory_UserMain_CreatedBy')
    ALTER TABLE [dbo].[SalesHistory] WITH CHECK ADD CONSTRAINT [FK_SalesHistory_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[SalesHistory] CHECK CONSTRAINT [FK_SalesHistory_UserMain_CreatedBy]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'SalutationRef' AND [CONSTRAINT_NAME] = 'FK_SalutationRef_UniformRegistry')
    ALTER TABLE [dbo].[SalutationRef] WITH CHECK ADD CONSTRAINT [FK_SalutationRef_UniformRegistry]
    FOREIGN KEY (SalutationKey) REFERENCES [UniformRegistry] (UniformKey)
go
ALTER TABLE [dbo].[SalutationRef] CHECK CONSTRAINT [FK_SalutationRef_UniformRegistry]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScoreComponent' AND [CONSTRAINT_NAME] = 'FK_ScoreComponent_CreatedByUser')
    ALTER TABLE [dbo].[ScoreComponent] WITH CHECK ADD CONSTRAINT [FK_ScoreComponent_CreatedByUser]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScoreComponent] CHECK CONSTRAINT [FK_ScoreComponent_CreatedByUser]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScoreComponent' AND [CONSTRAINT_NAME] = 'FK_ScoreComponent_EngagementScore')
    ALTER TABLE [dbo].[ScoreComponent] WITH CHECK ADD CONSTRAINT [FK_ScoreComponent_EngagementScore]
    FOREIGN KEY (EngagementScoreKey) REFERENCES [EngagementScore] (EngagementScoreKey)
go
ALTER TABLE [dbo].[ScoreComponent] CHECK CONSTRAINT [FK_ScoreComponent_EngagementScore]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScoreComponent' AND [CONSTRAINT_NAME] = 'FK_ScoreComponent_FunctionId')
    ALTER TABLE [dbo].[ScoreComponent] WITH CHECK ADD CONSTRAINT [FK_ScoreComponent_FunctionId]
    FOREIGN KEY (FunctionId) REFERENCES [FunctionRef] (FunctionId)
go
ALTER TABLE [dbo].[ScoreComponent] CHECK CONSTRAINT [FK_ScoreComponent_FunctionId]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'ScoreComponent' AND [CONSTRAINT_NAME] = 'FK_ScoreComponent_UpdatedByUser')
    ALTER TABLE [dbo].[ScoreComponent] WITH CHECK ADD CONSTRAINT [FK_ScoreComponent_UpdatedByUser]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[ScoreComponent] CHECK CONSTRAINT [FK_ScoreComponent_UpdatedByUser]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLog' AND [CONSTRAINT_NAME] = 'FK_TaskLog_CreatedByUserKey')
    ALTER TABLE [dbo].[TaskLog] WITH CHECK ADD CONSTRAINT [FK_TaskLog_CreatedByUserKey]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_TaskLog_CreatedByUserKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLog' AND [CONSTRAINT_NAME] = 'FK_TaskLog_TaskDefinition')
    ALTER TABLE [dbo].[TaskLog] WITH CHECK ADD CONSTRAINT [FK_TaskLog_TaskDefinition]
    FOREIGN KEY (TaskDefinitionKey) REFERENCES [TaskDefinition] (TaskDefinitionKey)
go
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_TaskLog_TaskDefinition]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLog' AND [CONSTRAINT_NAME] = 'FK_TaskLog_UpdatedByUserKey')
    ALTER TABLE [dbo].[TaskLog] WITH CHECK ADD CONSTRAINT [FK_TaskLog_UpdatedByUserKey]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_TaskLog_UpdatedByUserKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLogDetail' AND [CONSTRAINT_NAME] = 'FK_TaskLogDetail_CreatedByUserKey')
    ALTER TABLE [dbo].[TaskLogDetail] WITH CHECK ADD CONSTRAINT [FK_TaskLogDetail_CreatedByUserKey]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskLogDetail] CHECK CONSTRAINT [FK_TaskLogDetail_CreatedByUserKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLogDetail' AND [CONSTRAINT_NAME] = 'FK_TaskLogDetail_TaskLog')
    ALTER TABLE [dbo].[TaskLogDetail] WITH CHECK ADD CONSTRAINT [FK_TaskLogDetail_TaskLog]
    FOREIGN KEY (TaskLogKey) REFERENCES [TaskLog] (TaskLogKey)
go
ALTER TABLE [dbo].[TaskLogDetail] CHECK CONSTRAINT [FK_TaskLogDetail_TaskLog]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskLogDetail' AND [CONSTRAINT_NAME] = 'FK_TaskLogDetail_UpdatedByUserKey')
    ALTER TABLE [dbo].[TaskLogDetail] WITH CHECK ADD CONSTRAINT [FK_TaskLogDetail_UpdatedByUserKey]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[TaskLogDetail] CHECK CONSTRAINT [FK_TaskLogDetail_UpdatedByUserKey]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskQueue' AND [CONSTRAINT_NAME] = 'FK_TaskQueue_TaskQueueTypeRef')
    ALTER TABLE [dbo].[TaskQueue] WITH CHECK ADD CONSTRAINT [FK_TaskQueue_TaskQueueTypeRef]
    FOREIGN KEY (TaskQueueTypeId) REFERENCES [TaskQueueTypeRef] (TaskQueueTypeId)
go
ALTER TABLE [dbo].[TaskQueue] CHECK CONSTRAINT [FK_TaskQueue_TaskQueueTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskQueuePublishDetail' AND [CONSTRAINT_NAME] = 'FK_TaskQueuePublishDetail_TaskQueue')
    ALTER TABLE [dbo].[TaskQueuePublishDetail] WITH CHECK ADD CONSTRAINT [FK_TaskQueuePublishDetail_TaskQueue]
    FOREIGN KEY (TaskQueueId) REFERENCES [TaskQueue] (TaskQueueId)
go
ALTER TABLE [dbo].[TaskQueuePublishDetail] CHECK CONSTRAINT [FK_TaskQueuePublishDetail_TaskQueue]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskQueueTriggerDetail' AND [CONSTRAINT_NAME] = 'FK_TaskQueueTriggerDetail_TaskQueue')
    ALTER TABLE [dbo].[TaskQueueTriggerDetail] WITH CHECK ADD CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueue]
    FOREIGN KEY (TaskQueueId) REFERENCES [TaskQueue] (TaskQueueId)
go
ALTER TABLE [dbo].[TaskQueueTriggerDetail] CHECK CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueue]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskQueueTriggerDetail' AND [CONSTRAINT_NAME] = 'FK_TaskQueueTriggerDetail_TaskQueueChangeTypeRef')
    ALTER TABLE [dbo].[TaskQueueTriggerDetail] WITH CHECK ADD CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueueChangeTypeRef]
    FOREIGN KEY (TaskQueueChangeTypeId) REFERENCES [TaskQueueChangeTypeRef] (TaskQueueChangeTypeId)
go
ALTER TABLE [dbo].[TaskQueueTriggerDetail] CHECK CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueueChangeTypeRef]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'TaskQueueTriggerDetail' AND [CONSTRAINT_NAME] = 'FK_TaskQueueTriggerDetail_TaskQueueStatusRef')
    ALTER TABLE [dbo].[TaskQueueTriggerDetail] WITH CHECK ADD CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueueStatusRef]
    FOREIGN KEY (TaskQueueStatusId) REFERENCES [TaskQueueStatusRef] (TaskQueueStatusId)
go
ALTER TABLE [dbo].[TaskQueueTriggerDetail] CHECK CONSTRAINT [FK_TaskQueueTriggerDetail_TaskQueueStatusRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'Template' AND [CONSTRAINT_NAME] = 'FK_Template_TemplateTypeRef_TemplateTypeCode')
    ALTER TABLE [dbo].[Template] WITH CHECK ADD CONSTRAINT [FK_Template_TemplateTypeRef_TemplateTypeCode]
    FOREIGN KEY (TemplateTypeCode) REFERENCES [TemplateTypeRef] (TemplateTypeCode)
go
ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [FK_Template_TemplateTypeRef_TemplateTypeCode]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UniformLicense' AND [CONSTRAINT_NAME] = 'FK_UniformLicense_License')
    ALTER TABLE [dbo].[UniformLicense] WITH CHECK ADD CONSTRAINT [FK_UniformLicense_License]
    FOREIGN KEY (LicenseKey) REFERENCES [LicenseRef] (LicenseKey)
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UnofferedCustomerExperience' AND [CONSTRAINT_NAME] = 'FK_UnofferedCustomerExperience_UnOfferedCustomerExperienceGradeKey')
    ALTER TABLE [dbo].[UnofferedCustomerExperience] WITH CHECK ADD CONSTRAINT [FK_UnofferedCustomerExperience_UnOfferedCustomerExperienceGradeKey]
    FOREIGN KEY (UnOfferedCustomerExperienceGradeKey) REFERENCES [GradeRef] (GradeKey)
go
ALTER TABLE [dbo].[UnofferedCustomerExperience] CHECK CONSTRAINT [FK_UnofferedCustomerExperience_UnOfferedCustomerExperienceGradeKey]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'URLMapping' AND [CONSTRAINT_NAME] = 'FK_URLMapping_URLMappingTypeRef')
    ALTER TABLE [dbo].[URLMapping] WITH CHECK ADD CONSTRAINT [FK_URLMapping_URLMappingTypeRef]
    FOREIGN KEY (URLMappingTypeCode) REFERENCES [URLMappingTypeRef] (URLMappingTypeCode)
go
ALTER TABLE [dbo].[URLMapping] CHECK CONSTRAINT [FK_URLMapping_URLMappingTypeRef]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedTableStorage' AND [CONSTRAINT_NAME] = 'FK_UserDefinedTableStorage_ObjectMetaData')
    ALTER TABLE [dbo].[UserDefinedTableStorage] WITH CHECK ADD CONSTRAINT [FK_UserDefinedTableStorage_ObjectMetaData]
    FOREIGN KEY (TableName) REFERENCES [ObjectMetaData] (ObjectName)
go
ALTER TABLE [dbo].[UserDefinedTableStorage] CHECK CONSTRAINT [FK_UserDefinedTableStorage_ObjectMetaData]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedTableStorage' AND [CONSTRAINT_NAME] = 'FK_UserDefinedTableStorage_UserMainCreatedBy')
    ALTER TABLE [dbo].[UserDefinedTableStorage] WITH CHECK ADD CONSTRAINT [FK_UserDefinedTableStorage_UserMainCreatedBy]
    FOREIGN KEY (CreateByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserDefinedTableStorage] CHECK CONSTRAINT [FK_UserDefinedTableStorage_UserMainCreatedBy]
go

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'UserDefinedTableStorage' AND [CONSTRAINT_NAME] = 'FK_UserDefinedTableStorage_UserMainUpdatedBy')
    ALTER TABLE [dbo].[UserDefinedTableStorage] WITH CHECK ADD CONSTRAINT [FK_UserDefinedTableStorage_UserMainUpdatedBy]
    FOREIGN KEY (UpdatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[UserDefinedTableStorage] CHECK CONSTRAINT [FK_UserDefinedTableStorage_UserMainUpdatedBy]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WarehouseCarrier' AND [CONSTRAINT_NAME] = 'FK_WarehouseCarrier_UserMain_CreatedBy')
    ALTER TABLE [dbo].[WarehouseCarrier] WITH CHECK ADD CONSTRAINT [FK_WarehouseCarrier_UserMain_CreatedBy]
    FOREIGN KEY (CreatedByUserKey) REFERENCES [UserMain] (UserKey)
go
ALTER TABLE [dbo].[WarehouseCarrier] CHECK CONSTRAINT [FK_WarehouseCarrier_UserMain_CreatedBy]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_AccessMain')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_AccessMain]
    FOREIGN KEY (AccessKey) REFERENCES [AccessMain] (AccessKey)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_AccessMain]
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

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE WHERE [TABLE_NAME] = 'WorkOrderMain' AND [CONSTRAINT_NAME] = 'FK_WorkOrderMain_ResponseMediaRef')
    ALTER TABLE [dbo].[WorkOrderMain] WITH CHECK ADD CONSTRAINT [FK_WorkOrderMain_ResponseMediaRef]
    FOREIGN KEY (ResponseMediaCode) REFERENCES [ResponseMediaRef] (ResponseMediaCode)
go
ALTER TABLE [dbo].[WorkOrderMain] CHECK CONSTRAINT [FK_WorkOrderMain_ResponseMediaRef]
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

