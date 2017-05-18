-- @/iCore/Contacts/OrganizationLayouts/Organization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '042d20e8-4d59-4997-a216-046498caf03e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b16d124-0b2b-42c8-a207-042e72b9e4b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '042d20e8-4d59-4997-a216-046498caf03e' 
go

-- @/iCore/Communities/WikiDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4f9a7fb-a8a5-4bb2-b323-eeca14703fcc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2365202c-3323-4e46-9153-05681f3d3f48' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd4f9a7fb-a8a5-4bb2-b323-eeca14703fcc' 
go

-- @/iCore/Contacts/ContactLayouts/Donor/About_Me
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2270961a-82c7-44f8-a1ca-538a5b1c4c8c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e203e629-80f5-4557-b028-060c3e08639e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2270961a-82c7-44f8-a1ca-538a5b1c4c8c' 
go

-- @/iCore/Store/StoreLayouts/Store_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8777b79a-70b0-4730-882a-bd246356fd63' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53edb360-7b6b-425f-9ec3-06418c408e24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8777b79a-70b0-4730-882a-bd246356fd63' 
go

-- @/iCore/Events/Event_Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca7e7a16-9750-4f3d-ab0a-ffdffcc42444' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99580240-5ced-40f0-99ed-08b5644c1a87' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca7e7a16-9750-4f3d-ab0a-ffdffcc42444' 
go

-- @/iCore/Fundraising/New_Donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7d60f064-b626-4856-9df8-588f89b9b90e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58552117-d1ad-4303-bd1e-09fb73ac5cf0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7d60f064-b626-4856-9df8-588f89b9b90e' 
go

-- @/iSamples/Mobile/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97be8be1-2ced-49c4-8cfa-2c3c7bde4bf1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '973c6323-9680-408a-87bf-0a34a8088ab0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '97be8be1-2ced-49c4-8cfa-2c3c7bde4bf1' 
go

-- @/iCore/Staff_Dashboards/Guided_Performance_Scorecard/Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3dfe6ee-620e-4436-bbc7-71b4cc581b4d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d3900b5-5fba-4ef4-a321-0b379a06e7ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a3dfe6ee-620e-4436-bbc7-71b4cc581b4d' 
go

-- @/iCore/Fundraising/Gift_aid_declaration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a28485b2-2871-4844-8ca6-e3af3d257712' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c85648fb-d76f-436c-9d99-0ba99b3a75c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a28485b2-2871-4844-8ca6-e3af3d257712' 
go

-- @/iCore/Reporting_Services_Samples/Membership_Pyramid_Chart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4506668f-61b9-4d1f-ba98-eb6112ff34ce' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c4d2b6a-99a5-4184-ab76-0cf514d1e435' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4506668f-61b9-4d1f-ba98-eb6112ff34ce' 
go

-- @/iSamples/Member/Leadership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55173334-deac-4b07-92fa-6298705c0d67' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5db78df9-f671-4796-b818-0d7442de2efd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '55173334-deac-4b07-92fa-6298705c0d67' 
go

-- @/iCore/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d566fb4-50c8-4b99-9842-de083cf62ee4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f51ea796-dae2-47b5-b74c-0fcde8367558' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d566fb4-50c8-4b99-9842-de083cf62ee4' 
go

-- @/iSamples/Mobile/Contact_Management/My Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da578ace-cca9-43b7-8716-4a059a85729a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b7e0ae5-f207-49a0-9215-1013627c490a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'da578ace-cca9-43b7-8716-4a059a85729a' 
go

-- @/iSamples/AnnualConference/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '639d3977-df85-4ccf-977c-ff8461b48aa1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37107d1a-3f61-40c6-a7c6-1024bfc84307' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '639d3977-df85-4ccf-977c-ff8461b48aa1' 
go

-- @/iSamples/Member/ContentAreas/Footer_Communications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1f452d0-eac4-4d47-b61a-417a972bc44e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c640a87-8331-46dd-aab2-10258765e861' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e1f452d0-eac4-4d47-b61a-417a972bc44e' 
go

-- @/iCore/Content/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a45e6008-3a9b-4725-8080-6a4b7e6af225' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7196a7b3-77c5-4428-be2a-102e402360ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a45e6008-3a9b-4725-8080-6a4b7e6af225' 
go

-- @/iCore/Events/Event_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7a8980f-a467-40f9-9c29-f1a587744624' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7aaa2571-9e50-4473-b894-1174ec66d004' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a7a8980f-a467-40f9-9c29-f1a587744624' 
go

-- @/iCore/Contacts/CreateAccount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fad19389-6efb-4a39-aec7-a2d574a8154a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6606964d-abde-4159-98dd-11acec31d83a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fad19389-6efb-4a39-aec7-a2d574a8154a' 
go

-- @/iSamples/AnnualConference/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '05942209-6c20-4b21-9539-d868d8b84433' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '439b99b7-9656-4249-97fe-15e6939194f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '05942209-6c20-4b21-9539-d868d8b84433' 
go

-- @/iCore/Contacts/SimpleAccountCreator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ab7e5c2-df19-40d3-9345-7bce63361641' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78b79c30-5044-4ecc-aa0b-162e87383c04' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ab7e5c2-df19-40d3-9345-7bce63361641' 
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

-- @/iSamples/Donor/Volunteer/Habitat_Sign_Up
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '739a833e-7a32-4ac1-a958-cd75e68e37b5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '612964ba-8095-488f-8745-1a8f04ced5d5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '739a833e-7a32-4ac1-a958-cd75e68e37b5' 
go

-- @/iSamples/Member/Content_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c04feff-1515-456f-87f4-6c6e0d352d50' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8590383-ff0b-4f58-8dd3-1ab70af8d740' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9c04feff-1515-456f-87f4-6c6e0d352d50' 
go

-- @/Shared_Content/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3116df8-7166-445d-80e7-2ad763b7d923' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e5d28f7-b8b4-4776-8d77-1aef4ad775c5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f3116df8-7166-445d-80e7-2ad763b7d923' 
go

-- @/iSamples/Mobile/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a32f631-fc26-4826-ae94-40800ed5288e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d7cd820-b6a0-405f-862e-1ba2dfc594c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6a32f631-fc26-4826-ae94-40800ed5288e' 
go

-- @/iSamples/Mobile/Contact_Management/Create_Account
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '286019e3-9da4-4a89-b9b1-f550de123b97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c1d07cc-fdb2-40b0-8c2a-1baad1a37076' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '286019e3-9da4-4a89-b9b1-f550de123b97' 
go

-- @/iCore/Tagged_Content/News/Don_t_get_Caught_off_guard_by_new_Regulations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '04bf5d51-43ac-4b13-a7c7-b42e3041b45e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06d49b37-c0e1-42ef-9d53-1cc5ab008aec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '04bf5d51-43ac-4b13-a7c7-b42e3041b45e' 
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

-- @/iCore/Contacts/OrganizationLayouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e86eac8-b6ef-4864-b6bb-b27f42c0a764' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f41027ff-2bb9-4d6b-991a-1e56c474cdd2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1e86eac8-b6ef-4864-b6bb-b27f42c0a764' 
go

-- @/iSamples/Mobile/News/The_world_of_computing_is_changing_
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c2bf5b97-0199-4abe-8432-3bbc14eaec36' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '16028a1f-84a4-4824-a95f-1edf0cee2911' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c2bf5b97-0199-4abe-8432-3bbc14eaec36' 
go

-- @/iCore/Staff_Dashboards/Events_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52700206-36a3-4661-be97-da9769bd7820' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2eb37148-bd2f-4ae2-9419-1f00ad6c74e7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '52700206-36a3-4661-be97-da9769bd7820' 
go

-- $/ContentManagement/DefaultSystem/Websites/Core/Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '275aa14d-42c7-4045-98b9-3738b180dd59' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4243d9e2-e91e-468c-97c2-2046d70c1e1a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '275aa14d-42c7-4045-98b9-3738b180dd59' 
go

