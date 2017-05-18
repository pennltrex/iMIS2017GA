SET NOCOUNT ON


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Change Logon Password')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('79176926-3150-4937-b033-00f48fa092c3','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Change Logon Password','Allow the logon name and password to be updated',NULL,'~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Product Display List')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('bdbc4433-e3f7-43de-8239-16ceb951e5b2','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Product Display List','List products using an IQA Query and control which properties are displayed',NULL,'~/iParts/Commerce/ProductDisplayList/ProductDisplayListDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'File Importer For Web Services')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('af35eb60-98b6-44b5-898e-1f6eed77c4f0','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','File Importer For Web Services','Generic file importer iPart for SOA.  It can be used to convert data into an appropriate DataContract/ XML format for SOA to work with.',NULL,'~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Recurring Donation Commitments Public View')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('2d48ed96-f0e9-4701-91cd-1fba41d0e8e9','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Recurring Donation Commitments Public View','Public view commitment iPart',NULL,'~/iparts/fundraising/RecurringDonation/Commitment/PublicViewDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Friendraising Mapping')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('46eea5fc-0be3-4e6f-923d-267f26da834f','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Friendraising Mapping','This content type allows for the specification of how certain address, phone, event, and email items are related between the Friendraising service and the iMIS system.',NULL,'~/iParts/Fundraising/FriendraisingMapping/FriendraisingMappingDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Communities')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('fb1b39f8-54fc-43ea-a0e4-41a68ba24943','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Communities','Display a list of communities that the contact belongs too.',NULL,'~/iParts/Contact Management/ContactCommunities/ContactCommunitiesDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Mini Profile')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('6de903a2-6e64-49e1-89be-455ce2341c47','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Mini Profile','Display brief member information and committee/chapter membership',NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Submit Order')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('b37be990-4947-4eae-bf21-605215e72110','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Submit Order','Submit the current order in the cart and complete store checkout',NULL,'~/iParts/Commerce/SubmitOrder/SubmitOrderDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Friendraising Settings')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('22da4d93-32d9-444f-92eb-709c9c583a93','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Friendraising Settings','This content type provides the ability to alter settings related to processing files obtained from the Friendraising service.',NULL,'~/iParts/Fundraising/FriendraisingSettings/FriendraisingSettingsDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentFile')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('99115ac7-ad11-470a-9577-77c32b6ecdb1','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentFile','A downloadable file (such as an attachment).',NULL,'~/AsiCommon/Controls/ContentManagement/DisplayFile.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Cart Summary')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('6f7f8e9f-53e2-4054-a076-781bc7a6d4bb','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Cart Summary','Display a summary of the order in the cart',NULL,'~/iParts/Commerce/CartSummary/CartSummaryDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Package Installer')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('4504762b-7aa5-46d4-b017-7b6b6496685a','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Package Installer','Package installer',NULL,'~/AsiCommon/Controls/PackageInstaller/MainDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Content Block')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('3c0c2d93-7bab-4e1a-a6ac-80a96452aae1','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Content Block','Configurable iPart that can be used as a forum, blog, etc.',NULL,'~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Status')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('d766bb12-f8ae-4a1e-a690-80c1b15215a4','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Status','Display contact status, type and paid thru',NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactStatusDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentWebUserControl')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('d5099544-5192-49c9-afe9-9b1c1fb81853','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentWebUserControl','A custom Web User Control.',NULL,NULL)
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Profile Picture')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('5956b39f-386d-497b-85fd-a42508a6b7d9','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Profile Picture','Displays and allows setting of a contact profile picture.',NULL,'~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentLink')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('8dfb5565-9108-4b71-b6c0-aa064a5cd45d','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentLink','A web link.',NULL,'~/AsiCommon/Controls/ContentManagement/displaylink.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Order Confirmation')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('731c6a8c-51e9-49b9-a8fe-abab3f94f3b9','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Order Confirmation','Displays an order confirmation following store checkout',NULL,'~/iParts/Commerce/OrderConfirmation/OrderConfirmationDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact UD Panel')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('09c2e71d-b556-46d2-a1f7-ad4d759d6bf0','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact UD Panel','Display and allow editing of contact user defined field data',NULL,'~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Product Display')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('308c4436-bdc4-4807-9415-b0f13392bbd9','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Product Display','Display details of a product',NULL,'~/iParts/Commerce/ProductDisplay/ProductDisplayDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Recurring Donation Expected Payments')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('5e39161d-0373-4315-8f77-bc8129bc0ad8','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Recurring Donation Expected Payments','iPart used to generate expected payments from existing commitments',NULL,'~/iparts/fundraising/RecurringDonation/ExpectedPayments/ExpectedPaymentsDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentPageBreak')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('e85a219f-7680-4748-b220-c6e39205dbab','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentPageBreak','Inserts a page break into the content record.',NULL,'~/AsiCommon/Controls/ContentManagement/ContentPage.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentTaggedList')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('6aac56f8-eabb-4c14-9f73-cadee9b40c7d','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentTaggedList','A dynamically generated list of content.',NULL,'~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'AdvancedSearch')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('9ca44c54-9513-4af3-b7a7-d25178b6400a','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','AdvancedSearch','An advanced search form that allows users to enter specific metadata (such as date ranges, user defined field values, and tags/tag groups) to further filter their search results.',NULL,'~/AsiCommon/Controls/ContentManagement/SearchForm.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Recurring Donation Commitments')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('dd730a10-ac19-49dc-9dd8-d3c7e852ddb6','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Recurring Donation Commitments','iPart for storing commitments for imis contacts',NULL,'~/iparts/fundraising/RecurringDonation/Commitment/MainDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentHtml')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('966e84ee-6683-44ba-b95e-d4b90327cb75','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentHtml','HTML Content, such as the body of a blog post or a newsletter.',NULL,'~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Address')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('7536f6f4-5c9a-4143-9288-d548e05a2609','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Address','Display a contact address',NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactAddressDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Big Button Panel')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('9f7e7ffe-3e61-45b9-9928-d92740825bb1','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Big Button Panel','A panel with a large image on the left and a list of links (to a Navigation Code, Content Record, or URL) on the right.',NULL,'~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact UD Panel Collection')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('712cc445-5456-49ab-aa9e-df1561f9448a','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact UD Panel Collection','Display of contact user defined panels',NULL,'~/iParts/Contact Management/ContactUDPanelCollection/ContactUDPanelCollectionDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'ContentReference')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('b8617d76-3f8a-4c8b-ac3e-e79db2654a40','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','ContentReference','A Reference to another content item.',NULL,'~/AsiCommon/Controls/ContentManagement/DisplayReference.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Gift Aid Tax Reclaim')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('0d33c7ae-8bf4-4bda-9b56-eba75dd3decd','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Gift Aid Tax Reclaim','iPart that allows reclaiming of tax',NULL,'~/iparts/fundraising/giftaid/reclaim/GiftAidReclaimDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Gift Aid Declaration')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('e569790f-4c11-4262-be84-f06421e2772a','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Gift Aid Declaration','iPart which allows the creation/management of GAD''s',NULL,'~/iparts/fundraising/giftaid/declaration/MainDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Query Menu')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('b23cbd68-d9fe-48c7-8802-f3c243d0bc1d','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Query Menu','Displays query results in an inline grid. The list of available queries is retrieved from a document system folder, and presented in a pop-up menu.',NULL,'~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'File Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('299a4fd4-51a0-45b4-809b-f3ead2e182ab','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','File Viewer For Web Services','iPart for viewing and processing (importing) XML files via SOA.',NULL,'~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Contact Name')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('d46c5bab-7492-4b56-b335-f462083e93e1','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Contact Name','Display contact name',NULL,'~/iParts/Contact Management/ContactMiniProfile/ContactNameDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Log Viewer For Web Services')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('8ded80d8-f5f2-4801-b49b-f6bd43f11220','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Log Viewer For Web Services','iPart to allow viewing of SOA import log files',NULL,'~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesDisplay.ascx')
END


IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryEntryRef] WHERE [WebPartName] = 'Payment Details')
BEGIN
    INSERT INTO [dbo].[WebPartGalleryEntryRef] ([WebPartGalleryEntryKey], [WebPartGalleryKey], [WebPartName], 
                                                [WebPartDescription], [WebPartTypeName], [WebUserControlPath])
    VALUES ('d4534997-988d-45bf-abfc-f930f72b1d6a','94094ecc-77cc-4d94-8a91-3d91b17c6f3b','Payment Details','Display and enter payments details for store checkout',NULL,'~/iParts/Commerce/PaymentDetails/PaymentDetailsDisplay.ascx')
END

go

SET NOCOUNT OFF
go

