-- $/Fundraising/DefaultSystem/Queries/Dashboards/MyMajorDonors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15d0cca1-b81e-4523-be32-d90db0ba61a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8f4dd79-6338-450a-a0b5-00e736c1c571' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '15d0cca1-b81e-4523-be32-d90db0ba61a8' 
go

-- $/ContactManagement/DefaultSystem/Queries/My Registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1804c87-e905-4080-9b8d-ac205af749e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '723129a1-e9f1-44df-ac71-02f526fe277a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a1804c87-e905-4080-9b8d-ac205af749e1' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrations by Type List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '41079cb6-ef26-49d7-9bd2-7e14c3636e31' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9e3b9880-de33-49bd-b960-0423f4a8e0fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '41079cb6-ef26-49d7-9bd2-7e14c3636e31' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Friendraising Mapping
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '525ed123-9496-4c5a-8874-d4018f92568f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '966a41c9-c446-4f4e-8e9d-06b259146b3f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '525ed123-9496-4c5a-8874-d4018f92568f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Change History Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a7c54f1-c997-486c-84f6-17c3027b1719' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c13c586-6e63-4f38-84ca-07e724ad367a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0a7c54f1-c997-486c-84f6-17c3027b1719' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Payment Method Set Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6624c56-3e2b-4f3b-a5ee-4e3a75aadf43' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6936a91-7c8d-4341-b4e5-09102075bd9f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a6624c56-3e2b-4f3b-a5ee-4e3a75aadf43' 
go

-- $/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Activities/Organization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e52eeb1b-02e2-409d-bf59-5cf7d1f43a48' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b55507ef-9972-41be-8697-0c0c587ac175' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e52eeb1b-02e2-409d-bf59-5cf7d1f43a48' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Web Product Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8fcfc81-5a95-45be-8d7d-382ddcff9221' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7eeaa57f-0244-470b-abd5-0d5287c0aec7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8fcfc81-5a95-45be-8d7d-382ddcff9221' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Order Confirmation Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ff8d47e-45b7-464a-afc5-2180128e726c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55024550-b20b-4348-98c1-0d771c935f72' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ff8d47e-45b7-464a-afc5-2180128e726c' 
go

-- $/Samples/Directory/OrganizationSearch/All organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b45c7e47-dd7b-443a-b315-953787ed8f68' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5183345d-4076-46ac-8e6f-0e3bb8f3e989' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b45c7e47-dd7b-443a-b315-953787ed8f68' 
go

-- $/Samples/Dashboards/Community/Progress Tracker - Total active organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c1ad2f4-2263-4bde-b634-87571d694568' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f66d19de-aeee-4501-9bb7-0f4b5c877bcf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8c1ad2f4-2263-4bde-b634-87571d694568' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrations by Reg Option
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75f54787-a3df-41f2-9087-974b4ff52672' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33f75742-9115-4474-a9cc-10b2e444e130' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75f54787-a3df-41f2-9087-974b4ff52672' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Past members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7afddc7-4a6f-4d56-9af0-72d5e2e1ba0b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b67291cb-5050-4335-b899-130133682351' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7afddc7-4a6f-4d56-9af0-72d5e2e1ba0b' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Processed payments for recurring donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f420f2bf-8579-43f3-9e8a-9e9fda904412' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60ba34db-7908-49e0-bb5c-16d5f5cc8e64' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f420f2bf-8579-43f3-9e8a-9e9fda904412' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Future members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '240520e3-3e51-4a3f-b036-4b56466eea32' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0cabe38d-373f-49e6-957b-16f9851271ba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '240520e3-3e51-4a3f-b036-4b56466eea32' 
go

-- $/Common/Communications/Queries/Event program registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e88d9f5e-7fab-43fe-b798-496d464fe8e0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78d7f9d2-2d8e-4c46-a788-1898a7c879ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e88d9f5e-7fab-43fe-b798-496d464fe8e0' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Deferred
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '050856bc-43fe-4138-88b3-8a968f2e8b1f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db1d9300-1690-4610-ae8c-18a64d658668' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '050856bc-43fe-4138-88b3-8a968f2e8b1f' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent gifts any size
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0554ddd-1581-498d-b0f5-753c85948034' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '69e9d762-eca7-4170-9ef5-191c07f299d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e0554ddd-1581-498d-b0f5-753c85948034' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Gifts Received by Calendar Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9c669bf-77dd-411b-a2d6-1a661a1894b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5d41c62-9776-4105-9913-19bf185eb08a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd9c669bf-77dd-411b-a2d6-1a661a1894b4' 
go

-- $/Samples/Dashboards/Community/Data integrity/Locked out users
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5af4e23e-e429-40b2-a957-44d88b0d0374' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9df1587c-7c46-4cc2-a7a2-1a3da8dcae20' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5af4e23e-e429-40b2-a957-44d88b0d0374' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Summary Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '545579d3-7793-46fe-a167-94a346882a83' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ffc9228-be3a-4678-a5f4-1a4c22a95c8d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '545579d3-7793-46fe-a167-94a346882a83' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Event Registrations Last Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '107f1bb9-1a0e-4d46-a47f-b9fbe6663e8f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ee7e8aa9-21a4-4020-87d0-1a4c4bd73f8c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '107f1bb9-1a0e-4d46-a47f-b9fbe6663e8f' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/Organization search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c24ac811-1a35-4f0e-a6d8-3b9eab87798a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd1fe3ebf-b715-4c21-8a70-1aa33247491e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c24ac811-1a35-4f0e-a6d8-3b9eab87798a' 
go

-- $/Samples/Directory/PeopleSearch/By ID
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eadc7725-06dd-46d3-b1c6-94251af89431' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98ca7bfd-50a4-43e4-a312-1b25f351d235' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eadc7725-06dd-46d3-b1c6-94251af89431' 
go

-- $/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09c85d7c-6aa1-485d-9caa-92910017b6c0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc15ab37-ec39-41e2-9375-1b570420c914' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09c85d7c-6aa1-485d-9caa-92910017b6c0' 
go

-- $/Common/Tasks/Queries/Event registration trigger
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7008768a-823e-4632-8840-223cb654e1cb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2bcfa5c0-ac9d-4629-97e7-1cd20c9a5adf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7008768a-823e-4632-8840-223cb654e1cb' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/General Product Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7de9ef4-e100-416c-b70c-603927f3b88e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'deaad7a1-4184-47cb-bb68-1d1481864818' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c7de9ef4-e100-416c-b70c-603927f3b88e' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Unique opens
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7492e219-f1d6-4001-91bd-65efa5e04af8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6eea43b-2c06-49b4-bc22-1f10b0e7da23' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7492e219-f1d6-4001-91bd-65efa5e04af8' 
go

-- $/Samples/Dashboards/Events/Specific Events/Program Item Reg by Category
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '377d5006-52d5-4e0a-96c8-7b9f8edd1607' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '86bd9d5e-2ea1-46ad-9ade-200d3fc55eb0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '377d5006-52d5-4e0a-96c8-7b9f8edd1607' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/Contacts/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c2344314-2765-4272-84ad-02740107dbad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1ca183d-71b8-4927-acfb-206f6c64b8f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c2344314-2765-4272-84ad-02740107dbad' 
go

-- $/ContactManagement/DefaultSystem/Queries/Organizations/OrganizationList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2bccd8cc-6108-4c78-8e77-d06cf7a4dbcf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8885536-3faf-4c91-8721-20be9530a5e8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2bccd8cc-6108-4c78-8e77-d06cf7a4dbcf' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By ID
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de5afb05-058c-4888-b92b-60a449cf29f1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '83ecda57-2c5f-4498-8179-217e6a978216' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de5afb05-058c-4888-b92b-60a449cf29f1' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Collection Organizer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b030959-9dc0-4d77-bdfc-b0b08affbf04' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e57d569-8967-484e-aac5-21bfbc14ecc4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b030959-9dc0-4d77-bdfc-b0b08affbf04' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent gifts under 500.00
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d31616c-5f42-4211-ae8a-c67f491c64fd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '35b90395-0588-4f12-bc84-2211e2e57ce9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d31616c-5f42-4211-ae8a-c67f491c64fd' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Profile Picture
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6427de3d-0321-4200-a812-461a592d04e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de669a0a-da5c-42ce-b846-24f23382f024' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6427de3d-0321-4200-a812-461a592d04e8' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Unique customers this year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd5cd781-6d2f-4f0e-aeae-0ecf41cc26b5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d2d53e0-1742-445f-83bc-25a0995c41df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd5cd781-6d2f-4f0e-aeae-0ecf41cc26b5' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Submit Order Button Link
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '048a78ac-379b-44fd-99e7-667189e99bb4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abb66f06-aee0-467d-8256-25f9e020eacb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '048a78ac-379b-44fd-99e7-667189e99bb4' 
go

