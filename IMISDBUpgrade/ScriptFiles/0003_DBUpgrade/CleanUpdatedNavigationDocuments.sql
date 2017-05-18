-- ~/Commerce/Orders/Invoice_orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1fe0c7e3-f53c-4efc-b4cf-36be534016b6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e884d84-3068-4fe7-ab45-0001413d5cbd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1fe0c7e3-f53c-4efc-b4cf-36be534016b6' 
go

-- ~/Manage/DocumentSystem
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8384b192-b3a6-42f3-9087-49b82ba17daa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c425a5c0-3d43-468a-ab9b-006c7c5af94a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8384b192-b3a6-42f3-9087-49b82ba17daa' 
go

-- ~/Continuum/Process_Manager_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99ea5d96-5355-4481-8ab3-9c98a7d6c344' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48ef86ac-e0bd-4f96-8473-0321a4a932b2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '99ea5d96-5355-4481-8ab3-9c98a7d6c344' 
go

-- ~/Home/iMIS help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30c27617-212a-4605-81d3-9e2e1e2c5e3a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7807a4bd-a038-4492-a115-0335e8d4dc2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30c27617-212a-4605-81d3-9e2e1e2c5e3a' 
go

-- ~/Manage/Maintenance/Content_authority_groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '217fcddf-ea52-443b-8105-f41db0339989' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '216ee655-f617-45a3-a5e3-04cbd3be7cad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '217fcddf-ea52-443b-8105-f41db0339989' 
go

-- ~/Continuum/Membership_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80e80223-9bd7-42a5-b077-e45f861a0389' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95b31c36-e172-4860-841f-0640ec932aed' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80e80223-9bd7-42a5-b077-e45f861a0389' 
go

-- ~/Manage/Page_builder/Manage_layouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9e1bc63-3ff1-42ae-b8d4-1d49a59340ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da4b33c8-d91b-46a3-bfe1-081d31057c97' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a9e1bc63-3ff1-42ae-b8d4-1d49a59340ab' 
go

-- ~/Membership/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a890c4d7-ff26-4ef0-9448-a70efc0d324d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c56f244-f19e-44e4-a578-0820dcdb01f2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a890c4d7-ff26-4ef0-9448-a70efc0d324d' 
go

-- ~/Fundraising/Pledge_debit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f85b570-c8a0-4f3c-ab36-3d4b4ab45126' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48213e13-ec51-47dc-a52e-0878973775c1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7f85b570-c8a0-4f3c-ab36-3d4b4ab45126' 
go

-- ~/Issues/Issues help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32f143ee-5d56-48ee-9f0f-af8a726eac41' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dee621d6-cc5b-45d4-a42c-090d85b3e8d3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32f143ee-5d56-48ee-9f0f-af8a726eac41' 
go

-- ~/Fundraising/Recurring_donations/Generate_expected_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f70bf86c-21a3-49a2-8bfc-cda28177f511' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '86f38505-a8de-4e8c-ad62-0ab90c06ea7c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f70bf86c-21a3-49a2-8bfc-cda28177f511' 
go

-- ~/Manage/Page_builder/View_task_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1aab5842-3874-4fef-902f-9890d8ed8c8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f61dc0a-a4a9-49d0-96d4-0c2bca46b3c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1aab5842-3874-4fef-902f-9890d8ed8c8b' 
go

-- ~/AR_Cash/Adjustments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1db2b677-a896-48c4-98ba-e0eef8e6cf64' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eed96820-da1a-4ecd-ae38-0c862d62d9b0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1db2b677-a896-48c4-98ba-e0eef8e6cf64' 
go

-- ~/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6e32b50-3847-4cf3-a560-55aac664c1e7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1df5b4c9-f94d-4950-ab0c-0d5561b3dfcf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b6e32b50-3847-4cf3-a560-55aac664c1e7' 
go

-- ~/Settings/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef76668d-eb1d-4609-b0d8-c4f288aa757d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50c0a58b-72fc-4784-bb15-0db6679c896e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef76668d-eb1d-4609-b0d8-c4f288aa757d' 
go

-- ~/Settings/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b11a3255-9eff-4ab4-8618-8ff8839a2c79' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50b88949-df9e-42c0-aa26-0df2d88bd983' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b11a3255-9eff-4ab4-8618-8ff8839a2c79' 
go

-- ~/Billing/Billing help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6924a9e9-e172-402c-ba66-1d9a360febfc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b5c2f777-08b9-4e4d-8d35-0e3737ea0cd6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6924a9e9-e172-402c-ba66-1d9a360febfc' 
go

-- ~/Documentation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '569e8420-de58-4679-8ba2-378b2eba8ff5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '670be00e-c8e8-4f60-b149-0e8017852837' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '569e8420-de58-4679-8ba2-378b2eba8ff5' 
go

-- ~/Settings/Membership/Set_up_tables/Committee_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0deeb6f3-48f1-4c8c-8c1a-aa1ce27522b3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d421488-655a-4648-920d-0f535e724184' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0deeb6f3-48f1-4c8c-8c1a-aa1ce27522b3' 
go

-- ~/Manage/Maintenance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac90b704-4575-48de-9c39-907774d530b1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33c91c0a-2c60-4dad-8334-1003ce8416d9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac90b704-4575-48de-9c39-907774d530b1' 
go

-- ~/Service Central/Service Central help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d3ddfa0-4b01-4f7d-8bfd-e85511ba6923' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d61677c-87c9-4702-89d9-109e3630ee27' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d3ddfa0-4b01-4f7d-8bfd-e85511ba6923' 
go

-- ~/Fundraising/Process_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea27c907-370e-43a9-8289-a63535f3688d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4d51556-f815-40e2-bcc8-10c6622a23c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea27c907-370e-43a9-8289-a63535f3688d' 
go

-- ~/Settings/Membership/Set_up_tables/Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddf765e8-2acf-4fa8-b0fc-6ab9e4e57d7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c119d2c-a849-45fc-844e-1243928cbad3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ddf765e8-2acf-4fa8-b0fc-6ab9e4e57d7a' 
go

-- ~/Settings/Events/Set_up_tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1f4d69e-9866-4e14-836b-e516156fea47' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d27f36b-aa25-41ae-ba1c-13f3c51b7c57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f1f4d69e-9866-4e14-836b-e516156fea47' 
go

-- ~/Community/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8fc7b80-b8d2-4e57-b0e2-70bccd622982' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45db5da6-904e-4a3f-86ad-166d24dfd8db' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b8fc7b80-b8d2-4e57-b0e2-70bccd622982' 
go

-- ~/Events/IQA
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd68ff0e-3252-415a-9df5-9a777609e68c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ea93758-7bfe-4c98-a49f-170ed95f01d7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dd68ff0e-3252-415a-9df5-9a777609e68c' 
go

-- ~/Manage/Tagging/Define_tags
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6a16850-a151-4981-82ae-b39754f7efc3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e59ca5e7-a75e-4c63-9e55-177ba347eb95' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a6a16850-a151-4981-82ae-b39754f7efc3' 
go

-- ~/Settings/Fundraising/Set_up_tables/Funds
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd78e8640-54dc-4f85-b52f-f8f5b0fb543c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e422864d-2bef-4f40-bbc1-17be1840d7c3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd78e8640-54dc-4f85-b52f-f8f5b0fb543c' 
go

-- ~/AR_Cash/Options
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79447896-9143-4082-9400-703c51951d59' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49b2fcf4-fabc-4169-9201-1a0b811e0a06' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '79447896-9143-4082-9400-703c51951d59' 
go

-- ~/Settings/Fundraising/Set_up_tables/Campaigns
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24c74d20-6bb7-4dba-b43a-3c33295a737c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0d0948d-acf6-4752-9093-1ba60c1b157a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '24c74d20-6bb7-4dba-b43a-3c33295a737c' 
go

-- ~/Continuum/FR_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '70690e99-9900-4b4d-9e2c-c25057b9927a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7220e8fd-ea69-4c50-9b19-1d086c932254' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '70690e99-9900-4b4d-9e2c-c25057b9927a' 
go

-- ~/AR_Cash/Options/Set_up_tables/DueTo_DueFrom
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ac2f21d-eb86-4622-84fa-394d0c847e50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac7c3a5e-6954-4f00-9331-20a2def14961' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1ac2f21d-eb86-4622-84fa-394d0c847e50' 
go

-- ~/System Setup/System setup help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '074e865b-3351-47ae-961b-3fb93af48ba7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a05bad8f-cd65-4103-ba0e-212a2275458b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '074e865b-3351-47ae-961b-3fb93af48ba7' 
go

-- ~/Manage/Maintenance/Publishing_servers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d68e771-623f-4096-a0f1-ce1857d50a30' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bee031b4-0b0f-44cc-a791-222fb5aa5e00' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d68e771-623f-4096-a0f1-ce1857d50a30' 
go

-- ~/Subscriptions/Subscriptions help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b8db5ce-9026-4d3c-9f8a-61898fef6c7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91895b13-2822-41ad-8860-22f61833a7c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5b8db5ce-9026-4d3c-9f8a-61898fef6c7a' 
go

-- ~/My_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05b22797-6ac1-4557-8762-a142e9b31a55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46c21d89-99fb-447b-84d9-244921425bf3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '05b22797-6ac1-4557-8762-a142e9b31a55' 
go

-- ~/AR_Cash
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c398b684-a629-4bbb-9352-11d503ca8694' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a13ee49-cac4-43c5-986d-245d6f5733dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c398b684-a629-4bbb-9352-11d503ca8694' 
go

-- ~/Manage/Site_builder/Manage_Shortcuts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ff3224e-7c81-4e2f-9f3c-6ea417cf0f00' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dc5e4548-a0b5-473d-b1e3-26d9beaa99f1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ff3224e-7c81-4e2f-9f3c-6ea417cf0f00' 
go

