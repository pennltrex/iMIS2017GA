-- $/Common/Queries/Commerce/Product/ProductsForDiscount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8af8632-a71b-4093-a7a2-0379826903ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d9beecf-af0d-4ea9-83c9-6bafe62d6e44' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8af8632-a71b-4093-a7a2-0379826903ab' 
go

-- $/Samples/Security/UserAccess/Contacts available to all users
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea3b2f3f-24c7-40b6-a23c-08bc2d991b0c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '626afeeb-7a87-4938-a307-496a159433a6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea3b2f3f-24c7-40b6-a23c-08bc2d991b0c' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/ExperienceCountSummary.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6ddd7ea6-0541-4885-8db5-0ddeb1abe1df' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb1d8ddd-a5d4-47ea-98f9-e1d8ed7d4a7b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6ddd7ea6-0541-4885-8db5-0ddeb1abe1df' 
go

-- $/EventManagement/DefaultSystem/Reports/EventSimpleBadgesParams.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92aa9201-d9d2-4f7b-950a-0f1bd343a5a4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '935a93db-4fac-4349-97c8-90fe521cc651' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '92aa9201-d9d2-4f7b-950a-0f1bd343a5a4' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Public/Contributions By Calendar Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15ea55bc-c92a-4356-afeb-0fb49de98e1d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46ece44e-6b32-4ae8-bc38-6d4d0844212a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '15ea55bc-c92a-4356-afeb-0fb49de98e1d' 
go

-- $/ContactManagement/DefaultSystem/Reports/Queries/Full Address Report Query
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d95caaf-18a1-4739-8272-0fd508d08d77' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ee90989-78f5-4b56-a965-f61298e5983e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d95caaf-18a1-4739-8272-0fd508d08d77' 
go

-- $/CertificationManagement/DefaultSystem/Reports/ComponentList Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c6467b92-5dc0-4ebc-9474-13e808b2dd51' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cbeab3ef-6a32-46d1-9596-4c1e2c42abfd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c6467b92-5dc0-4ebc-9474-13e808b2dd51' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Orders By Product Category This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5ce316a-548e-4f5b-ba86-1a45bb633968' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e537eec-14d5-434c-abbd-9485e781cf1c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd5ce316a-548e-4f5b-ba86-1a45bb633968' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Gifts Received by Calendar Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9c669bf-77dd-411b-a2d6-1a661a1894b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5d41c62-9776-4105-9913-19bf185eb08a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd9c669bf-77dd-411b-a2d6-1a661a1894b4' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/ProgramRegistrations.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '484c30e9-6d4c-4ed4-8cbf-208e7ebca692' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01c0f614-e41e-40e6-8d95-0b96fcb398da' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '484c30e9-6d4c-4ed4-8cbf-208e7ebca692' 
go

-- $/SegmentManagement/DefaultSystem/Reports/Segmentation Job
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '447716a4-49f6-4368-8319-22095db81fc0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ec58ff3-540d-4de8-a5f0-b6d73affab20' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '447716a4-49f6-4368-8319-22095db81fc0' 
go

-- $/Fundraising/DefaultSystem/Queries/Charts/Giving History by Calendar Year Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ded7de9-7174-47a5-b91d-246da253ea5c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b39ca811-8801-450e-8b2e-3c2b30c741f9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2ded7de9-7174-47a5-b91d-246da253ea5c' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By committee (active mbrs)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef01102b-6b89-4b6a-a1b8-27e05b0ea4d2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2361d181-d89b-4385-8fa0-9c4edf1ffa8e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef01102b-6b89-4b6a-a1b8-27e05b0ea4d2' 
go

-- $/ContactManagement/DefaultSystem/Reports/Queries/List Reports Query
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'affecdf3-4a74-4ee1-8fb6-288d4146b5da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1bf33c3-57da-4301-9dad-a76aa951b48b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'affecdf3-4a74-4ee1-8fb6-288d4146b5da' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/OfferingRoster.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da463d0f-5adf-45e9-9fe9-28a0c24a8dc2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af8accc6-ed64-4915-8c8a-8b7909c32fff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'da463d0f-5adf-45e9-9fe9-28a0c24a8dc2' 
go

