-- ~/Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08cee25e-2dd5-4afd-9a04-c7b153875f6f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3898550a-2e77-4733-8d11-07eab2e50d2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '08cee25e-2dd5-4afd-9a04-c7b153875f6f' 
go

-- ~/Membership/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a890c4d7-ff26-4ef0-9448-a70efc0d324d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c56f244-f19e-44e4-a578-0820dcdb01f2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a890c4d7-ff26-4ef0-9448-a70efc0d324d' 
go

-- ~/Manage/Page_builder/Task_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ec8af25-a5f2-49da-aa6d-10122f6a6a7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f61dc0a-a4a9-49d0-96d4-0c2bca46b3c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ec8af25-a5f2-49da-aa6d-10122f6a6a7a' 
go

-- ~/Membership/Automatic_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f15762c7-28dd-4eaf-aaa7-06da35b514a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f15762c7-28dd-4eaf-aaa7-06da35b514a5' 
go

-- ~/Documentation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fdeaf0cd-e61b-471d-a7d6-674565b44611' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '670be00e-c8e8-4f60-b149-0e8017852837' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fdeaf0cd-e61b-471d-a7d6-674565b44611' 
go

-- ~/Manage/Management_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f32128f-1e37-4da5-9981-885e352d3cba' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c9c521e-771e-4734-b127-1281755788ed' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3f32128f-1e37-4da5-9981-885e352d3cba' 
go

-- ~/Manage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8841cede-69f3-40ab-b0b7-8d6b89700ccd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4495f673-bea2-4c18-ab26-1cc88f7fbc09' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8841cede-69f3-40ab-b0b7-8d6b89700ccd' 
go

-- ~/Fundraising/Automatic_payments/Process_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1faed8c-fb4b-4c29-821d-989a1f245113' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32216f6f-4af0-4e65-a1e6-28ea0fcb4519' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c1faed8c-fb4b-4c29-821d-989a1f245113' 
go

-- ~/Fundraising/Automatic_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a4dbb15-6241-4ae3-9ea9-c81532114e05' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '365f9e45-4a0d-423c-bd68-290a0e20205b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7a4dbb15-6241-4ae3-9ea9-c81532114e05' 
go

-- ~/Continuum/Fundraising_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49ca8145-c80e-42c5-abd6-c353e2650be7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af7226c0-27e7-4fd7-908e-29859ed59a49' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '49ca8145-c80e-42c5-abd6-c353e2650be7' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68fa4fd0-acf2-4d8a-a5d2-25329eca25dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23279ca8-aa23-49d4-adc2-29bf7bbfb6b0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '68fa4fd0-acf2-4d8a-a5d2-25329eca25dd' 
go

-- ~/Fundraising/Import_donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96023846-a353-4d54-85a5-eadd06aa9b75' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5bc1801-515a-4e97-bf1e-2ae3f743055d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '96023846-a353-4d54-85a5-eadd06aa9b75' 
go

-- ~/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6fba54ba-7f73-4f46-8c89-2ca5b593e04b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd764a29d-e44c-45d5-8f62-7a86a15bc257' 
go

-- ~/Membership/Automatic_payments/Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c03352b3-6430-4a06-8db8-913197524af1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c110217d-01b7-4ff5-a57f-2e65ff638757' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c03352b3-6430-4a06-8db8-913197524af1' 
go

-- ~/Fundraising/Automatic_payments/Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2133520b-1c07-433b-8eaf-9276c25695c6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01edaa0d-3555-445d-aac6-2f2e6617d9f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2133520b-1c07-433b-8eaf-9276c25695c6' 
go

-- ~/Manage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9dff87a0-edeb-4870-83a9-f188f5c58fe4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94e31001-ce5a-4963-97ee-39cf39b6633a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9dff87a0-edeb-4870-83a9-f188f5c58fe4' 
go