-- ~/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38b9cb7c-b99c-4a5c-a4bd-25e4b6f89b49' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f4c2a14-9524-45bd-9d1f-288d179883fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38b9cb7c-b99c-4a5c-a4bd-25e4b6f89b49' 
go

-- ~/Fundraising/Recurring_donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '699dec8f-4b8e-4986-9cf5-9eaadd56f2b5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '365f9e45-4a0d-423c-bd68-290a0e20205b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '699dec8f-4b8e-4986-9cf5-9eaadd56f2b5' 
go

-- ~/My_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24b8d7da-c3ec-4ec8-af3f-47e68a275df2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5fa446ca-ea32-454e-b5fc-2932bbc48048' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '24b8d7da-c3ec-4ec8-af3f-47e68a275df2' 
go

-- ~/Education/Education_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8cf54a3-697f-4a35-bb1f-c1925f9ee937' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c209ba2a-ece8-4ba0-9188-296c498b865f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8cf54a3-697f-4a35-bb1f-c1925f9ee937' 
go

-- ~/Continuum/Fundraising_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1423300c-13fa-41ee-bde9-9f0b043fd1b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af7226c0-27e7-4fd7-908e-29859ed59a49' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1423300c-13fa-41ee-bde9-9f0b043fd1b7' 
go

-- ~/Settings/SettingsConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '04eec703-b614-458e-8b1b-fa243cd65ee2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'efbccda3-3ca6-4a60-991b-29ca64358dd0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '04eec703-b614-458e-8b1b-fa243cd65ee2' 
go

-- ~/Marketing/Marketing help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '918fe3ea-6d24-4e29-b299-11862528b967' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '680802d8-31c2-4071-901c-2b77dead172b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '918fe3ea-6d24-4e29-b299-11862528b967' 
go

-- ~/AR_Cash/Adjustments/Accrual_dues_credit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e6a924c-6604-492c-ac43-be5941b33647' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f83a52c-7609-4992-9a36-2bd387d5c1a4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2e6a924c-6604-492c-ac43-be5941b33647' 
go

-- ~/Manage/Maintenance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a4791b2-5056-42c7-bb75-a7cf43b1d5e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '979de28e-cb48-46cf-87d0-2c0c75330143' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8a4791b2-5056-42c7-bb75-a7cf43b1d5e1' 
go

-- ~/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6fba54ba-7f73-4f46-8c89-2ca5b593e04b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
go

-- ~/Settings/Commerce/Warehouses
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6c96f18a-8bd3-4ae4-a753-dc01c14c2d03' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '104905b9-0338-4d71-9e8c-2cee9912fd6e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6c96f18a-8bd3-4ae4-a753-dc01c14c2d03' 
go

-- ~/Settings/Fundraising/Sender_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b0f4d20-3217-4d5e-a7c8-41e5e0fa060f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f2298f6-f837-417e-8045-2d91a4ed4914' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b0f4d20-3217-4d5e-a7c8-41e5e0fa060f' 
go

-- ~/Process Mgr/Process manager help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff7e2e47-f9bc-4fbe-951c-2a5392ca4512' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60cd6ede-dd06-4a04-a489-2e84effb2299' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff7e2e47-f9bc-4fbe-951c-2a5392ca4512' 
go

-- ~/Fundraising/Manage_requests
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea4fed68-b103-4e85-8ca9-63943a2558ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '794fff82-916f-4716-9cf7-2eafc1ccb12c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea4fed68-b103-4e85-8ca9-63943a2558ad' 
go

-- ~/Manage/Maintenance/User_defined_fields
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be08c621-d841-4fe9-aa2f-3b2a80ed61c4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef0258dc-c910-4d86-9f98-2f68d6537d5e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'be08c621-d841-4fe9-aa2f-3b2a80ed61c4' 
go

-- ~/Home/IQA
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eda95b78-9202-4e5c-a06b-3312b9529c17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c7fa6bb-b237-42e3-9424-2fa5f4d6b113' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eda95b78-9202-4e5c-a06b-3312b9529c17' 
go

-- ~/System_admin/Site_builder/Manage_sitemaps
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64cb20d4-9a6f-4d24-9f89-bccaf73c66a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '337d5705-b8ff-43d1-ad52-2fd466634455' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64cb20d4-9a6f-4d24-9f89-bccaf73c66a8' 
go

-- ~/My_Account_Utility
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d338ef2-b2f0-45a6-bd39-50408b712723' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a4e1c52-4d17-486e-b85e-30231a420853' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9d338ef2-b2f0-45a6-bd39-50408b712723' 
go

-- ~/Home/IQA/Prospects
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c364cfc3-0122-4970-b9f5-d1838dd4d89f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05614270-0945-4698-8f41-3299cf9a9218' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c364cfc3-0122-4970-b9f5-d1838dd4d89f' 
go

-- ~/Community/Manage_segmentation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '342640e2-3e31-49bc-a087-95196e429dfc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '51473c22-1a5f-42bb-a022-335f0ded0a29' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '342640e2-3e31-49bc-a087-95196e429dfc' 
go

-- ~/Home/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '013213c8-8360-4a99-9734-a30c1d77d33c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b1ae717-3d6a-4339-b7b5-338cd2d4025e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '013213c8-8360-4a99-9734-a30c1d77d33c' 
go

-- ~/Content_Management/Page_builder/Manage_content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a5f465e-a777-47a3-a1ee-4e9392e55a9c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffee1059-675a-4abc-89da-33b900ab7ac1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3a5f465e-a777-47a3-a1ee-4e9392e55a9c' 
go

-- ~/Manage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c2a03a7-67d1-4aaa-bfea-768dbd6fd484' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94e31001-ce5a-4963-97ee-39cf39b6633a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c2a03a7-67d1-4aaa-bfea-768dbd6fd484' 
go

-- ~/System_admin/Workflow/Monitor_processes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e99b17f-9baa-4140-9619-108f1c91ccfe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd395e133-170f-4940-a7c0-39d3eb0ebc28' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5e99b17f-9baa-4140-9619-108f1c91ccfe' 
go

-- ~/Continuum/RFM_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b158227-2cc9-49be-b6c5-62cb9eec1706' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11370a46-e44b-483c-a14c-39faa4be831e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b158227-2cc9-49be-b6c5-62cb9eec1706' 
go

-- ~/Certification/Certification help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a6929aa-34f9-45b5-91fd-a41c31e4c4b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed6843b2-6e37-4a94-ac76-3a01f2716fa2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7a6929aa-34f9-45b5-91fd-a41c31e4c4b4' 
go

-- ~/AR_Cash/Options/Set_up_tables/Tax_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5fce3074-0ed2-477b-a6c8-f6d78f85b496' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0ff1d24-e3a3-4ac6-98d3-3a1d2247c237' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5fce3074-0ed2-477b-a6c8-f6d78f85b496' 
go

-- ~/Events/Events help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82fd822d-3184-4fd1-b897-0b58ad269b2d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cccfc693-3231-46d5-8a94-3ab3336a3a45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '82fd822d-3184-4fd1-b897-0b58ad269b2d' 
go

-- ~/RiSE/Set_up_RiSE
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cec143c6-630a-4bd7-b787-2b5c3f4c7bd9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cec143c6-630a-4bd7-b787-2b5c3f4c7bd9' 
go

-- ~/Manage/BusinessObjectDesigner
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99934687-db0f-4453-96ad-8148eeeb5d6a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '794327e1-5e30-4932-8f78-3ced922a10fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '99934687-db0f-4453-96ad-8148eeeb5d6a' 
go

-- ~/AR_Cash/Options/Set_up_tables/Cash_accounts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd66cab2d-43ea-4296-9baf-3ad4d6ab1be3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15218a87-1f26-4905-8392-3f690a39e02d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd66cab2d-43ea-4296-9baf-3ad4d6ab1be3' 
go

-- ~/Manage/Maintenance/Content_authority_groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2371ab5b-5a2d-421f-b766-ec1f46225a33' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ec7e58b-4fcb-4b56-b7d2-408f667fb342' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2371ab5b-5a2d-421f-b766-ec1f46225a33' 
go

-- ~/Continuum/Membership_Reports/Billing_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f8a965b-1964-4d7b-98d1-79d1aef9df8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9697d86d-463b-4465-96c3-4096eb5b0dec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2f8a965b-1964-4d7b-98d1-79d1aef9df8b' 
go

-- ~/Content_Management/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b1d05e2-15b8-47a2-9bbf-8df3af90fb37' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b4a2aace-2059-4cb7-830c-40a18d335d17' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b1d05e2-15b8-47a2-9bbf-8df3af90fb37' 
go

-- ~/Marketing/Marketing help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b359fc7-f04a-4db8-8239-a71c8ee72f1e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da2e77ca-081e-4d5f-ba63-416d0186d0fa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b359fc7-f04a-4db8-8239-a71c8ee72f1e' 
go

-- ~/Home/Membership/Payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53baaa5e-8cf3-4c31-a2c6-6d0f4c73a276' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8b5b47b-7e90-4826-bfbf-419dd6b0dfaf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '53baaa5e-8cf3-4c31-a2c6-6d0f4c73a276' 
go

-- ~/AR_Cash/Options/Set_up_tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87ec50b7-2506-4e5a-8396-2f39584b0212' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a92e4f0-238d-4f26-bc2b-420cc797e34d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87ec50b7-2506-4e5a-8396-2f39584b0212' 
go

-- ~/Settings/Membership/Set_up_tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2dbb082c-10e0-4764-a247-c8889eb68830' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0407d73-4604-483c-9571-42364aa9b9e4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2dbb082c-10e0-4764-a247-c8889eb68830' 
go

-- ~/Manage/Page_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2955e6c-e1c0-4774-af66-0388067f7711' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '619c8159-629c-4967-8867-42c81e4c491c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a2955e6c-e1c0-4774-af66-0388067f7711' 
go

