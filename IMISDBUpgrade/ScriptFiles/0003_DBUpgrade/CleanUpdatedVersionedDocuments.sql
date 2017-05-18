-- @/iCore/Contacts/OrganizationLayouts/Organization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '042d20e8-4d59-4997-a216-046498caf03e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b16d124-0b2b-42c8-a207-042e72b9e4b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '042d20e8-4d59-4997-a216-046498caf03e' 
go

-- @/iCore/Communities/WikiDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09844d89-14dc-4821-8af0-55be31c34bd9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2365202c-3323-4e46-9153-05681f3d3f48' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '09844d89-14dc-4821-8af0-55be31c34bd9' 
go

-- @/iCore/Contacts/ContactLayouts/Donor/About_Me
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b221d8fb-5314-46d7-b4fc-56ef5de92105' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e203e629-80f5-4557-b028-060c3e08639e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b221d8fb-5314-46d7-b4fc-56ef5de92105' 
go

-- @/iCore/Store/StoreLayouts/Store_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a39f696-cc52-49e0-8451-1b3b6970162f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53edb360-7b6b-425f-9ec3-06418c408e24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7a39f696-cc52-49e0-8451-1b3b6970162f' 
go

-- @/iCore/Events/Event_Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '758d9097-d12e-46e4-b03d-86def112a1cb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99580240-5ced-40f0-99ed-08b5644c1a87' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '758d9097-d12e-46e4-b03d-86def112a1cb' 
go

-- @/iCore/Fundraising/New_Donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7960709d-5ea2-445f-9e55-1c02fce365ed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58552117-d1ad-4303-bd1e-09fb73ac5cf0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7960709d-5ea2-445f-9e55-1c02fce365ed' 
go

-- @/iSamples/Mobile/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b27051e-591f-4a0c-9dbc-537e86a6a8d5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '973c6323-9680-408a-87bf-0a34a8088ab0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b27051e-591f-4a0c-9dbc-537e86a6a8d5' 
go

-- @/iCore/Staff_Dashboards/Guided_Performance_Scorecard/Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71f43e73-4b74-4b90-b66f-321bd88b622e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d3900b5-5fba-4ef4-a321-0b379a06e7ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '71f43e73-4b74-4b90-b66f-321bd88b622e' 
go

-- @/iCore/Fundraising/Gift_aid_declaration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a28485b2-2871-4844-8ca6-e3af3d257712' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c85648fb-d76f-436c-9d99-0ba99b3a75c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a28485b2-2871-4844-8ca6-e3af3d257712' 
go

-- @/iCore/Reporting_Services_Samples/Membership_Pyramid_Chart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6fe8fe4-4201-4325-8c8e-fda93df58663' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c4d2b6a-99a5-4184-ab76-0cf514d1e435' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a6fe8fe4-4201-4325-8c8e-fda93df58663' 
go

-- @/iSamples/Member/Leadership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a37995e1-47c8-4f88-b686-4d17058a198f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5db78df9-f671-4796-b818-0d7442de2efd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a37995e1-47c8-4f88-b686-4d17058a198f' 
go

-- @/iSamples/Mobile/Contact_Management/My_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9bd23841-ab8d-411e-9320-c960b509466a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b7e0ae5-f207-49a0-9215-1013627c490a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9bd23841-ab8d-411e-9320-c960b509466a' 
go

-- @/iSamples/AnnualConference/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd26ffef7-cdc0-40f9-b3ea-4c0e0e74aa36' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37107d1a-3f61-40c6-a7c6-1024bfc84307' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd26ffef7-cdc0-40f9-b3ea-4c0e0e74aa36' 
go

-- @/iSamples/Member/ContentAreas/Footer_Communications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8251fd4c-c2a5-483a-9030-80280f740965' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c640a87-8331-46dd-aab2-10258765e861' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8251fd4c-c2a5-483a-9030-80280f740965' 
go

-- @/iCore/Content/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8282faee-49aa-4b61-87af-26c660aee222' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7196a7b3-77c5-4428-be2a-102e402360ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8282faee-49aa-4b61-87af-26c660aee222' 
go

-- @/iCore/Events/Event_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '341f6814-81c2-41d9-adb7-ec0ec5f59342' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7aaa2571-9e50-4473-b894-1174ec66d004' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '341f6814-81c2-41d9-adb7-ec0ec5f59342' 
go

-- @/iCore/Contacts/CreateAccount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8ee1c41-1f86-4fae-baf8-c1f846d85c1d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6606964d-abde-4159-98dd-11acec31d83a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8ee1c41-1f86-4fae-baf8-c1f846d85c1d' 
go

-- @/iSamples/AnnualConference/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'edd0d77c-80f9-4a08-8eb5-5e4b76f19e75' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '439b99b7-9656-4249-97fe-15e6939194f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'edd0d77c-80f9-4a08-8eb5-5e4b76f19e75' 
go

-- @/iCore/Contacts/SimpleAccountCreator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ab7e5c2-df19-40d3-9345-7bce63361641' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78b79c30-5044-4ecc-aa0b-162e87383c04' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ab7e5c2-df19-40d3-9345-7bce63361641' 
go

-- @/iSamples/Member/ArticlesAndGuides
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28d33319-495a-489c-8bb4-3a8a6d097a8f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c784eb08-dc57-41ea-aee4-1664b5220ec5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28d33319-495a-489c-8bb4-3a8a6d097a8f' 
go

-- @/iCore/Contacts/ContactLayouts/Education
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12b2c8ec-6fce-465c-923f-eb003633522a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4e3841cb-0d72-4175-b286-17df5c530f23' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '12b2c8ec-6fce-465c-923f-eb003633522a' 
go

-- @/iCore/Content/SearchResultsRow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '71451dd0-5138-4fa9-abee-4c272fb1a4cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c40616b3-9935-477f-97e7-189fa8e45684' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '71451dd0-5138-4fa9-abee-4c272fb1a4cc' 
go

-- @/iCore/Store/Manage/Add_Item
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a950a7e-aab8-4f1b-b6ff-face25af0c58' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '562ea02f-a356-4294-997b-18cb92a41377' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3a950a7e-aab8-4f1b-b6ff-face25af0c58' 
go

-- @/iSamples/Member/Planning_Session
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '76e77b3e-f5e9-4739-8324-7d091c815954' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c3ddd30f-ebd1-44b9-9c36-1a6962ae9eac' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '76e77b3e-f5e9-4739-8324-7d091c815954' 
go

-- @/iSamples/Member/Content_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '286afa0d-53f5-493f-984f-03ddc527f2a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8590383-ff0b-4f58-8dd3-1ab70af8d740' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '286afa0d-53f5-493f-984f-03ddc527f2a8' 
go

-- @/Shared_Content/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4997bc76-4347-46a5-9665-12d1648b130b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e5d28f7-b8b4-4776-8d77-1aef4ad775c5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4997bc76-4347-46a5-9665-12d1648b130b' 
go

-- @/iSamples/Mobile/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e71e6a1-d2ea-45e1-964d-883c61c6b7a3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d7cd820-b6a0-405f-862e-1ba2dfc594c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e71e6a1-d2ea-45e1-964d-883c61c6b7a3' 
go