-- $/SegmentManagement/DefaultSystem/Reports/Segment Definition by Job
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b4d6212-e3ad-412c-bd4a-28e27fadda36' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b62f248b-7702-4386-9d86-7d0261ea290d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b4d6212-e3ad-412c-bd4a-28e27fadda36' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/CompletedCertificates.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2c463f7-4fc9-441c-bd27-2a6ae062577b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '856bed27-d86b-462a-ab35-5159340d49ce' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd2c463f7-4fc9-441c-bd27-2a6ae062577b' 
go

-- $/Samples/Directory/PeopleSearch/By committee (active mbrs)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f05c9cee-b107-49f3-b316-2bf4bca8054c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd4b8021-799f-4ec8-a686-af96b2dc9b17' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f05c9cee-b107-49f3-b316-2bf4bca8054c' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Advanced Accounting Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9ed3cdb-69ba-4e17-aed5-2c4bb2f4c391' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ff74f3a-ab66-4629-9e30-b9e4302a63b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd9ed3cdb-69ba-4e17-aed5-2c4bb2f4c391' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/ParticipantRoster.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17793040-34b3-4fd6-bfc5-2e05947cdc13' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '399c4322-228e-434c-9e94-360ac78dd0e0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17793040-34b3-4fd6-bfc5-2e05947cdc13' 
go

-- $/CertificationManagement/DefaultSystem/Reports/UpcomingDelinquency Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82b74095-ec26-49d2-a91a-3071dc9a8855' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '481a043c-a7f3-4e44-9cc5-6ebbad67e515' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '82b74095-ec26-49d2-a91a-3071dc9a8855' 
go

-- $/Samples/Guided Performance Scorecard/GPS.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '652ec40e-3879-4da7-9fb3-315dca90542f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cff4b2ec-9faf-4912-b939-3e44f643aba7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '652ec40e-3879-4da7-9fb3-315dca90542f' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/ExperienceRoster.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e95b549f-470b-4c80-924f-34c40a05368a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f1fecaf-26ab-4bef-97c9-194c4d95283c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e95b549f-470b-4c80-924f-34c40a05368a' 
go

-- $/SegmentManagement/DefaultSystem/ReportsView/Segment Definition
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03d06e95-2e29-4f18-a8a3-35610f5c48be' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '570c8a9c-8f66-4fd7-bef5-27e56cca647d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '03d06e95-2e29-4f18-a8a3-35610f5c48be' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Queries/UpcomingDelinquency Query
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aa3abbca-8a3a-4525-8439-36027c905643' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '873d6e32-8a8c-422f-b5b6-e240bd6424bc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aa3abbca-8a3a-4525-8439-36027c905643' 
go

-- $/CertificationManagement/DefaultSystem/Reports/ParticipantRoster Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6baabd74-1bfe-4581-ae7b-377bd496b88c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cdf1e48c-4c91-42af-941e-86c850b87959' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6baabd74-1bfe-4581-ae7b-377bd496b88c' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Giving History by Fund
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a5d02fb-686c-463e-af88-37b8f4affa7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b5395a5-2a21-4997-804e-48b82b70d87c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9a5d02fb-686c-463e-af88-37b8f4affa7a' 
go

-- $/CampaignManagement/DefaultSystem/Reports/Campaign Performance by Source Code
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6c09ec5-d131-4035-b01a-39454124b469' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85899b86-6fa3-4ea4-898a-a0fa05f56e14' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b6c09ec5-d131-4035-b01a-39454124b469' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/Organization search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c24ac811-1a35-4f0e-a6d8-3b9eab87798a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd1fe3ebf-b715-4c21-8a70-1aa33247491e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c24ac811-1a35-4f0e-a6d8-3b9eab87798a' 
go

-- $/RFMAnalysis/DefaultSystem/Reports/RFM Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03d6828b-ab59-4c8b-a29d-3cf957302960' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b540407-a4af-4c80-8118-6523d7a485b8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '03d6828b-ab59-4c8b-a29d-3cf957302960' 
go

-- $/RFMAnalysis/DefaultSystem/Reports/RFM Analysis Preview Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd71d572e-fef2-4d6c-8a18-40dd78143c3d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'acd324be-195e-437b-957f-5e9c3a91550a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd71d572e-fef2-4d6c-8a18-40dd78143c3d' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2460cf64-461f-45af-bc5f-337aaf1c9397' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
go

-- $/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Billing Payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d6bf170-e7ea-47a3-8a5f-4663c02eef9a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'adec6261-9f52-4062-b2d8-23242f7ba09a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1d6bf170-e7ea-47a3-8a5f-4663c02eef9a' 
go