-- ~/Certification/Set_up_programs/Experience_programs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d3f49d9-a61a-42cd-9e32-75157ea8d763' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '664e65af-2f90-4a03-b045-42f687923faa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d3f49d9-a61a-42cd-9e32-75157ea8d763' 
go

-- ~/System Setup/System setup help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e18bf6fb-5738-404e-a7d6-13c448877eff' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1ca04a5-b6a8-492f-9b43-4389e1e47945' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e18bf6fb-5738-404e-a7d6-13c448877eff' 
go

-- ~/Fundraising/Fundraising_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '751fee69-6e9e-4b92-b546-676909f8d42d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95bc17e4-c7a9-4e17-80c3-4434d0c93629' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '751fee69-6e9e-4b92-b546-676909f8d42d' 
go

-- ~/Communities/Communities_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0b10d34-f4d2-4c94-b934-addbc4de65a0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6708c0de-5d44-448e-bacb-463598238b36' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd0b10d34-f4d2-4c94-b934-addbc4de65a0' 
go

-- ~/Home/IQA/Orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed92bfff-c759-439c-82a6-3034cce0bb9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0db0542-3f3b-41fe-8a70-477d222e6d5e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ed92bfff-c759-439c-82a6-3034cce0bb9e' 
go

-- ~/AR_Cash/Adjustments/Pledge_credit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3e64c6b-2468-47b4-9836-da28e659d754' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b51762d0-d179-481b-943b-47fd443dda58' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e3e64c6b-2468-47b4-9836-da28e659d754' 
go

-- ~/Continuum/Content_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d0bbac2-b371-4d72-972d-d4c1c04b5a75' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddb1749d-e661-4e92-a0f0-490b60442fd0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d0bbac2-b371-4d72-972d-d4c1c04b5a75' 
go

-- ~/Events/Event_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af778f9e-4901-4fbd-b7d1-10b83590213b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8cfb4ff0-816a-4b14-89e8-49582b9ed7ad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af778f9e-4901-4fbd-b7d1-10b83590213b' 
go

-- ~/Manage/Maintenance/Publishing_servers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcea03f5-1e59-4da7-b6a4-f1396b89c522' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1653df3a-cc1d-4304-8cc5-49c1db5f576c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bcea03f5-1e59-4da7-b6a4-f1396b89c522' 
go

-- ~/Home/IQA/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17529946-eb4c-4a3c-bc61-b59b515df893' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9dde317f-8ccb-4fee-b46e-49d27da4e73c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17529946-eb4c-4a3c-bc61-b59b515df893' 
go

-- ~/Settings/Billing
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80a1608e-b422-4859-8d43-a82099887fd6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9be62eac-37b7-4045-bb70-4a1d98146716' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80a1608e-b422-4859-8d43-a82099887fd6' 
go

-- ~/Events/Find_events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9532ef7e-d3cd-41c4-91d1-81bee58b7da5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b82cab22-0a96-4557-a334-4e0081efe92d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9532ef7e-d3cd-41c4-91d1-81bee58b7da5' 
go

-- ~/Commerce/Orders/Print_shipping_papers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fdce20ce-01bf-4068-aa4a-824f4ad432b3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e7e6355-70c4-44fa-850c-4ea91a225368' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fdce20ce-01bf-4068-aa4a-824f4ad432b3' 
go

-- ~/Continuum/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '974cbba0-059b-4f16-85d3-02183dba48bb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6255cec7-8cfc-4f75-92b2-4f8ee1b5d26c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '974cbba0-059b-4f16-85d3-02183dba48bb' 
go

-- ~/Commerce/Inventory/Release_backorders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fdeb8f5-baf2-483b-8ba5-07f90f4a7d29' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c0477f8-ba93-40d1-bbf1-520038312dcc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0fdeb8f5-baf2-483b-8ba5-07f90f4a7d29' 
go

-- ~/Content_Management/Content_Management_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af5270cc-9bd8-49f1-b3ca-7491a8ccf2fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd6ea3a9-87c4-4c32-8567-5270b48128f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af5270cc-9bd8-49f1-b3ca-7491a8ccf2fe' 
go

-- ~/Manage/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00d3032f-e01c-4884-b552-269bfc589e5b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46e483c7-d55f-4431-8f92-52df89022f75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '00d3032f-e01c-4884-b552-269bfc589e5b' 
go

-- ~/Tools/Tools_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17bc5f82-fad8-4cbc-bbaa-77e3fd612022' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b912076e-a8d5-48d3-8ea1-53a4cbab1cef' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17bc5f82-fad8-4cbc-bbaa-77e3fd612022' 
go

-- ~/Exhibition/Exhibition help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '576aa129-1341-434c-9f4d-a1e8bd6abe38' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9675dcd3-73aa-459f-b133-53a81e9ffb12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '576aa129-1341-434c-9f4d-a1e8bd6abe38' 
go

-- ~/Commerce/Orders/Print_quotes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94d18c0f-f2b8-461d-93d1-e14b8608c8b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6cd3a57a-017b-48b6-b687-56931bce7779' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '94d18c0f-f2b8-461d-93d1-e14b8608c8b0' 
go

-- ~/Manage/Page_builder/Manage_content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b7805771-e87b-4e7f-bedc-9993eab713cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13e3bef7-84dc-4c67-9c90-5698cd173a55' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b7805771-e87b-4e7f-bedc-9993eab713cf' 
go

-- ~/Manage/Page_builder/Manage_layouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4753dcf1-7eaf-4a03-9834-bab23313e53a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40e4954e-038a-493e-868b-58105aee6d3e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4753dcf1-7eaf-4a03-9834-bab23313e53a' 
go

-- ~/Manage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3ef9ce5-a1b7-48d9-be49-1798719bb23a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dcf78247-b509-4b5b-b8e6-588021e1482d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e3ef9ce5-a1b7-48d9-be49-1798719bb23a' 
go

-- ~/RiSE/Set_up_RiSE/Page_builder_configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23f050ae-7492-4d97-b3d8-5048e43d85ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1820efcb-c05a-4164-a02f-59c0b3365745' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '23f050ae-7492-4d97-b3d8-5048e43d85ec' 
go

-- ~/Registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '962335a7-290c-4751-8777-972e03244d50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '551f0237-8c5e-44af-b405-5b42925af74e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '962335a7-290c-4751-8777-972e03244d50' 
go

-- ~/Tools/Utilities/Package_Installer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2feaa83-1ad9-4d92-8e42-4d6370ab0d5e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2bb175a-5fab-4595-bee7-5c46ff12a170' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a2feaa83-1ad9-4d92-8e42-4d6370ab0d5e' 
go

-- ~/Home/Events/Register
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2a7c01f-58d2-4487-9a39-9c5cb9db5370' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36d101cc-7b8e-4bd7-903d-5d9a2ba8194b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd2a7c01f-58d2-4487-9a39-9c5cb9db5370' 
go

-- ~/My_Account_Utility
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'adb7546d-2531-4cd8-9ff6-074e77993c80' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '579f8c40-731b-4842-9d61-5db19afefb80' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'adb7546d-2531-4cd8-9ff6-074e77993c80' 
go

-- ~/System_admin/Workflow/View_tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e8a66c5-ab64-44f8-959a-d50066fbae35' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80ce3c41-f439-4881-a93f-5f1de7e51dbc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5e8a66c5-ab64-44f8-959a-d50066fbae35' 
go

-- ~/AR_Cash/Options/Set_up_tables/Terms
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '688f49f2-df66-4e68-8c0e-950950b83a1d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a0e38354-fe63-48ad-af69-5f5ed17ace72' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '688f49f2-df66-4e68-8c0e-950950b83a1d' 
go

-- ~/Continuum/Other_Reports/Custsvc_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38c6dd6c-2692-4956-aae4-874eb11c8913' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '35e21bbb-2f52-4c08-abce-5f8116785035' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38c6dd6c-2692-4956-aae4-874eb11c8913' 
go

-- ~/Certification/Set_up_programs/Unit_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27e2c8ab-2715-4fb2-be8b-3fc5b90fed65' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5e3c87e-617b-40bd-a7e2-60c6248c6680' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '27e2c8ab-2715-4fb2-be8b-3fc5b90fed65' 
go

-- ~/Events/Event_calendar
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd1d226da-250b-4ccb-b737-7c6ec4231874' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd232df7-47f8-42e6-bace-627ca538d6d9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd1d226da-250b-4ccb-b737-7c6ec4231874' 
go

-- ~/RiSE/Intelligent_Query_Architect
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6bc7c570-b7fc-4393-aebf-bece2a863dc2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f4ea893e-6b67-4b23-ba44-62f8aee84271' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6bc7c570-b7fc-4393-aebf-bece2a863dc2' 
go

-- ~/Continuum/Other_Reports/Credit_card_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc6f7995-f870-4317-99e1-b41900a798bc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4688d0ad-9375-460e-a676-632a2806f87a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc6f7995-f870-4317-99e1-b41900a798bc' 
go

-- ~/System_admin/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8995e94e-8f30-4df6-a416-e218558f4f12' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71a7b773-d772-4728-b9a5-63fed0c9e416' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8995e94e-8f30-4df6-a416-e218558f4f12' 
go

-- ~/Continuum/Guided_Performance_Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3c314c1-a6fc-4b91-9340-be6222aa52cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9227fadb-64ef-4f4c-9523-6436e6e774d8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f3c314c1-a6fc-4b91-9340-be6222aa52cf' 
go

-- ~/Settings/Membership/Set_up_tables/State_province_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c17fd37-f5fb-466e-83f1-8eebceb3c9a6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd600cd11-f054-40d1-aad1-66012c049916' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c17fd37-f5fb-466e-83f1-8eebceb3c9a6' 
go

-- ~/AR_Cash/Adjustments/Accrual_dues_debit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff0e7a34-7081-4576-a7a8-22af77e7db6b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe9fddb9-d6e1-4c52-800a-6805b9ab29c5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff0e7a34-7081-4576-a7a8-22af77e7db6b' 
go