-- @/iSamples/AnnualConferenceMobile/Attendees
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96c8450a-d702-4fee-bdab-00c86aa991fd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '559e02a1-9390-49b6-b746-217c5b9f561b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '96c8450a-d702-4fee-bdab-00c86aa991fd' 
go

-- @/iSamples/AnnualConference/Upcoming_Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4f1a79ab-ec52-411a-9473-b4d4e190ff41' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3d13261-8be5-4b96-baa4-2236e6959e4c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4f1a79ab-ec52-411a-9473-b4d4e190ff41' 
go

-- @/iSamples/Donor/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6849819b-3165-4c47-9c0d-569caa007ff2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7cb09cb-b9ea-426b-8d19-24388ca67a34' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6849819b-3165-4c47-9c0d-569caa007ff2' 
go

-- @/iCore/Communities/BlogDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f899f3c-fc12-4277-b549-7844236dca2e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '086b46a1-cd35-48d8-9109-2599313a2c3c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1f899f3c-fc12-4277-b549-7844236dca2e' 
go

-- @/iCore/Contacts/Create_Account_no_Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '339236b3-f2ec-497c-bce6-b86cfb81e1a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea83efd1-0ccc-431e-ad65-262bd9f34363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '339236b3-f2ec-497c-bce6-b86cfb81e1a5' 
go

-- @/iCore/Contacts/ContactLayouts/AccountPage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '66c1827e-9aee-4943-99f5-78dd12626a72' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aaa7d197-155d-40ae-8b0b-26636a57c3b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '66c1827e-9aee-4943-99f5-78dd12626a72' 
go

-- @/iCore/Contacts/ContactLayouts/My_Participation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78caf5cb-da63-40e4-9a85-ec66326b5550' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98ca3c60-fde2-4597-867c-283e33dc25a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78caf5cb-da63-40e4-9a85-ec66326b5550' 
go

-- @/iCore/Contacts/ContactLayouts/AboutMe
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fae59d60-0c3d-4eca-8466-e2a99f74d096' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eee11a3b-f250-4875-93c7-28ee5d69badc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fae59d60-0c3d-4eca-8466-e2a99f74d096' 
go

-- @/iSamples/AnnualConference/Exhibits
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d148ad9-e830-4746-8976-e73fadbc66a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d068c6d-93c4-418b-9904-2965c639e119' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d148ad9-e830-4746-8976-e73fadbc66a1' 
go

-- @/iCore/Fundraising/Import_Standing_Order_payment_file
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2675efb-8bc2-4c0c-a65a-3017af94a31d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8a20014-5fd3-49ae-bee5-29aff2dbe132' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd2675efb-8bc2-4c0c-a65a-3017af94a31d' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '19b62572-7b4e-4446-ad50-a8ede8665c35' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39f81cdd-5294-46a8-95f7-2aed7f92f52d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '19b62572-7b4e-4446-ad50-a8ede8665c35' 
go

-- @/iCore/Communities/ForumDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80903296-1fec-4405-82a6-f3ffb87efcd1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed1c0843-b946-4dcb-8cbb-2be5027c8fe2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80903296-1fec-4405-82a6-f3ffb87efcd1' 
go

-- @/iCore/Fundraising/Recurring_donation_commitment
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1dd3ae9a-d453-40ba-b52a-dfa82b164aca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd4accdf-a4cf-49f7-a6dc-2c9feef5fe2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1dd3ae9a-d453-40ba-b52a-dfa82b164aca' 
go

-- @/iSamples/AnnualConference/Program
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64f914a5-5578-449f-9fe2-3b05c4cccae2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c1e4335-4536-4341-88c9-2d3ab2dd63df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '64f914a5-5578-449f-9fe2-3b05c4cccae2' 
go

-- @/iCore/Events/Function_Edit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2439818b-61ff-4573-b6a1-87257065af8e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5aa41f4-6dcd-458b-82aa-2db9a3712a7c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2439818b-61ff-4573-b6a1-87257065af8e' 
go

-- @/iCore/Contacts/ContactLayouts/Giving_History
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dd4f41d8-363c-4600-81cb-e46e9d8d6d17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '25356a69-9951-4081-8809-3069c3146ea8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dd4f41d8-363c-4600-81cb-e46e9d8d6d17' 
go

-- @/iSamples/Member/Join_Now_Associate
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a01506d2-623e-4a1e-9b80-ee90436b201d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0da1a19-9360-4eb1-b070-30bb3f436061' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a01506d2-623e-4a1e-9b80-ee90436b201d' 
go

-- @/iCore/AdminConsole/ReportingConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7ac0f2a-f511-47c3-9695-22cb347d57a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d867bf8-894f-4d3f-9e01-314416aaf97a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c7ac0f2a-f511-47c3-9695-22cb347d57a7' 
go

-- @/iSamples/Member/My_Groups
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63472058-e3e8-42bb-bbfe-6ba359d6a6e6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9b84ffe-9170-4cf5-9e0e-325cc11e773d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63472058-e3e8-42bb-bbfe-6ba359d6a6e6' 
go

-- $/ContentManagement/DefaultSystem/Websites/Core/CS2
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd95a69d5-49e7-4e7b-bf3a-41bc7ce230cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fad2fd17-7e27-4c96-babe-3291ecde4822' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd95a69d5-49e7-4e7b-bf3a-41bc7ce230cf' 
go

-- @/iCore/Contacts/ContactLayouts/About_Me_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b96b375-0cc7-4dec-872c-300ffaf75f9c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34170dbb-b90d-47ef-ae06-32bd8e95ee41' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8b96b375-0cc7-4dec-872c-300ffaf75f9c' 
go

-- @/iSamples/Mobile/Contact_Management/My_Participation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b7c50137-31ad-4bbd-a730-3b82394ddebd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a77870fb-0b47-4e04-90b3-345f2487f239' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b7c50137-31ad-4bbd-a730-3b82394ddebd' 
go

-- @/iCore/Tools/Package_Installer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '888a435c-9d56-4a0a-98fb-c0f2eec9b070' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cac4d0f-3098-4db3-822d-3769e72c48c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '888a435c-9d56-4a0a-98fb-c0f2eec9b070' 
go

-- @/iSamples/AnnualConference/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12d96eb9-5555-45fa-b4a9-7f294a70be5b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6630c1e9-bbf4-4ccd-b62d-3846d4894d9b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '12d96eb9-5555-45fa-b4a9-7f294a70be5b' 
go

-- @/iSamples/AnnualConference/Registration
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ea2fc47-5589-457c-8a95-d4629f6c2cd3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6e761e7-04fc-42df-a836-385e11706c3d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0ea2fc47-5589-457c-8a95-d4629f6c2cd3' 
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
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c6c87d74-e7b4-4ad8-a68f-f832c141b5de' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49e6bcf9-8754-4db9-8d22-3a01e2fd1f1a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c6c87d74-e7b4-4ad8-a68f-f832c141b5de' 
go

-- @/iSamples/AnnualConferenceMobile/Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e21fbe14-6107-4cca-aaf5-ecce5acec53d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15a9a0d2-8c28-425f-8c9d-3abbd660982d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e21fbe14-6107-4cca-aaf5-ecce5acec53d' 
go

-- $/ContentManagement/DefaultSystem/TaggedListFormats/Mobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca6dbe5c-da7d-4360-932d-dbc86ce07dc9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b215d4a6-be05-4c75-97ae-3b257c6cfa8e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ca6dbe5c-da7d-4360-932d-dbc86ce07dc9' 
go

-- @/Shared_Content/Events
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e401245-0ad7-45f3-b58a-94c706e1fc57' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28da02c6-4f61-43a0-9235-3b891ddff0d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8e401245-0ad7-45f3-b58a-94c706e1fc57' 
go