-- @/iSamples/Mobile/Contact_Management/Create_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd022c5a2-259e-4cfe-8db9-ae5723146dd2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c1d07cc-fdb2-40b0-8c2a-1baad1a37076' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd022c5a2-259e-4cfe-8db9-ae5723146dd2' 
go

-- @/iSamples/Member/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03150a9f-d3e4-445f-ad37-142e2e86754d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9ec0074-0506-4f54-b72e-1c95dc5a6c1c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '03150a9f-d3e4-445f-ad37-142e2e86754d' 
go

-- @/iCore/Tagged_Content/News/Don_t_get_Caught_off_guard_by_new_Regulations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd032ff8-29d4-42a4-9de4-3611ee4c0000' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06d49b37-c0e1-42ef-9d53-1cc5ab008aec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd032ff8-29d4-42a4-9de4-3611ee4c0000' 
go

-- @/iCore/Contacts/ContactLayouts/Giving_History_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f8af1d7-6f1f-4eaf-93e1-c944f8a9a5fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8500959-b2f9-4cdb-b8f8-1cf96649f1ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3f8af1d7-6f1f-4eaf-93e1-c944f8a9a5fe' 
go

-- @/iCore/Fundraising/Expected_payments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28123094-fed1-4216-8acc-9875668aebbb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8528df2b-9d78-45e8-b4af-1d96b07101c1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28123094-fed1-4216-8acc-9875668aebbb' 
go

-- @/iSamples/Mobile/News/The_world_of_computing_is_changing_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a47dbe0-7a9b-482b-87fd-aaebb31313a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16028a1f-84a4-4824-a95f-1edf0cee2911' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4a47dbe0-7a9b-482b-87fd-aaebb31313a5' 
go

-- @/iCore/Staff_Dashboards/Events_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '29a0a50a-3127-4537-b387-34cbf45900d4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2eb37148-bd2f-4ae2-9419-1f00ad6c74e7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '29a0a50a-3127-4537-b387-34cbf45900d4' 
go

-- $/ContentManagement/DefaultSystem/Websites/Core Sites/Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f17da775-6157-41cb-b721-3a07cc49777a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4243d9e2-e91e-468c-97c2-2046d70c1e1a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f17da775-6157-41cb-b721-3a07cc49777a' 
go

-- @/iSamples/AnnualConferenceMobile/Attendees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a2cb6c9-3170-46a7-baa3-a616a4fa6dc4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '559e02a1-9390-49b6-b746-217c5b9f561b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1a2cb6c9-3170-46a7-baa3-a616a4fa6dc4' 
go

-- @/iSamples/AnnualConference/Upcoming_Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3cf61467-5b40-426f-83bf-bf9aef23e94c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3d13261-8be5-4b96-baa4-2236e6959e4c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3cf61467-5b40-426f-83bf-bf9aef23e94c' 
go

-- @/iSamples/Donor/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8748f88d-fb1c-4d3a-9276-0d42d94d528c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7cb09cb-b9ea-426b-8d19-24388ca67a34' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8748f88d-fb1c-4d3a-9276-0d42d94d528c' 
go

-- @/iCore/Communities/BlogDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de0f0000-f0c7-4048-8e63-79af1e997fed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '086b46a1-cd35-48d8-9109-2599313a2c3c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de0f0000-f0c7-4048-8e63-79af1e997fed' 
go

-- @/iCore/Contacts/Create_Account_no_Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '339236b3-f2ec-497c-bce6-b86cfb81e1a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '339236b3-f2ec-497c-bce6-b86cfb81e1a5' 
go

-- @/iCore/Contacts/ContactLayouts/AccountPage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c753d30c-58ae-4927-a2e8-f8526613f508' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c753d30c-58ae-4927-a2e8-f8526613f508' 
go

-- @/iCore/Contacts/ContactLayouts/Staff/Tabs/1Participation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12c5d7ea-0cc1-41ab-84ba-5a7e8a202506' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98ca3c60-fde2-4597-867c-283e33dc25a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '12c5d7ea-0cc1-41ab-84ba-5a7e8a202506' 
go

-- @/iCore/Contacts/ContactLayouts/AboutMe
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7699139f-fbbb-4878-804a-72403878b5f1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eee11a3b-f250-4875-93c7-28ee5d69badc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7699139f-fbbb-4878-804a-72403878b5f1' 
go

-- @/iSamples/AnnualConference/Exhibits
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89c04ae2-3f35-4634-9387-1f4a6727a873' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d068c6d-93c4-418b-9904-2965c639e119' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89c04ae2-3f35-4634-9387-1f4a6727a873' 
go

-- @/iCore/Fundraising/Import_Standing_Order_payment_file
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2675efb-8bc2-4c0c-a65a-3017af94a31d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8a20014-5fd3-49ae-bee5-29aff2dbe132' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd2675efb-8bc2-4c0c-a65a-3017af94a31d' 
go

-- @/iSamples/Member/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8a07f64f-e049-4402-9a31-232c474342ff' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '22374b4a-69a6-4f99-808e-29b639c4cff2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8a07f64f-e049-4402-9a31-232c474342ff' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16dcddc6-1b57-4f8b-894f-241d6ba2a7f8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39f81cdd-5294-46a8-95f7-2aed7f92f52d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '16dcddc6-1b57-4f8b-894f-241d6ba2a7f8' 
go

-- @/iCore/Communities/ForumDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c91f287-0b5a-426a-ac48-5c3bff29cbf2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed1c0843-b946-4dcb-8cbb-2be5027c8fe2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c91f287-0b5a-426a-ac48-5c3bff29cbf2' 
go

-- @/iCore/Fundraising/Recurring_donation_commitment
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1dd3ae9a-d453-40ba-b52a-dfa82b164aca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd4accdf-a4cf-49f7-a6dc-2c9feef5fe2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1dd3ae9a-d453-40ba-b52a-dfa82b164aca' 
go

-- @/iSamples/AnnualConference/Program
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f7accc7d-1eaa-4062-b53b-867b68d1e561' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c1e4335-4536-4341-88c9-2d3ab2dd63df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f7accc7d-1eaa-4062-b53b-867b68d1e561' 
go

-- @/iCore/Events/Function_Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e09b91e-533e-4008-8c4f-dfc492141f5a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e09b91e-533e-4008-8c4f-dfc492141f5a' 
go

-- @/iCore/Contacts/ContactLayouts/Giving_History
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd4f41d8-363c-4600-81cb-e46e9d8d6d17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25356a69-9951-4081-8809-3069c3146ea8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dd4f41d8-363c-4600-81cb-e46e9d8d6d17' 
go

-- @/iSamples/Member/Join_Now_Associate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f539ee2-ece4-48ca-b429-e635e531df25' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0da1a19-9360-4eb1-b070-30bb3f436061' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5f539ee2-ece4-48ca-b429-e635e531df25' 
go

-- @/iCore/AdminConsole/ReportingConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5050a241-1a0e-4dcb-86b9-e03b7317da40' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d867bf8-894f-4d3f-9e01-314416aaf97a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5050a241-1a0e-4dcb-86b9-e03b7317da40' 
go

-- @/iSamples/Member/My_Groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '588fc18b-e2a1-4768-8c7b-781d9f6fb608' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9b84ffe-9170-4cf5-9e0e-325cc11e773d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '588fc18b-e2a1-4768-8c7b-781d9f6fb608' 
go

