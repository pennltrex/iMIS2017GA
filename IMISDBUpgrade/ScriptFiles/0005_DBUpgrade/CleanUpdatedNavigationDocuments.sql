-- ~/Continuum/Process_Manager_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2e5e6d1-6b0c-4055-9354-90d9e1b8d4e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48ef86ac-e0bd-4f96-8473-0321a4a932b2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b2e5e6d1-6b0c-4055-9354-90d9e1b8d4e8' 
go

-- ~/Home/iMIS help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3921ef16-2c32-45d0-9ade-452775bced71' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7807a4bd-a038-4492-a115-0335e8d4dc2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3921ef16-2c32-45d0-9ade-452775bced71' 
go

-- ~/RiSE/Workflow/Workflow_items
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '931d6aa6-9555-416f-a586-649f24bcbe2c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '76271b34-ed8c-45bb-8bf4-05282b5328ae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '931d6aa6-9555-416f-a586-649f24bcbe2c' 
go

-- ~/Issues/Issues help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a9525d7-1a23-47df-a6b4-433f1b14e7ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dee621d6-cc5b-45d4-a42c-090d85b3e8d3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3a9525d7-1a23-47df-a6b4-433f1b14e7ec' 
go

-- ~/Membership/Automatic_renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc6b1c98-fc14-4889-95a9-c3e0e6b0de23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc6b1c98-fc14-4889-95a9-c3e0e6b0de23' 
go

-- ~/Billing/Billing help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23e7d7c1-6987-4ddd-bbfa-1a60756cf6ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b5c2f777-08b9-4e4d-8d35-0e3737ea0cd6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '23e7d7c1-6987-4ddd-bbfa-1a60756cf6ab' 
go

-- ~/Documentation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03d96598-daae-487d-9a11-9dd6db1612a4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '670be00e-c8e8-4f60-b149-0e8017852837' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '03d96598-daae-487d-9a11-9dd6db1612a4' 
go

-- ~/Marketing/Campaigns/View_output
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '336ca788-4bba-4d37-a8df-e9299cbeb7c3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e041bf02-a145-4103-ba38-0f48bead36ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '336ca788-4bba-4d37-a8df-e9299cbeb7c3' 
go

-- ~/Service Central/Service Central help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05311074-4a8e-4a01-9ab4-883fb31d224b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d61677c-87c9-4702-89d9-109e3630ee27' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '05311074-4a8e-4a01-9ab4-883fb31d224b' 
go

-- ~/Commerce/Promotions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '733196c6-bc87-4fd5-a628-e3e75dce3f78' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '888adaf0-77e2-4329-b6f3-161c1b2bc464' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '733196c6-bc87-4fd5-a628-e3e75dce3f78' 
go

-- ~/Marketing/_break_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8fc7b80-b8d2-4e57-b0e2-70bccd622982' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45db5da6-904e-4a3f-86ad-166d24dfd8db' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b8fc7b80-b8d2-4e57-b0e2-70bccd622982' 
go

-- ~/Certification/Define_programs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40d9395c-cd93-4580-b483-107ad448f4e7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7f5133e-2df5-4866-a4cb-1c0a64cc3d6e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '40d9395c-cd93-4580-b483-107ad448f4e7' 
go

-- ~/Support
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be2a0af2-7a97-4024-b43a-ba81696c5942' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e91e9d9-7a81-4bde-af75-1cd53cbd3bf6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'be2a0af2-7a97-4024-b43a-ba81696c5942' 
go

-- ~/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa928966-2fb9-4382-bb98-53829f6c6e9b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fbc85cf-9ab0-44c1-a0db-1ebb4e22b32f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fa928966-2fb9-4382-bb98-53829f6c6e9b' 
go

-- ~/System Setup/System setup help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87e3a57c-71b3-4849-9a74-43aac783f858' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a05bad8f-cd65-4103-ba0e-212a2275458b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87e3a57c-71b3-4849-9a74-43aac783f858' 
go