-- ~/Community/Manage_marketing_campaigns
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8295e10-9162-459c-85c9-f61751f64626' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '321b0c4f-032e-477f-ae17-6811fe3d7127' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8295e10-9162-459c-85c9-f61751f64626' 
go

-- ~/Continuum/Campaign_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '67cad6eb-b579-45d1-a6e8-3368310cc534' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49fed7b1-af0e-4c4f-9104-682ea0f21b30' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '67cad6eb-b579-45d1-a6e8-3368310cc534' 
go

-- ~/Fundraising/Recurring_donations/Import_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f9ed497-dfde-4c12-99e4-f6bd8fd86187' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c71ef7d2-e5e6-45ba-8126-68f835bca1eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4f9ed497-dfde-4c12-99e4-f6bd8fd86187' 
go

-- ~/AR_Cash/Adjustments/Credit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49e233ff-d54e-42cd-9d9a-5327bc1d52ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0bd2df4-85bb-4181-a208-69b6e3e24daf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '49e233ff-d54e-42cd-9d9a-5327bc1d52ab' 
go

-- ~/AR_Cash/Transactions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dc0027fd-d055-4897-8a2c-f44f2d36392b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac79b76a-0f32-4a95-9d52-6a8937977e56' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dc0027fd-d055-4897-8a2c-f44f2d36392b' 
go

-- ~/Donations/Donations_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53941b97-fc54-4151-b528-61a5433917b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c2f7e1bd-a101-4cba-a186-6aa8f2e3f559' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '53941b97-fc54-4151-b528-61a5433917b0' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd1c1cd8-917b-4475-b356-f5e09f8b61be' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ebabdbbb-a7da-45d7-88ae-6ae2a087917e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd1c1cd8-917b-4475-b356-f5e09f8b61be' 
go

-- ~/AR_Cash/Adjustments/Pledge_debit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c002532c-67ad-4309-b9b6-6e3315bec51c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0981c3ad-a1bc-4541-b62b-6bc0a57f4487' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c002532c-67ad-4309-b9b6-6e3315bec51c' 
go

-- ~/Continuum
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf034b9f-789b-4638-a698-e1f83ceda105' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be62478f-d245-4588-a762-6d01de29ae24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cf034b9f-789b-4638-a698-e1f83ceda105' 
go

-- ~/Manage/Page_builder/View_task_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ecc43073-4fe3-4560-ad67-1627ebde2783' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fb36623-527c-4a7d-bc70-6e19f78ed17f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ecc43073-4fe3-4560-ad67-1627ebde2783' 
go

-- ~/Settings/Membership/Set_up_tables/Country_names
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca8eecbd-52d9-4663-a689-ddbf24e778ac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f29a9ce6-ee91-4e24-9066-6e67f4e12027' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca8eecbd-52d9-4663-a689-ddbf24e778ac' 
go

-- ~/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c2a695f-4b5b-4bdd-8a60-cf420614c5d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca61e544-a05c-47ed-bb16-6f77126e349a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9c2a695f-4b5b-4bdd-8a60-cf420614c5d3' 
go

-- ~/System_admin/Site_builder/Manage_shortcuts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7522baa1-e441-4e7f-b96f-39bfb651c5d4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5991f8c0-3fd6-435f-a8f3-712a0a1ab524' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7522baa1-e441-4e7f-b96f-39bfb651c5d4' 
go

-- ~/AR_Cash/Transactions/Sales_transactions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '093a767b-2e5d-42eb-9215-01f526af2c50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e49fb3c5-ad5d-4040-aafe-71594bd9b0f1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '093a767b-2e5d-42eb-9215-01f526af2c50' 
go

-- ~/Settings/Fundraising/Set_up_module
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0909fbce-c61d-48ce-b34b-1c4dd4dbf964' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '031b350d-82b2-41fd-96b5-7297a1edfade' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0909fbce-c61d-48ce-b34b-1c4dd4dbf964' 
go

-- ~/Contacts/Contacts help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eaca3dc8-3b49-4205-aa4d-66f17327fd6a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74a6e970-9e6e-4adc-b3f0-72c758bbf589' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eaca3dc8-3b49-4205-aa4d-66f17327fd6a' 
go

-- ~/Settings/Membership/Area_code_updates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3cb76607-da63-4f83-928f-8690c2dfd1f3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f55497f9-c79a-4f6c-a171-73e6f3ebe12c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3cb76607-da63-4f83-928f-8690c2dfd1f3' 
go

-- ~/Settings/Fundraising/Interest_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68fface7-9145-4d98-8fe5-2e9395533ada' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f39b48b8-b4e3-48e0-b3ea-74997174ccc0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '68fface7-9145-4d98-8fe5-2e9395533ada' 
go

-- ~/Fundraising/Set_up_appeal_expenses
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef861ae2-f0e3-441e-a961-d31a0f678c2d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37e99c80-d4a3-4dc7-93d4-74b8768d4098' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef861ae2-f0e3-441e-a961-d31a0f678c2d' 
go

-- ~/Settings/Membership/Set_up_tables/General_lookup_validation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8d477ccc-7abb-45ba-b400-d3c3b14ed94e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '621dda7c-a578-428b-a16b-74c2913eb4fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8d477ccc-7abb-45ba-b400-d3c3b14ed94e' 
go

-- ~/Settings/Membership/Set_up_tables/Country_address_layouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe984749-d84d-4b60-963f-c8a3992b87b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea6a11e2-0d7e-4b74-9971-76239afbf99a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fe984749-d84d-4b60-963f-c8a3992b87b2' 
go

-- ~/Certification
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca176b3d-df75-41e2-b642-c05fa6fc11d2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ef06daf-84ad-44a8-95e8-772f1459b519' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca176b3d-df75-41e2-b642-c05fa6fc11d2' 
go

-- ~/Manage/IntelligentQueryArchitect
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39ab8c80-28e7-40ae-9764-12d5fe8a6018' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b05091e-6247-430f-88d4-77390cdf4ebd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '39ab8c80-28e7-40ae-9764-12d5fe8a6018' 
go

-- ~/Manage/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac3b2b01-a8fc-4194-bfdb-1c6d5d94d68a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '700a1a34-3c20-43b1-817c-7743401a7671' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac3b2b01-a8fc-4194-bfdb-1c6d5d94d68a' 
go

-- ~/Content_Management/Page_builder/Manage_layouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05ac190d-df76-47dd-9284-ec5a5815a4a4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2db2dff6-af52-4f28-a475-77a2bdcf225b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '05ac190d-df76-47dd-9284-ec5a5815a4a4' 
go

-- ~/Customers/IQA
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3cb7cfd-43b6-43f9-aad5-1f47207024b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d89a25c-2522-4fc4-aa22-7ac586f8a06a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b3cb7cfd-43b6-43f9-aad5-1f47207024b4' 
go

-- ~/Settings/Billing/Billing_cycles
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '383b7ed8-4414-48f1-8434-7897e8fe0e61' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5207c21-75fc-464e-9c6b-7c19e54f12bd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '383b7ed8-4414-48f1-8434-7897e8fe0e61' 
go

-- ~/Certification/Set_up_programs/Program_components
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b4b581e-78a6-4117-aedd-af114c1098d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84ac5dbb-186b-4289-9dae-7ee20560dc24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7b4b581e-78a6-4117-aedd-af114c1098d3' 
go

-- ~/Continuum/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '04868e56-127b-4567-96f5-c83f2e3d1ee8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44df5f36-d000-4c1d-85e9-7f5810bc3ab0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '04868e56-127b-4567-96f5-c83f2e3d1ee8' 
go

-- ~/System_admin/iMISManagement/Printers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '337d8f96-7cae-4816-b0f1-56466a24b4fc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f48b6014-532e-4973-b603-7f7b448a72f1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '337d8f96-7cae-4816-b0f1-56466a24b4fc' 
go

-- ~/Settings/Commerce/Set_up_tables/Freight_by_weight
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab2b4970-3137-4f64-867c-b0141189d5d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e54e23f-3ede-4738-8ece-7f9ecad1d553' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ab2b4970-3137-4f64-867c-b0141189d5d8' 
go

-- ~/Education/Education_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5200e5a3-fffa-4ca5-a637-401e0caa3750' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ab8bb49-b8af-48ee-b748-80db2844373d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5200e5a3-fffa-4ca5-a637-401e0caa3750' 
go

-- ~/Settings/Commerce/Set_up_tables/Tax_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '785c5ced-12c2-4ade-9715-7cd5587dfc07' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc4d663a-8aec-4d22-a1af-813d6f0678ae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '785c5ced-12c2-4ade-9715-7cd5587dfc07' 
go

-- ~/Certification/Set_up_programs/Certification_programs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '788b2871-d069-4aae-bbca-6104bdd9b165' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d8de77f-8f55-42ec-9f4f-81e2c2840b75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '788b2871-d069-4aae-bbca-6104bdd9b165' 
go

-- ~/Settings/Membership/Customer_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff9fd0c4-960d-4f70-b717-c4d2fff6472c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed9abbdf-f3b5-4ead-aadb-82e6658f92d3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff9fd0c4-960d-4f70-b717-c4d2fff6472c' 
go

-- ~/Community/Process_Manager/Manage_processes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a40d15a4-61cd-4417-b8dc-05f4978f9b92' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e486dcb8-a5c9-40b4-9eb1-84fd1c4d5d08' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a40d15a4-61cd-4417-b8dc-05f4978f9b92' 
go

-- ~/AR_Cash/Transactions/Cash_receipts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc03aa3c-961a-488b-bf74-4091aa251dcd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c61022e-a07c-4224-ab2d-873b5464879d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc03aa3c-961a-488b-bf74-4091aa251dcd' 
go