-- $/Communications/DefaultSystem/Queries/Party/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca3dcdb6-ae82-489d-b70a-501aca7b89f4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78c08ed4-e56a-4799-8b76-5407b65222de' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca3dcdb6-ae82-489d-b70a-501aca7b89f4' 
go

-- $/CertificationManagement/DefaultSystem/Queries/CertificationProgram/CertificationProgramHistoryList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b7ba181-95ee-4a97-bf2f-5037423aa324' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b5256ba-3a48-4413-a104-28b02f8c756d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3b7ba181-95ee-4a97-bf2f-5037423aa324' 
go

-- $/Common/Communications/Templates/Samples/DonationThankYouTemplate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7cf3b8bf-c1a6-46ed-9e29-504eb6ced36c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c866e389-3abd-45f6-9545-f1a9024b91c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7cf3b8bf-c1a6-46ed-9e29-504eb6ced36c' 
go

-- $/Fundraising/DefaultSystem/Queries/Giving History - Staff/Giving History by Campaign
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7fcbc32-499b-4754-8a0c-512eb5e8a9a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a3158cc-860a-482f-b178-9f85fc2cf2fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e7fcbc32-499b-4754-8a0c-512eb5e8a9a1' 
go

-- $/Samples/ProgressTracker/Donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '61a5710f-a135-4ba9-ba1d-5232f891dfc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '087eaf52-aac7-4edc-93da-d43ec40497cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '61a5710f-a135-4ba9-ba1d-5232f891dfc8' 
go

-- $/CampaignManagement/DefaultSystem/Reports/Campaign Stage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bfff2625-3d45-4d92-8ced-5415559832f4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '018dcc62-8f29-49bc-85fc-5884a5c0c30b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bfff2625-3d45-4d92-8ced-5415559832f4' 
go

-- $/Accounting/DefaultSystem/Queries/Batches
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f37c0b3c-a096-4826-8e6c-575604c27afe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '56a963b5-e4f8-4dcc-b8d8-ec6a7915fdf6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f37c0b3c-a096-4826-8e6c-575604c27afe' 
go

-- $/OrderManagement/DefaultSystem/Queries/Advanced/Order/Specific Order
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7bb12864-db9c-4b02-bc79-596bb9f25f4e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a98b9178-c210-4e8e-8cae-bf1f8dac13b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7bb12864-db9c-4b02-bc79-596bb9f25f4e' 
go

-- $/CertificationManagement/DefaultSystem/Reports/ExperienceRoster Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d720945-d45b-405e-954a-5a3cbc065131' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37254251-1f32-4e5d-95c5-2fd2eff1bca2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6d720945-d45b-405e-954a-5a3cbc065131' 
go

-- $/Samples/Security/UserAccess/Contacts available to members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e0409ee-1c29-4e1a-860a-5a7041bc5179' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a0b5930-205a-421a-81f8-e4dd8cf419ad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e0409ee-1c29-4e1a-860a-5a7041bc5179' 
go

-- $/Common/Queries/Commerce/ProductClass/Simple
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd045c6ab-22a1-4090-a2e8-5b04239405ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f17bbfa-55cc-4f4d-929b-f1aa6f5ba3ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd045c6ab-22a1-4090-a2e8-5b04239405ec' 
go

-- $/Common/Communications/Templates/Samples/Newsletter Template
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '735330ab-10ed-4943-b27f-6261df3b6265' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7dbeb62-2a85-4983-974f-4e722bf49281' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '735330ab-10ed-4943-b27f-6261df3b6265' 
go

-- $/Common/Communications/Templates/Samples/Renewal Template
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dbdc44fe-69a1-4998-b966-653442131a9d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b83be25-beef-40f1-a8c9-23f2ad8ea471' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dbdc44fe-69a1-4998-b966-653442131a9d' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/Committees/Members/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f31d4dc0-dfbf-4026-a205-660914d5116c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '952e221b-7154-49fb-97a2-a28360e6853e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f31d4dc0-dfbf-4026-a205-660914d5116c' 
go

-- $/ContactManagement/DefaultSystem/Queries/Contacts/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3863fca4-09de-4c46-b860-67624345d0b9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c64dba2-4dd0-48c6-a174-a5a36c1ba1b8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3863fca4-09de-4c46-b860-67624345d0b9' 
go

