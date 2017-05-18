-- $/Accounting/DefaultSystem/BatchReports/Batch Transaction Details.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4eaded89-6e8e-4e61-8b06-0203261dbc10' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ad7cba0-fae9-417a-979f-c3dcb27667c0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4eaded89-6e8e-4e61-8b06-0203261dbc10' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Search/Open batches
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd18abd2-74ae-49ab-9350-034e0aec7d6d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '819dcd95-fb37-494c-8f9f-974c3cda9f5d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dd18abd2-74ae-49ab-9350-034e0aec7d6d' 
go

-- $/Common/Queries/Value Lists/CommunicationMessageTypeRefList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e9b859c-7f24-4f10-9abf-03951e86f20b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd025548-192d-40ea-9abd-a6dc3bc59970' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7e9b859c-7f24-4f10-9abf-03951e86f20b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Alert Set Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cdf4e491-03a2-45d9-bbc7-0a444119c951' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08414cdf-cc40-4402-a669-e6aac53ef3e7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cdf4e491-03a2-45d9-bbc7-0a444119c951' 
go

-- $/Common/Tasks/Queries/Donations received today
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '94dd4a83-ddca-4b26-86ce-11d653d11687' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7dc98da-d0f3-46c2-aaea-8d372b09d536' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '94dd4a83-ddca-4b26-86ce-11d653d11687' 
go

-- $/Samples/Communication/ExecutiveDirector
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5b86855-130c-4c65-b9a0-16db885848c2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e724756-d9a9-49ee-99f1-44a35664b5b1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5b86855-130c-4c65-b9a0-16db885848c2' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Find Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1055a8e3-4c01-4888-a82f-173c2e9731b8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb9b9276-2344-4edd-bf7a-d2b1565b86a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1055a8e3-4c01-4888-a82f-173c2e9731b8' 
go

-- $/EventManagement/DefaultSystem/Reports/ProgramItemRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88178d86-aec0-4859-9793-d9819e65f4ac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Group Members/Future Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f061922c-b685-4c4b-a75e-1d7f3a9355cb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6c8aad4c-93c4-4a9d-ae8b-fd188e9703c5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f061922c-b685-4c4b-a75e-1d7f3a9355cb' 
go

-- $/Common/Queries/Utility/LogonInfo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b4edaf3-8e07-47e4-b7e1-1e6fb04a06b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1bf77784-cc33-4aa6-b383-b1c45822ef02' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b4edaf3-8e07-47e4-b7e1-1e6fb04a06b0' 
go

-- $/Accounting/DefaultSystem/BatchReports/Batch Transaction Summary.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80fec0b2-ba11-432f-89b8-1f477b7a5247' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ebf1702-68d9-4754-ba4f-e9ba7d749173' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80fec0b2-ba11-432f-89b8-1f477b7a5247' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab999598-908c-4f7b-af55-22989b962243' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab3d26f5-ae4d-4b09-ba49-014d577de0e9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ab999598-908c-4f7b-af55-22989b962243' 
go

-- $/Common/Tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b7625d7-3b87-4c35-b123-24fccd4adf6b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '67cc3fbe-52dc-4301-a545-09c0b221fa7d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b7625d7-3b87-4c35-b123-24fccd4adf6b' 
go

-- $/Samples/Charts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b832bc5-5c25-45e0-b92f-26215169fcc1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '487f40da-840d-4261-b61f-96d6352c7fa0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b832bc5-5c25-45e0-b92f-26215169fcc1' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Details/Batch detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0590c871-ac4b-4075-8040-27dab6b62e76' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39c51bb4-4fee-49df-83dd-db314bf99e95' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0590c871-ac4b-4075-8040-27dab6b62e76' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Alert Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d27abc8-cab8-46db-891c-2b6abe7b2327' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bbeeaeda-e532-45ba-94f2-c8fdcf377fc9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d27abc8-cab8-46db-891c-2b6abe7b2327' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Info
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '215d7a97-60f3-4801-abc2-30c2791e72fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce2bfc39-7238-4e4d-a768-977a1229dd7d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '215d7a97-60f3-4801-abc2-30c2791e72fb' 
go