-- $/Directory/Contacts/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e031969-b5b4-40dd-a63e-9eb30d560b8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3389bad7-8d39-44b4-b216-263f9d7a1395' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8e031969-b5b4-40dd-a63e-9eb30d560b8b' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Events missing dates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81f938e3-986c-4544-b866-10c5630e669d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5248f21d-d559-476b-9bbf-2872410666f3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81f938e3-986c-4544-b866-10c5630e669d' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Submitted automatic payments for renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a15cda85-8206-405b-8c60-9980c7251c4a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '22217df9-a2d1-47c3-860f-289614f6f2ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a15cda85-8206-405b-8c60-9980c7251c4a' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Funds Raised Last Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df883197-e3d0-4556-bf53-7acf7aa4363b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f43b500-b5d2-4c52-8d01-28f0b7a873c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'df883197-e3d0-4556-bf53-7acf7aa4363b' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By all common criteria
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09e86b63-135c-4170-831b-afad3c534897' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b53741c-e3c7-4afe-b5b6-2ae2ca9f0987' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09e86b63-135c-4170-831b-afad3c534897' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Function Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f859cc21-9c77-40c5-8b6b-04e4a1d8c81f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2207125-b64b-42ad-b660-2b1225d1f04c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f859cc21-9c77-40c5-8b6b-04e4a1d8c81f' 
go

-- $/ContactManagement/DefaultSystem/Queries/Org Registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96069e9e-72b4-489d-ba6b-429a7f7c3b44' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '823ab672-a277-453e-9687-2b3a30149f79' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '96069e9e-72b4-489d-ba6b-429a7f7c3b44' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Friendraising Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89e3afae-d298-44c5-b0fc-e243328cd28b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19b2f987-ccf8-4b17-b789-2b754da4a683' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89e3afae-d298-44c5-b0fc-e243328cd28b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Change Logon Password
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c85a184-a4ab-4897-9f8a-05f5d284e532' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff5c4f2b-f2c1-4eaa-8584-2d8ee5ded97b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5c85a184-a4ab-4897-9f8a-05f5d284e532' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Communities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20b84620-2a63-4f67-a6f1-3ef8d6174982' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7eff6fdc-7f67-4236-930c-2dadca907ddf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '20b84620-2a63-4f67-a6f1-3ef8d6174982' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Event Registrations This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99efed97-660b-42a8-b5c3-dcb13fe4b500' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b80dcebd-4ab4-49cb-a432-2eac37f867bf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '99efed97-660b-42a8-b5c3-dcb13fe4b500' 
go

-- $/Samples/Dashboards/Fundraising/Top premiums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6506eb6e-2b48-4ab7-949e-dae92c50f836' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a760bbf-68f1-40c9-8d67-2efdc9bb797e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6506eb6e-2b48-4ab7-949e-dae92c50f836' 
go

-- $/Samples/Dashboards/Events/Specific Events/Program Item Registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7317815-c31f-4dec-880b-de0b5acdfe78' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '67391a34-d25b-41ee-964a-2fe653ede916' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c7317815-c31f-4dec-880b-de0b5acdfe78' 
go

-- $/Samples/Dashboards/Fundraising/Donations by source code this year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4739ded-b354-4382-8f04-2659b17ee193' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30fb9fce-638e-4ca3-a5f9-31158b91b7c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e4739ded-b354-4382-8f04-2659b17ee193' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Spam reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2116810a-2d93-448f-95a4-142395052a46' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '688a71da-e500-44c3-b4f7-31396fdf2656' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2116810a-2d93-448f-95a4-142395052a46' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Submitted payments for recurring donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33ce6f92-fe9a-46e6-b863-3b9e35df2358' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7790e8e7-5bc3-4d96-800e-3148eb6ee11c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '33ce6f92-fe9a-46e6-b863-3b9e35df2358' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Address
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '281aeb05-7b49-4775-8755-e331f4ec80d6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bbb16378-acdb-4dad-9b3b-3187397125bb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '281aeb05-7b49-4775-8755-e331f4ec80d6' 
go

-- $/Samples/Dashboards/Advanced Email/Progress Tracker - Unique clicks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c45957e-8c7f-40c6-85b7-ecdf4ec6527c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92b650d8-3754-4729-a743-32dcca332a2d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c45957e-8c7f-40c6-85b7-ecdf4ec6527c' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By task date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '995787d5-b737-4c00-82e5-e9647ea26df2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9011d5ab-ca55-49c5-ac92-334912a6cbc6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '995787d5-b737-4c00-82e5-e9647ea26df2' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2460cf64-461f-45af-bc5f-337aaf1c9397' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
go

-- $/ContactManagement/DefaultSystem/Queries/Organizations/PrimaryOrganizationSelect
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c8ac390a-db20-4532-a8cb-2adeb3cdcd8b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b36009bf-f009-4b92-8ff7-33e3b6af6fc3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c8ac390a-db20-4532-a8cb-2adeb3cdcd8b' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Payment history for recurring donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c4ea2464-321d-4327-a1a4-ba382ab23789' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d95aeca-143b-4bb1-836c-340d35e8777d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c4ea2464-321d-4327-a1a4-ba382ab23789' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Query Profile Picture List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd28746c7-daa0-4aed-a7bb-f8025df1fcc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7f570d0-f6df-44d6-9f68-34b180d02b09' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd28746c7-daa0-4aed-a7bb-f8025df1fcc8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Licensing
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7091f818-cf06-43df-b85e-fe88e1e22504' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4217e630-d7bb-41c0-97c1-360410c71c31' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7091f818-cf06-43df-b85e-fe88e1e22504' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Confirmation Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89e8cced-2957-423f-8cd1-fa73396a069f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5c34a70-8fd6-4b83-a635-360c0999b2f0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89e8cced-2957-423f-8cd1-fa73396a069f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Interaction Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '623e808f-bb36-4c5f-817d-dbe586b92eca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab348dae-491e-4a18-b3f8-362bd9c7a7a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '623e808f-bb36-4c5f-817d-dbe586b92eca' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Duplicate Merge
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45679abb-c260-4f6e-a08e-5775eef6ed33' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf74eb32-ad8a-4bfd-ba2f-369e39d5b18c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '45679abb-c260-4f6e-a08e-5775eef6ed33' 
go

-- $/Samples/Dashboards/Community/Top orgs/By individual posts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c8c12d0-ba59-4c29-a1a7-76be93464c9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53cc611f-0c9c-44ea-b515-37bd5fc88287' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9c8c12d0-ba59-4c29-a1a7-76be93464c9e' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Sign In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd721ade5-d1a5-4cb7-b819-2ddf130d0aa8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81f151a8-f5a3-4adc-9704-37d38c94af10' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd721ade5-d1a5-4cb7-b819-2ddf130d0aa8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Product Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74a2042c-6a64-480d-9294-225d8ae0566f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1496ae9-65bf-4322-9494-38088eb35a28' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '74a2042c-6a64-480d-9294-225d8ae0566f' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrations This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f9a23d3-6fae-4e60-9da4-725bb767eb6e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '714a6472-99f5-4543-adee-3815d175f699' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9f9a23d3-6fae-4e60-9da4-725bb767eb6e' 
go

-- $/Samples/ReportingServices/SSRS Training Parameter
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6914c7b-ced8-444a-bcbf-d07b704076ee' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b4cc777a-8925-4b37-b58b-399bbaf2555f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a6914c7b-ced8-444a-bcbf-d07b704076ee' 
go

-- $/Samples/Dashboards/Community/Contacts by Region
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b5c4631-5618-4a82-98e7-d9ebf1f674c6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '155e21fc-4582-43bd-af49-39cad396b97d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8b5c4631-5618-4a82-98e7-d9ebf1f674c6' 
go

-- $/Samples/Dashboards/Events/Registrations by Event This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01430e6e-fb35-4f11-a2c6-99822b314057' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9e0e802e-5ee2-4c3f-9d04-3b825affeaa3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '01430e6e-fb35-4f11-a2c6-99822b314057' 
go

-- $/Samples/Dashboards/Events/Revenue by Event This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98378c9d-46d8-415b-b155-cb4dc9bae3fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7d2a4a66-b2f2-40ea-ad3e-3cd4cebcecaa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '98378c9d-46d8-415b-b155-cb4dc9bae3fb' 
go