-- $/CertificationManagement/DefaultSystem/Reports/ProgramRegistrations Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1c7efbe-8954-4863-ba81-682dfc881335' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9bf19c62-f7b8-4de1-8431-beeb00d55ba4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f1c7efbe-8954-4863-ba81-682dfc881335' 
go

-- $/Samples/Security/UserAccess/All Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '953dbf76-62e3-4ee8-911a-683118a9afe3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c26df304-0f6c-4dc5-87c2-e50db8ce3061' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '953dbf76-62e3-4ee8-911a-683118a9afe3' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/People search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c849cbc3-4dff-40ae-8ba6-6a12ffb906ac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a14565cb-6adc-4b11-80c0-5b558d418f31' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c849cbc3-4dff-40ae-8ba6-6a12ffb906ac' 
go

-- $/Fundraising/DefaultSystem/Queries/Charts/Contributions by Calendar Year Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '35bac381-a172-4072-90f4-6a3db9485ef9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '274d602c-108c-45ed-a6dd-e0d41150da23' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '35bac381-a172-4072-90f4-6a3db9485ef9' 
go

-- $/Samples/Dashboards/Contacts/Newest Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2886a7c-0935-41f0-8ad8-9b5cd1d284f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
go

-- $/CampaignManagement/DefaultSystem/Reports/Campaign Confirmation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '618f2493-b852-4cf8-b823-766073721a5d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f8aa2f5-dcef-460e-9a54-942afa5d1d20' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '618f2493-b852-4cf8-b823-766073721a5d' 
go

-- $/Samples/ProgressTracker/DonationsCount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27f9a72b-d261-4669-ba8a-851fc8b48e7c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab3befc7-835b-48d6-84dc-91768ccf359c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '27f9a72b-d261-4669-ba8a-851fc8b48e7c' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Quick Links
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b09585d-7a07-4169-9b62-90601a9272b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '933ee130-9ba1-4c30-ae30-9888dc552a43' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7b09585d-7a07-4169-9b62-90601a9272b0' 
go

-- $/CertificationManagement/DefaultSystem/Reports/ExperienceCountSummary Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2cd2d1a1-6025-4c66-8d48-920a2a6c811e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5cb763de-226a-4421-bf37-96737098c7e8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2cd2d1a1-6025-4c66-8d48-920a2a6c811e' 
go

-- $/Samples/Dashboards/Events/Specific Events/Roster List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e78e9c3-2008-4e2e-bd8e-bc1360c5e0f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
go

-- $/ContactManagement/DefaultSystem/Queries/Contacts/By Committee
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bce5ea52-4be6-4878-a03a-96196c21cf1d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd6de08d4-e941-4208-b232-7923ce5519f9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bce5ea52-4be6-4878-a03a-96196c21cf1d' 
go

-- $/Fundraising/DefaultSystem/Queries/Advanced/DonationDetails/Specific Donation by Distribution
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2fa3d5e-ba22-468a-ab80-99c4b3c94c34' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd8ae901-d326-4d00-bf49-e3bc312ead95' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b2fa3d5e-ba22-468a-ab80-99c4b3c94c34' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue Last Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98d9da88-c4e0-4812-940f-9ad0628b5d54' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '375ae0f2-7b29-4c30-95ad-76c09f746ac7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '98d9da88-c4e0-4812-940f-9ad0628b5d54' 
go

-- $/CampaignManagement/DefaultSystem/Reports/Campaign Performance by Solicitation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1918724-4381-43eb-9dd7-9b20d7579d5d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '552e7834-4938-48f5-bef0-910515158966' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c1918724-4381-43eb-9dd7-9b20d7579d5d' 
go

-- $/CertificationManagement/DefaultSystem/Reports/CompletedCertificates Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e2ac8409-504c-42d0-b57b-9b8247b49b78' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '191b3f59-c482-49a9-84cb-8f6051cc841f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e2ac8409-504c-42d0-b57b-9b8247b49b78' 
go

-- $/CertificationManagement/DefaultSystem/Reports/CertificationProgramList Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc7579e0-80c9-4cb8-a28e-9d4d8708aced' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3e02ab8-5b62-4f72-9246-9b3bb6676843' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc7579e0-80c9-4cb8-a28e-9d4d8708aced' 
go

-- $/Samples/ProgressTracker/DonationsNoEndDate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ae8514b-b311-4d20-bd00-a20f25cc355a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55bc5a19-c3d8-45c6-9865-634e6bc11f33' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ae8514b-b311-4d20-bd00-a20f25cc355a' 
go