-- ~/Settings/RiSE
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cec143c6-630a-4bd7-b787-2b5c3f4c7bd9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cec143c6-630a-4bd7-b787-2b5c3f4c7bd9' 
go

-- ~/Manage/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a27eda85-f8e6-4c1c-ac3c-e947eb6150dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bdf5b94b-c2c8-49f0-b609-4594b2dd516b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a27eda85-f8e6-4c1c-ac3c-e947eb6150dd' 
go

-- ~/RiSE/Document_system
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87f99cf8-bb00-4c81-a1a8-de2e92e4db8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87f99cf8-bb00-4c81-a1a8-de2e92e4db8b' 
go

-- ~/Finance/View_batches
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c66c8461-76c8-4bfa-847d-6cbe9e2b7c3a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64889e26-a69a-45f6-979a-482b55e3e9eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c66c8461-76c8-4bfa-847d-6cbe9e2b7c3a' 
go

-- ~/Home/Help
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5a9eed0-d0a2-4a69-aebe-d495f05b5069' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '51a26d6b-6997-4028-9db7-4b735e91a84c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5a9eed0-d0a2-4a69-aebe-d495f05b5069' 
go

-- ~/Settings/Commerce
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '256d29e1-75ab-436e-a029-2ed2b3a9b0c0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71394bad-3650-4f1c-9a18-52ae3c37538d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '256d29e1-75ab-436e-a029-2ed2b3a9b0c0' 
go

-- ~/Membership/Directory/Find
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a98a74c6-33a2-45e7-aec6-636e97039f8c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8744e453-61c5-44cd-ab7a-52d61c37fb45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a98a74c6-33a2-45e7-aec6-636e97039f8c' 
go

-- ~/Manage/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9026fce1-5165-4a69-84f9-447eb3adaaa1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46e483c7-d55f-4431-8f92-52df89022f75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9026fce1-5165-4a69-84f9-447eb3adaaa1' 
go

-- ~/Finance/Advanced_Accounting_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4683f779-d116-4a2f-8630-8290db3cb4c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '225fd0fc-9d7f-48d8-a809-55d88108de02' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4683f779-d116-4a2f-8630-8290db3cb4c5' 
go

-- ~/RiSE/Site_Builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fa03adb-7b7a-4aef-ac28-83408dba62e4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0dbe82d4-4dec-4bc0-8a5a-56f45d155c33' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2fa03adb-7b7a-4aef-ac28-83408dba62e4' 
go

-- ~/Fundraising/Moves_management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b6dc20c-ef6c-4ad1-9bf1-82bf13bb09dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '129d6ad2-a69d-4d34-a50c-572d167ebd52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b6dc20c-ef6c-4ad1-9bf1-82bf13bb09dd' 
go

-- ~/Settings/Finance/AutoPay_Setup_Status
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64d356b7-19a0-44f3-a0e3-8a1031ff7e71' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44c97ddc-52c5-4c6b-96ee-5977425d663e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64d356b7-19a0-44f3-a0e3-8a1031ff7e71' 
go

-- ~/Membership/Automatic_payments/Review_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7b10104-be94-4b75-8ed7-fcd557723837' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd28f2db-a8f5-47ac-995c-6b110c6db25e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7b10104-be94-4b75-8ed7-fcd557723837' 
go

-- ~/Membership/Directory/Add
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c1194a1-f21d-4228-bb31-5a96e91b8f95' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '836d7088-382b-46c4-846c-6bf01cc5b7f0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c1194a1-f21d-4228-bb31-5a96e91b8f95' 
go

-- ~/Continuum
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cea99572-80c4-45d7-80d9-de8ebe146edd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be62478f-d245-4588-a762-6d01de29ae24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cea99572-80c4-45d7-80d9-de8ebe146edd' 
go

-- ~/Settings/Contacts/Contact_security
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5dfd5840-6246-497a-a3ce-be688fed4b81' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8b22f4e-3dce-44e7-a55e-6e10c2f35390' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5dfd5840-6246-497a-a3ce-be688fed4b81' 
go

