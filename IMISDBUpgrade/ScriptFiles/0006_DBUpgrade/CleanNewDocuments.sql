-- $/Fundraising/DefaultSystem/Reports/SYBUNT
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21a4dc96-87b7-4ba0-b402-dc5e4092cb2c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31ec2535-d0d7-4282-bf30-0004d50a7e49' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '21a4dc96-87b7-4ba0-b402-dc5e4092cb2c' 
go

-- $/Fundraising/DefaultSystem/Queries/Dashboards/Major Donors For Manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0bcd3a02-e637-4808-86d3-8bfb22764a10' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3e2a0f0b-c501-4286-8458-0035ef318da4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0bcd3a02-e637-4808-86d3-8bfb22764a10' 
go

-- $/Membership/DefaultSystem/Queries/Join billing cycles
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b8c19c8-3b80-4deb-a1ad-aefea34b0dbe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '641c3445-723e-43a9-adde-010f9051e7bd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b8c19c8-3b80-4deb-a1ad-aefea34b0dbe' 
go

-- $/Samples/Dashboards/Volunteers/Progress tracker - Registered volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00eafcd8-d43c-4000-92cf-d84e8c8bf63c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '494b1600-b2e5-40f9-b195-01769002cf4b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '00eafcd8-d43c-4000-92cf-d84e8c8bf63c' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportDetail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a52f0f77-00bc-4c6e-8d0a-f364ddd0bf00' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4fe35dd1-69fd-4c73-a42f-025dd6898d70' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a52f0f77-00bc-4c6e-8d0a-f364ddd0bf00' 
go

-- $/Samples/Dashboards/Engagement/By score component
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81a79142-db5a-468b-9c52-824c10175649' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d43c9c1-470b-4195-a3fa-0317eed4f766' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81a79142-db5a-468b-9c52-824c10175649' 
go

-- $/Accounting/DefaultSystem/Queries/Payments/By Gateway Transaction ID
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dc1d4b77-eba2-4a5d-b485-7388124ab35f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abd607ce-4baf-4e1c-9aee-033a879e0a07' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dc1d4b77-eba2-4a5d-b485-7388124ab35f' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/AutoPay membership expiring credit cards
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dfbfc559-785e-40e0-be9a-921a72594d83' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a5bb749-4311-4d06-b330-03525b8b94b9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'dfbfc559-785e-40e0-be9a-921a72594d83' 
go

-- $/OrderManagement/DefaultSystem/Reports/Inventory Transactions by Date
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6798b6f9-55bb-49c3-9cac-66ba55a0997e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4aeeddd6-66fb-4bf1-92ff-03cc690d6c42' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6798b6f9-55bb-49c3-9cac-66ba55a0997e' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Utility/Engagement Score Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06a47009-fb21-4602-a856-516462d17275' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dff06f99-b222-45c1-8447-03d16146e35d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '06a47009-fb21-4602-a856-516462d17275' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Fundraising credit cards recently expired or expiring
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '22380be1-281b-498a-8123-9d19eb2e9765' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b083526-91af-485f-a22f-04524f458853' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '22380be1-281b-498a-8123-9d19eb2e9765' 
go

-- $/Common/Tasks/Queries/Follow up activity  tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fcefc2c3-76f1-40fb-8cfc-6d72c992368b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '862fee7e-5b4a-45c8-8198-0468fd28e2b1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fcefc2c3-76f1-40fb-8cfc-6d72c992368b' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/New volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9bbf2787-8d5d-4e76-b757-74e84cce9b71' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1e7f6bde-20ab-4682-82ff-05c629b29685' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9bbf2787-8d5d-4e76-b757-74e84cce9b71' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Total Auto-Pay Membership Payment Attempts Failed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '17b836c9-6ecd-4667-b3d6-d414e36c810e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c772dd00-7557-4710-a04f-06a6a328b29c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '17b836c9-6ecd-4667-b3d6-d414e36c810e' 
go

-- $/Samples/Dashboards/Engagement/Chart - Engagement by month
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '362cd49b-c807-4b1f-8f77-ce25d60b8e15' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c91e3b5a-eace-41e6-8db3-0860c14ba5b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '362cd49b-c807-4b1f-8f77-ce25d60b8e15' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Query Tabs/Moves managers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '227fd676-e047-40f7-9b61-089b0acebc38' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '09608093-d84e-4588-bfc5-0a9e5efeb495' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '227fd676-e047-40f7-9b61-089b0acebc38' 
go

-- $/Samples/Dashboards/Volunteers/Availability
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '600abec6-4fb9-4dc8-9061-aacd2a07171b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0876430-75c7-43ad-a3e7-0be0a7ba60e1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '600abec6-4fb9-4dc8-9061-aacd2a07171b' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Member Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b45186f3-c797-4517-a1c6-656d4620e0a5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5052ad85-cef1-4f0c-8ecb-0c04f855a2c8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b45186f3-c797-4517-a1c6-656d4620e0a5' 
go

-- $/Accounting/DefaultSystem/Reports/Deferred Income Analysis Spread
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47dda7fe-3d4e-4889-98e6-95b64c299066' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0e71493-e638-4e21-9f8b-0c6ecf4d0e7d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '47dda7fe-3d4e-4889-98e6-95b64c299066' 
go

-- $/Fundraising/DefaultSystem/Reports/Yearly Giving Comparison
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5eed31c3-8540-4500-9f76-9f01e62c0312' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3e8a177d-ae25-4577-b829-0c7bece88c94' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5eed31c3-8540-4500-9f76-9f01e62c0312' 
go

-- $/OrderManagement/DefaultSystem/Reports/Order Detail Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3425cfc6-b092-4f2e-8529-42be49a6fdca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84f99708-0a73-4349-ad40-0c935b7b6338' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3425cfc6-b092-4f2e-8529-42be49a6fdca' 
go

-- $/Samples/Dashboards/Volunteers/Data Integrity/Background check failed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06a6f2ca-1a8c-4e69-b3be-801794c477cd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd5d1aa6-effe-4f77-99d9-0cf80d73c8e2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '06a6f2ca-1a8c-4e69-b3be-801794c477cd' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Charts/Major donors by cultivation stage
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '630cd6f3-e46a-4aed-a77d-84aaee45edc5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ec3f8a25-82f5-4b54-aa4c-0e1fc9fc3c3b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '630cd6f3-e46a-4aed-a77d-84aaee45edc5' 
go

-- $/Common/Engagement/Queries/EngagementScoreDisplay/ScoreForContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce9b2b96-6913-408d-8f5f-469f5b76f728' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43cb91b9-0c26-4b45-9558-0ea066d8df28' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ce9b2b96-6913-408d-8f5f-469f5b76f728' 
go

-- $/Membership/DefaultSystem/Queries/ExpiredMemberUpdateDetailLog
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5affcc23-d2ba-4d30-8067-b30dbef71b9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8295b96-eac4-48c3-9706-0ea2fdb4d44a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5affcc23-d2ba-4d30-8067-b30dbef71b9e' 
go

-- $/ContentManagement/DefaultSystem/Queries/Groups/Theme Editors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b163486f-24ab-4943-ae5d-f66c464e1e5b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0eee329e-0077-4a61-acc1-1073fa73a0e3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b163486f-24ab-4943-ae5d-f66c464e1e5b' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Engagement Score Formula List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b5c290d-061a-4d05-adb6-567bff57274c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '708c74c6-24c0-455f-992c-10f213bd2345' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4b5c290d-061a-4d05-adb6-567bff57274c' 
go

-- $/OrderManagement/DefaultSystem/Reports/Product Inventory List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cfdf4ffb-2210-46cd-8cf9-03d8cfffacfe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '857ea4f7-9e84-431f-aa04-128d063640fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cfdf4ffb-2210-46cd-8cf9-03d8cfffacfe' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Payment Option Manager
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad4b78e6-22db-4da2-8b6b-462bc75882e4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea42ce1f-3e13-46b6-9e20-13f0e4670257' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad4b78e6-22db-4da2-8b6b-462bc75882e4' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b83b6a9a-c780-42f6-9a7e-e864dbe03641' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9a73d73d-2404-4e16-8886-13f2142385bf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b83b6a9a-c780-42f6-9a7e-e864dbe03641' 
go

-- $/Accounting/DefaultSystem/Queries/Invoices/All open invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c8f16612-38f7-4d0e-9ceb-a7cab94dfa72' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd47b0d77-adab-48c0-bfcf-1424368b612b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c8f16612-38f7-4d0e-9ceb-a7cab94dfa72' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website/Utility Navigation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4905141b-2f7a-4957-ab15-a07f81137338' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7638d43-8326-4f4a-834d-18c9b668751b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4905141b-2f7a-4957-ab15-a07f81137338' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportMultiple
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f454be80-b33e-48e0-9c8b-ac05ae87e4f0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc726d4d-81f7-44f8-993e-193183c88d47' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f454be80-b33e-48e0-9c8b-ac05ae87e4f0' 
go

-- $/Fundraising/DefaultSystem/Reports/Previous/Current Event Giving Comparison Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34526227-f334-4026-b76a-d85995f7a6aa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '96d3c633-59cf-447c-9242-19384540916a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '34526227-f334-4026-b76a-d85995f7a6aa' 
go

-- $/Membership/DefaultSystem/Queries/ManageExpiredMembers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc7003a8-5c05-4da5-8b95-2399d6854285' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e90c299-e6f0-4250-88ec-198a96a5ee98' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc7003a8-5c05-4da5-8b95-2399d6854285' 
go

-- $/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Total queued
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a67dd75-d22a-4bf5-b295-15385b5c663d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '74a90660-168d-45d5-bdbb-1a318f8284eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0a67dd75-d22a-4bf5-b295-15385b5c663d' 
go

-- $/Fundraising/DefaultSystem/Reports/Distribution Activity By Campaign
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4fe5ab25-f089-4b0e-9696-ee50d3c8a4b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a6a222ec-629f-45c7-a048-1a9dd5607904' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4fe5ab25-f089-4b0e-9696-ee50d3c8a4b7' 
go

-- $/Samples/Dashboards/Engagement/Chart - Engagement by category
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0813e0a6-9bd0-477d-9d85-d13d67653b29' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '456d589f-b253-4ab3-9816-1bd13c8350ad' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0813e0a6-9bd0-477d-9d85-d13d67653b29' 
go

-- $/Accounting/DefaultSystem/Reports/Credit Card Authorization Audit
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5470cc5b-5808-4906-a157-7b1d6d67517f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb137f4b-cf8c-4123-9985-1be427d15c52' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5470cc5b-5808-4906-a157-7b1d6d67517f' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5f46386-741d-492c-83c0-ad71a8fac923' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21ebe299-98c8-4e1d-ac77-1c32b5d84763' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5f46386-741d-492c-83c0-ad71a8fac923' 
go

