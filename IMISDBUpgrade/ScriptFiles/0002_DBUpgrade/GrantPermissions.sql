IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'AccessItem')
    GRANT SELECT ON [AccessItem] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Activity')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Activity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Activity_Attach')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Activity_Attach] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Activity_tmpID')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Activity_tmpID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'ActivityImporter')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [ActivityImporter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Admin_Section_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Admin_Section_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Admin_Security')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Admin_Security] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Admin_Security_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Admin_Security_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMChangeStatus')
    GRANT EXECUTE ON [amsp_CMChangeStatus] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMCopyContentAsNew')
    GRANT EXECUTE ON [amsp_CMCopyContentAsNew] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMCopyNavMenu')
    GRANT EXECUTE ON [amsp_CMCopyNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMDeleteContent')
    GRANT EXECUTE ON [amsp_CMDeleteContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMDeleteNavMenu')
    GRANT EXECUTE ON [amsp_CMDeleteNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMDeleteWebsite')
    GRANT EXECUTE ON [amsp_CMDeleteWebsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMFindContentIDtoEdit')
    GRANT EXECUTE ON [amsp_CMFindContentIDtoEdit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetContentAuthority')
    GRANT EXECUTE ON [amsp_CMGetContentAuthority] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetContentFiles')
    GRANT EXECUTE ON [amsp_CMGetContentFiles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetContentSecurity')
    GRANT EXECUTE ON [amsp_CMGetContentSecurity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetContentToPublish')
    GRANT EXECUTE ON [amsp_CMGetContentToPublish] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetCurrentContents')
    GRANT EXECUTE ON [amsp_CMGetCurrentContents] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetFuturePublishPath')
    GRANT EXECUTE ON [amsp_CMGetFuturePublishPath] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetMenuItems')
    GRANT EXECUTE ON [amsp_CMGetMenuItems] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetMissingTagContent')
    GRANT EXECUTE ON [amsp_CMGetMissingTagContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetNavMenuToRegenerate')
    GRANT EXECUTE ON [amsp_CMGetNavMenuToRegenerate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetPublishableDescendants')
    GRANT EXECUTE ON [amsp_CMGetPublishableDescendants] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetPublishableNavMenu')
    GRANT EXECUTE ON [amsp_CMGetPublishableNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetPublishedContentID')
    GRANT EXECUTE ON [amsp_CMGetPublishedContentID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetPublishingServer')
    GRANT EXECUTE ON [amsp_CMGetPublishingServer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetPublishRequests')
    GRANT EXECUTE ON [amsp_CMGetPublishRequests] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetUniqueContentName')
    GRANT EXECUTE ON [amsp_CMGetUniqueContentName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetUniqueDirectoryName')
    GRANT EXECUTE ON [amsp_CMGetUniqueDirectoryName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetUniqueSectionName')
    GRANT EXECUTE ON [amsp_CMGetUniqueSectionName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetWebsiteNavigation')
    GRANT EXECUTE ON [amsp_CMGetWebsiteNavigation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMGetWorkingContentID')
    GRANT EXECUTE ON [amsp_CMGetWorkingContentID] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMInsertContent')
    GRANT EXECUTE ON [amsp_CMInsertContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMInsertNavMenu')
    GRANT EXECUTE ON [amsp_CMInsertNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMInsertPublishMessageLog')
    GRANT EXECUTE ON [amsp_CMInsertPublishMessageLog] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveContent')
    GRANT EXECUTE ON [amsp_CMMoveContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveContentFile')
    GRANT EXECUTE ON [amsp_CMMoveContentFile] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveContentFolder')
    GRANT EXECUTE ON [amsp_CMMoveContentFolder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveContentLink')
    GRANT EXECUTE ON [amsp_CMMoveContentLink] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveNavMenu')
    GRANT EXECUTE ON [amsp_CMMoveNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMMoveNavMenuToWebsite')
    GRANT EXECUTE ON [amsp_CMMoveNavMenuToWebsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMNavMenuRenum')
    GRANT EXECUTE ON [amsp_CMNavMenuRenum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMNavMenuSetup')
    GRANT EXECUTE ON [amsp_CMNavMenuSetup] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMProcessFolderDeletion')
    GRANT EXECUTE ON [amsp_CMProcessFolderDeletion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMRenumCurrentContent')
    GRANT EXECUTE ON [amsp_CMRenumCurrentContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMReorderContentFolder')
    GRANT EXECUTE ON [amsp_CMReorderContentFolder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMRequestPublish')
    GRANT EXECUTE ON [amsp_CMRequestPublish] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMRequestPublishContent')
    GRANT EXECUTE ON [amsp_CMRequestPublishContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMResetNavContentURL')
    GRANT EXECUTE ON [amsp_CMResetNavContentURL] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMRetrieveContentAsNew')
    GRANT EXECUTE ON [amsp_CMRetrieveContentAsNew] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMSetMembersOnlyContent')
    GRANT EXECUTE ON [amsp_CMSetMembersOnlyContent] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMUpdateContentNavMenu')
    GRANT EXECUTE ON [amsp_CMUpdateContentNavMenu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMUpdateNavProperties')
    GRANT EXECUTE ON [amsp_CMUpdateNavProperties] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMUpdatePublishDate')
    GRANT EXECUTE ON [amsp_CMUpdatePublishDate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_CMUpdatePublishLocation')
    GRANT EXECUTE ON [amsp_CMUpdatePublishLocation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetChildMenuItems')
    GRANT EXECUTE ON [amsp_GetChildMenuItems] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetSearchableComponents')
    GRANT EXECUTE ON [amsp_GetSearchableComponents] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetSearchableFiles')
    GRANT EXECUTE ON [amsp_GetSearchableFiles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetSiblingTree')
    GRANT EXECUTE ON [amsp_GetSiblingTree] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetTableColumnList')
    GRANT EXECUTE ON [amsp_GetTableColumnList] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetTaggedPage')
    GRANT EXECUTE ON [amsp_GetTaggedPage] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_GetTagsWithHierarchy')
    GRANT EXECUTE ON [amsp_GetTagsWithHierarchy] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_ICDemote')
    GRANT EXECUTE ON [amsp_ICDemote] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_ICFixTree')
    GRANT EXECUTE ON [amsp_ICFixTree] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_ICMove')
    GRANT EXECUTE ON [amsp_ICMove] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_ICPromote')
    GRANT EXECUTE ON [amsp_ICPromote] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_ICRenum')
    GRANT EXECUTE ON [amsp_ICRenum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_SCUpdateLoginInfo')
    GRANT EXECUTE ON [amsp_SCUpdateLoginInfo] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_TPGetTagsWithHierarchy')
    GRANT EXECUTE ON [amsp_TPGetTagsWithHierarchy] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'amsp_TreeMove')
    GRANT EXECUTE ON [amsp_TreeMove] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Appeal')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Appeal] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Appeal_Premiums')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Appeal_Premiums] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_CheckImisNetPrivilegeLevel')
    GRANT EXECUTE ON [asi_CheckImisNetPrivilegeLevel] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_ClearOldQueryResults')
    GRANT EXECUTE ON [asi_ClearOldQueryResults] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'asi_ComputeValueWithMod11Checksum')
    GRANT EXECUTE ON [asi_ComputeValueWithMod11Checksum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_GenerateExpectedPaymentSet')
    GRANT EXECUTE ON [asi_GenerateExpectedPaymentSet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'asi_IsColumnIdentity')
    GRANT EXECUTE ON [asi_IsColumnIdentity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_IsVatTaxableOrder')
    GRANT EXECUTE ON [asi_IsVatTaxableOrder] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_IsVatTaxableRegistration')
    GRANT EXECUTE ON [asi_IsVatTaxableRegistration] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_IsVatTaxableRegistration2')
    GRANT EXECUTE ON [asi_IsVatTaxableRegistration2] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'asi_UpdateFundraisingViewTables')
    GRANT EXECUTE ON [asi_UpdateFundraisingViewTables] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'BAEEventSetupClone')
    GRANT EXECUTE ON [BAEEventSetupClone] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Basket_Dues')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Basket_Dues] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Basket_Function')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Basket_Function] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Basket_Meeting')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Basket_Meeting] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Basket_Order')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Basket_Order] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Basket_Payment')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Basket_Payment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Batch')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Batch] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Campaign')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Campaign] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cash_Accounts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cash_Accounts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'CCAuthAcct')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [CCAuthAcct] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cert_Comp_Cat')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cert_Comp_Cat] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cert_Prog_Lines')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cert_Prog_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cert_Program')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cert_Program] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cert_Register')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cert_Register] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Administrators')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Administrators] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Discussion_Forums')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Discussion_Forums] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Discussion_Posts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Discussion_Posts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Email_Notification')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Email_Notification] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Invitees')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Invitees] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_News')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_News] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Read_Tracking')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Read_Tracking] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Shared_Files')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Shared_Files] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Shared_Folders')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Shared_Folders] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Cmty_Subscription')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Cmty_Subscription] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Comment_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Comment_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Comment_Types')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Comment_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Committee_Minutes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Committee_Minutes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Committee_Position')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Committee_Position] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Community')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Community] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'Company_Index')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Company_Index] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Email')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Email] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Email_Variable_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Email_Variable_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Interest_Category')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Interest_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Interest_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Component_Script_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Component_Script_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'ContactMain')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [ContactMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Contacts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Contacts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Authority_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Authority_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Authority_Producer')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Authority_Producer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Authority_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Authority_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Change_Request')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Change_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_File')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_File] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_HTML')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_HTML] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Link')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Link] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Pages')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Pages] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Publish_Server')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Publish_Server] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Security_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Content_Workflow_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Content_Workflow_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'CopyIDRow')
    GRANT EXECUTE ON [CopyIDRow] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Counter')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Counter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Country_Addr_Layouts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Country_Addr_Layouts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Country_Names')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Country_Names] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'CustomTabFields')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [CustomTabFields] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Data_Type_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Data_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Deferral_Matrix')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Deferral_Matrix] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Donation_Premium')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Donation_Premium] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'DonationReport')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [DonationReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'DuesCycles')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [DuesCycles] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'DueToDueFrom')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [DueToDueFrom] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Duplicate')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Duplicate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Duplicate_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Duplicate_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Email_Contact')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Email_Contact] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exchange_Rate')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exchange_Rate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'ExchangeRateHistory')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [ExchangeRateHistory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Booth')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Booth] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Booth_Hist')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Booth_Hist] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Form')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Form] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Form_Master')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Form_Master] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Meet')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Meet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Meet_Contact')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Meet_Contact] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Meet_Form')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Meet_Form] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Order_Pymt')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Order_Pymt] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Prod')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Prod] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Prod_Con')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Prod_Con] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Prod_Mast')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Prod_Mast] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Reg')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Reg] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Script')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Script] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Setup')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Setup] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Srvc_Comp')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Srvc_Comp] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Srvc_Contr')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Srvc_Contr] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Upsell')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Upsell] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Exhb_Wait_List')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Exhb_Wait_List] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'ExpenseItem')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [ExpenseItem] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Expo_Reg_Class')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Expo_Reg_Class] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'ExpoCad_Prod')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [ExpoCad_Prod] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'File_Type_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [File_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_CompareVersions')
    GRANT EXECUTE ON [fn_asi_CompareVersions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_convert_foreign_chars')
    GRANT EXECUTE ON [fn_asi_convert_foreign_chars] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_convert_foreign_string')
    GRANT EXECUTE ON [fn_asi_convert_foreign_string] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_DatabaseVersion')
    GRANT EXECUTE ON [fn_asi_DatabaseVersion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_generate_login')
    GRANT EXECUTE ON [fn_asi_generate_login] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_GetCompanySort')
    GRANT EXECUTE ON [fn_asi_GetCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_GetFullName')
    GRANT EXECUTE ON [fn_asi_GetFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_GetLastFirst')
    GRANT EXECUTE ON [fn_asi_GetLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_SoftCreditCMDM_Amount')
    GRANT EXECUTE ON [fn_asi_SoftCreditCMDM_Amount] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_SoftCreditCMDM_Exists')
    GRANT EXECUTE ON [fn_asi_SoftCreditCMDM_Exists] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'FN' and name = 'fn_asi_StripParens')
    GRANT EXECUTE ON [fn_asi_StripParens] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Freight_Dollar')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Freight_Dollar] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Freight_Qty')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Freight_Qty] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Freight_Rate')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Freight_Rate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Gen_Descriptions')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Gen_Descriptions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Gen_Tables')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Gen_Tables] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GiftAidClaimDetail')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [GiftAidClaimDetail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GiftAidClaimHeader')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [GiftAidClaimHeader] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GiftAidDeclaration')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [GiftAidDeclaration] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GiftHistorySummary')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [GiftHistorySummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GiftReport')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [GiftReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'GroupMember')
    GRANT SELECT ON [GroupMember] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Hotel_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Hotel_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Input_Type_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Input_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Int_Code')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Int_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Interest_Category')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Invoice')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Invoice] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Invoice_Lines')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Invoice_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Iso_Currency_Codes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Iso_Currency_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Job_Record')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Job_Record] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Legis_Bills')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Legis_Bills] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'Login_Security_Group')
    GRANT SELECT ON [Login_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Mail_Lists')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Mail_Lists] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Mail_Subscribers')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Mail_Subscribers] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Match_Interest')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Match_Interest] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Meet_Hotel')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Meet_Hotel] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Meet_Master')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Meet_Master] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Meet_Reg_Class')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Meet_Reg_Class] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Meet_Resources')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Meet_Resources] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Meet_Std_Resrc')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Meet_Std_Resrc] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Mem_Trib_Code')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Mem_Trib_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Member_Types')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Member_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Microsite')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Microsite] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Address')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Address] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'Name_All')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_All] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_AlternateId')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_AlternateId] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Annuity')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Annuity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Estates')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Estates] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Fin')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Fin] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_FR')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_FR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Indexes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Indexes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_MatchPlan')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_MatchPlan] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Note')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Note] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Notify')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Notify] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Picture')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Picture] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_PL_Pref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_PL_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_PlannedGiving')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_PlannedGiving] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Research')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Research] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Salutation')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Salutation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Security')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Security] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Security_Groups')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Security_Groups] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Name_Staff')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Name_Staff] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu_Feature')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu_Feature] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu_Security_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu_Setup_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu_Setup_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu_Website')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu_Website] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Nav_Menu_Workflow_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Nav_Menu_Workflow_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'OpportunityMain')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [OpportunityMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'OpportunityStatusRef')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [OpportunityStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'OpportunityType')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [OpportunityType] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Order_Badge')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Order_Badge] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Order_Lines')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Order_Lines] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Order_Meet')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Order_Meet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Order_Payments')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Order_Payments] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Order_Type')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Order_Type] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Orders')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Orders] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Orders_VAT')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Orders_VAT] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Org_Control')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Org_Control] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Org_Interest')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Org_Interest] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'PledgeReport')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [PledgeReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Prod_Label_Pref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Prod_Label_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Producer')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Producer] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Cat')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Cat] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Cert')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Cert] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_FR')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_FR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Function')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Function] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Instance')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Instance] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Inventory')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Inventory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Kit')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Kit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Location')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Location] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Lot')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Lot] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Price')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Price] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Pub')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Pub] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Sub')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Sub] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Substitute')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Substitute] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Tax')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Tax] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Trans')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Product_Type')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Product_Type] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Prospect')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Prospect] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Message_Log')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Message_Log] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Priority_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Priority_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Request')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Request_Detail')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Request_Detail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Request_Status_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Request_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Publish_Server_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Publish_Server_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Receipt')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Receipt] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationCommitment')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationCommitment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationExpectedPayment')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationExpectedPayment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationExpectedPaymentSet')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationExpectedPaymentSet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationExpectedPaymentSetStatusRef')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationExpectedPaymentSetStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationExpectedPaymentStatusRef')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationExpectedPaymentStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationFrequencyRef')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationFrequencyRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'RecurringDonationMatchStatusRef')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [RecurringDonationMatchStatusRef] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Ref_Client')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Ref_Client] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Ref_Provider')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Ref_Provider] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Ref_Table_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Ref_Table_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Referral')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Referral] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Relationship')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Relationship] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Relationship_Types')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Relationship_Types] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Report_Desc')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Report_Desc] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Request_Status_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Request_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_3rdPartyPayerInfo')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_3rdPartyPayerInfo] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_BadgeTbl')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_BadgeTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_InvoiceTbl')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_InvoiceTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_KitTbl')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_KitTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_ProductInventory')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_ProductInventory] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_TicketTbl')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_TicketTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Rpt_WorkingTbl')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Rpt_WorkingTbl] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Search_Collection')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Search_Collection] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Search_Requests')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Search_Requests] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Filters')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Filters] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'Security_Group')
    GRANT SELECT ON [Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Group_Rule')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Group_Rule] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Group_Sync')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Group_Sync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Groups')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Groups] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Modes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Modes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Security_Tables')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Security_Tables] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Sender_Codes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Sender_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Service_Request')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Service_Request] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Source_Codes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Source_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_AddressUpdate')
    GRANT EXECUTE ON [sp_asi_AddressUpdate] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_AdvancedFlowdown')
    GRANT EXECUTE ON [sp_asi_AdvancedFlowdown] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_ARPayment')
    GRANT EXECUTE ON [sp_asi_ARPayment] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_Cert_Completion')
    GRANT EXECUTE ON [sp_asi_Cert_Completion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_ClearOldQueryResults')
    GRANT EXECUTE ON [sp_asi_ClearOldQueryResults] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_ClientUpgrade')
    GRANT EXECUTE ON [sp_asi_ClientUpgrade] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_CreateLogins')
    GRANT EXECUTE ON [sp_asi_CreateLogins] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_db_name')
    GRANT EXECUTE ON [sp_asi_db_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_DeleteCmty')
    GRANT EXECUTE ON [sp_asi_DeleteCmty] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_DeleteForum')
    GRANT EXECUTE ON [sp_asi_DeleteForum] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_Discussions')
    GRANT EXECUTE ON [sp_asi_Discussions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_FetchImage')
    GRANT EXECUTE ON [sp_asi_FetchImage] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_FlowdownNameIndex')
    GRANT EXECUTE ON [sp_asi_FlowdownNameIndex] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_FolderPath')
    GRANT EXECUTE ON [sp_asi_FolderPath] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_FRDonations')
    GRANT EXECUTE ON [sp_asi_FRDonations] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_FullAddress')
    GRANT EXECUTE ON [sp_asi_FullAddress] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_GetCompanySort')
    GRANT EXECUTE ON [sp_asi_GetCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_GetCounter')
    GRANT EXECUTE ON [sp_asi_GetCounter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_GetCounter2')
    GRANT EXECUTE ON [sp_asi_GetCounter2] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_GetFullName')
    GRANT EXECUTE ON [sp_asi_GetFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_GetLastFirst')
    GRANT EXECUTE ON [sp_asi_GetLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_MakeImisUser')
    GRANT EXECUTE ON [sp_asi_MakeImisUser] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_MeetingsFlowdown')
    GRANT EXECUTE ON [sp_asi_MeetingsFlowdown] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_NameAddressNameGlobalSync')
    GRANT EXECUTE ON [sp_asi_NameAddressNameGlobalSync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_NameProspectUnion')
    GRANT EXECUTE ON [sp_asi_NameProspectUnion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_NameToNameAddressSync')
    GRANT EXECUTE ON [sp_asi_NameToNameAddressSync] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_sp_columns')
    GRANT EXECUTE ON [sp_asi_sp_columns] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_sp_columns_ts')
    GRANT EXECUTE ON [sp_asi_sp_columns_ts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_sp_pkeys')
    GRANT EXECUTE ON [sp_asi_sp_pkeys] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_suser_name')
    GRANT EXECUTE ON [sp_asi_suser_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_TreatProspectImport')
    GRANT EXECUTE ON [sp_asi_TreatProspectImport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UnformatPhoneNumber')
    GRANT EXECUTE ON [sp_asi_UnformatPhoneNumber] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UnformatPhoneNumbers')
    GRANT EXECUTE ON [sp_asi_UnformatPhoneNumbers] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateCompanySort')
    GRANT EXECUTE ON [sp_asi_UpdateCompanySort] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateCompanyTitleUse')
    GRANT EXECUTE ON [sp_asi_UpdateCompanyTitleUse] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateEventFR')
    GRANT EXECUTE ON [sp_asi_UpdateEventFR] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateFullName')
    GRANT EXECUTE ON [sp_asi_UpdateFullName] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateLastFirst')
    GRANT EXECUTE ON [sp_asi_UpdateLastFirst] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateNameIndex')
    GRANT EXECUTE ON [sp_asi_UpdateNameIndex] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_UpdateTransSoftCredit')
    GRANT EXECUTE ON [sp_asi_UpdateTransSoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'P ' and name = 'sp_asi_user_name')
    GRANT EXECUTE ON [sp_asi_user_name] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'State_Codes')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [State_Codes] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Stored_List')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Stored_List] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Style_Options')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Style_Options] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Sub_Component_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Sub_Component_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Subscriptions')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Subscriptions] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'System_Params')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [System_Params] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'System_Variable')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [System_Variable] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'SystemConfig')
    GRANT SELECT ON [SystemConfig] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'SystemEntity')
    GRANT SELECT ON [SystemEntity] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Color_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Color_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Component_Column')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Component_Column] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Format_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Format_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Format_Type_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Format_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Interest_Category')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Interest_Category] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Layout')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Layout] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Portlet')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Portlet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_PortletIC')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_PortletIC] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Section')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Section] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Page_Title_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Page_Title_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Portlet')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Portlet] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Section')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Section] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Section_Template')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Section_Template] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Template')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Template] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Tagged_Template_Field')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Tagged_Template_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Terms')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Terms] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Trans')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Trans_Notify')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Trans_Notify] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Trans_SoftCredit')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Trans_SoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UD_Field')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [UD_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UD_Table')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [UD_Table] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UD_WindowFields')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [UD_WindowFields] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UD_WindowHeader')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [UD_WindowHeader] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'URL_Mapping')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [URL_Mapping] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'URLs')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [URLs] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'User_Defined_Content_Labels')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [User_Defined_Content_Labels] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'User_Defined_Field')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [User_Defined_Field] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'User_Tab_Pref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [User_Tab_Pref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'User_Tab_Pref_Detail')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [User_Tab_Pref_Detail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UserMain')
    GRANT SELECT ON [UserMain] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UserProcess')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [UserProcess] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UserRole')
    GRANT SELECT ON [UserRole] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Users')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Users] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'UserToken')
    GRANT SELECT ON [UserToken] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vActivityReport')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vActivityReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Variable_Type_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Variable_Type_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Vat_Rule')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Vat_Rule] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Vat_Rule_Set')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Vat_Rule_Set] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'VAT_Trans')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [VAT_Trans] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vCashGifts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vCashGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vCashGiftTotals')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vCashGiftTotals] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDistributionReport')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDistributionReport] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDonation')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDonations')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDonations] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDonationsDetail')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDonationsDetail] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDonationsDistribution')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDonationsDistribution] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vDonorRelationship')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vDonorRelationship] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vFirstGift')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vFirstGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vFRDonation')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vFRDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vFRDonationTemp')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vFRDonationTemp] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vGift')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vGifts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vGiftSummary')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vGiftSummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vGreatestGift')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vGreatestGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vInKindGifts')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vInKindGifts] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vLastGift')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vLastGift] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vMatching')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vMatching] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vMeetDonation')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vMeetDonation] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vMeetDonationSumm')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vMeetDonationSumm] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vNameProspectUnion')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vNameProspectUnion] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPayments')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPayments] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPledge')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPledge] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPledgeBalances')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPledgeBalances] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPledgeData')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPledgeData] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPledges')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPledges] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vPledgeSummary')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vPledgeSummary] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vRecurringDonationExpectedPaymentSetList')
    GRANT SELECT ON [vRecurringDonationExpectedPaymentSetList] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vSoftCredit')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vSoftCredit] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'V ' and name = 'vSpecificDonations')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [vSpecificDonations] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'W_Reports')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [W_Reports] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Web_Counter')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Web_Counter] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Website')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Website] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Website_Content_Authority')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Website_Content_Authority] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Website_Security_Group')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Website_Security_Group] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Workflow_Status_Ref')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Workflow_Status_Ref] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Zip_Code')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Zip_Code] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Zip3')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Zip3] TO [IMIS]
go

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U ' and name = 'Zone_Code')
    GRANT REFERENCES, SELECT, INSERT, DELETE, UPDATE ON [Zone_Code] TO [IMIS]
go