-- $/Samples/Dashboards/Community/Progress Tracker - Total Active Individuals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75759bdb-2bd1-42a0-91c5-ec76a212dade' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e65aef88-893d-4bdc-a39f-3e3d6fb1eaca' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75759bdb-2bd1-42a0-91c5-ec76a212dade' 
go

-- $/Samples/Dashboards/Membership/Lapsed and Lapsing/Lapsed members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d7f90d1-e02d-47a7-816a-f9fada530040' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87a77e55-c03d-49f2-8ad4-3e92898fb790' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0d7f90d1-e02d-47a7-816a-f9fada530040' 
go

-- $/Samples/StaffHome/Active DB records by type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8d9645a1-2bfa-4235-9f0b-9382ed95792c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9db2d33e-a787-4eaa-8772-3ed007b19411' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8d9645a1-2bfa-4235-9f0b-9382ed95792c' 
go

-- $/Samples/ReportingServices/SSRS Training
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fb4582f-e135-46c4-b623-cc799f836ed9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af67bcff-43d4-47b0-a49e-3ed6b37a2317' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2fb4582f-e135-46c4-b623-cc799f836ed9' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/File Viewer For Web Services
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fd77a11-cd57-4b21-a975-1e39429fde3c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f588c319-1404-4c84-8709-42679f87b254' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3fd77a11-cd57-4b21-a975-1e39429fde3c' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/Transcript.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b7a2fc9-ce3f-45f2-aa37-153b57cad8ed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '591433db-3c57-45b4-922e-426f86f70df6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b7a2fc9-ce3f-45f2-aa37-153b57cad8ed' 
go

-- $/Samples/StaffHome/Members by Region
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '083640bb-fcb6-472f-84ee-8456b5df6032' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f35679a-b00d-4385-b21e-42f8698c1363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '083640bb-fcb6-472f-84ee-8456b5df6032' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Recurring Donation Expected Payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93fb248e-b5ef-442d-8193-66d66f24ced7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a92d1f2b-1121-4868-abad-430db5cd715e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '93fb248e-b5ef-442d-8193-66d66f24ced7' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Invoices/Due soon
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '35e943cc-9e88-445c-9cff-c67b60dd464c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '440cb984-238c-43a4-8a7d-456af1f103cd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '35e943cc-9e88-445c-9cff-c67b60dd464c' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Number of gifts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96863953-7014-46c6-a1dd-3406bd60d77c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7f75bb6-cd68-47e0-b7cf-467b0cb9345b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '96863953-7014-46c6-a1dd-3406bd60d77c' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Number of donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3442bff-1dc6-41c8-bb45-4222907241a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5b69635-fc7b-4612-b413-47056b045782' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f3442bff-1dc6-41c8-bb45-4222907241a8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Log Viewer For Web Services
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '766b5304-07d2-4e5f-bf2a-7f9adc20a605' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fbde2a6b-f582-4ff5-bdc2-47554cecc62a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '766b5304-07d2-4e5f-bf2a-7f9adc20a605' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Giving History by Fund
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a5d02fb-686c-463e-af88-37b8f4affa7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b5395a5-2a21-4997-804e-48b82b70d87c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9a5d02fb-686c-463e-af88-37b8f4affa7a' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Gift Aid Declaration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ca24b84-6e1d-4577-83d2-b6c93d785f82' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60cdee62-86be-47e7-8cd0-48d22d1d53cd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8ca24b84-6e1d-4577-83d2-b6c93d785f82' 
go

-- $/Samples/Dashboards/Advanced Email/Chart - Events by date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea45a6dd-cfb3-43bd-abd6-b2ace89ae1c4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e3fb79a-9676-4b5c-9250-4915587ce1f4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea45a6dd-cfb3-43bd-abd6-b2ace89ae1c4' 
go

-- $/Samples/Security/UserAccess/Contacts available to all users
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea3b2f3f-24c7-40b6-a23c-08bc2d991b0c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '626afeeb-7a87-4938-a307-496a159433a6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea3b2f3f-24c7-40b6-a23c-08bc2d991b0c' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - Total Active Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1cd44771-ef99-4d17-880d-19aa3b8e58f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19dfb124-8cb2-48c6-8c5e-4b086455d0dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1cd44771-ef99-4d17-880d-19aa3b8e58f2' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Past events available in search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95fa80ca-d78d-4028-aa40-d463017625d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ab9e60f-ebdc-4645-b538-4d6a5d00e968' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '95fa80ca-d78d-4028-aa40-d463017625d3' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Unique clicks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b20a87b-4e32-439d-b0f4-d80dd0570b75' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96b26222-94cb-4e3e-bdb7-4e5764f8e0ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3b20a87b-4e32-439d-b0f4-d80dd0570b75' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Average gift
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75c9a021-ebb0-4e35-9adb-e63f2d246f26' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c976a61b-ede7-4f53-8c43-4f7bb789377d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75c9a021-ebb0-4e35-9adb-e63f2d246f26' 
go

-- $/Common/Communications/Templates/Samples/Event Thank You
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fca647f-a5a0-48a0-b8a2-7288788b7665' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c80a3f9-3673-4f29-9a92-516405aace4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3fca647f-a5a0-48a0-b8a2-7288788b7665' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/OrganizationSearch/All organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2d48da8-8f5d-4cab-b7fe-19570fc6049b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '352469ff-0ed6-4de4-95a8-523b893ff90f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e2d48da8-8f5d-4cab-b7fe-19570fc6049b' 
go

-- $/Samples/Dashboards/Fundraising/Funds Raised By Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e72d1e83-3e62-4af7-9a3d-a54ae31f8635' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45a8757c-2e74-46bf-a9de-523fb1f1b34b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e72d1e83-3e62-4af7-9a3d-a54ae31f8635' 
go

-- $/Samples/Dashboards/Fundraising/Top donors/By moves manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '737d818e-b7a1-459a-81f2-5c85da747b93' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f12f6c6c-a44c-4aed-8f57-5296ecd27b67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '737d818e-b7a1-459a-81f2-5c85da747b93' 
go

-- $/Samples/Dashboards/Membership/Active members by type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9488433c-67ca-44f9-8096-5df4bd97d09f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '036ef4e6-8d0b-4029-bfdf-52ba8329a8ca' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9488433c-67ca-44f9-8096-5df4bd97d09f' 
go

-- $/Samples/Charts/Active Contacts by Customer Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcc8f40f-547b-4cf4-b6f3-7d0258e5f272' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5215ce12-44cc-49f8-a3ea-532b8fca2ef7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bcc8f40f-547b-4cf4-b6f3-7d0258e5f272' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Orders This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd6f0232-5cd3-4fe1-bfe0-59b69400ad09' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c46d286-4b35-4c46-b6b9-536ea13e9629' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd6f0232-5cd3-4fe1-bfe0-59b69400ad09' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Dropped
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2970539-b8c6-4dd8-abbd-14cd2f660277' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb5fea50-8b73-48fb-985c-5398193b2177' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b2970539-b8c6-4dd8-abbd-14cd2f660277' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Chart - All events except queued
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '922adcc4-0bb2-48bc-a7f8-de1948168139' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95f87e81-7b08-4524-9967-5584e43cc5bc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '922adcc4-0bb2-48bc-a7f8-de1948168139' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Product Orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db98fa66-7c45-42b5-94b3-fddc92d63bcf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7edfa343-5331-453c-ba47-55f594d86cb6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'db98fa66-7c45-42b5-94b3-fddc92d63bcf' 
go

-- $/Samples/Dashboards/Advanced Email/Chart - Events by type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ff216b9-1d7a-4a50-8d30-f82c9b010523' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6465e48e-a289-44e2-9082-55f84a0a42b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ff216b9-1d7a-4a50-8d30-f82c9b010523' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - Renewals This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63895f20-65e6-4d3e-98ed-19f6e8fb047b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8ca08e9-c6b9-404a-9a71-5831fe75318e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63895f20-65e6-4d3e-98ed-19f6e8fb047b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/YouTubeVideo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '491316b7-6e2b-4a73-ba60-8b32f7161933' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dc606e51-bf18-44bb-bbd0-58d9b0375a97' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '491316b7-6e2b-4a73-ba60-8b32f7161933' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Block
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02d751f8-fe9b-4d4d-b907-1cda28470f97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '844ac05d-e4db-49e5-b2d3-59812bd697a5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '02d751f8-fe9b-4d4d-b907-1cda28470f97' 
go