-- ~/Settings/Contacts/Communication_preferences
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50f80714-44c3-46a1-adec-c07c7bb74659' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f76d9807-fd5f-40fd-a8c1-7129c20694c0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50f80714-44c3-46a1-adec-c07c7bb74659' 
go

-- ~/Manage/Site_builder/Manage_websites
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f027fca-f6b8-47d6-8785-357d29fe04f7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '700a1a34-3c20-43b1-817c-7743401a7671' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2f027fca-f6b8-47d6-8785-357d29fe04f7' 
go

-- ~/Tools/Utilities/Language_Translation_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11c7fd54-4702-40ae-8240-a99d81e793b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd6750c51-18d9-4e08-905c-7e991fa05078' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11c7fd54-4702-40ae-8240-a99d81e793b2' 
go

-- ~/Settings/Finance/Automatic_payment_gateways
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '419dcd37-ad0c-444f-82af-27958001f942' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '588c5c55-bb54-40e2-af35-85d7462486b7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '419dcd37-ad0c-444f-82af-27958001f942' 
go

-- ~/Settings/Contacts/Social_media
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '86fc3a96-b475-4134-9fa9-c6ffab13211f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0fe87e5-7d9d-45b8-979e-89a039f4d1a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '86fc3a96-b475-4134-9fa9-c6ffab13211f' 
go

-- ~/Continuum/Commerce_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1340064c-1f52-430e-b6a3-2ce1b1d165fd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12e7ef18-dfde-4fc4-96bb-8e78c317fdba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1340064c-1f52-430e-b6a3-2ce1b1d165fd' 
go

-- ~/RiSE/Maintenance/Publish_Code
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '83572c01-26a5-480f-ab1c-d57c388f6e48' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a625a106-c4a9-48e0-83f9-90785f66c0a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '83572c01-26a5-480f-ab1c-d57c388f6e48' 
go

-- ~/Finance/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ded0608-37ec-4959-b388-2abed4543a94' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d5e8d7b-0bb4-4e08-a47f-92836a4ada37' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1ded0608-37ec-4959-b388-2abed4543a94' 
go

-- ~/RiSE/Page_builder/Task_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40f4f4ff-b281-4952-bd28-c7322324c17a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '850d30a2-450d-42c5-9e7f-97e999a56abe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '40f4f4ff-b281-4952-bd28-c7322324c17a' 
go

-- ~/Continuum/Contact_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ce9ad3b-1550-4776-8ad3-1f0616a6255d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a775ae9-569e-4ac9-a7a5-9885caca326d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ce9ad3b-1550-4776-8ad3-1f0616a6255d' 
go

-- ~/Membership/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '26556297-6d86-4c52-a19e-8d392dfde90b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '182f0d28-190a-4a87-826a-a0141f3d4611' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '26556297-6d86-4c52-a19e-8d392dfde90b' 
go

-- ~/Marketing/Advanced_email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bda966b6-b257-4b00-8fe2-0009b52bd97a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3c787e9-c54e-4e4e-b8ae-a8c0e906de2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bda966b6-b257-4b00-8fe2-0009b52bd97a' 
go

-- ~/RiSE/Process_automation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60b19c8d-53d4-40ce-93bc-ec44ed94b264' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3871008-3fc7-473d-8fa5-ac38a2434a34' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '60b19c8d-53d4-40ce-93bc-ec44ed94b264' 
go

-- ~/Marketing/Campaigns/Import_source_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c581a01d-c372-4ebd-9757-6c2b021d1e5a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f95b57e-0874-4d08-bccd-b90b861c9a67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c581a01d-c372-4ebd-9757-6c2b021d1e5a' 
go