-- $/Common/Communications/Templates/Samples
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c3478431-aa08-43c2-b674-34714971bba5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '584252e3-bb1c-4ec0-bfd0-93a038465056' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c3478431-aa08-43c2-b674-34714971bba5' 
go

-- $/Samples/Charts/Donation Type by Date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8382bc8-f84d-48c4-8e72-3bba6353a1e0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f97082c-356a-4ae4-9e68-7da617eaffa0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8382bc8-f84d-48c4-8e72-3bba6353a1e0' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '789691d4-f1af-44ac-b44b-3fa555e18cb7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e08bc02f-3092-4eed-9945-d67468e754f9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '789691d4-f1af-44ac-b44b-3fa555e18cb7' 
go

-- $/ContactManagement/DefaultSystem/Reports/2 Up Labels A4.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81de0c98-5aa7-4bfa-833a-4121c7c413d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f7788be-bf2c-4f90-9329-323d88eb6799' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81de0c98-5aa7-4bfa-833a-4121c7c413d1' 
go

-- $/EventManagement/DefaultSystem/Queries/Advanced/Event/Previously Registered Event Guests
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5ecbbfe-0fbf-491a-b1b7-45e19c2a288f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d909307-03a9-4e30-8d7c-4fd787adbdb7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f5ecbbfe-0fbf-491a-b1b7-45e19c2a288f' 
go

-- $/Common/Communications/Templates/Samples/Event Reminder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f7a9c6d-d1d3-4722-b2ac-487998ccb819' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72d04e48-ed29-4b86-af83-5fcb70b869f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4f7a9c6d-d1d3-4722-b2ac-487998ccb819' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Future members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '240520e3-3e51-4a3f-b036-4b56466eea32' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0cabe38d-373f-49e6-957b-16f9851271ba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '240520e3-3e51-4a3f-b036-4b56466eea32' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Group Members/Past Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '809d55a7-e244-4f58-a248-4c4715335713' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed52b01b-aa46-4a5f-a7a7-aa0ca2ee5716' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '809d55a7-e244-4f58-a248-4c4715335713' 
go

-- $/Common/Tasks/Queries/New members in the last 7 days
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16f69bbd-3f6e-4023-8999-51c339a45711' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b15e98f4-d104-4b7b-8f6b-74b81dc6284e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '16f69bbd-3f6e-4023-8999-51c339a45711' 
go

-- $/Common/Communications/Templates/Samples/New Member Welcome Email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b0791cb-b4b9-4a33-b04d-55e98f2d3f25' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e31a50a7-7e40-463c-97ed-2f9de4856aab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b0791cb-b4b9-4a33-b04d-55e98f2d3f25' 
go

-- $/Accounting/DefaultSystem/BatchReports/Batch Transaction Details by Payment Method.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '028745fc-bca5-4396-a10b-570c1b905fb3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b071ab24-dd41-4704-ac6f-ac84338a4a45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '028745fc-bca5-4396-a10b-570c1b905fb3' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Duplicate Merge
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45679abb-c260-4f6e-a08e-5775eef6ed33' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf74eb32-ad8a-4bfd-ba2f-369e39d5b18c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '45679abb-c260-4f6e-a08e-5775eef6ed33' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '329b1d07-ca9f-4219-a6e7-685fc7ef2aaa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '926a2b3f-7af7-4893-b06b-526d31e871a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '329b1d07-ca9f-4219-a6e7-685fc7ef2aaa' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Contact/Communication Preferences Editor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf7e7714-6b8b-4743-8da6-6aa5fdc63816' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59ec4034-d9dd-4061-8403-b6f97e409e96' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cf7e7714-6b8b-4743-8da6-6aa5fdc63816' 
go

-- $/Common/Communications/Templates/Samples/Event Thank You
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fca647f-a5a0-48a0-b8a2-7288788b7665' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c80a3f9-3673-4f29-9a92-516405aace4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3fca647f-a5a0-48a0-b8a2-7288788b7665' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Past members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7afddc7-4a6f-4d56-9af0-72d5e2e1ba0b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b67291cb-5050-4335-b899-130133682351' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7afddc7-4a6f-4d56-9af0-72d5e2e1ba0b' 
go