-- $/OrderManagement/DefaultSystem/Reports/Backorder Summary Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '289f7d4e-2500-490f-86e0-897f2f9563ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0ff6ea9-ecd0-41ec-96e7-1d4429c22c67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '289f7d4e-2500-490f-86e0-897f2f9563ad' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Total cancelled fundraising enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b1133f4-a240-467e-a83d-49d11bb4e35e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5828407c-b4d1-4cf6-ad78-226756d31681' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1b1133f4-a240-467e-a83d-49d11bb4e35e' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Find renewal invoices due for automatic payment TODAY
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78912f6b-e0b4-4928-9f6f-c1bce86212cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1fdda742-5fb8-455c-8232-23a2691c78cf' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78912f6b-e0b4-4928-9f6f-c1bce86212cf' 
go

-- $/ContactManagement/DefaultSystem/Reports/3 Up Labels A4.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '931111df-c502-45ca-8f44-e7235dccf3b3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '460a241c-de02-4bc2-b0e7-23aaecb5a7b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '931111df-c502-45ca-8f44-e7235dccf3b3' 
go

-- $/EventManagement/DefaultSystem/InvoiceReports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bea8da33-2b11-406f-8564-31d202c36b48' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2808567-2b3a-419a-a3d8-265debd31904' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bea8da33-2b11-406f-8564-31d202c36b48' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Recurring donor details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84f55257-3226-4c22-82f0-402cc8f92852' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31dbbfb0-8f5e-438e-95ff-27c92739ae77' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84f55257-3226-4c22-82f0-402cc8f92852' 
go

-- $/Samples/Dashboards/Volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8013bf0e-491b-4f3d-afbe-3046f3f66f4b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b77ffb89-1ef8-4ce5-94ba-281c243d8e8d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8013bf0e-491b-4f3d-afbe-3046f3f66f4b' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/Progress Tracker - Potential major donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '758a300e-e580-4fc9-9a60-e6f83b6eedf0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8483e93d-0515-428e-b2da-28530feeb073' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '758a300e-e580-4fc9-9a60-e6f83b6eedf0' 
go

-- $/ContentManagement/DefaultSystem/WebsiteLayouts/CitiesResponsiveLayout
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1db48c8-01c3-492b-a2a6-2b7c07e258f9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b884cdc0-1ab0-49c0-8a72-292f339c6ec2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e1db48c8-01c3-492b-a2a6-2b7c07e258f9' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Auto-pay membership details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af5d91cd-3472-4da0-9121-bd81d623d9a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4e273122-7818-425c-b994-29a4ef20cd82' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af5d91cd-3472-4da0-9121-bd81d623d9a7' 
go

-- $/Common/Uploaded files
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7bec7900-27f6-4b83-9efa-cdeff0df0721' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '039f8b69-eaac-48d7-8208-2b0c54b02279' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7bec7900-27f6-4b83-9efa-cdeff0df0721' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website/Content Display
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5cb85406-a702-4bd8-8d5b-cb9b2d40ab72' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '680d926b-3294-4d74-9cd5-2b99199e6568' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5cb85406-a702-4bd8-8d5b-cb9b2d40ab72' 
go

-- $/Common/Tasks/Queries/Event function waitlist count
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3822e0ff-1f14-4634-87f5-2f43463c1715' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bcfa8103-77f2-43c6-a75f-2be25e5793ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3822e0ff-1f14-4634-87f5-2f43463c1715' 
go

-- $/OrderManagement/DefaultSystem/Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a955df5-4cd6-417e-a8d1-7451abe4c522' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8c562665-b9e5-43cf-94a7-2cba36512888' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4a955df5-4cd6-417e-a8d1-7451abe4c522' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Planning Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2057cb9b-5858-4a0c-b208-2ea549e72936' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '90d0c31d-bff0-49ba-8f7c-2e00bdfc2f10' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2057cb9b-5858-4a0c-b208-2ea549e72936' 
go

-- $/Accounting/DefaultSystem/Reports/Deferred Income Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e810b6e3-68d8-483c-b5da-11be811f0010' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '181340c7-1dd9-46ef-8fe9-2fd59a2bbf3a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e810b6e3-68d8-483c-b5da-11be811f0010' 
go

-- $/Accounting/DefaultSystem/Reports/AR Cash Transactions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2e301f1-19e3-4e8c-9fc7-ebbd82376dac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0ff146e-cd46-48f6-b7ed-2fe9a5b7a7b7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f2e301f1-19e3-4e8c-9fc7-ebbd82376dac' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Automatic payment enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4e40a44c-8b2e-4ad4-8844-db1d8be50760' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e236fc58-7a15-4299-8f88-2ffdb204f4dc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4e40a44c-8b2e-4ad4-8844-db1d8be50760' 
go

-- $/Fundraising/DefaultSystem/Reports/LYBUNT
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '344607a0-41e7-41f3-8ba0-0611944ab37d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'df624be7-c8d4-4bf5-8217-314509f40a90' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '344607a0-41e7-41f3-8ba0-0611944ab37d' 
go

-- $/ContactManagement/DefaultSystem/Queries/Volunteers/Find volunteers/By skills and interests
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a7ef462-b929-41de-8c72-3bbd293ebf77' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '166032de-52f8-4804-bb09-314e46da61fd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2a7ef462-b929-41de-8c72-3bbd293ebf77' 
go

-- $/Fundraising/DefaultSystem/Queries/Find gift/Donors by lifetime giving amount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3ae03bdb-2c42-4939-8e97-c0dc423fece6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a52f64dd-feca-4559-9c3b-31f171305cd3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3ae03bdb-2c42-4939-8e97-c0dc423fece6' 
go

-- $/Fundraising/DefaultSystem/Reports/Templates/TributeNotifications.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78e653fb-783b-4a4d-9d23-5216f89ce1e0' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '99740441-c2db-41cf-a831-31fedde122aa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78e653fb-783b-4a4d-9d23-5216f89ce1e0' 
go

-- $/Fundraising/DefaultSystem/Queries/Find gift/Tributes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6ea0adb2-4e74-4802-bd4e-a99c144d8174' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1874cc55-4a0d-4eaa-9bb4-33ce737e7f64' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6ea0adb2-4e74-4802-bd4e-a99c144d8174' 
go

-- $/Samples/Dashboards/Volunteers/Volunteer hours by month
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '98a10e22-eb52-4229-bb6a-9f39e5fc4493' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f494832b-ab1f-4add-a8e7-33d56bb1f304' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '98a10e22-eb52-4229-bb6a-9f39e5fc4493' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/PasswordExpirationDays
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb3f45a1-a381-442f-95e7-5f2ed93a6def' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0740d18-d56b-48c8-8ff0-3412068e52fa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb3f45a1-a381-442f-95e7-5f2ed93a6def' 
go

-- $/Samples/Dashboards/Fundraising/Funds raised by month
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fce5ee1e-caed-49af-b344-f48ab3bbf3b9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b55a0177-e549-4fd9-a2d6-34e5494a5393' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fce5ee1e-caed-49af-b344-f48ab3bbf3b9' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Status Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '360a65be-3f80-44ce-961e-cdf029dc42e7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8980cb02-d06d-427a-9890-365551fc1ef1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '360a65be-3f80-44ce-961e-cdf029dc42e7' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Upcoming scheduled volunteers summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd141f78d-f51b-4602-95b6-75659b95d7c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01cb1525-0c0c-4659-9058-36c89168fe56' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd141f78d-f51b-4602-95b6-75659b95d7c8' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Memorial Tributes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a079028-11ef-4ef9-ba6f-e978d583efe2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8a8c28e-4096-4725-804d-36e2a3b40cc3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6a079028-11ef-4ef9-ba6f-e978d583efe2' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Recurring memberships by member type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5731c3c9-f678-4f10-99b0-8a2b93256412' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59a20a4f-e85c-4e5b-afd8-37157666734e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5731c3c9-f678-4f10-99b0-8a2b93256412' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Finder Adder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3df80a61-c18f-47dd-88ba-d321b70b18f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46303028-2702-4d5e-b992-37439f56a256' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3df80a61-c18f-47dd-88ba-d321b70b18f2' 
go

-- $/Samples/Dashboards/Volunteers/Recent and Upcoming Attendance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f901c009-bc10-4453-81c9-60046ad387db' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf3acf38-1385-40e3-a3cb-38f9aed11b3b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f901c009-bc10-4453-81c9-60046ad387db' 
go

-- $/Common/Engagement/Queries/EngagementScoreDisplay/PercentileForContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3c3928d0-91db-44fd-9745-ab51cc9afa43' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd434dd0e-33b7-44c2-9979-39e65f52e646' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3c3928d0-91db-44fd-9745-ab51cc9afa43' 
go

-- $/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/All Invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '656d2ef4-a230-4a85-b776-fa5c7190f681' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a9119d4d-f5c9-4f15-9c7a-3a6ec075d8bc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '656d2ef4-a230-4a85-b776-fa5c7190f681' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Recurring Donation Payment Attempts Failed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bdf0daa1-7a61-4595-b0ae-bad77310c606' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '14206b2c-9fa6-4439-abea-3b8b36f9b33f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bdf0daa1-7a61-4595-b0ae-bad77310c606' 
go

-- $/Accounting/DefaultSystem/Reports/Deferred Income Audit Trail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10b623fa-c3de-41a7-b65b-9034806e94ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cfcf8023-d322-4331-a4b0-3c93aa0411c4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '10b623fa-c3de-41a7-b65b-9034806e94ad' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Volunteer attendance needing approval summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a433f078-f53f-4c0c-a524-2d1ec039210b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a2e3321-5967-4eac-86c1-3c9d1c6ef861' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a433f078-f53f-4c0c-a524-2d1ec039210b' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Regenerate Notifications/Issued notifications without email or mailing address
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b62f0bd-04ea-4bf8-9354-bda5a6f26e64' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f02025d7-9ad8-416d-bb23-3e5b507e9b0b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9b62f0bd-04ea-4bf8-9354-bda5a6f26e64' 
go

-- $/Fundraising/DefaultSystem/Reports/Pledge Income Forecast
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6369f3a2-3a4e-4caf-bb5d-a249c5a93c09' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1c4e968-00cd-407e-bfb9-3ef03deb781a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6369f3a2-3a4e-4caf-bb5d-a249c5a93c09' 
go

-- $/Samples/Dashboards/Volunteers/Data Integrity/Attendance needing approval
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '603ad705-8875-4318-a89e-af98f97f61de' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8fdcfd2e-87d8-48e3-9bc3-3f973051db71' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '603ad705-8875-4318-a89e-af98f97f61de' 
go

-- $/EventManagement/DefaultSystem/InvoiceReports/Event Invoice Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b42ecfa5-d087-4415-96ae-fd8c291a5cd5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0deeff88-079c-4f09-9fe7-3fa064331789' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b42ecfa5-d087-4415-96ae-fd8c291a5cd5' 
go

-- $/Samples/Dashboards/Engagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36bd9542-893a-48f9-8792-c7067deb3098' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd484e304-dc83-4fa9-9fbd-415cb8d1a504' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '36bd9542-893a-48f9-8792-c7067deb3098' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/AutoPay fundraising expiring credit cards
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85664a0f-55dd-45ae-814a-2617845a7607' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '666fbe57-1e68-45f0-85ff-41d8270e665e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '85664a0f-55dd-45ae-814a-2617845a7607' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Invoice
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0986ad70-66bc-4dcb-9a3e-d2d523820237' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13c3cf7e-53d5-434e-a7ac-42ccdbcc7ad8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0986ad70-66bc-4dcb-9a3e-d2d523820237' 
go

