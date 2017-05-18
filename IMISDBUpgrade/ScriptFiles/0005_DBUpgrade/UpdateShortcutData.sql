SET NOCOUNT ON


IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '7ee4b712-61a1-4c25-90e2-011d937139a5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('7ee4b712-61a1-4c25-90e2-011d937139a5', '/EventDashboard', '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard', NULL, 'a8ab6743-9dda-41f7-9aa2-7a681a203082', 'Used for displaying an event.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b6443d6d-2a1c-4710-a646-039d21a49628')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b6443d6d-2a1c-4710-a646-039d21a49628', '/GroupDetail', '@/iCore/Groups/Group_Detail', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '811ad534-57fb-446a-990b-87771ab54ffc', 'Used for displaying group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GroupDetail', URL = '@/iCore/Groups/Group_Detail', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '811ad534-57fb-446a-990b-87771ab54ffc', URLMappingDesc = 'Used for displaying group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b6443d6d-2a1c-4710-a646-039d21a49628'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5576d388-7ad5-4cb1-ba29-055df4fe3a1b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5576d388-7ad5-4cb1-ba29-055df4fe3a1b', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', NULL, '9829e708-688c-4c69-87de-feac9e549a2b', 'Used for displaying the account page of an organization which the user can edit.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'd758b070-de95-471a-8e0e-067b6902b35a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('d758b070-de95-471a-8e0e-067b6902b35a', '/EventDashboard', '@/iSamples/MemberR/Event_Display', '77c6bf57-1505-456c-a3e9-8473532388ea', 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', 'Displays a simple event page, instead of the full dashboard in the responsive site', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iSamples/MemberR/Event_Display', WebsiteDocumentVersionKey = '77c6bf57-1505-456c-a3e9-8473532388ea', TargetDocumentVersionKey = 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', URLMappingDesc = 'Displays a simple event page, instead of the full dashboard in the responsive site', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'd758b070-de95-471a-8e0e-067b6902b35a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1094d687-1c5b-45db-bc5a-06e737472291')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1094d687-1c5b-45db-bc5a-06e737472291', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', NULL, 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c7cd384d-4bb3-49a1-a36a-082740764bba')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c7cd384d-4bb3-49a1-a36a-082740764bba', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '9829e708-688c-4c69-87de-feac9e549a2b', 'Used for displaying the account page of an organization which the user can edit.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '9829e708-688c-4c69-87de-feac9e549a2b', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'c7cd384d-4bb3-49a1-a36a-082740764bba'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '22f1fe3a-0794-45ee-bf02-09293a162527')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('22f1fe3a-0794-45ee-bf02-09293a162527', '/StaffFindContacts', '@/iCore/Contacts/Directory', NULL, '849db2b5-0548-41cd-9198-6c04b9e0e2cc', 'Used in the Staff site Community area to find contacts.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '01d0d0aa-daaa-4364-84ec-0aaae320f810')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('01d0d0aa-daaa-4364-84ec-0aaae320f810', '/Cart', '@/iCore/Store/StoreLayouts/Cart_Home', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '13a311ee-4be3-4a28-93ed-73ebe8ca5086', 'Used to display cart.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Cart', URL = '@/iCore/Store/StoreLayouts/Cart_Home', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086', URLMappingDesc = 'Used to display cart.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '01d0d0aa-daaa-4364-84ec-0aaae320f810'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '989c9068-7d38-42bb-be0c-0be137d70d16')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('989c9068-7d38-42bb-be0c-0be137d70d16', '/SignIn', '@/iSamples/Mobile/Contact_Management/Sign_In', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '7809fb90-f560-462f-8355-e9a1de3d0c63', 'Used for signing in.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignIn', URL = '@/iSamples/Mobile/Contact_Management/Sign_In', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '7809fb90-f560-462f-8355-e9a1de3d0c63', URLMappingDesc = 'Used for signing in.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '989c9068-7d38-42bb-be0c-0be137d70d16'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0f19c34b-dd34-4204-aa2f-0c2333a4ea78')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0f19c34b-dd34-4204-aa2f-0c2333a4ea78', '/AddItem', '@/iCore/Store/Manage/Add_Item', NULL, '562ea02f-a356-4294-997b-18cb92a41377', 'Used when adding an item.', '', 40)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AddItem', URL = '@/iCore/Store/Manage/Add_Item', WebsiteDocumentVersionKey = NULL, TargetDocumentVersionKey = '562ea02f-a356-4294-997b-18cb92a41377', URLMappingDesc = 'Used when adding an item.', URLParameters = '', URLMappingTypeCode = 40
    WHERE URLMappingKey = '0f19c34b-dd34-4204-aa2f-0c2333a4ea78'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9995b9df-b9f5-4d42-b76c-119febba2878')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9995b9df-b9f5-4d42-b76c-119febba2878', '/Search', '@/iCore/Content/Search', NULL, '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3028b9a2-44cb-4298-bb1c-11f1f2122e6e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3028b9a2-44cb-4298-bb1c-11f1f2122e6e', '/AdminConsole', '~/iParts/Common/AdminConsole/AdminConsoleHost.aspx', NULL, NULL, 'Used for displaying the page that hosts the RDP control for accessing the Admin Console.', '', 40)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AdminConsole', URL = '~/iParts/Common/AdminConsole/AdminConsoleHost.aspx', WebsiteDocumentVersionKey = NULL, TargetDocumentVersionKey = NULL, URLMappingDesc = 'Used for displaying the page that hosts the RDP control for accessing the Admin Console.', URLParameters = '', URLMappingTypeCode = 40
    WHERE URLMappingKey = '3028b9a2-44cb-4298-bb1c-11f1f2122e6e'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ed517075-dd22-4b11-b10e-14066ee7cb68')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ed517075-dd22-4b11-b10e-14066ee7cb68', '/GiveNow', '@/iCore/Fundraising/Donate_Now', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '991d8973-6ade-4ac5-aef3-c34945a8641a', 'Used for displaying the give now page.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiveNow', URL = '@/iCore/Fundraising/Donate_Now', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '991d8973-6ade-4ac5-aef3-c34945a8641a', URLMappingDesc = 'Used for displaying the give now page.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'ed517075-dd22-4b11-b10e-14066ee7cb68'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9f4f93cb-fce0-4b26-8bc0-1450e96778c3')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9f4f93cb-fce0-4b26-8bc0-1450e96778c3', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiftDetail', URL = '@/iCore/Fundraising/Gift_Detail', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', URLMappingDesc = 'Used for displaying a fundraising item.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '9f4f93cb-fce0-4b26-8bc0-1450e96778c3'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3e11bb2b-c15b-4aa5-b58a-14958e82ddd2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3e11bb2b-c15b-4aa5-b58a-14958e82ddd2', '/EventEdit', '@/iCore/Events/Event_Edit', NULL, '99580240-5ced-40f0-99ed-08b5644c1a87', 'Used when editing or adding an event.', '', 40)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventEdit', URL = '@/iCore/Events/Event_Edit', WebsiteDocumentVersionKey = NULL, TargetDocumentVersionKey = '99580240-5ced-40f0-99ed-08b5644c1a87', URLMappingDesc = 'Used when editing or adding an event.', URLParameters = '', URLMappingTypeCode = 40
    WHERE URLMappingKey = '3e11bb2b-c15b-4aa5-b58a-14958e82ddd2'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5de0f2fb-de4b-4f43-aaf0-15978b128d26')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5de0f2fb-de4b-4f43-aaf0-15978b128d26', '/OrganizationJoin', '@/iCore/Membership/Organization_Join', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '4050b11e-b1fe-4fe2-ba90-f5c61e3b6e00', 'Used for displaying the organization join as a member page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5da09f7b-93e7-47da-9e0b-171c407a24ee')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5da09f7b-93e7-47da-9e0b-171c407a24ee', '/Search', '@/iCore/Content/SearchLite', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', 'd28b94af-7d1a-4f01-916c-2633fedc4e8a', 'Used for displaying search results.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/SearchLite', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = 'd28b94af-7d1a-4f01-916c-2633fedc4e8a', URLMappingDesc = 'Used for displaying search results.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '5da09f7b-93e7-47da-9e0b-171c407a24ee'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a76b7991-dbf9-41f6-84b7-1773dbfb4eb6')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a76b7991-dbf9-41f6-84b7-1773dbfb4eb6', '/SignIn', '@/iCore/Contacts/Sign_In', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', 'Used for signing in.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignIn', URL = '@/iCore/Contacts/Sign_In', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', URLMappingDesc = 'Used for signing in.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a76b7991-dbf9-41f6-84b7-1773dbfb4eb6'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '04ff3146-7b15-4159-9317-187f1eb4aa2f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('04ff3146-7b15-4159-9317-187f1eb4aa2f', '/StaffCommunityLanding', '@/iCore/Staff_Dashboards/Community/Community _dashboard', NULL, 'b8bd531c-d507-49fc-9478-4bdeada5a869', 'Landing page for the Community area of the Staff site.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '547eff6b-9e48-4679-affd-19ed2344f97d')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('547eff6b-9e48-4679-affd-19ed2344f97d', '/GroupDetail', '@/iCore/Groups/Group_Detail', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '811ad534-57fb-446a-990b-87771ab54ffc', 'Used for displaying group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GroupDetail', URL = '@/iCore/Groups/Group_Detail', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '811ad534-57fb-446a-990b-87771ab54ffc', URLMappingDesc = 'Used for displaying group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '547eff6b-9e48-4679-affd-19ed2344f97d'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c1d9c662-f500-41f4-8f16-1c638e38c006')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c1d9c662-f500-41f4-8f16-1c638e38c006', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignInCreateAccount', URL = '@/iCore/Contacts/Create_Account_no_Sign_In', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363', URLMappingDesc = 'Used for creating a new account from the Sign In ipart.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'c1d9c662-f500-41f4-8f16-1c638e38c006'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '17e65f79-0645-49f1-9278-1ff89c2a36f3')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('17e65f79-0645-49f1-9278-1ff89c2a36f3', '/Profile', '@/iSamples/AnnualConferenceMobile/Profile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '04585f04-4bc2-4d43-9d57-09405bcc0503', 'Used for displaying a limited profile of a user.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Profile', URL = '@/iSamples/AnnualConferenceMobile/Profile', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '04585f04-4bc2-4d43-9d57-09405bcc0503', URLMappingDesc = 'Used for displaying a limited profile of a user.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '17e65f79-0645-49f1-9278-1ff89c2a36f3'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '11b008b8-ae55-48ac-aa4b-21c93ec35465')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('11b008b8-ae55-48ac-aa4b-21c93ec35465', '/OrganizationJoin', '@/iCore/Membership/Organization_Join', NULL, '4050b11e-b1fe-4fe2-ba90-f5c61e3b6e00', 'Used for displaying the organization join as a member page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8683974c-4173-4210-a009-223b1af3a2b8')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8683974c-4173-4210-a009-223b1af3a2b8', '/EventDashboard', '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'a8ab6743-9dda-41f7-9aa2-7a681a203082', 'Used for displaying an event dashboard.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'a8ab6743-9dda-41f7-9aa2-7a681a203082', URLMappingDesc = 'Used for displaying an event dashboard.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '8683974c-4173-4210-a009-223b1af3a2b8'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'e6cf5ad7-38b4-4239-946e-26145bc99911')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('e6cf5ad7-38b4-4239-946e-26145bc99911', '/ItemDetail', '@/iCore/Store/StoreLayouts/Item_Detail', NULL, '44d850e7-d388-4bd1-866a-bc5ad6ed80af', 'Used for displaying an item.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0573ccb6-c2e5-41fd-8e89-2849630afdbd')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0573ccb6-c2e5-41fd-8e89-2849630afdbd', '/CreateCommunication', '@/iCore/Communications/Create_Communication', NULL, 'ce95310d-5cf9-49da-8acd-6ac991e6ee25', 'Used to create and manage communications.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '909fb7f3-b5b0-43ca-b894-28f0661c884d')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('909fb7f3-b5b0-43ca-b894-28f0661c884d', '/Cart', '@/iCore/Store/StoreLayouts/Cart_Home', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '13a311ee-4be3-4a28-93ed-73ebe8ca5086', 'Used to display cart.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Cart', URL = '@/iCore/Store/StoreLayouts/Cart_Home', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086', URLMappingDesc = 'Used to display cart.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '909fb7f3-b5b0-43ca-b894-28f0661c884d'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '89b2efdb-882e-4299-ada0-296994ed60bc')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('89b2efdb-882e-4299-ada0-296994ed60bc', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '9829e708-688c-4c69-87de-feac9e549a2b', 'Used for displaying the account page of an organization which the user can edit.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '9829e708-688c-4c69-87de-feac9e549a2b', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '89b2efdb-882e-4299-ada0-296994ed60bc'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '57ce8c38-f34c-4bfe-81a1-2b329c1d516a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('57ce8c38-f34c-4bfe-81a1-2b329c1d516a', '/Search', '@/iCore/Content/Search', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying search results.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '57ce8c38-f34c-4bfe-81a1-2b329c1d516a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '75b49e63-b7b2-4616-a4a9-2f4abc752114')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('75b49e63-b7b2-4616-a4a9-2f4abc752114', '/FunctionDetail', '@/iCore/Events/Function_Display', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', 'Used for displaying a function.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionDetail', URL = '@/iCore/Events/Function_Display', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', URLMappingDesc = 'Used for displaying a function.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '75b49e63-b7b2-4616-a4a9-2f4abc752114'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '41dd247e-1431-4933-b86e-358eeed95b18')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('41dd247e-1431-4933-b86e-358eeed95b18', '/Search', '@/iCore/Content/Search', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying search results', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '41dd247e-1431-4933-b86e-358eeed95b18'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5062f290-dc05-4acf-9fba-35e6d098f3ef')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5062f290-dc05-4acf-9fba-35e6d098f3ef', '/MyAccount', '@/iCore/Contacts/ContactLayouts/AccountPage', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', 'Used for displaying the member''s account page for the donor site', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MyAccount', URL = '@/iCore/Contacts/ContactLayouts/AccountPage', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', URLMappingDesc = 'Used for displaying the member''s account page for the donor site', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '5062f290-dc05-4acf-9fba-35e6d098f3ef'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '7523798b-beb0-42e6-b3da-36e42beda58b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('7523798b-beb0-42e6-b3da-36e42beda58b', '/PrintBatchTransactionSummaryByPaymentMethod', '@/iCore/Commerce/Batch_Transaction_Summary_by_Payment_Method_Report', NULL, '796c525b-e532-4287-adb6-4ecd8b8b8d49', 'Used to print a transaction summary report for a particular payment method from the View Batch page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c6293753-51f7-4f78-a148-37837fe25f87')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c6293753-51f7-4f78-a148-37837fe25f87', '/CreateAccount', '@/iCore/Contacts/CreateAccount', NULL, '6606964d-abde-4159-98dd-11acec31d83a', 'Used for creating a new account.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '553be1ed-c824-4070-b970-37961c2adb55')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('553be1ed-c824-4070-b970-37961c2adb55', '/ItemDetail', '@/iCore/Store/StoreLayouts/Item_Detail', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '44d850e7-d388-4bd1-866a-bc5ad6ed80af', 'Used for displaying an item.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ItemDetail', URL = '@/iCore/Store/StoreLayouts/Item_Detail', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af', URLMappingDesc = 'Used for displaying an item.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '553be1ed-c824-4070-b970-37961c2adb55'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a567f1a2-c950-4d79-80b6-38152daa3886')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a567f1a2-c950-4d79-80b6-38152daa3886', '/FullAccount', '@/iSamples/AnnualConferenceMobile/Profile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '04585f04-4bc2-4d43-9d57-09405bcc0503', 'Used for displaying a staff view of a user account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FullAccount', URL = '@/iSamples/AnnualConferenceMobile/Profile', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '04585f04-4bc2-4d43-9d57-09405bcc0503', URLMappingDesc = 'Used for displaying a staff view of a user account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a567f1a2-c950-4d79-80b6-38152daa3886'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '23f09ed2-b95d-47a1-bfa3-38a62d2c9bdc')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('23f09ed2-b95d-47a1-bfa3-38a62d2c9bdc', '/MyAccount', '@/iSamples/AnnualConferenceMobile/Profile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '04585f04-4bc2-4d43-9d57-09405bcc0503', 'Used for displaying the account page a user sees when selecting their account.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MyAccount', URL = '@/iSamples/AnnualConferenceMobile/Profile', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '04585f04-4bc2-4d43-9d57-09405bcc0503', URLMappingDesc = 'Used for displaying the account page a user sees when selecting their account.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '23f09ed2-b95d-47a1-bfa3-38a62d2c9bdc'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '71fdccbb-7e78-4a8b-8a6d-39245eeeabd9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('71fdccbb-7e78-4a8b-8a6d-39245eeeabd9', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignInCreateAccount', URL = '@/iCore/Contacts/Create_Account_no_Sign_In', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363', URLMappingDesc = 'Used for creating a new account from the Sign In ipart.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '71fdccbb-7e78-4a8b-8a6d-39245eeeabd9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0f984bd4-c75c-4e3a-882d-39c832626ac7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0f984bd4-c75c-4e3a-882d-39c832626ac7', '/CreateAccount', '@/iCore/Contacts/CreateAccount', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '6606964d-abde-4159-98dd-11acec31d83a', 'Used for creating a new account.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateAccount', URL = '@/iCore/Contacts/CreateAccount', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '6606964d-abde-4159-98dd-11acec31d83a', URLMappingDesc = 'Used for creating a new account.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '0f984bd4-c75c-4e3a-882d-39c832626ac7'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '24f0a1eb-f16a-468b-b5ae-39cd4ff0611c')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('24f0a1eb-f16a-468b-b5ae-39cd4ff0611c', '/FullAccount', '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '800bdcf0-7d26-447c-aa0c-4dd15008b423', 'Used for displaying a staff view of a user account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FullAccount', URL = '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423', URLMappingDesc = 'Used for displaying a staff view of a user account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '24f0a1eb-f16a-468b-b5ae-39cd4ff0611c'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c74d7e0f-428f-42f4-962e-3a7d2a35e31a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c74d7e0f-428f-42f4-962e-3a7d2a35e31a', '/CommunicationDashboard', '@/iCore/Staff_Dashboards/Advanced_email/Communication_Dashboard', '4243d9e2-e91e-468c-97c2-2046d70c1e1a', 'f890bd4c-3579-4da5-bf78-8ab5c91ad4f2', 'Used to display the advanced email communication dashboard.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '87bf7ce6-bf48-43cd-a081-3b8420c8809d')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('87bf7ce6-bf48-43cd-a081-3b8420c8809d', '/CreateAccount', '@/iSamples/Mobile/Contact_Management/Create_Account', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '0c1d07cc-fdb2-40b0-8c2a-1baad1a37076', 'Used for creating a new account.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateAccount', URL = '@/iSamples/Mobile/Contact_Management/Create_Account', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '0c1d07cc-fdb2-40b0-8c2a-1baad1a37076', URLMappingDesc = 'Used for creating a new account.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '87bf7ce6-bf48-43cd-a081-3b8420c8809d'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f249b8b9-190b-47a6-8b79-3c6cf7c90e96')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f249b8b9-190b-47a6-8b79-3c6cf7c90e96', '/AddContact', '@/iCore/Contacts/SimpleAccountCreator', NULL, '78b79c30-5044-4ecc-aa0b-162e87383c04', 'Used by Add link of Party Finder Adder.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'bd86bd93-75ba-4f03-82ea-3dd596e03361')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('bd86bd93-75ba-4f03-82ea-3dd596e03361', '/Cart', '@/iCore/Store/StoreLayouts/Cart_Home', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '13a311ee-4be3-4a28-93ed-73ebe8ca5086', 'Used to display cart.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Cart', URL = '@/iCore/Store/StoreLayouts/Cart_Home', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086', URLMappingDesc = 'Used to display cart.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'bd86bd93-75ba-4f03-82ea-3dd596e03361'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '576591d4-ae85-49a9-ba4a-419be84e6d6b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('576591d4-ae85-49a9-ba4a-419be84e6d6b', '/Store', '@/iCore/Content/Search', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying products.', 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99&DisplayAreaOptions=No', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying products.', URLParameters = 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99&DisplayAreaOptions=No', URLMappingTypeCode = 30
    WHERE URLMappingKey = '576591d4-ae85-49a9-ba4a-419be84e6d6b'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'eff64484-bec3-4a74-9744-455ae7ab3c5d')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('eff64484-bec3-4a74-9744-455ae7ab3c5d', '/ItemDetail', '@/iCore/Store/StoreLayouts/Item_Detail', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '44d850e7-d388-4bd1-866a-bc5ad6ed80af', 'Used for displaying an item.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ItemDetail', URL = '@/iCore/Store/StoreLayouts/Item_Detail', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af', URLMappingDesc = 'Used for displaying an item.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'eff64484-bec3-4a74-9744-455ae7ab3c5d'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'bce6505d-a5ee-4ba1-ba81-459d1f108297')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('bce6505d-a5ee-4ba1-ba81-459d1f108297', '/JoinNow', '@/iSamples/MemberR/Contact_Management/Membership', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '8b9c10d5-1171-4e61-ac75-47cbe6735248', 'Used for displaying the options to join as a member.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/JoinNow', URL = '@/iSamples/MemberR/Contact_Management/Membership', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '8b9c10d5-1171-4e61-ac75-47cbe6735248', URLMappingDesc = 'Used for displaying the options to join as a member.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'bce6505d-a5ee-4ba1-ba81-459d1f108297'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'bb6280ff-7379-49b2-a549-45fb19181a5b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('bb6280ff-7379-49b2-a549-45fb19181a5b', '/CommitteeDetail', '@/iCore/Groups/Committee_Detail', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '402f1086-6a8e-4ec7-8b2c-9272087f18e7', 'Used for displaying committee group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CommitteeDetail', URL = '@/iCore/Groups/Committee_Detail', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '402f1086-6a8e-4ec7-8b2c-9272087f18e7', URLMappingDesc = 'Used for displaying committee group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'bb6280ff-7379-49b2-a549-45fb19181a5b'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b1d775a3-b133-4275-a5f3-4afbe09c856c')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b1d775a3-b133-4275-a5f3-4afbe09c856c', '/ProductDisplay', '@/iCore/Store/Product_Display', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ProductDisplay', URL = '@/iCore/Store/Product_Display', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '6066a460-b09a-444d-91e7-93e98db225d4', URLMappingDesc = 'Used for displaying the product display list.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b1d775a3-b133-4275-a5f3-4afbe09c856c'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '923beff4-add9-4e31-b0d6-4c54660a5200')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('923beff4-add9-4e31-b0d6-4c54660a5200', '/Store', '@/iCore/Store/StoreLayouts/Store_Home', NULL, '53edb360-7b6b-425f-9ec3-06418c408e24', 'Used for displaying products.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '40868184-5d76-41b9-8b88-4cad05c4a9c7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('40868184-5d76-41b9-8b88-4cad05c4a9c7', '/OrganizationJoinNow', '@/iCore/Membership/General_product_display_without_cart_button', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '339e3091-e79c-4c82-bdde-76203bae43db', 'Used for displaying the product for organization membership fees.', 'iProductCode=COMPANY_REGULAR_MEMBERSHIP', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'e7608ac3-ff4d-40b3-97de-4f97410091ad')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('e7608ac3-ff4d-40b3-97de-4f97410091ad', '/Profile', '@/iCore/Contacts/ContactLayouts/Profile', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', 'Used for displaying a limited profile of a user.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Profile', URL = '@/iCore/Contacts/ContactLayouts/Profile', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', URLMappingDesc = 'Used for displaying a limited profile of a user.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'e7608ac3-ff4d-40b3-97de-4f97410091ad'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3404077b-022c-46cd-93a3-50e08b5489c9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3404077b-022c-46cd-93a3-50e08b5489c9', '/OrganizationAccount', '@/iSamples/Mobile/Contact_Management/Organization_Profile', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '1341e64c-e409-4f8b-8863-93bc593e916b', 'Used for displaying the account page of an organization which the user can edit.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iSamples/Mobile/Contact_Management/Organization_Profile', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '1341e64c-e409-4f8b-8863-93bc593e916b', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '3404077b-022c-46cd-93a3-50e08b5489c9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '62a52cd1-d9df-4582-a097-51c61542d11a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('62a52cd1-d9df-4582-a097-51c61542d11a', '/StaffMembershipLanding', '@/iCore/Staff_Dashboards/Membership/Membership_dashboard', NULL, '61a1bac3-ea70-444f-8b0f-cf94dc0aca01', 'Landing page for the Membership area of the Staff site.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '477d3267-6b8b-4edd-b554-540b477048b1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('477d3267-6b8b-4edd-b554-540b477048b1', '/OrganizationJoinNow', '@/iCore/Membership/General_product_display_without_cart_button', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '339e3091-e79c-4c82-bdde-76203bae43db', 'Used for displaying the product for organization membership fees.', 'iProductCode=COMPANY_REGULAR_MEMBERSHIP', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '993ba697-bf46-44bf-aea3-54e0af14547a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('993ba697-bf46-44bf-aea3-54e0af14547a', '/Profile', '@/iCore/Contacts/ContactLayouts/Profile', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', 'Used for displaying a limited profile of a user.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Profile', URL = '@/iCore/Contacts/ContactLayouts/Profile', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', URLMappingDesc = 'Used for displaying a limited profile of a user.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '993ba697-bf46-44bf-aea3-54e0af14547a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '72d1ac87-9e46-4efc-afe8-555fd79745f0')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('72d1ac87-9e46-4efc-afe8-555fd79745f0', '/StaffAddContact', '@/iCore/Contacts/Create_Contact_Person_or_Org', NULL, '3229d460-e1ed-4a09-9dc4-7638ca7f6807', 'Used in the Staff site Community area to add a contact.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0fece33f-d9ca-4921-b381-5825de84ab31')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0fece33f-d9ca-4921-b381-5825de84ab31', '/Profile', '@/iCore/Contacts/ContactLayouts/Profile', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', 'Used for displaying a limited profile of a user.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Profile', URL = '@/iCore/Contacts/ContactLayouts/Profile', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', URLMappingDesc = 'Used for displaying a limited profile of a user.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '0fece33f-d9ca-4921-b381-5825de84ab31'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '6178b22f-3205-48c8-9741-58a696ed3c2e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('6178b22f-3205-48c8-9741-58a696ed3c2e', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiftDetail', URL = '@/iCore/Fundraising/Gift_Detail', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', URLMappingDesc = 'Used for displaying a fundraising item.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '6178b22f-3205-48c8-9741-58a696ed3c2e'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '24a57c26-19d3-4680-9f59-58bef239d7bf')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('24a57c26-19d3-4680-9f59-58bef239d7bf', '/OrganizationFullAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Staff', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used to display the staff view of the organization account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationFullAccount', URL = '@/iCore/Contacts/OrganizationLayouts/Account_Staff', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001', URLMappingDesc = 'Used to display the staff view of the organization account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '24a57c26-19d3-4680-9f59-58bef239d7bf'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'acfb7c1e-88ed-4e29-9577-5b7ed576e074')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('acfb7c1e-88ed-4e29-9577-5b7ed576e074', '/Cart', '@/iSamples/Mobile/Store/Cart_Home', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'a6fefcd2-92e0-4553-9475-84ed9731efad', 'Used to display cart.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Cart', URL = '@/iSamples/Mobile/Store/Cart_Home', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = 'a6fefcd2-92e0-4553-9475-84ed9731efad', URLMappingDesc = 'Used to display cart.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'acfb7c1e-88ed-4e29-9577-5b7ed576e074'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '72f1b0d2-0d90-4e7a-a93f-5d45722b9129')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('72f1b0d2-0d90-4e7a-a93f-5d45722b9129', '/GroupDetail', '@/iCore/Groups/Group_Detail', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '811ad534-57fb-446a-990b-87771ab54ffc', 'Used for displaying group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GroupDetail', URL = '@/iCore/Groups/Group_Detail', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '811ad534-57fb-446a-990b-87771ab54ffc', URLMappingDesc = 'Used for displaying group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '72f1b0d2-0d90-4e7a-a93f-5d45722b9129'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a453da78-9612-4595-a74d-5f9df65cc073')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a453da78-9612-4595-a74d-5f9df65cc073', '/ProductDisplay', '@/iCore/Store/Product_Display', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ProductDisplay', URL = '@/iCore/Store/Product_Display', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '6066a460-b09a-444d-91e7-93e98db225d4', URLMappingDesc = 'Used for displaying the product display list.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a453da78-9612-4595-a74d-5f9df65cc073'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'e479d10c-21c6-4d6a-a586-60098123a111')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('e479d10c-21c6-4d6a-a586-60098123a111', '/FunctionDetail', '@/iCore/Events/Function_Display', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', 'Used for displaying a function.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionDetail', URL = '@/iCore/Events/Function_Display', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', URLMappingDesc = 'Used for displaying a function.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'e479d10c-21c6-4d6a-a586-60098123a111'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '89c1dbfb-26c2-497d-869d-62e5618b42f4')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('89c1dbfb-26c2-497d-869d-62e5618b42f4', '/StaffFindEvents', '@/iCore/Events/Events_List', NULL, 'a7c02c1f-efcc-4a9a-b4bc-9f9afadebf03', 'Used in the Staff site Events area to search for events.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'd0e292b7-7b83-4066-a491-62ebafa0e583')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('d0e292b7-7b83-4066-a491-62ebafa0e583', '/MemberHome', '@/iSamples/Member/MemberHome', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '6b014aaf-790e-4999-9b5f-7fcc9e71f65f', 'Used for displaying the home page of signed in user.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MemberHome', URL = '@/iSamples/Member/MemberHome', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '6b014aaf-790e-4999-9b5f-7fcc9e71f65f', URLMappingDesc = 'Used for displaying the home page of signed in user.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'd0e292b7-7b83-4066-a491-62ebafa0e583'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '00e77216-6209-494f-9cb5-63d783118fac')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('00e77216-6209-494f-9cb5-63d783118fac', '/CreateAccountSocialMedia', '@/iCore/Contacts/CreateAccountSocialMedia', NULL, '23394b32-c004-40d2-88aa-d8d1aa6bc05a', 'Used for creating a new account from social media.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ed4c3b18-149a-4051-92df-6409281a558a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ed4c3b18-149a-4051-92df-6409281a558a', '/MyAccount', '@/iCore/Contacts/ContactLayouts/AccountPage', NULL, 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', 'Used for displaying the account page a user sees when selecting their account.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8708b97d-eb7c-4441-94c1-653b1d2956e1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8708b97d-eb7c-4441-94c1-653b1d2956e1', '/MemberHome', '@/iSamples/Member/MemberHome', NULL, '6b014aaf-790e-4999-9b5f-7fcc9e71f65f', 'Used for displaying the home page of signed in user.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '6ab0cac2-b30c-4931-b0e5-695980da175a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('6ab0cac2-b30c-4931-b0e5-695980da175a', '/EventDetail', '@/iCore/Events/Event_Display', NULL, '7aaa2571-9e50-4473-b894-1174ec66d004', 'Used for displaying an event.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '486ff3c7-f252-4ed2-9914-699f4580e7a9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('486ff3c7-f252-4ed2-9914-699f4580e7a9', '/Organization', '@/iSamples/AnnualConferenceMobile/Profile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '04585f04-4bc2-4d43-9d57-09405bcc0503', 'Used for displaying a limited profile of an organization.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Organization', URL = '@/iSamples/AnnualConferenceMobile/Profile', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '04585f04-4bc2-4d43-9d57-09405bcc0503', URLMappingDesc = 'Used for displaying a limited profile of an organization.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '486ff3c7-f252-4ed2-9914-699f4580e7a9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8506e936-4d31-430f-93e2-69ab46255d5e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8506e936-4d31-430f-93e2-69ab46255d5e', '/SignIn', '@/iCore/Contacts/Staff_Sign_In', '4243d9e2-e91e-468c-97c2-2046d70c1e1a', '21160ad6-13cb-4919-a4ec-e9f2dc4aed24', 'Used for signing in.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f2e8dade-60e4-4118-9fd5-6a7163689b87')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f2e8dade-60e4-4118-9fd5-6a7163689b87', '/EventDetail', '@/iSamples/Mobile/Event_Display', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iSamples/Mobile/Event_Display', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f2e8dade-60e4-4118-9fd5-6a7163689b87'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'cb08407f-407b-46e7-9889-6b9caa20f53f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('cb08407f-407b-46e7-9889-6b9caa20f53f', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignInCreateAccount', URL = '@/iCore/Contacts/Create_Account_no_Sign_In', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363', URLMappingDesc = 'Used for creating a new account from the Sign In ipart.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'cb08407f-407b-46e7-9889-6b9caa20f53f'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'eb956b52-6658-4855-a4e8-6dacda84f607')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('eb956b52-6658-4855-a4e8-6dacda84f607', '/Organization', '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', 'Used for displaying a limited profile of an organization.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Organization', URL = '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', URLMappingDesc = 'Used for displaying a limited profile of an organization.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'eb956b52-6658-4855-a4e8-6dacda84f607'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ecf2b109-c17e-44b2-b397-6ec96316f44b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ecf2b109-c17e-44b2-b397-6ec96316f44b', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignInCreateAccount', URL = '@/iCore/Contacts/Create_Account_no_Sign_In', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363', URLMappingDesc = 'Used for creating a new account from the Sign In ipart.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'ecf2b109-c17e-44b2-b397-6ec96316f44b'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8714d83c-745a-43b9-876d-717b649643d7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8714d83c-745a-43b9-876d-717b649643d7', '/Register', '@/iSamples/AnnualConference/Registration', '77c6bf57-1505-456c-a3e9-8473532388ea', 'b6e761e7-04fc-42df-a836-385e11706c3d', 'Register for the Annual Conference', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Register', URL = '@/iSamples/AnnualConference/Registration', WebsiteDocumentVersionKey = '77c6bf57-1505-456c-a3e9-8473532388ea', TargetDocumentVersionKey = 'b6e761e7-04fc-42df-a836-385e11706c3d', URLMappingDesc = 'Register for the Annual Conference', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '8714d83c-745a-43b9-876d-717b649643d7'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'af253e1a-5b9e-4e02-b854-72f0997b9c12')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('af253e1a-5b9e-4e02-b854-72f0997b9c12', '/JoinNow', '@/iSamples/Member/Benefits', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7', 'Used for displaying the options to join as a member.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/JoinNow', URL = '@/iSamples/Member/Benefits', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7', URLMappingDesc = 'Used for displaying the options to join as a member.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'af253e1a-5b9e-4e02-b854-72f0997b9c12'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1530a207-9f18-4a13-95bb-74b5902dc3b9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1530a207-9f18-4a13-95bb-74b5902dc3b9', '/FunctionDetail', '@/iCore/Events/Function_Display', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', 'Used for displaying a function.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionDetail', URL = '@/iCore/Events/Function_Display', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', URLMappingDesc = 'Used for displaying a function.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '1530a207-9f18-4a13-95bb-74b5902dc3b9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ef0a7f03-72be-4e51-8e01-75c484a17028')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ef0a7f03-72be-4e51-8e01-75c484a17028', '/AdvancedAccountingConsole', '@/iCore/Tools/AACPortal', NULL, 'bc790c10-a8f8-4963-a4f6-d1b289fa546e', 'Used to display the Advanced Accounting Console in a web browser.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '45fd2baa-ef92-4b08-9d09-765d9a88a4b2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('45fd2baa-ef92-4b08-9d09-765d9a88a4b2', '/GroupDetail', '@/iCore/Groups/Group_Detail', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '811ad534-57fb-446a-990b-87771ab54ffc', 'Used for displaying group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GroupDetail', URL = '@/iCore/Groups/Group_Detail', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '811ad534-57fb-446a-990b-87771ab54ffc', URLMappingDesc = 'Used for displaying group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '45fd2baa-ef92-4b08-9d09-765d9a88a4b2'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '565abc73-bbe2-4559-9101-779b41e8950f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('565abc73-bbe2-4559-9101-779b41e8950f', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', NULL, 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3a9adb02-1837-4525-ac1f-7962c2396835')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3a9adb02-1837-4525-ac1f-7962c2396835', '/PrintBatchTransactionSummary', '@/iCore/Commerce/Batch_Transaction_Summary_Report', NULL, 'e08d5745-11c0-4616-a4c1-1805a6b0214a', 'Used to print a transaction summary report for a particular batch from the View Batch page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '981f69c4-2af3-460f-b199-79b94a1bc86c')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('981f69c4-2af3-460f-b199-79b94a1bc86c', '/Organization', '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', 'Used for displaying a limited profile of an organization.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Organization', URL = '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', URLMappingDesc = 'Used for displaying a limited profile of an organization.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '981f69c4-2af3-460f-b199-79b94a1bc86c'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b0133811-7a15-49d0-ac22-7bebeebc17bd')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b0133811-7a15-49d0-ac22-7bebeebc17bd', '/EventDetail', '@/iSamples/Mobile/Event_Display', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iSamples/Mobile/Event_Display', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b0133811-7a15-49d0-ac22-7bebeebc17bd'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '42850316-3e88-418d-ac1e-7d9524e53da2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('42850316-3e88-418d-ac1e-7d9524e53da2', '/Organization', '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', NULL, '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', 'Used for displaying a limited profile of an organization.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '77bf21fa-edcd-4166-adc6-7f641a2dcaaa')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('77bf21fa-edcd-4166-adc6-7f641a2dcaaa', '/StaffCommerceLanding', '@/iCore/Staff_Dashboards/Commerce_Dashboard', NULL, 'e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1', 'Landing page for the Commerce area of the Staff site.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b8119e25-13b7-451d-8614-825cd4624af7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b8119e25-13b7-451d-8614-825cd4624af7', '/CommitteeDetail', '@/iCore/Groups/Committee_Detail', NULL, '402f1086-6a8e-4ec7-8b2c-9272087f18e7', 'Used for display committee group details.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3f49bfad-feb6-4ee7-8178-838a8fa03a6a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3f49bfad-feb6-4ee7-8178-838a8fa03a6a', '/FullAccount', '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '800bdcf0-7d26-447c-aa0c-4dd15008b423', 'Used for displaying a staff view of a user account page.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FullAccount', URL = '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423', URLMappingDesc = 'Used for displaying a staff view of a user account page.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '3f49bfad-feb6-4ee7-8178-838a8fa03a6a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '633c6f74-b7dc-4afd-8308-846b43f427cc')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('633c6f74-b7dc-4afd-8308-846b43f427cc', '/GiveNow', '@/iCore/Fundraising/Donate_Now', NULL, '991d8973-6ade-4ac5-aef3-c34945a8641a', 'Used for displaying the give now page.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'fbdea79a-968e-48cc-b10b-852b03bae5e1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('fbdea79a-968e-48cc-b10b-852b03bae5e1', '/Profile', '@/iSamples/Mobile/Contact_Management/Profile', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '7e207dcd-e714-4e1e-8882-a047e26ccf58', 'Used for displaying a limited profile of a user.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Profile', URL = '@/iSamples/Mobile/Contact_Management/Profile', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '7e207dcd-e714-4e1e-8882-a047e26ccf58', URLMappingDesc = 'Used for displaying a limited profile of a user.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'fbdea79a-968e-48cc-b10b-852b03bae5e1'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'cc893fd7-2c8a-431e-b7df-85d38f9c45ee')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('cc893fd7-2c8a-431e-b7df-85d38f9c45ee', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiftDetail', URL = '@/iCore/Fundraising/Gift_Detail', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', URLMappingDesc = 'Used for displaying a fundraising item.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'cc893fd7-2c8a-431e-b7df-85d38f9c45ee'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '982bb8fe-c37e-4f73-9fa3-877f92fbe988')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('982bb8fe-c37e-4f73-9fa3-877f92fbe988', '/Search', '@/iCore/Content/SearchLite', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'd28b94af-7d1a-4f01-916c-2633fedc4e8a', 'Used for displaying search results.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/SearchLite', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = 'd28b94af-7d1a-4f01-916c-2633fedc4e8a', URLMappingDesc = 'Used for displaying search results.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '982bb8fe-c37e-4f73-9fa3-877f92fbe988'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f8db12a2-8088-4031-8e96-87f56c78ba3a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f8db12a2-8088-4031-8e96-87f56c78ba3a', '/EventDetail', '@/iSamples/MemberR/Event_Display', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iSamples/MemberR/Event_Display', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f8db12a2-8088-4031-8e96-87f56c78ba3a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3622779e-c473-410c-99f9-88dbb69009e8')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3622779e-c473-410c-99f9-88dbb69009e8', '/Cart', '@/iCore/Store/StoreLayouts/Cart_Home', NULL, '13a311ee-4be3-4a28-93ed-73ebe8ca5086', 'Used to display cart.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '49632193-6272-4bb8-8b77-8c9f6983df3b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('49632193-6272-4bb8-8b77-8c9f6983df3b', '/AddContact', '@/iCore/Contacts/SimpleAccountCreator', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '78b79c30-5044-4ecc-aa0b-162e87383c04', 'Used by Add link of Party Finder Adder.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AddContact', URL = '@/iCore/Contacts/SimpleAccountCreator', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '78b79c30-5044-4ecc-aa0b-162e87383c04', URLMappingDesc = 'Used by Add link of Party Finder Adder.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '49632193-6272-4bb8-8b77-8c9f6983df3b'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'af929345-187a-45de-a5d7-8cfa79dab3f4')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('af929345-187a-45de-a5d7-8cfa79dab3f4', '/FullAccount', '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '800bdcf0-7d26-447c-aa0c-4dd15008b423', 'Used for displaying a staff view of a user account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FullAccount', URL = '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423', URLMappingDesc = 'Used for displaying a staff view of a user account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'af929345-187a-45de-a5d7-8cfa79dab3f4'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '6d90c628-95df-4f53-9cd9-8fb792b2dcaa')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('6d90c628-95df-4f53-9cd9-8fb792b2dcaa', '/Search', '@/iCore/Content/Search', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying search results.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '6d90c628-95df-4f53-9cd9-8fb792b2dcaa'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '931eca6b-f812-4d10-83c4-9329750df402')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('931eca6b-f812-4d10-83c4-9329750df402', '/CommitteeDetail', '@/iCore/Groups/Committee_Detail', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '402f1086-6a8e-4ec7-8b2c-9272087f18e7', 'Used for displaying committee group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CommitteeDetail', URL = '@/iCore/Groups/Committee_Detail', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '402f1086-6a8e-4ec7-8b2c-9272087f18e7', URLMappingDesc = 'Used for displaying committee group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '931eca6b-f812-4d10-83c4-9329750df402'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '48ced4f5-b98e-4886-bb3c-9482b86db927')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('48ced4f5-b98e-4886-bb3c-9482b86db927', '/AdvancedEmailDashboard', '@/iCore/Staff_Dashboards/Advanced_email/Advanced_Email_Dashboard', '4243d9e2-e91e-468c-97c2-2046d70c1e1a', '27f294f2-f0cf-4a72-82cc-bd83e7341dc3', 'Used to display the advanced email dashboard.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f86edf52-809a-4b41-abcb-9b47967ef3ea')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f86edf52-809a-4b41-abcb-9b47967ef3ea', '/EventDetail', '@/iCore/Events/Event_Display', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '7aaa2571-9e50-4473-b894-1174ec66d004', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iCore/Events/Event_Display', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '7aaa2571-9e50-4473-b894-1174ec66d004', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f86edf52-809a-4b41-abcb-9b47967ef3ea'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c61da557-8fdd-4241-ae6a-a1b4e378cf57')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c61da557-8fdd-4241-ae6a-a1b4e378cf57', '/AddContact', '@/iCore/Contacts/SimpleAccountCreator', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '78b79c30-5044-4ecc-aa0b-162e87383c04', 'Used by Add link of Party Finder Adder.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AddContact', URL = '@/iCore/Contacts/SimpleAccountCreator', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '78b79c30-5044-4ecc-aa0b-162e87383c04', URLMappingDesc = 'Used by Add link of Party Finder Adder.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'c61da557-8fdd-4241-ae6a-a1b4e378cf57'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1a1f6603-fd02-4d38-a86b-a2965adb1bf4')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1a1f6603-fd02-4d38-a86b-a2965adb1bf4', '/Organization', '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', 'Used for displaying a limited profile of an organization.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Organization', URL = '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', URLMappingDesc = 'Used for displaying a limited profile of an organization.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '1a1f6603-fd02-4d38-a86b-a2965adb1bf4'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f347171e-3835-4586-9e0c-a2f34a697349')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f347171e-3835-4586-9e0c-a2f34a697349', '/EventDetail', '@/iCore/Events/Event_Display', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '7aaa2571-9e50-4473-b894-1174ec66d004', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iCore/Events/Event_Display', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '7aaa2571-9e50-4473-b894-1174ec66d004', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f347171e-3835-4586-9e0c-a2f34a697349'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a3d563e5-0fb1-4978-94ab-a5a484913b86')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a3d563e5-0fb1-4978-94ab-a5a484913b86', '/ItemDetail', '@/iCore/Store/StoreLayouts/Item_Detail', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '44d850e7-d388-4bd1-866a-bc5ad6ed80af', 'Used for displaying an item.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ItemDetail', URL = '@/iCore/Store/StoreLayouts/Item_Detail', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af', URLMappingDesc = 'Used for displaying an item.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a3d563e5-0fb1-4978-94ab-a5a484913b86'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'aa491590-c9c3-49be-83a4-a5af6a64880b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('aa491590-c9c3-49be-83a4-a5af6a64880b', '/PrintProfile', '@/iCore/Reporting_Services_Samples/Member_Profile', NULL, '80fb6366-06b3-4772-8197-d0a9a7847ecf', 'Destination for ''Print Info'' button from a profile.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a4facd67-ab7e-4196-bd20-a613eb4f92c5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a4facd67-ab7e-4196-bd20-a613eb4f92c5', '/ProductDisplay', '@/iCore/Store/Product_Display', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ProductDisplay', URL = '@/iCore/Store/Product_Display', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '6066a460-b09a-444d-91e7-93e98db225d4', URLMappingDesc = 'Used for displaying the product display list.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a4facd67-ab7e-4196-bd20-a613eb4f92c5'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2666e59d-672f-4be9-8911-a67870f4d9b6')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2666e59d-672f-4be9-8911-a67870f4d9b6', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '9829e708-688c-4c69-87de-feac9e549a2b', 'Used for displaying the account page of an organization which the user can edit.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iCore/Contacts/OrganizationLayouts/CoAdmin/Account_Page', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '9829e708-688c-4c69-87de-feac9e549a2b', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '2666e59d-672f-4be9-8911-a67870f4d9b6'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ec3019e5-3005-4454-a389-a7efb58f71d5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ec3019e5-3005-4454-a389-a7efb58f71d5', '/StaffFundraisingLanding', '@/iCore/Staff_Dashboards/Fundraising_Overview_Dashboard', NULL, 'baf65863-ae46-489d-a410-f1a415aed2bb', 'Landing page for the Fundraising area of the Staff site.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5c6e5dca-5e94-4b94-bc66-a8bfff11f687')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5c6e5dca-5e94-4b94-bc66-a8bfff11f687', '/PrintBatchTransactionDetailsByPaymentMethod', '@/iCore/Commerce/Batch_Transaction_Details_by_Payment_Method_Report', NULL, '2298122d-432c-4469-96fe-b5bbe40be1c9', 'Used to print a batch detail report for a particular payment method from the View Batch page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '382d192f-e59b-42ad-bc61-a9dedf1b4b7f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('382d192f-e59b-42ad-bc61-a9dedf1b4b7f', '/CreateAccount', '@/iCore/Contacts/CreateAccount', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '6606964d-abde-4159-98dd-11acec31d83a', 'Used for creating a new account.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateAccount', URL = '@/iCore/Contacts/CreateAccount', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '6606964d-abde-4159-98dd-11acec31d83a', URLMappingDesc = 'Used for creating a new account.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '382d192f-e59b-42ad-bc61-a9dedf1b4b7f'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '7fcd378a-8065-4770-806d-a9f44725a9e1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('7fcd378a-8065-4770-806d-a9f44725a9e1', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiftDetail', URL = '@/iCore/Fundraising/Gift_Detail', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', URLMappingDesc = 'Used for displaying a fundraising item.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '7fcd378a-8065-4770-806d-a9f44725a9e1'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3084d5f8-a89d-4b91-a29f-aa7d9f8ab0b5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3084d5f8-a89d-4b91-a29f-aa7d9f8ab0b5', '/MyAccount', '@/iCore/Contacts/ContactLayouts/AccountPage', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', 'Used for displaying the account page a user sees when selecting their account.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MyAccount', URL = '@/iCore/Contacts/ContactLayouts/AccountPage', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', URLMappingDesc = 'Used for displaying the account page a user sees when selecting their account.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '3084d5f8-a89d-4b91-a29f-aa7d9f8ab0b5'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '58a4cb09-c2b6-4e79-9a14-aa9635192ef9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('58a4cb09-c2b6-4e79-9a14-aa9635192ef9', '/EventDashboard', '@/iSamples/MemberR/Event_Display', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', 'Used for displaying an event for staff users.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iSamples/MemberR/Event_Display', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'bb7ca598-4269-4e85-b6c4-acd53f05c51a', URLMappingDesc = 'Used for displaying an event for staff users.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '58a4cb09-c2b6-4e79-9a14-aa9635192ef9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '37a77887-d4e2-4b61-9ed0-af8414cba927')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('37a77887-d4e2-4b61-9ed0-af8414cba927', '/MyAccount', '@/iCore/Contacts/ContactLayouts/AccountPage', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', 'Used for displaying the account page a user sees when selecting their account.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MyAccount', URL = '@/iCore/Contacts/ContactLayouts/AccountPage', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9', URLMappingDesc = 'Used for displaying the account page a user sees when selecting their account.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '37a77887-d4e2-4b61-9ed0-af8414cba927'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '48f0c842-8a6d-442c-9a58-b2e4b84cffeb')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('48f0c842-8a6d-442c-9a58-b2e4b84cffeb', '/GroupDetail', '@/iCore/Groups/Group_Detail', NULL, '811ad534-57fb-446a-990b-87771ab54ffc', 'Used for displaying group details.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '70553431-2bb3-4946-9c16-b5a59a02a6e5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('70553431-2bb3-4946-9c16-b5a59a02a6e5', '/OrganizationJoin', '@/iCore/Membership/Organization_Join', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '4050b11e-b1fe-4fe2-ba90-f5c61e3b6e00', 'Used for displaying the organization join as a member page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '615ecb78-c6bf-448e-a9d7-b5a83f9890f8')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('615ecb78-c6bf-448e-a9d7-b5a83f9890f8', '/SignIn', '@/iCore/Contacts/Sign_In', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', 'Used for signing in.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignIn', URL = '@/iCore/Contacts/Sign_In', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', URLMappingDesc = 'Used for signing in.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '615ecb78-c6bf-448e-a9d7-b5a83f9890f8'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2974407e-23fe-4b11-831e-b7cd079c64cd')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2974407e-23fe-4b11-831e-b7cd079c64cd', '/SignIn', '@/iCore/Contacts/Sign_In', NULL, '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', 'Used for signing in.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0ed761c7-0322-45f9-9989-b7f80ffd2db5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0ed761c7-0322-45f9-9989-b7f80ffd2db5', '/AddContact', '@/iCore/Contacts/SimpleAccountCreator', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '78b79c30-5044-4ecc-aa0b-162e87383c04', 'Used by Add link of Party Finder Adder.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AddContact', URL = '@/iCore/Contacts/SimpleAccountCreator', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '78b79c30-5044-4ecc-aa0b-162e87383c04', URLMappingDesc = 'Used by Add link of Party Finder Adder.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '0ed761c7-0322-45f9-9989-b7f80ffd2db5'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'fa83859c-edc5-413f-876f-b8f499610395')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('fa83859c-edc5-413f-876f-b8f499610395', '/ProductDisplay', '@/iCore/Store/Product_Display', NULL, '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'adb1b069-b7d1-41c9-9404-ba07fdc7c4fb')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('adb1b069-b7d1-41c9-9404-ba07fdc7c4fb', '/PrintBatchTransactionDetails', '@/iCore/Commerce/Batch_Transaction_Details_Report', NULL, '7d50a1c5-ddc3-49e3-8188-ab91bf81dc33', 'Used to print a batch detail report from the View Batch page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '347d2422-8b8a-462d-b270-badf352a7895')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('347d2422-8b8a-462d-b270-badf352a7895', '/OrganizationFullAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Staff', '77c6bf57-1505-456c-a3e9-8473532388ea', 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used to display the staff view of the organization account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationFullAccount', URL = '@/iCore/Contacts/OrganizationLayouts/Account_Staff', WebsiteDocumentVersionKey = '77c6bf57-1505-456c-a3e9-8473532388ea', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001', URLMappingDesc = 'Used to display the staff view of the organization account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '347d2422-8b8a-462d-b270-badf352a7895'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2f5e940e-32af-4449-bac1-bc82dfed54eb')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2f5e940e-32af-4449-bac1-bc82dfed54eb', '/FullAccount', '@/iCore/Contacts/ContactLayouts/Account_Page_Staff', NULL, '800bdcf0-7d26-447c-aa0c-4dd15008b423', 'Used for displaying a staff view of a user account page.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '12968e64-fada-472a-8701-bd1fc52460c1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('12968e64-fada-472a-8701-bd1fc52460c1', '/FunctionDetail', '@/iCore/Events/Function_Display', NULL, 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', 'Used for displaying a function.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'cd00639e-b9df-4c43-8388-bf94946be738')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('cd00639e-b9df-4c43-8388-bf94946be738', '/CommunicationPreferences', '@/iCore/Contacts/ContactLayouts/Communication_Preferences', NULL, '47ed6868-b1d1-4301-b22b-42f03d3440d1', 'Used for communication preferences', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '60f5d5b4-aa97-454b-ae68-c31bf7250ab9')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('60f5d5b4-aa97-454b-ae68-c31bf7250ab9', '/FunctionDetail', '@/iCore/Events/Function_Display', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', 'Used for displaying a function.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionDetail', URL = '@/iCore/Events/Function_Display', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8', URLMappingDesc = 'Used for displaying a function.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '60f5d5b4-aa97-454b-ae68-c31bf7250ab9'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '42c7f4c5-b90b-4f84-9c63-c4e52467e75c')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('42c7f4c5-b90b-4f84-9c63-c4e52467e75c', '/JoinNow', '@/iSamples/Member/Benefits', NULL, '91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7', 'Used for displaying the options to join as a member.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '6f23415f-14f5-4efc-a9e2-c796be4d48cb')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('6f23415f-14f5-4efc-a9e2-c796be4d48cb', '/StaffEventsLanding', '@/iCore/Staff_Dashboards/Events_Dashboard', NULL, '2eb37148-bd2f-4ae2-9419-1f00ad6c74e7', 'Landing page for the Events area of the Staff site.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '807d2114-4fb0-4aed-8d6a-cc6d932a9d14')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('807d2114-4fb0-4aed-8d6a-cc6d932a9d14', '/Store', '@/iCore/Store/StoreLayouts/Store_Home', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '53edb360-7b6b-425f-9ec3-06418c408e24', 'Used for displaying products.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iCore/Store/StoreLayouts/Store_Home', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '53edb360-7b6b-425f-9ec3-06418c408e24', URLMappingDesc = 'Used for displaying products.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '807d2114-4fb0-4aed-8d6a-cc6d932a9d14'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '49fa151d-492d-4cdf-8980-cf2625e732a8')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('49fa151d-492d-4cdf-8980-cf2625e732a8', '/Store', '@/iCore/Content/Search', '77c6bf57-1505-456c-a3e9-8473532388ea', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying products.', 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = '77c6bf57-1505-456c-a3e9-8473532388ea', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying products.', URLParameters = 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99', URLMappingTypeCode = 30
    WHERE URLMappingKey = '49fa151d-492d-4cdf-8980-cf2625e732a8'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ba7ae93d-683c-4f7c-9d52-cf7363827589')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ba7ae93d-683c-4f7c-9d52-cf7363827589', '/FullAccount', '@/iSamples/Mobile/Contact_Management/My Account', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '2b7e0ae5-f207-49a0-9215-1013627c490a', 'Used for displaying a staff view of a user account page.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FullAccount', URL = '@/iSamples/Mobile/Contact_Management/My Account', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '2b7e0ae5-f207-49a0-9215-1013627c490a', URLMappingDesc = 'Used for displaying a staff view of a user account page.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'ba7ae93d-683c-4f7c-9d52-cf7363827589'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '233f3959-cff8-4823-ae58-d2e86097da79')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('233f3959-cff8-4823-ae58-d2e86097da79', '/Organization', '@/iSamples/Mobile/Contact_Management/Organization_Profile', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '1341e64c-e409-4f8b-8863-93bc593e916b', 'Used for displaying a limited profile of an organization.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Organization', URL = '@/iSamples/Mobile/Contact_Management/Organization_Profile', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '1341e64c-e409-4f8b-8863-93bc593e916b', URLMappingDesc = 'Used for displaying a limited profile of an organization.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '233f3959-cff8-4823-ae58-d2e86097da79'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9131dbe2-c749-4543-b8cc-d451bd8fe4de')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9131dbe2-c749-4543-b8cc-d451bd8fe4de', '/CommitteeDetail', '@/iCore/Groups/Committee_Detail', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '402f1086-6a8e-4ec7-8b2c-9272087f18e7', 'Used for displaying committee group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CommitteeDetail', URL = '@/iCore/Groups/Committee_Detail', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '402f1086-6a8e-4ec7-8b2c-9272087f18e7', URLMappingDesc = 'Used for displaying committee group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '9131dbe2-c749-4543-b8cc-d451bd8fe4de'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f99f591a-1e19-416a-87af-d4e3c7ab5f0a')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f99f591a-1e19-416a-87af-d4e3c7ab5f0a', '/OrganizationAccount', '@/iSamples/AnnualConferenceMobile/Profile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '04585f04-4bc2-4d43-9d57-09405bcc0503', 'Used for displaying the account page of an organization which the user can edit.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iSamples/AnnualConferenceMobile/Profile', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '04585f04-4bc2-4d43-9d57-09405bcc0503', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f99f591a-1e19-416a-87af-d4e3c7ab5f0a'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c6a19b40-2843-481d-b491-d6b56836b7b5')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c6a19b40-2843-481d-b491-d6b56836b7b5', '/CommitteeDetail', '@/iCore/Groups/Committee_Detail', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '402f1086-6a8e-4ec7-8b2c-9272087f18e7', 'Used for displaying committee group details.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CommitteeDetail', URL = '@/iCore/Groups/Committee_Detail', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '402f1086-6a8e-4ec7-8b2c-9272087f18e7', URLMappingDesc = 'Used for displaying committee group details.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'c6a19b40-2843-481d-b491-d6b56836b7b5'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b27d6c89-aaf8-4ad9-a602-d840819bcb05')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b27d6c89-aaf8-4ad9-a602-d840819bcb05', '/Store', '@/iCore/Store/StoreLayouts/Store_Home', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '53edb360-7b6b-425f-9ec3-06418c408e24', 'Used for displaying products.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iCore/Store/StoreLayouts/Store_Home', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '53edb360-7b6b-425f-9ec3-06418c408e24', URLMappingDesc = 'Used for displaying products.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b27d6c89-aaf8-4ad9-a602-d840819bcb05'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'c73a989a-48bd-4b48-b837-da0cdef03865')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('c73a989a-48bd-4b48-b837-da0cdef03865', '/SignIn', '@/iCore/Contacts/Sign_In', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', 'Used for signing in.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/SignIn', URL = '@/iCore/Contacts/Sign_In', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', URLMappingDesc = 'Used for signing in.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'c73a989a-48bd-4b48-b837-da0cdef03865'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'aff4180b-56e6-4b76-8a9c-dd3b6b459ed3')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('aff4180b-56e6-4b76-8a9c-dd3b6b459ed3', '/CreateCommunication', '@/iCore/Communications/Create_Communication', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'ce95310d-5cf9-49da-8acd-6ac991e6ee25', 'Used to create and manage communications.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateCommunication', URL = '@/iCore/Communications/Create_Communication', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'ce95310d-5cf9-49da-8acd-6ac991e6ee25', URLMappingDesc = 'Used to create and manage communications.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'aff4180b-56e6-4b76-8a9c-dd3b6b459ed3'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a0e77b5a-32b1-4eb8-b9aa-e20d2d2866bc')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a0e77b5a-32b1-4eb8-b9aa-e20d2d2866bc', '/EventDashboard', '@/iSamples/Mobile/Event_Display', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iSamples/Mobile/Event_Display', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a0e77b5a-32b1-4eb8-b9aa-e20d2d2866bc'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'ff26025d-0c48-4c27-9719-e2a4a6c27c22')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('ff26025d-0c48-4c27-9719-e2a4a6c27c22', '/MyAccount', '@/iSamples/Mobile/Contact_Management/My Account', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '2b7e0ae5-f207-49a0-9215-1013627c490a', 'Used for displaying the account page a user sees when selecting their account.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/MyAccount', URL = '@/iSamples/Mobile/Contact_Management/My Account', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '2b7e0ae5-f207-49a0-9215-1013627c490a', URLMappingDesc = 'Used for displaying the account page a user sees when selecting their account.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'ff26025d-0c48-4c27-9719-e2a4a6c27c22'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '0740e46d-83fa-4ce7-81b4-e3e2b5411742')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('0740e46d-83fa-4ce7-81b4-e3e2b5411742', '/FunctionEdit', '@/iCore/Events/Function_Edit', NULL, 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c', 'Used when editing or adding an event function.', '', 40)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionEdit', URL = '@/iCore/Events/Function_Edit', WebsiteDocumentVersionKey = NULL, TargetDocumentVersionKey = 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c', URLMappingDesc = 'Used when editing or adding an event function.', URLParameters = '', URLMappingTypeCode = 40
    WHERE URLMappingKey = '0740e46d-83fa-4ce7-81b4-e3e2b5411742'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '05ebf8e6-8dd9-4153-9efa-e5792ddc6b9f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('05ebf8e6-8dd9-4153-9efa-e5792ddc6b9f', '/CreateAccount', '@/iCore/Contacts/CreateAccount', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '6606964d-abde-4159-98dd-11acec31d83a', 'Used for creating a new account.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateAccount', URL = '@/iCore/Contacts/CreateAccount', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '6606964d-abde-4159-98dd-11acec31d83a', URLMappingDesc = 'Used for creating a new account.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '05ebf8e6-8dd9-4153-9efa-e5792ddc6b9f'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2c1c716a-1543-4936-915c-e74613abeebc')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2c1c716a-1543-4936-915c-e74613abeebc', '/OrganizationFullAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Staff', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used to display the staff view of the organization account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationFullAccount', URL = '@/iCore/Contacts/OrganizationLayouts/Account_Staff', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001', URLMappingDesc = 'Used to display the staff view of the organization account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '2c1c716a-1543-4936-915c-e74613abeebc'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '24b64c8d-7d6d-4203-b6e3-e7664cf54153')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('24b64c8d-7d6d-4203-b6e3-e7664cf54153', '/GiveNow', '@/iCore/Fundraising/Donate_Now', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '991d8973-6ade-4ac5-aef3-c34945a8641a', 'Used for displaying the give now page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/GiveNow', URL = '@/iCore/Fundraising/Donate_Now', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = '991d8973-6ade-4ac5-aef3-c34945a8641a', URLMappingDesc = 'Used for displaying the give now page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '24b64c8d-7d6d-4203-b6e3-e7664cf54153'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5e82d580-2963-4cfa-bc06-ec560c83a16c')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5e82d580-2963-4cfa-bc06-ec560c83a16c', '/Cart', '@/iSamples/AnnualConferenceMobile/Cart_Home', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', '8738f345-08f6-4bf8-a5ac-edaa1336e0ec', 'Used to display cart.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Cart', URL = '@/iSamples/AnnualConferenceMobile/Cart_Home', WebsiteDocumentVersionKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', TargetDocumentVersionKey = '8738f345-08f6-4bf8-a5ac-edaa1336e0ec', URLMappingDesc = 'Used to display cart.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '5e82d580-2963-4cfa-bc06-ec560c83a16c'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'a9def361-d2dc-4271-b231-ec8f992dfe4f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('a9def361-d2dc-4271-b231-ec8f992dfe4f', '/Store', '@/iCore/Store/StoreLayouts/Store_Home', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '53edb360-7b6b-425f-9ec3-06418c408e24', 'Used for displaying products.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iCore/Store/StoreLayouts/Store_Home', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '53edb360-7b6b-425f-9ec3-06418c408e24', URLMappingDesc = 'Used for displaying products.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'a9def361-d2dc-4271-b231-ec8f992dfe4f'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2df771c3-8931-48d2-a0b7-edbdaf5ea0c1')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2df771c3-8931-48d2-a0b7-edbdaf5ea0c1', '/AddContact', '@/iCore/Contacts/SimpleAccountCreator', 'e7590042-1672-4d0f-a20c-335e0bf62de2', '78b79c30-5044-4ecc-aa0b-162e87383c04', 'Used by Add link of Party Finder Adder.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/AddContact', URL = '@/iCore/Contacts/SimpleAccountCreator', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = '78b79c30-5044-4ecc-aa0b-162e87383c04', URLMappingDesc = 'Used by Add link of Party Finder Adder.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '2df771c3-8931-48d2-a0b7-edbdaf5ea0c1'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5b9060be-3f5c-422b-b067-ee1af80eae56')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5b9060be-3f5c-422b-b067-ee1af80eae56', '/EventDashboard', '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'a8ab6743-9dda-41f7-9aa2-7a681a203082', 'Used for displaying an event dashboard.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iCore/Staff_Dashboards/Specific_Event/Event_Dashboard', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'a8ab6743-9dda-41f7-9aa2-7a681a203082', URLMappingDesc = 'Used for displaying an event dashboard.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '5b9060be-3f5c-422b-b067-ee1af80eae56'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9ae877fa-2505-4f7a-ba62-f108b7db4a8b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9ae877fa-2505-4f7a-ba62-f108b7db4a8b', '/OrganizationJoinNow', '@/iCore/Membership/General_product_display_without_cart_button', NULL, '339e3091-e79c-4c82-bdde-76203bae43db', 'Used for displaying the product for organization membership fees.', 'iProductCode=COMPANY_REGULAR_MEMBERSHIP', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '79f839eb-938c-4162-a680-f201142b3d8b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('79f839eb-938c-4162-a680-f201142b3d8b', '/EventDashboard', '@/iSamples/Mobile/Event_Display', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', 'Used for displaying an event.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDashboard', URL = '@/iSamples/Mobile/Event_Display', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', URLMappingDesc = 'Used for displaying an event.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '79f839eb-938c-4162-a680-f201142b3d8b'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1d83c348-da2b-4c29-b6e8-f4da47b9850e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1d83c348-da2b-4c29-b6e8-f4da47b9850e', '/Profile', '@/iCore/Contacts/ContactLayouts/Profile', NULL, '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', 'Used for displaying a limited profile of a user.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9402170f-cb98-437e-ae76-fc9cc6322585')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9402170f-cb98-437e-ae76-fc9cc6322585', '/OrganizationFullAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Staff', NULL, 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used to display the staff view of the organization account page.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '39ca65c5-f7f6-403a-9482-fe237ca0029e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('39ca65c5-f7f6-403a-9482-fe237ca0029e', '/ProductDisplay', '@/iCore/Store/Product_Display', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ProductDisplay', URL = '@/iCore/Store/Product_Display', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '6066a460-b09a-444d-91e7-93e98db225d4', URLMappingDesc = 'Used for displaying the product display list.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '39ca65c5-f7f6-403a-9482-fe237ca0029e'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '19a697db-dff3-4e98-9994-fe59c98246d0')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('19a697db-dff3-4e98-9994-fe59c98246d0', '/OrganizationFullAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Staff', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used to display the staff view of the organization account page.', '', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationFullAccount', URL = '@/iCore/Contacts/OrganizationLayouts/Account_Staff', WebsiteDocumentVersionKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001', URLMappingDesc = 'Used to display the staff view of the organization account page.', URLParameters = '', URLMappingTypeCode = 30
    WHERE URLMappingKey = '19a697db-dff3-4e98-9994-fe59c98246d0'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2510e0e3-8f52-4211-b765-ffd8665bd640')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2510e0e3-8f52-4211-b765-ffd8665bd640', '/ContentManagementTasks', '~/Admin/Content_Management/Content_designer/View_task_list/iMIS/ContentManagement/TaskList.aspx', NULL, NULL, NULL, NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/ContentManagementTasks', URL = '~/Admin/Content_Management/Content_designer/View_task_list/iMIS/ContentManagement/TaskList.aspx', WebsiteDocumentVersionKey = NULL, TargetDocumentVersionKey = NULL, URLMappingDesc = NULL, URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '2510e0e3-8f52-4211-b765-ffd8665bd640'
END
SET NOCOUNT OFF