-- @/iSamples/Mobile/Fundraising/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f05a8d4-c230-4296-92e9-81863148c4af' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6350489e-1c3d-429d-94d0-3d3872613ede' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2f05a8d4-c230-4296-92e9-81863148c4af' 
go

-- @/iCore/Contacts/OrganizationLayouts/Organization_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5cb3a29-676d-476d-b961-c7833f9fc4ba' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4dfd64d7-b189-4fe8-a516-3e2c103fd5b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5cb3a29-676d-476d-b961-c7833f9fc4ba' 
go

-- $/ContentManagement/DefaultSystem/Websites/Samples/iMISMobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c3b171d6-74af-4cd5-b2cf-0178d271e780' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c3b171d6-74af-4cd5-b2cf-0178d271e780' 
go

-- @/iCore/Communities/CommunitiesList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b089c5ef-6f58-4938-85b5-7563a6789c83' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '20f87707-7aab-4bc5-8106-40dbe3c29d89' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b089c5ef-6f58-4938-85b5-7563a6789c83' 
go

-- @/iSamples/Mobile/News_For_Mobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '238f9ab8-1e35-4453-b843-76f34c0eab27' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a39361f-65c5-436d-9d16-40f13504cce9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '238f9ab8-1e35-4453-b843-76f34c0eab27' 
go

-- @/iCore/Tools/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5c053b9-6871-4bf9-8da5-ec420b54f394' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '486f02d0-a395-48cf-956e-41abfbea6679' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5c053b9-6871-4bf9-8da5-ec420b54f394' 
go

-- @/Shared_Content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4559e706-aa40-477c-a68b-af00bd10fd55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'efe97b35-4bae-4734-aa8f-41bb41a9fbab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4559e706-aa40-477c-a68b-af00bd10fd55' 
go

-- @/iCore/Tools/Friendraising_Mappings
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b536e79e-0d46-4e78-a322-9c96cf74cc6a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9becf0c-3750-4cd7-819f-420343c9a43f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b536e79e-0d46-4e78-a322-9c96cf74cc6a' 
go

-- @/iSamples/Donor/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ae02978-3c8d-48d4-aafa-f52befbda3fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '605be573-a706-4316-9aeb-456cdb1b8c3f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ae02978-3c8d-48d4-aafa-f52befbda3fb' 
go

-- @/iSamples/Donor/Volunteer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f948d48-a23f-41c0-84e1-d1f9ba2a2b56' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd73a40de-e9b0-40ee-8396-45f2b0d5d250' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5f948d48-a23f-41c0-84e1-d1f9ba2a2b56' 
go

-- @/iSamples/Donor/Volunteer/Skills
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0be9232-9a16-4e30-bba4-e035343c6de3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f7abd06-ad6b-49c2-875c-46f9ce6eafb6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f0be9232-9a16-4e30-bba4-e035343c6de3' 
go

-- $/ContentManagement/DefaultSystem/TaggedListFormats/MobileTCTAtomPanel
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5543a03f-e65a-44d5-b3fc-636ea1eaf4a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23d41105-782f-40d5-a7f3-471b59689b1e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5543a03f-e65a-44d5-b3fc-636ea1eaf4a9' 
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
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddd9b4b3-6165-424c-b62b-9287c1150485' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49064c13-ef93-495b-91bb-4a0885258b37' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ddd9b4b3-6165-424c-b62b-9287c1150485' 
go

-- @/iSamples/Donor/Current_Initiatives
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '448b2474-5776-4515-bce9-acedf9750c59' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93bec9f1-54f3-4763-9ddb-4a58a7ff37d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '448b2474-5776-4515-bce9-acedf9750c59' 
go

-- @/iSamples/Donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4245a05c-484e-497f-9071-6bd3243496b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e05ba4be-14c8-4ad0-b864-4a8e81eb0dfb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4245a05c-484e-497f-9071-6bd3243496b7' 
go

-- @/iSamples/AnnualConferenceMobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '446c1b54-0f25-4c2b-b5b3-bdf36302eed3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3dc3bef4-2520-44d3-89f9-4b9abd0c1b61' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '446c1b54-0f25-4c2b-b5b3-bdf36302eed3' 
go

-- @/iSamples/Donor/Leadership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f283d5f4-bdd4-4c50-b4b5-30487243ed10' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a87eaec-7779-4a13-a458-4c6c75dfabf8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f283d5f4-bdd4-4c50-b4b5-30487243ed10' 
go

-- @/iSamples/Donor/Volunteer/Contact_Info
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c95d60d1-fdd5-4fa9-9835-60934ff8bcd8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '202ff325-1511-4d16-8198-4ca690507c66' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c95d60d1-fdd5-4fa9-9835-60934ff8bcd8' 
go

-- @/iCore/Contacts/ContactLayouts/Account_Page_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8eac5de1-76ab-4623-a78f-5e3260b8c870' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '800bdcf0-7d26-447c-aa0c-4dd15008b423' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8eac5de1-76ab-4623-a78f-5e3260b8c870' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4628f6ea-e55e-4550-b2b9-19acb7d328cd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '199ad522-55d2-4c0e-a51b-4e5e3d6eb98a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4628f6ea-e55e-4550-b2b9-19acb7d328cd' 
go

-- @/iCore/Contacts/ContactLayouts/Education_Staff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6075ddba-c2e0-434f-a0e1-ad8d06746461' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a33c718-ab68-47f2-a56e-50a1b7cc3a0c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6075ddba-c2e0-434f-a0e1-ad8d06746461' 
go

-- @/iSamples/AnnualConference/Presentations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28761f88-52f1-4910-8bf7-3f8094edec49' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97e37366-c625-439b-9776-56452c1652cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '28761f88-52f1-4910-8bf7-3f8094edec49' 
go

-- @/iSamples/Donor/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a69b96e5-a78d-4a52-bfbe-c9447aed2440' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed022066-f7c0-40fb-8079-5706460515fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a69b96e5-a78d-4a52-bfbe-c9447aed2440' 
go

-- @/iCore/Fundraising/GiveNow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '49b718f2-c498-4d42-a3b5-492035bbe559' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb2a3e56-ef20-4107-aa2f-57c118f0084f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '49b718f2-c498-4d42-a3b5-492035bbe559' 
go

-- @/iCore/Tools/WorkItemConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9164c98-1651-4f19-8125-bfe78df6bb9d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a64b20a-080e-4f79-9287-5988b74972d8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f9164c98-1651-4f19-8125-bfe78df6bb9d' 
go

-- @/iSamples/Donor/Become_A_Volunteer
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60331a02-23f1-407d-8a02-3461ca219645' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '713115bb-14a5-4741-a600-59ca4e212e19' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '60331a02-23f1-407d-8a02-3461ca219645' 
go

-- @/iCore/Contacts/ContactLayouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37e237ba-29f6-4804-b339-7313c67f99a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9b7673a-2faf-42ef-a7dd-5a2fdd76d16c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '37e237ba-29f6-4804-b339-7313c67f99a8' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityDescription
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ade318f-a1a3-4565-87c3-a55b34c50968' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffd73063-5d78-4f4c-818e-5b44fde0e5ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0ade318f-a1a3-4565-87c3-a55b34c50968' 
go

-- @/iCore/AdminConsole/Tools_Landing_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b02c3b3-0fee-4bd4-a7f9-9a8af667995e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31214f00-5419-4b8e-8d6c-5c0c7ad6dd45' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b02c3b3-0fee-4bd4-a7f9-9a8af667995e' 
go

-- @/iSamples/Donor/JoinTheFoundation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b49fda4a-9026-4f39-a214-2bc2713bf4d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ae27b81-0595-47fe-9161-5c3536db4fff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b49fda4a-9026-4f39-a214-2bc2713bf4d3' 
go

