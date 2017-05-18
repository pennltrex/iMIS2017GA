-- $/Common/Queries/Value Lists/CountryCodeVATList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fcb45f1b-a773-4edf-abfa-b50e85d36f7a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2cac403-0c8b-4dfd-b263-08a74bf7c941' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fcb45f1b-a773-4edf-abfa-b50e85d36f7a' 
go

-- $/CertificationManagement/DefaultSystem/Queries/InactiveRegistrations/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b417a55-fd1b-4131-b91c-17734a9c55fc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '70d46b37-6fbf-4a85-8e43-0b1da392f5eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3b417a55-fd1b-4131-b91c-17734a9c55fc' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Processed payments for recurring donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f420f2bf-8579-43f3-9e8a-9e9fda904412' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60ba34db-7908-49e0-bb5c-16d5f5cc8e64' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f420f2bf-8579-43f3-9e8a-9e9fda904412' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperienceList/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32c8438b-9338-4d46-b48f-e155a9371402' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '624a5255-cd38-48df-92af-1a55c254ee3e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32c8438b-9338-4d46-b48f-e155a9371402' 
go

-- $/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09c85d7c-6aa1-485d-9caa-92910017b6c0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc15ab37-ec39-41e2-9375-1b570420c914' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09c85d7c-6aa1-485d-9caa-92910017b6c0' 
go

-- $/Common/Queries/SecurityAdministration/GroupAdministration/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '783803f2-80e1-4f30-9103-8868252f8d98' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72034627-daee-4dbe-8543-1bb7e9218794' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '783803f2-80e1-4f30-9103-8868252f8d98' 
go

-- $/Samples/Dashboards/Community
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc9e5b73-ee57-47d2-a41d-d6381b1142c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe889fd8-d0fa-46c7-803b-1e02b64f36b7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc9e5b73-ee57-47d2-a41d-d6381b1142c8' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Html
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb2a3e8f-8d75-4c8e-a53d-143e64d9a446' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a85f082a-e710-499c-a9f5-27829b8fbff7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb2a3e8f-8d75-4c8e-a53d-143e64d9a446' 
go

-- $/Common/Queries/Commerce/Billing/Submitted automatic payments for renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a15cda85-8206-405b-8c60-9980c7251c4a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '22217df9-a2d1-47c3-860f-289614f6f2ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a15cda85-8206-405b-8c60-9980c7251c4a' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Event Registrations This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99efed97-660b-42a8-b5c3-dcb13fe4b500' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b80dcebd-4ab4-49cb-a432-2eac37f867bf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '99efed97-660b-42a8-b5c3-dcb13fe4b500' 
go

-- $/Common/Communications/Templates/Samples/New Member Welcome Email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b0791cb-b4b9-4a33-b04d-55e98f2d3f25' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e31a50a7-7e40-463c-97ed-2f9de4856aab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b0791cb-b4b9-4a33-b04d-55e98f2d3f25' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Submitted payments for recurring donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33ce6f92-fe9a-46e6-b863-3b9e35df2358' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7790e8e7-5bc3-4d96-800e-3148eb6ee11c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '33ce6f92-fe9a-46e6-b863-3b9e35df2358' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2460cf64-461f-45af-bc5f-337aaf1c9397' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ddbc266-64fc-48d0-aa79-43d5192fdbd1' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Payment history for recurring donations
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

-- $/Samples/StaffHome/Active DB records by type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8d9645a1-2bfa-4235-9f0b-9382ed95792c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9db2d33e-a787-4eaa-8772-3ed007b19411' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8d9645a1-2bfa-4235-9f0b-9382ed95792c' 
go

-- $/Samples/StaffHome/Members by Region
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '083640bb-fcb6-472f-84ee-8456b5df6032' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f35679a-b00d-4385-b21e-42f8698c1363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '083640bb-fcb6-472f-84ee-8456b5df6032' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Tagged List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4806a3e0-9521-455d-83f9-b6350b58616c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f16392b8-c8c7-42cf-9196-495a7c26e359' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4806a3e0-9521-455d-83f9-b6350b58616c' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - Total Active Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1cd44771-ef99-4d17-880d-19aa3b8e58f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19dfb124-8cb2-48c6-8c5e-4b086455d0dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1cd44771-ef99-4d17-880d-19aa3b8e58f2' 
go

-- $/Common/Communications/Templates/Samples/Newsletter Template
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '735330ab-10ed-4943-b27f-6261df3b6265' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7dbeb62-2a85-4983-974f-4e722bf49281' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '735330ab-10ed-4943-b27f-6261df3b6265' 
go