-- $/Samples/Engagement scores/ScoresByContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79b6b1d4-4f1a-4b46-9ace-253d073d0cba' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d27d403-ef19-425b-95d4-4526f216e957' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '79b6b1d4-4f1a-4b46-9ace-253d073d0cba' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Status Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '48dfb5dd-590b-493c-8cfd-86ea2d3b021d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'dcd2cdac-49b2-4015-af14-45597d1bad1f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '48dfb5dd-590b-493c-8cfd-86ea2d3b021d' 
go

-- $/Accounting/DefaultSystem/Reports/PayPal Reconciliation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7aa08edd-82e3-4fcd-9577-e8771c66ac6c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb71a365-b2ac-48f7-9439-469279b1f0e6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7aa08edd-82e3-4fcd-9577-e8771c66ac6c' 
go

-- $/Common/Communications/Templates/Samples/Account Statement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54a115d1-2872-4fee-b2bf-73c6a5d6ccca' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33b79ea7-3965-44bf-94ad-47299d637d91' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '54a115d1-2872-4fee-b2bf-73c6a5d6ccca' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Subreport-PrintNotes.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7aa49a54-f446-4eaa-ab14-558fc30147dc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '878b24fa-008c-491d-a2fe-473e49730bcd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7aa49a54-f446-4eaa-ab14-558fc30147dc' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Payment total per fund
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '330ddc6b-53df-4b9d-a2e2-e20693ed8f55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '24093631-1799-453b-bb37-4766d1ad14a4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '330ddc6b-53df-4b9d-a2e2-e20693ed8f55' 
go

-- $/Samples/Dashboards/MovesManagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'da8a12ab-15a7-4610-a495-f141b857df37' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ca0c4e6b-7c06-4f6e-916f-47a8d67b8428' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'da8a12ab-15a7-4610-a495-f141b857df37' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Query Tabs/Moves managers/All moves managers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '063e6f3a-cc0c-440d-8133-1541f9843b5c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fe25acb-85de-45ca-9430-4a797c435938' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '063e6f3a-cc0c-440d-8133-1541f9843b5c' 
go

-- $/Common/Engagement/Queries/OrgPurchases
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8727a82e-33cc-4f9a-8de9-4c1b5c16fb24' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b4d9909-ba33-49d2-87ff-4b5fcc0875c7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8727a82e-33cc-4f9a-8de9-4c1b5c16fb24' 
go

-- $/Samples/Dashboards/Engagement/Progress Tracker - Engaged organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc019a89-963e-4f7b-ab9a-872a8573d4cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82b4fe18-9b3f-4c08-9443-4da4426691c2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bc019a89-963e-4f7b-ab9a-872a8573d4cc' 
go

-- $/Accounting/DefaultSystem/Queries/Invoices/All invoices
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a30655c-825c-49a0-aee8-124dbf672433' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ae719da0-732a-4b3b-a4b4-4dd558d90ec4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1a30655c-825c-49a0-aee8-124dbf672433' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrations over time
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '702e879e-13b6-41cb-93bb-6d36defc94e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b22438d-b35e-45a9-b7cb-4f71e6b4b5f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '702e879e-13b6-41cb-93bb-6d36defc94e1' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration confirmations/Registrations without email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79f18c39-a5a8-48b4-b9f7-4162e77b96ef' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a3f2802-4c12-485a-bd02-4fb55e52d048' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '79f18c39-a5a8-48b4-b9f7-4162e77b96ef' 
go

-- $/Common/Communications/Templates/Samples/Content Workflow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b5e9f70-1c2e-4edf-a817-f18aed905084' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36ed7b13-1d6f-41e4-8442-503436a04d08' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8b5e9f70-1c2e-4edf-a817-f18aed905084' 
go

-- $/Membership/DefaultSystem/Reports/Dues Cash Distribution
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0362ab5e-c03c-4298-9b24-92df9eea92bf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a3f5d98-590e-4ae5-9be1-5080fc62ee8a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0362ab5e-c03c-4298-9b24-92df9eea92bf' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Event registration has invoice
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43400667-094b-4a15-812c-c34013edf50e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81aea83b-b87c-4ee3-a384-5194bd0772ba' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '43400667-094b-4a15-812c-c34013edf50e' 
go

-- $/OrderManagement/DefaultSystem/Reports/Promotion Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f7bc247-4d86-438a-a595-b164a2f32103' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3d676116-50fd-4b5c-b6f1-524f51ac1c9d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5f7bc247-4d86-438a-a595-b164a2f32103' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Program Item Certificates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f04c154-1f68-4061-b409-dc7ff686a0c7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f90f1cb-7116-45dd-948e-52536e45bb6f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7f04c154-1f68-4061-b409-dc7ff686a0c7' 
go

-- $/Common/Engagement/Queries/OrgMemberDonations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aa78c693-4f2a-4f8f-8615-a18bbae3ae74' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ccdf6e01-0eba-4c0d-a625-525ce4ef42ab' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'aa78c693-4f2a-4f8f-8615-a18bbae3ae74' 
go

-- $/EventManagement/DefaultSystem/Reports/Function Roster
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8eaf9879-6fcb-412a-9661-26fa8485ee1a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5fb127b-1e40-47b5-aded-525f63cd2117' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8eaf9879-6fcb-412a-9661-26fa8485ee1a' 
go

-- $/EventManagement/DefaultSystem/Reports/Combined Badge and Tickets
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4463c29b-d6d0-4df1-87f1-1444a8b150fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6d5190d-55ac-4aa8-9da7-5260322748f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4463c29b-d6d0-4df1-87f1-1444a8b150fe' 
go

-- $/Common/Queries/Value Lists/DataVaultAttemptStatusRef
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd76e9ad7-35cf-43fb-9128-0100583673ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06531fb9-fc29-42bd-8188-53631d7f4aa9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd76e9ad7-35cf-43fb-9128-0100583673ab' 
go

-- $/Samples/Dashboards/Volunteers/Progress tracker - New volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2c43507-fcad-4924-9590-6614457e9e94' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '15823eb9-f73c-4ba4-a163-53a194380a4c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd2c43507-fcad-4924-9590-6614457e9e94' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb50e514-94a2-4173-9288-0bb35f182898' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '439992cd-c597-43ad-b338-562bb84a776f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bb50e514-94a2-4173-9288-0bb35f182898' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Total cancelled auto-pay memberships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eb651e97-64e3-4059-a760-62c1ee9bbc55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f3a131e-f5f9-40dc-8280-56ab0dccc50a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eb651e97-64e3-4059-a760-62c1ee9bbc55' 
go

-- $/Samples/Dashboards/Engagement/Top contacts/Organizations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc157d32-26fd-4b7f-8c05-33b734ab22c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd29c3761-47b4-4fe5-b8dd-56ce1bb8686f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc157d32-26fd-4b7f-8c05-33b734ab22c8' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43b3fbcc-5854-47e4-a3d4-4a1c74427fdb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2bc5f95a-9eab-4280-8d99-57077d4a7f65' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '43b3fbcc-5854-47e4-a3d4-4a1c74427fdb' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Query Tabs/Moves managers/By funds raised
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '57083bca-fb6f-424b-95f8-98b17b65259d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe387574-da82-4dea-8b6b-574482a718d7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '57083bca-fb6f-424b-95f8-98b17b65259d' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Number of major donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f86046d-4562-41e1-9152-447a32170e11' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06c46f85-389f-4163-aba3-583969dd35a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5f86046d-4562-41e1-9152-447a32170e11' 
go

-- $/Samples/Engagement scores/SummaryByMonth
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '261c3da2-f30b-4135-9f7c-4755bb6468c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'db8a77e4-91cb-4821-a1be-5b000029c93f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '261c3da2-f30b-4135-9f7c-4755bb6468c8' 
go

-- $/Membership/DefaultSystem/Reports/Outstanding Dues Balances by Member
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd74c148-7175-48b3-a1e7-eb1be6458b9e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47587828-8ff2-4323-ad32-5b06169250ee' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd74c148-7175-48b3-a1e7-eb1be6458b9e' 
go

-- $/Membership/DefaultSystem/Queries/AutoPay/Find renewal invoices due for automatic payment ALL
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '341e9769-699c-414b-803c-79e86d523e44' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1bb0c9dc-1661-4c06-ac66-5b4ab2c58957' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '341e9769-699c-414b-803c-79e86d523e44' 
go

-- $/Fundraising/DefaultSystem/Reports/Legacy/Legacy Campaign Performance Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f752d886-7ad1-4023-867d-422ed81ce2d3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0b734c3-1bde-4052-a52b-5c764e8a1236' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f752d886-7ad1-4023-867d-422ed81ce2d3' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrants/Cancelled registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef993505-c291-4ff9-80b7-afdedacea6db' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5b4421a-12ac-411e-bd7d-5cd418bedc31' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ef993505-c291-4ff9-80b7-afdedacea6db' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrants
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02231fbe-c8dc-4a26-bd31-594813e67981' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d397371-fd2b-4096-89c4-5dedd4fd40c4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '02231fbe-c8dc-4a26-bd31-594813e67981' 
go

-- $/Common/Engagement/Queries/CommunitySubscriptions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bdad4e9f-6538-4482-8c26-578dbce9d4bd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '39ac62a6-1dec-4675-873f-5e5dbfc5fad2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bdad4e9f-6538-4482-8c26-578dbce9d4bd' 
go

-- $/Fundraising/DefaultSystem/Reports/Meeting Giving Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fdbc36b4-8cfb-4855-8bfa-d68cc80bd8be' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0314992f-40da-48f1-9077-5e6580c1afcd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fdbc36b4-8cfb-4855-8bfa-d68cc80bd8be' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website/Secondary Navigation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8dd51ae1-5910-4be5-b8a8-a0bed7a12ba8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23bf6887-1222-4921-9723-5ee3882663b6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8dd51ae1-5910-4be5-b8a8-a0bed7a12ba8' 
go

-- $/ContactManagement/DefaultSystem/Reports/Activity by Type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '714dcbb4-758e-4562-9b27-480d69243128' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47d634fc-53c4-43ac-8e66-5efd95b35cbb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '714dcbb4-758e-4562-9b27-480d69243128' 
go

-- $/Common/Communications/Templates/Samples/Navigation Workflow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a4068432-d0a3-4640-902c-9361f18d4089' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '950199de-e3f5-4796-ba17-5ff464f13a62' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a4068432-d0a3-4640-902c-9361f18d4089' 
go

-- $/Common/Communications/Templates/Samples/Event Cancellation Notice
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '664df8e3-43bb-4a1c-8f06-8b15fa560ee5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '64e880ef-f06e-4933-9ac1-602aacaf32cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '664df8e3-43bb-4a1c-8f06-8b15fa560ee5' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Billing Item Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b563cd9c-b522-4538-af1b-e1526f8fafde' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'faccc5e4-6a56-4763-9cef-6068fcd7024e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b563cd9c-b522-4538-af1b-e1526f8fafde' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details/Question Responses
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '88c7e757-e6db-454d-a1a9-804672c2bd9f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8f9dc24-da49-4a82-a285-60adaa27206b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '88c7e757-e6db-454d-a1a9-804672c2bd9f' 
go