-- @/iCore/Contacts/AddressMap
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad73c163-d64d-4f6f-9bae-aec6f6ba5a7d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ba131962-0478-40b8-9e8e-5cdd6f639913' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad73c163-d64d-4f6f-9bae-aec6f6ba5a7d' 
go

-- @/iSamples/Member/Join_Now_Regular
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0cd16d12-000f-4876-bd90-6533fe627886' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cbc3b01f-05b7-4001-af2f-5d3f67b32a54' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0cd16d12-000f-4876-bd90-6533fe627886' 
go

-- @/iSamples/AnnualConference/Accommodations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4108d31f-03ac-48b7-bd19-dc398f2f18f4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cf55cfbd-1f05-4657-8e0e-5e27dd6c07be' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4108d31f-03ac-48b7-bd19-dc398f2f18f4' 
go

-- @/iSamples/Mobile/Fundraising/Gift_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f38ebf3-04f2-49ba-8438-9c1f7d3067ec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5855c6c2-1281-4e53-aa2c-608f1bc1b790' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8f38ebf3-04f2-49ba-8438-9c1f7d3067ec' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ae3031f1-bc25-43ba-a4e5-cbe78ec549e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2723f4b3-83a5-4374-902f-62d3a38800cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ae3031f1-bc25-43ba-a4e5-cbe78ec549e1' 
go

-- @/iCore/Contacts/ContactLayouts/Donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd88fbd3-1218-4f3b-8ff4-0ffec57e3efe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02805763-a97b-4bc6-9d20-6366c27c9a4b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd88fbd3-1218-4f3b-8ff4-0ffec57e3efe' 
go

-- @/iCore/Fundraising/Gift_aid_reclaim
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e990141e-702e-40f3-b22a-ebfb731e1a9b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c814754-1bcb-4241-92f3-63f1b7575042' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e990141e-702e-40f3-b22a-ebfb731e1a9b' 
go

-- @/iCore/Communities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45ab01f4-4c76-4002-9b10-49a5e3cb72f0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48e7a241-0ab5-4a6b-b1d3-64af136a5fa1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '45ab01f4-4c76-4002-9b10-49a5e3cb72f0' 
go

-- @/iCore/Tagged_Content/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9cc2822a-ec95-4731-be78-531f08438c34' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '160166a3-e437-47bd-9354-66446d3b2267' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9cc2822a-ec95-4731-be78-531f08438c34' 
go

-- @/iCore/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '668107cc-badc-4dca-9d2f-d9fd4d424503' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07beebeb-4947-42a9-bd4a-6646df385237' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '668107cc-badc-4dca-9d2f-d9fd4d424503' 
go

-- @/iSamples/AnnualConferenceMobile/My_itinerary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '767b6b0f-8674-4bcb-b118-716a758f95b6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98de4f30-08fa-4083-b94a-67f2ce5fdab0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '767b6b0f-8674-4bcb-b118-716a758f95b6' 
go

-- @/iSamples/Mobile/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8884f346-b6c3-4faa-b2cd-77203c8da60b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb61179f-9ff3-4971-9318-68952acbaa61' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8884f346-b6c3-4faa-b2cd-77203c8da60b' 
go

-- @/iCore/Contacts/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bad0586c-fb54-451b-ad22-28d4942dcc06' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '849db2b5-0548-41cd-9198-6c04b9e0e2cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bad0586c-fb54-451b-ad22-28d4942dcc06' 
go

-- @/iCore/Contacts/ContactLayouts/Fundraising_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed907cb9-f144-4f34-a044-633b6159123e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1920ca8a-9560-4506-990f-6e45986955f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ed907cb9-f144-4f34-a044-633b6159123e' 
go

-- @/iCore/Staff_Dashboards/Fundraising_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '192cbf6c-f4e3-4b71-94f7-84be1119bb8c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb383087-3ee7-4e3e-b805-70c7495aee4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '192cbf6c-f4e3-4b71-94f7-84be1119bb8c' 
go

-- @/iSamples/Member/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '658bc954-af7e-4692-8d8b-a1bf5a68db5f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b432742-f2cf-4acb-98d2-71b6b420495f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '658bc954-af7e-4692-8d8b-a1bf5a68db5f' 
go

-- @/iSamples/AnnualConference/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e6698dc6-9799-4e45-b4b2-8309cff584cd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db2c712e-c77d-4378-9eff-71cabf5ab60a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e6698dc6-9799-4e45-b4b2-8309cff584cd' 
go

-- @/iCore/Contacts/Organization_search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '32e02284-5d5b-4fc3-885a-f7c544a41d97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '08505cf8-dd9c-48d4-9daf-71d18419d89f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '32e02284-5d5b-4fc3-885a-f7c544a41d97' 
go

-- @/iCore/Store/StoreLayouts/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '964d9534-729d-4483-b050-4d1ce11c7ffa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13a311ee-4be3-4a28-93ed-73ebe8ca5086' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '964d9534-729d-4483-b050-4d1ce11c7ffa' 
go

-- @/iCore/Communities/WikiList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b4682ce-4db2-4022-a0ac-9c0b52300761' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2b738e07-e61e-43e1-a8e4-75071ca430a1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b4682ce-4db2-4022-a0ac-9c0b52300761' 
go

-- @/iCore/Contacts/Create_Contact_Person_or_Org
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8cf0f87e-ef03-4c20-b09b-12a7eebace08' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3229d460-e1ed-4a09-9dc4-7638ca7f6807' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8cf0f87e-ef03-4c20-b09b-12a7eebace08' 
go

-- @/iCore/DefaultStaff
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0b6d8bc-9bfd-43ea-b672-cc0c799397e2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac59b8ec-3748-4ac9-a48f-769e43ab6a62' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e0b6d8bc-9bfd-43ea-b672-cc0c799397e2' 
go

-- @/iCore/Fundraising/Ways_to_Give
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54e8a24c-c78a-4586-adc0-93b84d2df926' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '54e8a24c-c78a-4586-adc0-93b84d2df926' 
go

-- @/iCore/Staff_Dashboards
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5816570-1382-4223-8325-776fb5b2dc3e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '970e64df-f4c6-46d5-a303-7706d77bf612' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c5816570-1382-4223-8325-776fb5b2dc3e' 
go

-- @/iSamples/AnnualConference/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a44bab80-d553-4f12-bf0a-7320afd65da5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef27e5a7-34d3-4739-9491-773080c103a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a44bab80-d553-4f12-bf0a-7320afd65da5' 
go

-- @/iSamples/AnnualConference/Venue
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54f54a48-f95d-4226-b027-289852a0d7c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f903addf-b9b6-44ae-aa3d-77f2710da553' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '54f54a48-f95d-4226-b027-289852a0d7c5' 
go

-- @/iCore/Contacts/OrganizationLayouts/Overview
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e066f81a-03f3-4437-b9c0-cdbc6b707060' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dfb18597-2c00-4f10-af0f-784d3b2bcdfd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e066f81a-03f3-4437-b9c0-cdbc6b707060' 
go

-- @/iCore/AdminConsole
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48cdd410-ca86-4299-b5ba-eacda984f027' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3fc6e97-f027-45f4-a62d-7b90651b4438' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '48cdd410-ca86-4299-b5ba-eacda984f027' 
go

-- @/iCore/Fundraising/Landing_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13416d94-6137-4284-b479-3221d04653af' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7777fb0e-94b5-45c4-b5c1-7c31f3c881a2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '13416d94-6137-4284-b479-3221d04653af' 
go

-- @/iSamples/Donor/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1f7a2c6-88ec-4586-a006-8f4ed340df3c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a0e1ec07-a086-46e4-8fff-81e17df7a237' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c1f7a2c6-88ec-4586-a006-8f4ed340df3c' 
go