-- $/Common/Tasks/Queries/Upcoming event registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52c8a28c-fd7f-4847-8db9-7a74c8a7cba0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3073b96e-2fdd-4957-b0b7-69d189929386' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '52c8a28c-fd7f-4847-8db9-7a74c8a7cba0' 
go

-- $/Samples/Charts/Active Contacts by Customer Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcc8f40f-547b-4cf4-b6f3-7d0258e5f272' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5215ce12-44cc-49f8-a3ea-532b8fca2ef7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bcc8f40f-547b-4cf4-b6f3-7d0258e5f272' 
go

-- $/Common/Communications/Queries
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a756d02f-4243-495b-8a4c-7d31780fbba3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d6903da-73e7-49e3-a808-879a9965a4e6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a756d02f-4243-495b-8a4c-7d31780fbba3' 
go

-- $/Common/Communications/Templates/Samples/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9cc7a37-18da-4e45-96c4-7f09c0231dfd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97815d17-bf57-44e5-bf0f-7e3744608213' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e9cc7a37-18da-4e45-96c4-7f09c0231dfd' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Search members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4fbd35cf-2ee5-4172-be0f-823c824fa999' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7a91e3f-4180-43c8-904e-bb356ee5365e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4fbd35cf-2ee5-4172-be0f-823c824fa999' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Find Committees/Committees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dff33218-a22d-4653-8344-85301e8e3982' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a3283e4-4a23-46c3-93d9-40451b8b8651' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dff33218-a22d-4653-8344-85301e8e3982' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Authorization Providers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2ae0415-734c-4f03-abc7-87ea21a50ace' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '069cc312-e54a-4080-a2d3-f8f65f038af2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e2ae0415-734c-4f03-abc7-87ea21a50ace' 
go

-- $/Common/Tasks/Queries
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '592af7d2-350d-4b44-b08b-8962f9d26682' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eaeab64d-0c94-4fb7-892f-cbef8ecb6175' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '592af7d2-350d-4b44-b08b-8962f9d26682' 
go

-- $/Accounting/DefaultSystem/BatchReports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b14eb02b-7001-4cb1-8c50-8a78648b0942' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13e5a554-194e-4b2c-9d8a-c18fb20c9b62' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b14eb02b-7001-4cb1-8c50-8a78648b0942' 
go

-- $/Accounting/DefaultSystem/Reports/ARStatement.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fc52c08-2243-4231-80de-84f3e9ba1dcc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Group Members/Active Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4733d52-1ffc-4bb8-a7ce-91707b561be8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c83e149-cbe2-4cb9-bffe-95ce703a370c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd4733d52-1ffc-4bb8-a7ce-91707b561be8' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Details/Batch detail search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f8b493eb-e7de-40fa-b632-941d343403fd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7eed33a6-3371-4983-a0f6-ba9b8253469d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f8b493eb-e7de-40fa-b632-941d343403fd' 
go

-- $/Samples/Communication Preferences
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8fede6e1-4526-4a04-81d2-961fb6c254b6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dfc6961a-672b-4e70-8acb-449c1194da2d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8fede6e1-4526-4a04-81d2-961fb6c254b6' 
go

-- $/Common/Communications/Templates/Samples/New Member Offers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8064f6db-5778-4957-8681-9a0f10c450a3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '389cd4af-00c8-4cdf-b89f-817f2255ff92' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8064f6db-5778-4957-8681-9a0f10c450a3' 
go

-- $/Common/Communications/Templates/Samples/Annual Conference Invitation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a44ad14-8fb3-4b29-a8e8-9b553b22bb39' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '989df30b-8be7-4eb7-8b59-26e18ef21e2d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1a44ad14-8fb3-4b29-a8e8-9b553b22bb39' 
go

-- $/Samples/Charts/Engagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6f782af-df1b-4ef4-aabf-9d6a30cd4d2a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6018a336-c9bb-4904-aa25-eb16b1ab101c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e6f782af-df1b-4ef4-aabf-9d6a30cd4d2a' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88c01b72-b315-42f9-aca4-a1538f1dacb4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6f4a7a7-c4b9-428e-a505-c91f20ebda59' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '88c01b72-b315-42f9-aca4-a1538f1dacb4' 
go