-- $/Samples/Dashboards/Fundraising/Top donors/By moves manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '737d818e-b7a1-459a-81f2-5c85da747b93' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f12f6c6c-a44c-4aed-8f57-5296ecd27b67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '737d818e-b7a1-459a-81f2-5c85da747b93' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Orders This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd6f0232-5cd3-4fe1-bfe0-59b69400ad09' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c46d286-4b35-4c46-b6b9-536ea13e9629' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd6f0232-5cd3-4fe1-bfe0-59b69400ad09' 
go

-- $/Communications/DefaultSystem/Queries/Party/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca3dcdb6-ae82-489d-b70a-501aca7b89f4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78c08ed4-e56a-4799-8b76-5407b65222de' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca3dcdb6-ae82-489d-b70a-501aca7b89f4' 
go

-- $/Samples/Dashboards/Membership/Progress Tracker - Renewals This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63895f20-65e6-4d3e-98ed-19f6e8fb047b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8ca08e9-c6b9-404a-9a71-5831fe75318e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63895f20-65e6-4d3e-98ed-19f6e8fb047b' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiencesByExperience
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b91e1f07-cc72-4cb3-be30-2bd950428661' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd91329c3-7d56-4ac7-b624-5aea135bafce' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b91e1f07-cc72-4cb3-be30-2bd950428661' 
go

-- $/Samples/Dashboards/Fundraising/Progress Tracker - Funds Raised This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07398c70-f803-4ee2-95a9-b368c070be70' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f62e976-fa08-4f5a-81b8-61828076c53a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07398c70-f803-4ee2-95a9-b368c070be70' 
go

-- $/Samples/ProgressTracker/DonationsNoEndDate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ae8514b-b311-4d20-bd00-a20f25cc355a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55bc5a19-c3d8-45c6-9865-634e6bc11f33' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ae8514b-b311-4d20-bd00-a20f25cc355a' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Reference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5db8075a-ab41-4702-b267-a8ad9e1d3fd2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b0e6f98-bf62-4576-b4b4-66635d9e68f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5db8075a-ab41-4702-b267-a8ad9e1d3fd2' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiencesByContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01092336-8343-4091-9cca-439a958882e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07363d05-8875-4161-a5f0-7c604eb27ae4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '01092336-8343-4091-9cca-439a958882e8' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiencesByDate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e00cb8cc-9b77-403c-9e08-d7f63f4c9f81' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d179849-9d56-41de-bb1d-7ebda55c64bd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e00cb8cc-9b77-403c-9e08-d7f63f4c9f81' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperienceList/Requirements Requiring Grades
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '61f82d7b-903b-400d-bd24-b9c79451f49d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab0c570f-d921-4f54-bbd2-838bf93010ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '61f82d7b-903b-400d-bd24-b9c79451f49d' 
go

-- $/Accounting/DefaultSystem/Reports/ARStatement.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fc52c08-2243-4231-80de-84f3e9ba1dcc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5c1fcc5-7e87-4e9e-b854-8fdc37b77b31' 
go

-- $/EventManagement/DefaultSystem/Reports/EventSimpleBadgesParams.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92aa9201-d9d2-4f7b-950a-0f1bd343a5a4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '935a93db-4fac-4349-97c8-90fe521cc651' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '92aa9201-d9d2-4f7b-950a-0f1bd343a5a4' 
go

-- $/Samples/ProgressTracker/DonationsCount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27f9a72b-d261-4669-ba8a-851fc8b48e7c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab3befc7-835b-48d6-84dc-91768ccf359c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '27f9a72b-d261-4669-ba8a-851fc8b48e7c' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiences
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd65cc127-a9f8-4f89-9b11-aa1b6f99d5c9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0dd302a7-1f70-4b72-8da8-95f8055d65a9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd65cc127-a9f8-4f89-9b11-aa1b6f99d5c9' 
go

-- $/Samples/Dashboards/Membership/Newest Members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a2886a7c-0935-41f0-8ad8-9b5cd1d284f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff1f3493-8c0b-4a60-81aa-71af48289695' 
go

-- $/Common/Queries/Commerce/Billing/Payment history for automatic renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2159787c-943a-427a-aa28-c2ca090d6fd0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e4d68d7-ea2c-404e-baa4-9c273f3929c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2159787c-943a-427a-aa28-c2ca090d6fd0' 
go