-- @/iSamples/AnnualConference/Product_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ab9586a9-6892-47e4-b452-635719ece9f1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2adcdb59-944b-42c7-9e53-8264532dedeb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ab9586a9-6892-47e4-b452-635719ece9f1' 
go

-- @/iCore/Content/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f983737f-8d10-4e8f-bc0f-ede13184b70f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ad71ee6-102e-4d19-9294-83caf6fe96f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f983737f-8d10-4e8f-bc0f-ede13184b70f' 
go

-- @/iSamples/AnnualConferenceMobile/Venue
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd220e02b-0770-42a1-826f-8e2837fede0a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c3ed4fc-59c1-4560-885a-83d5f44ef324' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd220e02b-0770-42a1-826f-8e2837fede0a' 
go

-- @/iSamples/Member/My_Communities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de0b5950-3f09-4afe-a8b4-df5c6181541f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ebb1889-4733-486c-b7a0-846c42c8d53e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de0b5950-3f09-4afe-a8b4-df5c6181541f' 
go

-- $/ContentManagement/DefaultSystem/Websites/Samples/iMISAnnualConference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f3dac880-ba5e-4401-a4c1-ec3985f4b4ed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '77c6bf57-1505-456c-a3e9-8473532388ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f3dac880-ba5e-4401-a4c1-ec3985f4b4ed' 
go

-- @/iCore/Communities/BlogList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aabd3e29-e8d9-4b45-bfd9-424104547a65' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '605c94b0-4285-4462-a390-8491b07adf0f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aabd3e29-e8d9-4b45-bfd9-424104547a65' 
go

-- @/iSamples/Mobile/Store/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38d2e722-b633-495b-954a-02ac578b5713' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6fefcd2-92e0-4553-9475-84ed9731efad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38d2e722-b633-495b-954a-02ac578b5713' 
go

-- @/iCore/Communities/BlogArchive
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c6e76229-551d-4178-8a92-616b41ec144e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33b73ca1-0f7e-4caa-90ac-859ec47750d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c6e76229-551d-4178-8a92-616b41ec144e' 
go

-- @/iSamples/Donor/Corporate_Partnerships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07b14809-a94f-4c59-b2ea-701f2ed7fdec' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07b14809-a94f-4c59-b2ea-701f2ed7fdec' 
go

-- @/iSamples/Donor/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac4836a1-58d8-4b67-9c0b-c65a52ef7590' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7b6cb29-bd00-43f4-8171-86ca6f34aea9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac4836a1-58d8-4b67-9c0b-c65a52ef7590' 
go

-- @/iSamples/Donor/Financial_Information
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63c96662-e4c9-4baa-9984-3845cfd28c2c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fdd3205-d03a-4391-92e5-86fea43bf7b1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63c96662-e4c9-4baa-9984-3845cfd28c2c' 
go

-- @/iCore/Contacts/OrganizationLayouts/Demographics
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ad43841-9843-4314-b30c-5029069cbefb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '927ac80c-9a95-4567-8dfb-871fba5d7a1f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ad43841-9843-4314-b30c-5029069cbefb' 
go

-- @/iSamples/AnnualConference/Event_blog
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e475d0d-0c95-4de1-923d-3e26f0de0a14' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a2883b4-1b20-4584-87a6-87ecbc11ff87' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5e475d0d-0c95-4de1-923d-3e26f0de0a14' 
go

-- @/iSamples/Member/ContentAreas/Home_Page_Full_Width_Area
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '350a6ea7-5515-4c9a-b435-f1f9a72e161b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f172065f-3992-4afd-9390-89a573a6de4c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '350a6ea7-5515-4c9a-b435-f1f9a72e161b' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityPostSummary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8b30411-b9d1-417b-8073-2965011136b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8b30411-b9d1-417b-8073-2965011136b2' 
go

-- @/iSamples/Mobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9ae11165-e6f1-482d-a77c-bf44b2b01958' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7cd4e3fb-2515-4255-9a80-8f59b18dc593' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9ae11165-e6f1-482d-a77c-bf44b2b01958' 
go

-- @/iSamples
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cbe499ff-bb36-4dae-a5b4-dd2011ab1af3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2636677-4132-4c0b-8217-8fabd862495e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cbe499ff-bb36-4dae-a5b4-dd2011ab1af3' 
go

-- @/iCore/Fundraising/Manage_Donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '294a08ef-8c94-440c-ad58-37739503a5a3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d9c8de1-0384-4d9f-8d79-9004c78adcbc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '294a08ef-8c94-440c-ad58-37739503a5a3' 
go

-- @/iSamples/Member/Search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8d0bb3d-2979-4178-afc4-d86225cb09d4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd0b42e03-6af0-473a-bc4c-903f7608b021' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b8d0bb3d-2979-4178-afc4-d86225cb09d4' 
go

-- @/iSamples/Mobile/Contact_Management/Organization_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0255fc43-082a-4567-818f-e00d9c26a2da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1341e64c-e409-4f8b-8863-93bc593e916b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0255fc43-082a-4567-818f-e00d9c26a2da' 
go

-- @/iCore/Store/Product_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c498fe36-a52e-48ec-bc26-751c8276a460' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6066a460-b09a-444d-91e7-93e98db225d4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c498fe36-a52e-48ec-bc26-751c8276a460' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '76b84b38-1576-4075-aa4d-3a986a96a714' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '510dc7fb-f9ea-40d4-bb38-93f526421155' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '76b84b38-1576-4075-aa4d-3a986a96a714' 
go

-- @/iSamples/Donor/WhoWeAre
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a44696c7-0097-425e-b1e0-921106211444' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eac2c486-9da0-4533-8341-94e24a683039' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a44696c7-0097-425e-b1e0-921106211444' 
go

-- @/iCore/AdminConsole/Configuration_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8118b768-aca1-43e0-9417-9c3d117de382' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62d59885-db4b-4747-91a3-95a98030780a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8118b768-aca1-43e0-9417-9c3d117de382' 
go

-- @/iCore/Fundraising/Moves_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8e5f2dd-0360-485c-b418-aa337b652660' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c67fc8d1-12af-49ee-a92e-97ebe94d6ca0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8e5f2dd-0360-485c-b418-aa337b652660' 
go

-- @/iCore/Communities/RosterList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af61091d-fd91-4999-9993-02405091bea8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84089ea5-2e78-4683-83ac-98aa7aacb241' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af61091d-fd91-4999-9993-02405091bea8' 
go

-- @/iCore/Staff_Dashboards/Commerce_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e127cbc1-3a67-4bdb-bd84-91c1f792c5cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e127cbc1-3a67-4bdb-bd84-91c1f792c5cc' 
go

-- $/ContentManagement/DefaultSystem/TaggedListFormats/BlockTaggedList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '27e66327-fcd9-4a16-a192-f18338ad71fb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0261208-6b29-4334-acf4-9a76a48b0e88' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '27e66327-fcd9-4a16-a192-f18338ad71fb' 
go

-- @/iSamples/Donor/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75c22635-dae5-4810-9517-d6685fa21238' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fca85baa-6966-4761-b791-9aa2b216c4fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75c22635-dae5-4810-9517-d6685fa21238' 
go

-- @/iCore/Store
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb48bcac-e98f-40c7-9ab1-f3d807f4669d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f429f5a5-2440-4163-af08-9b127b91a9a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cb48bcac-e98f-40c7-9ab1-f3d807f4669d' 
go

-- @/iCore/AdminConsole/AccountingLandingPage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fa3a5823-d9a3-4cc2-8db7-e12ca5752b85' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9961d654-d31e-4309-9b17-9c108ef7ec88' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fa3a5823-d9a3-4cc2-8db7-e12ca5752b85' 
go

-- @/iSamples/Mobile/Event_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ceb050b-fc44-49e9-adc0-bcae4e07a8ce' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c20c6bc-4b35-41c9-8a5e-9f4a2c2726f3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ceb050b-fc44-49e9-adc0-bcae4e07a8ce' 
go

