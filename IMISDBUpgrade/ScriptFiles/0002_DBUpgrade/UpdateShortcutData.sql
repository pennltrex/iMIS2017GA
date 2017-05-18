SET NOCOUNT ON


IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '5576d388-7ad5-4cb1-ba29-055df4fe3a1b')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('5576d388-7ad5-4cb1-ba29-055df4fe3a1b', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Page', NULL, 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used for displaying the account page of an organization which the user can edit.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1094d687-1c5b-45db-bc5a-06e737472291')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1094d687-1c5b-45db-bc5a-06e737472291', '/GiftDetail', '@/iCore/Fundraising/Gift_Detail', NULL, 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c', 'Used for displaying a fundraising item.', NULL, 20)
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
    VALUES ('0f19c34b-dd34-4204-aa2f-0c2333a4ea78', '/AddItem', '@/iCore/Store/Manage/Add_Item', NULL, '562ea02f-a356-4294-997b-18cb92a41377', 'Used when adding an item.', '', 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '9995b9df-b9f5-4d42-b76c-119febba2878')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('9995b9df-b9f5-4d42-b76c-119febba2878', '/Search', '@/iCore/Content/Search', NULL, '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results.', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '3e11bb2b-c15b-4aa5-b58a-14958e82ddd2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('3e11bb2b-c15b-4aa5-b58a-14958e82ddd2', '/EventEdit', '@/iCore/Events/Event_Edit', NULL, '99580240-5ced-40f0-99ed-08b5644c1a87', 'Used when editing or adding an event.', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '6218d1f3-f59a-4033-8457-1e516ff2b8b2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('6218d1f3-f59a-4033-8457-1e516ff2b8b2', '/CreateAccount', '~/Core/CreateAccount.aspx', 'd30229f1-d53b-48d7-99ae-d0ce9fea621d', NULL, 'Used for creating a new account.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/CreateAccount', URL = '~/Core/CreateAccount.aspx', WebsiteDocumentVersionKey = 'd30229f1-d53b-48d7-99ae-d0ce9fea621d', TargetDocumentVersionKey = NULL, URLMappingDesc = 'Used for creating a new account.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '6218d1f3-f59a-4033-8457-1e516ff2b8b2'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'e6cf5ad7-38b4-4239-946e-26145bc99911')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('e6cf5ad7-38b4-4239-946e-26145bc99911', '/ItemDetail', '@/iCore/Store/StoreLayouts/Item_Detail', NULL, '44d850e7-d388-4bd1-866a-bc5ad6ed80af', 'Used for displaying an item.', NULL, 20)
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
    VALUES ('5062f290-dc05-4acf-9fba-35e6d098f3ef', '/MyAccount', '@/iCore/Contacts/ContactLayouts/Donor/About_Me', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'e203e629-80f5-4557-b028-060c3e08639e', 'Used for displaying the member''s account page for the donor site', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8506e936-4d31-430f-93e2-69ab46255d5e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8506e936-4d31-430f-93e2-69ab46255d5e', '/SignIn', '@/iCore/Contacts/Staff_Sign_In', '4243d9e2-e91e-468c-97c2-2046d70c1e1a', '21160ad6-13cb-4919-a4ec-e9f2dc4aed24', 'Used for signing in.', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '8714d83c-745a-43b9-876d-717b649643d7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('8714d83c-745a-43b9-876d-717b649643d7', '/Register', '@/iSamples/AnnualConference/Registration', '77c6bf57-1505-456c-a3e9-8473532388ea', 'b6e761e7-04fc-42df-a836-385e11706c3d', 'Register for the Annual Conference', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '565abc73-bbe2-4559-9101-779b41e8950f')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('565abc73-bbe2-4559-9101-779b41e8950f', '/SignInCreateAccount', '@/iCore/Contacts/Create_Account_no_Sign_In', NULL, 'ea83efd1-0ccc-431e-ad65-262bd9f34363', 'Used for creating a new account from the Sign In ipart.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b0133811-7a15-49d0-ac22-7bebeebc17bd')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b0133811-7a15-49d0-ac22-7bebeebc17bd', '/EventDetail', '@/iSamples/Mobile/Event_Display', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', 'Used for displaying an event.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iSamples/Mobile/Event_Display', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3', URLMappingDesc = 'Used for displaying an event.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b0133811-7a15-49d0-ac22-7bebeebc17bd'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '42850316-3e88-418d-ac1e-7d9524e53da2')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('42850316-3e88-418d-ac1e-7d9524e53da2', '/Organization', '@/iCore/Contacts/OrganizationLayouts/Organization_Profile', NULL, '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5', 'Used for displaying a limited profile of an organization.', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '982bb8fe-c37e-4f73-9fa3-877f92fbe988')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('982bb8fe-c37e-4f73-9fa3-877f92fbe988', '/Search', '@/iCore/Content/Search', 'a9ef00fe-f87f-42a6-8150-3f3775861973', '5ad71ee6-102e-4d19-9294-83caf6fe96f6', 'Used for displaying search results.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Search', URL = '@/iCore/Content/Search', WebsiteDocumentVersionKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', TargetDocumentVersionKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6', URLMappingDesc = 'Used for displaying search results.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '982bb8fe-c37e-4f73-9fa3-877f92fbe988'
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'f86edf52-809a-4b41-abcb-9b47967ef3ea')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('f86edf52-809a-4b41-abcb-9b47967ef3ea', '/EventDetail', '@/iCore/Events/Event_Display', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '7aaa2571-9e50-4473-b894-1174ec66d004', 'Used for displaying an event.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventDetail', URL = '@/iCore/Events/Event_Display', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '7aaa2571-9e50-4473-b894-1174ec66d004', URLMappingDesc = 'Used for displaying an event.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'f86edf52-809a-4b41-abcb-9b47967ef3ea'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'dcf3b9bc-b2a5-44b1-98c2-9fb82d5904af')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('dcf3b9bc-b2a5-44b1-98c2-9fb82d5904af', '/EventEdit', '@/iCore/Events/Event_Edit', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '99580240-5ced-40f0-99ed-08b5644c1a87', 'Used when editing or adding an event.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/EventEdit', URL = '@/iCore/Events/Event_Edit', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = '99580240-5ced-40f0-99ed-08b5644c1a87', URLMappingDesc = 'Used when editing or adding an event.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = 'dcf3b9bc-b2a5-44b1-98c2-9fb82d5904af'
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2666e59d-672f-4be9-8911-a67870f4d9b6')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2666e59d-672f-4be9-8911-a67870f4d9b6', '/OrganizationAccount', '@/iCore/Contacts/OrganizationLayouts/Account_Page', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'd67d49aa-3691-4b32-856b-befd670c6001', 'Used for displaying the account page of an organization which the user can edit.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/OrganizationAccount', URL = '@/iCore/Contacts/OrganizationLayouts/Account_Page', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'd67d49aa-3691-4b32-856b-befd670c6001', URLMappingDesc = 'Used for displaying the account page of an organization which the user can edit.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '2666e59d-672f-4be9-8911-a67870f4d9b6'
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '2974407e-23fe-4b11-831e-b7cd079c64cd')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('2974407e-23fe-4b11-831e-b7cd079c64cd', '/SignIn', '@/iCore/Contacts/Sign_In', NULL, '7118bf41-8789-4cd5-bca8-d6a224a6cf2a', 'Used for signing in.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'fa83859c-edc5-413f-876f-b8f499610395')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('fa83859c-edc5-413f-876f-b8f499610395', '/ProductDisplay', '@/iCore/Store/Product_Display', NULL, '6066a460-b09a-444d-91e7-93e98db225d4', 'Used for displaying the product display list.', NULL, 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '046df23e-f4ae-45e8-b959-c691d7a341e7')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('046df23e-f4ae-45e8-b959-c691d7a341e7', '/FunctionEdit', '@/iCore/Events/Function_Edit', 'deea0907-2d5e-405c-8ec4-e9794203eadd', 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c', 'Used when editing or adding an event.', NULL, 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/FunctionEdit', URL = '@/iCore/Events/Function_Edit', WebsiteDocumentVersionKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', TargetDocumentVersionKey = 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c', URLMappingDesc = 'Used when editing or adding an event.', URLParameters = NULL, URLMappingTypeCode = 30
    WHERE URLMappingKey = '046df23e-f4ae-45e8-b959-c691d7a341e7'
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '807d2114-4fb0-4aed-8d6a-cc6d932a9d14')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('807d2114-4fb0-4aed-8d6a-cc6d932a9d14', '/Store', '@/iCore/Store/StoreLayouts/Store_Home', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '53edb360-7b6b-425f-9ec3-06418c408e24', 'Used for displaying products.', '', 20)
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = 'b27d6c89-aaf8-4ad9-a602-d840819bcb05')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('b27d6c89-aaf8-4ad9-a602-d840819bcb05', '/Store', '@/iSamples/Donor/Search', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', 'a0e1ec07-a086-46e4-8fff-81e17df7a237', 'Used for displaying products.', 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99', 30)
END
ELSE
BEGIN
    UPDATE [dbo].[URLMapping] SET DirectoryName = '/Store', URL = '@/iSamples/Donor/Search', WebsiteDocumentVersionKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', TargetDocumentVersionKey = 'a0e1ec07-a086-46e4-8fff-81e17df7a237', URLMappingDesc = 'Used for displaying products.', URLParameters = 'InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99', URLMappingTypeCode = 30
    WHERE URLMappingKey = 'b27d6c89-aaf8-4ad9-a602-d840819bcb05'
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
    VALUES ('0740e46d-83fa-4ce7-81b4-e3e2b5411742', '/FunctionEdit', '@/iCore/Events/Function_Edit', NULL, 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c', 'Used when editing or adding an event function.', NULL, 20)
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[URLMapping] WHERE URLMappingKey = '1d83c348-da2b-4c29-b6e8-f4da47b9850e')
BEGIN
    INSERT INTO [dbo].[URLMapping] (URLMappingKey, DirectoryName, URL, WebsiteDocumentVersionKey, TargetDocumentVersionKey, URLMappingDesc, URLParameters, URLMappingTypeCode)
    VALUES ('1d83c348-da2b-4c29-b6e8-f4da47b9850e', '/Profile', '@/iCore/Contacts/ContactLayouts/Profile', NULL, '7947312b-f3ac-4fb9-9353-e0e775f9e7fd', 'Used for displaying a limited profile of a user.', NULL, 20)
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