-- ~/Settings/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2bf75f0a-9e5e-4d87-bb69-a1879d536740' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '301bb1fd-194d-4c2e-826d-887582ec220d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2bf75f0a-9e5e-4d87-bb69-a1879d536740' 
go

-- ~/Fundraising/Pledge_credit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6634bf01-4784-4456-9eff-ea458deaea4d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '232f6592-dbf2-4fdd-b151-887b3a038618' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6634bf01-4784-4456-9eff-ea458deaea4d' 
go

-- ~/Settings/Fundraising/Set_up_tables/Appeals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5e2c11b-1a9f-4b68-8576-29945ddaaaaa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4705b43a-ad98-49af-b70c-892da02e3bc3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f5e2c11b-1a9f-4b68-8576-29945ddaaaaa' 
go

-- ~/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e85d455d-dfa4-44bf-882a-273b5cdc7dd6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9074916d-efb2-4374-a783-8b8fd886f59c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e85d455d-dfa4-44bf-882a-273b5cdc7dd6' 
go

-- ~/Orders/Orders help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21b21bdb-8708-4e33-a477-63bcd7dbadae' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97463c5f-a07d-463c-8681-8c4ac4cba0f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '21b21bdb-8708-4e33-a477-63bcd7dbadae' 
go

-- ~/Continuum/Membership_Reports/Contact_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5916f138-a2f6-4b7c-a9a1-9dc0078a3484' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '878be44e-7271-4d36-9c67-8cb35633453e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5916f138-a2f6-4b7c-a9a1-9dc0078a3484' 
go

-- ~/Continuum/Other_Reports/SOE_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e871f59-a85c-4b18-b58c-36a894b933c6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cadb7140-4fe6-40f1-8441-8d0860993ef3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8e871f59-a85c-4b18-b58c-36a894b933c6' 
go

-- ~/Settings/Billing/General_options
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7bbe6ae-7b80-41dc-a799-9d656d25bb07' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abf95e7c-6547-4a72-9a06-8dbf65b7c64f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c7bbe6ae-7b80-41dc-a799-9d656d25bb07' 
go

-- ~/Continuum/Commerce_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '330ea30b-1d96-4740-8aaa-379ab4478bf7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12e7ef18-dfde-4fc4-96bb-8e78c317fdba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '330ea30b-1d96-4740-8aaa-379ab4478bf7' 
go

-- ~/Manage/Tagging
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6d02140-beb9-47eb-a207-f1282ef681fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe8579cd-7100-4ee1-a814-8f51d2e4c01e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b6d02140-beb9-47eb-a207-f1282ef681fb' 
go

-- ~/RiSE/Business_Object_Designer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5affbc42-269b-414d-8101-0dd389901b36' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '325f4da4-ee0c-44d7-9f40-9019f14054a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5affbc42-269b-414d-8101-0dd389901b36' 
go

-- ~/Fundraising/Manage_Gift_Aid/Gift_aid_reclaim
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47d36b05-b576-49ec-b245-572335d14e7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '668165d0-5810-4b32-bce2-9047f38ce1c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '47d36b05-b576-49ec-b245-572335d14e7a' 
go

-- ~/Community/Process_Manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd16ebb0c-33b7-4e0d-8a4a-3dae4bbd30f4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1297d54-ca84-49d8-9711-90f274912eba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd16ebb0c-33b7-4e0d-8a4a-3dae4bbd30f4' 
go

-- ~/Settings/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92648c8f-2171-4a77-b371-9e68718d4913' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '613f7110-1257-44c6-8c9f-91a202d3708e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '92648c8f-2171-4a77-b371-9e68718d4913' 
go

-- ~/Settings/Events/Set_up_module
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '459688dc-2328-47d1-a229-382ffe3679f1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e607d7f5-00df-4b0a-8bca-91b61ec68aaa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '459688dc-2328-47d1-a229-382ffe3679f1' 
go

-- ~/Settings/Fundraising/Memorialtribute_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85c669f9-5f44-40aa-95e2-ce8c942e75f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1914fad1-1f97-4fb4-8a42-92802c59d2f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '85c669f9-5f44-40aa-95e2-ce8c942e75f2' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ec6de60a-45bc-4927-98e6-b547ef95fc8c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd932a5cf-1b8e-4703-93ed-92afe26848d5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ec6de60a-45bc-4927-98e6-b547ef95fc8c' 
go

-- ~/Home/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94236afd-fc6d-4d07-acd8-3c0cbbcdb314' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d3088a0-350f-4352-ab92-93120e64231a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '94236afd-fc6d-4d07-acd8-3c0cbbcdb314' 
go

-- ~/Customers/IQA/Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '70fbd682-8557-43ba-bb46-5a5266c98231' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82373ab0-eedd-404f-b3dd-94aee86e6854' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '70fbd682-8557-43ba-bb46-5a5266c98231' 
go

-- ~/Tools/Tools_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46b33686-2126-48cf-8891-68704fd096e3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b60d86fc-44b9-4936-8113-94e5974efaa4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '46b33686-2126-48cf-8891-68704fd096e3' 
go

-- ~/Settings/Commerce/Set_up_tables/Zones
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc22d4f2-3089-4c4f-a92d-9c1cc0db2cb3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ecacd6fe-6976-45cc-a698-97a45f79d73c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc22d4f2-3089-4c4f-a92d-9c1cc0db2cb3' 
go

-- ~/Home/IQA/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84a6364f-8482-479a-84be-261ab0e70c40' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ecf595a7-4a82-4660-90ee-985c438f8294' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84a6364f-8482-479a-84be-261ab0e70c40' 
go

-- ~/Continuum/Contacts_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31be6cc1-25d4-43f5-8c48-938e45bd09f7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a775ae9-569e-4ac9-a7a5-9885caca326d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '31be6cc1-25d4-43f5-8c48-938e45bd09f7' 
go

-- ~/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8511de58-f58b-4d93-ae31-0864b9bc13a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0f6585a-956b-4d2d-9426-98c1f6fd983b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8511de58-f58b-4d93-ae31-0864b9bc13a1' 
go

-- ~/Settings/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '530e6c11-c9ef-45e2-bad9-be713f6cd66f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10e2bafe-f69b-493d-af9a-9961f319f4d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '530e6c11-c9ef-45e2-bad9-be713f6cd66f' 
go

-- ~/Continuum/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c512a45-ca94-48a9-8f56-50f7f513a5b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab0fe306-51bd-44e9-a052-9aa268ac40ca' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c512a45-ca94-48a9-8f56-50f7f513a5b0' 
go

-- ~/Continuum/Other_Reports/Acct_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45ac7c97-98ac-41b6-ad05-f61673f8ba0d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c00e4b7d-c2e5-46a8-8a95-9c679c9517a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '45ac7c97-98ac-41b6-ad05-f61673f8ba0d' 
go

-- ~/Manage/Acquisitions_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea3e280c-6cda-4c95-92a8-df14c61f38f6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac74324e-9ece-4346-bff3-9ce226ad01d7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea3e280c-6cda-4c95-92a8-df14c61f38f6' 
go

-- ~/RiSE
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d7628d2-7352-4624-b04a-c8d0eabdd397' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25475bc2-9c11-4d21-866f-9d7e9df95196' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d7628d2-7352-4624-b04a-c8d0eabdd397' 
go

-- ~/Get_Involved/Attend_an_Event
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9e77ce5c-db62-44c5-a2f4-7561c7bfe152' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ded8f16c-c568-468f-985e-9da4f3b61eae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9e77ce5c-db62-44c5-a2f4-7561c7bfe152' 
go

-- ~/RiSE/Page_builder/Manage_layouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39a51d98-8306-44ed-861e-ca8b9ede2ec4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c87a2b56-013a-411f-8be0-9e0aac82326c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '39a51d98-8306-44ed-861e-ca8b9ede2ec4' 
go

-- ~/Customers/Customers help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d72027b-df2c-464c-975a-ef8325a57dc1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f41f8fa-22f3-40f1-80bd-9f635d201f53' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d72027b-df2c-464c-975a-ef8325a57dc1' 
go

-- ~/Settings/Commerce/Set_up_module
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7fa9c6f8-e76f-4dfd-8e65-07868061e1c3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b47eaf0-1bc9-4636-b997-9f76acf0710c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7fa9c6f8-e76f-4dfd-8e65-07868061e1c3' 
go

-- ~/Commerce/Orders/Print_pick_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ebc05dba-6fb1-4072-a3cb-b59de3cdc4e3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6060e73-80c7-4bdc-bef8-9ffcb7def854' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ebc05dba-6fb1-4072-a3cb-b59de3cdc4e3' 
go

-- ~/Settings/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9217ac9-f3df-4f77-9c10-fb936c9bffe9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16f9170c-dcfb-4df3-8dd9-a09e388521f0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e9217ac9-f3df-4f77-9c10-fb936c9bffe9' 
go

-- ~/Home/Membership/Bill_Dues
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd074a80-5662-48f6-8d73-c49220922833' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c4675ec-48c5-4e90-8d7a-a0be9a32c0d6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd074a80-5662-48f6-8d73-c49220922833' 
go

-- ~/Continuum/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc7fe351-0f33-4074-aa50-dff66eddb211' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcdf3d8e-15c9-4a6b-9f05-a12da58a7fd0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc7fe351-0f33-4074-aa50-dff66eddb211' 
go

-- ~/Commerce/Orders/Close_orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8cfbbe0-107b-47b3-beec-74c821eed700' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8581ae88-ff2c-4109-95c7-a13ddf214f57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8cfbbe0-107b-47b3-beec-74c821eed700' 
go

-- ~/Manage/Major_Donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4ba33593-a55a-41aa-9979-764af9e7d68b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df57d03d-72e4-48d0-9572-a145818e76f2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4ba33593-a55a-41aa-9979-764af9e7d68b' 
go