-- $/Samples/Engagement scores/OrgScoresByContactByYearForChart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75402a3e-1a25-4ffc-bb1b-61383e5e56d7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '57d0e6e3-590a-4afb-b58b-618a8784492c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75402a3e-1a25-4ffc-bb1b-61383e5e56d7' 
go

-- $/Samples/Engagement scores/ScoresByContactByYearForChart
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c04d72b5-e833-4057-a713-91be95a63e97' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '439cf729-25f9-4783-a454-636d701643da' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c04d72b5-e833-4057-a713-91be95a63e97' 
go

-- $/ContactManagement/DefaultSystem/Reports/Committee Roster
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc429a07-408b-41e8-aecf-5e04e80029d7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55f3551d-5307-491b-bf29-68f00c495c3b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cc429a07-408b-41e8-aecf-5e04e80029d7' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Query Tabs
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50fcc9da-c37f-49be-acd0-a8ae68123bb5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55b24594-37f1-4b95-86bb-691b815d347b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50fcc9da-c37f-49be-acd0-a8ae68123bb5' 
go

-- $/Samples/Dashboards/Engagement/Progress Tracker - Average score
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5bf080fc-461e-46d8-a6bb-86aa5e0ea396' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0444a3d5-e9c9-4077-9def-692e71f363da' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5bf080fc-461e-46d8-a6bb-86aa5e0ea396' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Registration Confirmation.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a0dff398-9155-463e-bf4d-b225471eeeb5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '047a48e4-61ad-4855-ae55-69c5c1473b48' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a0dff398-9155-463e-bf4d-b225471eeeb5' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration confirmations/Registrations with email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8944915-0764-402c-b158-b77bd9601ca4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f43327a-da9b-4894-b824-6a6401a51cfc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8944915-0764-402c-b158-b77bd9601ca4' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Total fundraising credit cards expired
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9fe388db-4e2f-4bd7-8b7e-be5306cb6b83' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54015a46-4dc0-4a66-9c08-6a9b181da5be' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9fe388db-4e2f-4bd7-8b7e-be5306cb6b83' 
go

-- $/ContentManagement/DefaultSystem/ContentLayouts/Three33-33-33OverOne-FullWidth
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e590c488-68c2-4f39-ad33-e756ac7ede68' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ee3efd6e-f5a9-456c-b531-6bee7c4844f5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e590c488-68c2-4f39-ad33-e756ac7ede68' 
go

-- $/Common/Communications/Templates/Samples/Tribute Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8ebecac6-dde8-4848-a29b-d9274ec55ed5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '47e0d2aa-44ea-4d68-a341-6bf98d69405e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8ebecac6-dde8-4848-a29b-d9274ec55ed5' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Average gift amount
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c50715ee-1788-4307-b7c5-29e23bd36fd4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36733002-f4e3-4896-916a-6c9c3058073e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c50715ee-1788-4307-b7c5-29e23bd36fd4' 
go

-- $/Samples/Dashboards/Volunteers/Top volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c045464-4cc9-4841-b21f-c985f6f610ad' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4aeb8666-90a6-40b7-978d-6e19db16a556' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c045464-4cc9-4841-b21f-c985f6f610ad' 
go

-- $/ContactManagement/DefaultSystem/Queries/Volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8598da4-d780-4d1d-8237-d9dbb72460cd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2822422e-4e85-47ba-bd42-6e8f83e00879' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8598da4-d780-4d1d-8237-d9dbb72460cd' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Event registration from URL
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac94d2f6-df2a-453c-b03b-94263b238016' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '719b66b6-b38a-4e0c-886d-6f5d33631e2b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac94d2f6-df2a-453c-b03b-94263b238016' 
go

-- $/Accounting/DefaultSystem/Reports/AR Cash Daily Distribution Summaries
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1f5c512-3cd3-4745-b6f3-3114130b2466' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a9e37f7-48e0-4c52-abdf-70ce89595ac2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b1f5c512-3cd3-4745-b6f3-3114130b2466' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Total membership credit cards expired
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '554f70f6-f9ac-4e4d-b398-cd38964cf522' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d964018-c8fa-4edd-8170-72497faca08f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '554f70f6-f9ac-4e4d-b398-cd38964cf522' 
go

-- $/Fundraising/DefaultSystem/Reports/Source Code Activity Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0eaf15fe-3606-4456-939e-9c028cf547b3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a5b56ec-06df-4a0c-87d2-72fc498639cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0eaf15fe-3606-4456-939e-9c028cf547b3' 
go

-- $/Common/Engagement/Queries/Donations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '189b2936-b37b-4038-86f0-662f15ab8aef' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e94b1dd-8466-4161-8878-73ec4ec7773d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '189b2936-b37b-4038-86f0-662f15ab8aef' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Auto-Pay Membership Payment Attempts Failed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '707b9be7-67d8-46aa-b1ba-3b04c152a6fc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b6e1bd07-59fb-4b15-aa72-7418c40adae4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '707b9be7-67d8-46aa-b1ba-3b04c152a6fc' 
go

-- $/Samples/Dashboards/Events/Specific Events/Waitlist for a specific function
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ce12e551-f1c1-4dc4-8e45-60a435bf0212' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bbc906f5-53cd-46e1-800a-7661ef047f55' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ce12e551-f1c1-4dc4-8e45-60a435bf0212' 
go

-- $/Common/Engagement/Queries/OrgDonations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c6dd86e-b4e5-4724-93e9-27e7f2210b4b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '613aabc5-e935-44cb-8804-76f81bb431cc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7c6dd86e-b4e5-4724-93e9-27e7f2210b4b' 
go

-- $/Fundraising/DefaultSystem/Reports/Past Due Pledges
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '26e0f50b-e645-4f69-9b58-faa9829689b1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c19decd4-73e7-491f-bfe3-7748d5480c57' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '26e0f50b-e645-4f69-9b58-faa9829689b1' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Issue Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8e1990fd-e936-4286-9a84-5d655c54574f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e953c4c0-d828-4bb9-9728-774bf1aa3f41' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8e1990fd-e936-4286-9a84-5d655c54574f' 
go

-- $/Samples/Dashboards/Volunteers/Data Integrity/Orientation not completed or expired
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a485b00b-35f9-4aae-a946-5efd633b19f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cb15e367-8901-40de-b2ec-7758a6a8f363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a485b00b-35f9-4aae-a946-5efd633b19f2' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website/Primary Navigation
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81c3d16b-f12c-45a9-bd40-4d63424c004d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07b427c1-7ae5-49ae-b2bd-796059cdfcd0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '81c3d16b-f12c-45a9-bd40-4d63424c004d' 
go

-- $/Samples/Dashboards/Engagement/Not recently engaged
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02eeec04-f682-49f9-9955-31ae362f349e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6c5a60cc-7712-4417-b56c-7c342bfa9973' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '02eeec04-f682-49f9-9955-31ae362f349e' 
go

-- $/Fundraising/DefaultSystem/Reports/Donor Trend Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e16febb3-16b4-41d0-9777-e124d74aac0e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b84cf93d-a04f-4e75-bc85-7d031db7ca9b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e16febb3-16b4-41d0-9777-e124d74aac0e' 
go

-- $/Communications/DefaultSystem/Queries/ContentWorkflow/Summary of Navigation Workflow Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf250b80-d744-443a-9b3e-e5ee41339bd4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1b646b21-e582-47c7-9c4a-7d3e91215187' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bf250b80-d744-443a-9b3e-e5ee41339bd4' 
go

-- $/Fundraising/DefaultSystem/Reports/Previous/Current Giving Comparison Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '763e9212-4752-4b7c-aeba-2de13192ec3c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b85b9717-874f-4d9e-8752-7d788ab32bec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '763e9212-4752-4b7c-aeba-2de13192ec3c' 
go

-- $/Samples/Dashboards/Engagement/Engagement by member type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c869f4a-e5c4-49a0-aacb-c10a2b15237b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3876121-546d-4827-9cea-7dfe7a90bd29' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c869f4a-e5c4-49a0-aacb-c10a2b15237b' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details/Registration Option
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f3ea0ac-610e-4fc0-97a7-e768695176a3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e233fb27-2c02-4db9-bda5-7ee7f88630c3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3f3ea0ac-610e-4fc0-97a7-e768695176a3' 
go

-- $/Fundraising/DefaultSystem/Reports/Pledge Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '41215a3e-5842-4aa5-bc9c-9d3b8f9f6668' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f619dc9b-0efb-4282-849d-7f07f033bb9d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '41215a3e-5842-4aa5-bc9c-9d3b8f9f6668' 
go

-- $/Fundraising/DefaultSystem/Reports/Templates/Memorial Tributes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '550ddeb3-6d7f-456a-862c-5aae690da03b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '81fafa87-0d35-4ce3-8859-7f96946f4cc6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '550ddeb3-6d7f-456a-862c-5aae690da03b' 
go

-- $/Membership/DefaultSystem
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'beeddb14-ddcb-47cf-b8a6-e36a3a037206' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4be1f275-2f3f-4aa1-9854-80c37787fde1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'beeddb14-ddcb-47cf-b8a6-e36a3a037206' 
go

-- $/Fundraising/DefaultSystem/Reports/Campaign Activity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '54383e12-851c-4d30-a325-f69da05557cc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0f7aa0b-be31-4c31-b0bf-81269d0c230c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '54383e12-851c-4d30-a325-f69da05557cc' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration confirmations/All event registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '105fb6e2-e4b0-4058-928d-6ae03c80ede3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc5c37b7-9859-4ba5-ac4c-82511f69fac0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '105fb6e2-e4b0-4058-928d-6ae03c80ede3' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Volunteer background checks needing review summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d711cdd-dd89-4547-bcff-edbcce924828' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a99732c-9efa-46c1-a6dc-82dc6653836d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d711cdd-dd89-4547-bcff-edbcce924828' 
go

-- $/Fundraising/DefaultSystem/Queries/Find gift/By common giving criteria
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01535cd4-3d61-441c-864f-b4825987d889' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b0e289aa-506c-46f2-9358-83fa51d6412f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '01535cd4-3d61-441c-864f-b4825987d889' 
go

-- $/Samples/Dashboards/AutoPay
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7211492c-7a24-4ba4-9504-8a64cffffc80' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '948b94be-f9b5-4f1c-8e83-86dec1d9767f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7211492c-7a24-4ba4-9504-8a64cffffc80' 
go

-- $/Samples/Dashboards/Volunteers/Recent and Upcoming Attendance/Recent attendance (past 7 days)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b16b59ed-3e7b-4dc5-92e9-51cc0ed692e1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1625ab8-6b3a-48a4-b14c-87370b972a67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b16b59ed-3e7b-4dc5-92e9-51cc0ed692e1' 
go

-- $/Fundraising/DefaultSystem/Reports/Fund Performance Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3fffeb22-411a-4c0f-bf9f-99590f29ca9b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9aa4f9ab-6060-46d4-a6c6-87c57569c3b0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3fffeb22-411a-4c0f-bf9f-99590f29ca9b' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2201e49-f4f8-41f5-8b17-7c1abd8dc7a9' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5ce6f0ef-c702-49d6-afff-892d4c849d5f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f2201e49-f4f8-41f5-8b17-7c1abd8dc7a9' 
go