-- ~/Subscriptions/Subscriptions help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b006f029-8f57-4526-bcb7-1c8a4afe3f01' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91895b13-2822-41ad-8860-22f61833a7c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b006f029-8f57-4526-bcb7-1c8a4afe3f01' 
go

-- ~/Fundraising/Import_donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b9ed4114-638b-41b1-ac4b-ac3cc2c5e16f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5bc1801-515a-4e97-bf1e-2ae3f743055d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b9ed4114-638b-41b1-ac4b-ac3cc2c5e16f' 
go

-- ~/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6fba54ba-7f73-4f46-8c89-2ca5b593e04b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
go

-- ~/Membership/Automatic_renewals/Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c906d237-51d1-403b-9d65-96fdce086d9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c110217d-01b7-4ff5-a57f-2e65ff638757' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c906d237-51d1-403b-9d65-96fdce086d9e' 
go

-- ~/Fundraising/Recurring_donations/Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea8124c6-31a3-4405-bb4d-76eed328198e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01edaa0d-3555-445d-aac6-2f2e6617d9f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea8124c6-31a3-4405-bb4d-76eed328198e' 
go

-- ~/Marketing/Segmentation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '342640e2-3e31-49bc-a087-95196e429dfc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '51473c22-1a5f-42bb-a022-335f0ded0a29' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '342640e2-3e31-49bc-a087-95196e429dfc' 
go

-- ~/Certification/Certification help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3752ba11-3a48-4fdd-839d-88f90f51468f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed6843b2-6e37-4a94-ac76-3a01f2716fa2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3752ba11-3a48-4fdd-839d-88f90f51468f' 
go

-- ~/Events/Events help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c1621ae-67af-48f9-8478-11b905cbe15c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cccfc693-3231-46d5-8a94-3ab3336a3a45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c1621ae-67af-48f9-8478-11b905cbe15c' 
go

-- ~/Certification/Define_programs/Experience_programs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd771e979-4bea-45d3-ab8a-78c9f110bb56' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '664e65af-2f90-4a03-b045-42f687923faa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd771e979-4bea-45d3-ab8a-78c9f110bb56' 
go

-- ~/Fundraising/Fundraising_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b6e8fda-91fe-4ad4-868c-a0c01d027b04' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95bc17e4-c7a9-4e17-80c3-4434d0c93629' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b6e8fda-91fe-4ad4-868c-a0c01d027b04' 
go

-- ~/RiSE/Document_system
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0198eedf-d1a8-455c-9c10-76e6b9874787' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0198eedf-d1a8-455c-9c10-76e6b9874787' 
go

-- ~/Home/Help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17ef071f-9516-4d30-bdad-eb4e9c84e24c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '51a26d6b-6997-4028-9db7-4b735e91a84c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17ef071f-9516-4d30-bdad-eb4e9c84e24c' 
go

-- ~/Certification/Pending_approval/Program_completions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a4dea9f-ee05-4384-bd77-6ff0749d8bca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ed62239-9cce-45ac-b00c-53529a55ad2e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2a4dea9f-ee05-4384-bd77-6ff0749d8bca' 
go

-- ~/Exhibition/Exhibition help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f40c05d-33fc-4dd0-9295-30c58e237610' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9675dcd3-73aa-459f-b133-53a81e9ffb12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3f40c05d-33fc-4dd0-9295-30c58e237610' 
go

-- ~/Commerce/Advanced_Accounting_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4683f779-d116-4a2f-8630-8290db3cb4c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '225fd0fc-9d7f-48d8-a809-55d88108de02' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4683f779-d116-4a2f-8630-8290db3cb4c5' 
go

-- ~/RiSE/Maintenance/User_defined_fields
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36d767ee-bd5b-4ffe-b33f-13a00de16830' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54c287a3-b7a2-44f4-8128-567c66f58c6f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '36d767ee-bd5b-4ffe-b33f-13a00de16830' 
go