-- ~/Content_Management/Page_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53092a73-f4e9-4c9a-bfb3-6151140c3c11' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd3505396-6d3f-4d06-9d53-a2992c602668' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '53092a73-f4e9-4c9a-bfb3-6151140c3c11' 
go

-- ~/Home/Events/Define_an_event
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '261de33e-858e-4017-9b01-92b276e98fd9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3260a6af-635e-4a32-9ab9-a2df699b0196' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '261de33e-858e-4017-9b01-92b276e98fd9' 
go

-- ~/System_admin/Workflow/Monitor_workflow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48bf9d28-e3be-4d4a-bada-9b918fbf0060' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '26db6356-cb25-4fb2-9c37-a3986b96f3a7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '48bf9d28-e3be-4d4a-bada-9b918fbf0060' 
go

-- ~/Orders/IQA
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a9d22de-4367-467a-8038-a88639612799' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8af90d4e-18a7-4b62-991e-a4a4d1a9eca1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0a9d22de-4367-467a-8038-a88639612799' 
go

-- ~/My_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e0136ef-5f8a-4c08-8864-0a0c0d961753' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '51d4c751-7d03-4e56-9f80-a4ca743ee33c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e0136ef-5f8a-4c08-8864-0a0c0d961753' 
go

-- ~/Manage/Page_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'deec01a4-3a8f-4a5f-a5c3-ffa18540cdb3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e0fbed8-13cd-48e1-873e-a5235d316193' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'deec01a4-3a8f-4a5f-a5c3-ffa18540cdb3' 
go

-- ~/Settings/Membership/Activity_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f7a9a4e-4d40-43ea-a743-1a288f80f762' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72f60af9-6d9a-427f-93cc-a7cfedc7f059' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7f7a9a4e-4d40-43ea-a743-1a288f80f762' 
go

-- ~/RiSE/Site_Builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ae16d78b-d133-4018-9ee4-7578a577be46' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe1294e4-2f0f-4331-bdef-ad5d51f2d535' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ae16d78b-d133-4018-9ee4-7578a577be46' 
go

-- ~/Settings/Commerce/Set_up_tables/Product_categories
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02905d02-cda8-4b65-8ef0-a2b045e99447' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80ab0c54-1527-4c01-aff5-af08efbc6972' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '02905d02-cda8-4b65-8ef0-a2b045e99447' 
go

-- ~/AR_Cash/Adjustments/Debit_memos
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d7cc3cd-cded-4c0d-8c2c-476ec681d4ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e1facd0-3d70-43d2-b456-afeb320208a7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5d7cc3cd-cded-4c0d-8c2c-476ec681d4ec' 
go

-- ~/Manage/Site_builder/Manage_sitemaps
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81c38c6e-e7bb-4457-98cb-ae65e63f81ca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9c19c83-571b-4a9c-a7a3-b00b2b75bf98' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81c38c6e-e7bb-4457-98cb-ae65e63f81ca' 
go

-- ~/Manage/Page_builder/Manage_content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '889531d2-c46f-44a4-bb70-9119a836ac38' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b395fd8-8a02-46f7-8b01-b083fcf6ffaa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '889531d2-c46f-44a4-bb70-9119a836ac38' 
go

-- ~/Settings/Membership/Set_up_tables/Relationship_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0594557c-a7c3-4896-a3ee-0eab6751e510' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a88bc38-1755-4766-b198-b164ef0759b8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0594557c-a7c3-4896-a3ee-0eab6751e510' 
go

-- ~/Settings/Commerce/Set_up_tables/Order_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '008034f6-a3ce-40fe-a643-7510c10b8cd7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5cd0060b-463d-4a45-abaa-b23a4bc9db72' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '008034f6-a3ce-40fe-a643-7510c10b8cd7' 
go

-- ~/Continuum/Certification_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '115374c0-afd2-4787-99fa-2d1e9ded5d21' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '096f8b6f-8925-445c-9e3a-b28cd828edff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '115374c0-afd2-4787-99fa-2d1e9ded5d21' 
go

-- ~/Commerce/Inventory/Products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6ff9df4f-d3f9-40c6-8898-cb6e98f77ab9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de4c665c-3e0a-473d-9562-b2c5e4bcd27e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6ff9df4f-d3f9-40c6-8898-cb6e98f77ab9' 
go

-- ~/RiSE/Set_up_RiSE/Site_builder_configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84257141-4fef-4c8a-af5c-4c919d34443d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e41b0414-8f70-4381-bf81-b33f2f066061' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84257141-4fef-4c8a-af5c-4c919d34443d' 
go

-- ~/AR_Cash/ARCash_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '522d730c-f051-4718-92b9-68b4b0b19f1e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9f1845a-df13-4f45-9307-b478eaa60b52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '522d730c-f051-4718-92b9-68b4b0b19f1e' 
go

-- ~/Settings/Fundraising/Set_up_tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fad84509-f0a1-4771-b47f-177f93087f85' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91a76e23-180f-4f3f-9bae-b4e2fe1bf10f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fad84509-f0a1-4771-b47f-177f93087f85' 
go

-- ~/Process Mgr/Process manager help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09507666-059b-42ff-97ed-8caaad423711' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b74598c-30dd-440b-abc2-b57fff1a6dff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09507666-059b-42ff-97ed-8caaad423711' 
go

-- ~/Settings/Commerce/Set_up_tables/Freight_by_total_value
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7eb02a36-da39-4bb7-98b2-95f7f58ed3be' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e709b0c9-eb44-4872-bbed-b5d89ecd227e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7eb02a36-da39-4bb7-98b2-95f7f58ed3be' 
go

-- ~/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d623ad4-1bdc-4e5d-ba12-a876e6ff5fe6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '201dde99-737a-4260-ac90-b6d7fdb6bfaf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1d623ad4-1bdc-4e5d-ba12-a876e6ff5fe6' 
go

-- ~/Community/Process_Manager/Tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f3fad34-cd2a-49a1-ba51-675196459f97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fab6cf25-1ed4-44ca-bb7a-b7827875754b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1f3fad34-cd2a-49a1-ba51-675196459f97' 
go

-- ~/Continuum/ContinuumConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd90219f1-7c6c-4229-8933-f607e8d8fd71' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48841d7c-0968-47bc-abe2-b8bdc69c14f2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd90219f1-7c6c-4229-8933-f607e8d8fd71' 
go

-- ~/Home/ConsoleHome
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f2a8a0b-eb1c-41de-b5ce-2b1e838398fa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9345d55-28e3-4fea-8f28-b8e62b21b029' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2f2a8a0b-eb1c-41de-b5ce-2b1e838398fa' 
go

-- ~/Manage/Maintenance/Content_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63536be3-e0ba-4903-a64e-7f3be5fd291c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a2f454e-86b6-4f0e-8c13-bc490678a489' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63536be3-e0ba-4903-a64e-7f3be5fd291c' 
go

-- ~/Tools/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff4e00e8-638b-4de3-be3c-e652ef5147de' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27a57655-844b-4223-8f45-bcbf79b56248' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff4e00e8-638b-4de3-be3c-e652ef5147de' 
go

-- ~/Commerce/Commerce_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '462f1166-d388-425a-ad1e-e03cbef7b96b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a10de5b-88fd-4123-be2b-bd567494432c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '462f1166-d388-425a-ad1e-e03cbef7b96b' 
go

-- ~/Certification/Manage_providers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '230b1f2f-0422-4223-99e1-f689b19439c9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e81f040b-02b8-4c1d-86de-bdf489325411' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '230b1f2f-0422-4223-99e1-f689b19439c9' 
go

-- ~/Home/IQA/Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87fc131b-4a5d-4b63-af87-0d0c1b52ccf7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4291bf6-f9de-4cf7-97e6-c00a8656a8cf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87fc131b-4a5d-4b63-af87-0d0c1b52ccf7' 
go

-- ~/Continuum
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb289bfa-a6a6-4a3b-b2c7-b121aa308323' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db165858-deae-4689-be05-c02d8ddd5261' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eb289bfa-a6a6-4a3b-b2c7-b121aa308323' 
go

-- ~/System_admin/Workflow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23101770-6567-4796-9d03-ee60c75e5bd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ab14719-5597-4984-aab0-c04fd41a1d12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '23101770-6567-4796-9d03-ee60c75e5bd1' 
go

-- ~/Settings/Events/Set_up_tables/Event_resources
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a122a0ae-64a9-4b4f-9e8d-e9c721bd1058' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24903e50-b176-463d-8289-c0fa2240a41e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a122a0ae-64a9-4b4f-9e8d-e9c721bd1058' 
go

-- ~/System_admin/Workflow/Work_item_console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b9235dd4-92a8-41a7-83b3-d78281727741' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'afb4d29d-9dce-4de0-80ef-c211a3bedd0c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b9235dd4-92a8-41a7-83b3-d78281727741' 
go

-- ~/Manage/Page_builder/Manage_images
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95f7d3ec-6903-4b1a-8900-e4ed77bff3a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1889399b-d89f-42b7-a3fb-c2ae5be3ba5a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '95f7d3ec-6903-4b1a-8900-e4ed77bff3a9' 
go

-- ~/AR_Cash/Processes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '596fae53-bd8b-4d48-b6af-1907702a9f85' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '027240af-c487-4552-b0c2-c4d2d80ebf04' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '596fae53-bd8b-4d48-b6af-1907702a9f85' 
go

-- ~/Certification/Pending_approvals/Requirement_completions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32e946ee-8a96-4fcd-9382-ecf8e8a45651' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f87b685-bcfd-48b2-85d7-c6c71c005a94' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32e946ee-8a96-4fcd-9382-ecf8e8a45651' 
go

-- ~/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c486c1cb-7897-4901-9228-f1bb422eb316' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13b1d417-6a1c-4946-9e76-c78d38e1c287' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c486c1cb-7897-4901-9228-f1bb422eb316' 
go

