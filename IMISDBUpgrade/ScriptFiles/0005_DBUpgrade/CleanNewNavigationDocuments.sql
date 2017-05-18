-- ~/Marketing/Communication_logs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7de523bd-f56f-4609-a9f6-d7a915185d81' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f226464-7895-42dc-954b-108b8963327e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7de523bd-f56f-4609-a9f6-d7a915185d81' 
go

-- ~/Fundraising/Configure_premiums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7441cd5a-0d01-477d-b52b-6281002d6949' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '425f218d-b8be-43b9-941e-20c22a38414e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7441cd5a-0d01-477d-b52b-6281002d6949' 
go

-- ~/Marketing
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc29c267-54f4-46e0-a2c9-d50b63f413b6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b35f0b99-bc7c-440e-bc77-3fe91c69c10e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc29c267-54f4-46e0-a2c9-d50b63f413b6' 
go

-- ~/Settings/Commerce/AutoPay_Setup_Status
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64d356b7-19a0-44f3-a0e3-8a1031ff7e71' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44c97ddc-52c5-4c6b-96ee-5977425d663e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64d356b7-19a0-44f3-a0e3-8a1031ff7e71' 
go

-- ~/System Setup/Module setup/Quick_setup
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0f63cac-173b-4317-ad50-b68402c76937' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce3b9127-661d-4519-89c8-5db35db5529a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f0f63cac-173b-4317-ad50-b68402c76937' 
go

-- ~/RiSE/Maintenance/Publish_Code
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1566247a-d10c-4b4a-b0d7-3f5fa613742d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a625a106-c4a9-48e0-83f9-90785f66c0a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1566247a-d10c-4b4a-b0d7-3f5fa613742d' 
go

-- ~/Commerce/[break]
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fdc30b8-1023-4817-b3bb-f29c6d7cfd6e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d5e8d7b-0bb4-4e08-a47f-92836a4ada37' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0fdc30b8-1023-4817-b3bb-f29c6d7cfd6e' 
go

-- ~/Marketing/Advanced_email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a4f24b7-8094-497e-a990-23ac25faab43' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3c787e9-c54e-4e4e-b8ae-a8c0e906de2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4a4f24b7-8094-497e-a990-23ac25faab43' 
go

-- ~/Community/Manage_duplicates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '375f708a-f09d-4f4b-b9d4-1af32262101d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '572b535f-034a-485f-92a2-b21ab2a3e52c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '375f708a-f09d-4f4b-b9d4-1af32262101d' 
go

-- ~/Marketing/Campaigns/Import_source_codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49e873b2-b386-48df-94a4-1eb4e1423ec6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f95b57e-0874-4d08-bccd-b90b861c9a67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '49e873b2-b386-48df-94a4-1eb4e1423ec6' 
go

-- ~/Settings/RiSE/Process_Automation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5496e8e9-9a3d-43e6-b979-1056380a424a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b0aab4a-adb3-4401-acdc-bd9c22e582fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5496e8e9-9a3d-43e6-b979-1056380a424a' 
go

-- ~/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93fe7f5d-ab9a-47b0-a1af-c84dbeefd656' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1f6c469-0b5f-4877-8e60-c87946f4228d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '93fe7f5d-ab9a-47b0-a1af-c84dbeefd656' 
go

-- ~/System Setup/Module setup/Units_of_measure
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8393b94b-ba64-44fe-8617-f01dad69263c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd21296ff-2889-4a7d-a1c8-d650d3cd9c27' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8393b94b-ba64-44fe-8617-f01dad69263c' 
go

-- ~/Membership/Membership_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30e7e0da-6983-412e-86e8-11c074f9065a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8984b68b-4f9c-4f23-9d1c-ede044809f81' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30e7e0da-6983-412e-86e8-11c074f9065a' 
go