-- ~/Fundraising/Moves_management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd63547b6-b19f-4e5e-8d0f-7a367a8fb736' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '129d6ad2-a69d-4d34-a50c-572d167ebd52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd63547b6-b19f-4e5e-8d0f-7a367a8fb736' 
go

-- ~/Marketing/RFM/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fd5cc1f-0258-404c-85f8-24434e8d2e8e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c9e2892-1be5-45cd-bdb2-58f3e5fe3202' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3fd5cc1f-0258-404c-85f8-24434e8d2e8e' 
go

-- ~/Fundraising/Gift_Aid
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30087ac0-92bc-44e1-8037-be4e33313221' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd44d2ad-9cb5-4f52-ba44-5bd04d342912' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30087ac0-92bc-44e1-8037-be4e33313221' 
go

-- ~/Fundraising/Friendraising/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1832abef-2036-4213-898e-55839494c3f6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6bf118a3-3273-4bff-a66d-5d06ea410c87' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1832abef-2036-4213-898e-55839494c3f6' 
go

-- ~/RiSE/Page_builder/Manage_images
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe56be1c-a5a4-45e4-aca0-1eb9c01a5efc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b14f450-37f3-4634-a51b-5d7ec3a0c24e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fe56be1c-a5a4-45e4-aca0-1eb9c01a5efc' 
go

-- ~/Leg. Tracking/Legislative Tracking help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce7369da-a934-4ec6-8f74-03d5eb9793a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '856cb347-45e3-445e-8d91-5fd0e05360be' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ce7369da-a934-4ec6-8f74-03d5eb9793a8' 
go

-- ~/Certification/Define_programs/Unit_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb27eabe-1eb6-4693-b9b7-a0480d880045' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5e3c87e-617b-40bd-a7e2-60c6248c6680' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bb27eabe-1eb6-4693-b9b7-a0480d880045' 
go

-- ~/Marketing/Campaigns
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8295e10-9162-459c-85c9-f61751f64626' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '321b0c4f-032e-477f-ae17-6811fe3d7127' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8295e10-9162-459c-85c9-f61751f64626' 
go

-- ~/Membership/Automatic_renewals/Review_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7b10104-be94-4b75-8ed7-fcd557723837' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd28f2db-a8f5-47ac-995c-6b110c6db25e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7b10104-be94-4b75-8ed7-fcd557723837' 
go

-- ~/Continuum
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cea99572-80c4-45d7-80d9-de8ebe146edd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be62478f-d245-4588-a762-6d01de29ae24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cea99572-80c4-45d7-80d9-de8ebe146edd' 
go

-- ~/Certification/Pending_approval/Requirement_completions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '65edbf87-b993-4261-9326-f63cddef779c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c071afce-6e3b-40db-82ad-71d5b1a5ac28' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '65edbf87-b993-4261-9326-f63cddef779c' 
go

-- ~/Cart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40bfda51-3327-4cc7-ba9d-e28c3bb359da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d03a8d5-5db2-47c2-b948-7269dfada94a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '40bfda51-3327-4cc7-ba9d-e28c3bb359da' 
go

-- ~/About_Us
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48c7f041-6838-4467-9b6a-da4b2fde8643' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3696b84e-fc55-4f53-a0a2-73293425188e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '48c7f041-6838-4467-9b6a-da4b2fde8643' 
go

-- ~/Marketing/Campaigns/Record_responses
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81e49d4a-f6d6-4eae-94eb-19ad9c208ae1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f7ddd28d-9524-4988-bde5-744f4eda99ed' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81e49d4a-f6d6-4eae-94eb-19ad9c208ae1' 
go

-- ~/Certification
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74b2736d-1027-49b5-b042-de62e22226aa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ef06daf-84ad-44a8-95e8-772f1459b519' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '74b2736d-1027-49b5-b042-de62e22226aa' 
go