-- ~/Certification/Set_up_programs/Program_groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8bab89b-707a-4e11-9813-c81cdb7ddfdb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00b7852c-d655-49af-98e3-c97ac113af00' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e8bab89b-707a-4e11-9813-c81cdb7ddfdb' 
go

-- ~/Settings/Commerce/Set_up_tables/Freight_by_total_quantity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32883f68-b982-4828-ae91-a3abb4d8835e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f2e4c5b-7e4f-4ed3-a1cb-ca00c143a7fb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32883f68-b982-4828-ae91-a3abb4d8835e' 
go

-- ~/Fundraising/Process_premiums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '396df343-e01d-4f54-9401-8e3f0605fa2e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0216809b-7493-461c-a547-caeed6755a6a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '396df343-e01d-4f54-9401-8e3f0605fa2e' 
go

-- ~/Commerce/Inventory/Post_receipts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7156baf-c463-4312-b410-e677c7043fe4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79bcae6e-6093-46d0-bb08-cb24981d3ce5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7156baf-c463-4312-b410-e677c7043fe4' 
go

-- ~/Continuum/Events_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b7f1243-26fb-4ffc-90bc-0cee152e7495' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '337a4fdd-529c-431c-aed7-cb43cf900adc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2b7f1243-26fb-4ffc-90bc-0cee152e7495' 
go

-- ~/Settings/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a8b054f-d522-4f19-a5cf-9c371bd1ec30' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53eb21ac-82eb-4e45-b4b9-cc7b66a75525' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2a8b054f-d522-4f19-a5cf-9c371bd1ec30' 
go

-- ~/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6031db31-db05-4241-8e70-f796dca68901' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98fc583c-cf21-4de3-9bdb-cc87e643fb93' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6031db31-db05-4241-8e70-f796dca68901' 
go

-- ~/Settings/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ad1f337-07a2-4527-a0e4-d9e80cbfedd8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f4cb6ed-bf61-4c82-b58a-ccb834ddcff0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ad1f337-07a2-4527-a0e4-d9e80cbfedd8' 
go

-- ~/Settings/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e86589b1-64f6-400e-a39c-becfa07c114b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf220feb-547b-4239-9826-ccd82d17ba2f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e86589b1-64f6-400e-a39c-becfa07c114b' 
go

-- ~/Settings/Fundraising/Set_up_tables/Distributions_and_premiums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30e9a799-d063-4dbb-8292-fce5ffcffb50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6164dfb5-6a8d-47b8-a8ae-cdb72ad187c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30e9a799-d063-4dbb-8292-fce5ffcffb50' 
go

-- ~/Customers/IQA/Prospects
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '446c8ce7-84fe-45f3-b191-571d24c16e14' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ca11b9f-3034-4918-829f-d1159e9139eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '446c8ce7-84fe-45f3-b191-571d24c16e14' 
go

-- ~/AR_Cash/Options/Set_up_tables/Products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aa2e949d-1f45-4c1e-b497-a323cb691f8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb37b07d-5881-4d98-8e79-d1874101aa93' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aa2e949d-1f45-4c1e-b497-a323cb691f8b' 
go

-- ~/Education
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce9fd488-6428-4232-a78a-787cade89706' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '343ee562-8b69-47ce-abb8-d1a7fbf064b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ce9fd488-6428-4232-a78a-787cade89706' 
go

-- ~/Cart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fcd30660-a1cb-44b8-97e3-425d9266e187' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0898c4d0-508c-4980-a5fe-d1b45bcc683e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fcd30660-a1cb-44b8-97e3-425d9266e187' 
go

-- ~/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2654d32-4820-4bb2-b532-4b0d8bc0cc6f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1912ec0-1539-4689-a29d-d20603c053f3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b2654d32-4820-4bb2-b532-4b0d8bc0cc6f' 
go

-- ~/Manage/BusinessObjectDesigner
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ceaea41-4ccb-4882-9fba-88bbd864a5bc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4da4dd6e-cb5c-44d7-80a7-d2fb7d80cb27' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0ceaea41-4ccb-4882-9fba-88bbd864a5bc' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fda958a6-d862-4745-b548-35419f298c55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91a25e8d-4fd2-4329-a472-d30dc9c7842a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fda958a6-d862-4745-b548-35419f298c55' 
go

-- ~/Manage/Site_builder/Manage_Shortcuts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81358783-658a-4b17-a7e6-b7da4c7a34c9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b58f209-481b-4a3a-8c6b-d3eabe8ca126' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81358783-658a-4b17-a7e6-b7da4c7a34c9' 
go

-- ~/Home/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b15032d-5ab8-49b6-ab4f-d9dd82f46109' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0fe2b3c-3484-4ba2-b709-d4779201035f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b15032d-5ab8-49b6-ab4f-d9dd82f46109' 
go

-- ~/Manage/IntelligentQueryArchitect
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4724f90f-1ddf-4cb7-a376-75df8d1cba2d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e7fbd68-f02e-4e52-80f0-d5155c180ee7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4724f90f-1ddf-4cb7-a376-75df8d1cba2d' 
go

-- ~/Commerce/Orders/Ship_orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f40c2b95-fd62-4ff9-ad83-0851d10496c4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1dd1c77-7492-422e-81b0-d6b9fe795e9d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f40c2b95-fd62-4ff9-ad83-0851d10496c4' 
go

-- ~/Continuum/Other_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50ac26cb-9693-4ea4-bd6a-11a95fd59f7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a4b8a72-5727-4476-870c-d74fca1b0eb6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50ac26cb-9693-4ea4-bd6a-11a95fd59f7a' 
go

-- ~/Certification/Manage_enrollment/Inactive_enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9b1b490-a822-4409-a140-adb5509894d0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eaa22610-6417-417a-88e0-d7f83d9b4486' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a9b1b490-a822-4409-a140-adb5509894d0' 
go

-- ~/Settings/Billing/Products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f688498-5da7-487d-9c16-20a43b693626' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cf9d80e-42ce-4003-af77-d943c298f0b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1f688498-5da7-487d-9c16-20a43b693626' 
go

-- ~/Manage/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ecfb6d6-8185-4c07-afca-7b5b83aec9e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5eacf13f-7b91-4659-87bb-d9d2904ff5b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5ecfb6d6-8185-4c07-afca-7b5b83aec9e1' 
go

-- ~/Membership/Directory/Find
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81281337-75c8-4957-8cb8-c52778968fea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9774411-732b-44db-aec1-da12816720fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81281337-75c8-4957-8cb8-c52778968fea' 
go

-- ~/Fundraising/Fundraising_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e9f2015-db3f-4a20-8b2b-ff5897cf1cc5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '658489a8-fee4-489d-b27e-da84b4d99dad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e9f2015-db3f-4a20-8b2b-ff5897cf1cc5' 
go

-- ~/Continuum/FR_Reports/Fundraising_executive_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a611b1d5-1ba0-40f3-ad76-39ef20ef91e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f67920b-296e-49fd-9ec8-db39fab1b42c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a611b1d5-1ba0-40f3-ad76-39ef20ef91e8' 
go

-- ~/Manage/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d45de82-4b08-4397-809c-f35d02d74134' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b68526a-0bac-45b4-bdea-db554cdaba35' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5d45de82-4b08-4397-809c-f35d02d74134' 
go

-- ~/Fundraising/IQA
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '04d9f60b-bf12-4c27-ab7a-b759f6c8506b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b61d9791-7b08-4242-9aa3-dbc166327549' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '04d9f60b-bf12-4c27-ab7a-b759f6c8506b' 
go

-- ~/Commerce/Orders/Convert_quotes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '512a4b4e-b5f4-4761-8695-e3b798caabd4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd81d5628-14dc-491d-bd9f-dc3fe4c61c82' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '512a4b4e-b5f4-4761-8695-e3b798caabd4' 
go

-- ~/AR_Cash/FinanceConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e2cb24a-1b9d-44f8-8474-ca2bcfbad9fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4747399e-6c97-427d-8af9-dc98cec44234' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e2cb24a-1b9d-44f8-8474-ca2bcfbad9fb' 
go

-- ~/Referrals/Referrals help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1dc97363-224b-4c4d-a9ad-7ba666947416' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4edc2cae-8ec3-454c-b427-ddb5c2e44e80' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1dc97363-224b-4c4d-a9ad-7ba666947416' 
go

-- ~/System_admin/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68200ac0-5c55-4de9-b6ea-5aaf6788d81e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '22f26991-9ee3-41c8-b298-ddf902f9b2a5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '68200ac0-5c55-4de9-b6ea-5aaf6788d81e' 
go

-- ~/Home/Membership/Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3bb8e3b-87ca-4c34-8a89-a38db7b93646' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4fddad9-f387-4338-a788-e027ed64706d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f3bb8e3b-87ca-4c34-8a89-a38db7b93646' 
go

-- ~/Manage/DocumentSystem
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f7b891e4-0746-4296-afad-9bec5668b1a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5bf978a9-48da-44c6-bcdd-e095d2806ad3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f7b891e4-0746-4296-afad-9bec5668b1a1' 
go

-- ~/Manage/Tagging/Define_tagged_list_formats
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b921627e-48e0-439d-9513-9d773f9ca63c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '101495fc-0cc4-431f-b32a-e119c4314efb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b921627e-48e0-439d-9513-9d773f9ca63c' 
go

-- ~/Continuum/Other_Reports/FOE_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6eb1644a-d189-4fa9-acc2-1fbe2e90408f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f50b3d15-15e6-4987-80c0-e1f319b338b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6eb1644a-d189-4fa9-acc2-1fbe2e90408f' 
go

-- ~/Manage/Maintenance/User_defined_fields
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28c5519e-2ec5-4a5c-81c4-c787fadcb688' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c4c58a2c-a27d-4774-9b93-e2551f4b4cab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28c5519e-2ec5-4a5c-81c4-c787fadcb688' 
go