-- @/iCore/Contacts/ContactLayouts/Staff/Tabs/0About_Me_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '90f49cde-0132-43ae-bdd4-3141b402da04' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34170dbb-b90d-47ef-ae06-32bd8e95ee41' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '90f49cde-0132-43ae-bdd4-3141b402da04' 
go

-- @/iSamples/Member/Spring_Conference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f026426c-2a33-4f9b-997b-de9ee6eefe2b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df97c96c-8e97-4a2f-a9bd-32c6560920a7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f026426c-2a33-4f9b-997b-de9ee6eefe2b' 
go

-- @/iSamples/Mobile/Contact_Management/My_Participation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6dd3a8d7-23b4-490a-a495-7329418b29b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a77870fb-0b47-4e04-90b3-345f2487f239' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6dd3a8d7-23b4-490a-a495-7329418b29b0' 
go

-- @/iCore/Tools/Package_Installer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '888a435c-9d56-4a0a-98fb-c0f2eec9b070' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cac4d0f-3098-4db3-822d-3769e72c48c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '888a435c-9d56-4a0a-98fb-c0f2eec9b070' 
go

-- @/iSamples/AnnualConference/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '626ad0fb-643e-4f7c-828e-7e007a084654' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6630c1e9-bbf4-4ccd-b62d-3846d4894d9b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '626ad0fb-643e-4f7c-828e-7e007a084654' 
go

-- @/iSamples/AnnualConference/Registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da21b453-4dc8-43a0-95e9-878cd147ff23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6e761e7-04fc-42df-a836-385e11706c3d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'da21b453-4dc8-43a0-95e9-878cd147ff23' 
go

-- @/iCore/Contacts/CreateOrganization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb208b57-e190-4861-95d6-58b7a6bafb2c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa487543-2d58-403b-bdc2-39e9ebc7e423' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb208b57-e190-4861-95d6-58b7a6bafb2c' 
go

-- @/iCore/Tools/Friendraising_Settings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd173ce0-429d-4586-aae2-f9b5bde69042' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f6ac62a-7fba-4d1b-84fc-39efdb235fa0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fd173ce0-429d-4586-aae2-f9b5bde69042' 
go

-- @/iCore/Staff_Dashboards/Guided_Performance_Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d452f6c-c0f7-474f-ab3c-de1474fd9777' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49e6bcf9-8754-4db9-8d22-3a01e2fd1f1a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d452f6c-c0f7-474f-ab3c-de1474fd9777' 
go

-- @/iSamples/AnnualConferenceMobile/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '698f2b32-561a-429a-b70a-7b09af0d4ba8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15a9a0d2-8c28-425f-8c9d-3abbd660982d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '698f2b32-561a-429a-b70a-7b09af0d4ba8' 
go

-- @/Shared_Content/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff4c141d-187e-4553-882a-7e21c490d203' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28da02c6-4f61-43a0-9235-3b891ddff0d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff4c141d-187e-4553-882a-7e21c490d203' 
go

-- @/iSamples/Mobile/Fundraising/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c9814927-0e5a-434e-85c7-b9ea9926e995' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6350489e-1c3d-429d-94d0-3d3872613ede' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c9814927-0e5a-434e-85c7-b9ea9926e995' 
go

-- @/iSamples/Member
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e09add53-e00c-42f4-9be8-6df67d19ad3c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08a3fe7b-e857-4d4c-bf05-3d51ae747071' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e09add53-e00c-42f4-9be8-6df67d19ad3c' 
go

-- @/iCore/Contacts/OrganizationLayouts/Organization_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e12de720-9d36-42ca-a733-80b215b648ed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e12de720-9d36-42ca-a733-80b215b648ed' 
go

-- @/iCore/Communities/CommunitiesList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '77a541f5-24d3-4fa6-bb69-1da15eab7a23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20f87707-7aab-4bc5-8106-40dbe3c29d89' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '77a541f5-24d3-4fa6-bb69-1da15eab7a23' 
go

-- @/iSamples/Mobile/News_For_Mobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e91c421b-8782-4d03-a599-c1c3be77a31f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a39361f-65c5-436d-9d16-40f13504cce9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e91c421b-8782-4d03-a599-c1c3be77a31f' 
go

-- @/iCore/Tools/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50e81164-99fc-4ab3-8ac7-b2ecae0179b9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '486f02d0-a395-48cf-956e-41abfbea6679' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50e81164-99fc-4ab3-8ac7-b2ecae0179b9' 
go

-- @/Shared_Content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc6cc859-ab25-4473-b3e3-b7b58e42bfca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'efe97b35-4bae-4734-aa8f-41bb41a9fbab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fc6cc859-ab25-4473-b3e3-b7b58e42bfca' 
go

-- @/iCore/Tools/Friendraising_Mappings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b536e79e-0d46-4e78-a322-9c96cf74cc6a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9becf0c-3750-4cd7-819f-420343c9a43f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b536e79e-0d46-4e78-a322-9c96cf74cc6a' 
go

-- @/iSamples/Donor/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37009773-4d79-44fc-b971-b48cf5236469' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '605be573-a706-4316-9aeb-456cdb1b8c3f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '37009773-4d79-44fc-b971-b48cf5236469' 
go

-- @/iCore/ProcessManager/Edit_Opportunity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07bdefdc-cf01-4c48-ae09-19da42740fc7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6686bd23-b86a-43da-9e45-47e5ce83d4f4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07bdefdc-cf01-4c48-ae09-19da42740fc7' 
go

-- @/iCore/Contacts/Authentication_User_Creation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25396bf0-d28e-45d1-b5ec-654d392eeefc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '03a6560f-4ca4-4fbc-962b-49d627e92461' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '25396bf0-d28e-45d1-b5ec-654d392eeefc' 
go

-- @/iSamples/AnnualConference/Maps
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0439b168-cab3-4a46-bc17-7d03e3306c5b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49064c13-ef93-495b-91bb-4a0885258b37' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0439b168-cab3-4a46-bc17-7d03e3306c5b' 
go

-- @/iSamples/Donor/Current_Initiatives
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93150aa7-19de-4e56-be59-3fa50778dd1e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93bec9f1-54f3-4763-9ddb-4a58a7ff37d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '93150aa7-19de-4e56-be59-3fa50778dd1e' 
go

-- @/iSamples/Donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c834670d-eed0-46c8-9ee9-a09d8b1e44ae' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e05ba4be-14c8-4ad0-b864-4a8e81eb0dfb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c834670d-eed0-46c8-9ee9-a09d8b1e44ae' 
go

-- @/iSamples/AnnualConferenceMobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d7d2f3a-e1e3-4863-955c-eda696628907' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3dc3bef4-2520-44d3-89f9-4b9abd0c1b61' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0d7d2f3a-e1e3-4863-955c-eda696628907' 
go

-- @/iSamples/Donor/Leadership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '499104e1-75f1-48f2-8086-c46d5a854939' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a87eaec-7779-4a13-a458-4c6c75dfabf8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '499104e1-75f1-48f2-8086-c46d5a854939' 
go

-- @/iCore/Contacts/ContactLayouts/Account_Page_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b578c639-9104-406b-b71e-318d2dd78a6c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b578c639-9104-406b-b71e-318d2dd78a6c' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6db8d2dc-4019-4ba8-ad17-023b0baab43f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '199ad522-55d2-4c0e-a51b-4e5e3d6eb98a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6db8d2dc-4019-4ba8-ad17-023b0baab43f' 
go