-- ~/Marketing/Communication_templates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b15cf64-0b6a-4a7c-9ac9-d4662462756b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2dc80eb4-7c5c-430f-955b-7d7953651f5c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2b15cf64-0b6a-4a7c-9ac9-d4662462756b' 
go

-- ~/Certification/Define_programs/Program_components
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd29a1b89-d34c-4513-be4b-c13b1e0c5fa9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84ac5dbb-186b-4289-9dae-7ee20560dc24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd29a1b89-d34c-4513-be4b-c13b1e0c5fa9' 
go

-- ~/Community/Communities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'acbb0bfa-6a3b-48ed-9d06-d0f5c658817f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d2c5f87-a9c1-4cc1-83a0-7f3659512f48' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'acbb0bfa-6a3b-48ed-9d06-d0f5c658817f' 
go

-- ~/Community/Contacts_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '696d211a-7382-47a8-bd2c-20af11b0c870' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58e8b2c7-2a75-4a91-b715-80268f322c08' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '696d211a-7382-47a8-bd2c-20af11b0c870' 
go

-- ~/Certification/Define_programs/Certification_programs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16d2769b-e38a-4495-8ecb-fe7b8ca95775' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d8de77f-8f55-42ec-9f4f-81e2c2840b75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '16d2769b-e38a-4495-8ecb-fe7b8ca95775' 
go

-- ~/Marketing/Segmentation/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dfbf8138-b272-40b9-ac6a-8e79472c2a93' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f91ec6a6-fe0a-4c66-a06a-845f4f90cc4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dfbf8138-b272-40b9-ac6a-8e79472c2a93' 
go

-- ~/Marketing/Process_manager/Projects
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '77aabdf0-e824-4919-aeca-fab686654425' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e486dcb8-a5c9-40b4-9eb1-84fd1c4d5d08' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '77aabdf0-e824-4919-aeca-fab686654425' 
go

-- ~/Orders/Orders help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c58c8328-4b4c-486a-9602-6b6121bb315c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97463c5f-a07d-463c-8681-8c4ac4cba0f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c58c8328-4b4c-486a-9602-6b6121bb315c' 
go

-- ~/Marketing/Campaigns/Define_campaigns
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b6b7309-6b26-4f04-bc3c-fdf4056e5442' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4344d668-293f-4de5-80cb-8e96643ed3e1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b6b7309-6b26-4f04-bc3c-fdf4056e5442' 
go

-- ~/RiSE/Maintenance/Content_authority_groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64207269-22a5-4de1-8732-3a763b6e6683' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c78dabf7-ebd0-4611-8b62-900a4e565c8b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64207269-22a5-4de1-8732-3a763b6e6683' 
go

-- ~/Fundraising/Enter_gifts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5089f782-c498-4e16-9f82-caafa9a47f4b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58b38eae-4bbe-434d-b837-90924c2899f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5089f782-c498-4e16-9f82-caafa9a47f4b' 
go

-- ~/Certification/Pending_approval
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8ae3704-72ad-4d6d-8783-ada3b937341f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '886e4a55-c54f-4c51-98fb-90f2735e5d45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8ae3704-72ad-4d6d-8783-ada3b937341f' 
go

-- ~/Marketing/Process_manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28ccc101-9299-430f-bad7-37ce5e9b4fe7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1297d54-ca84-49d8-9711-90f274912eba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28ccc101-9299-430f-bad7-37ce5e9b4fe7' 
go

-- ~/RiSE/Tagging/Tags
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6075b6b-61d1-4b43-98f9-2643a8dad517' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '254ecc51-2634-4bf5-b4ce-9218ea210a79' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e6075b6b-61d1-4b43-98f9-2643a8dad517' 
go

-- ~/Marketing/Campaigns/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f02ed7a2-c8e2-4824-9f6b-7f0b4eefe6f7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1fccb879-c4ef-41a5-bc3a-9792bfb06c1c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f02ed7a2-c8e2-4824-9f6b-7f0b4eefe6f7' 
go