-- $/Samples/Dashboards/Community/Community posts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aa5c0bcc-d2d5-4666-8a74-1b330a3079a4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9a52e47-04a0-4f5c-aa7f-5a91e32d8324' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aa5c0bcc-d2d5-4666-8a74-1b330a3079a4' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Event Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e75d2ec4-34b2-41ef-b59c-1fe1b9f8bbc7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c116bd3-058b-4bba-97e5-5aab75780d73' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e75d2ec4-34b2-41ef-b59c-1fe1b9f8bbc7' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/People search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c849cbc3-4dff-40ae-8ba6-6a12ffb906ac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a14565cb-6adc-4b11-80c0-5b558d418f31' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c849cbc3-4dff-40ae-8ba6-6a12ffb906ac' 
go

-- $/Samples/Dashboards/Advanced Email/Progress Tracker - Total queued
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78a2539c-7350-4030-9023-28b58321de4a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e704165-7944-4ffb-8748-5bdd9b2a0503' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78a2539c-7350-4030-9023-28b58321de4a' 
go

-- $/Samples/Directory/OrganizationSearch/Member organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b6fef9b-0f6a-42e7-ae10-8e2bf42df83f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c628439-095f-440a-a44c-5e599b45dcc7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b6fef9b-0f6a-42e7-ae10-8e2bf42df83f' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Pending and frozen events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e266adfd-87cf-4de8-b50d-91c1e404e204' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f7bfc98-fe6c-4db0-879f-5f616c219233' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e266adfd-87cf-4de8-b50d-91c1e404e204' 
go

-- $/Samples/Dashboards/Community/Top participants/By posts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88ede76f-129a-4e78-9f5c-f08cb8992e92' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '83046a8e-cdd7-4db9-8405-5fc3566456e0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '88ede76f-129a-4e78-9f5c-f08cb8992e92' 
go

-- $/Common/Communications/Templates/Samples/Event Reminder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f7a9c6d-d1d3-4722-b2ac-487998ccb819' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72d04e48-ed29-4b86-af83-5fcb70b869f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4f7a9c6d-d1d3-4722-b2ac-487998ccb819' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Funds Raised This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07398c70-f803-4ee2-95a9-b368c070be70' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f62e976-fa08-4f5a-81b8-61828076c53a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07398c70-f803-4ee2-95a9-b368c070be70' 
go

-- $/Samples/ProgressTracker/Progress Tracker - Total Active Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a4ab70e-ad8c-46c0-94f6-f2b01936577e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a195bc7-1fb6-48c6-aafb-62b0078015d5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9a4ab70e-ad8c-46c0-94f6-f2b01936577e' 
go

-- $/ContactManagement/DefaultSystem/Queries/FindContacts/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cefc9dc8-790f-4d37-a6c3-71d4b0107603' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c43a2fd2-c04c-4e38-afbc-648e28e5dbab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cefc9dc8-790f-4d37-a6c3-71d4b0107603' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/NRDS Configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '174e72fc-af2a-40cb-85a4-70cf79904fd5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '445b2bfe-c5d9-46a6-a50d-65110fb2d7e9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '174e72fc-af2a-40cb-85a4-70cf79904fd5' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/New users
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1a87182-c115-4a0d-a3c2-1121980342ae' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ccf0c13-7121-43d8-9c85-65a29de32165' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f1a87182-c115-4a0d-a3c2-1121980342ae' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Name
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75cc5aec-a46b-4783-85a6-53e42b861d05' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '380048e8-e962-4ab7-ab8c-66eedfce9f6f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75cc5aec-a46b-4783-85a6-53e42b861d05' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Delivered
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '04ece64c-0f35-4f3e-ac2a-7f2e6693f30c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '83921780-366d-46ca-afb8-6aa0b59e52fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '04ece64c-0f35-4f3e-ac2a-7f2e6693f30c' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Events by date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ccbf3a7-9b67-4f24-82e6-60e99bdd145e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffe15099-8625-4e10-9e11-6ca9fbb95ca2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0ccbf3a7-9b67-4f24-82e6-60e99bdd145e' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Bounces
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '589681ab-6fb4-4d18-bae1-bc29149bd092' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f31305cf-4c96-40a7-b71f-6ee7b1f7defd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '589681ab-6fb4-4d18-bae1-bc29149bd092' 
go

-- $/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Revenue
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32d840ea-1505-4f23-8c6d-ccedfb450562' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72f5d328-9ce7-4297-9c96-727d9412c67f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32d840ea-1505-4f23-8c6d-ccedfb450562' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Report Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'adbefbe2-99fe-44ef-8216-4795183c1803' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2774c3e-6e72-49b8-bcdb-748f1a99d946' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'adbefbe2-99fe-44ef-8216-4795183c1803' 
go

-- $/Samples/Dashboards/Community/Top participants/By community subscriptions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c61e163-17f8-4fc7-8864-7ea89dde06b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d60ef54-fca8-4df0-bb76-76a1feb3cb60' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0c61e163-17f8-4fc7-8864-7ea89dde06b7' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue Last Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98d9da88-c4e0-4812-940f-9ad0628b5d54' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '375ae0f2-7b29-4c30-95ad-76c09f746ac7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '98d9da88-c4e0-4812-940f-9ad0628b5d54' 
go

-- $/Samples/Dashboards/Advanced Email/Responses by communication
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44a0e66a-466f-4a45-ac88-606c50eae65b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6cb32247-f7b9-45fc-bc80-76fe5b52dc50' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '44a0e66a-466f-4a45-ac88-606c50eae65b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/SSRS Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52ebfdeb-d0af-422d-8a2c-52be35c69374' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5607c073-68e0-473b-913a-771b5dabe303' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '52ebfdeb-d0af-422d-8a2c-52be35c69374' 
go

-- $/Samples/Dashboards/Advanced Email/Chart - Last events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94d9d18b-9584-4df2-8037-a938d5207bb5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12712e4a-09ad-467a-ab71-78957fccfb80' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '94d9d18b-9584-4df2-8037-a938d5207bb5' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Future events not available in search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0ec3aeb-3ba6-4e87-8240-15f69258d1a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '780b88a8-7f9f-426e-9bb6-78aa6036bf83' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c0ec3aeb-3ba6-4e87-8240-15f69258d1a1' 
go

-- $/Samples/Directory/PeopleSearch/By task date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a227bea-2b8e-4b5f-bf0a-1ba87e86a859' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a369b78-7733-413f-a9e7-7a0848463fd3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2a227bea-2b8e-4b5f-bf0a-1ba87e86a859' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Progress Tracker
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8df53bd2-d2b4-4198-94ab-af0bdc12ae4c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a15f1b36-c2b1-49ac-9bc1-7acefbeed083' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8df53bd2-d2b4-4198-94ab-af0bdc12ae4c' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Display Name Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33a32308-7e1e-441c-b333-5510b94c7d70' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7721fb20-134d-479a-af6c-7c4b406979a7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '33a32308-7e1e-441c-b333-5510b94c7d70' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/AddThis For Social Networking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad0fab6e-98f1-447c-9376-a16ca734618b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e2c2890-ca6d-4671-8043-7ce364d55208' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad0fab6e-98f1-447c-9376-a16ca734618b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Cart Charges Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5110c01-b4d5-490f-928d-c1ce0f6124d5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc3b026d-ebb4-4bd2-a902-7e784f8edcfb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd5110c01-b4d5-490f-928d-c1ce0f6124d5' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Cart Checkout Button Link
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '064e6a91-4ace-4d0a-bd04-19ae094a4008' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97aca559-3ff8-46b0-9057-8045fafe7809' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '064e6a91-4ace-4d0a-bd04-19ae094a4008' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Top customers/All customers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2cbcfe75-2f8a-46e0-9145-92726bcb4021' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5765a76a-62e5-4010-a0de-82499febb038' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2cbcfe75-2f8a-46e0-9145-92726bcb4021' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Status
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50991b95-1349-4d08-94a9-309bab66e4d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '699fe8f1-04f1-4ff8-a35a-83929c0eab35' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50991b95-1349-4d08-94a9-309bab66e4d3' 
go

-- $/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38238372-1859-4633-aa05-9b118c0a58d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39fd0cef-f4e9-43dc-ac1b-840be7ffc475' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38238372-1859-4633-aa05-9b118c0a58d1' 
go