-- $/Common/Engagement/Queries/OrgCommitteeMemberships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c67f467-5698-42be-9663-78a696f7a21e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c29d8224-04fb-4ce4-a4fa-8b25b2ed0390' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c67f467-5698-42be-9663-78a696f7a21e' 
go

-- $/Fundraising/DefaultSystem/Reports/Legacy
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b7103b77-bd84-49b7-9817-50a42b407081' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ec2792f0-fd40-4f7d-8bb9-8b9a2664ea58' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b7103b77-bd84-49b7-9817-50a42b407081' 
go

-- $/Common/Queries/Billing/BillingLogByParty
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34b0453b-ce53-439d-bc1f-af410e727b06' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7529310b-ba19-452a-97a6-8c008a140e75' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '34b0453b-ce53-439d-bc1f-af410e727b06' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/General Tables Setup
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1aef63ba-4d77-41b6-a038-80b7dfe402da' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '29b63a4b-99c1-4e16-afbf-8d3a2d2341f2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1aef63ba-4d77-41b6-a038-80b7dfe402da' 
go

-- $/Samples/Dashboards/Community/Progress Tracker - Unique Logins
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b8414a1-edf7-490a-adf3-5176dd947093' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c641fa56-7305-4ba4-9120-8d9bad26aebb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5b8414a1-edf7-490a-adf3-5176dd947093' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e088123e-f479-4646-9d9e-526da4cfbb8d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4928f2c0-dbf9-4a5c-a062-907fa5f5ecb1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e088123e-f479-4646-9d9e-526da4cfbb8d' 
go

-- $/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ebec4753-2443-4608-8c60-7508aacdc327' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fc7c355a-b4f0-4015-8c3c-90d37e1d01aa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ebec4753-2443-4608-8c60-7508aacdc327' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/SessionTimeoutMinutes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3f17fc3-776b-4671-84d1-438b5838004c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '52de3930-d47c-414d-9832-911a49a8581a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e3f17fc3-776b-4671-84d1-438b5838004c' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Payment total per payment method
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '138d2493-5773-4a70-b871-c010f7e2f957' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a8ad011-752a-4c54-bc0a-9252304697a5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '138d2493-5773-4a70-b871-c010f7e2f957' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Charts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '78e79645-e6a5-4adc-ba93-53ade605e662' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0ff9815d-2d7a-452d-85c6-92532418b470' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '78e79645-e6a5-4adc-ba93-53ade605e662' 
go

-- $/Samples/Dashboards/Community/My tasks/Assigned to me
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3e25842a-d7fd-4f88-ae6f-953058e21e58' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95e581b4-ff03-48d6-8e79-93ba225d5b8f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3e25842a-d7fd-4f88-ae6f-953058e21e58' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportByBatch
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e305b3ed-7eb7-4554-a488-4cdb7145f356' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e3951461-62cc-495f-93d2-950b3cabe363' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e305b3ed-7eb7-4554-a488-4cdb7145f356' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrants/Waitlist for program items
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d759f11-4a8d-400a-ac04-d7f0f91ac946' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9fe1b419-4d56-4c7b-ade0-952b18e66c05' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6d759f11-4a8d-400a-ac04-d7f0f91ac946' 
go

-- $/EventManagement/DefaultSystem/Reports/Function Tickets
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '123a39f0-c05a-4d61-bfa1-d095c136d047' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '884c049e-e335-4c8a-a907-952e4c73e594' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '123a39f0-c05a-4d61-bfa1-d095c136d047' 
go

-- $/Fundraising/DefaultSystem/Reports/Memorial Tributes with Notify Contact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad999fa1-0a1b-494d-a0bd-1d278a1d3e40' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5663d5ad-5fe7-446f-9634-9546edd35822' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad999fa1-0a1b-494d-a0bd-1d278a1d3e40' 
go

-- $/Common/Engagement/Queries/EngagementScoreDisplay/CategoryForContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0b6f1284-fcca-4fd3-92bf-593162a5836f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e631823-38a4-4211-805e-957c3d886d7f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0b6f1284-fcca-4fd3-92bf-593162a5836f' 
go

-- $/Common/Engagement/Queries/CommitteeMemberships
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ceb2e77e-2792-47f7-a994-65d5dc8dfba5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd33e438f-f5f9-4fce-9c7e-95b718f5efee' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ceb2e77e-2792-47f7-a994-65d5dc8dfba5' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Credit card retention days alert.
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a9878a5-a277-4c20-ab16-8a653e721877' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a96c2e8f-1420-40ef-828e-977cbe80b249' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5a9878a5-a277-4c20-ab16-8a653e721877' 
go

-- $/Membership/DefaultSystem/Queries/ChapterList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '315a16a7-897c-4902-a819-808863ba6191' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '28c8aee5-7e3f-4158-8f97-97c5776c9178' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '315a16a7-897c-4902-a819-808863ba6191' 
go

-- $/Samples/Engagement scores/ScoresByContactByYear
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '221c5447-d365-4c84-b4d8-84f42afb83b1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9af69e97-2444-476d-9a8a-99012795c738' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '221c5447-d365-4c84-b4d8-84f42afb83b1' 
go

-- $/Fundraising/DefaultSystem/Reports/Donor Renewal Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '84baecfe-d715-4a41-8a1a-ed3d8649c6dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7ace8dfa-800b-40be-9cae-9904b99fdd82' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '84baecfe-d715-4a41-8a1a-ed3d8649c6dd' 
go

-- $/Accounting/DefaultSystem/Queries/ValueLists/SourceSystemList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c934e922-6eca-491a-a442-d5bd5b6c82dc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c28dd80-7b92-40cd-b1d9-996f94212c56' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c934e922-6eca-491a-a442-d5bd5b6c82dc' 
go

-- $/Membership/DefaultSystem/Reports
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd564be96-f830-4ca6-8023-165402b7b140' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02029ddf-f650-4c6d-807b-99abf5edd5c1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd564be96-f830-4ca6-8023-165402b7b140' 
go

-- $/Samples/Dashboards/Engagement/Top contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cfca7089-977d-46e6-a635-1f79b2be8b61' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd452641e-c4c1-4147-8846-99e81456bca2' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cfca7089-977d-46e6-a635-1f79b2be8b61' 
go

-- $/Common/Engagement/Queries/OrgRecentlyLoggedIn
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5b2cb4e0-a3ef-4b3c-b88b-1d095f2826a7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '06cd457c-c8f7-44dd-a239-9a5e3ddd8069' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5b2cb4e0-a3ef-4b3c-b88b-1d095f2826a7' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Subreport-Address2.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'af2e557c-c0e1-44d9-8dcd-d6bc76db839f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '59b07a9d-f564-427d-8ce7-9bce93dbc6f6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'af2e557c-c0e1-44d9-8dcd-d6bc76db839f' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Membership credit cards recently expired or expiring
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9217998a-a368-4d64-81b3-f68a29c5aab7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '175f23af-56f5-4b70-a402-9c574b80a22f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9217998a-a368-4d64-81b3-f68a29c5aab7' 
go

-- $/Communications/DefaultSystem/Queries/ContentWorkflow/Navigation Workflow Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '89615ec2-379f-4213-819c-867db7f6e789' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '45ccf3f2-f1f9-4ac5-ae9b-9d6366c8f4da' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '89615ec2-379f-4213-819c-867db7f6e789' 
go

-- $/Fundraising/DefaultSystem/Reports/Distribution Performance Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e5d39618-ae62-4b26-8bfc-18deaf305aea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c74a7bb2-c90d-4792-bd32-9f6f9e20331b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e5d39618-ae62-4b26-8bfc-18deaf305aea' 
go

-- $/ContentManagement/DefaultSystem/WebsiteLayouts/CitiesStandardLayout
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9d430c67-8428-460a-a5d8-eb5e49a051d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a1109f3b-e8f0-419e-96ae-a0ffb3c1de6a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '9d430c67-8428-460a-a5d8-eb5e49a051d8' 
go

-- $/Samples/Dashboards/AutoPay/Membership
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10b1b756-1c54-4132-8308-1bd8aaf42cb2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd4d50b35-42a2-474a-9ef6-a3462c362aec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '10b1b756-1c54-4132-8308-1bd8aaf42cb2' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Regenerate Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8b142825-3151-44a2-a9b8-6d23b158e4cb' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd2b196a7-53e0-45f3-a929-a38896fb668c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '8b142825-3151-44a2-a9b8-6d23b158e4cb' 
go

-- $/OrderManagement/DefaultSystem/Reports/Product Inventory Quantity Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5a65847-2f74-43a4-a1c9-ce2cbeca2c07' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ec3270d5-c175-4ac5-ad58-a43e4c3c508a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c5a65847-2f74-43a4-a1c9-ce2cbeca2c07' 
go

-- $/Accounting/DefaultSystem/Reports/General Ledger Journal Monthly Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '460a8495-35ac-458d-9bf5-8f3068edcd61' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '53050297-c63e-4200-9f84-a4e35cfca314' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '460a8495-35ac-458d-9bf5-8f3068edcd61' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Total active auto-renew members
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '33cf30af-5b00-4272-8586-ba581561b68b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '57dd9442-d1d3-42a2-a65c-a569247e34e9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '33cf30af-5b00-4272-8586-ba581561b68b' 
go

-- $/Samples/Dashboards/Community/My tasks/Unassigned tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb3a9252-9ffb-415d-8de8-c335d59064a6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd9040414-4dad-4088-9f1b-a5f4de4939ff' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb3a9252-9ffb-415d-8de8-c335d59064a6' 
go

-- $/Fundraising/DefaultSystem/Reports/Distribution Activity Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a8379c7-4538-4a10-b979-05e593ec7acd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30f42f37-cac6-478e-b6a5-a6e4685a51d6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5a8379c7-4538-4a10-b979-05e593ec7acd' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details/Registration Details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5ba5a76-32e7-4bb2-833f-9e883e649766' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8547982a-8b5c-49a9-a019-a7beae6f7d6b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd5ba5a76-32e7-4bb2-833f-9e883e649766' 
go

-- $/Samples/Engagement scores/SummaryByMonthAllComponents
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6822b5c8-5131-447b-8f0b-ecaaffdecdb2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0426f81e-195f-4f20-a387-a8a510ff409d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6822b5c8-5131-447b-8f0b-ecaaffdecdb2' 
go

-- $/Accounting/DefaultSystem/Reports/AR Cash Distribution Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2eb22981-82ee-4828-933e-5188dff16d6c' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8f0b4763-b261-45f5-9466-a987703d9fd3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2eb22981-82ee-4828-933e-5188dff16d6c' 
go

-- $/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions for Org
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd726b8e1-be94-4b05-91ac-48d66665e1a1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '41384c87-c137-4295-bfcf-a9d13377c9fe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd726b8e1-be94-4b05-91ac-48d66665e1a1' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Issue Notifications/Notifications with mailing address
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad219f2a-b864-4d22-9e06-18c0bd68b545' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f5ff4867-fc9a-4156-bd06-aa3009a848a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ad219f2a-b864-4d22-9e06-18c0bd68b545' 
go