-- ~/RiSE/Maintenance/Content_types
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e824baf-1350-4890-afd6-1642da111245' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc51957e-99f5-468f-95ef-988f8fc2add5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8e824baf-1350-4890-afd6-1642da111245' 
go

-- ~/Marketing/Segmentation/Define_segments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7fcccde8-bd01-49a3-b2e9-2ebf7d1e4838' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f10d8cee-5eea-4cb4-8991-98e98c4a2b2b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7fcccde8-bd01-49a3-b2e9-2ebf7d1e4838' 
go

-- ~/RiSE
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '691342cb-33cb-4b93-980d-8b6f3e140885' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25475bc2-9c11-4d21-866f-9d7e9df95196' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '691342cb-33cb-4b93-980d-8b6f3e140885' 
go

-- ~/Customers/Customers help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed632ac6-ffd1-4d7c-b631-721d1ca764d5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f41f8fa-22f3-40f1-80bd-9f635d201f53' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ed632ac6-ffd1-4d7c-b631-721d1ca764d5' 
go

-- ~/RiSE/Tagging/Tagged_list_formats
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c3eb197-2360-44a6-adf5-6f7825e94290' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4ab4a2b-54b1-497d-8ef7-a2c389018e0f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c3eb197-2360-44a6-adf5-6f7825e94290' 
go

-- ~/Community/Security
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '339ac538-fbb8-49ea-9522-b86bb5faf89f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8edbd333-a1bc-4502-ace8-a4235a987f24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '339ac538-fbb8-49ea-9522-b86bb5faf89f' 
go

-- ~/RiSE/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be659b4c-79d2-4a4e-aca2-664e8e8723d2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '524d548e-b9b7-44f8-9fef-a997138cd289' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'be659b4c-79d2-4a4e-aca2-664e8e8723d2' 
go

-- ~/RiSE/Process_automation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a88bfa97-9261-4f0c-b61d-87300416a496' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3871008-3fc7-473d-8fa5-ac38a2434a34' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a88bfa97-9261-4f0c-b61d-87300416a496' 
go

-- ~/Continuum/Certification_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b1e052e-ea0e-4d0e-a3e4-bb66a6f06780' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '096f8b6f-8925-445c-9e3a-b28cd828edff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b1e052e-ea0e-4d0e-a3e4-bb66a6f06780' 
go

-- ~/AR_Cash/ARCash_help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c6c9550-48fb-4bbe-8eb1-7c062f198c7d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9f1845a-df13-4f45-9307-b478eaa60b52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c6c9550-48fb-4bbe-8eb1-7c062f198c7d' 
go

-- ~/Marketing/Process_manager/Tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b09327f0-c8d6-419a-8586-2e69e7076f77' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fab6cf25-1ed4-44ca-bb7a-b7827875754b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b09327f0-c8d6-419a-8586-2e69e7076f77' 
go

-- ~/Certification/Providers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91a83674-1784-43fd-9eda-15abd128c89e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e81f040b-02b8-4c1d-86de-bdf489325411' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '91a83674-1784-43fd-9eda-15abd128c89e' 
go

-- ~/Certification/Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c1815d1-10da-446b-b955-554f3f96c253' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '042501da-e7b5-4810-a23e-bfd89314b213' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c1815d1-10da-446b-b955-554f3f96c253' 
go

-- ~/Cart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '821f2be3-6bdf-4a19-b692-be61d81f2428' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcb6497b-858a-4f5a-9131-c2f4fa4f8601' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '821f2be3-6bdf-4a19-b692-be61d81f2428' 
go

-- ~/Fundraising/Find_gift_items
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5c030ca-93e9-4c2e-a732-eea150b86572' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ae87f7d9-0e2b-48c7-b89e-c5074a14e829' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd5c030ca-93e9-4c2e-a732-eea150b86572' 
go