-- @/iCore/Events/Events_List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e71bd9b-ed2b-4cc0-bf3c-b3843ec72ac9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7c02c1f-efcc-4a9a-b4bc-9f9afadebf03' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2e71bd9b-ed2b-4cc0-bf3c-b3843ec72ac9' 
go

-- @/iSamples/Mobile/Contact_Management/Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b128bd9-9e5e-4ef1-a321-6854ff401fb2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e207dcd-e714-4e1e-8882-a047e26ccf58' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b128bd9-9e5e-4ef1-a321-6854ff401fb2' 
go

-- @/Shared_Content/Shop
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bed7f345-1edc-46dc-8c2d-0c9bc47eff38' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fd3ff3ee-8578-40fe-8c8b-a04fa1a51fa8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bed7f345-1edc-46dc-8c2d-0c9bc47eff38' 
go

-- @/iSamples/AnnualConferenceMobile/Social_activities
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '054f591e-2e24-4fa6-8919-72e57baa673b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db546da9-9ac7-48ad-bb1a-a158d82f648c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '054f591e-2e24-4fa6-8919-72e57baa673b' 
go

-- @/iCore/Communities/TopicDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '57832b71-c725-44cf-ac33-b470015fdc92' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '460b2349-b498-4739-b2ee-a1f7955e84f7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '57832b71-c725-44cf-ac33-b470015fdc92' 
go

-- @/iCore/Reporting_Services_Samples/Membership_Pie_Chart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb02fad2-a430-4e21-9bca-a0f7683c8072' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c1b3419f-8b9a-40bf-af97-a45aaca9d626' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bb02fad2-a430-4e21-9bca-a0f7683c8072' 
go

-- @/iCore/Events/Function_Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddb38e5a-2288-4751-9de3-d1b3a2f4a30e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a71fa13f-4a80-4fb3-bbfb-a5fa8876c8a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ddb38e5a-2288-4751-9de3-d1b3a2f4a30e' 
go

-- @/iSamples/Mobile/News/Record-Breaking_NiUG_Conference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '195203fb-1d3b-40ef-ac9f-c429be3c752e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd6e4709a-5fa0-4b56-9521-a66cc05a5f97' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '195203fb-1d3b-40ef-ac9f-c429be3c752e' 
go

-- @/iSamples/Member/Benefits
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37482c14-df0e-4c6b-b9c0-3f080a42fe30' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '37482c14-df0e-4c6b-b9c0-3f080a42fe30' 
go

-- @/iSamples/Mobile/Contact_Management
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3706be85-c581-4259-bec0-27b1b425ef97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9c99ea8-8911-4e57-b34a-a7ff19eff635' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3706be85-c581-4259-bec0-27b1b425ef97' 
go

-- @/iCore/Tools
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b060540-ab7a-4d9a-8379-61431f52a185' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '122294ba-c5de-4294-8cc4-aa0228673a07' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b060540-ab7a-4d9a-8379-61431f52a185' 
go

-- @/Shared_Content/ContactManagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcabd5b4-d131-4363-88bc-15e57d7dfa7c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a57a1b4-f0ab-4507-ab60-aa899abc67c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bcabd5b4-d131-4363-88bc-15e57d7dfa7c' 
go

-- @/iSamples/AnnualConference/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '983ec254-4ee5-4d98-a981-a515fb11bbd9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5095780d-83d1-481e-bf4e-ac082ec1cf93' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '983ec254-4ee5-4d98-a981-a515fb11bbd9' 
go

-- @/iCore/Content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79b78d52-6fb3-43fa-85c1-b2faec67862b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '460fc679-0d49-4518-9e66-ad2b9fdedb82' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '79b78d52-6fb3-43fa-85c1-b2faec67862b' 
go

-- @/Shared_Content/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '782dabac-eb00-453d-aaae-10a04f565546' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd26b7490-ada4-42a5-88e8-b0692a4bcbc1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '782dabac-eb00-453d-aaae-10a04f565546' 
go

-- @/iSamples/Mobile/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc3e147b-27d3-4ae0-94f8-956599ee2d97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ba9ce46-d616-4131-843b-b501a846e831' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc3e147b-27d3-4ae0-94f8-956599ee2d97' 
go

-- @/iCore/Staff_Dashboards/Guided_Performance_Scorecard/Guided_Performance_Scorecard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '095c38a4-13a5-48ea-baf9-ae9f3ce1f175' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15587ef4-dfd1-4601-a853-b60a9bcb79b8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '095c38a4-13a5-48ea-baf9-ae9f3ce1f175' 
go

-- @/iCore/Communities/CommunityLayouts/CommunityNewsFeed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fadb82a2-20c4-4aff-b802-d35c71f1d3e5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98a98b8f-c33b-400a-8e81-b6708dbf8225' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fadb82a2-20c4-4aff-b802-d35c71f1d3e5' 
go

-- @/iCore/Communities/ForumList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b133a46-8be4-4f99-92b7-1810ddd66060' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8503f8d-d076-44e0-9d5c-b70e1814e18a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3b133a46-8be4-4f99-92b7-1810ddd66060' 
go

-- @/iSamples/AnnualConferenceMobile/Program_sessions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1c1a109-c76e-4a89-ac37-8dde1d3642bd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e65c73af-6a0a-4ad2-97af-b951962de762' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a1c1a109-c76e-4a89-ac37-8dde1d3642bd' 
go

-- @/iCore/AdminConsole/Home_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7352674f-fb9e-4bc7-8b52-1d898d2a1b17' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2ae1abaa-041b-4ca6-8fbb-ba7f3d445707' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7352674f-fb9e-4bc7-8b52-1d898d2a1b17' 
go

-- @/iSamples/AnnualConference/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '891984ad-dd4e-4dfb-86ef-915992a181d6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '934e6c1f-bc7c-4fd6-b7de-bbb2e44f825c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '891984ad-dd4e-4dfb-86ef-915992a181d6' 
go

-- @/iCore/Store/StoreLayouts/Item_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc314378-2375-496f-b4f2-ae74c7f7e327' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '44d850e7-d388-4bd1-866a-bc5ad6ed80af' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc314378-2375-496f-b4f2-ae74c7f7e327' 
go

-- @/iCore/Tagged_Content
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dc5fb43c-9b4f-48bc-a4cf-82e9e198b60c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45f28032-0fa4-41e7-bb44-bc775c21990c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dc5fb43c-9b4f-48bc-a4cf-82e9e198b60c' 
go

-- @/iCore/Communities/EntryDefault
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea3f4a95-fec3-4a44-bba9-d0bfb927df13' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '172a10cf-f2da-44ad-95dc-bd1540f33b43' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea3f4a95-fec3-4a44-bba9-d0bfb927df13' 
go

-- @/iSamples/Donor/Colleges_Initiatives
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4c518c0-10d3-4a7c-ae8c-2e21d1d40cb3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '374d9882-3eae-46be-8f49-be59b5c258ba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e4c518c0-10d3-4a7c-ae8c-2e21d1d40cb3' 
go

-- @/iCore/Contacts/OrganizationLayouts/Account_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7797920f-291f-4c82-933b-a65edaea01bb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd67d49aa-3691-4b32-856b-befd670c6001' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7797920f-291f-4c82-933b-a65edaea01bb' 
go

-- @/iCore/Contacts/People_search
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '11d5206c-2350-41e0-a6ef-c6c225dbefdd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0b62d2b-ee20-4470-bca5-c161f05a13a4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '11d5206c-2350-41e0-a6ef-c6c225dbefdd' 
go

-- @/iCore/Fundraising/Standing_Order_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de6926b4-a4c9-4b54-bb53-2cdfb5f2445b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0c1b055e-2575-43c3-a52c-c24d690c7656' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de6926b4-a4c9-4b54-bb53-2cdfb5f2445b' 
go