-- $/EventManagement/DefaultSystem/Reports/Meeting Index
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '23f83947-70ac-470b-96ff-fbc3aec304fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3cc1ac0-f629-4466-a251-ab6e3f12ecca' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '23f83947-70ac-470b-96ff-fbc3aec304fe' 
go

-- $/Fundraising/DefaultSystem/Reports/Memorial Tributes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d974f99-3e85-4944-ac54-21d423700289' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8334e19-2c21-489a-bbb7-ac64d42d1c60' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0d974f99-3e85-4944-ac54-21d423700289' 
go

-- $/Common/Engagement/Queries/EventRegistrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a86b882c-bf03-4926-ad66-acbb193880bf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '13321e13-ec1f-4880-a031-ad33f1385408' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a86b882c-bf03-4926-ad66-acbb193880bf' 
go

-- $/Fundraising/DefaultSystem/Reports/Source Code Performance Analysis
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd84a9cf3-cbcc-4caa-9fcb-cf2685a4e647' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c97854e-7460-4b57-8cf9-adbd05e9619f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd84a9cf3-cbcc-4caa-9fcb-cf2685a4e647' 
go

-- $/Communications/DefaultSystem/Queries/ContentWorkflow/Summary of Content Workflow Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8ca10d4-9197-4649-9319-fc203e1b830d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b7a67c45-b1dc-469e-a900-ae2748e81d13' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8ca10d4-9197-4649-9319-fc203e1b830d' 
go

-- $/Fundraising/DefaultSystem/Reports/Outstanding Pledges
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '07a09cb5-b64e-481c-850e-1ff47b214638' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e65a240f-68de-4c78-8ba5-b00840a17bce' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '07a09cb5-b64e-481c-850e-1ff47b214638' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Query Tabs/QueryTab - Potential major donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd891ea6-b4ff-4f9c-95ba-f20cc2c48899' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3f4d59c-d214-4f7e-84c1-b01bc98ba6dc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd891ea6-b4ff-4f9c-95ba-f20cc2c48899' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportSummaryByMonth
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a402fac5-a2d1-42e3-a31e-7a7763da95a3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f587a434-fabd-4613-95ba-b08f614c78ea' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a402fac5-a2d1-42e3-a31e-7a7763da95a3' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent volunteer attendance summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1c902118-9931-4005-a36f-97af40f5b043' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '97dd2889-d350-45d4-af44-b0ac179cf5c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1c902118-9931-4005-a36f-97af40f5b043' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Subreport-PrintActivities.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '435197c4-69a1-4923-8b7a-badbdc2f50f8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cc8bf73b-59ed-4468-8d29-b0f499a009df' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '435197c4-69a1-4923-8b7a-badbdc2f50f8' 
go

-- $/Samples/Dashboards/Volunteers/Skills and interests
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0d10089d-044b-495d-9e92-18bb42ead750' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8116ac8-33e8-4c56-951d-b1631d4410ae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0d10089d-044b-495d-9e92-18bb42ead750' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Total active recurring donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7fc0615c-4339-4598-9695-0cccd7a8484f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1f925651-7bf7-4d81-8a56-b1f141700b66' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7fc0615c-4339-4598-9695-0cccd7a8484f' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Event Update Attendance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c55ebba-7757-4d19-9eae-fc7df9e6f6d6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '21083a53-f15c-4b0c-9ba0-b2b8a53a55ec' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c55ebba-7757-4d19-9eae-fc7df9e6f6d6' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Cancelled membership enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a61bd3b-b12a-4b33-870f-fc1378528aed' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a7a872f-9af2-465d-901e-b42ffcd91bb1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6a61bd3b-b12a-4b33-870f-fc1378528aed' 
go

-- $/Common/Communications/Templates/Samples/Tribute Notifications/Tribute Notification
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4d3b0b19-6994-4843-8f09-c1c3227aeba2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4b85aaa2-1f18-47c7-b085-b9b2a171d55a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4d3b0b19-6994-4843-8f09-c1c3227aeba2' 
go

-- $/ContactManagement/DefaultSystem/Reports/Activity by Name
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6d7fe325-e3cb-45c4-8427-55d1aa904f70' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '463609e8-3fbc-42bf-81e2-b9d0c0e8c981' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6d7fe325-e3cb-45c4-8427-55d1aa904f70' 
go

-- $/Accounting/DefaultSystem/Reports/Credit Card Post Authorization
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'acc98466-5947-4e07-8d1b-dacfbb93f94e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f1d2c554-a208-42fe-be8e-ba2663db8f2d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'acc98466-5947-4e07-8d1b-dacfbb93f94e' 
go

-- $/ContactManagement/DefaultSystem/Queries/Volunteers/Find volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e03ee383-fb89-46f6-8fb3-18de12e29b15' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c8963e53-958d-4961-92f6-bb061a1dfcd7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e03ee383-fb89-46f6-8fb3-18de12e29b15' 
go

-- $/Samples/Dashboards/Engagement/Top contacts/Individuals
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ffaca183-2eec-44bc-9b9f-d3fd25cb761a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '30b6fad7-fa59-4b87-b932-bc548c7f4905' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ffaca183-2eec-44bc-9b9f-d3fd25cb761a' 
go

-- $/Samples/Dashboards/Engagement/Progress Tracker - Engaged past 6 months
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f94dfe9b-602e-4ab8-a0b6-dd7142b53cfc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6dac1c91-7142-4ff6-b13c-bd11ccd56b37' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f94dfe9b-602e-4ab8-a0b6-dd7142b53cfc' 
go

-- $/Samples/Security/UserAccess/Contacts available to all users for security
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1044e9f-be81-4fda-a4d5-354d9872e066' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3e9d0843-b6c5-4c53-80bc-be8656c48358' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e1044e9f-be81-4fda-a4d5-354d9872e066' 
go

-- $/ContactManagement/DefaultSystem/Reports/Change Log
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea42c3b4-11c7-4e23-a16a-63a8262d7332' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd6d390ff-c328-44dc-83f3-bebaa7a1c152' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ea42c3b4-11c7-4e23-a16a-63a8262d7332' 
go

-- $/Fundraising/DefaultSystem/Reports/Soft Credit Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd6d766e-8d88-4c23-ab5a-a006001bf784' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '85f1f431-266a-4b60-baa9-c063d8a0e771' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cd6d766e-8d88-4c23-ab5a-a006001bf784' 
go

-- $/ContentManagement/DefaultSystem/WebsiteLayouts/Default
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '590f67ee-2943-453b-a5c2-3221c6b60dc8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '506917e3-0211-41d7-ad15-c0f8febdd486' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '590f67ee-2943-453b-a5c2-3221c6b60dc8' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration confirmations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c09aaa06-9170-4368-b658-85bf577d1447' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a888a8ea-5b19-48dc-9c95-c1ec327ce708' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c09aaa06-9170-4368-b658-85bf577d1447' 
go

-- $/Common/Engagement/Queries/OrgMemberEventRegistrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c8fc5a84-4d68-42cd-9e56-a939f71fcf3e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ddc2ea5b-5a4f-4ad5-ab44-c1f034173cc3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c8fc5a84-4d68-42cd-9e56-a939f71fcf3e' 
go

-- $/Samples/Dashboards/Engagement/Progress Tracker - Newly engaged this month
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ae2532b5-cf2b-4a9a-9e73-8da5e52cbcff' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4a622513-0bcd-4bce-ab01-c30cc19d1e5d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ae2532b5-cf2b-4a9a-9e73-8da5e52cbcff' 
go

-- $/Samples/Events/Event question responses
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c2d8a78-23cd-428b-882a-b39f0c403161' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8edddf7c-aade-486e-b3de-c3aac40dedda' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c2d8a78-23cd-428b-882a-b39f0c403161' 
go

-- $/Membership/DefaultSystem/Queries
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b9f36dce-f5b6-45a1-911d-4f6fed929516' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0cd72f8-8466-4f41-8bf1-c417ad2ea143' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b9f36dce-f5b6-45a1-911d-4f6fed929516' 
go

-- $/Samples/Dashboards/Volunteers/Progress tracker - Active volunteers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fb524f14-992b-4668-a571-45b3ddaba556' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3666e56d-256a-4937-a369-c448b2a7d3f8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'fb524f14-992b-4668-a571-45b3ddaba556' 
go

-- $/Accounting/DefaultSystem/Reports/General Ledger Journal Daily Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c0d3dd37-0114-4903-8e86-47ae276900b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '910166ba-8a62-4126-8efa-c45ecfd85d8d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c0d3dd37-0114-4903-8e86-47ae276900b2' 
go

-- $/Common/Tasks/Queries/Cancelled event trigger
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e1f89a18-1620-47b7-b220-d48e48df6193' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7e14d3dc-adbc-4390-97d2-c5a0a7ab2beb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e1f89a18-1620-47b7-b220-d48e48df6193' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Charts/Major donors by gift type
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ac2d0d5e-daca-4725-9b8a-72afc0002859' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f50f2a9b-56f0-4fdc-94bd-c5a52db2cd42' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ac2d0d5e-daca-4725-9b8a-72afc0002859' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Regenerate Notifications/Issued notifications with mailing address
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b1816464-94c9-47f0-9518-795283ed0690' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a4053ebe-78e5-49a3-a1e1-c614e451c226' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b1816464-94c9-47f0-9518-795283ed0690' 
go

-- $/Samples/Engagement scores/PercentilesByContact
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '153333d9-5a36-43c4-9887-2c31ea7a9ac4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '00a2d839-b315-4d95-9154-c61dca7305fa' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '153333d9-5a36-43c4-9887-2c31ea7a9ac4' 
go

-- $/Samples/Dashboards/Engagement/Top contacts/Organizations by individual engagement
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f2fd8bc2-eaaf-4f68-a71b-ee5a7f0bc508' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '245b73e5-4d7e-4044-8cab-c7475406df49' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f2fd8bc2-eaaf-4f68-a71b-ee5a7f0bc508' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '01957a69-7bc6-422a-b859-1e1154d251fd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12b19cdf-c95e-4242-b911-c7f9156a97bd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '01957a69-7bc6-422a-b859-1e1154d251fd' 
go

-- $/Common/Engagement/Queries/OrgCommunitySubscriptions
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e745a91a-aa30-4d22-aaff-c33afaaba10f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7bcd3b8f-fd52-45aa-a417-c822eba85e10' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e745a91a-aa30-4d22-aaff-c33afaaba10f' 
go

-- $/Samples/Engagement scores/ScoresByCity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '226c5047-03a4-42cc-a23f-ec0077b86e7f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ad550395-6d0a-488f-a965-c825df6e28b3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '226c5047-03a4-42cc-a23f-ec0077b86e7f' 
go

-- $/Common/Engagement/Queries/OrgVolunteer_attendance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a3af0901-abd6-4b4b-ad77-ed7dd635c826' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '43f8d5fd-9359-4e97-92a4-c9186a8868ee' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a3af0901-abd6-4b4b-ad77-ed7dd635c826' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details/Badge Information
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'abaad5f9-fbb9-4d3d-8f41-94d6b2bd3b28' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e515a7d2-240e-4a97-9eba-c9b62aeeb702' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'abaad5f9-fbb9-4d3d-8f41-94d6b2bd3b28' 
go