-- ~/Marketing/Campaigns/Define inserts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5125e771-a36f-42dd-aa83-f02ce933defc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea236186-2fe6-4b1d-9024-c646b528f6e4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5125e771-a36f-42dd-aa83-f02ce933defc' 
go

-- ~/Events/Calendar
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9378a319-8300-4179-8d9f-d0d1b625036b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c9f727a-5a98-44d4-a5b7-c65b4b8e6957' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9378a319-8300-4179-8d9f-d0d1b625036b' 
go

-- ~/RiSE/Task_viewer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1bdd5a6-ce6a-4883-b4fd-90d4a2543aa3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9280eaa7-bd38-45b1-9502-c9297c14b0e0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a1bdd5a6-ce6a-4883-b4fd-90d4a2543aa3' 
go

-- ~/Certification/Define_programs/Program_groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d93fbe7-8ebe-491e-a6d7-8911557d41cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00b7852c-d655-49af-98e3-c97ac113af00' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d93fbe7-8ebe-491e-a6d7-8911557d41cc' 
go

-- ~/Settings/Fundraising/Set_up_tables/Distributions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fdfba952-cfed-4f42-9822-4bc4a0fbae98' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6164dfb5-6a8d-47b8-a8ae-cdb72ad187c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fdfba952-cfed-4f42-9822-4bc4a0fbae98' 
go

-- ~/Certification/Enrollments/By_enrollee
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b622027-3ea5-4a8f-9869-2e791d22d7b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54469351-9557-4292-9b7a-cf23eb997d88' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b622027-3ea5-4a8f-9869-2e791d22d7b2' 
go

-- ~/RiSE/Workflow/Workflow_viewer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cdee0345-a4c9-484e-8551-07bed3ec77b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c29b192a-7f56-46e9-860d-d1603593aa44' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cdee0345-a4c9-484e-8551-07bed3ec77b4' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fda958a6-d862-4745-b548-35419f298c55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91a25e8d-4fd2-4329-a472-d30dc9c7842a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fda958a6-d862-4745-b548-35419f298c55' 
go

-- ~/Membership/Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd0e5eba-5a2d-4470-9c6c-37c266337f2b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd900b72-470d-4ec9-88e7-d3da07eecddb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dd0e5eba-5a2d-4470-9c6c-37c266337f2b' 
go

-- ~/Certification/Enrollments/Inactive_enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8cfdbc31-2e5e-4910-9ef9-f0ff6ba1c980' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eaa22610-6417-417a-88e0-d7f83d9b4486' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8cfdbc31-2e5e-4910-9ef9-f0ff6ba1c980' 
go

-- ~/Fundraising/Fundraising_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84d889f6-1157-4516-bed1-d564167d6268' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '658489a8-fee4-489d-b27e-da84b4d99dad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84d889f6-1157-4516-bed1-d564167d6268' 
go

-- ~/Community/Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2885208-65ed-4295-8dc5-f3bdc2cfd5ea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '061ba79b-aef5-47c3-a6d3-db396b78b64e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b2885208-65ed-4295-8dc5-f3bdc2cfd5ea' 
go

-- ~/Referrals/Referrals help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f05675d-65de-4b6c-bf36-3cfae183aab4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4edc2cae-8ec3-454c-b427-ddb5c2e44e80' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8f05675d-65de-4b6c-bf36-3cfae183aab4' 
go

-- ~/Community/Security/Users
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd158190e-cf09-4d8f-b0cf-0fb92f7e6557' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6c646e6-dce8-4997-bd74-de975a97aca4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd158190e-cf09-4d8f-b0cf-0fb92f7e6557' 
go

-- ~/Fundraising/Recurring_donations/Review_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9002abc7-b1c9-47e9-bee6-b74a0d82e788' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0026133b-32fd-4866-89e6-e3c7490e57f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9002abc7-b1c9-47e9-bee6-b74a0d82e788' 
go

