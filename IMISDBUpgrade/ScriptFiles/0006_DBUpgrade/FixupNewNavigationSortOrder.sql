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
 WHERE [UniformKey] = 'e023be30-141f-4e2b-8bad-8a18bbb896bf' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '1d8e49b9-e7fb-467d-8cc5-253230464f8b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '7845b337-f9cd-4d40-b880-f58ac6966233' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '524d548e-b9b7-44f8-9fef-a997138cd289' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'f4ea893e-6b67-4b23-ba44-62f8aee84271' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '325f4da4-ee0c-44d7-9f40-9019f14054a0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '2188a5bf-a032-4954-b5f5-e2fac9b8539d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'b3871008-3fc7-473d-8fa5-ac38a2434a34' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '606c0c43-1ae5-43ba-9d97-4baf93eb7338' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '58fe9f2f-441e-4342-b5e5-b209ad01161c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '9280eaa7-bd38-45b1-9502-c9297c14b0e0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8ba5983f-7ae1-4c6d-a63c-0cf725ceddec'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8bef94ca-f06c-4e2a-8a55-7f5c595e357a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'b1810e41-24fc-48f3-ba55-e6d2b4af57aa' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'bf6c0335-f421-4b03-ab8c-3b38ac975062' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9093756c-a921-420a-9fad-0d5007f1dd43'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '6ad359cf-ac49-44d1-b1d8-277077315160' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '48cb8dea-30b0-4671-947b-0d53709ece76'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '658489a8-fee4-489d-b27e-da84b4d99dad' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'ae87f7d9-0e2b-48c7-b89e-c5074a14e829' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'cf3be8db-e9c4-4973-8514-a5d4f76854c2' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'e8306cfa-d2c2-4c23-ab38-3cd94f69d86c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '58b38eae-4bbe-434d-b837-90924c2899f7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '129d6ad2-a69d-4d34-a50c-572d167ebd52' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '3ee76fad-81be-4744-a84f-3db1b70f27b9' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'dd44d2ad-9cb5-4f52-ba44-5bd04d342912' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '93a05893-fbfb-4cf8-ae8f-e7cf927037bf' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '980755a3-69bc-4317-aa9d-dd7fb233e4f6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'f5bc1801-515a-4e97-bf1e-2ae3f743055d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '365f9e45-4a0d-423c-bd68-290a0e20205b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '425f218d-b8be-43b9-941e-20c22a38414e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd3a3e446-e9fb-45be-ac3d-10d42066249a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '10e50356-5c9d-47db-bf50-7153c232a258' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '192c8ed3-e24f-4a80-adf2-67533e3800b4' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b7a2750a-8a3e-405b-8160-12bb5735b61e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'ac1b8707-6778-4076-9ff7-8afbc7d863ac' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '43759885-196f-42b8-ab3e-ae062a97170a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '026f7a37-dd89-4358-a223-13c555ae66d8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '03c7897e-797d-4924-bcd9-5a029d63924d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'b845cf89-07ea-4b29-85e0-65cebc82e6fe' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'b488a5fd-1d1a-45c1-9a45-c1706406b691' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9bc377f0-0807-4107-9385-1752f79cd1cc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'cd107867-cf0e-4336-a202-9c9a4f9ff3c6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'f8c14c6e-8d52-4ffa-afb1-11be1b6859ae' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9e250f4d-0c8f-4680-8a4e-5265201a599e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd867de67-0d87-4826-948e-1cc79f514bcc'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '58e8b2c7-2a75-4a91-b715-80268f322c08' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '30282bc5-6bda-4186-9e04-d247bbf4bf45' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '5c454f7f-1752-42a0-a57f-f517c0b732e7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'e61f66ff-decc-40b1-90d6-f7cc2aa1decd' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '572b535f-034a-485f-92a2-b21ab2a3e52c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '061ba79b-aef5-47c3-a6d3-db396b78b64e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '2d2c5f87-a9c1-4cc1-83a0-7f3659512f48' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '773aa795-bfc6-4d69-a1e6-c8902597af39' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '8edbd333-a1bc-4502-ace8-a4235a987f24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '9db0d63d-c431-466a-9e7a-8058f8c3574f' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'f64252fe-cec2-43fd-8b02-af5148ec8724' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '3f4d03e8-43ec-4d5c-8e55-926c34da7873' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '57578eb3-d85b-41ea-abee-94015fff279d' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '4b77d8b3-7a28-4014-945a-ca70bb398c3e' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'ab78a559-ccf6-451a-848b-37502fc9e66f' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '1524a77b-c019-4bb5-9c1d-a76a9014c937' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'd65a7e13-2bca-4a4e-a9ff-602839db00b3' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '0ecb2b3c-d3cb-40cc-b2f9-6594c668cf1a' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = 'c770dc47-9580-4c15-9bca-43a5644fdc1a' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'bcb6497b-858a-4f5a-9131-c2f4fa4f8601' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'b1576b8a-bdf5-43a8-a59f-fd5416048031' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'b1f6c469-0b5f-4877-8e60-c87946f4228d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '2fbc85cf-9ab0-44c1-a0db-1ebb4e22b32f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '2eb647d6-02fc-4b22-bc6f-5220f66c7afe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '6fba54ba-7f73-4f46-8c89-2ca5b593e04b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'b35f0b99-bc7c-440e-bc77-3fe91c69c10e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '3ef06daf-84ad-44a8-95e8-772f1459b519' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '220c36ad-b770-4712-b473-f576165485a2' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'be62478f-d245-4588-a762-6d01de29ae24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '25475bc2-9c11-4d21-866f-9d7e9df95196' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '3898550a-2e77-4733-8d11-07eab2e50d2c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '670be00e-c8e8-4f60-b149-0e8017852837' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '7e91e9d9-7a81-4bde-af75-1cd53cbd3bf6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'eb28640e-6ca3-4458-b4eb-2a581004d6f0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'fd75a83d-702d-41e9-b553-1bfbea1c3d08' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '49f060a2-8bb7-4d6b-813a-f6af4702c71a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'dd28f2db-a8f5-47ac-995c-6b110c6db25e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c110217d-01b7-4ff5-a57f-2e65ff638757' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '7b68526a-0bac-45b4-bdea-db554cdaba35' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '619c8159-629c-4967-8867-42c81e4c491c' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'db271cc5-56a2-4cd7-91ff-2d6ed699f0ad' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'fe8579cd-7100-4ee1-a814-8f51d2e4c01e' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '979de28e-cb48-46cf-87d0-2c0c75330143' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'dbf2107c-761b-42dd-9573-96c0198dd1a9' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '7e7fbd68-f02e-4e52-80f0-d5155c180ee7' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '4da4dd6e-cb5c-44d7-80a7-d2fb7d80cb27' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '792c81ce-92f4-4ad7-9ed7-a4c4a2138e73' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '5bf978a9-48da-44c6-bcdd-e095d2806ad3' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '44c9c319-19cd-4841-95a3-c1d9a895a014' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '42bff3f8-ea4a-47c4-8ae0-fea3049e50da' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '004b4c17-8c00-4d4f-8e56-3a5ba7f5b767'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'd2f8a071-ca8e-4254-9831-fd6bb9536dfd' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'c87a2b56-013a-411f-8be0-9e0aac82326c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '7b14f450-37f3-4634-a51b-5d7ec3a0c24e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '871bffef-3625-44f2-867c-c74a2988ca34' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '850d30a2-450d-42c5-9e7f-97e999a56abe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8301772f-8205-4677-afac-3a65dd31c903'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'f88ecec3-a62b-4049-828f-91f9eb026c87' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd5f35aa5-27f3-4bfb-90dd-b0ea2b0ae954' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1ccf8825-5a08-47fd-8900-449a62a25a07'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '754a879f-0d40-4e8a-85e6-198e9534338c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5cfe2a09-4d15-405e-a14a-65ed5347389d' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '27fa035f-8af4-44d6-b1af-24ba68daaa82' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c07f3cd8-2bf8-4ab3-90f2-45b2163681d7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '1de7e1ac-d75c-4cd8-9743-d98faa80a134' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bc905f78-c6d1-4d54-8747-e30177852030' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'fd49eec1-0757-4309-9ab9-f593a05aaf47' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'ab39c2b6-ff5e-42fd-a77a-7daae4f07d82' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '338ae590-4e61-45ab-9bcf-fc7b01118935' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'd0c20ac9-0a8c-4ece-8435-0d89ad76ca50' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'ec10006f-ec3b-4d54-9701-7eecabb2a9c8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'de447083-6fe9-47e3-a6fe-860e6e74aae9' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '71394bad-3650-4f1c-9a18-52ae3c37538d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'f64aa200-fcf4-4230-8cd4-8fb6116dc4f5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '960da0a6-045a-4725-a779-b69551fac797' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = 'b37b9ee0-5a9a-45ed-b01c-488d864cfdca' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '9f65b52f-9658-4832-9452-f5f20534f0fe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'e7fc218c-41f7-4430-82b6-5bca94d208b5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '209299bf-73ec-4d00-bd7f-03ce9c6158c8' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'f5a2a9b6-a521-4f86-9793-ce8ee392650a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'bc71ccde-0037-44fd-972d-0ec1b6389937' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '54de962f-d41b-47e3-ae21-6257ec854fe4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '29a2bb67-6241-4c59-893e-78fca5be9a2c' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '52576bff-789b-4485-9754-836e9f02b866' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'cafec0f3-601d-4c89-b302-e0fb578850ea' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '072e698b-2729-4d2d-9742-67908ee4963c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3f9829ab-6d75-4059-bd1c-d6f23449ff17' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1b1b4d71-0bb2-444c-a85a-87f6d9f0f26d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '78267c83-0799-43ba-b503-306897789687' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'cff6a6c2-999b-4a2c-85cf-d5c184fb7398' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '06d7240e-2cdb-47c4-8fbf-ce3177af9fb6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'a7caead2-e148-4e73-ae2f-ce0ae22c969a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'd67d7ac8-43c8-4dde-a80c-41fd5a9d884e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '4dbe3926-b294-4edc-8459-bf788907fc75' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '7662d775-2a40-47b4-a074-adba8c2215de' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4afb3ceb-8718-49d5-82d6-6839de8fae82'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3f1096e0-7b51-4453-804f-aa1d8f4c4bd7' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '0c56f244-f19e-44e4-a578-0820dcdb01f2' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f8a0ae2c-24b2-4e73-a626-b642a2d7d37c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '16ae2dfe-f244-449e-9333-6972468421aa'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8984b68b-4f9c-4f23-9d1c-ede044809f81' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'dd900b72-470d-4ec9-88e7-d3da07eecddb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'af36b13c-daef-4dd1-8c7f-3ee2aee4e0c5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '73343345-5218-47e2-aa50-17fffc7bfb55' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '4ba6a67f-4c30-432e-8c2e-9df0f762a863' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '145af2fd-7f60-4ddd-8f20-1df3b46599a0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '603144a7-cc68-4210-b477-47759246c65c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'e6df2fd8-d691-4a90-afef-6f9c871f43dd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'df6ee3f0-22a9-4ff7-a45d-792d81a69af0' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '182f0d28-190a-4a87-826a-a0141f3d4611' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '2432a951-43d8-44a6-9410-1ef9b4a38617' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

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
 WHERE [UniformKey] = 'dddfa43b-94d5-4947-b59b-b459bd84ab6c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '0ef1e368-9b2d-43ee-8cf7-e8eae213554b' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '33c91c0a-2c60-4dad-8334-1003ce8416d9' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'ddf4c0a4-72b7-43b3-866c-b1bd985ece0c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '1b05091e-6247-430f-88d4-77390cdf4ebd' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '794327e1-5e30-4932-8f78-3ced922a10fc' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'b39dfac1-d59d-424d-9545-c819d9202d8e' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'c425a5c0-3d43-468a-ab9b-006c7c5af94a' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = 'f33ed593-23d2-47ac-bc05-5e0d16521263' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '1332b346-b9b0-45a0-8195-1c6087ce7f88' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '5a0e224a-ff10-4b09-b56a-8ec657d2a6d2' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'a7a12ee2-f546-444f-8af6-2207ba035175' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [UniformKey] = 'b6fac00f-d686-418c-964b-9b465186c4df' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 34
 WHERE [UniformKey] = '878fd907-dcff-44e6-a086-e9dbbf250e8d' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c76a2be9-6d30-47af-a95c-722a30e4cb8c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8744e453-61c5-44cd-ab7a-52d61c37fb45' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '4c123324-1f7c-4172-885c-acf59ebb641f' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '836d7088-382b-46c4-846c-6bf01cc5b7f0' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ba712a57-8a97-4e58-8618-74b214deb7ff'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'e4108a5c-7b94-41dd-916d-72eec861443f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '9f2ceda8-a260-4699-9349-04b3c53d3932' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'b4e1b24d-ad42-4d99-87b2-88b630a4a154' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'b5d61d73-30dd-4824-9b35-c00a84bc12f3' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6bcfa42a-cab4-45c0-b8e2-a3191825acd7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '13e3bef7-84dc-4c67-9c90-5698cd173a55' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '40e4954e-038a-493e-868b-58105aee6d3e' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '3708d382-08b0-4076-af31-f2ed0b7932b2' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c10cc9b0-7b90-4ae9-9163-8d8cd939f858' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '2fb36623-527c-4a7d-bc70-6e19f78ed17f' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5af67120-e4f1-47ef-aa07-a3d258029d9a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'd2446619-a47d-474b-9203-9f3e8562f33e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '6cd3a57a-017b-48b6-b687-56931bce7779' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'd81d5628-14dc-491d-bd9f-dc3fe4c61c82' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'b6060e73-80c7-4bdc-bef8-9ffcb7def854' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '6e7e6355-70c4-44fa-850c-4ea91a225368' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'b1dd1c77-7492-422e-81b0-d6b9fe795e9d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '7e884d84-3068-4fe7-ab45-0001413d5cbd' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '8581ae88-ff2c-4109-95c7-a13ddf214f57' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

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
 WHERE [UniformKey] = '1fe06ef0-0085-4838-bd12-1b644205a5d7' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '11346ae3-c6d5-444e-bc4f-70641520d546' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '24e41be4-4e19-4255-82ad-df2485f4c1fa' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'f5b8b7da-0903-4678-b863-d7a0f51b72e8' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'b4fc44a3-8307-4e88-a2e2-af23f2dc7f22'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '046a062f-f10a-4f9e-a502-878ff4c02ddb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '32216f6f-4af0-4e65-a1e6-28ea0fcb4519' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0026133b-32fd-4866-89e6-e3c7490e57f5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '01edaa0d-3555-445d-aac6-2f2e6617d9f8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '2e19f4e1-4896-4571-989e-bc0bb5693b35'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8d385ef5-1824-4826-ba5e-f2d7742967b7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1c8ef6cc-51ec-4c16-b0b1-190bf4b0fa2b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0039afbf-5465-4437-9638-245b8fc40491' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'bff679d7-a974-4c32-829c-58ab4be66407' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '7ed2257c-48ad-4a2c-8e2c-43f65b10dcbc' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'ac1a82e0-8e13-4f4a-81ae-838a2362fd8f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '9f956076-a2fd-4471-b30f-6c1af66a768c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '9548143c-0cea-4b66-a8b0-eb70065f0cda' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '6e6319a9-f85f-4132-8cc7-d3fa045037c5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '27f9be35-13b0-4d2f-8e32-6f8e2e322886' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'db9c98a7-e468-46ef-afb0-396204ad6bc4' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '8bc752d3-3894-4a17-8451-828620a866c1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = 'e0ecdbc4-2423-424f-9f05-03510743d52a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = 'd6138b42-adcc-49b9-a18d-fb71104592fd' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = '588c5c55-bb54-40e2-af35-85d7462486b7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 32
 WHERE [UniformKey] = '44c97ddc-52c5-4c6b-96ee-5977425d663e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '523b90ef-feb4-4ec4-8f0f-c54f2ca3fb32'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '31d58120-2635-410f-bd36-37efd8ded24c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '7c25ee35-b76b-4c6e-8a7e-51e0650548b5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5851e4ef-8f40-44ef-9131-c581844db1b7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '2b395fd8-8a02-46f7-8b01-b083fcf6ffaa' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'da4b33c8-d91b-46a3-bfe1-081d31057c97' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1889399b-d89f-42b7-a3fb-c2ae5be3ba5a' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '50273775-0958-4f8a-90ec-26c2dea6dd6c' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '7f61dc0a-a4a9-49d0-96d4-0c2bca46b3c8' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f03f3d0c-61d1-4249-80f2-c81871961264'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'a526dc20-e57d-4a78-a38c-c36391a9f457' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'b4b92d12-ecfd-4bba-b0d4-3405e8695193' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'c9fb845b-6b57-4e94-a1b4-58e592f358b0' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'bbb4392f-16b7-4015-b9f1-c9bd856b30a8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3ba3233c-44e9-4488-98db-af9ab526d597' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '431c200a-230d-4524-a5b6-be607ab8a0d6' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f976d8a9-c9e2-4a3a-b001-5f7b6e939a93' AND [RootHierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '563cc449-e325-4714-8f85-cb565b952fe7'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '2040634a-873f-40fb-954d-9eca0667d942' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'd0ba9d31-b891-456b-9ce9-2f3b99ce202a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '0680dbe9-27dd-4bf1-bacf-d31075055050'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8008e077-7050-4b37-9547-49343588a36e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '64889e26-a69a-45f6-979a-482b55e3e9eb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f77418e9-0743-4c9b-999e-a53480e8b8aa' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '0d5e8d7b-0bb4-4e08-a47f-92836a4ada37' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '225fd0fc-9d7f-48d8-a809-55d88108de02' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '28c44beb-c383-4a69-9466-19914e7d0a35' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '888adaf0-77e2-4329-b6f3-161c1b2bc464' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'dacdd830-1f30-4860-9e96-db48614f755c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '9227fadb-64ef-4f4c-9523-6436e6e774d8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '3aafb8b4-a390-46ca-b4ce-a026f43e8f33' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '0a775ae9-569e-4ac9-a7a5-9885caca326d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '70835c43-4ca1-4bb0-8bde-002a432ebf1f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'af7226c0-27e7-4fd7-908e-29859ed59a49' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'f89136a3-1131-4629-a86e-72b86761b1de' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '12e7ef18-dfde-4fc4-96bb-8e78c317fdba' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '278acec6-700c-408c-9fb6-d5c69d0cdd51' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '096f8b6f-8925-445c-9e3a-b28cd828edff' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'ddb1749d-e661-4e92-a0f0-490b60442fd0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3dd558bc-260d-4dbe-a316-e456537f5777'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '739aff8b-ce3b-448e-af29-c265380f4b54' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '1820efcb-c05a-4164-a02f-59c0b3365745' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1ce5184d-5e3e-481a-8ef0-3edb8b35fe3c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'bb8411eb-124c-46f9-99ce-228b0882ce17' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '5b0aab4a-adb3-4401-acdc-bd9c22e582fe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '61d9e094-38d2-4841-8071-8adb1faf4ef8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6b98b860-80d8-4189-961c-ee0205e9a2b3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'a1cb5e8a-6a7f-4208-a466-91ab07c51dac' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'a8b22f4e-3dce-44e7-a55e-6e10c2f35390' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'f76d9807-fd5f-40fd-a8c1-7129c20694c0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '175dfbd8-775a-4093-91a7-1dafa6588587' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '6cf63900-8fb3-44e9-a52a-e89125cf8a44' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '48e0cfc9-e01f-4486-9927-6e5803fd244c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'c0fe87e5-7d9d-45b8-979e-89a039f4d1a1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'c33ce944-b3dc-46f9-af55-d9c21b3a1dc9' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '30c47c3c-2a9b-4d03-ad16-ad09744ffa22' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'd7ec06fe-eb7d-469a-9fa4-1456ce053824' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = 'df7c3910-b3e8-4ded-95e9-339f1441269e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '4dba19b7-02cb-40ca-8ae7-2e4d2f415ca7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '5eca937a-e7ed-4604-aad7-a88b52d7ac76' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '7c91e153-2cde-476f-8e6f-b970c329f526' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '8de19e32-b8c4-4a40-a109-efd57872d677'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'c14b878f-1854-48e3-9366-a35647972fe7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'b82cab22-0a96-4557-a334-4e0081efe92d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9defb847-2feb-4eae-91cd-f474ceb0eec8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '0c9f727a-5a98-44d4-a5b7-c65b4b8e6957' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'b44abd14-ce3e-4c3b-83a0-c7eeab1dcba0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '934600a0-100d-4514-8bb7-bed8ca2b1725' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