-- @/iSamples/Mobile/Fundraising/Donation_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e7f7f796-26d0-4e41-9a83-bc14b23bdff6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4b3c6b0-3c58-477c-b2d9-c269136934b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e7f7f796-26d0-4e41-9a83-bc14b23bdff6' 
go

-- @/iCore/Fundraising/Donate_Now
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6da7df48-1a1c-417b-aef8-b7ed80280cf4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '991d8973-6ade-4ac5-aef3-c34945a8641a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6da7df48-1a1c-417b-aef8-b7ed80280cf4' 
go

-- @/iCore/Fundraising/Gift_Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f69ab6e2-a59e-4f29-943f-0b83752b527b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c157a211-9d2d-4bd4-a0a2-c525d7431f5c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f69ab6e2-a59e-4f29-943f-0b83752b527b' 
go

-- @/iSamples/AnnualConference/Event_Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '833dad4d-51ca-407c-860d-7c2dd1fa4ca4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad7f7740-4d1a-4899-b009-c555dafc0c6b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '833dad4d-51ca-407c-860d-7c2dd1fa4ca4' 
go

-- @/iCore/Communities/CommunityPreferences
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a502816-dba6-495e-97fc-f8d66fac66bb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5f4c373-4920-4f46-b3cc-c7c37058fba3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6a502816-dba6-495e-97fc-f8d66fac66bb' 
go

-- @/iSamples/Donor/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0dfba575-d316-45ce-b92e-f3e432f7958a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9417f4c0-df7e-4a8c-95b0-c96238531d79' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0dfba575-d316-45ce-b92e-f3e432f7958a' 
go

-- @/iCore/Contacts/ContactLayouts/My_Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '69f6ab20-0173-411d-ba9b-1037d4e1f9ba' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '93b0d127-0251-4fab-9121-cb109f0f7db6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '69f6ab20-0173-411d-ba9b-1037d4e1f9ba' 
go

-- @/iCore/Store/StoreLayouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f63892db-fdbc-4132-bfc5-1abc6e384b9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92335989-333c-448e-97fb-cc278ff0fb7b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f63892db-fdbc-4132-bfc5-1abc6e384b9e' 
go

-- @/iSamples/Donor/Volunteer/Track_Hours
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96164bb1-5eb2-4c29-9514-8da5f94845a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3656fd6f-7d29-49bf-ac6f-ce1bea9bc1a9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '96164bb1-5eb2-4c29-9514-8da5f94845a9' 
go

-- @/iCore
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7eccd7f-3a97-4ea7-b7c6-5aa6b84c98ba' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '83ea3695-7503-4c39-8701-cee0153a2691' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd7eccd7f-3a97-4ea7-b7c6-5aa6b84c98ba' 
go

-- @/iCore/Staff_Dashboards/Contacts_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd13af872-3d25-455d-a990-67afb61b8968' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '61a1bac3-ea70-444f-8b0f-cf94dc0aca01' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd13af872-3d25-455d-a990-67afb61b8968' 
go

-- @/iCore/Store/Manage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ec05588-9dc6-4002-9032-fbd7e2a9fcf0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99090d52-b994-4f81-b970-d011c8fdeb00' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ec05588-9dc6-4002-9032-fbd7e2a9fcf0' 
go

-- @/iSamples/Donor/Legislative_Outreach
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37592393-3138-4e0f-8b79-48a8ffb22b5d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffed34a0-3a19-402f-bdcb-d0518663d92e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '37592393-3138-4e0f-8b79-48a8ffb22b5d' 
go

-- @/iCore/Communities/CommunitySecurity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0d7db38-f013-4a0b-ae25-95fe58817e7f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '978488b8-993f-443f-b990-d05cd47681b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f0d7db38-f013-4a0b-ae25-95fe58817e7f' 
go

-- @/iSamples/Mobile/ContentAreas
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b10efaa-d304-4b05-aa6b-3e36c39cee34' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d2615fb-f261-4c52-a102-d0650e5af782' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b10efaa-d304-4b05-aa6b-3e36c39cee34' 
go

-- @/iCore/Reporting_Services_Samples/Member_Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b5d7066-71bd-4282-a5fb-214beea7e61c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80fb6366-06b3-4772-8197-d0a9a7847ecf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b5d7066-71bd-4282-a5fb-214beea7e61c' 
go

-- @/iSamples/Donor/WhatWeDo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4b93deb-54a0-4031-a414-30a973ddc1c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62683f6e-e417-4953-8fa1-d0fd0dafb0a6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd4b93deb-54a0-4031-a414-30a973ddc1c5' 
go

-- @/iSamples/AnnualConference/Sponsors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '975ac91e-406b-4195-a987-5c5d3b2a655b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2828e2a6-e3d8-4738-9261-d176ee9ead57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '975ac91e-406b-4195-a987-5c5d3b2a655b' 
go

-- @/iSamples/Member/Management_Console
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c2b3d106-b53e-4a8f-a9eb-6e98c49f3adc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '018ad1bc-ae61-4bec-b241-d2adb32995e2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c2b3d106-b53e-4a8f-a9eb-6e98c49f3adc' 
go

-- @/iCore/Privacy_Policy
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2be0788c-349d-4223-beb5-bf7165f06307' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1af531e-9524-4b73-bd47-d4c9855a33c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2be0788c-349d-4223-beb5-bf7165f06307' 
go

-- @/iSamples/Member/Featured_Forums
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e58d0023-6909-47ed-be8d-c8f98d79bd34' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f96d202-4cb1-4449-ba81-d60c2467b899' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e58d0023-6909-47ed-be8d-c8f98d79bd34' 
go

-- @/iCore/Contacts/Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9c1b82a2-220b-40b4-8814-0b53a29e381c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7118bf41-8789-4cd5-bca8-d6a224a6cf2a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9c1b82a2-220b-40b4-8814-0b53a29e381c' 
go

-- @/iSamples/Member/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '802e0932-6b54-4343-8d05-f63a6e2a210a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64d3e272-25ec-4a51-b55d-d6c69cbf3865' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '802e0932-6b54-4343-8d05-f63a6e2a210a' 
go

-- @/iSamples/Mobile/News
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1fad554e-4e4e-4372-829b-cff23dd070a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6fc06e7-0bfb-408f-8ffd-d82e3ca14c4f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1fad554e-4e4e-4372-829b-cff23dd070a5' 
go

-- @/iCore/Events/Events_Calendar
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '866f65a9-b34c-4f10-8ec1-0c4c7cdffb15' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb51b544-f166-40bf-9459-d83945aa48b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '866f65a9-b34c-4f10-8ec1-0c4c7cdffb15' 
go

-- @/iSamples/Mobile/Contact_Management/Directory
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8eb0a62a-37ea-4374-9073-ba624940a40c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43fe8233-d497-4acb-9a9b-d8b03b63d371' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8eb0a62a-37ea-4374-9073-ba624940a40c' 
go

-- @/iCore/Fundraising/GiveNowTribute
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80d99bcf-27fa-4bd6-bca8-3c7f0dfb420a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '919771b7-e5ad-43ec-9916-d8cdf6640c9c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80d99bcf-27fa-4bd6-bca8-3c7f0dfb420a' 
go

-- @/iCore/Tools/Friendraising_Imports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '68032bde-dbc5-43fd-9f6e-bcaaee1baed3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f923d314-33e7-4cb7-baf2-dae3728bf744' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '68032bde-dbc5-43fd-9f6e-bcaaee1baed3' 
go

-- @/iSamples/AnnualConference/Speakers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2cae1d8d-ac6f-46a9-839a-784c16383326' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24d59784-5921-4668-96ed-db096b223012' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2cae1d8d-ac6f-46a9-839a-784c16383326' 
go