-- $/Samples/Dashboards/Events/Progress Tracker - Event Revenue This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '549629c1-0cac-4456-8048-6040f2376de4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '193c771a-5d79-48a5-bea3-9f265db490ac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '549629c1-0cac-4456-8048-6040f2376de4' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Find recurring donation invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ba797bc-0365-487b-a7e0-a1b306ead2f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad40842a-9272-456a-b86c-cdd6995266e1' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiencesByProgram
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7dae94f2-4ff2-4358-9eef-846023c913af' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3b340e7-0fef-421e-8af8-abfc2561b77e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7dae94f2-4ff2-4358-9eef-846023c913af' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Content/Content Page Break
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ec6c715-d4d9-4b38-b98c-a1a81d58508d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a119b56-5f81-4b63-8928-b1dc3b80ac7b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ec6c715-d4d9-4b38-b98c-a1a81d58508d' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperienceList/Requirements approved in the last 30 days
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1eabed3-63a7-402f-8256-5e8c96bad8f3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36f8dccc-5ccd-4645-920b-b67ef0145569' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c1eabed3-63a7-402f-8256-5e8c96bad8f3' 
go

-- $/ExperienceManagement/DefaultSystem/Queries/ReviewExperience/ListCustomerExperiencesRecentlyApproved
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '177d3094-b4fc-4861-8749-155994305da8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b13df524-3cf4-4da9-8d19-bbc7a13d876d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '177d3094-b4fc-4861-8749-155994305da8' 
go

-- $/Samples/Dashboards/Events/Specific Events/Roster List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e78e9c3-2008-4e2e-bd8e-bc1360c5e0f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4cc6398a-20eb-472c-948e-93dd2a6811c8' 
go

-- $/Samples/Dashboards/Fundraising/Donations by Fund This Year
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b340afd6-d153-497f-a2b0-2723caaf2959' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7ac8faf-3042-4c4e-aadf-be1cdb61d61c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b340afd6-d153-497f-a2b0-2723caaf2959' 
go

-- $/EventManagement/DefaultSystem/Reports/EventRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '324a8d73-3cb2-41d0-9a30-c60bb04ac117' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '198fb0d3-1905-4d82-8dfc-fe3686eb629a' 
go

-- $/Samples/Dashboards/Fundraising/Top donors/By donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '717f70f1-d1c7-469b-a159-d0b0df4ff112' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc925e68-7e38-41d3-89e6-e000ff3d0263' 
go

-- $/CertificationManagement/DefaultSystem/Queries/AnalyzeRegistrantProgress/ContactSearch
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17d53964-125c-42f5-b3fd-296ac22a31e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '760049d4-6f52-4467-afd1-d34c35ecd054' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17d53964-125c-42f5-b3fd-296ac22a31e8' 
go

-- $/Samples/ProgressTracker/Donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '61a5710f-a135-4ba9-ba1d-5232f891dfc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '087eaf52-aac7-4edc-93da-d43ec40497cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '61a5710f-a135-4ba9-ba1d-5232f891dfc8' 
go

-- $/EventManagement/DefaultSystem/Reports/ProgramItemRegistrantsReport.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88178d86-aec0-4859-9793-d9819e65f4ac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '20cee2ca-e804-4ef5-b812-189f67efe6b2' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/All products
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc87a3bc-b940-4669-8a94-fe5b0a3ad450' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0de693e2-c37d-4796-8d2e-da0f3f53d8d3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc87a3bc-b940-4669-8a94-fe5b0a3ad450' 
go

-- $/Fundraising/DefaultSystem/Queries/Recurring Donations/Automatic payment enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '777a1c59-4980-41af-8979-d73e55c1419b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31989995-9787-40fd-b016-e0d6a2f3dfae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '777a1c59-4980-41af-8979-d73e55c1419b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Dynamic Content Collection Organizer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abf56a5e-97e1-4bba-a4ed-e2eb28d355a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11b8e370-c457-4dc3-bac2-cf62dc2c64fe' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Email Provider Configuration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e57daedb-589d-450c-9d10-e52e31b557b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fa34ce3b-76f5-4541-a68f-d7acd9953346' 
go

-- $/Common/Queries/Commerce/Billing/Processed automatic payments for renewals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3715bc18-c0bd-443b-9d4a-5f628fc61490' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cca9ddf9-bfef-43c0-9ce7-f1965a8cd654' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3715bc18-c0bd-443b-9d4a-5f628fc61490' 
go

-- $/Common/Queries/Commerce/Billing/Find renewal invoices due for automatic payment
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf7134a4-f90c-43ba-94ec-3b0b066b9384' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '675837bd-db20-4458-870c-f67dd0d5e7d6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bf7134a4-f90c-43ba-94ec-3b0b066b9384' 
go

-- $/Samples/Dashboards/Events/Event Details - Recent and Upcoming
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11cff5f4-209a-459f-a961-f12669785553' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f9b3ca5-6348-4c3d-8ac9-fe23df3ff8df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11cff5f4-209a-459f-a961-f12669785553' 
go

