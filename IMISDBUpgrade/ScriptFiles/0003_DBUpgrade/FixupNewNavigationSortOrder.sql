-- Update Navigation Hierarchy Keys with proper Sort Order
DECLARE @sortStart int

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '2c405294-a043-4f58-9723-0b890113e7e2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'fe1294e4-2f0f-4331-bdef-ad5d51f2d535' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bb982453-73f4-4acb-be66-f832efd11e95' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1d8e49b9-e7fb-467d-8cc5-253230464f8b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '7845b337-f9cd-4d40-b880-f58ac6966233' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '524d548e-b9b7-44f8-9fef-a997138cd289' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'f4ea893e-6b67-4b23-ba44-62f8aee84271' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '325f4da4-ee0c-44d7-9f40-9019f14054a0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '58fe9f2f-441e-4342-b5e5-b209ad01161c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '9280eaa7-bd38-45b1-9502-c9297c14b0e0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'b37b9ee0-5a9a-45ed-b01c-488d864cfdca' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '1de7e1ac-d75c-4cd8-9743-d98faa80a134' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '2256abfd-007d-431b-b892-5bf20422c1e6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '8edbd333-a1bc-4502-ace8-a4235a987f24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'bf2e4869-66e5-4085-9a22-b57a7487e766' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [UniformKey] = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 34
 WHERE [UniformKey] = 'ef85b467-e2c2-4c65-98e3-c19b3fdc96cf' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '026f7a37-dd89-4358-a223-13c555ae66d8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '03c7897e-797d-4924-bcd9-5a029d63924d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8fea2982-a040-474e-a57c-1cf79c500ccd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '9e675100-f420-44bb-b581-37ae290f3c73' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bb79cc52-b9f6-4ea5-8615-8f79ccd2bd2d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '8093b2d3-fe3d-4aad-a1ef-3c755ba0f521' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f64252fe-cec2-43fd-8b02-af5148ec8724' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '3f4d03e8-43ec-4d5c-8e55-926c34da7873' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '57578eb3-d85b-41ea-abee-94015fff279d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '4b77d8b3-7a28-4014-945a-ca70bb398c3e' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'ab78a559-ccf6-451a-848b-37502fc9e66f' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '1524a77b-c019-4bb5-9c1d-a76a9014c937' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'd65a7e13-2bca-4a4e-a9ff-602839db00b3' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '0ecb2b3c-d3cb-40cc-b2f9-6594c668cf1a' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = 'c770dc47-9580-4c15-9bca-43a5644fdc1a' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f5ce111c-6710-4a4f-a957-23afcfa91a6a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'cd6133d8-f0a1-4b9e-8b9f-d9db2fc8e4dc' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '08e30ae9-53a4-4b96-95c1-b65511a4ed17' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '15be3c9e-e94e-43a2-9c8d-c4b26e69534d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '27b031a5-a98f-4ee9-902a-0d5c2cd9325d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'b55daab2-88f4-4c53-a258-fbc5362dce24' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '4a89fa1b-13cf-4aef-be16-9bc93addbbf8' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '2c1fac92-0f61-433f-ae35-8cd010c0d6fa' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '65ec8cd7-c619-4d04-b097-195468329718' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'a288f52a-ef90-4a22-9903-457d0f25591b' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '76f5683f-7bd2-4990-93a4-26df972c4068'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '270d687d-c3b5-49ed-906d-46cee010ee1b' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'a20c52ef-6754-4429-b73e-2dcee1d413b3' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '2486917a-6f48-47ce-998f-e71cf7e1d0d1' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'e99cc2ed-4418-49e5-bc07-00ccc0ed54a6' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'eb28640e-6ca3-4458-b4eb-2a581004d6f0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '49f060a2-8bb7-4d6b-813a-f6af4702c71a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'dd28f2db-a8f5-47ac-995c-6b110c6db25e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4156d52e-c4ee-45f1-8276-2c7c5db2b579'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '7147551f-b709-4e34-949e-e563fdb522fb' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd4d51556-f815-40e2-bcc8-10c6622a23c9' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '232f6592-dbf2-4fdd-b151-887b3a038618' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '48213e13-ec51-47dc-a52e-0878973775c1' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '794fff82-916f-4716-9cf7-2eafc1ccb12c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '37e99c80-d4a3-4dc7-93d4-74b8768d4098' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '0216809b-7493-461c-a547-caeed6755a6a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '225e4958-177c-4efa-b26d-5ba03168f7b3' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '42d5962e-3a81-4135-a369-9f629cb40e9d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '4db4f7d4-1e70-40e6-bbce-2a4f469585d0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '29414bb0-776d-4b3b-a0c6-b139a2640869' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '4ca0da06-01a5-425c-b707-164beaf7ee7d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1036290a-d70d-4dbf-80e6-2d21853061e4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'efbccda3-3ca6-4a60-991b-29ca64358dd0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '50c0a58b-72fc-4784-bb15-0db6679c896e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'd8364376-5bc7-4649-abc9-ed03805e2c5b' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '50b88949-df9e-42c0-aa26-0df2d88bd983' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '9be62eac-37b7-4045-bb70-4a1d98146716' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '301bb1fd-194d-4c2e-826d-887582ec220d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '8f4cb6ed-bf61-4c82-b58a-ccb834ddcff0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '53eb21ac-82eb-4e45-b4b9-cc7b66a75525' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'bf220feb-547b-4239-9826-ccd82d17ba2f' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '613f7110-1257-44c6-8c9f-91a202d3708e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '10e2bafe-f69b-493d-af9a-9961f319f4d1' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '16f9170c-dcfb-4df3-8dd9-a09e388521f0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = 'd8b998dc-72fe-4653-b4e2-391b0c6e855e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7ff0f92b-cf96-4481-ac0f-310adf146f97'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8f9a8e7d-bc3f-4c62-b7aa-984f4ac3584c' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'ac74324e-9ece-4346-bff3-9ce226ad01d7' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'df57d03d-72e4-48d0-9572-a145818e76f2' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'de7901f1-129d-4c82-9f36-8d048fe71459' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '7b68526a-0bac-45b4-bdea-db554cdaba35' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '619c8159-629c-4967-8867-42c81e4c491c' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'fe8579cd-7100-4ee1-a814-8f51d2e4c01e' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '979de28e-cb48-46cf-87d0-2c0c75330143' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'dbf2107c-761b-42dd-9573-96c0198dd1a9' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '7e7fbd68-f02e-4e52-80f0-d5155c180ee7' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '4da4dd6e-cb5c-44d7-80a7-d2fb7d80cb27' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '5bf978a9-48da-44c6-bcdd-e095d2806ad3' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '792c81ce-92f4-4ad7-9ed7-a4c4a2138e73' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '42bff3f8-ea4a-47c4-8ae0-fea3049e50da' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = '44c9c319-19cd-4841-95a3-c1d9a895a014' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'da8c0a54-bd9f-4209-b77f-3c8ad1769f9a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'da4b8423-04c9-41d0-b4e5-8d8832f46bfb' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bdf5b94b-c2c8-49f0-b609-4594b2dd516b' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '7a3d563c-1986-4bc2-8eeb-9b99e0302042' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6161286e-8b17-4eb6-a4e3-473d31faab77'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'b4dea3fe-e4d9-4628-a6e2-9e4a9bd6ca45' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'e768a803-dc3a-40bc-a3a0-8cce86b43f9c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '4d9e0401-e63e-4caa-bb09-c71ebc444d99' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '3028d3df-6a5a-4927-a94d-b60bdb3aaaf9' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '43971a95-ada2-4153-aed5-fab7c563ed7a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '27eecb4e-1a62-4eb8-a1fd-4dbe1186c0d0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'f9345d55-28e3-4fea-8f28-b8e62b21b029' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'f262d7b0-f89d-4fd7-9cf2-30ee2847ca76' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '39ff1495-3aa1-437d-bac5-bb60c8392b3a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '7b1ae717-3d6a-4339-b7b5-338cd2d4025e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'ef25142b-eaef-4ae3-8dbd-74937ba3b17c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '600adce6-66d8-4db7-93e6-ae88fb161e14' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'd0fe2b3c-3484-4ba2-b709-d4779201035f' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '6c0a0cdc-1b9c-4144-a316-35695ca342c5' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '9d3088a0-350f-4352-ab92-93120e64231a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '4ac88575-0fa7-4d5a-9806-12396d414d83' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '51a26d6b-6997-4028-9db7-4b735e91a84c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '56004f57-7e88-4c5e-a118-50e4612704d6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'd1706f5a-4e9c-4c6c-8e26-d8879bf9140b' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd2d9be76-04b3-47f3-8542-1d891575186e' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'fdaad54b-6200-4c3d-9bbb-567ad1ecbd01'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '99ad059f-5909-4a3c-af37-ee8e1d83a98f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '54469351-9557-4292-9b7a-cf23eb997d88' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'eaa22610-6417-417a-88e0-d7f83d9b4486' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c16684d3-f1b7-43b5-b40c-56bfdfe13cf5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '7aedf83a-061e-4090-821e-9b531f1f168e' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd0a56605-cff7-4dc8-9d50-60490b26b418' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '8dbbe7eb-588a-4b7c-a25d-96dde205b5f4' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '9def0c62-31d2-48bf-ad08-2984e60e21f0' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '426a3144-4c69-4945-be40-f2684645172d' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1d34e813-0c10-48b1-a7c1-0520c4383f2c' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '248ba2e2-beeb-4137-a36a-ee01650b102c' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '2cd28379-4d20-4517-83ee-49fdce959d7a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'e4f602bb-e7cf-4188-b006-518c9796db6a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '26506ef4-6e6b-44f2-8ee5-3aa30fc8196e' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '99811e6b-c413-45d1-975b-4760d78eee75' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'f023c986-bb85-4653-9d0c-e0e826341ef2' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'c4e40dce-bcac-47ae-9a3b-f83751edb880' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '94e31001-ce5a-4963-97ee-39cf39b6633a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '18fc53e8-7615-4c05-9f1e-5bbd080aab7c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '0c838909-dbc3-4a28-8e3c-5cb2e5f45842' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5336c114-ba8e-46c4-ac16-7b5101e02b67' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1d051291-46fa-4cb8-abba-7f2409250120' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f718d2d2-7871-4c29-9b9b-c0d7547c0c10' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '1f0bd27a-73d9-40c5-bd9f-1d5f8ee28602' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '2078a059-0ac3-4e9b-99b3-fe7d2680d82e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'de92eaed-3a98-48d5-9cc2-1f407914edd6' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'b1e3c6c6-f1a5-4382-bdc8-e17fdcbe8900' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '3b44ce3d-fc96-4035-8787-a18b17fce416' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '00eb33fb-fe46-406f-8c41-5e8b4de9c785'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'ab8344d0-56a1-4f3d-9b2f-2194b75594ca' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1dc8e4a9-1adc-4abe-96c7-2f3f01c71c89' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '31b48f9e-e56f-42e5-8992-a7c4aeef5918' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5fa446ca-ea32-454e-b5fc-2932bbc48048' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd07896c2-a131-4901-aef1-752a079ecfe0' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '78452bc0-43d1-432c-bb76-bf1bced010b5' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'efe798fe-a74f-4206-b5c4-aa3927fa2968' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '3049f2b5-1d5b-4337-8991-eee136a16f24' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '551f0237-8c5e-44af-b405-5b42925af74e' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'e84627fb-01e4-4758-90d4-989fa9b3d475' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '51205d53-d25e-43f4-8c27-7447e9261425' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'd5c6d9c5-bede-400d-af9a-d58aef451a1e' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '56c6172e-c425-478f-b795-6b4187147f59' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '201dde99-737a-4260-ac90-b6d7fdb6bfaf' AND [RootHierarchyKey] = 'eb587dd5-2020-4394-8de1-61a495816b41'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ce44edf0-dae8-4d3a-b3cc-68f479cadf33'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '35f26eb5-226d-47ff-be87-230f246b4c37' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'c816f5e2-2e90-4804-ab7d-128ecd44805d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f98f45d1-44a3-4646-963a-86387be1c735' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5fab488e-d4f9-42db-b767-69c5892567f4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '10810f09-e65d-42c7-9743-c83d4bcd1812' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '67bd5f72-05e0-4be9-b632-092c5535292b' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '73749de5-be6a-41b1-bd5f-7695ab5140ca' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'a2082893-155c-4bc2-8b5a-0a548387e2fb' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '78b41be1-27bf-4892-a922-e8b8b5b67870' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'e939df37-5fe7-47d6-b200-1e30d1970111' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '641aeb2b-3570-48e7-901a-aaee02546444' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'c010d0ef-aa51-4efc-9e6c-202f34a9afc0' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '4593b993-f43f-452f-bcc1-f23b9c491f35' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'b61d9791-7b08-4242-9aa3-dbc166327549' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'bc2c6e93-526c-492d-86c7-0d85e4df55ef' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '591c93c3-4a91-4f89-914d-18a5f8ec2309' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '8d5bc2e3-7034-4506-b8f9-f58a3bfa8f06' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '425225d4-ae1d-4601-bb18-c0c15be5f61b' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = '7cd558a6-fec2-4b53-bc90-c9159de70aa4' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [UniformKey] = '125eba19-842d-46e8-b5da-02182775a4e1' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 34
 WHERE [UniformKey] = '95bc17e4-c7a9-4e17-80c3-4434d0c93629' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 36
 WHERE [UniformKey] = 'a469e761-0104-4f38-bf36-bdf44536634a' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6cfb1fbf-be9e-48e4-920d-6eb7b37fbc56'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'bb37b07d-5881-4d98-8e79-d1874101aa93' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'a0e38354-fe63-48ad-af69-5f5ed17ace72' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f0ff1d24-e3a3-4ac6-98d3-3a1d2247c237' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '15218a87-1f26-4905-8392-3f690a39e02d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '133e8fb2-7613-4918-ab9a-1bd960e89c2e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'ac7c3a5e-6954-4f00-9331-20a2def14961' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4aeaf201-130c-4a9b-bbef-6f43fe85277b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '18381582-ae92-4748-ba85-b2fb85019ff5' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '6c4a88f2-791a-4f5d-9534-3c7fafe7304a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '458d99b1-928a-41ad-b442-ff546124fa8b' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ebdd9207-cfe6-4715-bc69-70c901f5d923'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5c9c521e-771e-4734-b127-1281755788ed' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5eacf13f-7b91-4659-87bb-d9d2904ff5b3' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '7e0fbed8-13cd-48e1-873e-a5235d316193' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '0ef1e368-9b2d-43ee-8cf7-e8eae213554b' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '33c91c0a-2c60-4dad-8334-1003ce8416d9' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'ddf4c0a4-72b7-43b3-866c-b1bd985ece0c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '1b05091e-6247-430f-88d4-77390cdf4ebd' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '794327e1-5e30-4932-8f78-3ced922a10fc' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'b39dfac1-d59d-424d-9545-c819d9202d8e' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'f33ed593-23d2-47ac-bc05-5e0d16521263' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '1332b346-b9b0-45a0-8195-1c6087ce7f88' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = 'c425a5c0-3d43-468a-ab9b-006c7c5af94a' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '5a0e224a-ff10-4b09-b56a-8ec657d2a6d2' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = 'a7a12ee2-f546-444f-8af6-2207ba035175' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'b6fac00f-d686-418c-964b-9b465186c4df' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [UniformKey] = '878fd907-dcff-44e6-a086-e9dbbf250e8d' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a30d55f8-b1d7-4290-af8e-75261364c969'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'a3aea874-84c6-487a-b7b3-8d79c3aeb68e' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'a9ebf85d-bdbb-47f3-a850-ad86defac810' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '56433341-8ecc-40a5-9d18-6d7fdbb8e25a' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'a1756797-9d18-460d-b9f1-752d6194914a' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '928eafc4-7fe5-439e-904e-29cdf903eae8' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3fb43b08-b20e-4388-b4fa-81f54660294f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'e1c961c6-76ba-427a-b332-03b1c8644f95' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '845b436c-460f-4835-ae97-349791e22ac9' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'e7c85832-61a1-417e-abd0-ff2bf56b5127' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '5b05f809-9dd7-4be8-9043-f50972ffb19f' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'f4d11352-5620-4401-831c-ea3651221c11' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '3711cbdc-8cc1-4077-b0aa-3af396f7c42d' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'abdd8bbd-df11-4998-9fe3-16b22b9cddc9' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '130b64df-0243-475e-b393-32e2e12b7879' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'b5c2f777-08b9-4e4d-8d35-0e3737ea0cd6' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '41dcee9d-76ee-4f4e-a217-825c7b8c08c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'f15e6e22-d66f-4604-b578-82452b6b2fad' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '4270bfa2-b555-455b-9071-009b44492ac4' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '14c4cefe-345a-4723-ad28-8fe615317a37'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '57792fbc-b44b-4e55-8053-121651aff931' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '933765d5-30a9-4e9d-9d0a-dc25b5724195' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '51d4c751-7d03-4e56-9f80-a4ca743ee33c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd4b47359-8363-4092-b35e-d011ce8f1de1' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0898c4d0-508c-4980-a5fe-d1b45bcc683e' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'aa078a45-7de7-4dce-af83-9e5ea14e766c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '3696b84e-fc55-4f53-a0a2-73293425188e' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '970c4841-69cb-4e22-bd6c-7c7fb43bf9ec' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '1df5b4c9-f94d-4950-ab0c-0d5561b3dfcf' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '2f4c2a14-9524-45bd-9d1f-288d179883fc' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'cb23b6ea-317b-4c40-ba11-d437a69b6f5c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '4bdbf36c-4ef1-4d01-aa88-8533996ed7ae' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '838ba8a0-1a01-4aaa-9f72-9090ae8501eb' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '6cf4041f-c80f-4eb8-b313-851925de388c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = 'dcf78247-b509-4b5b-b8e6-588021e1482d' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '934571a6-51cc-4ddc-a02b-a0370f712a87' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'ae0d9c4c-286d-4929-ac6c-63386b6f632e' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f254fca0-c422-415a-ab74-99b780fc2a1e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5f1642ef-2716-46d7-a2a2-58e98c5032ef' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '042501da-e7b5-4810-a23e-bfd89314b213' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'c7f5133e-2df5-4866-a4cb-1c0a64cc3d6e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'e81f040b-02b8-4c1d-86de-bdf489325411' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '25f5c003-ac66-438d-9970-9dea0ba70637'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '38a62276-3b08-4bec-ba49-e38f82cb9087' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '26eea783-0bc6-499b-8bb6-af4863ee545a' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '2a4773fd-b5e3-4166-ae84-5bd1daf76b8d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3238d676-34a0-4659-83ee-a31a17b48962'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '64117020-9704-4ab5-9f94-d10bb3cfbe8d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '85acab7f-72ba-49de-a297-fcefc7452564' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0be26168-6950-495a-8e4c-b0538ab8b735' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '80b616e7-3951-48a7-867f-8632e0595a81' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'b68275ae-08ba-44dc-89f5-a9b949a9cd73' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '6fb43b04-edb7-48c4-974d-f0677d7a1041' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'd0508404-dcbc-4244-bdba-781fba48a39e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7b9b8c76-4ec1-4d97-95da-aeb667fefaa5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'a20f69b0-ac25-4027-a1eb-8e054e1da82c' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'f5b8b7da-0903-4678-b863-d7a0f51b72e8' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1fe06ef0-0085-4838-bd12-1b644205a5d7' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '11346ae3-c6d5-444e-bc4f-70641520d546' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b4fc44a3-8307-4e88-a2e2-af23f2dc7f22'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '32216f6f-4af0-4e65-a1e6-28ea0fcb4519' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '0026133b-32fd-4866-89e6-e3c7490e57f5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '86f38505-a8de-4e8c-ad62-0ab90c06ea7c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c71ef7d2-e5e6-45ba-8126-68f835bca1eb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7be39c03-138d-491e-b600-af9b121656d0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3bd77f36-0f00-4a8f-bfe5-48d50de0e2ba' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '168500cf-6277-4007-8307-5a7e6d7de9e2' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9cad4526-926b-4edc-b88e-9015002ec764' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'bbb3b881-7784-4a06-ae72-e17480eaef43' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'dee728e9-9064-443e-90b7-3d5b2694c5d4' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'f15dee6e-ae2d-4fcb-99ec-5baf989d18a1' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '3251a892-6b0a-4c94-a53d-a785de16201e' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'b62cccb7-33e1-417b-824a-f19754e37f2e' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '7b9e122d-a416-41e1-aac0-faecbd9b056a' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '379b93b3-6424-475a-9989-3694ab491744' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'db546602-69f3-4bd1-bb0e-c62b22cc9dd7' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '3683d2bf-4f1a-4747-ad33-7cca30ce69b8' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '8fba7764-0b4b-44f6-aad7-3358e5dd6ee3' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = 'c74be96d-9820-4a46-af67-6fb5be90b7a0' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'f9f1845a-df13-4f45-9307-b478eaa60b52' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '0bf0766f-237d-4b0e-b2cd-eaf3b86caf57' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '08806d48-5a1a-462b-bb92-a4a4b0d1a2cb' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9ec13d39-f57f-4904-a2ca-9e4a21c164fb' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c21ca2e9-3b00-4741-8e90-6c8870ddf9b1' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'e31cccee-45be-4c76-8fd1-0e835bbdbd6c' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'ca1c5878-675c-44ac-9b78-23e341ea6ed1' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '182f0d28-190a-4a87-826a-a0141f3d4611' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'cf700a2f-2d80-48b0-ab98-e10b14daddf8' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'e6553ed6-9b26-4741-9716-ec5b62464f46' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '38afa8d4-fe53-46a5-a976-bf13c5b40b68' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '4495f673-bea2-4c18-ab26-1cc88f7fbc09' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '92765523-3f05-412f-b264-ae6ccc2b3f39' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd4145ffe-9445-4147-9ea1-c770cfd496fb'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '24b719f6-170e-446a-bbb7-de1859e7e7c6' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '3aa80fc0-907f-4d63-92a8-4bf715b959f4' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '2a57dc7c-073e-4432-934c-1f665ee732e5' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '7f584222-0138-40f2-bdc5-abcc697b49aa' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f03f3d0c-61d1-4249-80f2-c81871961264'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'a526dc20-e57d-4a78-a38c-c36391a9f457' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'bbb4392f-16b7-4015-b9f1-c9bd856b30a8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3ba3233c-44e9-4488-98db-af9ab526d597' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '2aa7352c-c5e7-4df0-9b82-f5730cce5423' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '7a13ee49-cac4-43c5-986d-245d6f5733dd' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '01f8707e-0e3a-4945-be9f-c14197db5f43' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'e0f6585a-956b-4d2d-9426-98c1f6fd983b' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '38b03549-b297-4979-9ad9-0cb758196df7' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '95447b1b-0b27-43bf-99fe-e293cada5613' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '6ce12f50-b04b-4037-864e-4408ce11cfcc' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'db165858-deae-4689-be05-c02d8ddd5261' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '13b1d417-6a1c-4946-9e76-c78d38e1c287' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '6e8eb4c7-d9d2-4446-99f6-da2d81f63949' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b07b2137-2292-4bd7-9909-d8abb8e2dbe6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8a10de5b-88fd-4123-be2b-bd567494432c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'a1cc0252-eeb2-41c1-b0c1-e682ec6b53a4' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'd942cdc2-4d4e-4b25-8352-715d28a1298f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '888adaf0-77e2-4329-b6f3-161c1b2bc464' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '588c5c55-bb54-40e2-af35-85d7462486b7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'dacdd830-1f30-4860-9e96-db48614f755c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3aafb8b4-a390-46ca-b4ce-a026f43e8f33' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '9227fadb-64ef-4f4c-9523-6436e6e774d8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0a775ae9-569e-4ac9-a7a5-9885caca326d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'af7226c0-27e7-4fd7-908e-29859ed59a49' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'f89136a3-1131-4629-a86e-72b86761b1de' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '12e7ef18-dfde-4fc4-96bb-8e78c317fdba' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '096f8b6f-8925-445c-9e3a-b28cd828edff' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '49fed7b1-af0e-4c4f-9104-682ea0f21b30' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'b65c05e0-75bf-4d5c-85ca-e74816a79ab1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '11370a46-e44b-483c-a14c-39faa4be831e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'ddb1749d-e661-4e92-a0f0-490b60442fd0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '48ef86ac-e0bd-4f96-8473-0321a4a932b2' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9632f65a-3d6f-4c23-87ae-dde225ca5549'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5ac3994c-f6d4-40b5-a191-4ccb255abe6f' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '0a92e4f0-238d-4f26-bc2b-420cc797e34d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f6f19fee-0eb5-4526-95b4-47b063e374d8' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '037c74fe-62d7-4d43-920a-e571f5cdc424'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '4747399e-6c97-427d-8af9-dc98cec44234' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '79b96d92-44cd-4804-9550-8e4fceedae86' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'ac79b76a-0f32-4a95-9d52-6a8937977e56' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '726b9fc8-917e-4e66-8d7f-e94d65991f58' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '027240af-c487-4552-b0c2-c4d2d80ebf04' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '5b007bc9-5d74-44bc-8a2c-5c67d45f995a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'eed96820-da1a-4ecd-ae38-0c862d62d9b0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '44236c61-c3d7-4ac4-accd-e88a99c1f155' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '49b2fcf4-fabc-4169-9201-1a0b811e0a06' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'a964f06a-36b1-498b-9fc0-e108dfafd55a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'da6cb7da-f00e-4e5d-8aa1-a131443a34dd' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '13894ae4-ef61-418e-b8da-e59865287f04'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8a79dcfe-5359-4950-8609-a8d12aaf092a' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'e2c9ca52-312e-41af-b66e-1f81a975c399' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '22f26991-9ee3-41c8-b298-ddf902f9b2a5' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '55022f21-233e-418e-8d4f-3784c36401ea' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '2ab14719-5597-4984-aab0-c04fd41a1d12' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '71a7b773-d772-4728-b9a5-63fed0c9e416' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'b1ea5c7c-87ec-4caa-a711-202fe2bc5ef2' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '69be7cb5-ea26-4ef7-b3bc-2c537f807cf5' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '18ac73ca-ca78-4d51-96b3-41f68d22e949' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '0cc59b9d-98e3-4000-a807-eea44b537c27' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'b3944827-125b-4581-bc03-43e85e24a882' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5ee02126-c51a-4cfc-9945-e9a20a46872e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '055035c8-051a-41f2-a4e1-3f13506d70ad' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '286534a3-5766-4c55-b0ef-471f43e5a6c0' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'c94e3898-08db-4fdf-a4f0-165f7abf591e' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f8b66648-159e-46de-bd2b-d48bddc377fb' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '917029dd-4695-44eb-b059-666ea329ffad' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '5599bb2e-f635-4797-bc84-7ce263d7bf53' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '6ff93c94-250c-4b63-b79f-d0dc612606cb' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f7ae0cdf-21aa-4853-a553-e9ad4df4349b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '48841d7c-0968-47bc-abe2-b8bdc69c14f2' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bcdf3d8e-15c9-4a6b-9f05-a12da58a7fd0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '95b31c36-e172-4860-841f-0640ec932aed' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '6255cec7-8cfc-4f75-92b2-4f8ee1b5d26c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '337a4fdd-529c-431c-aed7-cb43cf900adc' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '44df5f36-d000-4c1d-85e9-7f5810bc3ab0' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '7220e8fd-ea69-4c50-9b19-1d086c932254' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'ab0fe306-51bd-44e9-a052-9aa268ac40ca' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '1a4b8a72-5727-4476-870c-d74fca1b0eb6' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'db02e58f-06f3-4a53-8df4-70d639016a07' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '43ebb400-76af-4d69-886b-cb86a28a4cc7' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '78546a31-e4e4-4d2c-adc4-f25e6b5c8105'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'f9b252b1-9813-4875-9af8-98718d425db1' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1f76b1af-1fb7-450e-8a61-3b157be71f9c' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'a1ef614d-8f36-4bda-af07-a80afb1426a5' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f2bb175a-5fab-4595-bee7-5c46ff12a170' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'd6750c51-18d9-4e08-905c-7e991fa05078' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