-- $/Samples/Dashboards/Community/My tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1572d9e9-c8df-404e-84b1-077871569163' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02a7ef54-b303-4fbc-8cb9-c9c9c7bc8a82' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '1572d9e9-c8df-404e-84b1-077871569163' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Recurring donations by fund
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b5da7efc-c070-4f4e-ab17-1d1c1a56135f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bb1c2171-6a65-4b4d-b8b4-ca452d3248c3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b5da7efc-c070-4f4e-ab17-1d1c1a56135f' 
go

-- $/Common/Engagement/Queries/Purchases
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '411563e9-520b-48d0-8091-3fa845a8035e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a21a0550-bace-4e41-8041-cab225eb33c9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '411563e9-520b-48d0-8091-3fa845a8035e' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportSummaryByDay
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '95f476bc-5d6f-4b1d-8d89-4aaa96bc96fa' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '473e21b1-a44d-4111-8dc1-cb7cc519467a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '95f476bc-5d6f-4b1d-8d89-4aaa96bc96fa' 
go

-- $/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Cancellations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'affe72f6-e6ea-420f-8ac0-cc94509946dd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '461a7ff8-1fec-4ee1-a2c7-cb95e36a972c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'affe72f6-e6ea-420f-8ac0-cc94509946dd' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLExportDueToDueFrom
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '50724816-2536-4997-9347-ac9e4f7198f2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d956137-d2f6-4852-9408-cb972d8a60d5' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '50724816-2536-4997-9347-ac9e4f7198f2' 
go

-- $/Fundraising/DefaultSystem/Reports/Previous/Current Giving Comparison Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '66ab62a7-4e93-4d99-bf68-e6d0398fa5d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '276102f0-56c6-4180-8ac5-cbd46d122bc7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '66ab62a7-4e93-4d99-bf68-e6d0398fa5d8' 
go

-- $/Accounting/DefaultSystem/Reports/General Ledger Journal Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '942537d2-f8ff-47c3-8361-8ecf348564ac' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e0ca027-e3fb-44a8-b76f-cbdb14c345dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '942537d2-f8ff-47c3-8361-8ecf348564ac' 
go

-- $/Common/Communications/Templates/Samples/Event confirmations/Sample event confirmation with report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5e235d78-8a6c-4026-ae10-01bceee54c8d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34a79721-df5d-483e-b7d7-ce75b3727454' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5e235d78-8a6c-4026-ae10-01bceee54c8d' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Issue Notifications/Notifications with email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cda19fe9-7aba-4033-b77a-840678b680b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7a90d213-051b-418d-9373-cedf69506786' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'cda19fe9-7aba-4033-b77a-840678b680b4' 
go

-- $/Samples/Engagement scores
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c635dedc-9d8b-4b6f-9b3f-b560d889f375' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '8beabcf0-daac-4db4-abeb-cf18234158a6' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c635dedc-9d8b-4b6f-9b3f-b560d889f375' 
go

-- $/OrderManagement/DefaultSystem/Queries/Find orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c815824-2ff0-45c9-ae00-1f8224b2c1f8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6e2d71e6-9a99-448c-8960-cfc265b724e3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c815824-2ff0-45c9-ae00-1f8224b2c1f8' 
go

-- $/EventManagement/DefaultSystem/Reports/Event Certificates
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '415184fe-8b4f-4431-8b45-3a6bfaa060dc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7b6b0428-9ee9-4428-bed3-d1499a45d7a8' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '415184fe-8b4f-4431-8b45-3a6bfaa060dc' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/PasswordHistorySetup
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8b80f17-1300-45a1-b642-9a03df5e3c12' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c52d60b6-b7b5-4a94-860a-d1e0620faede' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'd8b80f17-1300-45a1-b642-9a03df5e3c12' 
go

-- $/ContentManagement/DefaultSystem/ContentLayouts/OneOverFourOverTwoOverOne-OneRight-TwoBreakpoints
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f9384b29-b08f-488c-9e6e-40bd54c1df34' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3b45608f-0101-48de-a7c8-d27f0d54264a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f9384b29-b08f-488c-9e6e-40bd54c1df34' 
go

-- $/Common/Communications/Queries/Event waitlisted options
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a5cf32d0-0352-4678-9cc6-3212c925ca27' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5f9dfd28-42fb-440b-b091-d5647d9febfe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a5cf32d0-0352-4678-9cc6-3212c925ca27' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Website/Main Content Placeholder
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '859913bf-7b21-48f0-99d8-d0c1e3ad3e06' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3a79277b-fc8e-4bdc-a551-d5d241f5b68b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '859913bf-7b21-48f0-99d8-d0c1e3ad3e06' 
go

-- $/EventManagement/DefaultSystem/Reports/Meeting Roster - Order System Style
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '10202ced-5ca3-4f30-a77e-3b39264db4bd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8771879-3442-4fe9-aa0e-d7db56df16c7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '10202ced-5ca3-4f30-a77e-3b39264db4bd' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Total Recurring Donation Payment Attempts Failed
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6887ba45-2867-4b33-96de-743a0da26ba6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b8ae8ad8-55e0-4966-ab97-d82188fd62bc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6887ba45-2867-4b33-96de-743a0da26ba6' 
go

-- $/EventManagement/DefaultSystem/Queries/Registration details/Program Item Registrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e84534c7-9ed2-4191-9718-8caa8e6e9482' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '31ec0050-d6ab-4522-8e09-d878ff84f656' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e84534c7-9ed2-4191-9718-8caa8e6e9482' 
go

-- $/Common/Tasks/Queries/Selected function and event name
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bf280b66-44a1-41e8-b72e-236dcf8cb4a8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2f7246d5-63fe-4825-920a-d8eee2316545' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'bf280b66-44a1-41e8-b72e-236dcf8cb4a8' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Find recurring donation invoices ALL
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '127eec50-a311-495e-8db5-95df4d205abc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6964695d-dd6b-4b8c-9072-d9febfb989ca' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '127eec50-a311-495e-8db5-95df4d205abc' 
go

-- $/Common/Engagement/Queries/OrgEventRegistrations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6489830-538e-47b3-a75b-a00b92b642ea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '72f4c93c-11f7-41f4-bb87-dac306620eae' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f6489830-538e-47b3-a75b-a00b92b642ea' 
go

-- $/ContentManagement/DefaultSystem/WebsiteLayouts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '660b09ff-110e-4631-868e-6adc4d02bb2a' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '268c6e38-c5a4-45f1-97a8-dad708ef3da9' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '660b09ff-110e-4631-868e-6adc4d02bb2a' 
go

-- $/Common/Queries/Billing
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '256ace8d-a4b1-4c7a-811b-ac3eaea8b9b4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5afedb93-ec50-4bdd-aad7-db148a0b3966' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '256ace8d-a4b1-4c7a-811b-ac3eaea8b9b4' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Recent gifts by any major donor
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e238919f-1d31-45d7-9669-7346185797d1' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'fe8108e9-8094-49bc-ba68-db6b073de21a' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e238919f-1d31-45d7-9669-7346185797d1' 
go

-- $/Fundraising/DefaultSystem/Reports/Gift Confirmation Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0ad31b9-94e1-4809-9a66-4d9384778cb6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6436f844-0f9c-42f0-9ad6-dbac882af93e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f0ad31b9-94e1-4809-9a66-4d9384778cb6' 
go

-- $/Communications/DefaultSystem/Queries/ContentWorkflow
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '476b8b1c-249f-431f-bdd1-07f90773a071' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1d552a77-c052-4820-8b1c-dbb3755578c7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '476b8b1c-249f-431f-bdd1-07f90773a071' 
go

-- $/Samples/Dashboards/Commerce/Product Sales/Top promotion codes
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0e74d77f-7c49-4da3-a91c-5b211a46aa55' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '886a2774-6b2f-4112-b8c4-dc4b535f207f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0e74d77f-7c49-4da3-a91c-5b211a46aa55' 
go

-- $/Fundraising/DefaultSystem/Queries/AutoPay/Find recurring donation invoices TODAY
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6a9dbb5-c572-44bf-bc5a-1697e48bf35f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '483628d6-8296-41f7-99ff-dc7100393a49' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f6a9dbb5-c572-44bf-bc5a-1697e48bf35f' 
go

-- $/Communications/DefaultSystem/Queries/ContentWorkflow/Content Workflow Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4c89e66c-48ac-45e1-b893-ad1b7464609e' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ba2be291-8c83-4b7d-aed5-dd3f59fa4b51' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4c89e66c-48ac-45e1-b893-ad1b7464609e' 
go

-- $/Common/Engagement/Queries/RecentlyLoggedIn
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f284b490-4164-4a5b-ae66-ec55138ed1fe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd7e69e05-176a-4ef2-af65-dd4138a07b67' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f284b490-4164-4a5b-ae66-ec55138ed1fe' 
go

-- $/Fundraising/DefaultSystem/Reports/Monthly Donations Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '219958a7-d207-4a9c-985a-d4ec01f08ffd' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '910c9bc6-9723-46f9-8327-dd68880dfd99' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '219958a7-d207-4a9c-985a-d4ec01f08ffd' 
go

-- $/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Revenue from donors
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ff6e8762-0fea-4a48-9bdb-e605eb419207' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ed3ee60f-6b06-4f7b-bd94-df9d7b532a3d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'ff6e8762-0fea-4a48-9bdb-e605eb419207' 
go

-- $/Accounting/DefaultSystem/Queries/GLExport/GLDetailExportDueToDueFrom
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6898275e-c501-4899-ac15-7ea0a5dcb6ea' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '039c5920-132f-432a-849a-dfe6af4ab46e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6898275e-c501-4899-ac15-7ea0a5dcb6ea' 
go

-- $/Fundraising/DefaultSystem/Reports/Fund Activity Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '981d84b6-e7be-42ed-b491-487f4f7023b2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ef150a81-568e-4fb9-a7f7-e1eb1192ac86' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '981d84b6-e7be-42ed-b491-487f4f7023b2' 
go

-- $/OrderManagement/DefaultSystem/Reports/Product Price List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34951b5f-edc1-45b4-ad3a-c436968ad431' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c5e739e6-5e88-48a0-82b6-e46e98e24998' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '34951b5f-edc1-45b4-ad3a-c436968ad431' 
go

-- $/Samples/Dashboards/AutoPay/Fundraising/Cancelled fundraising enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2dfaa819-b69b-4118-92bd-e481d87150a6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2406ca23-e62f-4731-ab12-e4753a6b944e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2dfaa819-b69b-4118-92bd-e481d87150a6' 
go

-- $/Samples/Dashboards/Volunteers/Progress tracker - Volunteer hours
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e0d8591d-c7ea-4ce6-a0a8-3bf9b3546a0b' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd11ea371-ab0d-45ee-8994-e4779ed9bf9e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e0d8591d-c7ea-4ce6-a0a8-3bf9b3546a0b' 
go

-- $/Common/Engagement/Queries/OrgNumberOfPosts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '3f4509b5-312e-49c8-b927-7586ed39d7ab' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f591f0f8-777c-4d1b-8aea-e4b7581c87a3' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '3f4509b5-312e-49c8-b927-7586ed39d7ab' 
go

