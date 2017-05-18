IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'asi_ComputeValueWithMod11Checksum')
    GRANT EXECUTE ON [asi_ComputeValueWithMod11Checksum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'asi_IsColumnIdentity')
    GRANT EXECUTE ON [asi_IsColumnIdentity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_CompareVersions')
    GRANT EXECUTE ON [fn_asi_CompareVersions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_convert_foreign_chars')
    GRANT EXECUTE ON [fn_asi_convert_foreign_chars] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_convert_foreign_string')
    GRANT EXECUTE ON [fn_asi_convert_foreign_string] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_DatabaseVersion')
    GRANT EXECUTE ON [fn_asi_DatabaseVersion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_generate_login')
    GRANT EXECUTE ON [fn_asi_generate_login] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_GetCompanySort')
    GRANT EXECUTE ON [fn_asi_GetCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_GetFullName')
    GRANT EXECUTE ON [fn_asi_GetFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_GetLastFirst')
    GRANT EXECUTE ON [fn_asi_GetLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_SoftCreditCMDM_Amount')
    GRANT EXECUTE ON [fn_asi_SoftCreditCMDM_Amount] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_SoftCreditCMDM_Exists')
    GRANT EXECUTE ON [fn_asi_SoftCreditCMDM_Exists] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'FN' and [name] = 'fn_asi_StripParens')
    GRANT EXECUTE ON [fn_asi_StripParens] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMChangeStatus')
    GRANT EXECUTE ON [amsp_CMChangeStatus] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMCopyContentAsNew')
    GRANT EXECUTE ON [amsp_CMCopyContentAsNew] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMCopyNavMenu')
    GRANT EXECUTE ON [amsp_CMCopyNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMDeleteContent')
    GRANT EXECUTE ON [amsp_CMDeleteContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMDeleteNavMenu')
    GRANT EXECUTE ON [amsp_CMDeleteNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMDeleteWebsite')
    GRANT EXECUTE ON [amsp_CMDeleteWebsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMFindContentIDtoEdit')
    GRANT EXECUTE ON [amsp_CMFindContentIDtoEdit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetContentAuthority')
    GRANT EXECUTE ON [amsp_CMGetContentAuthority] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetContentFiles')
    GRANT EXECUTE ON [amsp_CMGetContentFiles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetContentSecurity')
    GRANT EXECUTE ON [amsp_CMGetContentSecurity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetContentToPublish')
    GRANT EXECUTE ON [amsp_CMGetContentToPublish] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetCurrentContents')
    GRANT EXECUTE ON [amsp_CMGetCurrentContents] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetFuturePublishPath')
    GRANT EXECUTE ON [amsp_CMGetFuturePublishPath] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetMenuItems')
    GRANT EXECUTE ON [amsp_CMGetMenuItems] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetMissingTagContent')
    GRANT EXECUTE ON [amsp_CMGetMissingTagContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetNavMenuToRegenerate')
    GRANT EXECUTE ON [amsp_CMGetNavMenuToRegenerate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetPublishableDescendants')
    GRANT EXECUTE ON [amsp_CMGetPublishableDescendants] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetPublishableNavMenu')
    GRANT EXECUTE ON [amsp_CMGetPublishableNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetPublishedContentID')
    GRANT EXECUTE ON [amsp_CMGetPublishedContentID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetPublishingServer')
    GRANT EXECUTE ON [amsp_CMGetPublishingServer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetPublishRequests')
    GRANT EXECUTE ON [amsp_CMGetPublishRequests] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetUniqueContentName')
    GRANT EXECUTE ON [amsp_CMGetUniqueContentName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetUniqueDirectoryName')
    GRANT EXECUTE ON [amsp_CMGetUniqueDirectoryName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetUniqueSectionName')
    GRANT EXECUTE ON [amsp_CMGetUniqueSectionName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetWebsiteNavigation')
    GRANT EXECUTE ON [amsp_CMGetWebsiteNavigation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMGetWorkingContentID')
    GRANT EXECUTE ON [amsp_CMGetWorkingContentID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMInsertContent')
    GRANT EXECUTE ON [amsp_CMInsertContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMInsertNavMenu')
    GRANT EXECUTE ON [amsp_CMInsertNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMInsertPublishMessageLog')
    GRANT EXECUTE ON [amsp_CMInsertPublishMessageLog] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveContent')
    GRANT EXECUTE ON [amsp_CMMoveContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveContentFile')
    GRANT EXECUTE ON [amsp_CMMoveContentFile] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveContentFolder')
    GRANT EXECUTE ON [amsp_CMMoveContentFolder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveContentLink')
    GRANT EXECUTE ON [amsp_CMMoveContentLink] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveNavMenu')
    GRANT EXECUTE ON [amsp_CMMoveNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMMoveNavMenuToWebsite')
    GRANT EXECUTE ON [amsp_CMMoveNavMenuToWebsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMNavMenuRenum')
    GRANT EXECUTE ON [amsp_CMNavMenuRenum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMNavMenuSetup')
    GRANT EXECUTE ON [amsp_CMNavMenuSetup] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMProcessFolderDeletion')
    GRANT EXECUTE ON [amsp_CMProcessFolderDeletion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMRenumCurrentContent')
    GRANT EXECUTE ON [amsp_CMRenumCurrentContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMReorderContentFolder')
    GRANT EXECUTE ON [amsp_CMReorderContentFolder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMRequestPublish')
    GRANT EXECUTE ON [amsp_CMRequestPublish] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMRequestPublishContent')
    GRANT EXECUTE ON [amsp_CMRequestPublishContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMResetNavContentURL')
    GRANT EXECUTE ON [amsp_CMResetNavContentURL] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMRetrieveContentAsNew')
    GRANT EXECUTE ON [amsp_CMRetrieveContentAsNew] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMSetMembersOnlyContent')
    GRANT EXECUTE ON [amsp_CMSetMembersOnlyContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMUpdateContentNavMenu')
    GRANT EXECUTE ON [amsp_CMUpdateContentNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMUpdateNavProperties')
    GRANT EXECUTE ON [amsp_CMUpdateNavProperties] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMUpdatePublishDate')
    GRANT EXECUTE ON [amsp_CMUpdatePublishDate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_CMUpdatePublishLocation')
    GRANT EXECUTE ON [amsp_CMUpdatePublishLocation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetChildMenuItems')
    GRANT EXECUTE ON [amsp_GetChildMenuItems] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetSearchableComponents')
    GRANT EXECUTE ON [amsp_GetSearchableComponents] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetSearchableFiles')
    GRANT EXECUTE ON [amsp_GetSearchableFiles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetSiblingTree')
    GRANT EXECUTE ON [amsp_GetSiblingTree] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetTableColumnList')
    GRANT EXECUTE ON [amsp_GetTableColumnList] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetTaggedPage')
    GRANT EXECUTE ON [amsp_GetTaggedPage] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_GetTagsWithHierarchy')
    GRANT EXECUTE ON [amsp_GetTagsWithHierarchy] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_ICDemote')
    GRANT EXECUTE ON [amsp_ICDemote] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_ICFixTree')
    GRANT EXECUTE ON [amsp_ICFixTree] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_ICMove')
    GRANT EXECUTE ON [amsp_ICMove] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_ICPromote')
    GRANT EXECUTE ON [amsp_ICPromote] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_ICRenum')
    GRANT EXECUTE ON [amsp_ICRenum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_SCUpdateLoginInfo')
    GRANT EXECUTE ON [amsp_SCUpdateLoginInfo] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_TPGetTagsWithHierarchy')
    GRANT EXECUTE ON [amsp_TPGetTagsWithHierarchy] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'amsp_TreeMove')
    GRANT EXECUTE ON [amsp_TreeMove] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_CheckImisNetPrivilegeLevel')
    GRANT EXECUTE ON [asi_CheckImisNetPrivilegeLevel] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_ClearOldQueryResults')
    GRANT EXECUTE ON [asi_ClearOldQueryResults] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_GenerateExpectedPaymentSet')
    GRANT EXECUTE ON [asi_GenerateExpectedPaymentSet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_GetVatCountryForTaxByLocation')
    GRANT EXECUTE ON [asi_GetVatCountryForTaxByLocation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_IsVatTaxableOrder')
    GRANT EXECUTE ON [asi_IsVatTaxableOrder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_IsVatTaxableRegistration')
    GRANT EXECUTE ON [asi_IsVatTaxableRegistration] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_IsVatTaxableRegistration2')
    GRANT EXECUTE ON [asi_IsVatTaxableRegistration2] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_LoginTokenCleanup')
    GRANT EXECUTE ON [asi_LoginTokenCleanup] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_LoginTokenCreate')
    GRANT EXECUTE ON [asi_LoginTokenCreate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_LoginTokenValidate')
    GRANT EXECUTE ON [asi_LoginTokenValidate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_UpdateFundraisingViewTables_DUES')
    GRANT EXECUTE ON [asi_UpdateFundraisingViewTables_DUES] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_UpdateFundraisingViewTables_FR')
    GRANT EXECUTE ON [asi_UpdateFundraisingViewTables_FR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'asi_UpdateFundraisingViewTables_MEET')
    GRANT EXECUTE ON [asi_UpdateFundraisingViewTables_MEET] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'CopyIDRow')
    GRANT EXECUTE ON [CopyIDRow] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_AddressUpdate')
    GRANT EXECUTE ON [sp_asi_AddressUpdate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_AdvancedFlowdown')
    GRANT EXECUTE ON [sp_asi_AdvancedFlowdown] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_ARPayment')
    GRANT EXECUTE ON [sp_asi_ARPayment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_Cert_Completion')
    GRANT EXECUTE ON [sp_asi_Cert_Completion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_ClearOldQueryResults')
    GRANT EXECUTE ON [sp_asi_ClearOldQueryResults] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_ClientUpgrade')
    GRANT EXECUTE ON [sp_asi_ClientUpgrade] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_CreateLogins')
    GRANT EXECUTE ON [sp_asi_CreateLogins] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_db_name')
    GRANT EXECUTE ON [sp_asi_db_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_DeleteCmty')
    GRANT EXECUTE ON [sp_asi_DeleteCmty] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_DeleteForum')
    GRANT EXECUTE ON [sp_asi_DeleteForum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_Discussions')
    GRANT EXECUTE ON [sp_asi_Discussions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_FetchImage')
    GRANT EXECUTE ON [sp_asi_FetchImage] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_FlowdownNameIndex')
    GRANT EXECUTE ON [sp_asi_FlowdownNameIndex] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_FolderPath')
    GRANT EXECUTE ON [sp_asi_FolderPath] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_FRDonations')
    GRANT EXECUTE ON [sp_asi_FRDonations] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_FullAddress')
    GRANT EXECUTE ON [sp_asi_FullAddress] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_GetCompanySort')
    GRANT EXECUTE ON [sp_asi_GetCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_GetCounter')
    GRANT EXECUTE ON [sp_asi_GetCounter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_GetCounter2')
    GRANT EXECUTE ON [sp_asi_GetCounter2] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_GetFullName')
    GRANT EXECUTE ON [sp_asi_GetFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_GetLastFirst')
    GRANT EXECUTE ON [sp_asi_GetLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_MakeImisUser')
    GRANT EXECUTE ON [sp_asi_MakeImisUser] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_MeetingsFlowdown')
    GRANT EXECUTE ON [sp_asi_MeetingsFlowdown] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_NameAddressNameGlobalSync')
    GRANT EXECUTE ON [sp_asi_NameAddressNameGlobalSync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_NameProspectUnion')
    GRANT EXECUTE ON [sp_asi_NameProspectUnion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_NameToNameAddressSync')
    GRANT EXECUTE ON [sp_asi_NameToNameAddressSync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_sp_columns')
    GRANT EXECUTE ON [sp_asi_sp_columns] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_sp_columns_ts')
    GRANT EXECUTE ON [sp_asi_sp_columns_ts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_sp_pkeys')
    GRANT EXECUTE ON [sp_asi_sp_pkeys] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_suser_name')
    GRANT EXECUTE ON [sp_asi_suser_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_TreatProspectImport')
    GRANT EXECUTE ON [sp_asi_TreatProspectImport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UnformatPhoneNumber')
    GRANT EXECUTE ON [sp_asi_UnformatPhoneNumber] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UnformatPhoneNumbers')
    GRANT EXECUTE ON [sp_asi_UnformatPhoneNumbers] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateCompanySort')
    GRANT EXECUTE ON [sp_asi_UpdateCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateCompanyTitleUse')
    GRANT EXECUTE ON [sp_asi_UpdateCompanyTitleUse] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateEventFR')
    GRANT EXECUTE ON [sp_asi_UpdateEventFR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateFullName')
    GRANT EXECUTE ON [sp_asi_UpdateFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateLastFirst')
    GRANT EXECUTE ON [sp_asi_UpdateLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateNameIndex')
    GRANT EXECUTE ON [sp_asi_UpdateNameIndex] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_UpdateTransSoftCredit')
    GRANT EXECUTE ON [sp_asi_UpdateTransSoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P ' and [name] = 'sp_asi_user_name')
    GRANT EXECUTE ON [sp_asi_user_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'AccessItem')
    GRANT SELECT ON [AccessItem] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Activity')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Activity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Activity_Attach')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Activity_Attach] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Activity_tmpID')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Activity_tmpID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'ActivityImporter')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [ActivityImporter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Admin_Section_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Admin_Section_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Admin_Security')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Admin_Security] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Admin_Security_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Admin_Security_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Appeal')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Appeal] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Appeal_Premiums')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Appeal_Premiums] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Basket_Dues')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Basket_Dues] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Basket_Function')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Basket_Function] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Basket_Meeting')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Basket_Meeting] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Basket_Order')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Basket_Order] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Basket_Payment')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Basket_Payment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Batch')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Batch] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Campaign')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Campaign] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cash_Accounts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cash_Accounts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'CCAuthAcct')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [CCAuthAcct] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cert_Comp_Cat')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cert_Comp_Cat] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cert_Prog_Lines')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cert_Prog_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cert_Program')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cert_Program] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cert_Register')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cert_Register] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Administrators')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Administrators] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Discussion_Forums')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Discussion_Forums] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Discussion_Posts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Discussion_Posts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Email_Notification')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Email_Notification] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Invitees')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Invitees] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_News')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_News] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Read_Tracking')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Read_Tracking] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Shared_Files')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Shared_Files] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Shared_Folders')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Shared_Folders] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Cmty_Subscription')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Cmty_Subscription] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Comment_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Comment_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Comment_Types')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Comment_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Committee_Minutes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Committee_Minutes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Committee_Position')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Committee_Position] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Community')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Community] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Email')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Email] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Email_Variable_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Email_Variable_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Interest_Category')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Interest_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Interest_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Component_Script_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Component_Script_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'ContactMain')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [ContactMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Contacts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Contacts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Authority_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Authority_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Authority_Producer')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Authority_Producer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Authority_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Authority_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Change_Request')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Change_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_File')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_File] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_HTML')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_HTML] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Link')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Link] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Pages')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Pages] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Publish_Server')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Publish_Server] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Security_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Content_Workflow_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Content_Workflow_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Counter')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Counter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Country_Addr_Layouts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Country_Addr_Layouts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Country_Names')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Country_Names] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'CustomTabFields')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [CustomTabFields] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Data_Type_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Data_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Deferral_Matrix')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Deferral_Matrix] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Donation_Premium')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Donation_Premium] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'DonationReport')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [DonationReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'DuesCycles')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [DuesCycles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'DueToDueFrom')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [DueToDueFrom] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Duplicate')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Duplicate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Duplicate_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Duplicate_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Email_Contact')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Email_Contact] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'EventRelatedFunction')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [EventRelatedFunction] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exchange_Rate')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exchange_Rate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'ExchangeRateHistory')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [ExchangeRateHistory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Booth')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Booth] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Booth_Hist')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Booth_Hist] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Form')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Form] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Form_Master')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Form_Master] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Meet')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Meet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Meet_Contact')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Meet_Contact] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Meet_Form')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Meet_Form] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Order_Pymt')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Order_Pymt] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Prod')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Prod] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Prod_Con')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Prod_Con] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Prod_Mast')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Prod_Mast] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Reg')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Reg] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Script')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Script] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Setup')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Setup] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Srvc_Comp')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Srvc_Comp] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Srvc_Contr')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Srvc_Contr] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Upsell')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Upsell] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Exhb_Wait_List')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Exhb_Wait_List] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'ExpenseItem')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [ExpenseItem] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Expo_Reg_Class')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Expo_Reg_Class] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'ExpoCad_Prod')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [ExpoCad_Prod] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'File_Type_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [File_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Freight_Dollar')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Freight_Dollar] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Freight_Qty')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Freight_Qty] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Freight_Rate')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Freight_Rate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GatewayTransaction')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GatewayTransaction] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Gen_Descriptions')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Gen_Descriptions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Gen_Tables')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Gen_Tables] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GiftAidClaimDetail')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GiftAidClaimDetail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GiftAidClaimHeader')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GiftAidClaimHeader] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GiftAidDeclaration')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GiftAidDeclaration] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GiftHistorySummary')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GiftHistorySummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GiftReport')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [GiftReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'GroupMember')
    GRANT SELECT ON [GroupMember] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Hotel_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Hotel_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Input_Type_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Input_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Int_Code')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Int_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Interest_Category')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Invoice')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Invoice] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Invoice_Lines')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Invoice_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Iso_Currency_Codes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Iso_Currency_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Job_Record')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Job_Record] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Legis_Bills')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Legis_Bills] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'LoginToken')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [LoginToken] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Mail_Lists')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Mail_Lists] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Mail_Subscribers')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Mail_Subscribers] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Match_Interest')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Match_Interest] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Meet_Hotel')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Meet_Hotel] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Meet_Master')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Meet_Master] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Meet_Reg_Class')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Meet_Reg_Class] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Meet_Resources')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Meet_Resources] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Meet_Std_Resrc')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Meet_Std_Resrc] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Mem_Trib_Code')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Mem_Trib_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Member_Types')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Member_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Microsite')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Microsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Address')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Address] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_AlternateId')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_AlternateId] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Annuity')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Annuity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Estates')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Estates] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Fin')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Fin] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_FR')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_FR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Indexes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Indexes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_MatchPlan')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_MatchPlan] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Note')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Note] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Notify')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Notify] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Picture')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Picture] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_PL_Pref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_PL_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_PlannedGiving')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_PlannedGiving] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Research')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Research] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Salutation')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Salutation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Security')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Security] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Security_Groups')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Security_Groups] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Name_Staff')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_Staff] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu_Feature')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu_Feature] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu_Security_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu_Setup_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu_Setup_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu_Website')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu_Website] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Nav_Menu_Workflow_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Nav_Menu_Workflow_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'OpportunityMain')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [OpportunityMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'OpportunityStatusRef')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [OpportunityStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'OpportunityType')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [OpportunityType] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Order_Badge')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Order_Badge] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Order_Lines')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Order_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Order_Meet')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Order_Meet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Order_Payments')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Order_Payments] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Order_Type')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Order_Type] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Orders')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Orders] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Orders_VAT')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Orders_VAT] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Org_Control')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Org_Control] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Org_Interest')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Org_Interest] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'PledgeReport')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [PledgeReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Prod_Label_Pref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Prod_Label_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Producer')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Producer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Cat')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Cat] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Cert')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Cert] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_FR')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_FR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Function')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Function] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Instance')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Instance] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Inventory')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Inventory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Kit')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Kit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Location')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Location] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Lot')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Lot] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Price')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Price] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Pub')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Pub] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Sub')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Sub] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Substitute')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Substitute] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Tax')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Tax] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Trans')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Product_Type')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Product_Type] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Prospect')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Prospect] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Message_Log')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Message_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Priority_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Priority_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Request')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Request_Detail')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Request_Detail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Request_Status_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Request_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Publish_Server_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Publish_Server_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Receipt')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Receipt] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationCommitment')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationCommitment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationExpectedPayment')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationExpectedPayment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationExpectedPaymentSet')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationExpectedPaymentSet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationExpectedPaymentSetStatusRef')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationExpectedPaymentSetStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationExpectedPaymentStatusRef')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationExpectedPaymentStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationFrequencyRef')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationFrequencyRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'RecurringDonationMatchStatusRef')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [RecurringDonationMatchStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Ref_Client')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Ref_Client] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Ref_Provider')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Ref_Provider] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Ref_Table_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Ref_Table_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Referral')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Referral] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Relationship')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Relationship] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Relationship_Types')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Relationship_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Report_Desc')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Report_Desc] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Request_Status_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Request_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_3rdPartyPayerInfo')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_3rdPartyPayerInfo] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_BadgeTbl')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_BadgeTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_InvoiceTbl')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_InvoiceTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_KitTbl')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_KitTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_ProductInventory')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_ProductInventory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_TicketTbl')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_TicketTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Rpt_WorkingTbl')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Rpt_WorkingTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Search_Collection')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Search_Collection] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Search_Requests')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Search_Requests] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Filters')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Filters] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Group_Rule')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Group_Rule] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Group_Sync')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Group_Sync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Groups')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Groups] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Modes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Modes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Security_Tables')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Security_Tables] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Sender_Codes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Sender_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Service_Request')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Service_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Source_Codes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Source_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'State_Codes')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [State_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Stored_List')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Stored_List] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Style_Options')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Style_Options] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Sub_Component_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Sub_Component_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Subscriptions')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Subscriptions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'System_Params')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [System_Params] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'System_Variable')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [System_Variable] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'SystemConfig')
    GRANT SELECT ON [SystemConfig] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'SystemEntity')
    GRANT SELECT ON [SystemEntity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Color_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Color_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Component_Column')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Component_Column] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Format_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Format_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Format_Type_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Format_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Interest_Category')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Layout')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Layout] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Portlet')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Portlet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_PortletIC')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_PortletIC] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Section')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Section] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Page_Title_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Page_Title_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Portlet')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Portlet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Section')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Section] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Section_Template')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Section_Template] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Template')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Template] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Tagged_Template_Field')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Tagged_Template_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'TaxCategory')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [TaxCategory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Terms')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Terms] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Trans')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Trans_Notify')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Trans_Notify] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Trans_SoftCredit')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Trans_SoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UD_Field')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [UD_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UD_Table')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [UD_Table] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UD_WindowFields')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [UD_WindowFields] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UD_WindowHeader')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [UD_WindowHeader] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'URL_Mapping')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [URL_Mapping] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'URLs')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [URLs] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'User_Defined_Content_Labels')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [User_Defined_Content_Labels] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'User_Defined_Field')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [User_Defined_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'User_Tab_Pref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [User_Tab_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'User_Tab_Pref_Detail')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [User_Tab_Pref_Detail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UserMain')
    GRANT SELECT ON [UserMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UserProcess')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [UserProcess] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UserRole')
    GRANT SELECT ON [UserRole] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Users')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Users] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'UserToken')
    GRANT SELECT ON [UserToken] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Variable_Type_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Variable_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Vat_Rule')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Vat_Rule] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Vat_Rule_Set')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Vat_Rule_Set] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'VAT_Trans')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [VAT_Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'W_Reports')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [W_Reports] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Web_Counter')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Web_Counter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Website')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Website] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Website_Content_Authority')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Website_Content_Authority] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Website_Security_Group')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Website_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Workflow_Status_Ref')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Workflow_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Zip_Code')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Zip_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Zip3')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Zip3] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U ' and [name] = 'Zone_Code')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Zone_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'Company_Index')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Company_Index] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'Login_Security_Group')
    GRANT SELECT ON [Login_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'Name_All')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [Name_All] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'Security_Group')
    GRANT SELECT ON [Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vActivityReport')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vActivityReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vCashGifts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vCashGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vCashGiftTotals')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vCashGiftTotals] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDistributionReport')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDistributionReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDonation')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDonations')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDonations] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDonationsDetail')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDonationsDetail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDonationsDistribution')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDonationsDistribution] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vDonorRelationship')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vDonorRelationship] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vFirstGift')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vFirstGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vFRDonation')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vFRDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vFRDonationTemp')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vFRDonationTemp] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vGift')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vGifts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vGiftSummary')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vGiftSummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vGreatestGift')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vGreatestGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vInKindGifts')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vInKindGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vLastGift')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vLastGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vMatching')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vMatching] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vMeetDonation')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vMeetDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vMeetDonationSumm')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vMeetDonationSumm] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vNameProspectUnion')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vNameProspectUnion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPayments')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPayments] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPledge')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPledge] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPledgeBalances')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPledgeBalances] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPledgeData')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPledgeData] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPledges')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPledges] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vPledgeSummary')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vPledgeSummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vRecurringDonationExpectedPaymentSetList')
    GRANT SELECT ON [vRecurringDonationExpectedPaymentSetList] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vSoftCredit')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vSoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'V ' and [name] = 'vSpecificDonations')
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON [vSpecificDonations] TO [IMIS]
go