-- $/Accounting/DefaultSystem/Reports/Account Statement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fc52c08-2243-4231-80de-84f3e9ba1dcc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Slideshow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '632088b1-2867-4466-8804-302302d6a768' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'efd83595-33d1-4bf4-b4c5-89547f15f61a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '632088b1-2867-4466-8804-302302d6a768' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Social Share
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '118836d3-6397-4455-b235-56f507a0f602' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d0560cf-f88c-480b-81df-8d7f52590007' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '118836d3-6397-4455-b235-56f507a0f602' 
go

-- $/Common/Communications/Templates/Samples/Event confirmations/Event Confirmation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63300372-f980-4c79-b9ef-9d55fbaaebf1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7428a195-d7b4-4fce-b8ec-8e92658da4f3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63300372-f980-4c79-b9ef-9d55fbaaebf1' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Payment Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72bd2016-7fbc-417d-8c82-ab1c116a08a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea453619-a3f4-437a-a541-90fbed21ed57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '72bd2016-7fbc-417d-8c82-ab1c116a08a1' 
go

-- $/Samples/Directory/PeopleSearch/By location
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cee5224f-be17-4c4a-88e8-62551d971ec7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7623ae33-f9ec-43ed-a98c-928b5bbc595a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cee5224f-be17-4c4a-88e8-62551d971ec7' 
go

-- $/Samples/Dashboards/Membership/Lapsed and Lapsing/Members lapsing soon
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e857ed33-1e4d-4ea1-a605-3946808b46fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5833600-b750-4868-8e08-939ffa467543' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e857ed33-1e4d-4ea1-a605-3946808b46fe' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Orders By Product Category This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5ce316a-548e-4f5b-ba86-1a45bb633968' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e537eec-14d5-434c-abbd-9485e781cf1c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd5ce316a-548e-4f5b-ba86-1a45bb633968' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Past events available for registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '070a7e53-39b4-4056-8827-be81da1f957b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4406a0a-fabd-45b3-bc69-965a7caa8cd9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '070a7e53-39b4-4056-8827-be81da1f957b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Open Invoice List Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c18757a-6ad0-40c1-9e8e-d9874df37f54' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7950703-08b7-4d77-b70e-96ad7200da00' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c18757a-6ad0-40c1-9e8e-d9874df37f54' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Address Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a752b3d-a5e0-4e7d-bb94-60b721690e04' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a4796aa-2cc3-42ec-8db0-9709c156505d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9a752b3d-a5e0-4e7d-bb94-60b721690e04' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Promotion Manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3df3e975-c09a-4751-b930-780bac618ddc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6c25305c-9cea-4a64-98b7-97415a683604' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3df3e975-c09a-4751-b930-780bac618ddc' 
go

-- $/Communications/DefaultSystem/Queries/Communication log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3df36b5b-9401-4e55-82ea-9a7a87b16d0f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12481266-b4a0-4fbe-a0d5-979792f48856' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3df36b5b-9401-4e55-82ea-9a7a87b16d0f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Common Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '608d2d75-3a24-4403-8e43-720fbbdfa2e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54ecd327-1bed-41e5-ad06-97acc2cab289' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '608d2d75-3a24-4403-8e43-720fbbdfa2e8' 
go

-- $/Samples/Dashboards/Community/Top committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac46f953-b322-49b3-98a1-7db9a475f5cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '132012f1-b372-473d-beea-9812a05a94f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac46f953-b322-49b3-98a1-7db9a475f5cc' 
go

-- $/Samples/ReportingServices/Full Roster
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff19c56c-3379-4aba-ba3c-40d57ca4fbdb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0468307-8320-44dc-8d1a-981414e3f26d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff19c56c-3379-4aba-ba3c-40d57ca4fbdb' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Quick Links
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b09585d-7a07-4169-9b62-90601a9272b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '933ee130-9ba1-4c30-ae30-9888dc552a43' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7b09585d-7a07-4169-9b62-90601a9272b0' 
go

-- $/Samples/Directory/PeopleSearch/Member directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30c3c3c8-4aec-4049-8083-c4f5a9bf47f5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fbd12cd-122e-47b2-b648-9a9ecb2cc7de' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '30c3c3c8-4aec-4049-8083-c4f5a9bf47f5' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Query Chart Viewer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd75d9871-5393-4d7e-94d0-8465b826931d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e60a6b5-6743-4533-b319-9aa0645c8af7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd75d9871-5393-4d7e-94d0-8465b826931d' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Item Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c8a29ea-097d-4ce9-82ba-16da1a9951e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '479bc416-2d4f-4956-8d77-9acaf9d3e9dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c8a29ea-097d-4ce9-82ba-16da1a9951e1' 
go

-- $/Samples/Dashboards/Membership/Newest Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2886a7c-0935-41f0-8ad8-9b5cd1d284f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Payment history for automatic renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2159787c-943a-427a-aa28-c2ca090d6fd0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e4d68d7-ea2c-404e-baa4-9c273f3929c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2159787c-943a-427a-aa28-c2ca090d6fd0' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By committee (active mbrs)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef01102b-6b89-4b6a-a1b8-27e05b0ea4d2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2361d181-d89b-4385-8fa0-9c4edf1ffa8e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef01102b-6b89-4b6a-a1b8-27e05b0ea4d2' 
go

-- $/Samples/Charts/Contacts by Last Updated
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6db5c080-622d-4ad0-8fd7-eb79bd0b4cfa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da6e735b-07b6-4110-9818-9dbc5677b2c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6db5c080-622d-4ad0-8fd7-eb79bd0b4cfa' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Recurring membership not attached to ACCRUAL based billing cycle
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de55cc18-cf0e-47af-9ca1-df2f2ed3a5c2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f79f8ef0-0327-4582-8f99-9f0d31c30c8d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de55cc18-cf0e-47af-9ca1-df2f2ed3a5c2' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Event Revenue This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '549629c1-0cac-4456-8048-6040f2376de4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '193c771a-5d79-48a5-bea3-9f265db490ac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '549629c1-0cac-4456-8048-6040f2376de4' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Giving History by Campaign
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7fcbc32-499b-4754-8a0c-512eb5e8a9a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a3158cc-860a-482f-b178-9f85fc2cf2fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e7fcbc32-499b-4754-8a0c-512eb5e8a9a1' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Find recurring donation invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ba797bc-0365-487b-a7e0-a1b306ead2f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
go

-- $/Samples/Dashboards/Community/Top orgs/By individual community subscriptions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d309e07-d141-44cd-ad6b-0a291668a789' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4e2ab739-3dcf-4267-83c3-a549d3f8c4fb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6d309e07-d141-44cd-ad6b-0a291668a789' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Data Showcase
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5d7b359-c503-409a-9abc-48fb19c2d186' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '951747c8-2ea4-4da2-976b-a6558b07154c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f5d7b359-c503-409a-9abc-48fb19c2d186' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By all criteria (multi select fields)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b5ad9603-ea5a-4bed-9a5c-2c6e3dc2902f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09a14822-a21c-4542-93a3-a7367fe1e9c3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b5ad9603-ea5a-4bed-9a5c-2c6e3dc2902f' 
go

-- $/Samples/Dashboards/Events/Specific Events/Reports/Templates/EventFormResponses.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4bb693c3-4488-4d71-bd2b-9d2a2e8cfa02' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '76a43649-dfde-4a73-939c-a839c86f32ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4bb693c3-4488-4d71-bd2b-9d2a2e8cfa02' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - Lapsed members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '307f6db1-ed51-44b1-bc91-01fd26f78c0d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ff76c20-64c8-42ab-8620-a8845704debd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '307f6db1-ed51-44b1-bc91-01fd26f78c0d' 
go

-- $/Samples/Dashboards/Advanced Email/Progress Tracker - Unique opens
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3828c57f-7d63-457f-9412-e4bb27174d18' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60692c86-4e28-42fa-9f4c-aa0d998a7064' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3828c57f-7d63-457f-9412-e4bb27174d18' 
go

-- $/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Activities/Organization and individuals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd87905bd-37d8-4760-a6ab-75d2183e4425' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5673275-4fee-4308-8da9-aa4c40115486' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd87905bd-37d8-4760-a6ab-75d2183e4425' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrations by Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08386531-77fb-4fc4-ad48-5db1320ac3da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79d4bd0d-5feb-4299-9f72-ab4694291c92' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '08386531-77fb-4fc4-ad48-5db1320ac3da' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/By all criteria (multi select fields)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b59eed3e-ce5f-42bd-a161-2f440f66382a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2ba8e4b-e667-4d6c-b5ba-ac4dc2d8918a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b59eed3e-ce5f-42bd-a161-2f440f66382a' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Mini Group List Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94dce367-2b6a-446c-ad27-c46c4a61ccad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eef91d9f-b1ff-46a3-b2d0-acd5b053ee9d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '94dce367-2b6a-446c-ad27-c46c4a61ccad' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Recurring Donation Commitments Public View
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '114d8bef-6ac5-490b-a74b-42b150f054c2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce0f6015-f1ad-45f3-b5d1-af139101bd05' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '114d8bef-6ac5-490b-a74b-42b150f054c2' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Cart Details Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b14a52b-1257-4bb2-bcb2-38430d706157' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e349de98-77b4-42c5-839d-b3aebab502a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b14a52b-1257-4bb2-bcb2-38430d706157' 
go