-- @/iCore/Contacts/ContactLayouts/Education_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6075ddba-c2e0-434f-a0e1-ad8d06746461' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a33c718-ab68-47f2-a56e-50a1b7cc3a0c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6075ddba-c2e0-434f-a0e1-ad8d06746461' 
go

-- @/iSamples/AnnualConference/Presentations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bbd00d21-65df-42de-9983-4ca30d2d5858' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97e37366-c625-439b-9776-56452c1652cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bbd00d21-65df-42de-9983-4ca30d2d5858' 
go

-- @/iSamples/Donor/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '952ae8ee-e944-4b6d-961c-9ebd187fb03a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed022066-f7c0-40fb-8079-5706460515fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '952ae8ee-e944-4b6d-961c-9ebd187fb03a' 
go

-- @/iCore/Fundraising/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f644524-55a0-4c67-a584-33d0a6d29367' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb2a3e56-ef20-4107-aa2f-57c118f0084f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4f644524-55a0-4c67-a584-33d0a6d29367' 
go

-- @/iCore/Tools/WorkItemConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9164c98-1651-4f19-8125-bfe78df6bb9d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a64b20a-080e-4f79-9287-5988b74972d8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f9164c98-1651-4f19-8125-bfe78df6bb9d' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityDescription
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f4ba048-f0c6-47b9-90c3-7d08861d8706' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffd73063-5d78-4f4c-818e-5b44fde0e5ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8f4ba048-f0c6-47b9-90c3-7d08861d8706' 
go

-- @/iCore/AdminConsole/Tools_Landing_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e537778d-4931-46f2-b8c8-8f3236c33192' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31214f00-5419-4b8e-8d6c-5c0c7ad6dd45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e537778d-4931-46f2-b8c8-8f3236c33192' 
go

-- @/iSamples/Donor/JoinTheFoundation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb8dabb9-3bdb-4e69-b3ea-e8010cafe0ac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ae27b81-0595-47fe-9161-5c3536db4fff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cb8dabb9-3bdb-4e69-b3ea-e8010cafe0ac' 
go

-- @/iCore/Contacts/AddressMap
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '73d21a4f-a01c-476d-b134-2efed7923897' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ba131962-0478-40b8-9e8e-5cdd6f639913' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '73d21a4f-a01c-476d-b134-2efed7923897' 
go

-- @/iSamples/Member/Join_Now_Regular
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a6c9d6c-307b-4877-be50-b1bdaa335909' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cbc3b01f-05b7-4001-af2f-5d3f67b32a54' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4a6c9d6c-307b-4877-be50-b1bdaa335909' 
go

-- @/iSamples/AnnualConference/Accommodations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '719bd42a-f375-4f41-83ce-ed8e295d09c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf55cfbd-1f05-4657-8e0e-5e27dd6c07be' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '719bd42a-f375-4f41-83ce-ed8e295d09c5' 
go

-- @/iSamples/Mobile/Fundraising/Gift_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce8962fa-3b6a-4772-be17-cd876d480ee3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5855c6c2-1281-4e53-aa2c-608f1bc1b790' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ce8962fa-3b6a-4772-be17-cd876d480ee3' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82c96822-8649-42ab-999f-a84d7322c021' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2723f4b3-83a5-4374-902f-62d3a38800cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '82c96822-8649-42ab-999f-a84d7322c021' 
go

-- @/iCore/Fundraising/Gift_aid_reclaim
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e990141e-702e-40f3-b22a-ebfb731e1a9b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c814754-1bcb-4241-92f3-63f1b7575042' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e990141e-702e-40f3-b22a-ebfb731e1a9b' 
go

-- @/iCore/Tagged_Content/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c72edca3-0aee-4ccd-9815-e0686e725e80' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '160166a3-e437-47bd-9354-66446d3b2267' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c72edca3-0aee-4ccd-9815-e0686e725e80' 
go

-- @/iSamples/AnnualConferenceMobile/My_itinerary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '671fa59c-286a-403f-916d-6cb7f2849c20' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98de4f30-08fa-4083-b94a-67f2ce5fdab0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '671fa59c-286a-403f-916d-6cb7f2849c20' 
go

-- @/iSamples/Mobile/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '18f8b9ad-8c17-4e35-8a4e-1c752f0a7881' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb61179f-9ff3-4971-9318-68952acbaa61' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '18f8b9ad-8c17-4e35-8a4e-1c752f0a7881' 
go

-- @/iSamples/Member/About
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3444d649-4ab3-46c7-a492-d9b0f7b821a2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '544de5c9-25e0-470c-850e-6a15317ff9a2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3444d649-4ab3-46c7-a492-d9b0f7b821a2' 
go

-- @/iCore/Contacts/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '301bce41-7cc9-4633-b727-869e6dad4c98' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '849db2b5-0548-41cd-9198-6c04b9e0e2cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '301bce41-7cc9-4633-b727-869e6dad4c98' 
go

-- @/iCore/Contacts/ContactLayouts/Staff/Tabs/3Fundraising_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b02ed88-b197-4679-813e-2f78e5942c18' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1920ca8a-9560-4506-990f-6e45986955f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3b02ed88-b197-4679-813e-2f78e5942c18' 
go

-- @/iCore/Staff_Dashboards/Fundraising_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '87c4497c-eec4-40d9-9774-d1d59b417147' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb383087-3ee7-4e3e-b805-70c7495aee4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '87c4497c-eec4-40d9-9774-d1d59b417147' 
go

-- @/iSamples/Member/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6213d6b-5fb1-42ce-9f48-ff1a4a79d276' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b432742-f2cf-4acb-98d2-71b6b420495f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a6213d6b-5fb1-42ce-9f48-ff1a4a79d276' 
go

-- @/iSamples/AnnualConference/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c3f696d-38d4-4608-b21b-1e6a2c65bd7b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db2c712e-c77d-4378-9eff-71cabf5ab60a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8c3f696d-38d4-4608-b21b-1e6a2c65bd7b' 
go

-- @/iCore/Contacts/Organization_search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2359d9a4-7305-4cbc-aa50-9b6f3ac8a8d4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08505cf8-dd9c-48d4-9daf-71d18419d89f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2359d9a4-7305-4cbc-aa50-9b6f3ac8a8d4' 
go

-- @/iCore/Store/StoreLayouts/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46c7d27b-57ad-4258-847a-8ac79dee7b37' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '46c7d27b-57ad-4258-847a-8ac79dee7b37' 
go

-- @/iCore/Communities/WikiList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ab6c3e4-b757-40d0-838c-a0e7d0f50e52' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b738e07-e61e-43e1-a8e4-75071ca430a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7ab6c3e4-b757-40d0-838c-a0e7d0f50e52' 
go

-- @/iCore/Contacts/Create_Contact_Person_or_Org
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e8bb6d8-f7e6-491c-8696-1e55573e9221' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3229d460-e1ed-4a09-9dc4-7638ca7f6807' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e8bb6d8-f7e6-491c-8696-1e55573e9221' 
go

-- @/iCore/DefaultStaff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1077c16d-10ce-4801-a715-e9f8b25b0f5e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac59b8ec-3748-4ac9-a48f-769e43ab6a62' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1077c16d-10ce-4801-a715-e9f8b25b0f5e' 
go