-- $/Common/Tasks/Queries/Contacts with no primary email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7d5a15ab-577e-4c06-88c8-a59d4f85bb85' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '734e7c88-f276-4a9d-b428-e82ee2249111' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7d5a15ab-577e-4c06-88c8-a59d4f85bb85' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Chapters/Find Chapters
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40e0c641-efc2-40f4-a84a-a86bd08bcdb9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8d84cd5b-0018-45f4-b689-83c07322e579' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '40e0c641-efc2-40f4-a84a-a86bd08bcdb9' 
go

-- $/Common/Communications/Templates/Samples/Order Confirmation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f0a9c61-264a-47d1-b3eb-ac54142314e9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cdd6ba76-bbd2-40ae-99c3-d8a817e3e014' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8f0a9c61-264a-47d1-b3eb-ac54142314e9' 
go

-- $/Samples/Communication Preferences/Communication Preferences Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6887c5f-45fa-4553-9186-ae713f067d55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a968b394-73c6-48b9-93ea-f4216e8237c7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f6887c5f-45fa-4553-9186-ae713f067d55' 
go

-- $/Accounting/DefaultSystem/BatchReports/Batch Transaction Summary by Payment Method.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0189309-11a9-4522-ae7d-b49900af3041' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52f2a03f-e1cf-43a2-aac4-9d5872a7f0d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b0189309-11a9-4522-ae7d-b49900af3041' 
go

-- $/Common/Tasks/Queries/VIP contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17f3ab3d-9f94-4d1f-a663-b848119c4611' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd72fcf79-e2cf-43f4-8883-c7d642569693' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17f3ab3d-9f94-4d1f-a663-b848119c4611' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '42391bc4-d983-4409-8757-bbe70a3d77bf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac7e916e-c78b-4219-b60b-b5e5fd5abc2f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '42391bc4-d983-4409-8757-bbe70a3d77bf' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Search/Search all batches
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91eb38d3-c9d4-4943-9c2d-be29394eb058' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bd71fc65-9355-4b66-8da2-ee86c8de0de9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '91eb38d3-c9d4-4943-9c2d-be29394eb058' 
go

-- $/Common/Communications/Templates/Samples/Event Invitation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23405203-3bff-4f77-a13e-c1760e3410dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52a8ba8a-6112-404d-86d3-7584dab318dc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '23405203-3bff-4f77-a13e-c1760e3410dd' 
go

-- $/EventManagement/DefaultSystem/Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fdc24472-9f51-40da-b881-c41bb699cdfd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8811e720-11ca-4e9a-8741-5f5504e19a6e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fdc24472-9f51-40da-b881-c41bb699cdfd' 
go

-- $/Common/Tasks/Queries/Members expiring within 60 days
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74a9723e-03a9-441e-b672-c85e833503e0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87ff22e7-97e2-4541-89be-f671ff05f36e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '74a9723e-03a9-441e-b672-c85e833503e0' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Group Members/Search Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0ab86e2-3e59-498c-bc3a-d345d83d8a4d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb771d35-c7f9-414a-95a0-f97296d20d10' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd0ab86e2-3e59-498c-bc3a-d345d83d8a4d' 
go

-- $/ContactManagement/DefaultSystem/Reports/2 Up Labels.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95a6145b-e44a-4845-94fe-d46549da8d23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a1a84eb-3bfb-4696-a5ca-1b7f0ca2fa85' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '95a6145b-e44a-4845-94fe-d46549da8d23' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Automatic payment instructions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '777a1c59-4980-41af-8979-d73e55c1419b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31989995-9787-40fd-b016-e0d6a2f3dfae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '777a1c59-4980-41af-8979-d73e55c1419b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Email Provider Configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e57daedb-589d-450c-9d10-e52e31b557b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
go

-- $/Common/Tasks/Queries/Non-members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bafb18f3-7478-4c2b-8b1c-d7c787eb1868' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3629a1e-51bb-48e9-922d-06d659392ea2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bafb18f3-7478-4c2b-8b1c-d7c787eb1868' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Interaction Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '623e808f-bb36-4c5f-817d-dbe586b92eca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab348dae-491e-4a18-b3f8-362bd9c7a7a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '623e808f-bb36-4c5f-817d-dbe586b92eca' 
go