-- $/ContactManagement/DefaultSystem/Queries/FindContacts/Current Providers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27e6e54f-f66e-4399-b177-96ac3c23195e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4870b69c-943d-435e-9f06-b4a70abc6ff0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '27e6e54f-f66e-4399-b177-96ac3c23195e' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/People search public
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3467e3bf-71c2-4307-ade8-c4bf13acdde5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2e0435d-5544-4cdd-b624-b5887fa3e7b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3467e3bf-71c2-4307-ade8-c4bf13acdde5' 
go

-- $/Samples/Dashboards/Community/Members by committee
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d3901ea-ae26-4680-9969-99e7eb5ac4df' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c80fb4af-6972-4948-bb8c-b6661d212211' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0d3901ea-ae26-4680-9969-99e7eb5ac4df' 
go

-- $/Samples/Directory/PeopleSearch/By all common criteria
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2579cf33-2f28-466b-9dfe-4c4adeccb267' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f8e06c5-b226-4eeb-9c28-b6810589adff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2579cf33-2f28-466b-9dfe-4c4adeccb267' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Active members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c659202-0ad7-4b56-9cdf-e04a2f733dc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5209caf-8415-435c-a858-b6c3a6520524' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c659202-0ad7-4b56-9cdf-e04a2f733dc8' 
go

-- $/Samples/Dashboards/Events/Specific Events/Program Item Reg by Track
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6091cc2-d123-4a09-931d-2fc43d7eec17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad73b3c8-5893-467a-934b-b6e7ddb8b6ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f6091cc2-d123-4a09-931d-2fc43d7eec17' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Communication Preferences Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf7e7714-6b8b-4743-8da6-6aa5fdc63816' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59ec4034-d9dd-4061-8403-b6f97e409e96' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cf7e7714-6b8b-4743-8da6-6aa5fdc63816' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Advanced Accounting Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9ed3cdb-69ba-4e17-aed5-2c4bb2f4c391' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ff74f3a-ab66-4629-9e30-b9e4302a63b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd9ed3cdb-69ba-4e17-aed5-2c4bb2f4c391' 
go

-- $/Samples/Directory/PeopleSearch/By name
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '943088f0-3b27-4b7f-aef5-28bd87bd6b56' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd3eb7ee6-dbc4-4a44-89aa-babd5e7670dc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '943088f0-3b27-4b7f-aef5-28bd87bd6b56' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Social Profile List Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a52298a-1783-4a30-acba-92036ede500d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e36c2c3-fed9-41b8-b3d9-bad64d9acea2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7a52298a-1783-4a30-acba-92036ede500d' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Search members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4fbd35cf-2ee5-4172-be0f-823c824fa999' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7a91e3f-4180-43c8-904e-bb356ee5365e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4fbd35cf-2ee5-4172-be0f-823c824fa999' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Transcript Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '793ca15e-dcf1-4ad8-b48b-093441d7be4d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7b203fa-6125-4651-b96c-bb762b09e821' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '793ca15e-dcf1-4ad8-b48b-093441d7be4d' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Recurring Donation Commitments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a4633d3c-f993-4213-b098-17eeb0153f8f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6ff24a1-441d-4365-8f7f-bb795b25bdbc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a4633d3c-f993-4213-b098-17eeb0153f8f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Continue Shopping Button Link
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd869ca3d-7210-4728-b85a-277c2751fb8a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd49a94f2-f40d-4683-8d49-bb98189f9f53' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd869ca3d-7210-4728-b85a-277c2751fb8a' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrants/Active registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e78e9c3-2008-4e2e-bd8e-bc1360c5e0f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Shipping Method Selector
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7fafd350-7acc-4f83-8ed7-d94b978d56aa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bca03cc6-9121-4bd5-8b6c-bd68a369c16b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7fafd350-7acc-4f83-8ed7-d94b978d56aa' 
go

-- $/Samples/Dashboards/Fundraising/Distribution Activity This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b340afd6-d153-497f-a2b0-2723caaf2959' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7ac8faf-3042-4c4e-aadf-be1cdb61d61c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b340afd6-d153-497f-a2b0-2723caaf2959' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7734a2dc-cdb8-4a20-9584-ef8daf9f9dd6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea4c64b6-baf4-45c8-9eca-bf19e360cf33' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7734a2dc-cdb8-4a20-9584-ef8daf9f9dd6' 
go

-- $/Samples/Directory/PeopleSearch/By all criteria (multi select fields)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9817e0b-2cd5-4812-aa80-f97e27f319d7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68c112de-b934-4a61-b72a-c0268cebaa52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e9817e0b-2cd5-4812-aa80-f97e27f319d7' 
go

-- $/Accounting/DefaultSystem/BatchReports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b14eb02b-7001-4cb1-8c50-8a78648b0942' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13e5a554-194e-4b2c-9d8a-c18fb20c9b62' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b14eb02b-7001-4cb1-8c50-8a78648b0942' 
go

-- $/Samples/Dashboards/Community/Top orgs/By individual committee memberships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e64a712-63ff-4b4c-af4d-0d70f781a2b1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54b7f153-7a40-40ca-b281-c1e0e404b4b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e64a712-63ff-4b4c-af4d-0d70f781a2b1' 
go

-- $/Common/Queries/Commerce/Billing/WebRenewableBillingCycles
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b72bc7f6-01e1-433a-ac2c-fcaa108728ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '65061af9-5d41-4e5b-b70a-c260d900167f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b72bc7f6-01e1-433a-ac2c-fcaa108728ec' 
go

-- $/Samples/ReportingServices/Label Sample Query
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6925b3c5-f846-4565-be89-c6b4e025378b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fea09a34-9002-422e-8a3a-c31102694366' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6925b3c5-f846-4565-be89-c6b4e025378b' 
go

-- $/Samples/Dashboards/Community/Data integrity/Individuals missing primary email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc5c982a-7195-439a-be4a-b3e0a7cad428' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3f146bd-a4d5-4505-b897-c41e9b772db0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fc5c982a-7195-439a-be4a-b3e0a7cad428' 
go

-- $/EventManagement/DefaultSystem/Reports/EventRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '324a8d73-3cb2-41d0-9a30-c60bb04ac117' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
go

-- $/Samples/Dashboards/Membership/Members by chapter
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b432c2e-ad43-490d-81f5-a0505488645a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b456704b-8ab8-4e64-ab1d-c76f31107d12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b432c2e-ad43-490d-81f5-a0505488645a' 
go

-- $/Samples/Dashboards/Events/Top attendees/Organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd82fcdb7-d732-4680-89f6-6bda3bdc3497' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03731327-8d13-4bc2-ab9d-c7ce3116e4c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd82fcdb7-d732-4680-89f6-6bda3bdc3497' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Alert Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d27abc8-cab8-46db-891c-2b6abe7b2327' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bbeeaeda-e532-45ba-94f2-c8fdcf377fc9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d27abc8-cab8-46db-891c-2b6abe7b2327' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88c01b72-b315-42f9-aca4-a1538f1dacb4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6f4a7a7-c4b9-428e-a505-c91f20ebda59' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '88c01b72-b315-42f9-aca4-a1538f1dacb4' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Links clicked
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b47ef5a4-899f-43bc-8208-975540236a2a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88a4f8fd-e6de-46d9-b4b8-ca1f73c2704c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b47ef5a4-899f-43bc-8208-975540236a2a' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Template Manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'adcf877e-d9b7-4549-96ab-791f4726fa62' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f235bb80-b9ae-469e-80d0-cd2102f6f1a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'adcf877e-d9b7-4549-96ab-791f4726fa62' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Promotion Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a7b9aed-ced9-4e45-8abb-a28ef9ca6ff3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '021d8857-7e0b-466e-82f6-cf78d1e325ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5a7b9aed-ced9-4e45-8abb-a28ef9ca6ff3' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Address Mapper
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a808cf97-dbaa-43a0-b336-7939e435c36e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71b37758-0d9f-4ac4-9229-d08b607c7c41' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a808cf97-dbaa-43a0-b336-7939e435c36e' 
go

