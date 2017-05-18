SET NOCOUNT ON


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Status')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('71404d61-ad9b-44cf-8f50-0484a2d3bdf2','Contact Status','Display contact status, type and paid thru','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactStatus','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactStatusEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactStatusEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactStatusDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'File Importer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9902587a-5754-41d7-b397-08e601d46b07','File Importer For Web Services','Generic file importer iPart for SOA.  It can be used to convert data into an appropriate DataContract/ XML format for SOA to work with.','IAtom','Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesCommon','Asi.Web.iParts.Common.FileImporterForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesEdit.ascx','~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesEdit.ascx','~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentHtml')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('9e4d9a3e-0acf-4950-aea7-12639ad2a6d8','ContentHtml','HTML Content, such as the body of a blog post or a newsletter.','IAtom','Asi.Business.ContentManagement.ContentHtml','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentHtmlEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentHtmlEdit.ascx','~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact UD Panel Collection')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('b19272a9-1dce-4e16-82f8-1db9406d703e','Contact UD Panel Collection','Display of contact user defined panels','IAtom','Asi.Web.iParts.ContactManagement.ContactUDPanelCollection.ContactUDPanelCollectionCommon','Asi.Web.iParts.ContactManagement.ContactUDPanelCollection','','',1,0,NULL,'~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelCollectionEdit.ascx','~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelCollectionEdit.ascx','~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelCollectionDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Order Confirmation')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('ae08d736-6ae5-46a5-9f35-2a2c88f3a278','Order Confirmation','Displays an order confirmation following store checkout','IAtom','Asi.Web.iParts.Commerce.OrderConfirmation.OrderConfirmationCommon','Asi.Web.iParts.Commerce.OrderConfirmation',NULL,NULL,1,0,NULL,'~/iParts/Commerce/OrderConfirmation/OrderConfirmationConfigEdit.ascx','~/iParts/Commerce/OrderConfirmation/OrderConfirmationConfigEdit.ascx','~/iParts/Commerce/OrderConfirmation/OrderConfirmationDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'File Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('f1ef44a4-ab91-4464-a15f-2ccf77a50229','File Viewer For Web Services','iPart for viewing and processing (importing) XML files via SOA.','IAtom','Asi.Web.iParts.Common.FileViewerForWebServices.FileViewerForWebServicesCommon','Asi.Web.iParts.Common.FileViewerForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesEdit.ascx','~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesEdit.ascx','~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Product Display List')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e2e93186-e9e8-4f33-a902-3248c89c14f3','Product Display List','List products using an IQA Query and control which properties are displayed','IAtom','Asi.Web.iParts.Commerce.ProductDisplayList.ProductDisplayListCommon','Asi.Web.iParts.Commerce.ProductDisplayList','','',1,0,NULL,'~/iParts/Commerce/ProductDisplayList/ProductDisplayListEdit.ascx','~/iParts/Commerce/ProductDisplayList/ProductDisplayListEdit.ascx','~/iParts/Commerce/ProductDisplayList/ProductDisplayListDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Query Menu')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('83819433-1ee7-43b9-a32c-392451b713d9','Query Menu','Displays query results in an inline grid. The list of available queries is retrieved from a document system folder, and presented in a pop-up menu.','IAtom','Asi.Web.iParts.Common.QueryMenu.QueryMenuCommon','Asi.Web.iParts.Common.QueryMenu','','',1,0,NULL,'~/iparts/Common/QueryMenu/QueryMenuEdit.ascx','~/iparts/Common/QueryMenu/QueryMenuEdit.ascx','~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recurring Donation Expected Payments')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('bba747c7-c3c6-4477-961c-40cdbe242675','Recurring Donation Expected Payments','iPart used to generate expected payments from existing commitments','IAtom','Asi.Web.iParts.Fundraising.RecurringDonation.ExpectedPayments.ExpectedPaymentsCommon','Asi.Web.iParts.Fundraising.RecurringDonation.ExpectedPayments',NULL,NULL,1,0,NULL,'~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsEdit.ascx','~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsEdit.ascx','~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Log Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e54feb64-8a29-4242-8439-429b265d7789','Log Viewer For Web Services','iPart to allow viewing of SOA import log files','IAtom','Asi.Web.iParts.Common.LogViewerForWebServices.LogViewerForWebServicesCommon','Asi.Web.iParts.Common.LogViewerForWebServices',NULL,NULL,1,0,NULL,'~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesConfigEdit.ascx','~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesConfigEdit.ascx','~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentWebUserControl')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e6133c9d-86f1-497a-a648-4f128aec32c9','ContentWebUserControl','A custom Web User Control.','IAtom','Asi.Business.ContentManagement.ContentWebUserControl','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentWebUserControlEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentWebUserControlEdit.ascx',NULL,NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentTaggedList')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('4ceede36-3a38-479e-8afd-5b42cde4d7b1','ContentTaggedList','A dynamically generated list of content.','IAtom','Asi.Business.ContentManagement.ContentTaggedList','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentTaggedListEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentTaggedListEdit.ascx','~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Submit Order')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c4f268a5-7359-4b4a-bddc-5e17cdb0b6f1','Submit Order','Submit the current order in the cart and complete store checkout','IAtom','Asi.Web.iParts.Commerce.SubmitOrder.SubmitOrderCommon','Asi.Web.iParts.Commerce.SubmitOrder',NULL,NULL,1,0,NULL,'~/iParts/Commerce/SubmitOrder/SubmitOrderConfigEdit.ascx','~/iParts/Commerce/SubmitOrder/SubmitOrderConfigEdit.ascx','~/iParts/Commerce/SubmitOrder/SubmitOrderDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Name')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2f042870-16c6-45ca-90c5-777560a9ca98','Contact Name','Display contact name','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactName','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactNameEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactNameEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactNameDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'AdvancedSearch')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('4bcf89cd-cbd5-4fa4-bdef-790466a7e885','AdvancedSearch','An advanced search form that allows users to enter specific metadata (such as date ranges, user defined field values, and tags/tag groups) to further filter their search results.','IAtom','Asi.Business.ContentManagement.AdvancedSearch','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/AdvancedSearchProperties.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/AdvancedSearchProperties.ascx','~/AsiCommon/Controls/ContentManagement/SearchForm.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Mini Profile')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('ae957adf-092e-43a4-ae6e-88a80b0785bf','Contact Mini Profile','Display brief member information and committee/chapter membership','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactMiniProfileCommon','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Product Display')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2ac6eaa1-bb7b-49a3-b128-8a83d687a323','Product Display','Display details of a product','IAtom','Asi.Web.iParts.Commerce.ProductDisplay.ProductDisplayCommon','Asi.Web.iParts.Commerce.ProductDisplay',NULL,NULL,1,0,NULL,'~/iParts/Commerce/ProductDisplay/ProductDisplayEdit.ascx','~/iParts/Commerce/ProductDisplay/ProductDisplayEdit.ascx','~/iParts/Commerce/ProductDisplay/ProductDisplayDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentFile')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('50ed295e-cd5c-4df1-9367-8f3fcc43fa44','ContentFile','A downloadable file (such as an attachment).','IAtom','Asi.Business.ContentManagement.ContentFile','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentFileEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentFileEdit.ascx','~/AsiCommon/Controls/ContentManagement/DisplayFile.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Content Block')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('8b6b8531-03d3-43c9-9073-96c6a0261b9a','Content Block','Configurable iPart that can be used as a forum, blog, etc.','IAtom','Asi.Web.iParts.Common.ContentBlock.ContentBlockCommon','Asi.Web.iParts.Common.ContentBlock',NULL,NULL,1,0,NULL,'~/iParts/Common/ContentBlock/ContentBlockEdit.ascx','~/iParts/Common/ContentBlock/ContentBlockEdit.ascx','~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentReference')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c6238ee4-77a3-4668-aaf2-9c32309f3abb','ContentReference','A Reference to another content item.','IAtom','Asi.Business.ContentManagement.ContentReference','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentReferenceEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentReferenceEdit.ascx','~/AsiCommon/Controls/ContentManagement/DisplayReference.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Gift Aid Tax Reclaim')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('77687556-43d9-4237-8fe4-9e0c8a240ba7','Gift Aid Tax Reclaim','iPart that allows reclaiming of tax','IAtom','Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidReclaimCommon','Asi.Web.iParts.Fundraising.GiftAidReclaim','','',1,0,NULL,'~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimEdit.ascx','~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimEdit.ascx','~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact UD Panel')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('fd29f4fa-a90c-4d2f-bad3-a000e52baa72','Contact UD Panel','Display and allow editing of contact user defined field data','IAtom','Asi.Web.iParts.ContactManagement.ContactUDPanelCollection.ContactUDPanelCommon','Asi.Web.iParts.ContactManagement.ContactUDPanelCollection','','',1,0,NULL,'~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelEdit.ascx','~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelEdit.ascx','~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Profile Picture')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('dfffbedb-ad41-4070-aedb-a5ee4203fbee','Contact Profile Picture','Displays and allows setting of a contact profile picture.','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureCommon','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureEdit.ascx','~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureEdit.ascx','~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentLink')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c49a6102-d390-4185-bd23-ad014bd23da8','ContentLink','A web link.','IAtom','Asi.Business.ContentManagement.ContentLink','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentLinkEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentLinkEdit.ascx','~/AsiCommon/Controls/ContentManagement/displaylink.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'ContentPageBreak')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('777b4f40-53c6-4394-8ee4-b15ea033b66b','ContentPageBreak','Inserts a page break into the content record.','IAtom','Asi.Business.ContentManagement.ContentPageBreak','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentPageBreakEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentPageBreakEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentPage.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Package Installer')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('24423843-c8a8-478e-bb70-b61d8269b8a6','Package Installer','Package installer','IAtom','Asi.Web.iParts.PackageInstaller.PackageInstallerMain','Asi.Web.iParts.PackageInstaller','','',1,0,NULL,'~/AsiCommon/Controls/PackageInstaller/PageEdit.ascx','~/AsiCommon/Controls/PackageInstaller/PageEdit.ascx','~/AsiCommon/Controls/PackageInstaller/MainDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Friendraising Settings')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('c34133df-648b-4736-8688-bb4003fbdc7e','Friendraising Settings','This content type provides the ability to alter settings related to processing files obtained from the Friendraising service.','IAtom','Asi.Web.iParts.Fundraising.FriendraisingSettings.FriendraisingSettingsCommon','Asi.Web.iParts.Fundraising.FriendraisingSettings',NULL,NULL,1,0,NULL,'~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsConfigEdit.ascx','~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsConfigEdit.ascx','~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Friendraising Mapping')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2b3279e8-b66d-4d25-8a84-bd2885ad76c7','Friendraising Mapping','This content type allows for the specification of how certain address, phone, event, and email items are related between the Friendraising service and the iMIS system.','IAtom','Asi.Web.iParts.Fundraising.FriendraisingMapping.FriendraisingMappingCommon','Asi.Web.iParts.Fundraising.FriendraisingMapping',NULL,NULL,1,0,NULL,'~/iParsts/Fundraising/FriendraisingMapping/FriendraisingMappingConfigEdit.ascx','~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingConfigEdit.ascx','~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Payment Details')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('e2c99dc0-1a13-4bb6-aa4b-d4dca8911e6e','Payment Details','Display and enter payments details for store checkout','IAtom','Asi.Web.iParts.Commerce.PaymentDetails.PaymentDetailsCommon','Asi.Web.iParts.Commerce.PaymentDetails',NULL,NULL,1,0,NULL,'~/iParts/Commerce/PaymentDetails/PaymentDetailsConfigEdit.ascx','~/iParts/Commerce/PaymentDetails/PaymentDetailsConfigEdit.ascx','~/iParts/Commerce/PaymentDetails/PaymentDetailsDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Big Button Panel')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('310b0f61-e65f-4b94-8339-d880e3634037','Big Button Panel','A panel with a large image on the left and a list of links (to a Navigation Code, Content Record, or URL) on the right.','IAtom','Asi.Business.ContentManagement.ContentBigButtonPanel','Asi.Business.ContentManagement','','',1,0,NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentBigButtonPanelEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentBigButtonPanelEdit.ascx','~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Recurring Donation Commitments')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('740977e3-ffb3-4b04-84b9-dda1ac611968','Recurring Donation Commitments','iPart for storing commitments for imis contacts','IAtom','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.CommitmentCommon','Asi.Web.iParts.Fundraising.RecurringDonation.Commitment','','',1,0,NULL,'~/iparts/fundraising/RecurringDonation/Commitment/PageEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/PageEdit.ascx','~/iparts/fundraising/RecurringDonation/Commitment/MainDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Cart Summary')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('73e92006-bb17-4dda-9c8d-ed2c11f85d3c','Cart Summary','Display a summary of the order in the cart','IAtom','Asi.Web.iParts.Commerce.CartSummary.CartSummaryCommon','Asi.Web.iParts.Commerce.CartSummary',NULL,NULL,1,0,NULL,'~/iParts/Commerce/CartSummary/CartSummaryEdit.ascx','~/iParts/Commerce/CartSummary/CartSummaryEdit.ascx','~/iParts/Commerce/CartSummary/CartSummaryDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Contact Address')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('45a89d6e-f26b-4add-b499-ee32cf39ab19','Contact Address','Display a contact address','IAtom','Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactAddress','Asi.Web.iParts.ContactManagement.ContactMiniProfile','','',1,0,NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactAddressEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactAddressEdit.ascx','~/iParts/Contact Management/ContactMiniProfile/ContactAddressDisplay.ascx',NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[ComponentRegistry] WHERE [InterfaceName] = 'IAtom' AND [Name] = 'Change Logon Password')
BEGIN
    INSERT INTO [dbo].[ComponentRegistry] ([ComponentKey], [Name], [Description], [InterfaceName], [TypeName], [AssemblyName], 
                                                 [ConfigureWebUserControl], [ConfigureWindowsControl], [IsTyped], [IsBusinessItem], [ComponentSummaryContentKey],
                                                 [ComponentNewLink], [ComponentEditLink], [ComponentExecuteLink], [DeploymentPackageCode])
    VALUES ('2144e058-1519-4d15-9970-f332586b1379','Change Logon Password','Allow the logon name and password to be updated','IAtom','Asi.Web.iParts.ContactManagement.ChangeLogonPassword.ChangeLogonPasswordCommon','Asi.Web.iParts.ContactManagement.ChangeLogonPassword','','',1,0,NULL,'~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordEdit.ascx','~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordEdit.ascx','~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordDisplay.ascx',NULL)
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

go

SET NOCOUNT OFF
go