-- @/iCore/Fundraising/Ways_to_Give
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54e8a24c-c78a-4586-adc0-93b84d2df926' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '54e8a24c-c78a-4586-adc0-93b84d2df926' 
go

-- @/iCore/Staff_Dashboards
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af65e668-bfae-4bac-94d3-d3c545fcadbb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '970e64df-f4c6-46d5-a303-7706d77bf612' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af65e668-bfae-4bac-94d3-d3c545fcadbb' 
go

-- @/iSamples/AnnualConference/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef850a72-7504-4fec-bab6-5f0a6fc06999' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef27e5a7-34d3-4739-9491-773080c103a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef850a72-7504-4fec-bab6-5f0a6fc06999' 
go

-- @/iSamples/AnnualConference/Venue
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79f58826-09ff-4b1e-90e4-fb446545af97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f903addf-b9b6-44ae-aa3d-77f2710da553' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '79f58826-09ff-4b1e-90e4-fb446545af97' 
go

-- @/iCore/Contacts/OrganizationLayouts/Overview
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91b21720-1c76-4a4e-8f62-109435d6f40f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dfb18597-2c00-4f10-af0f-784d3b2bcdfd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '91b21720-1c76-4a4e-8f62-109435d6f40f' 
go

-- @/iCore/Fundraising/Landing_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78ba1cf2-4ed9-41b5-b485-34d21d186542' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7777fb0e-94b5-45c4-b5c1-7c31f3c881a2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78ba1cf2-4ed9-41b5-b485-34d21d186542' 
go

-- @/iSamples/Member/MemberHome
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4414bc2-d1ef-40cc-8537-eb1080d69c92' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b014aaf-790e-4999-9b5f-7fcc9e71f65f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e4414bc2-d1ef-40cc-8537-eb1080d69c92' 
go

-- @/iSamples/Donor/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9bbf46a3-44a5-4129-b3ca-c0f9ac746d9b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a0e1ec07-a086-46e4-8fff-81e17df7a237' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9bbf46a3-44a5-4129-b3ca-c0f9ac746d9b' 
go

-- @/iSamples/AnnualConference/Product_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c1dbae6-6e00-4997-8aaa-92cc5f372a59' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2adcdb59-944b-42c7-9e53-8264532dedeb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8c1dbae6-6e00-4997-8aaa-92cc5f372a59' 
go

-- @/iCore/Content/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fe8531f-2b1b-4768-a795-04ef00d7784f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2fe8531f-2b1b-4768-a795-04ef00d7784f' 
go

-- @/iSamples/AnnualConferenceMobile/Venue
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02f93698-07e1-4480-a072-2dc054aa25ca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c3ed4fc-59c1-4560-885a-83d5f44ef324' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '02f93698-07e1-4480-a072-2dc054aa25ca' 
go

-- @/iSamples/Member/My_Communities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd94a6e7e-f08d-4753-ab5f-5668e3a9bb83' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ebb1889-4733-486c-b7a0-846c42c8d53e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd94a6e7e-f08d-4753-ab5f-5668e3a9bb83' 
go

-- @/iCore/Communities/BlogList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4ccb1b91-fa4b-4230-adfa-954859852b3e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '605c94b0-4285-4462-a390-8491b07adf0f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4ccb1b91-fa4b-4230-adfa-954859852b3e' 
go

-- @/iSamples/Mobile/Store/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37654356-2681-41d8-94f8-a4e6dbe44993' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6fefcd2-92e0-4553-9475-84ed9731efad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '37654356-2681-41d8-94f8-a4e6dbe44993' 
go

-- @/iCore/Communities/BlogArchive
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c8824a4-9871-4a6e-8c54-6a324eb54d48' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33b73ca1-0f7e-4caa-90ac-859ec47750d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c8824a4-9871-4a6e-8c54-6a324eb54d48' 
go

-- @/iSamples/Donor/Corporate_Partnerships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2fff45b4-eeb3-4e14-8554-9780c6e69325' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2fff45b4-eeb3-4e14-8554-9780c6e69325' 
go

-- @/iSamples/Donor/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5172f82f-bd80-4381-ba78-2bfd4c84a741' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7b6cb29-bd00-43f4-8171-86ca6f34aea9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5172f82f-bd80-4381-ba78-2bfd4c84a741' 
go

-- @/iSamples/Donor/Financial_Information
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e0a63de-ebbd-4350-a1b7-e6124df859d0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fdd3205-d03a-4391-92e5-86fea43bf7b1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7e0a63de-ebbd-4350-a1b7-e6124df859d0' 
go

-- @/iCore/Contacts/OrganizationLayouts/Demographics
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ad43841-9843-4314-b30c-5029069cbefb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '927ac80c-9a95-4567-8dfb-871fba5d7a1f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ad43841-9843-4314-b30c-5029069cbefb' 
go

-- @/iSamples/Member/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd374bcb0-5ab8-4028-a775-96299a44a2b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e0ecbc9-a2a2-407c-93e8-8757d5c64f97' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd374bcb0-5ab8-4028-a775-96299a44a2b7' 
go

-- @/iSamples/AnnualConference/Event_blog
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af331067-dfa0-4343-94f1-0419dc1230ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a2883b4-1b20-4584-87a6-87ecbc11ff87' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af331067-dfa0-4343-94f1-0419dc1230ad' 
go

-- @/iSamples/Member/ContentAreas/Home_Page_Full_Width_Area
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '56ef8671-9076-4c74-a631-c16d1bfb116d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f172065f-3992-4afd-9390-89a573a6de4c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '56ef8671-9076-4c74-a631-c16d1bfb116d' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityPostSummary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f5d4249-bc2e-4aa5-b173-a03a1112f9db' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5f5d4249-bc2e-4aa5-b173-a03a1112f9db' 
go

-- @/iSamples/Mobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'be5935a8-19ff-48e4-9aed-3095faa70907' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7cd4e3fb-2515-4255-9a80-8f59b18dc593' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'be5935a8-19ff-48e4-9aed-3095faa70907' 
go

-- @/iSamples
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4760be4b-fe46-45b0-82c7-8a48fa290bf5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2636677-4132-4c0b-8217-8fabd862495e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4760be4b-fe46-45b0-82c7-8a48fa290bf5' 
go

-- @/iCore/Fundraising/Manage_Donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0f4ba4d5-892f-4f58-a0eb-c554d9524d84' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d9c8de1-0384-4d9f-8d79-9004c78adcbc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0f4ba4d5-892f-4f58-a0eb-c554d9524d84' 
go

-- @/iSamples/Member/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c5ca946-2a6b-4908-bfe0-4592cb661d5d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0b42e03-6af0-473a-bc4c-903f7608b021' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c5ca946-2a6b-4908-bfe0-4592cb661d5d' 
go

-- @/iSamples/Mobile/Contact_Management/Organization_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21013a83-2ddd-44ad-9b4f-53f317752ec7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1341e64c-e409-4f8b-8863-93bc593e916b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '21013a83-2ddd-44ad-9b4f-53f317752ec7' 
go

-- @/iCore/Store/Product_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c498fe36-a52e-48ec-bc26-751c8276a460' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6066a460-b09a-444d-91e7-93e98db225d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c498fe36-a52e-48ec-bc26-751c8276a460' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47b81e82-1166-41de-8747-ce0b20413b3e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '510dc7fb-f9ea-40d4-bb38-93f526421155' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '47b81e82-1166-41de-8747-ce0b20413b3e' 
go