-- ~/Fundraising/Friendraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5962b6d-1167-4001-952f-a4bc226b7029' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93a05893-fbfb-4cf8-ae8f-e7cf927037bf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c5962b6d-1167-4001-952f-a4bc226b7029' 
go

-- ~/Exposition/Exposition help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd44b22ca-7a23-47c9-af5d-934c4e77bf6c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '380a4709-6105-4e68-a2f9-e87d2b0ad6d7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd44b22ca-7a23-47c9-af5d-934c4e77bf6c' 
go

-- ~/Certification/Enrollments/Enrollment_by__program
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ef61d47-9b64-47d2-8613-3f2b3da60244' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99ad059f-5909-4a3c-af37-ee8e1d83a98f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0ef61d47-9b64-47d2-8613-3f2b3da60244' 
go

-- ~/RiSE/Site_Builder/Manage_shortcuts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72247f1d-eaf8-43d7-be7a-6065115212a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23f03ae0-4641-4fcf-a3d7-f1304ed96ab7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '72247f1d-eaf8-43d7-be7a-6065115212a9' 
go

-- ~/Marketing/Campaigns/Track_campaigns
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b007242-50a6-4861-b0d4-ed7cc15ae75d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fc92aaa-7daa-4a36-8bbb-f1c4759eb7e0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b007242-50a6-4861-b0d4-ed7cc15ae75d' 
go

-- ~/Marketing/RFM
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '659fa71c-1b3b-4dfc-8a00-2a91f293d935' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21ac2a76-e548-41af-9d40-f2b1db0e4917' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '659fa71c-1b3b-4dfc-8a00-2a91f293d935' 
go

-- ~/Community/Find_contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '41cd1b12-1f27-4fa5-b5b2-76497f9bc4cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c454f7f-1752-42a0-a57f-f517c0b732e7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '41cd1b12-1f27-4fa5-b5b2-76497f9bc4cf' 
go

-- ~/Membership/Automatic_renewals/Process_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '406cdd09-5cae-4c78-9e28-c97f556e0ef3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49f060a2-8bb7-4d6b-813a-f6af4702c71a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '406cdd09-5cae-4c78-9e28-c97f556e0ef3' 
go

-- ~/Marketing/RFM/Run_analytics
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10c80902-6c17-4981-af9a-231585b4c887' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96b19bcc-6e26-4034-a093-f773bc9c07ef' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '10c80902-6c17-4981-af9a-231585b4c887' 
go

-- ~/Community/Add_contact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c89f96d-b4d0-4227-b262-5bff48814a53' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e61f66ff-decc-40b1-90d6-f7cc2aa1decd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c89f96d-b4d0-4227-b262-5bff48814a53' 
go

-- ~/Marketing/Process_manager/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ecec2e48-4df4-4d6d-8bc9-ad77694c5bc4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e261bac5-cb2e-49fd-a2e4-f81994ddeb30' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ecec2e48-4df4-4d6d-8bc9-ad77694c5bc4' 
go

-- ~/Community/Security/Roles
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99192746-279d-4c31-aa4c-3cef4b535566' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05df6ecc-0087-410d-86b9-fa891764e2ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '99192746-279d-4c31-aa4c-3cef4b535566' 
go

-- ~/Marketing/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb020529-d653-4083-9943-952f990a4845' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44a2556b-043e-4a52-8bea-fcddc255fb09' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb020529-d653-4083-9943-952f990a4845' 
go

-- ~/Community
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6efe719e-b566-4643-a46f-df11cf09797b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1576b8a-bdf5-43a8-a59f-fd5416048031' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6efe719e-b566-4643-a46f-df11cf09797b' 
go

-- ~/RiSE/Page_builder/Manage_content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '256e0d39-3399-47e6-b7c3-0ed10eb350d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2f8a071-ca8e-4254-9831-fd6bb9536dfd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '256e0d39-3399-47e6-b7c3-0ed10eb350d1' 
go