-- ~/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e98be732-4513-4a17-96f4-e1b8f3bdd689' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95447b1b-0b27-43bf-99fe-e293cada5613' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e98be732-4513-4a17-96f4-e1b8f3bdd689' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3bbe4cae-f1f0-4dee-a681-22c042a09896' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '35acfad2-9e0c-42b9-97a3-e3094018d4db' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3bbe4cae-f1f0-4dee-a681-22c042a09896' 
go

-- ~/AR_Cash/Transactions/Orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3586c7eb-b336-4dcb-9e19-bdc968c151b6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ad91f58-f048-482d-b762-e3a848e26a53' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3586c7eb-b336-4dcb-9e19-bdc968c151b6' 
go

-- ~/Manage/Tagging/Define_tagged_list_formats
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cfeec8ff-79f3-4198-9aab-68d2ad86490f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44d3eafb-0a70-4246-8969-e4256612a260' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cfeec8ff-79f3-4198-9aab-68d2ad86490f' 
go

-- ~/Fundraising/Gifts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63e1b005-c156-478a-935a-98404d46e53c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7147551f-b709-4e34-949e-e563fdb522fb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63e1b005-c156-478a-935a-98404d46e53c' 
go

-- ~/Tools/Site_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '594ea54c-80d9-4d32-b368-559367040ae2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac1026ec-2442-4845-9c3e-e5b2abb91c41' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '594ea54c-80d9-4d32-b368-559367040ae2' 
go

-- ~/Continuum/Segmentation_Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3453579-f73d-46dd-b690-f0ad95933e98' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b65c05e0-75bf-4d5c-85ca-e74816a79ab1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a3453579-f73d-46dd-b690-f0ad95933e98' 
go

-- ~/Manage/Site_builder/Manage_sitemaps
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b16d0518-60ad-4c05-a545-7c5d76e7548f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8034488-1e3b-4241-987d-e7bc580073c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b16d0518-60ad-4c05-a545-7c5d76e7548f' 
go

-- ~/Exposition/Exposition help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e22044f4-0254-4cf3-a3ae-7ccb8846fbb7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '380a4709-6105-4e68-a2f9-e87d2b0ad6d7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e22044f4-0254-4cf3-a3ae-7ccb8846fbb7' 
go

-- ~/Manage/Tagging
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e32bc40-339c-4e51-9a16-ed88a132c9d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ef1e368-9b2d-43ee-8cf7-e8eae213554b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7e32bc40-339c-4e51-9a16-ed88a132c9d3' 
go

-- ~/Settings/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a35aecce-1957-46e2-9abe-46fa3f04856b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8364376-5bc7-4649-abc9-ed03805e2c5b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a35aecce-1957-46e2-9abe-46fa3f04856b' 
go

-- ~/Commerce/Inventory/Receipts_and_adjustments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a96057c-1893-45c7-945b-94d4bc5c4006' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a274b5a-7dbc-4d5c-b8e0-ed9984129522' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9a96057c-1893-45c7-945b-94d4bc5c4006' 
go

-- ~/Certification/Manage_enrollment/Enrollment_by _program
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9faf005-668b-4f72-93b6-7fd7231a8ade' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99ad059f-5909-4a3c-af37-ee8e1d83a98f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a9faf005-668b-4f72-93b6-7fd7231a8ade' 
go

-- ~/Settings/Fundraising/Set_up_tables/Donor_clubs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '26d030c2-b791-4ef3-b6ec-31fb9a7141d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '771b1810-8691-4bf1-bad9-efe9af6287ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '26d030c2-b791-4ef3-b6ec-31fb9a7141d8' 
go

-- ~/My_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'daa4930f-5173-4f81-9f9a-a23f3cc80df0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '426a3144-4c69-4945-be40-f2684645172d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'daa4930f-5173-4f81-9f9a-a23f3cc80df0' 
go

-- ~/Community/Manage_RFM
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '659fa71c-1b3b-4dfc-8a00-2a91f293d935' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21ac2a76-e548-41af-9d40-f2b1db0e4917' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '659fa71c-1b3b-4dfc-8a00-2a91f293d935' 
go

-- ~/Manage/Page_builder/Manage_images
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd600d14f-188b-4e7a-b47c-b0ebf0f4f0c1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3708d382-08b0-4076-af31-f2ed0b7932b2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd600d14f-188b-4e7a-b47c-b0ebf0f4f0c1' 
go

-- ~/Continuum/FR_Reports/Fundraising_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a3f998e-28a5-4c5f-b720-0feecbc4b855' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38bd44e5-b9a7-451a-b2ba-f30db62daffa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6a3f998e-28a5-4c5f-b720-0feecbc4b855' 
go

-- ~/Full_Site
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '057c1fcd-e568-4936-8d2f-21e64657b217' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cfa08b8e-5126-4edd-83ea-f30eb6e2af79' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '057c1fcd-e568-4936-8d2f-21e64657b217' 
go

-- ~/System_admin/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19196d74-d42b-4347-b5af-c54e153d7e8f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28233268-09aa-466e-a3f1-f409e7391ec8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '19196d74-d42b-4347-b5af-c54e153d7e8f' 
go

-- ~/Settings/Membership/General
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c3b187b1-325d-4f39-84d6-222eefc72cda' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eee93242-7e61-4c6f-9e60-f44c2d572748' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c3b187b1-325d-4f39-84d6-222eefc72cda' 
go

-- ~/Events/Add_event
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '397244db-3144-45fd-ad17-f9ce373216d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9defb847-2feb-4eae-91cd-f474ceb0eec8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '397244db-3144-45fd-ad17-f9ce373216d1' 
go

-- ~/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cafa0b95-093d-4383-8872-afaf1f56a3dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2aa7352c-c5e7-4df0-9b82-f5730cce5423' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cafa0b95-093d-4383-8872-afaf1f56a3dd' 
go

-- ~/Continuum/Events_Reports/Event_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3679d9d3-3b91-46d8-8c13-02f2d88d3667' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b64dc529-74a8-48db-beb2-f73332bc2879' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3679d9d3-3b91-46d8-8c13-02f2d88d3667' 
go

-- ~/Community/Add_contact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71bcb801-d2ef-4379-8fe3-25d4fcd33fe4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e61f66ff-decc-40b1-90d6-f7cc2aa1decd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '71bcb801-d2ef-4379-8fe3-25d4fcd33fe4' 
go

-- ~/Settings/Events/Set_up_tables/Registration_classes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28f74de7-c9e6-42f1-8b95-01892a8cfa2f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '322bfc0c-8492-4f4e-b561-f7f5867a5467' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28f74de7-c9e6-42f1-8b95-01892a8cfa2f' 
go

-- ~/Community/Process_Manager/Set_up_processes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a4f76901-68a0-451f-af70-e68d23af8464' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e261bac5-cb2e-49fd-a2e4-f81994ddeb30' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a4f76901-68a0-451f-af70-e68d23af8464' 
go

-- ~/RiSE/Page_builder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2714f2a-479b-4f13-bf21-b6591ce29d56' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb982453-73f4-4acb-be66-f832efd11e95' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f2714f2a-479b-4f13-bf21-b6591ce29d56' 
go

-- ~/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7544979-0151-4066-8a81-c1bdae6c1a09' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c4e40dce-bcac-47ae-9a3b-f83751edb880' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a7544979-0151-4066-8a81-c1bdae6c1a09' 
go

-- ~/Manage/Tagging/Define_tags
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8bd664cc-6738-47c3-b161-fe87f24726d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2e926fc-8881-48b2-acd5-f8fa011383eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8bd664cc-6738-47c3-b161-fe87f24726d1' 
go

-- ~/Home/Membership/Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1046dd4b-0e55-458f-8939-d4d62ce5c6a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '325dda51-7afc-4a43-9c2e-f9dc48869678' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1046dd4b-0e55-458f-8939-d4d62ce5c6a7' 
go

-- ~/Manage/Maintenance/Content_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'baef48b5-e063-447d-87b2-06bed4c9e199' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f76b5a3-80b2-4801-b035-fa033e8669a7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'baef48b5-e063-447d-87b2-06bed4c9e199' 
go

-- ~/Settings/Membership/Set_up_tables/Committee_positions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25f43f0c-d86e-4668-a0a8-5a215abdb695' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99ba583d-db1c-4fc2-b65f-fa66033e2ce0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '25f43f0c-d86e-4668-a0a8-5a215abdb695' 
go

-- ~/AR_Cash/Set up tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad620ca6-1252-499b-9023-6095d8d0eeac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b9e122d-a416-41e1-aac0-faecbd9b056a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad620ca6-1252-499b-9023-6095d8d0eeac' 
go

-- ~/Certification/Pending_approvals/Program_completions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ee8e64ec-9d4a-4ced-b21f-fb750750aed1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6fd3b8f9-1369-42ce-a1c4-fbfc5e85a181' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ee8e64ec-9d4a-4ced-b21f-fb750750aed1' 
go

-- ~/Settings/Commerce/Set_up_tables
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24c0cffc-54c1-47e8-8043-fab2c2645118' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e0a985c-4876-471c-8fa2-fc4ceb213c74' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '24c0cffc-54c1-47e8-8043-fab2c2645118' 
go

-- ~/Community/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb020529-d653-4083-9943-952f990a4845' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44a2556b-043e-4a52-8bea-fcddc255fb09' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb020529-d653-4083-9943-952f990a4845' 
go

-- ~/AR_Cash/Processes/Month-end_procedures
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '919b2615-3506-4c3e-8ad2-437cd746ee52' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85acab7f-72ba-49de-a297-fcefc7452564' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '919b2615-3506-4c3e-8ad2-437cd746ee52' 
go

-- ~/RiSE/Page_builder/Manage_content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '69c898bf-324d-4f16-af63-b44260f8c640' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2f8a071-ca8e-4254-9831-fd6bb9536dfd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '69c898bf-324d-4f16-af63-b44260f8c640' 
go