-- @/iSamples/Donor/WhoWeAre
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89f25e17-526c-407a-b16b-4af18608095f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eac2c486-9da0-4533-8341-94e24a683039' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89f25e17-526c-407a-b16b-4af18608095f' 
go

-- @/iCore/AdminConsole/Configuration_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cea5a618-63de-4308-b6aa-bd24db063afc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62d59885-db4b-4747-91a3-95a98030780a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cea5a618-63de-4308-b6aa-bd24db063afc' 
go

-- @/iCore/Fundraising/Moves_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6220d5a9-c72b-45f4-87d3-33f38f9931c9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c67fc8d1-12af-49ee-a92e-97ebe94d6ca0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6220d5a9-c72b-45f4-87d3-33f38f9931c9' 
go

-- @/iCore/Communities/ParticipantList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f382be9f-6bd0-4268-b03b-3d920bd2e247' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84089ea5-2e78-4683-83ac-98aa7aacb241' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f382be9f-6bd0-4268-b03b-3d920bd2e247' 
go

-- @/iCore/Staff_Dashboards/Commerce_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '392c7682-73b3-4ec5-8154-40501243bbc3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '392c7682-73b3-4ec5-8154-40501243bbc3' 
go

-- @/iSamples/Donor/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9adfb387-83c8-409a-be0e-dcdee9d6ce4a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fca85baa-6966-4761-b791-9aa2b216c4fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9adfb387-83c8-409a-be0e-dcdee9d6ce4a' 
go

-- @/iCore/AdminConsole/AccountingLandingPage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '41cd8a7f-f85c-42da-910f-2e829b4eceae' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9961d654-d31e-4309-9b17-9c108ef7ec88' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '41cd8a7f-f85c-42da-910f-2e829b4eceae' 
go

-- @/iSamples/Mobile/Event_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c852820-3fb5-4f70-8d9e-9b3b47124609' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c852820-3fb5-4f70-8d9e-9b3b47124609' 
go

-- @/iCore/Events/Events_List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0cc8c805-a6d5-4acc-aa2b-b9a2ae572b1f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7c02c1f-efcc-4a9a-b4bc-9f9afadebf03' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0cc8c805-a6d5-4acc-aa2b-b9a2ae572b1f' 
go

-- @/iSamples/Mobile/Contact_Management/Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd58aff0c-4995-4a7d-ac2d-fde5fb47291c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e207dcd-e714-4e1e-8882-a047e26ccf58' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd58aff0c-4995-4a7d-ac2d-fde5fb47291c' 
go

-- @/Shared_Content/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f845d9a3-9584-4a51-8b47-670d2c8bd731' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd3ff3ee-8578-40fe-8c8b-a04fa1a51fa8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f845d9a3-9584-4a51-8b47-670d2c8bd731' 
go

-- @/iSamples/AnnualConferenceMobile/Social_activities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f78fffcf-6845-4093-8cfa-296391dcbba9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db546da9-9ac7-48ad-bb1a-a158d82f648c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f78fffcf-6845-4093-8cfa-296391dcbba9' 
go

-- @/iCore/Communities/TopicDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '233b7d91-3ca9-4014-b419-8932f366e350' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '460b2349-b498-4739-b2ee-a1f7955e84f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '233b7d91-3ca9-4014-b419-8932f366e350' 
go

-- @/iCore/Reporting_Services_Samples/Membership_Pie_Chart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5be5063b-ed86-4c8f-b3b8-79f732c148a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1b3419f-8b9a-40bf-af97-a45aaca9d626' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5be5063b-ed86-4c8f-b3b8-79f732c148a5' 
go

-- @/iCore/Events/Function_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddb38e5a-2288-4751-9de3-d1b3a2f4a30e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ddb38e5a-2288-4751-9de3-d1b3a2f4a30e' 
go

-- @/iSamples/Mobile/News/Record-Breaking_NiUG_Conference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5da40528-714b-4b8c-9d84-fc71b6f77a10' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd6e4709a-5fa0-4b56-9521-a66cc05a5f97' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5da40528-714b-4b8c-9d84-fc71b6f77a10' 
go

-- @/iSamples/Member/Benefits
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74dd307e-e4be-41ec-a273-ab822fe14395' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '74dd307e-e4be-41ec-a273-ab822fe14395' 
go

-- @/iSamples/Mobile/Contact_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f771899f-2eda-4731-a753-35d4d7b9cc59' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9c99ea8-8911-4e57-b34a-a7ff19eff635' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f771899f-2eda-4731-a753-35d4d7b9cc59' 
go

-- @/Shared_Content/ContactManagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf020aef-b474-4a45-bb01-0b2df0f0b898' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a57a1b4-f0ab-4507-ab60-aa899abc67c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cf020aef-b474-4a45-bb01-0b2df0f0b898' 
go

-- @/iSamples/AnnualConference/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a12d0d17-80aa-4782-9acd-dbfe4dcd9c4a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5095780d-83d1-481e-bf4e-ac082ec1cf93' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a12d0d17-80aa-4782-9acd-dbfe4dcd9c4a' 
go

-- @/Shared_Content/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52a36652-80d3-4926-9c95-32cafeac311f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd26b7490-ada4-42a5-88e8-b0692a4bcbc1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '52a36652-80d3-4926-9c95-32cafeac311f' 
go

-- @/iSamples/Mobile/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44a47dd4-c693-4936-a719-d1f04c8a50d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ba9ce46-d616-4131-843b-b501a846e831' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '44a47dd4-c693-4936-a719-d1f04c8a50d8' 
go

-- @/iCore/Staff_Dashboards/Guided_Performance_Scorecard/Guided_Performance_Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f5b0664-9e2e-4951-8f71-39f95da64a39' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15587ef4-dfd1-4601-a853-b60a9bcb79b8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9f5b0664-9e2e-4951-8f71-39f95da64a39' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityNewsFeed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7bf8fcb2-4d43-488f-a31e-70951ce1c425' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98a98b8f-c33b-400a-8e81-b6708dbf8225' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7bf8fcb2-4d43-488f-a31e-70951ce1c425' 
go

-- @/iCore/Communities/ForumList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2025ea15-dae1-4469-855f-cf2026b84016' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8503f8d-d076-44e0-9d5c-b70e1814e18a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2025ea15-dae1-4469-855f-cf2026b84016' 
go

-- @/iSamples/AnnualConferenceMobile/Program_sessions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28094b0c-a484-4579-8827-e4d203b33667' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e65c73af-6a0a-4ad2-97af-b951962de762' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28094b0c-a484-4579-8827-e4d203b33667' 
go

-- @/iCore/AdminConsole/Home_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7d8d220c-1f95-4fd7-81af-43490bd1a95f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ae1abaa-041b-4ca6-8fbb-ba7f3d445707' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7d8d220c-1f95-4fd7-81af-43490bd1a95f' 
go

-- @/iSamples/AnnualConference/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db699cd2-082d-4c9c-b7df-ee328812884c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '934e6c1f-bc7c-4fd6-b7de-bbb2e44f825c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'db699cd2-082d-4c9c-b7df-ee328812884c' 
go