-- @/iSamples/Mobile/ContentAreas/Footer_Copyright
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db9f3f8c-4d8f-4dc9-a99a-b34e55da6855' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '40148302-0a9f-4c29-a651-db2ebf06e91a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'db9f3f8c-4d8f-4dc9-a99a-b34e55da6855' 
go

-- @/iCore/Store/StoreLayouts/Order_Confirmation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fbb62a6b-c4aa-4091-8a53-fc1b462ea2d6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '909af5a8-3e03-41be-b428-db552bb8c28e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fbb62a6b-c4aa-4091-8a53-fc1b462ea2d6' 
go

-- @/iCore/ProcessManager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '70e2fd34-2043-4fbd-9f9e-8877646c2200' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '29d7fa8f-d061-4bb0-af85-dbef14c08a83' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '70e2fd34-2043-4fbd-9f9e-8877646c2200' 
go

-- @/iSamples/AnnualConferenceMobile/ContentAreas/HeaderLogo
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '847fbcc6-c48a-431b-a8d8-c45d7d980174' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0266a9cd-d2b4-4a6e-8f69-ddd6c83d6b05' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '847fbcc6-c48a-431b-a8d8-c45d7d980174' 
go

-- @/iSamples/Donor/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72868ba7-857d-4483-85f8-e5e17227d4b5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a008ff08-341a-448c-b4ef-e0404c3d70b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '72868ba7-857d-4483-85f8-e5e17227d4b5' 
go

-- @/iCore/Contacts/ContactLayouts/Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9b0d6ba-83ba-4627-888a-094f3dd00180' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7947312b-f3ac-4fb9-9353-e0e775f9e7fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f9b0d6ba-83ba-4627-888a-094f3dd00180' 
go

-- @/iCore/Communities/Resource_Library
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f122a085-cb8a-4690-9fb7-eee450b7a34a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4ad69ec6-8b23-47d1-9b9d-e10993ba191e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f122a085-cb8a-4690-9fb7-eee450b7a34a' 
go

-- @/iCore/default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f17713ed-1b41-4d61-a299-815a8aae5d90' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f17713ed-1b41-4d61-a299-815a8aae5d90' 
go

-- @/iSamples/Donor/Get_Involved
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '127be9f7-dc26-4a1a-92a2-bb8ec333ebb9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '814f9d40-332a-4066-8918-e39af16baef2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '127be9f7-dc26-4a1a-92a2-bb8ec333ebb9' 
go

-- @/iSamples/Member/Chairs_Blog
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1794ea9c-29e0-4b31-b3d9-49aa26c355f5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1978b29a-e017-4a41-8cec-e506c67dfc12' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1794ea9c-29e0-4b31-b3d9-49aa26c355f5' 
go

-- @/iCore/Reporting_Services_Samples
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd86905cc-dab5-4059-858d-dfe354ebf706' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '578c5379-a81e-46d4-a73b-e78f1acf688e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd86905cc-dab5-4059-858d-dfe354ebf706' 
go

-- @/iSamples/Member/Join_Now_Student
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e26a2d64-37ba-4661-8053-c4b6ebd3fad7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '263b2505-7ea5-41f9-8148-e7a6b8e3c505' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e26a2d64-37ba-4661-8053-c4b6ebd3fad7' 
go

-- $/ContentManagement/DefaultSystem/Websites/Samples/iMISDonor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07f68f32-7faf-4223-8fe8-d2375b3cbc2f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07f68f32-7faf-4223-8fe8-d2375b3cbc2f' 
go

-- @/iSamples/Mobile/Contact_Management/Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2be1cd7b-bc76-4f8e-82ce-09364673f6e4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7809fb90-f560-462f-8355-e9a1de3d0c63' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2be1cd7b-bc76-4f8e-82ce-09364673f6e4' 
go

-- @/iCore/Contacts/Staff_Sign_In
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3931cafe-6f56-4eb4-a9df-b10a86a2e2aa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21160ad6-13cb-4919-a4ec-e9f2dc4aed24' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3931cafe-6f56-4eb4-a9df-b10a86a2e2aa' 
go

-- @/iSamples/Mobile/Store
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e9f7456-4da2-4a02-81e4-489fb5332480' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c39b8fc-1b47-4cc0-9e71-eb8664c1bae5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e9f7456-4da2-4a02-81e4-489fb5332480' 
go

-- @/iSamples/AnnualConferenceMobile/Cart_Home
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6dd1cf9d-7988-4d96-a0cc-bd0499dbbb23' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8738f345-08f6-4bf8-a5ac-edaa1336e0ec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6dd1cf9d-7988-4d96-a0cc-bd0499dbbb23' 
go

-- @/iSamples/Member/ContentAreas/FooterArea
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '921df327-78d3-4545-8506-8d76a63e9bbb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8a1062a-118d-4fce-b1e7-ee74580aafa7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '921df327-78d3-4545-8506-8d76a63e9bbb' 
go

-- $/ContentManagement/DefaultSystem/Websites/Samples/iMISAnnualConferenceMobile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5bcbf6f6-a856-4768-9dba-e34daa6e4de0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5bcbf6f6-a856-4768-9dba-e34daa6e4de0' 
go

-- @/iCore/Tagged_Content/News/CIIP_Certification_and_You
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e5acd36-2644-4465-991b-cdce8a12f0b8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3aee6427-f56d-45b9-8e5b-f02e9b8c57d8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2e5acd36-2644-4465-991b-cdce8a12f0b8' 
go

-- @/iSamples/Mobile/ContentAreas/SocialNetworking
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed7a8fc7-a326-43f1-80c2-5f14d190e372' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ef716f5-87a5-4ec7-a816-f05a47a8445d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ed7a8fc7-a326-43f1-80c2-5f14d190e372' 
go

-- $/ContentManagement/DefaultSystem/TaggedListFormats/BlockTaggedListTCTAtomPanel
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47e4d4d3-9547-4c1c-969f-d785467ae33a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2e3438f1-4e96-4bfb-8036-f0eeb5e13100' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '47e4d4d3-9547-4c1c-969f-d785467ae33a' 
go

-- @/iCore/Staff_Dashboards/Fundraising_Overview_Dashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c97c3d66-71ef-4311-92ee-c23954b68dc3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'baf65863-ae46-489d-a410-f1a415aed2bb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c97c3d66-71ef-4311-92ee-c23954b68dc3' 
go

-- @/iCore/AdminConsole/System Admin Landing Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7bc309c3-c850-4c65-bf57-668c759c5d54' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95084246-0463-4513-b2fa-f2cda28df7b5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7bc309c3-c850-4c65-bf57-668c759c5d54' 
go

-- @/iSamples/AnnualConference
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5abe8216-a584-4209-a67a-98738826f293' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d688eb1-e879-43c8-8c9f-f59a53487114' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5abe8216-a584-4209-a67a-98738826f293' 
go

-- @/iSamples/Donor/Volunteer/Preservation_Sign_Up
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '69896c13-ecb7-42df-b210-0367e155e008' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '37b522a7-9750-46b7-9064-f6bbd2e1bdb7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '69896c13-ecb7-42df-b210-0367e155e008' 
go

-- @/iCore/Contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89edaa64-af5c-4fb2-a30c-b1382fca2e0c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9afea922-9b63-43b2-bba8-fe235dd237ad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89edaa64-af5c-4fb2-a30c-b1382fca2e0c' 
go

-- @/iCore/Fundraising/Donation_Thank_You_Page
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c77a8c1d-20ca-45f5-a712-447ef2af4bc7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c23a5824-cfa9-4e96-8323-fe3b1979c0db' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c77a8c1d-20ca-45f5-a712-447ef2af4bc7' 
go

-- @/iCore/Communities/CommunityLayouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de9e3300-c86c-4e7d-97c1-fe66de6d7516' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84d0339f-5e3b-4a66-8fd8-ffef3fa9b265' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de9e3300-c86c-4e7d-97c1-fe66de6d7516' 
go

