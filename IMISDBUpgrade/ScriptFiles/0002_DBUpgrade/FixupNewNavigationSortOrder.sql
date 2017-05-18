-- Update Navigation Hierarchy Keys with proper Sort Order
DECLARE @sortStart int

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7c9553cc-191c-43e8-a750-005a52ff3db0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f92355ea-6448-42d1-a301-d335ce42d2ad'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8d777523-cff9-41fa-86da-ca59aab51903'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '0f2b60ea-9ce5-4313-8afb-063a780876e7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '89693037-f173-44df-887a-a9642db68dd2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '63a6dfcd-4758-4201-b1bb-e32406dffdd0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd341ef5f-603d-4937-9863-1cba2e5d51d9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'f5ec102e-d719-4ccc-9821-fbea9c5bff0b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '2c405294-a043-4f58-9723-0b890113e7e2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'c89b6454-806e-441b-9c14-f0beeafa8270'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '004b4c17-8c00-4d4f-8e56-3a5ba7f5b767'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'e2fc2fb4-9086-47da-8e15-77b211503ebd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'd63f23f3-b4eb-45f6-9b2e-ec4282fd163b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '09e0cccb-bacf-4f80-b5dc-be5098e29e7b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '8211c18b-44b2-4f0b-999b-a51a99d076b5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'a5fa1d29-4f27-46d6-9d32-4fe2601860be'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '6d1d5d4b-11a5-49ff-8631-95a8e981ca65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'aee18121-6d38-422f-81fc-73941236aa79'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'ba712a57-8a97-4e58-8618-74b214deb7ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '342ace4c-97e9-4a76-acbf-25d7df3985fd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'b30f482e-8bb1-46da-8190-965d128d6044'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = '80b78f86-61db-445c-bfc1-a64a5760f4c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = '3dd558bc-260d-4dbe-a316-e456537f5777'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [HierarchyKey] = '4ccf0282-c875-4420-a2d2-fd7c0957c06c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [HierarchyKey] = '650fbd63-ff85-4a61-b1ef-3abefa33c1cc'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '48cb8dea-30b0-4671-947b-0d53709ece76'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '6c631599-63e5-44fa-9b90-6a2074557566'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '614f2e60-8236-4311-ba97-c7afd5e2f1c6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '6fc746a5-dcda-430a-80ac-b8af4b47846b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'd3a3e446-e9fb-45be-ac3d-10d42066249a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '547853a3-1f7a-454e-b3b8-f58e65ab0a97'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'b4fc44a3-8307-4e88-a2e2-af23f2dc7f22'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'c2aa1fc9-b36e-4080-b0ed-718e2fc735db'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '7549e391-0c46-40b8-b4f8-ca72c4c2b836'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7668377a-a09f-4523-a516-0db22e245f71'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'af9f6187-1773-449a-b136-91e28180253d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'fbb1fa1e-760b-4c1b-b56c-3f73abc97d70'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '68df2663-22b5-4419-a61b-12b744efa8cd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f7a82e1c-3b83-4c63-bf3f-cd1bece969e3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'ef940f30-e18c-40a8-97fb-e27f46e7aed9'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8452e8d5-fac6-442a-a648-14281edd2e65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f6523600-83b2-4f9d-941b-53df202a5f76'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '57838bcb-a8c2-4c85-8dae-84ca04bcfe7b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'af0498a2-f17e-43fb-883b-4e54ac412fbb'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7330d2a0-4a80-4cd7-ab02-15d7d72df9f0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '19d5f0c0-d773-4d66-b58a-c1a814c1f18e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '65b98481-6010-402b-952f-391b67b36cb1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd867de67-0d87-4826-948e-1cc79f514bcc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'cea5f613-2240-448a-81c9-cf0dc487a55f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '3d853e42-16b2-4cf9-89e2-652bea25f4f6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'dfa1fb00-cf0d-414d-b45b-33cec860d5e3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8b5c78f0-22bd-46a3-897c-672b587ff009'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '9ef0cdd5-5dfd-4eff-a4e1-c5ed15a06038'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '28b39c51-4f62-40bf-958b-f83e54c218e0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '0af4333c-87f3-49e0-83bf-9586ff258cbb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '63069a89-7024-46c6-a6a3-4efc6e527e9c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '5292a019-b4bb-4d91-b6bd-8259e31c22ad'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '83a63924-7c98-4cc1-8beb-7771277f8cc2'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '0c87b1cc-87c4-48e6-9972-eee59f0cf967'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '98cb6c6f-6234-43e2-80cb-b4858bf0dc15'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd867de67-0d87-4826-948e-1cc79f514bcc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '9ab8d910-6edd-44f8-9fb1-46f78f258c0d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '48cb8dea-30b0-4671-947b-0d53709ece76'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '8de19e32-b8c4-4a40-a109-efd57872d677'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'b07b2137-2292-4bd7-9909-d8abb8e2dbe6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'f254fca0-c422-415a-ab74-99b780fc2a1e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'dacdd830-1f30-4860-9e96-db48614f755c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '2c405294-a043-4f58-9723-0b890113e7e2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = 'd58f1bb0-b612-4386-866c-8c9a53fcd6fb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'c280f8bf-729c-4f47-8d40-ba4d95cddae3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = 'a157668c-b3a8-4b68-b8b4-ed5248775b03'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1e6e4b1d-15b3-48cb-ae4b-28ddce08c537'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '3edc68d6-a64b-4a60-b472-0a2f8e0b6424'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '7330d2a0-4a80-4cd7-ab02-15d7d72df9f0'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8a603434-d1d8-4f8e-bf73-298e48a8e042'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a8057435-2556-46ed-8822-18500f802f11'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2e7dc785-48f8-43c9-a18e-c4c52756ee65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '3b318353-158c-4122-8586-80e543be3924'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '4dc33bbf-c7ac-42cc-b16c-14a0c2aa59ae'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '572f6ffc-fd68-407d-bc37-958af46ac7a9'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a0d7c101-7675-406e-a988-29bba911eb3f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ac48f633-b9aa-4005-8300-5b91d0171605'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '1bdb1cee-b661-4420-83a5-9fec5f26bc23'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4156d52e-c4ee-45f1-8276-2c7c5db2b579'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a6865b94-3581-45d8-8e3a-f763e5e962a8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'e479bccc-47bf-49c2-aab8-dda5f6b409b4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '86bf7ef0-405d-43a2-afba-ea669bb1ee8a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '19483e2b-3323-4c9c-b075-e7bebc7bf952'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '22c693d7-52a4-41de-807f-624e36107b16'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'bf9d483a-4bfd-4bf4-944b-4f740392b650'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'bcb327ba-2038-4baf-8454-e3a1855013a1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1036290a-d70d-4dbf-80e6-2d21853061e4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '4ab3b5ee-3edb-422a-a555-0d1f0833d0ed'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd956fe5b-b045-419b-a98e-e7aa9bec09d8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'ffb3271d-3f0d-4f02-ae7f-fd1b5531f02c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'a14040b2-7122-4b43-b536-d87c09801fd2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'cc695e50-7a76-49fe-a7a0-efdf2b4f10ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'b9ce4a65-7715-44dc-8af1-7560b8563793'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '98796f11-b9af-431f-aa29-7d775ce1f0df'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'c53a9842-dd4e-4cef-9ba7-a7e1ce92109e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '6894c95a-4ca7-42f5-95fa-9d28f2927d52'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '95cfe9cd-e21c-4a65-9309-5ac54e3fe635'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '77b77be3-2fa3-4a79-b99b-8e60f69c0f8e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = '84534e4d-4f29-44b9-9aba-be798e36d6c2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = '1e6e4b1d-15b3-48cb-ae4b-28ddce08c537'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3cd4d50c-28cf-4db8-a431-2e9cedc3eb6d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'e15a764e-dbd6-4446-a933-c56c60a02342'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'dda5aba7-a6ba-4ed4-9e10-8b4ed0c62ff7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '9efac183-6b87-4840-b508-fe473d86e4b8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'c36ec706-0b24-49c7-93d6-96325f5ad123'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '0214cd0b-e0b7-4e03-abac-90555d9c55e3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'cbecd9f2-257c-49a1-a9f2-f30c59d5e402'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7ff0f92b-cf96-4481-ac0f-310adf146f97'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '4099fe49-a61b-4f98-8b70-4992a1b0b342'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '46728888-3bba-4e1f-90d1-6f6ee3d106b2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f1161130-d361-4462-89b5-b9c7bcc963a3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '86bbe082-4a93-4088-b575-ce2feca36785'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '76ad0217-5fb6-416b-84b3-49d847573491'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'f5481f60-920c-4c5d-b6ad-b38f40044041'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '5f776bbb-1bf5-4ac2-b33f-60962979b5a3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '41173402-6b29-4035-80b2-ea528b63bab8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'e0901962-44ce-4d38-8eda-38a8ba2f3cc3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '8bb13ef6-ea50-4f8c-b17b-bbed79794b4c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8b83cd6f-1660-433a-8703-0e4d53816835'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f0ba649c-2b04-489d-9f22-5b70c40bf83b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '004b4c17-8c00-4d4f-8e56-3a5ba7f5b767'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ed9fbbab-0453-4c2d-bbfb-20e9935b7858'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'dd932b50-a523-408d-bd75-8f80da9b4508'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '48a37746-e570-457e-8b8e-81e0a194fa5a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'd8bd041f-3d19-4375-8432-059588644d63'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '650fbd63-ff85-4a61-b1ef-3abefa33c1cc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '1e0baaff-e32b-4a2f-8943-dfc6b2501e15'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '1d52a218-4c46-427a-b06b-e58f4500e652'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '9bd391e7-a3cd-4aed-88b9-d5ffb82aad9b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6f2085d8-0e97-4f27-bd07-3c05156dab47'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '168e11d3-1c87-4f73-b3b6-986815ae1e39'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2f078e6f-f30f-4509-806c-652350463485'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '0bddfbd4-c01e-4b80-8fe1-21ace6bc0df7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '799b488b-fdb4-4449-bea9-cb2a267417de'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '19bcbc54-ad3b-4902-a7c3-3e06b86222ba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '54220df5-3796-42c1-b4be-abe32c16ced9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '1adf05fd-57bb-42eb-be63-5556eb2b7698'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '5db1c43b-60cb-4335-a2e4-13d61f3c78d3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '9e0a5f62-bdfa-43df-98b4-254a1148990f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'f29b3927-af12-4e9f-88e0-67669e27ce30'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'aabc966f-0a3c-4c7b-a643-122bba32e7c8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '86cda6fa-129e-4e40-b126-95d17af0d28d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '10cee63b-6e32-4733-ad03-d58e78a8c13a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6161286e-8b17-4eb6-a4e3-473d31faab77'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '1e242192-c01a-469d-a735-1e000fdcc333'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '868ee246-0a13-4329-9e38-87547ac8d402'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'fa07e861-0871-418c-8eba-25062f7aeadf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '02771b79-2eb0-41ee-bb4b-0b65311e89f6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '9516ef52-c496-4348-a497-42923ed0d379'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '3cd06b08-e0da-446b-83dd-aacd51c567db'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'acb6f9dd-756e-40b7-bcf8-602aef2be54f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '8db2fd5c-87e1-4195-b1b7-ee42b2982234'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '200adc90-7883-48d2-8315-f846752a65ce'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '47130c67-5eb8-4b2f-b990-0c15d8bff983'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '947072ea-a96f-4acc-a0d7-59736cb45efb'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'fccb1ffc-75d6-4c92-9c51-4d53b64ca90a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '2e3ba791-de47-475e-bd3a-aa235e2ec3ea'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2b9df083-1f52-4921-bc86-e166d0daffd1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '05ac1880-ebaa-4090-a44d-32a312334948'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '1254f69a-9286-4298-ac4b-46d398885caf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'a2c83273-fc3c-46f7-b782-7fbfb89f6130'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '27eecb4e-1a62-4eb8-a1fd-4dbe1186c0d0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'dca9ab30-c7e0-4528-b1b8-ff9282821af4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '1a1e933d-9490-480e-8373-e520915f428d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '3b59b997-e8e8-49d5-bebc-96993b5926fb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '44763312-307c-4ff8-8efb-ad3cb995e15a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '37f97af6-44cd-450d-959e-eb0cf4545b98'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '18a41670-6517-4f16-8ede-56f173ae0421'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'dd0a3a11-896b-47e1-bc4f-6bd28e4e8ad9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '5c5e90e3-3f76-46f3-9548-f09531e2151b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '6161286e-8b17-4eb6-a4e3-473d31faab77'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'e52c2e88-4db9-423d-a4c8-d909b00a1a52'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '4156d52e-c4ee-45f1-8276-2c7c5db2b579'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'e52dda2b-6359-45fc-a7e7-fbda211bb79e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = '8a603434-d1d8-4f8e-bf73-298e48a8e042'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = 'a5b6de4a-5e8f-49fe-bde0-9ff61e2149f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [HierarchyKey] = '19bcbc54-ad3b-4902-a7c3-3e06b86222ba'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '63069a89-7024-46c6-a6a3-4efc6e527e9c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a48eb5ee-7fbd-4c7b-acba-9f8e2a4fe072'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2b05da94-8782-4385-830e-07365285a2a8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '48e9eb92-447b-4779-9fd9-03521276330b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '2a1ba999-b25b-44e1-b2c8-0238ce63d4a7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '6b225ed2-d423-4840-9e4e-70ddd693d068'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'd01f6f58-10d3-4351-a8a7-002cfb211b00'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '10c8f1a7-7246-42fb-8fba-9f5050d56109'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '50ab0cc1-c2de-4dbb-bd5d-e2e10456d3ca'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '44ba0f78-7a92-431f-8d09-f8c3171ca46c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '64329c07-0098-477f-a3ae-e2a041c56395'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'd718ac5e-569f-4f7b-9577-6e6c143c77c4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '0f2b60ea-9ce5-4313-8afb-063a780876e7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '07528983-5e8b-4afc-85df-2583ccd840d9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'ac92eb29-09cd-49aa-bfa2-bbfdf055909f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '7ff0f92b-cf96-4481-ac0f-310adf146f97'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8c4bd567-c9e8-4d98-9ff8-5e72c3a61829'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'cb01929b-a9a3-4b17-b387-33e40167d5ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd4c665fd-4c38-450a-b8b4-4ed923558ddd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'de56be17-eea7-4ab1-b9e5-c93eb6093749'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'b5be0fc2-3551-4a0c-93cb-55fafa9b4f51'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '34243dc3-2b74-4eec-97ce-bff1f63b6d1e'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6ad1a173-bd07-4fdc-afb2-5f6409f937ee'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '27ae7253-e8f9-4c2d-8696-9429f76c58f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'bc15035f-d217-470b-87e7-d7cfdd07b0bd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'fc0d47f9-b123-478a-b553-d8a8b6d81c69'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '7eac7345-df89-4da8-9df6-bdde5f4fa3a2'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '023e3e20-038e-451f-b9e7-d332177a86f5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd1234602-298a-4528-97ee-dc169297097e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '2c72c1ec-467e-4ee9-ade9-d08facf16cab'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '95f755d5-66f0-4acf-87f9-9bba4203a603'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'f07c620b-933c-49df-b2b7-5d343eb1ff2a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '8d121aef-21f4-4d5c-905a-eab150e0e70a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '7c9553cc-191c-43e8-a750-005a52ff3db0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'ce73e04c-b6cf-49bc-ac10-09a1a6bd3735'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '79345653-223d-44d6-8dfb-1724f8db8687'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'abdd796a-aea4-4420-9d2d-4a52b71fbc06'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c0480ee2-4923-4151-9888-640b6282f28a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '96363a88-5b2d-4c33-b86e-f658026b49d6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '76bc8d92-7d86-4937-89ec-6249c4f6b894'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '07670776-923b-400c-8604-675a6ffbc238'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'b4c22da7-8b55-447c-b6b9-830b0ab043b7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'abe2bb9c-1858-4e6e-852d-bd387ca9aedf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '019f7eaa-41fd-4b2f-9bb2-a8433f27f657'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '648e0f25-7ced-4b7f-ae1d-549102f2237b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'cc4f1052-d676-4fdf-a675-9b0cf04ef6ac'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'f109a57b-84b7-451b-992b-05931e69c15c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '2a2a1ced-187e-4ffe-ba2f-2654b4c59b66'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '3540a97d-fb1f-49ef-a8c1-36d41668a498'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '683dffce-f993-4fe1-96a1-d71305f1da50'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '8f57596e-2b0f-4f5c-8ac7-17a0b63e3467'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '2cfb7e10-d20b-4dbe-abdd-5c037218f2b5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'ba5fc852-7ff9-4c55-9166-f04282ff9a93'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4afb3ceb-8718-49d5-82d6-6839de8fae82'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f6d7ed6f-f4ce-4a79-9814-1e0b0f85309e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'a0d7c101-7675-406e-a988-29bba911eb3f'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'dd0a3a11-896b-47e1-bc4f-6bd28e4e8ad9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f436b8be-ec6a-4049-bc4c-b6eb25a3cef2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '6bd4211f-126d-4377-a7dd-4ea7f79d3e13'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f7659260-4a68-4270-81fe-2d2777c0d116'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '691f7e3d-e4a3-4e93-8a22-cf7e7f996250'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '496b3d59-1517-4e88-abec-60dd502e4880'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '7c9cfc25-a14c-447b-bc7c-fd1d1140f09d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'd9f5a782-e181-42a9-8929-4f7a227b1932'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7807b467-66ef-45bb-a44e-6c634b1faaa9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '8601e9c8-8eea-423a-bbfc-32c7719196e5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'ec729f5c-91d2-46de-acf4-dc6f56bd77aa'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '31b939a0-8018-4786-97df-ce533f7ec848'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '19e26662-1920-4281-a6d3-c3c5cecac1a2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '7c945127-1083-493f-9a86-fdeb3c329704'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ae0cc27e-aa67-44d1-890e-6df169c415ed'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f0674b2d-153a-4c2b-8136-32de2ea97f79'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'b861cd4a-52a2-4e70-857f-9e3484735c49'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd718ac5e-569f-4f7b-9577-6e6c143c77c4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '06406c04-f27e-4f26-adc9-c172e737c4c0'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6cfb1fbf-be9e-48e4-920d-6eb7b37fbc56'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '8bb72653-7731-4914-b48b-29b50c0bde66'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '985ab318-8360-45ad-a74e-72b15f08db93'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '4a275094-c6fe-4ea9-802f-6492cab792c8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '52f5b7d5-00f3-4d13-b692-ce562ce8a66c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '664186f8-ef4e-4349-97e8-6d1c4115a1ce'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ebdd9207-cfe6-4715-bc69-70c901f5d923'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '78bdddca-089d-46ea-bab2-f8577347aad1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'f29d3cee-7f61-4747-8253-455677980fde'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '9e850933-89c2-4cf4-a520-d3e7016a9408'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8452e8d5-fac6-442a-a648-14281edd2e65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'f964d300-7621-4c43-878c-779530bd15fb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '07670776-923b-400c-8604-675a6ffbc238'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'e519f4e8-1f67-4607-81e9-312ddd06c846'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'ae5f0fda-f5a6-40f5-b068-8cbc6ba320ba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '10a65e04-ed4e-49af-b03a-47e4593f5207'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '9f59179f-2a0e-4b6a-939c-1ba1c6439b0e'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c2aa1fc9-b36e-4080-b0ed-718e2fc735db'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '6585fe33-5fdd-4752-ac05-745332eb5913'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'e6326995-b3d5-4109-a4c6-dee31d9050dd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '19ac71ef-47b1-4e00-822f-ec07952c8687'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'aee18121-6d38-422f-81fc-73941236aa79'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'fd32dae4-ea05-4294-8835-efac949750f1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '63a449ab-b016-43d4-a32f-53e025702160'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd683cc25-509e-4306-b3eb-e758aecb0eb7'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ba712a57-8a97-4e58-8618-74b214deb7ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'b3c390ac-0ba4-4b7f-afef-ea3e67fd1455'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '0078d881-5791-4563-a0a1-249b596ac373'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '14d1967c-beb2-4568-925c-4f0d737a4013'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '68cbbf34-3397-4aa0-bbc2-25961f9e3743'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '83a63924-7c98-4cc1-8beb-7771277f8cc2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '31b5aee0-07b1-4880-aebe-7738ce7a2700'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '7f0fd417-07ed-42a8-a1ef-c4217589fbce'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5d21bbd5-7ef4-4da9-95e7-7775ff43d512'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '840c28bc-94db-4d3d-be9d-bfb5f1955fdb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'afadf8de-fb2d-467e-b2e9-62f4b27707e8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '784f5162-6e95-4fe6-b1c0-a014efb88ae1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'e2fc2fb4-9086-47da-8e15-77b211503ebd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '7a5b1038-d244-4f49-a87a-b5846095d456'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'f55cc1c1-a287-4787-a871-94190f3f98b1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7c393bc0-0a37-4f77-9a0c-79944256b3cb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '207cda77-3751-4a10-b6aa-364503b28dee'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '0455f00b-2d60-4eb1-9bbb-107ecbee2d68'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'fc2ff7d5-8d7d-41b9-917d-8ecb10177eda'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'e0c98724-51d9-41a3-8d50-589f5ce96cc0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '4a5f1603-f4e9-4412-8b92-e786594d22bd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '077c9dad-d9af-47da-b53a-f3a49d5138ae'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '4392d8f2-ab29-4af2-b3d1-7be2ae640aeb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '7d4a19a4-ea7a-4127-8b0d-aae3b2349ff7'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '98796f11-b9af-431f-aa29-7d775ce1f0df'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '1f26bfe4-8f87-49cf-8312-4633370d4bbd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'fdd6c95f-baf9-4e67-86dd-4b09bfb436bc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '85a32bed-8f62-4671-b764-6fe23de95f9c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'ec97fca7-bb2c-4a22-937b-5cf56ee963f2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'fccb1ffc-75d6-4c92-9c51-4d53b64ca90a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '0591a07b-e81f-42ff-9b36-81c97b3a5b75'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ca29a74b-b704-4083-a5cd-1ec8a55b7658'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8bc7afc2-58db-4438-a48d-84f9f9b9822c'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5292a019-b4bb-4d91-b6bd-8259e31c22ad'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '05566772-2cb5-43a7-80b4-53405b5dd5cb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '07f83099-16b0-429c-9cec-84e4c5a59d8d'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '45069794-e264-4d19-a55e-8aa49dee294c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '85f8399f-0c68-4ae4-bb3f-d0ec0fe6fe83'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '9dbe8d38-b4a7-4ba9-b564-a3d3db7efe5a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'c538a05d-b827-4100-9245-9953aeb04969'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '5aee46be-2c55-4ce8-9906-5040de864759'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ae5f0fda-f5a6-40f5-b068-8cbc6ba320ba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'c29afde3-4eb0-4131-8e50-3fef41ef55ea'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '76012a34-c903-44ea-932a-c6bc7f8ede35'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '77b77be3-2fa3-4a79-b99b-8e60f69c0f8e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'b5acd6da-fda1-4dd5-bcb0-bf1eaeb93393'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'f48a38a4-e721-4f6c-b68f-f4aa1928fad2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '582b8125-a669-415a-8182-ea4ea2192eba'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '72e091f5-9bd2-46c9-b353-954fb0e64499'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'c16c9ce1-f8a9-417d-b54f-bd02e8806150'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'bec39375-6a94-4f0c-a4b2-e83900a9112f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'c49687aa-e173-47e9-b695-dfa80bc9c455'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'f3cf3480-8af3-4fef-9ea7-c3707bd9a3df'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '5962329d-69ae-4640-ab95-1f7a7af7091e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '645617d4-c152-4dbd-ada0-db3c1d157f58'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '45d20b17-9bd1-445a-9880-79b0a8ddf61c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '5d21bbd5-7ef4-4da9-95e7-7775ff43d512'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '5a646cb0-225c-41ff-a22c-fd131482410f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'e0901962-44ce-4d38-8eda-38a8ba2f3cc3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '8d4df6ba-6e8d-4a6f-a21d-33ccb1c93537'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5ba4f0d3-9880-4812-aef6-da0383097b92'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8d34e992-65d8-4f9b-814a-8ba74846f418'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '45069794-e264-4d19-a55e-8aa49dee294c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '4afb3ceb-8718-49d5-82d6-6839de8fae82'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '68df2663-22b5-4419-a61b-12b744efa8cd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '852cc460-ff22-4813-bfb9-e3a8cfb0fcf2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'd2343920-4dd9-4512-8257-20ee75e20266'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'f2f9498c-18fb-4195-9c3b-8c5ce7952858'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '6d9dc343-5047-488c-9763-d58143940665'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '8aa16f30-8db5-40e4-8ff0-a82c20c0990c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '233f5134-ca6f-44dd-9448-6ab888b7356d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'afc3475a-b61c-43fc-8de2-e26a7b240822'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = 'ebdd9207-cfe6-4715-bc69-70c901f5d923'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = '3c29bc77-fc25-49bd-a951-b9dd3b66bf47'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b30f482e-8bb1-46da-8190-965d128d6044'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'aa007e0e-c72b-4eb7-89a5-981cec339e7b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '0b7bb98c-8dc6-415b-9de2-d5760240d51b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3b59b997-e8e8-49d5-bebc-96993b5926fb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '10540517-7096-49dd-a8e0-82564898b717'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '583a7166-a6e9-4e89-ab4c-7e2c12888df2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '88022abc-c7cf-40f7-a497-fd6c42679811'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8a96fbc8-9620-4aa5-8bb1-dd29e0e264c8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '75fd3257-7ef1-4649-838e-ff34ed30e84e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '9072d4df-68ba-42ea-8f4f-6e5d979cd94c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '7136516b-4f07-44fd-a532-1af475003ea5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '14db153f-0e1f-425e-be21-6ffbdc27f85c'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f254fca0-c422-415a-ab74-99b780fc2a1e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '1f784d38-2824-4c5d-9b9f-cca739849312'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd91117d2-ce32-4c85-a6cd-f52cf942cb65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f37012d5-ceda-4f6e-bcab-1fdced962dcf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '5d6cfc6e-b2f1-4fe0-acf4-79cf0db6dbf4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '0a184469-f2c4-46f0-bcc3-3f0caeec652c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '9350a5c7-fade-4ec5-81eb-30a3b5992ab3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '8b58da7d-b67d-47a6-8edb-d852409511b0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '1a09d34a-eea5-4267-89a1-5a1f81ecd959'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '93ee90de-88a8-4211-8a33-4589f4c73abb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'f32bb508-d419-4e20-9e31-9219f9fcb0c1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a9ce6569-6627-483c-b900-9c1f34491c08'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'e7216c64-9002-488c-a5ac-b51ef47d9b4c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'bc722a54-0754-4b98-ac52-f4c2ff7ba6e5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6dfc5c5f-65c9-4508-8b98-9cb5648c2feb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'af3dfd0c-58b4-4464-9be5-906e08114003'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'aa409f68-05ea-40c4-8674-b0bff4aa885b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '0591a07b-e81f-42ff-9b36-81c97b3a5b75'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6894c95a-4ca7-42f5-95fa-9d28f2927d52'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '8ec7da43-d6a3-4c95-8203-cf826f0121f9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '9e9a786f-8b0e-45df-a07b-08eeef85bd2c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f31a6ee3-dfc5-478b-8f8c-8be0e5f3bd08'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6bcfa42a-cab4-45c0-b8e2-a3191825acd7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ff4e4f4f-7513-472b-b36b-2b3302923d2b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '53cf30ab-c5a5-46a3-a6f8-5f9d643f30a1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '53e42092-2171-464b-bfde-443423323ccc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'a6969ba2-ef99-4287-b443-e6e9cd1461ff'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3238d676-34a0-4659-83ee-a31a17b48962'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '33651d4f-16e8-4a74-aaf5-43a48079c29e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'fea7fba0-6d21-4dce-821d-8a4224a335c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '5240374c-de05-47a3-9e61-0853c2951409'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c2653e69-2326-4939-9f84-a36545b81bb3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'd984f786-df11-4157-ad12-3060db0ca613'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '320bb253-7c50-4036-bd68-1863d6287fa0'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '80b78f86-61db-445c-bfc1-a64a5760f4c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'df4e8619-db45-4490-9d52-121d4385bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '6af75f8d-15ad-4a12-a2b7-543478cee2d5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8aa16f30-8db5-40e4-8ff0-a82c20c0990c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'c2653e69-2326-4939-9f84-a36545b81bb3'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '236e11d1-4328-4676-8153-ad7b73c4fcbf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ba0d9240-6541-484e-aad5-f4c1059bc972'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2f6f0b76-16e4-43c6-9312-3f224c755f76'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '4d5cfd60-720f-41d9-9568-af0787245ee5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b4fc44a3-8307-4e88-a2e2-af23f2dc7f22'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'dfeac8a4-7277-47f2-a7ac-60dbed2ec40f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '592c753d-24af-4c09-b0cb-c78d264ae34e'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f1161130-d361-4462-89b5-b9c7bcc963a3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'faedb1c9-6fc8-4e7c-be61-d83987737261'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '6bcfa42a-cab4-45c0-b8e2-a3191825acd7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'ae0cc27e-aa67-44d1-890e-6df169c415ed'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '6f2085d8-0e97-4f27-bd07-3c05156dab47'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '55af6bd1-9ed3-44e5-b0c9-bd7d56e26041'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ea74b697-af51-42d9-974c-db0752473acd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '952b5a07-d33e-4e35-b021-b03c36cc4bd7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd939abb6-3622-42da-a87f-f1110954012d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '622226ee-22fe-4baf-ab83-373565107b09'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5851e4ef-8f40-44ef-9131-c581844db1b7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5153d55f-30fc-428d-8bb7-56c7c3b3f704'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'b1b06a02-e093-4dff-93ab-993ae94626ae'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'ead5e5e4-99a0-424b-943f-19a18074bc25'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'f906e02a-b454-4725-a41f-c631e1621936'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '27eecb4e-1a62-4eb8-a1fd-4dbe1186c0d0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '037c74fe-62d7-4d43-920a-e571f5cdc424'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '1036290a-d70d-4dbf-80e6-2d21853061e4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'f7ae0cdf-21aa-4853-a553-e9ad4df4349b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '72e091f5-9bd2-46c9-b353-954fb0e64499'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '13894ae4-ef61-418e-b8da-e59865287f04'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9e850933-89c2-4cf4-a520-d3e7016a9408'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '745c9f2d-272c-43b9-92d8-f1b5ae94ef06'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '5851e4ef-8f40-44ef-9131-c581844db1b7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'c0480ee2-4923-4151-9888-640b6282f28a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '55af6bd1-9ed3-44e5-b0c9-bd7d56e26041'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6d9dc343-5047-488c-9763-d58143940665'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'b642be24-21b7-4dc2-a734-58e0d7a027be'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '48612ac1-b5d2-4d1e-ac65-d5786b44c035'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b4ff3233-0478-4634-89a4-d75028af3bdf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '570bb774-067e-445b-899d-a66cec425eb0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '589beae4-2185-4765-b196-93974870ec26'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'a5689072-48ab-44f4-be89-58adcc77ca44'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '1ce659a1-b317-49ac-b5a3-773e36de1e4d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '4fd010b7-089a-4d0e-b3a4-669c013a79d9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '07abd46e-9460-4343-ac83-c748996a061d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'bd02246e-0c78-43ff-9367-562249d7fa96'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '404f38fa-0434-470e-9ea5-9eccf1bc737d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '141a68c2-1132-4dd9-a0e3-743ffc2f8fdc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'cd203499-8219-4a5c-bf6a-75a76199b98c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = 'b87f36d4-019a-4074-80b9-7b514708be79'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'faedb1c9-6fc8-4e7c-be61-d83987737261'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '97ee185e-4855-499b-97ae-16fb2cdb9bd6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8e4f7aac-d9b6-49f1-83a7-9ccf359efbdd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd3a1a85d-14f6-4b99-a51c-3ed5a2dd5ea1'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b07b2137-2292-4bd7-9909-d8abb8e2dbe6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '36a41f66-b340-4eba-b26e-387081123bb3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '2b661a20-c286-48d7-bd61-ee4b96bd336e'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'dacdd830-1f30-4860-9e96-db48614f755c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f9e9e65b-0c29-42f4-96d4-69bfa6daccc0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '985bf684-aa54-4ae9-8bf2-7a8ac68064e7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'ebce0803-5913-448b-a0bb-3984a6eeb380'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '722430b6-a14a-4358-8f4c-aff60e0ff2c6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'e859b232-b958-4144-be2c-463b17f00aad'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '74c26b75-e427-411d-8d30-0753fec6b9bf'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'c6937109-27c6-4c18-98bc-73801775d581'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'b8d49525-675d-4379-b0c4-e26b500eaea4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '3f2d7fd1-0017-4d08-8d6c-7be3e76c4ddb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'f29e194c-34ca-4063-883e-127bb5ef59a3'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9632f65a-3d6f-4c23-87ae-dde225ca5549'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a92181e9-a2d2-4c51-89fa-f9e6bc5849d0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '6cfb1fbf-be9e-48e4-920d-6eb7b37fbc56'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '64329c07-0098-477f-a3ae-e2a041c56395'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '1a9bf262-fe9f-4f38-a131-0801a29761ed'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'a8a61385-903e-44a6-afae-dc4b37fd4c6b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3dd558bc-260d-4dbe-a316-e456537f5777'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5974d604-6950-45f5-987b-bf05c3a14897'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '87ff5b72-76fc-41bf-a557-176f2ba751c5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '0bff06f5-3594-41c0-a2ea-3375bb12f3b8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '00b91dc3-79e3-4020-b17c-de90e5f70f3c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'e07054e4-3013-4699-afc9-6e6c984e51aa'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '037c74fe-62d7-4d43-920a-e571f5cdc424'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '863b0ef7-bf58-44c0-ab7c-3d469e0ebade'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '6cb65033-08b4-471d-a965-91d4e7933754'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '7807b467-66ef-45bb-a44e-6c634b1faaa9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '32e504d3-d78d-4169-9184-4ecc2276f035'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '3238d676-34a0-4659-83ee-a31a17b48962'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '2053a7a2-cb33-4818-8c90-940a14220023'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '3cd4d50c-28cf-4db8-a431-2e9cedc3eb6d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '318196c7-c72f-44c3-9323-6842d79acfc9'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '9632f65a-3d6f-4c23-87ae-dde225ca5549'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '13894ae4-ef61-418e-b8da-e59865287f04'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5399de85-9f1c-4d69-9f16-0813c3021a8f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'b9fa32e9-d7b8-4324-ab5e-e6be279ae3a8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '6dfc5c5f-65c9-4508-8b98-9cb5648c2feb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'db3f9b96-1e4e-46ca-b40e-a41d610939a0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '6ad1a173-bd07-4fdc-afb2-5f6409f937ee'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'f38df040-6b95-4738-82e0-7a9377c36808'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '8c4bd567-c9e8-4d98-9ff8-5e72c3a61829'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f7ae0cdf-21aa-4853-a553-e9ad4df4349b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f90f45f8-1e2c-4e17-a000-f632b263245d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd24abdf1-dfa3-4d59-991e-ca8ab508cd33'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'f70b22e3-0589-4f94-8316-edc8dd5047c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'f3f4bba0-15bc-47e9-aee9-8fb4a7a9ecf1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '8cb7060b-b911-4e28-a9e9-f34026b8a70b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '00a71312-b688-4e8b-a270-8999aebb6ed4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = 'a9ce6569-6627-483c-b900-9c1f34491c08'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'b4b90841-133c-4c28-b16d-6f0267073290'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '236e11d1-4328-4676-8153-ad7b73c4fcbf'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '582b8125-a669-415a-8182-ea4ea2192eba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'e8302120-8425-4f57-b284-916286419325'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '17cdf5e2-f21d-45f5-abf4-5bbe8b4751fa'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '7dc52cc7-047a-47a9-a06c-85114b17ea61'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'c117980c-01f8-4f38-8f7c-e103b1955698'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '1cfa303d-ab4a-4330-af1d-52f90e2fd392'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'ab6b3460-ae77-46f5-a315-458be5c608ec'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '420c2329-c933-432b-89fb-7ebd7332d3a6'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '37f97af6-44cd-450d-959e-eb0cf4545b98'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a1fef4e1-1ca1-4ac8-a57c-82bb9b769b69'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '272bd13c-3145-4ad1-ae1d-10a0a8809ad3'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd63f23f3-b4eb-45f6-9b2e-ec4282fd163b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '91fae3ae-9b03-4d0a-8e6c-46f92dbfa363'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '91e8311d-e3b4-44f1-b127-32b6f76dc537'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '47f60613-cac9-4b39-a9df-e8d2f68fa054'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '53211402-83b9-4389-b1c9-cba11cd8fb16'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f70b22e3-0589-4f94-8316-edc8dd5047c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'a91aca02-dff1-4ebb-90d0-80f479a39d39'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '5d3f2791-dc19-40df-b9f7-236e38c2433c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '7b692bcd-d271-449e-8439-89d1c1ab11ba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8dc5460a-15c5-493e-8992-43684ca23c6b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8de19e32-b8c4-4a40-a109-efd57872d677'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '3c98bbbe-0b8a-4848-9aac-b380ec1f51b8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'dcdc7569-3b80-45bb-a311-f199898b6011'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '8cbb0e23-16fd-4950-8bb0-9f28b5c99679'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '62db14c4-08c2-4ada-a37f-596485c24bb7'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'cc695e50-7a76-49fe-a7a0-efdf2b4f10ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'f9c9d011-f53f-49a1-bbb6-90d11257d5da'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '7668377a-a09f-4523-a516-0db22e245f71'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c89b6454-806e-441b-9c14-f0beeafa8270'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '96d8f3c3-f070-49c0-9c1a-48593920007c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '01bfd451-7b85-4f3f-85aa-9f90b679e96e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '7e5a4dd4-45e4-4686-8c66-20ad57f432b4'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '745c9f2d-272c-43b9-92d8-f1b5ae94ef06'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'cce13e24-c4b0-462e-80b0-c3b77a759a82'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '46380bfa-485e-4ee5-966f-618b485355a6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'c95fd6e7-348f-4866-8c58-4dd950f8f1d9'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8cb7060b-b911-4e28-a9e9-f34026b8a70b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '34a3b259-bec5-41d4-8a01-5d2fa479ec19'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'd4425a30-761c-47ce-b848-b514dba102ac'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'e0a42bdd-6475-4f27-a3a5-4ace597358f6'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '547853a3-1f7a-454e-b3b8-f58e65ab0a97'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'dd4313d4-20ee-435d-8d6d-773e7f06c2f7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '8ac60cd7-2f3e-42c0-88b2-c587a1641298'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'bed63250-4172-4027-96dc-fb9f5a559774'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '293392e3-7f86-4acb-9ac9-453bcc7446f0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '7fb1ad0c-c08a-47e6-ac20-107ba8b2cb16'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '102ebc8f-d775-4ab9-a13c-b4ed78d9f4ef'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '9c7495ff-9d65-4250-bed9-3f2190979547'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '4cdfd45e-f1ce-4310-a307-3860d5226bb8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'c9cdeded-f31c-44e7-ab90-7e6d3514db36'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '632a9a69-457d-4cac-8a89-e37687e4f2af'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'e0bda073-f74e-4282-b4b8-442cfc4dbbfc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'f6b51e91-6859-4692-b1a1-3de09a91c12c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '2bfcc039-c4bd-41cf-aefc-9ada916f9904'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '99a2bb33-ea43-4f7e-9204-ac040d4323f7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = '15b4fcd6-4eb6-4062-b46e-f70361797bfe'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5a646cb0-225c-41ff-a22c-fd131482410f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '97069f62-0bcc-47f6-832d-0ae0b437bf0b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '45133a37-9457-415b-a59f-da4deeaf15be'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '50774b18-1f37-4e3c-ac07-13e5ec3ebe6a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '0caed7d3-826b-4f6a-b54a-2bf80096022d'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'fb125ff3-ce6a-4053-a3f9-2a7c5fd4a119'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '1da4e06c-3df2-4731-a1ae-6edcadde3f39'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '3d9d632b-1af3-420a-8199-817a33a247d1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '235d8708-3888-4d96-aaaa-dbab80c3b637'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'f412230f-ae81-43f3-9b22-87b0681f1dda'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '526555d0-5b28-4cf7-92cb-762232636a5f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = 'c8d86de1-30f5-4ac0-a65d-3548279762c2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = '6f8ef7ce-28db-468f-91d9-a5d469b93120'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = '4394f19e-9a87-4aa1-aa14-21b9037f57cb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = '647b7d29-97b3-4416-aa91-0233b3229cb1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [HierarchyKey] = 'a24cb42b-7108-472c-8668-6557d2d63c95'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [HierarchyKey] = '952b2591-1e9b-40eb-8258-f997591fa13f'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ffb3271d-3f0d-4f02-ae7f-fd1b5531f02c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5d3926c2-5ce8-47b0-b7d8-7728be01b008'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'be73aae5-f0e9-4d76-a127-917cf339f56c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '9d571232-8ad3-48de-895d-e54ff000035c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '96ace61e-f5e1-4e3a-a4ca-16e3c1707c04'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '7c393bc0-0a37-4f77-9a0c-79944256b3cb'