-- $/Samples/Dashboards/Fundraising/Top donors/By donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '717f70f1-d1c7-469b-a159-d0b0df4ff112' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Invoices/Past due
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '720945d7-43ae-43f0-aab5-c318f811eeb8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05929ffe-d95a-48ba-b81c-d1f4392c8688' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '720945d7-43ae-43f0-aab5-c318f811eeb8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Friendraising Importer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4434d423-2a43-49a2-9ff2-cb4627fe06ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd9b1e64-b115-4d72-b8fe-d3bf8a1f4463' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4434d423-2a43-49a2-9ff2-cb4627fe06ec' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Account Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '122c9ed1-b438-4bd6-83a5-9a0a60176359' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '537dc40a-8b73-4d5d-bcf2-d41a87119c3e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '122c9ed1-b438-4bd6-83a5-9a0a60176359' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Program Item Registrations This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9aceb8d4-453e-4431-97cc-46dbdb9b7a50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab951a1a-c3b0-4467-94be-d4a47565c4e2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9aceb8d4-453e-4431-97cc-46dbdb9b7a50' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/OrganizationSearch/Organization search public
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ec915b8-a184-4400-9eca-1e4f70134e06' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c59fc55-4dc0-42c9-ac87-d4b2ddcefdff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ec915b8-a184-4400-9eca-1e4f70134e06' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Opened
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2168ad6-0e41-4710-89e3-ec776910215d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '422f8cde-5128-4830-aae0-d590c7ce09d6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a2168ad6-0e41-4710-89e3-ec776910215d' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Embedded Web Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91b8329e-3428-4a38-a8b4-e49b75a2a055' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b54b3133-6b53-4296-b20e-d60d302c109c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '91b8329e-3428-4a38-a8b4-e49b75a2a055' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/File Importer For Web Services
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d9c161f-6510-4c6d-b18a-5e1bbbf4adec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b06826e2-4f02-4d9a-8893-d67a45c8a210' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9d9c161f-6510-4c6d-b18a-5e1bbbf4adec' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Total delivered
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '199a560f-ae8e-4857-88bf-377002b86c7b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71438c6e-77ab-48e9-b5c6-d728de58b3b0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '199a560f-ae8e-4857-88bf-377002b86c7b' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By location
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb593e7e-29c0-4fb7-9515-5405880246c3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa5cd297-0426-4ec2-8997-d74fa586c9a3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb593e7e-29c0-4fb7-9515-5405880246c3' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/By all criteria
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b511bcf8-fbf9-4659-b888-f297be3fee0c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e45f482-9a3c-4712-930c-d8651423c2dc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b511bcf8-fbf9-4659-b888-f297be3fee0c' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Groups/Group List Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dec35d26-5dd6-4da8-aee6-0521c1bdf9c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '567bbe46-f52d-4faa-87ca-d8e4712cd302' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dec35d26-5dd6-4da8-aee6-0521c1bdf9c8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Gift Aid Tax Reclaim
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ec930ef-7b14-49b7-96f6-458d90ff1a7c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f0eee5a-46f6-40b7-895c-d966de46b512' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ec930ef-7b14-49b7-96f6-458d90ff1a7c' 
go

-- $/EventManagement/DefaultSystem/Reports/ProgramItemRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88178d86-aec0-4859-9793-d9819e65f4ac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Related Items
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19f3baac-d002-41ea-b218-f33703f619e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '488c837e-7f63-4029-b205-d9c8dc145b9c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '19f3baac-d002-41ea-b218-f33703f619e1' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/All products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc87a3bc-b940-4669-8a94-fe5b0a3ad450' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0de693e2-c37d-4796-8d2e-da0f3f53d8d3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc87a3bc-b940-4669-8a94-fe5b0a3ad450' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/NRDS Sync By ID
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c09a2863-06ef-45c4-bb0f-56b0888c90f9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54f86216-664f-41a0-94d5-da7f595610a3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c09a2863-06ef-45c4-bb0f-56b0888c90f9' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Open orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '210733e3-4b23-49f2-b12e-c57112c0b4a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bd8a0b90-88ff-48d8-ab5e-da9af6131d3d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '210733e3-4b23-49f2-b12e-c57112c0b4a1' 
go

-- $/Samples/Dashboards/Advanced Email/Progress Tracker - Total delivered
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '726ffb85-2116-4790-8b97-889a6afb7c93' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '56e160ff-62b0-43fb-a626-daebbc6917b2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '726ffb85-2116-4790-8b97-889a6afb7c93' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Tasks Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '702cf931-4c1c-4a74-8532-d9ec2a4e8d21' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '57eb3b58-abb8-4314-9e2b-dc7c1c6b7666' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '702cf931-4c1c-4a74-8532-d9ec2a4e8d21' 
go

-- $/Samples/Dashboards/Community/Progress Tracker - Recent posts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a6454f5-00ec-47f5-bee3-a3e4637544a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33328390-50df-4cc8-a198-dd6049ca5c2b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8a6454f5-00ec-47f5-bee3-a3e4637544a7' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Product Display List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e109ed88-0e77-4f6f-994e-b3a847cc6e99' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ecd9a9f8-fb2e-46d0-8f8c-dec17ed19e75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e109ed88-0e77-4f6f-994e-b3a847cc6e99' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Automatic payment enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '777a1c59-4980-41af-8979-d73e55c1419b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31989995-9787-40fd-b016-e0d6a2f3dfae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '777a1c59-4980-41af-8979-d73e55c1419b' 
go

-- $/Samples/Dashboards/Events/Data Integrity/Future events not available for registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00b35b97-17fc-4442-93bc-8d7f188991b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82138f4d-dc1b-4651-a079-e0fcd4de358e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '00b35b97-17fc-4442-93bc-8d7f188991b2' 
go

-- $/ContactManagement/DefaultSystem/Queries/SelectedContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'add101f3-2e5b-449a-b1ce-a23ceb79a461' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '668680b9-f8e0-447d-b8dc-e1905bf2d1c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'add101f3-2e5b-449a-b1ce-a23ceb79a461' 
go

-- $/Samples/ReportingServices/Member Index Sample Query
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74af097b-4a6c-48b7-b709-0941df7af979' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8def03a-fd91-4451-a987-e1920d3ae980' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '74af097b-4a6c-48b7-b709-0941df7af979' 
go

-- $/Samples/Directory/Members only directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ef95f3c-a932-47d0-826e-0f6b459bf953' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f3f21b0-863b-44d2-92b0-e1fb375b2184' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1ef95f3c-a932-47d0-826e-0f6b459bf953' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Top customers/By organization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c09a55d5-6a8c-4bc7-80df-d22c8197d168' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '371026e5-df1a-4c91-bc07-e209e1611956' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c09a55d5-6a8c-4bc7-80df-d22c8197d168' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Dynamic Content Collection Organizer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abf56a5e-97e1-4bba-a4ed-e2eb28d355a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
go

-- $/Samples/Dashboards/Events/Top Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b058c6e-39fd-4df1-a6be-ae4fcfaefaf7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '247c1dfc-89bc-4d1e-b3aa-e3f3eb75e754' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b058c6e-39fd-4df1-a6be-ae4fcfaefaf7' 
go

-- $/Samples/Security/UserAccess/Contacts available to members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e0409ee-1c29-4e1a-860a-5a7041bc5179' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a0b5930-205a-421a-81f8-e4dd8cf419ad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e0409ee-1c29-4e1a-860a-5a7041bc5179' 
go

-- $/Samples/Security/UserAccess/All Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '953dbf76-62e3-4ee8-911a-683118a9afe3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c26df304-0f6c-4dc5-87c2-e50db8ce3061' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '953dbf76-62e3-4ee8-911a-683118a9afe3' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Email Provider Configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e57daedb-589d-450c-9d10-e52e31b557b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
go

-- $/Samples/Dashboards/Advanced Email/Chart - Delivered by month
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '145895ba-528b-471e-b6d3-0a6ab0c45466' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '728dad28-625a-4250-8b4b-e58399f89c06' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '145895ba-528b-471e-b6d3-0a6ab0c45466' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Panel Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84aaf3f6-b7b1-4451-88ec-cd4bd01dbda5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f848985d-83b7-4de2-a36e-e62ae545f4d9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84aaf3f6-b7b1-4451-88ec-cd4bd01dbda5' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Alert Set Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cdf4e491-03a2-45d9-bbc7-0a444119c951' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08414cdf-cc40-4402-a669-e6aac53ef3e7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cdf4e491-03a2-45d9-bbc7-0a444119c951' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Status Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4795e06f-33b3-451d-9130-9d31ab13d4ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f932ba4-584a-4ea5-862e-e6baf60771e5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4795e06f-33b3-451d-9130-9d31ab13d4ad' 
go