-- @/iCore/Store/StoreLayouts/Item_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc90a6aa-dc71-4f3c-a98d-9ea16ca14b9c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc90a6aa-dc71-4f3c-a98d-9ea16ca14b9c' 
go

-- @/iCore/Tagged_Content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de88f999-69f9-4319-ab7b-abfa2729cca3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45f28032-0fa4-41e7-bb44-bc775c21990c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de88f999-69f9-4319-ab7b-abfa2729cca3' 
go

-- @/iCore/Communities/EntryDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd49a79f-ec73-40f8-a7b4-0dc60a764705' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '172a10cf-f2da-44ad-95dc-bd1540f33b43' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd49a79f-ec73-40f8-a7b4-0dc60a764705' 
go

-- @/iSamples/Donor/Colleges_Initiatives
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e715b36d-ecea-4a95-9381-e71f7e51e1fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '374d9882-3eae-46be-8f49-be59b5c258ba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e715b36d-ecea-4a95-9381-e71f7e51e1fb' 
go

-- @/iCore/Contacts/OrganizationLayouts/Account_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a74a3004-420e-4cbd-b1e2-9badaed369f6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd67d49aa-3691-4b32-856b-befd670c6001' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a74a3004-420e-4cbd-b1e2-9badaed369f6' 
go

-- @/iSamples/Member/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '399f0f4f-668b-4f38-83c4-67bd418dc02e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b2fd3549-9df9-4188-8651-c0312e4f3949' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '399f0f4f-668b-4f38-83c4-67bd418dc02e' 
go

-- @/iCore/Contacts/People_search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49a878a5-5b78-464f-bb48-af87eceb25c6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0b62d2b-ee20-4470-bca5-c161f05a13a4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '49a878a5-5b78-464f-bb48-af87eceb25c6' 
go

-- @/iCore/Fundraising/Standing_Order_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de6926b4-a4c9-4b54-bb53-2cdfb5f2445b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c1b055e-2575-43c3-a52c-c24d690c7656' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de6926b4-a4c9-4b54-bb53-2cdfb5f2445b' 
go

-- @/iSamples/Mobile/Fundraising/Donation_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38989e55-2732-415a-95f6-cd80da5af139' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4b3c6b0-3c58-477c-b2d9-c269136934b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38989e55-2732-415a-95f6-cd80da5af139' 
go

-- @/iCore/Fundraising/Donate_Now
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '073498d7-304b-4126-9848-137da9b8d1b0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '991d8973-6ade-4ac5-aef3-c34945a8641a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '073498d7-304b-4126-9848-137da9b8d1b0' 
go

-- @/iCore/Fundraising/Gift_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85464bc3-7401-41f1-8de4-521515a40074' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '85464bc3-7401-41f1-8de4-521515a40074' 
go

-- @/iSamples/AnnualConference/Event_Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '350225e8-3d4f-4859-ba92-cd2172d43e26' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad7f7740-4d1a-4899-b009-c555dafc0c6b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '350225e8-3d4f-4859-ba92-cd2172d43e26' 
go

-- @/iCore/Communities/CommunityPreferences
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fa2b871-ce12-47d2-98e7-317ad585769d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5f4c373-4920-4f46-b3cc-c7c37058fba3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0fa2b871-ce12-47d2-98e7-317ad585769d' 
go

-- @/iSamples/Donor/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9673166-9879-4f3e-904a-02840bbb2386' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9417f4c0-df7e-4a8c-95b0-c96238531d79' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a9673166-9879-4f3e-904a-02840bbb2386' 
go

-- @/iCore/Contacts/ContactLayouts/My_Participation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44bbe17c-4178-4a92-8385-670cf8f9322a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93b0d127-0251-4fab-9121-cb109f0f7db6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '44bbe17c-4178-4a92-8385-670cf8f9322a' 
go

-- @/iCore/Staff_Dashboards/Contacts_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64c237f5-0703-47e5-ae76-faa72df3f3fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '61a1bac3-ea70-444f-8b0f-cf94dc0aca01' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64c237f5-0703-47e5-ae76-faa72df3f3fe' 
go

-- @/iSamples/Donor/Legislative_Outreach
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d3fa079-540a-47e7-8508-0deba2be8193' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffed34a0-3a19-402f-bdcb-d0518663d92e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d3fa079-540a-47e7-8508-0deba2be8193' 
go

-- @/iCore/Communities/CommunitySecurity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6b68862-4da6-4159-985f-b2b8654eac07' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '978488b8-993f-443f-b990-d05cd47681b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e6b68862-4da6-4159-985f-b2b8654eac07' 
go

-- @/iSamples/Mobile/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d33ba7b-ea5b-4710-a8d6-e00689cf6a29' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d2615fb-f261-4c52-a102-d0650e5af782' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d33ba7b-ea5b-4710-a8d6-e00689cf6a29' 
go

-- @/iCore/Reporting_Services_Samples/Member_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '76abbef4-154b-4e90-a5a8-39b66bd9f7a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80fb6366-06b3-4772-8197-d0a9a7847ecf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '76abbef4-154b-4e90-a5a8-39b66bd9f7a9' 
go

-- $/ContentManagement/DefaultSystem/Websites/Admin
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '944a9b9d-9209-4015-adc9-eb1168a2618b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd30229f1-d53b-48d7-99ae-d0ce9fea621d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '944a9b9d-9209-4015-adc9-eb1168a2618b' 
go

-- @/iSamples/Donor/WhatWeDo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9e69dc44-9b37-4334-8950-061a99307eff' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62683f6e-e417-4953-8fa1-d0fd0dafb0a6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9e69dc44-9b37-4334-8950-061a99307eff' 
go

-- @/iSamples/AnnualConference/Sponsors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5b90ed9-cba2-47a9-bf59-d1aa5fff5f5c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2828e2a6-e3d8-4738-9261-d176ee9ead57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5b90ed9-cba2-47a9-bf59-d1aa5fff5f5c' 
go

-- @/iSamples/Member/Management_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3916f189-6a5e-4c4e-b4fe-76a3f6664021' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '018ad1bc-ae61-4bec-b241-d2adb32995e2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3916f189-6a5e-4c4e-b4fe-76a3f6664021' 
go

-- @/iCore/Privacy_Policy
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91b3b629-01e1-4382-af15-031fec5354ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1af531e-9524-4b73-bd47-d4c9855a33c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '91b3b629-01e1-4382-af15-031fec5354ab' 
go

-- @/iSamples/Member/Featured_Forums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da6d39e0-e2b4-4070-8436-b31220834558' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f96d202-4cb1-4449-ba81-d60c2467b899' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'da6d39e0-e2b4-4070-8436-b31220834558' 
go

-- @/iCore/Contacts/Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bdb865ee-27b8-459b-aa34-94d6feb80914' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bdb865ee-27b8-459b-aa34-94d6feb80914' 
go

-- @/iSamples/Member/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ed8e036-b510-47e5-bce5-4caa86fa9c11' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64d3e272-25ec-4a51-b55d-d6c69cbf3865' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ed8e036-b510-47e5-bce5-4caa86fa9c11' 
go

-- @/iSamples/Mobile/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d4e988d-a7d2-45db-9c8b-58c9de662f88' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6fc06e7-0bfb-408f-8ffd-d82e3ca14c4f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3d4e988d-a7d2-45db-9c8b-58c9de662f88' 
go