-- $/ContactManagement/DefaultSystem/Reports/3 Up Labels.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4cb0cf30-e84d-40f3-9997-90fc616b79d8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'aaa5724b-2efe-4132-a64d-e6da04d12d78' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '4cb0cf30-e84d-40f3-9997-90fc616b79d8' 
go

-- $/OrderManagement/DefaultSystem/Queries/Find orders/Find orders
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6b19bd4a-2766-49c2-8e46-8bf844f13f2d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9f506076-ea16-4090-8bea-e6eb4deedb27' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6b19bd4a-2766-49c2-8e46-8bf844f13f2d' 
go

-- $/Common/Tasks/Queries/Unassigned activity tasks
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '66b5b48a-6065-44cb-9691-dec6e64219be' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '34cb5e2f-d37f-43a3-bd52-e8a0af6f7ffd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '66b5b48a-6065-44cb-9691-dec6e64219be' 
go

-- $/ContactManagement/DefaultSystem/Queries/Volunteers/Find volunteers/By availability
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '421d59ab-432c-479b-8fc9-351dd783a8e4' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6a7a7a9b-c126-4693-b501-e91edace83cb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '421d59ab-432c-479b-8fc9-351dd783a8e4' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Subreport-Roster.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '902160bc-c844-47f8-a69a-31711065c341' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b3d8d62c-2128-46d4-99a2-e99fd46dce10' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '902160bc-c844-47f8-a69a-31711065c341' 
go

-- $/Common/Tasks/Queries/Staff dashboard alerts/Specific event has tickets
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '63c6c320-a414-425e-8ebb-e125c875fdfc' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '79b2836b-a332-4647-af8e-eaa399bf5399' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '63c6c320-a414-425e-8ebb-e125c875fdfc' 
go

-- $/Samples/Engagement scores/SummaryAllContacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '12c39882-c559-4249-92a0-46ad786995c5' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7877df03-f2cb-4e6b-aa1d-eb1595d4106f' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '12c39882-c559-4249-92a0-46ad786995c5' 
go

-- $/ContentManagement/DefaultSystem/ContentLayouts/OneOverFourOverTwo33-66OverTwo50-50OverOne-TwoBreakpoints
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'de44d62e-e05c-4283-b51a-c10fc3c6bd93' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea3b0190-ffaa-4938-aa54-eb30e97cffbe' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'de44d62e-e05c-4283-b51a-c10fc3c6bd93' 
go

-- $/Accounting/DefaultSystem/Reports/Deferred Income Matrix Summary
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0fc06cd3-31a2-4613-a02c-92f2ce454321' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c065eaaf-b4c2-4ffe-9704-eb577d1084fc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0fc06cd3-31a2-4613-a02c-92f2ce454321' 
go

-- $/Common/Queries/Value Lists/DayOfTheWeekRefList
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '66ccfe24-e0f2-4108-8302-4cf4fa523a12' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b466dc76-3211-4e0d-aedd-ebe0b2b6fd4d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '66ccfe24-e0f2-4108-8302-4cf4fa523a12' 
go

-- $/Common/Engagement/Queries/EngagementScoreDisplay
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '46509796-ce75-4c91-9443-9555f4cde400' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f99e609b-e2fd-4468-b45b-ec017adda6a0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '46509796-ce75-4c91-9443-9555f4cde400' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/ASI Only/Tribute Notification Creator
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '80b53b2b-304c-4191-ac41-c54c7cbe5e45' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '14d1efc3-21e2-456d-8ffe-ec377eb7fbe4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '80b53b2b-304c-4191-ac41-c54c7cbe5e45' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e9a2571c-1fda-4f74-b708-a3453c7d790d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'bc89a5b8-719d-404b-ba36-eca9c112a7dd' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e9a2571c-1fda-4f74-b708-a3453c7d790d' 
go

-- $/Common/Engagement/Queries/Volunteer attendance
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '38b0da04-29ad-4a31-a876-3711f079ac03' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ee0fd2b0-3906-43c3-b7df-ecf41dcc019d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '38b0da04-29ad-4a31-a876-3711f079ac03' 
go

-- $/Fundraising/DefaultSystem/Queries/Find gift
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e53886d4-e5db-45bc-9721-21df5f794e8f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '77ee3be7-57f2-4966-a776-ed9468767e48' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e53886d4-e5db-45bc-9721-21df5f794e8f' 
go

-- $/Samples/Dashboards/Volunteers/Data Integrity/Background check not completed or expired
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5c6a486e-c784-4b39-9b91-a05ed5914c35' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '58c1ae64-2a33-450d-bb46-edb6934e916d' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5c6a486e-c784-4b39-9b91-a05ed5914c35' 
go

-- $/Communications/DefaultSystem/Queries/Tribute donation details
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f36f836f-3d8c-4736-aacc-762e09abef40' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9b72b77d-c711-4743-b743-ef446e6b2401' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f36f836f-3d8c-4736-aacc-762e09abef40' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Issue Notifications/Notifications without email or mailing address
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '261a5355-146a-42a7-9699-53633bda9c13' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2a483c87-cc08-4fbb-8b2f-ef64729692eb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '261a5355-146a-42a7-9699-53633bda9c13' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile/Subreport-Address3.rdl
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '275868ee-d029-4b19-83fa-33f8a8ece136' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f6eeea73-3f8f-499a-b149-f018bf574758' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '275868ee-d029-4b19-83fa-33f8a8ece136' 
go

-- $/Samples/Dashboards/Volunteers/Recent and Upcoming Attendance/Scheduled volunteers (next 7 days)
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a8d4b571-428a-4fb9-b58b-0935c2253719' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd390b05e-2433-4f56-9e8c-f02ff89cf4fb' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a8d4b571-428a-4fb9-b58b-0935c2253719' 
go

-- $/Common/Communications/Templates/Samples/Event confirmations
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '36391b18-19ff-4028-a65a-a9e6bfd888b7' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd8c09008-8d25-405f-afbf-f2f7b28621d1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '36391b18-19ff-4028-a65a-a9e6bfd888b7' 
go

-- $/ContactManagement/DefaultSystem/Reports/Member Profile
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'c7603a2d-e114-4e18-9671-cfc3892a7d2d' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '9fd6ffb4-999e-43af-abb2-f4c5a3a1d659' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'c7603a2d-e114-4e18-9671-cfc3892a7d2d' 
go

-- $/Samples/Dashboards/Volunteers/Data Integrity
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '570ea468-5606-48d4-9f47-4d33370d6ef6' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1a3635fc-9abd-44f5-9203-f5b3efc15141' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '570ea468-5606-48d4-9f47-4d33370d6ef6' 
go

-- $/OrderManagement/DefaultSystem/Reports/Product Sales by Category
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '5a4bc068-3fdc-43e5-afce-db561faaec02' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '1ef6b901-702a-441d-939e-f5b869f4b11c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '5a4bc068-3fdc-43e5-afce-db561faaec02' 
go

-- $/Samples/Dashboards/Engagement/Progress Tracker - Engaged contacts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a80b285a-6c33-4d2b-8cba-55ec73ee29cf' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '02bfc73e-1cc7-4f59-a030-f6d5faf9c5bc' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a80b285a-6c33-4d2b-8cba-55ec73ee29cf' 
go

-- $/ContentManagement/DefaultSystem/WebsiteLayouts/NaturalHeritageSitesResponsiveLayout
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2c4e6e9d-1e35-45d8-8403-515e5572be11' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8d8c984-9dad-4875-ba80-f7ef77a25116' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2c4e6e9d-1e35-45d8-8403-515e5572be11' 
go

-- $/Common/Engagement/Queries/NumberOfPosts
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '2d58f53c-851c-4615-9fef-f9d7ed3bafc2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7f629087-2c5c-49e1-98b0-f851cd871ac7' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '2d58f53c-851c-4615-9fef-f9d7ed3bafc2' 
go

-- $/EventManagement/DefaultSystem/Reports/Registration List
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e8837883-86c6-49de-9598-cf2a6da3a573' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '91d9a300-17f2-46d9-8934-f8f924a46e66' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'e8837883-86c6-49de-9598-cf2a6da3a573' 
go

-- $/ContentManagement/DefaultSystem/ContentTypes/Offering/Automatic Payment Enrollments
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7953c9e7-4de8-4c75-a009-cdd2a80e5d3f' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'ea794916-179f-4780-a351-f914b3a2d27e' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '7953c9e7-4de8-4c75-a009-cdd2a80e5d3f' 
go

-- $/Fundraising/DefaultSystem/Queries/MemorialTribute/Tribute Notifications/Regenerate Notifications/Issued notifications with email
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '0a0840af-1d95-40f8-be47-4a8cfe23ddfe' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'd5fe0b96-4ffa-48df-b1d4-f96f91a1032b' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '0a0840af-1d95-40f8-be47-4a8cfe23ddfe' 
go

-- $/Samples/Dashboards/AutoPay/Membership/Auto-pay members by region
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'b36b766b-115d-4126-be59-9d28d60a2fe2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '4150df27-c5c3-477d-803c-fad09375d707' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'b36b766b-115d-4126-be59-9d28d60a2fe2' 
go

-- $/Common/Engagement/Queries/OrgPurchasesByOrgMembers
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'eebb91d8-2c0e-4a59-aebe-599b5e05c3ae' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '92d7818e-e91b-4f7a-8619-fbed62d517c4' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'eebb91d8-2c0e-4a59-aebe-599b5e05c3ae' 
go

-- $/Samples/Dashboards/Events/Specific Events/Registrants/Waitlist for registration options
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f27c3d46-b670-4ab9-b4b6-f1dff33f5349' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'f0b31acd-079f-428b-a82d-fcb459e42fe1' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'f27c3d46-b670-4ab9-b4b6-f1dff33f5349' 
go

-- $/EventManagement/DefaultSystem/Reports/Formal Meeting Roster
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '6f06b7be-ad40-4e23-a944-d6a2c13565c8' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'e4abd438-f568-494d-8aa3-fdb5eac06df0' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '6f06b7be-ad40-4e23-a944-d6a2c13565c8' 
go

-- $/Fundraising/DefaultSystem/Reports/Meeting Giving Detail
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '82ed66ff-1ee1-47df-99a0-a0f7b2f53cd3' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '55d3ac0a-3f48-415d-9f7f-fe2c9fff041c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '82ed66ff-1ee1-47df-99a0-a0f7b2f53cd3' 
go

-- $/Samples/Engagement scores/ScoresByCountry
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'a7a7732b-5600-40d9-aba1-10c12057c0d2' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '7c91f407-58fa-4b6c-9f4f-fe39e477d329' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = 'a7a7732b-5600-40d9-aba1-10c12057c0d2' 
go

-- $/EventManagement/DefaultSystem/Reports/Weeks Out Report
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = '75b56dd2-3c39-4b5c-9299-3c0056afac28' 
DELETE h FROM [dbo].[Hierarchy] h WHERE h.UniformKey = 'cd0c7629-0387-4add-b682-ffe113d6fa2c' 
DELETE FROM [dbo].[DocumentMain]
 WHERE [DocumentKey] = '75b56dd2-3c39-4b5c-9299-3c0056afac28' 
go