-- $/Samples/Dashboards/Community/Data integrity/Individuals with no link to company
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '583e3f11-66ef-4d19-94a8-29a2ca54b113' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de220b27-9eda-4faf-8aa4-e839799ea5ce' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '583e3f11-66ef-4d19-94a8-29a2ca54b113' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent gifts over 500.00
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87f8738c-d872-4df1-89c1-28a48990821c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7ec7a94-68a4-4299-b241-ea8e881fd2c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87f8738c-d872-4df1-89c1-28a48990821c' 
go

-- $/Samples/Dashboards/Community/Top participants/By committee memberships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e641f31-c9e8-4e7b-bc3b-783641a18864' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4ce78602-3240-42e0-a48a-ec9634734a5a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e641f31-c9e8-4e7b-bc3b-783641a18864' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Address Selector
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '487cf02e-f3b5-4ad3-a377-229d0e867987' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd54c01f8-4eac-4a41-be8d-ecfa35e2718f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '487cf02e-f3b5-4ad3-a377-229d0e867987' 
go

-- $/Common/Communications/Queries/Event registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e0a015f-5120-40cb-a0d5-01560ff84448' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db1c16a1-d5e1-4aea-8df7-ed24f9046be8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7e0a015f-5120-40cb-a0d5-01560ff84448' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By name
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '502a621a-6e0b-46c0-aebd-b0492ece4b17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c57264d4-cfaf-4e32-a18c-ef0b96949289' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '502a621a-6e0b-46c0-aebd-b0492ece4b17' 
go

-- $/Samples/Dashboards/Events/Top attendees/Individuals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09134ae8-0c01-4d34-be45-669a806b6ec1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24c7bbb1-8f98-41e5-b457-ef111d4a06b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09134ae8-0c01-4d34-be45-669a806b6ec1' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Recent History
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1916da8-918b-40df-babd-9437c2293477' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1d11390-555b-449d-902d-ef3433bd8a44' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c1916da8-918b-40df-babd-9437c2293477' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Processed automatic payments for renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3715bc18-c0bd-443b-9d4a-5f628fc61490' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cca9ddf9-bfef-43c0-9ce7-f1965a8cd654' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3715bc18-c0bd-443b-9d4a-5f628fc61490' 
go

-- $/Common/Communications/Templates/Samples/DonationThankYouTemplate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7cf3b8bf-c1a6-46ed-9e29-504eb6ced36c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c866e389-3abd-45f6-9545-f1a9024b91c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7cf3b8bf-c1a6-46ed-9e29-504eb6ced36c' 
go

-- $/Samples/Dashboards/Membership/New members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fcfb8fa6-8215-430b-8047-001dd39c263d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f52c1fad-fb41-41f8-baa8-f203863ff070' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fcfb8fa6-8215-430b-8047-001dd39c263d' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Query Menu
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8791ebd0-a398-400d-acd6-c79de8954c29' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c9e5a7e-b0f4-4604-891c-f27c5fcc06ae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8791ebd0-a398-400d-acd6-c79de8954c29' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Event Calendar
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11734d53-e5a3-4016-bed0-def274ff7ce7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '985a3488-2920-42ff-aef2-f29b1a0420ee' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11734d53-e5a3-4016-bed0-def274ff7ce7' 
go

-- $/Samples/Communication Preferences/Communication Preferences Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6887c5f-45fa-4553-9186-ae713f067d55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a968b394-73c6-48b9-93ea-f4216e8237c7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f6887c5f-45fa-4553-9186-ae713f067d55' 
go

-- $/Samples/ReportingServices/Simple Roster
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1e8c5d4-85db-481a-9c35-950886cf1df1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f4f22f62-4acb-4aaf-ba37-f4316b57a79f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a1e8c5d4-85db-481a-9c35-950886cf1df1' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/NRDS Sync Buttons
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ecf2ebc-9cc4-4732-ba9d-4a7a293c8fef' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a4803f94-90f4-477c-be3b-f4a3ca4d05fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ecf2ebc-9cc4-4732-ba9d-4a7a293c8fef' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Potential Duplicate List Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28d4ef46-c007-47d1-b0cf-09d195281117' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10b7a9a6-c93c-4af0-bc9b-f562031473fa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28d4ef46-c007-47d1-b0cf-09d195281117' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Contact Mini Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '665b3307-7f50-40e9-bc23-87a421970a84' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a81a2f29-ef46-403b-a254-f58ed15f9f5d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '665b3307-7f50-40e9-bc23-87a421970a84' 
go

-- $/Samples/Dashboards/Membership/Top Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'afa6c669-e5a3-4538-afe6-4968b7ed1fe4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '625f39bb-1fa9-4dee-80d2-f5d21f7d5d0a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'afa6c669-e5a3-4538-afe6-4968b7ed1fe4' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Invoice Payment Link
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c328f372-4cc2-400c-85c9-48c15a2aa1a6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2145ce69-c64f-4e8c-96fe-f5dbf3a8b648' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c328f372-4cc2-400c-85c9-48c15a2aa1a6' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Panel Collection Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4b2cdf5-1953-4347-a49b-46c4a8dedcd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5374efe9-c412-4a9f-b6e4-f636656b0ce5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd4b2cdf5-1953-4347-a49b-46c4a8dedcd1' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Find renewal invoices due for automatic payment
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf7134a4-f90c-43ba-94ec-3b0b066b9384' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '675837bd-db20-4458-870c-f67dd0d5e7d6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bf7134a4-f90c-43ba-94ec-3b0b066b9384' 
go

-- $/Samples/ReportingServices/Activity List Sample
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60e15c8b-06d4-4a86-970b-34dc30b8e383' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16a8b7b5-2497-4c0d-ad8d-f799b55e6612' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '60e15c8b-06d4-4a86-970b-34dc30b8e383' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Orders by Member Type This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aa9b8360-3743-4757-99a4-7b91de1f0f5c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '026ef6f9-b799-4cf7-b831-f8b83d95c113' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aa9b8360-3743-4757-99a4-7b91de1f0f5c' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Authorization Providers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2ae0415-734c-4f03-abc7-87ea21a50ace' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '069cc312-e54a-4080-a2d3-f8f65f038af2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e2ae0415-734c-4f03-abc7-87ea21a50ace' 
go

-- $/Samples/Dashboards/Events/Total Event Registrations by Member Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72fba2ff-354e-43ab-a18b-dc5f028b5606' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2c961ac-a6bf-427b-880e-f9940e9aeec2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '72fba2ff-354e-43ab-a18b-dc5f028b5606' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent gifts by my major donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2428da04-e9c1-43ee-a0f4-164a4256c4ca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '138972c6-e8c8-4db6-bac1-fbe8fdd64a90' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2428da04-e9c1-43ee-a0f4-164a4256c4ca' 
go

-- $/Samples/Directory/PeopleSearch/By type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac2d86de-ff2c-4b9d-a0b8-b321232b5a26' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43bfd2eb-0b4d-4f63-928e-fce441aa2ab1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac2d86de-ff2c-4b9d-a0b8-b321232b5a26' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Item Sales This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8520ea35-6da4-49d1-bd22-52556228b8df' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9733fc97-2d8e-45f3-b6e2-fda851292f18' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8520ea35-6da4-49d1-bd22-52556228b8df' 
go

-- $/Samples/Dashboards/Events/Event Details - Recent and Upcoming
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11cff5f4-209a-459f-a961-f12669785553' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f9b3ca5-6348-4c3d-8ac9-fe23df3ff8df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11cff5f4-209a-459f-a961-f12669785553' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - New members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fc99ff7-ddcb-48fb-9e30-d61b04928019' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59aa2a46-1882-4ef7-a01c-fea8950e1680' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0fc99ff7-ddcb-48fb-9e30-d61b04928019' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Scheduled Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d040899-4096-4c5b-a8f9-407db7fd3947' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75a34d3c-172c-4580-9f25-ffbe27541ad4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6d040899-4096-4c5b-a8f9-407db7fd3947' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Communication Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88feb418-f6b3-415f-b7e8-88fb1722ee1f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78d3ba09-38ba-489a-877e-ffd4641eb279' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '88feb418-f6b3-415f-b7e8-88fb1722ee1f' 
go

