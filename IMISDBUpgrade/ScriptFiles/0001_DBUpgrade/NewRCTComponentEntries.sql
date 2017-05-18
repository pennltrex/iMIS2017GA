SET NOCOUNT ON


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Function Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('028842d6-6260-4fc0-b005-0426ee9cfb96','Function Display','Displays the details of an event function.','IAtom','Asi.Web.iParts.Events.FunctionDisplayCommon','Asi.Web.iParts.Events',NULL,NULL,1,0,NULL,'~/iParts/Events/Events/FunctionDisplayConfigEdit.ascx','~/iParts/Events/Events/FunctionDisplayConfigEdit.ascx','~/iParts/Events/Events/FunctionDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Status')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('71404d61-ad9b-44cf-8f50-0484a2d3bdf2','Contact Status','Display contact status, type and paid thru','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactStatus','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactStatusEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactStatusEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactStatusDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Announcements')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('97ba5855-b53f-4122-8bdd-05495f1b1b15','Announcements','Displays the list of announcements for a given community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/Announcement.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Forum List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('08c896d2-a8a2-4801-8e3a-05a66d413c72','Forum List','The list of forums for a given community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/ForumList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'File Importer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9902587a-5754-41d7-b397-08e601d46b07','File Importer For Web Services','Generic file importer iPart for SOA.  It can be used to convert data into an appropriate DataContract/ XML format for SOA to work with.','IAtom','Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesCommon','Asi.Web.iParts.Common.FileImporterForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesEdit.ascx','~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesEdit.ascx','~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Wiki List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('d835e442-d6f9-4711-b8dc-0f62de061bb1','Wiki List','The list of wikis for a given community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Wiki/WikiList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Forum Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('00a92a78-6825-45a8-96fb-1118d266560d','Forum Configuration','The edit screen for a forum.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/ForumConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Continue Shopping Button Link')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('0fa99997-2dd4-40a8-ad8f-151fe2e4b173','Continue Shopping Button Link','Continue shopping with the previous search results.','IAtom','Asi.Web.iParts.Commerce.ContinueShoppingButtonLink.ContinueShoppingButtonLinkCommon','Asi.Web.iParts.Commerce.ContinueShoppingButtonLink',NULL,NULL,1,0,NULL,'~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkConfigEdit.ascx','~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkConfigEdit.ascx','~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Summary')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e11e96b7-369b-4558-9263-15371c8605ae','Community Summary','Displays the item''s linked name, image, description, and relevant links.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunitySummary.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Description')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c14871fb-8ca8-4eca-918c-17e12bb8809b','Community Description','Displays the full description for a Community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunityDescription.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Panel Editor')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('b7860208-3285-41b8-a3e5-198dda8d7177','Panel Editor','Allows display and editing of contact user defined field data','IAtom','Asi.Web.iParts.Common.PanelEditor.PanelEditorCommon','Asi.Web.iParts.Common.PanelEditor',NULL,NULL,1,0,NULL,'~/iparts/Common/PanelEditor/PanelEditorConfigEdit.ascx','~/iparts/Common/PanelEditor/PanelEditorConfigEdit.ascx','~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Query Profile Picture List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('bcea2776-7ef2-4e8d-87bc-20fe4f650cb6','Query Profile Picture List','Displays a group of profile pictures based on the results of an IQA query.','IAtom','Asi.Web.iParts.Common.QueryProfilePictureList.QueryProfilePictureListCommon','Asi.Web.iParts.Common.QueryProfilePictureList',NULL,NULL,1,0,NULL,'~/iparts/Common/QueryProfilePictureList/QueryProfilePictureListConfigEdit.ascx','~/iparts/Common/QueryProfilePictureList/QueryProfilePictureListConfigEdit.ascx','~/iparts/Common/QueryProfilePictureList/QueryProfilePictureListDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Attachment Manager')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('467b0e9c-157d-4932-8be1-246814d87e68','Attachment Manager','Allows controlling the list of attachments for a given item.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/AttachmentManager.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Submit Order Button Link')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('5d495e98-ae39-46c5-b0a5-2afad1bc8ff9','Submit Order Button Link','Submits the current order or donation for processing.','IAtom','Asi.Web.iParts.Commerce.SubmitOrderButtonLink.SubmitOrderButtonLinkCommon','Asi.Web.iParts.Commerce.SubmitOrderButtonLink',NULL,NULL,1,0,NULL,'~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkConfigEdit.ascx','~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkConfigEdit.ascx','~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'File Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('f1ef44a4-ab91-4464-a15f-2ccf77a50229','File Viewer For Web Services','iPart for viewing and processing (importing) XML files via SOA.','IAtom','Asi.Web.iParts.Common.FileViewerForWebServices.FileViewerForWebServicesCommon','Asi.Web.iParts.Common.FileViewerForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesEdit.ascx','~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesEdit.ascx','~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'SSRS Report')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('321580fc-3ba3-41f2-8294-317f90ce2915','SSRS Report','Display an SSRS report, using a template stored in the iMIS Document System.','IAtom','Asi.Web.iParts.Common.SSRSReport.SSRSReportCommon','Asi.Web.iParts.Common.SSRSReport',NULL,NULL,1,0,NULL,'~/iParts/Common/SSRSReport/SSRSReportConfigEdit.ascx','~/iParts/Common/SSRSReport/SSRSReportConfigEdit.ascx','~/iParts/Common/SSRSReport/SSRSReportDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Comment List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('107c1965-f25b-48f3-b661-323ec5a3e556','Comment List','A list of comments for a given item.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Comment/CommentList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Product Display List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e2e93186-e9e8-4f33-a902-3248c89c14f3','Product Display List','List products using an IQA Query and control which properties are displayed','IAtom','Asi.Web.iParts.Commerce.ProductDisplayList.ProductDisplayListCommon','Asi.Web.iParts.Commerce.ProductDisplayList','','',1,0,NULL,'~/iParts/Commerce/ProductDisplayList/ProductDisplayListEdit.ascx','~/iParts/Commerce/ProductDisplayList/ProductDisplayListEdit.ascx','~/iParts/Commerce/ProductDisplayList/ProductDisplayListDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'AddThis For Social Networking')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c5b839d6-8482-4534-b6cb-32be708078a4','AddThis For Social Networking','Allows any user to bookmark or share your website with social networking and bookmarking sites, like Facebook, Twitter, and Digg.','IAtom','Asi.Web.iParts.Social.AddThis.AddThisCommon','Asi.Web.iParts.Social.AddThis',NULL,NULL,1,0,NULL,'~/iParts/Social/AddThis/AddThisConfigEdit.ascx','~/iParts/Social/AddThis/AddThisConfigEdit.ascx','~/iParts/Social/AddThis/AddThisDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9c6c999e-2ba2-42b0-984d-3538bdbeb864','Blog List','A list of blogs for a given community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/BlogList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Query Menu')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('83819433-1ee7-43b9-a32c-392451b713d9','Query Menu','Displays query results in an inline grid. The list of available queries is retrieved from a document system folder, and presented in a pop-up menu.','IAtom','Asi.Web.iParts.Common.QueryMenu.QueryMenuCommon','Asi.Web.iParts.Common.QueryMenu','','',1,0,NULL,'~/iparts/Common/QueryMenu/QueryMenuEdit.ascx','~/iparts/Common/QueryMenu/QueryMenuEdit.ascx','~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Summary Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('15028c58-aa3d-4e33-88b0-3c143ec64838','Summary Display','Displays query results in a form view.','IAtom','Asi.Web.iParts.Common.SummaryDisplay.SummaryDisplayCommon','Asi.Web.iParts.Common.SummaryDisplay',NULL,NULL,1,0,NULL,'~/iparts/Common/SummaryDisplay/SummaryDisplayConfigEdit.ascx','~/iparts/Common/SummaryDisplay/SummaryDisplayConfigEdit.ascx','~/iparts/Common/SummaryDisplay/SummaryDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Forum List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('d52625e7-7cd0-4f28-82a4-3dd43e6ab188','Forum List Item','A single forum in a forum listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/ForumListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recurring Donation Expected Payments')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('bba747c7-c3c6-4477-961c-40cdbe242675','Recurring Donation Expected Payments','iPart used to generate expected payments from existing commitments','IAtom','Asi.Web.iParts.Fundraising.RecurringDonation.ExpectedPayments.ExpectedPaymentsCommon','Asi.Web.iParts.Fundraising.RecurringDonation.ExpectedPayments',NULL,NULL,1,0,NULL,'~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsEdit.ascx','~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsEdit.ascx','~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Forum Home')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('5e171b3c-ec13-4c1a-a71d-40d081af650b','Forum Home','The "home view" for a forum.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/ForumHome.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Query Chart Viewer')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('48635ca7-e457-4d9f-a59e-4231d5479e47','Query Chart Viewer','Displays query results in an chart.','IAtom','Asi.Web.iParts.Common.QueryChartViewer.QueryChartViewerCommon','Asi.Web.iParts.Common.QueryChartViewer',NULL,NULL,1,0,NULL,'~/iParts/Common/QueryChartViewer/QueryChartViewerConfigEdit.ascx','~/iParts/Common/QueryChartViewer/QueryChartViewerConfigEdit.ascx','~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Topic List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('8e6be419-3893-48cc-a068-4246d0dae023','Topic List','A list of topics for a given forum.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/TopicList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Log Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e54feb64-8a29-4242-8439-429b265d7789','Log Viewer For Web Services','iPart to allow viewing of SOA import log files','IAtom','Asi.Web.iParts.Common.LogViewerForWebServices.LogViewerForWebServicesCommon','Asi.Web.iParts.Common.LogViewerForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesConfigEdit.ascx','~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesConfigEdit.ascx','~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Wiki List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('52c6985b-4452-4390-b5f2-4367505f80f0','Wiki List Item','A single wiki in a wiki listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Wiki/WikiListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Invoice Payment Link')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('f100f5b9-ffd3-4941-9eff-43e0b58e86d7','Invoice Payment Link','Used to add an Invoice to the shopping cart for payment.','IAtom','Asi.Web.iParts.Commerce.InvoicePaymentLink.InvoicePaymentLinkCommon','Asi.Web.iParts.Commerce.InvoicePaymentLink',NULL,NULL,1,0,NULL,'~/iParts/Commerce/InvoicePaymentLink/InvoicePaymentLinkConfigEdit.ascx','~/iParts/Commerce/InvoicePaymentLink/InvoicePaymentLinkConfigEdit.ascx','~/iParts/Commerce/InvoicePaymentLink/InvoicePaymentLinkDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Topic Home')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('d4d555f1-5ff7-4c94-8e60-453521a50acb','Topic Home','The "home view" for a forum topic.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/TopicHome.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentWebUserControl')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e6133c9d-86f1-497a-a648-4f128aec32c9','ContentWebUserControl','A custom Web User Control.','IAtom','Asi.Business.ContentManagement.ContentWebUserControl','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentWebUserControlEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentWebUserControlEdit.ascx',NULL,NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Subscription Link')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('12421422-e7f9-468d-8572-5325419fb40c','Subscription Link','Allows a user to subscribe to or unsubscribe from a given item.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Wiki Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('55acafcc-d309-4afa-9988-548eb103ae8b','Wiki Configuration','The edit screen for a wiki.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Wiki/WikiConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('de7bd1b1-4864-4818-a38f-5972a98b8802','Blog List Item','A single blog in a blog listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/BlogListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Cart Details Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('8897b91e-b367-4a92-b4a6-6387281b1e71','Cart Details Display','Display shopping cart','IAtom','Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayCommon','Asi.Web.iParts.Commerce.CartDetailsDisplay',NULL,NULL,1,0,NULL,'~/iParts/Commerce/CartDetailsDisplay/CartDetailsDisplayConfigEdit.ascx','~/iParts/Commerce/CartDetailsDisplay/CartDetailsDisplayConfigEdit.ascx','~/iParts/Commerce/CartDetailsDisplay/CartDetailsDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Announcement Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('01f17dcb-a1a9-4efb-b380-68bc5942e65a','Announcement Configuration','The edit screen for the Announcements forum.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/AnnouncementConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Shipping Method Selector')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('05d0fb16-d7c2-487a-a97f-69efb6f4cf7a','Shipping Method Selector','Displays default Ship To address and enter shipping details for store checkout.','IAtom','Asi.Web.iParts.Commerce.ShippingMethodSelector.ShippingMethodSelectorCommon','Asi.Web.iParts.Commerce.ShippingMethodSelector',NULL,NULL,1,0,NULL,'~/iParts/Commerce/ShippingMethodSelector/ShippingMethodSelectorConfigEdit.ascx','~/iParts/Commerce/ShippingMethodSelector/ShippingMethodSelectorConfigEdit.ascx','~/iParts/Commerce/ShippingMethodSelector/ShippingMethodSelectorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Address Editor')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('b98583ed-8f8b-4ed9-93db-70ff5f0e1dbb','Contact Address Editor','Display a contact address editor','IAtom','Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddressEditorCommon','Asi.Web.iParts.ContactManagement.ContactAddressEditor',NULL,NULL,1,0,NULL,'~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorConfigEdit.ascx','~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorConfigEdit.ascx','~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Entry List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('f22bb278-53ed-4734-b711-72822bd8e314','Entry List','A list of entries for a given blog.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/EntryList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Topic Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('7d7c4872-1764-4a60-8505-7311dae77603','Topic Configuration','The edit screen for a forum topic.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/TopicConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Comment List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('1e40d289-24b9-47da-8f76-76ad5ecb8deb','Comment List Item','A single comment in a comment listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Comment/CommentListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Name')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2f042870-16c6-45ca-90c5-777560a9ca98','Contact Name','Display contact name','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactName','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactNameEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactNameEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactNameDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Preferences')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('d4a3326e-893e-464b-a11d-7d8f6cd883d9','Preferences','Manages a user''s community preferences and subscriptions.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/Preferences.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Comment Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('336038b6-1138-4050-a3c1-7f995470471e','Comment Configuration','The edit screen for comments.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Comment/CommentConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Roster')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('13b289dd-a8a2-4f94-903f-85ac2190e568','Community Roster','Displays the list of all members (subscribers and administrators) of a community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunityRoster.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Mini Profile')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('ae957adf-092e-43a4-ae6e-88a80b0785bf','Contact Mini Profile','Display brief member information and committee/chapter membership','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactMiniProfileCommon','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Status Editor')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('67daef0d-f7e0-4d6a-80cb-88c69c53cfb5','Contact Status Editor','Display a contact status editor','IAtom','Asi.Web.iParts.ContactManagement.ContactStatusEditor.ContactStatusEditorCommon','Asi.Web.iParts.ContactManagement.ContactStatusEditor',NULL,NULL,1,0,NULL,'~/iParts/Contact Management/ContactStatusEditor/ContactStatusEditorConfigEdit.ascx','~/iParts/Contact Management/ContactStatusEditor/ContactStatusEditorConfigEdit.ascx','~/iParts/Contact Management/ContactStatusEditor/ContactStatusEditorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Product Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2ac6eaa1-bb7b-49a3-b128-8a83d687a323','Product Display','Display details of a product','IAtom','Asi.Web.iParts.Commerce.ProductDisplay.ProductDisplayCommon','Asi.Web.iParts.Commerce.ProductDisplay',NULL,NULL,1,0,NULL,'~/iParts/Commerce/ProductDisplay/ProductDisplayEdit.ascx','~/iParts/Commerce/ProductDisplay/ProductDisplayEdit.ascx','~/iParts/Commerce/ProductDisplay/ProductDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'YouTubeVideo')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c73fea81-96d7-4cab-8d88-8edb67d32a69','YouTubeVideo','Displays a single YouTube video in a video player with configuration options to play video automatically, hide the player''s controls, and define the height and width.','IAtom','Asi.Web.iParts.Common.YouTubeVideo.YouTubeVideoCommon','Asi.Web.iParts.Common.YouTubeVideo',NULL,NULL,1,0,NULL,'~/iparts/Common/YouTubeVideo/YouTubeVideoConfigEdit.ascx','~/iparts/Common/YouTubeVideo/YouTubeVideoConfigEdit.ascx','~/iparts/Common/YouTubeVideo/YouTubeVideoDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Wiki Home')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('34d2b58a-f83d-4045-b8c5-91eb07ee6680','Wiki Home','The "home view" of a wiki.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Wiki/WikiHome.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Image Manager')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('cb4ad2cc-91ed-4a43-a161-92a4dbfa072c','Image Manager','Image manager for a community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/SmartImageManager.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Event Program Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('23fd75d4-4f14-46b3-a6d8-93514168e4aa','Event Program Display','Lists the functions associated with an event program.','IAtom','Asi.Web.iParts.Events.EventProgramDisplayCommon','Asi.Web.iParts.Events',NULL,NULL,1,0,NULL,'~/iParts/Events/Events/EventProgramDisplayConfigEdit.ascx','~/iParts/Events/Events/EventProgramDisplayConfigEdit.ascx','~/iParts/Events/Events/EventProgramDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Sidebar Helper')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('7770f7c4-a3f6-4f39-b575-93e8714a2d5f','Community Sidebar Helper','Helper control that inserts the Community Summary into the template''s sidebar.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Breadcrumb')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('df365f25-74eb-4f86-8d51-9543135e14a9','Community Breadcrumb','Displays the path to the current object as a breadcrumb.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Content Block')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('8b6b8531-03d3-43c9-9073-96c6a0261b9a','Content Block','Configurable iPart that can be used as a forum, blog, etc.','IAtom','Asi.Web.iParts.Common.ContentBlock.ContentBlockCommon','Asi.Web.iParts.Common.ContentBlock',NULL,NULL,1,0,NULL,'~/iParts/Common/ContentBlock/ContentBlockEdit.ascx','~/iParts/Common/ContentBlock/ContentBlockEdit.ascx','~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Payment Creator')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('56dcf9d5-9a83-4d70-9020-9bf43d70b601','Payment Creator','Accepts, displays, and updates payment details in preparation for checkout of a standard cart-based order or non-cart-based donation.','IAtom','Asi.Web.iParts.Commerce.PaymentCreator.PaymentCreatorCommon','Asi.Web.iParts.Commerce.PaymentCreator',NULL,NULL,1,0,NULL,'~/iParts/Commerce/PaymentCreator/PaymentCreatorConfigEdit.ascx','~/iParts/Commerce/PaymentCreator/PaymentCreatorConfigEdit.ascx','~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Gift Aid Tax Reclaim')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('77687556-43d9-4237-8fe4-9e0c8a240ba7','Gift Aid Tax Reclaim','iPart that allows reclaiming of tax','IAtom','Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidReclaimCommon','Asi.Web.iParts.Fundraising.GiftAidReclaim','','',1,0,NULL,'~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimEdit.ascx','~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimEdit.ascx','~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog Archive Entries')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('1a9e1002-a071-4861-98d4-a0ee56976a4f','Blog Archive Entries','A list of blog entries belonging to a particular archive set.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/ArchiveList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Cart Charges Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('ebd285cd-03e1-4a08-8696-a3c0b958fed7','Cart Charges Display','Display shopping cart charges','IAtom','Asi.Web.iParts.Commerce.CartChargesDisplay.CartChargesDisplayCommon','Asi.Web.iParts.Commerce.CartChargesDisplay',NULL,NULL,1,0,NULL,'~/iParts/Commerce/CartChargesDisplay/CartChargesDisplayConfigEdit.ascx','~/iParts/Commerce/CartChargesDisplay/CartChargesDisplayConfigEdit.ascx','~/iParts/Commerce/CartChargesDisplay/CartChargesDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Group List Editor')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('23244d8a-ac34-4059-98bb-a4a9400fb815','Group List Editor','Dynamically displays a list of groups, sub-groups, and/or memberships based on the value of a URL parameter.','IAtom','Asi.Web.iParts.Groups.GroupListEditor.GroupListEditorCommon','Asi.Web.iParts.Groups.GroupListEditor',NULL,NULL,1,0,NULL,'~/iParts/Groups/GroupListEditor/GroupListEditorConfigEdit.ascx','~/iParts/Groups/GroupListEditor/GroupListEditorConfigEdit.ascx','~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Profile Picture')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('dfffbedb-ad41-4070-aedb-a5ee4203fbee','Contact Profile Picture','Displays and allows setting of a contact profile picture.','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureCommon','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureEdit.ascx','~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureEdit.ascx','~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Address Selector')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('690ebb4c-cda4-41f2-9c38-a627eda68d8b','Address Selector','Display an address and allow an alternative to be selected from the address book','IAtom','Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorCommon','Asi.Web.iParts.Commerce.AddressSelector',NULL,NULL,1,0,NULL,'~/iParts/Commerce/AddressSelector/AddressSelectorConfigEdit.ascx','~/iParts/Commerce/AddressSelector/AddressSelectorConfigEdit.ascx','~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Entry List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('628ca888-e367-42d7-bb05-afc8f6e8b699','Entry List Item','A single entry in an entry listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/EntryListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Panel Collection Editor')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('5ad15cc8-f1c3-4147-b5bb-b02e93f7b0a3','Panel Collection Editor','Displays multiple Panel Editors in a tabbed interface','IAtom','Asi.Web.iParts.Common.PanelEditor.PanelCollectionEditorCommon','Asi.Web.iParts.Common.PanelEditor',NULL,NULL,1,0,NULL,'~/iparts/Common/PanelEditor/PanelCollectionEditorConfigEdit.ascx','~/iparts/Common/PanelEditor/PanelCollectionEditorConfigEdit.ascx','~/iparts/Common/PanelEditor/PanelCollectionEditorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog Home')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('43deedfa-5bc8-4843-ab2a-b1004d48dc58','Blog Home','The "home view" of an individual blog.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/BlogHome.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Recent Activity')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('16e7ead4-7c18-43e3-8012-b389ce0d2f36','Community Recent Activity','Displays recent activity for the entire community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/RecentActivity.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Donation Creator')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9aeb93f4-fed4-425f-81bd-b41abab5e6d2','Donation Creator','This content type allows users to create a donation.','IAtom','Asi.Web.iParts.Fundraising.DonationCreator.DonationCreatorCommon','Asi.Web.iParts.Fundraising.DonationCreator',NULL,NULL,1,0,NULL,'~/iParts/Fundraising/DonationCreator/DonationCreatorConfigEdit.ascx','~/iParts/Fundraising/DonationCreator/DonationCreatorConfigEdit.ascx','~/iParts/Fundraising/DonationCreator/DonationCreatorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Package Installer')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('24423843-c8a8-478e-bb70-b61d8269b8a6','Package Installer','Makes custom iParts deployable. Lets you select packages to be installed, view installed packages, and view failed installs.','IAtom','Asi.Web.iParts.PackageInstaller.PackageInstallerMain','Asi.Web.iParts.PackageInstaller','','',1,0,NULL,'~/iparts/Common/PackageInstaller/PageEdit.ascx','~/iparts/Common/PackageInstaller/PageEdit.ascx','~/iparts/Common/PackageInstaller/MainDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recent Activity')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('43fd567c-9abf-4796-b672-b64ccbbcc47c','Recent Activity','Displays a user''s recent activity in a given community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/RecentActivity.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Subscriber List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('4708f6ab-aa6e-46d5-9f87-b83213625413','Subscriber List','Lists subscribers to the current object.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/SubscriberList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Friendraising Settings')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c34133df-648b-4736-8688-bb4003fbdc7e','Friendraising Settings','This content type provides the ability to alter settings related to processing files obtained from the Friendraising service.','IAtom','Asi.Web.iParts.Fundraising.FriendraisingSettings.FriendraisingSettingsCommon','Asi.Web.iParts.Fundraising.FriendraisingSettings',NULL,NULL,1,0,NULL,'~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsConfigEdit.ascx','~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsConfigEdit.ascx','~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Content Collection Organizer')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('7af1a8e6-2955-42c9-9e0e-bbf27b4c177e','Content Collection Organizer','Displays content pages as a related group through unordered tabs or workflow-based steps.','IAtom','Asi.Web.iParts.Common.ContentCollectionOrganizer.ContentCollectionOrganizerCommon','Asi.Web.iParts.Common.ContentCollectionOrganizer',NULL,NULL,1,0,NULL,'~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerEdit.ascx','~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerEdit.ascx','~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Friendraising Mapping')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2b3279e8-b66d-4d25-8a84-bd2885ad76c7','Friendraising Mapping','This content type allows for the specification of how certain address, phone, event, and email items are related between the Friendraising service and the iMIS system.','IAtom','Asi.Web.iParts.Fundraising.FriendraisingMapping.FriendraisingMappingCommon','Asi.Web.iParts.Fundraising.FriendraisingMapping',NULL,NULL,1,0,NULL,'~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingConfigEdit.ascx','~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingConfigEdit.ascx','~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('943e5415-6118-4754-81a7-c1fdb0f8e440','Community List','The list of all available Communities.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunityList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Order Confirmation Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('a24ea544-7a8a-40f9-99e0-c5459dabd7ee','Order Confirmation Display','Displays an order confirmation following store checkout','IAtom','Asi.Web.iParts.Commerce.OrderConfirmationDisplay.OrderConfirmationDisplayCommon','Asi.Web.iParts.Commerce.OrderConfirmationDisplay',NULL,NULL,1,0,NULL,'~/iParts/Commerce/OrderConfirmationDisplay/OrderConfirmationDisplayConfigEdit.ascx','~/iParts/Commerce/OrderConfirmationDisplay/OrderConfirmationDisplayConfigEdit.ascx','~/iParts/Commerce/OrderConfirmationDisplay/OrderConfirmationDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Attachment List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('f33705a6-d682-4e2b-8140-c674edc228b8','Attachment List','The rendered list of attachments for a given item.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/AttachmentList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog Archive')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('16c5687e-2665-495c-bee3-c81b9ce5cc1f','Blog Archive','A list of blog archive links.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/Archive.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Blog Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('dd3a7ae9-cf10-42fa-90f5-c9c12443e0d3','Blog Configuration','The edit screen for blogs.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/BlogConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Friendraising Importer')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('fbdb83f9-67a9-42cf-9b86-cc931e42a04b','Friendraising Importer','Obtains transaction data from an iMIS Friendraising site, utilizing a web service, the connection details of which are set via the Friendraising Settings Content Type.','IAtom','Asi.Web.iParts.Fundraising.FriendraisingImporter.FriendraisingImporterCommon','Asi.Web.iParts.Fundraising.FriendraisingImporter',NULL,NULL,1,0,NULL,'~/iParts/Fundraising/FriendraisingImporter/FriendraisingImporterConfigEdit.ascx','~/iParts/Fundraising/FriendraisingImporter/FriendraisingImporterConfigEdit.ascx','~/iParts/Fundraising/FriendraisingImporter/FriendraisingImporterDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Entry Home')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('186e9ce9-5148-4464-9e47-cf2899b0f4ba','Entry Home','The "home view" of an individual blog entry.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/EntryHome.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Big Button Panel')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('310b0f61-e65f-4b94-8339-d880e3634037','Big Button Panel','A panel with a large image on the left and a list of links (to a Navigation Code, Content Record, or URL) on the right.','IAtom','Asi.Business.ContentManagement.ContentBigButtonPanel','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentBigButtonPanelEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentBigButtonPanelEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Security')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('29d0b616-8be4-4313-ab36-da4720d55323','Security','Manages a community''s security.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Common/Security.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recurring Donation Commitments')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('740977e3-ffb3-4b04-84b9-dda1ac611968','Recurring Donation Commitments','iPart for storing commitments for imis contacts','IAtom','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.CommitmentCommon','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment','','',1,0,NULL,'~/iparts/fundraising/RecurringDonation/Commitment/PageEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/PageEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/MainDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Common Search')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('b6365ebb-7505-4106-a182-de4dc8e39858','Common Search','Search form that can be customized to find different types of content and filter search choices and behaviors to fit different application pages.','IAtom','Asi.Web.iParts.Common.Search.SearchCommon','Asi.Web.iParts.Common.Search',NULL,NULL,1,0,NULL,'~/iParts/Common/Search/SearchConfigEdit.ascx','~/iParts/Common/Search/SearchConfigEdit.ascx','~/iParts/Common/Search/SearchDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Entry Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('6a4f107f-8803-4513-ae1f-e4b86a5aaf81','Entry Configuration','The edit screen for blog entries.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Blog/EntryConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Account Creator')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('b747d72c-f4a9-478b-a885-e8d1f501545a','Contact Account Creator','Allows creation of new contact accounts','IAtom','Asi.Web.iParts.ContactManagement.ContactAccountCreator.ContactAccountCreatorCommon','Asi.Web.iParts.ContactManagement.ContactAccountCreator',NULL,NULL,1,0,NULL,'~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorConfigEdit.ascx','~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorConfigEdit.ascx','~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Event Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('36772e20-f793-412b-b1e6-e91d68b1bee1','Event Display','Displays the details of a single event.','IAtom','Asi.Web.iParts.Events.EventDisplayCommon','Asi.Web.iParts.Events',NULL,NULL,1,0,NULL,'~/iParts/Events/Events/EventDisplayConfigEdit.ascx','~/iParts/Events/Events/EventDisplayConfigEdit.ascx','~/iParts/Events/Events/EventDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Wiki Contents')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('d9b9a4a2-723f-4cbb-8bc9-e96b79d0a1c8','Wiki Contents','The Table of Contents list for a given wiki.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Wiki/Contents.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Address')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('45a89d6e-f26b-4add-b499-ee32cf39ab19','Contact Address','Display a contact address','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactAddress','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactAddressEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactAddressEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactAddressDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Resource Library')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('a6ba36d0-a72b-4175-8eb9-f08590797ba8','Resource Library','Displays the Community Resource Library.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/ResourceLibrary.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Change Logon Password')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2144e058-1519-4d15-9970-f332586b1379','Change Logon Password','Allow the logon name and password to be updated','IAtom','Asi.Web.iParts.ContactManagement.ChangeLogonPassword.ChangeLogonPasswordCommon','Asi.Web.iParts.ContactManagement.ChangeLogonPassword','','',1,0,NULL,'~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordEdit.ascx','~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordEdit.ascx','~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Topic List Item')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('1794093b-65cc-476c-81e9-f3d8f4611f6e','Topic List Item','A single topic in a topic listing.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Forum/TopicListItem.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Community Configuration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('3dd9c5a0-533d-4c29-ae2a-f58bd1060348','Community Configuration','The edit screen for a Community.','IAtom','Asi.Business.ContentManagement.ContentItem','Asi.Business.ContentManagement',NULL,NULL,1,0,NULL,NULL,NULL,'~/AsiCommon/Controls/CommunityManagement/Community/CommunityConfigure.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Gift Aid Declaration')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('7e0fd96b-f913-4cc6-afbe-f7f6f1bccb52','Gift Aid Declaration','iPart which allows the creation/management of GAD''s','IAtom','Asi.Web.iParts.Fundraising.GiftAidDeclaration.GiftAidDeclarationCommon','Asi.Web.iParts.Fundraising.GiftAidDeclaration','','',1,0,NULL,'~/iparts/fundraising/giftaid/declaration/PageEdit.ascx','~/iparts/fundraising/giftaid/declaration/PageEdit.ascx','~/iparts/fundraising/giftaid/declaration/MainDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Communities')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('78211694-8781-45ae-a9ce-fb536a96bc78','Contact Communities','Display a list of communities that the contact belongs too.','IAtom','Asi.Web.iParts.ContactManagement.ContactCommunities.ContactCommunitiesCommon','Asi.Web.iParts.ContactManagement.ContactCommunities','','',1,0,NULL,'~/iParts/Contact Management/ContactCommunities/ContactCommunitiesEdit.ascx','~/iParts/Contact Management/ContactCommunities/ContactCommunitiesEdit.ascx','~/iParts/Contact Management/ContactCommunities/ContactCommunitiesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recurring Donation Commitments Public View')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('90bd61c4-b33b-4bc7-b639-fdb3da2e4892','Recurring Donation Commitments Public View','Public view commitment iPart','IAtom','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.CommitmentPublicViewCommon','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment','','',1,0,NULL,'~/iparts/fundraising/RecurringDonation/Commitment/PublicViewEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/PublicViewEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/PublicViewDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Mini Group List Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9e57bbcb-e626-48e5-bb84-ff247ce4ee86','Mini Group List Display','Display a mini group list','IAtom','Asi.Web.iParts.ContactManagement.MiniGroupListDisplay.MiniGroupListDisplayCommon','Asi.Web.iParts.ContactManagement.MiniGroupListDisplay',NULL,NULL,1,0,NULL,'~/iParts/Contact Management/MiniGroupListDisplay/MiniGroupListDisplayConfigEdit.ascx','~/iParts/Contact Management/MiniGroupListDisplay/MiniGroupListDisplayConfigEdit.ascx','~/iParts/Contact Management/MiniGroupListDisplay/MiniGroupListDisplayDisplay.ascx',NULL)
END

go

SET NOCOUNT OFF
go