-- ~/Settings/RiSE/Process_Automation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3429f57d-5761-4429-ba8d-7c087c42d6c2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b0aab4a-adb3-4401-acdc-bd9c22e582fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3429f57d-5761-4429-ba8d-7c087c42d6c2' 
go

-- ~
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fda958a6-d862-4745-b548-35419f298c55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91a25e8d-4fd2-4329-a472-d30dc9c7842a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fda958a6-d862-4745-b548-35419f298c55' 
go

-- ~/Membership/Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1fd91e89-af3b-4cab-afcf-89e6be1c1083' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd900b72-470d-4ec9-88e7-d3da07eecddb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1fd91e89-af3b-4cab-afcf-89e6be1c1083' 
go

-- ~/Settings/Finance/Payment_method_sets
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87d33644-0f8d-4d91-8ee5-10a461997bc0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e6319a9-f85f-4132-8cc7-d3fa045037c5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87d33644-0f8d-4d91-8ee5-10a461997bc0' 
go

-- ~/Continuum/Accounting_reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48adc5d5-21c5-490c-b12c-5300294ae5b1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '278acec6-700c-408c-9fb6-d5c69d0cdd51' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '48adc5d5-21c5-490c-b12c-5300294ae5b1' 
go

-- ~/Settings/Commerce/General
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93fd3440-08d4-47d3-9b85-a32437c84b70' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f9829ab-6d75-4059-bd1c-d6f23449ff17' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '93fd3440-08d4-47d3-9b85-a32437c84b70' 
go

-- ~/Manage/Page_builder/Task_list
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64b7c334-bdf0-499a-9b5e-1036afb56e23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5b8b7da-0903-4678-b863-d7a0f51b72e8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64b7c334-bdf0-499a-9b5e-1036afb56e23' 
go

-- ~/Settings/About_iMIS
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc07081c-97a8-4e41-befa-30cbb05206f3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1de7e1ac-d75c-4cd8-9743-d98faa80a134' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc07081c-97a8-4e41-befa-30cbb05206f3' 
go

-- ~/Membership/Directory/Find
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81281337-75c8-4957-8cb8-c52778968fea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9774411-732b-44db-aec1-da12816720fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81281337-75c8-4957-8cb8-c52778968fea' 
go

-- ~/Community/Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ba276f46-dab0-4797-8130-7709f34afc8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '061ba79b-aef5-47c3-a6d3-db396b78b64e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ba276f46-dab0-4797-8130-7709f34afc8b' 
go

-- ~/Fundraising/Automatic_payments/Review_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9002abc7-b1c9-47e9-bee6-b74a0d82e788' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0026133b-32fd-4866-89e6-e3c7490e57f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9002abc7-b1c9-47e9-bee6-b74a0d82e788' 
go

-- ~/Settings/Contacts/Account_management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78a11e1f-6d40-4b9e-88ed-dd824875ec45' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6cf63900-8fb3-44e9-a52a-e89125cf8a44' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78a11e1f-6d40-4b9e-88ed-dd824875ec45' 
go

-- ~/Events/Add_event
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c6d5e36-230d-4b1b-a99d-698a97be5e06' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9defb847-2feb-4eae-91cd-f474ceb0eec8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8c6d5e36-230d-4b1b-a99d-698a97be5e06' 
go

-- ~/Settings/Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f85940de-239d-450e-a4b9-df17ad3a33e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd49eec1-0757-4309-9ab9-f593a05aaf47' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f85940de-239d-450e-a4b9-df17ad3a33e1' 
go

-- ~/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5d46136-2332-487c-857b-4bf1a58a92ed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2bbf4221-39c7-4d25-a87f-f6764ddb6c44' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5d46136-2332-487c-857b-4bf1a58a92ed' 
go

-- ~/Membership/Automatic_payments/Process_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '187940c0-87a8-45e1-8f70-ac6853f7bc17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49f060a2-8bb7-4d6b-813a-f6af4702c71a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '187940c0-87a8-45e1-8f70-ac6853f7bc17' 
go