-- $/ContentManagement/DefaultSystem/ContentLayouts/Two50-50OverOneOverTwo50-50OverOne
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '695ecee8-55d9-46f2-86c0-dff6dcd45b92' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eaac2586-0460-494f-a2ee-1df9e5010c38' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '695ecee8-55d9-46f2-86c0-dff6dcd45b92' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Active members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c659202-0ad7-4b56-9cdf-e04a2f733dc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5209caf-8415-435c-a858-b6c3a6520524' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c659202-0ad7-4b56-9cdf-e04a2f733dc8' 
go

-- $/Samples/Communication
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1bf5bb2d-0b39-4f45-8371-e2dc92fda6a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c57864b3-977a-49b0-b2b5-c653e5dea92b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1bf5bb2d-0b39-4f45-8371-e2dc92fda6a7' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Group Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e71e39ab-367d-4c58-abb2-e2e6d030d5f1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13e56b33-0bfc-40a8-87f9-ece6de7c9a24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e71e39ab-367d-4c58-abb2-e2e6d030d5f1' 
go

-- $/Common/Queries/Value Lists/DiscountableItemClassList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78d5efd5-2391-4201-8a0f-e59210efa1f7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b643bd36-d627-4bac-8333-81e957b72f5a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78d5efd5-2391-4201-8a0f-e59210efa1f7' 
go

-- $/Samples/Events/Single Upcoming Event
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe582544-3f54-4f97-b94d-ea906106bcf3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df311378-b533-4e21-b317-3e1c6078b7a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fe582544-3f54-4f97-b94d-ea906106bcf3' 
go

-- $/Samples/Charts/Contacts by Last Updated
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6db5c080-622d-4ad0-8fd7-eb79bd0b4cfa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da6e735b-07b6-4110-9818-9dbc5677b2c6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6db5c080-622d-4ad0-8fd7-eb79bd0b4cfa' 
go

-- $/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c9ac8751-08e8-45f1-9ece-ebfa0b03d4e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b992497a-3769-4497-abce-568c2609d286' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c9ac8751-08e8-45f1-9ece-ebfa0b03d4e1' 
go

-- $/Common/Tasks/Queries/Major Donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c30dded9-f5f9-4312-968e-f1b21ec9e65f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58f7c94e-d4bd-44eb-b31e-951ff88b0a32' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c30dded9-f5f9-4312-968e-f1b21ec9e65f' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9cc5c257-aed5-4c28-b868-f412386e1ea9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '490495f1-bcc4-4a55-95e4-9fc2151d3e16' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9cc5c257-aed5-4c28-b868-f412386e1ea9' 
go

-- $/Common/Tasks/Queries/Expired members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a738b21-1273-433a-86bb-f4b91fb020d0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c909fbc-f957-4caa-a3c3-8c9a5a0946a5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1a738b21-1273-433a-86bb-f4b91fb020d0' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Search/Ready batches
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2af5d48e-81e2-4fb1-90b0-f55b5db01174' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59337d65-ee8a-4a76-a859-4cb55796d26f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2af5d48e-81e2-4fb1-90b0-f55b5db01174' 
go

-- $/Accounting/DefaultSystem/Queries/Batches/Batch Info/BatchInfo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f097fb4a-ab58-407c-9852-f64d3a96fd3b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82018293-54ff-4a7f-a718-7a2feb201ff0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f097fb4a-ab58-407c-9852-f64d3a96fd3b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Commerce/Confirmation Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89e8cced-2957-423f-8cd1-fa73396a069f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5c34a70-8fd6-4b83-a635-360c0999b2f0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89e8cced-2957-423f-8cd1-fa73396a069f' 
go

-- $/Communications/DefaultSystem/Queries/SelectedContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad8d4fca-6470-4dfd-ad5e-fa7e0b816d95' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb92da7b-bb2b-4d29-9a62-a505ac8df670' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad8d4fca-6470-4dfd-ad5e-fa7e0b816d95' 
go