-- $/ContactManagement/DefaultSystem/Queries/Directory/PeopleSearch/By all common criteria
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09e86b63-135c-4170-831b-afad3c534897' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b53741c-e3c7-4afe-b5b6-2ae2ca9f0987' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09e86b63-135c-4170-831b-afad3c534897' 
go

-- $/Common/Queries/Value Lists/PrefixList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '049e701b-ce82-4151-87ef-b7b63e8afb3b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21be95b3-95b3-421a-a3f5-0c6d2acd9974' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '049e701b-ce82-4151-87ef-b7b63e8afb3b' 
go

-- $/CertificationManagement/DefaultSystem/Reports/OfferingRoster Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '429b6967-c7bf-440a-b99a-c5e42c5191f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5323c33-0a0b-4e6c-a602-d475c2b916f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '429b6967-c7bf-440a-b99a-c5e42c5191f2' 
go

-- $/ContactManagement/DefaultSystem/Queries/ValueList/CommunicationReasonsList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5573dd75-1be5-46df-a0e2-cd04e6c419cd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6464b90-ccf1-4426-b2dc-806c95e8dcfe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5573dd75-1be5-46df-a0e2-cd04e6c419cd' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Find recurring donation invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ba797bc-0365-487b-a7e0-a1b306ead2f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
go

-- $/Samples/RelatedItems/Related Products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f92fb743-3e82-4eca-b6f4-ceba17e6ad3f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c677b47-0380-4910-9bc4-f93962d0ffe3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f92fb743-3e82-4eca-b6f4-ceba17e6ad3f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Dynamic Content Collection Organizer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abf56a5e-97e1-4bba-a4ed-e2eb28d355a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
go

-- $/Samples/Dashboards/Events/Total Event Registrations by Member Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72fba2ff-354e-43ab-a18b-dc5f028b5606' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2c961ac-a6bf-427b-880e-f9940e9aeec2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '72fba2ff-354e-43ab-a18b-dc5f028b5606' 
go

-- $/ContentManagement/DefaultSystem/Reports/Items By Tag Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df79aff2-e1cf-4115-b49c-dccae6f58659' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9df132c9-56b7-4741-a255-7597d8afbd81' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'df79aff2-e1cf-4115-b49c-dccae6f58659' 
go

-- $/Common/Output/MS Word Merge/MyWordMergeProcessEngine Merge Output.doc
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c46fc12-032f-46f5-928c-ddda12ff14b9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f65ac43-40d0-4078-9b7c-4f67ca4eb118' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c46fc12-032f-46f5-928c-ddda12ff14b9' 
go

-- $/CampaignManagement/DefaultSystem/Reports/Campaign Purge
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8417eace-fa08-4da3-a6bd-dfe0d0d33a4e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb1763ff-24ce-4056-b802-8c8eade5f481' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8417eace-fa08-4da3-a6bd-dfe0d0d33a4e' 
go

-- $/Samples/Dashboards/Fundraising/Top Donors This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '717f70f1-d1c7-469b-a159-d0b0df4ff112' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
go

-- $/Fundraising/DefaultSystem/Queries/Advanced/DonationDetails/Specific Donation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '808ecb03-2a10-48ce-9f3a-e143a76350f0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28bd4646-c1c4-4802-83da-c309077efb99' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '808ecb03-2a10-48ce-9f3a-e143a76350f0' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperienceList/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32c8438b-9338-4d46-b48f-e155a9371402' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '624a5255-cd38-48df-92af-1a55c254ee3e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32c8438b-9338-4d46-b48f-e155a9371402' 
go

-- $/ContentManagement/DefaultSystem/Reports/Groups By Producer Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1592d04c-1036-4275-9716-e70c680c9f5a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '67b57fed-20ab-456a-823a-c8771807c5c3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1592d04c-1036-4275-9716-e70c680c9f5a' 
go

-- $/CertificationManagement/DefaultSystem/Reports/Templates/UpcomingDelinquency.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c331c22-4b58-4411-a599-f44b011086dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4e16f486-291c-4738-9bdc-8ab7ee46b126' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8c331c22-4b58-4411-a599-f44b011086dd' 
go

-- $/EventManagement/DefaultSystem/Reports/EventRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '324a8d73-3cb2-41d0-9a30-c60bb04ac117' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
go