-- @/iCore/Events/Events_Calendar
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5d549004-4781-448f-bdc4-581570ef326b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb51b544-f166-40bf-9459-d83945aa48b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5d549004-4781-448f-bdc4-581570ef326b' 
go

-- @/iSamples/Mobile/Contact_Management/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aeff5bd5-88fc-4b42-ad43-3a41118c55e8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43fe8233-d497-4acb-9a9b-d8b03b63d371' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aeff5bd5-88fc-4b42-ad43-3a41118c55e8' 
go

-- @/iCore/Fundraising/GiveNowTribute
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3888cbc4-371a-41f9-90c4-84bda5d49b1e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '919771b7-e5ad-43ec-9916-d8cdf6640c9c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3888cbc4-371a-41f9-90c4-84bda5d49b1e' 
go

-- @/iCore/Tools/Friendraising_Imports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68032bde-dbc5-43fd-9f6e-bcaaee1baed3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f923d314-33e7-4cb7-baf2-dae3728bf744' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '68032bde-dbc5-43fd-9f6e-bcaaee1baed3' 
go

-- @/iSamples/AnnualConference/Speakers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '333a1881-c1d6-447e-84a8-ce259bd5da97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24d59784-5921-4668-96ed-db096b223012' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '333a1881-c1d6-447e-84a8-ce259bd5da97' 
go

-- @/iSamples/Mobile/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0825d501-aa04-487e-a009-ed8fc7a1d5da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40148302-0a9f-4c29-a651-db2ebf06e91a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0825d501-aa04-487e-a009-ed8fc7a1d5da' 
go

-- @/iCore/Store/StoreLayouts/Order_Confirmation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fbb62a6b-c4aa-4091-8a53-fc1b462ea2d6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '909af5a8-3e03-41be-b428-db552bb8c28e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fbb62a6b-c4aa-4091-8a53-fc1b462ea2d6' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e063e67a-84bd-4779-b87b-b5928481a794' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0266a9cd-d2b4-4a6e-8f69-ddd6c83d6b05' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e063e67a-84bd-4779-b87b-b5928481a794' 
go

-- @/iSamples/Donor/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c88cd190-774b-441d-a918-4dc36d73c7b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a008ff08-341a-448c-b4ef-e0404c3d70b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c88cd190-774b-441d-a918-4dc36d73c7b2' 
go

-- @/iCore/Contacts/ContactLayouts/Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b2f3760-8cb7-42da-a38f-d1d6b9cd5971' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b2f3760-8cb7-42da-a38f-d1d6b9cd5971' 
go

-- @/iCore/Communities/Resource_Library
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4932128-7941-4198-8adf-38cdf7709d54' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4ad69ec6-8b23-47d1-9b9d-e10993ba191e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd4932128-7941-4198-8adf-38cdf7709d54' 
go

-- @/iCore/default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3d9d9f0-b3c5-45c5-8730-4e52af3952fa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a3d9d9f0-b3c5-45c5-8730-4e52af3952fa' 
go

-- @/iSamples/Donor/Get_Involved
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47f0218d-913d-4d37-b25c-0785498219a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '814f9d40-332a-4066-8918-e39af16baef2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '47f0218d-913d-4d37-b25c-0785498219a1' 
go

-- @/iSamples/Member/Chairs_Blog
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8176e6c2-248d-4fd8-a91e-32e06e3c33b9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1978b29a-e017-4a41-8cec-e506c67dfc12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8176e6c2-248d-4fd8-a91e-32e06e3c33b9' 
go

-- @/iCore/Reporting_Services_Samples
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a45e87f-27e3-4e57-ab64-4e162597d8f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '578c5379-a81e-46d4-a73b-e78f1acf688e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2a45e87f-27e3-4e57-ab64-4e162597d8f2' 
go

-- @/iSamples/Member/Join_Now_Student
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '088ee741-7eb5-4921-a98f-8ba076407923' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '263b2505-7ea5-41f9-8148-e7a6b8e3c505' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '088ee741-7eb5-4921-a98f-8ba076407923' 
go

-- @/iSamples/Mobile/Contact_Management/Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1976337f-ad71-43dc-91c2-85826b563bd4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7809fb90-f560-462f-8355-e9a1de3d0c63' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1976337f-ad71-43dc-91c2-85826b563bd4' 
go

-- @/iCore/Contacts/Staff_Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '199397fb-3a94-4431-abfc-90050be396f3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21160ad6-13cb-4919-a4ec-e9f2dc4aed24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '199397fb-3a94-4431-abfc-90050be396f3' 
go

-- @/iSamples/Mobile/Store
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5be2027-1a83-4efb-b3f5-32a4cc3f514e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c39b8fc-1b47-4cc0-9e71-eb8664c1bae5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5be2027-1a83-4efb-b3f5-32a4cc3f514e' 
go

-- @/iSamples/Member/Donate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f05c2380-74f4-4ecd-bfe6-01867dd5a01b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4187ce7f-5ca1-4ba3-922b-ebe259c1f092' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f05c2380-74f4-4ecd-bfe6-01867dd5a01b' 
go

-- @/iSamples/AnnualConferenceMobile/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cdb84d4-ab7c-47ba-9dd4-ba65b69c8f1d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8738f345-08f6-4bf8-a5ac-edaa1336e0ec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4cdb84d4-ab7c-47ba-9dd4-ba65b69c8f1d' 
go

-- @/iSamples/Member/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a552a08-b8ba-4eb7-ab06-8e80bbe9382d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8a1062a-118d-4fce-b1e7-ee74580aafa7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1a552a08-b8ba-4eb7-ab06-8e80bbe9382d' 
go

-- @/iCore/Tagged_Content/News/CIIP_Certification_and_You
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82ba43f9-a08b-48e9-a819-c4984e467d86' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3aee6427-f56d-45b9-8e5b-f02e9b8c57d8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '82ba43f9-a08b-48e9-a819-c4984e467d86' 
go

-- @/iSamples/Mobile/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '266d8d30-35c2-4480-907b-cad8e9e5bbc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ef716f5-87a5-4ec7-a816-f05a47a8445d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '266d8d30-35c2-4480-907b-cad8e9e5bbc8' 
go

-- @/iCore/Staff_Dashboards/Fundraising_Overview_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40d5a97e-51d3-4e3d-8179-c7c76e7ffe8c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'baf65863-ae46-489d-a410-f1a415aed2bb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '40d5a97e-51d3-4e3d-8179-c7c76e7ffe8c' 
go

-- @/iCore/AdminConsole/System Admin Landing Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b745b7fe-22b5-40ae-9c18-fbad2d0407b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95084246-0463-4513-b2fa-f2cda28df7b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b745b7fe-22b5-40ae-9c18-fbad2d0407b2' 
go

-- @/iSamples/AnnualConference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '545fea26-d3ac-4771-b802-0e4ba1e8d017' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d688eb1-e879-43c8-8c9f-f59a53487114' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '545fea26-d3ac-4771-b802-0e4ba1e8d017' 
go

-- @/iCore/Fundraising/Donation_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8cdbc28-52e7-4419-94ad-113f6bb6eb02' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c23a5824-cfa9-4e96-8323-fe3b1979c0db' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8cdbc28-52e7-4419-94ad-113f6bb6eb02' 
go

