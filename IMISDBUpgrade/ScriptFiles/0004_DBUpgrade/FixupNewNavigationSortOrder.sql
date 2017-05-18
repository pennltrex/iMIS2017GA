-- Update Navigation Hierarchy Keys with proper Sort Order
DECLARE @sortStart int

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'c0f8cee5-a76c-4a56-b71f-08ef34124e99'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'c194e5e6-c69f-4ae6-80d2-a8c16f581684' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '953f504e-b51a-4595-8f23-c01a7157e822' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

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
 WHERE [UniformKey] = 'b3871008-3fc7-473d-8fa5-ac38a2434a34' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '9b34eaaa-be9b-4a79-a03f-46443d5bd42a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '58fe9f2f-441e-4342-b5e5-b209ad01161c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '9280eaa7-bd38-45b1-9502-c9297c14b0e0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '58b38eae-4bbe-434d-b837-90924c2899f7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '129d6ad2-a69d-4d34-a50c-572d167ebd52' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'dd44d2ad-9cb5-4f52-ba44-5bd04d342912' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '365f9e45-4a0d-423c-bd68-290a0e20205b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '93a05893-fbfb-4cf8-ae8f-e7cf927037bf' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '980755a3-69bc-4317-aa9d-dd7fb233e4f6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'f5bc1801-515a-4e97-bf1e-2ae3f743055d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd9467c06-942d-4f48-99b6-1016919f25a2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '486140ba-4d69-418f-9210-a885cb4c1798' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5091c0bb-cdbb-4dd0-abbc-3beb6463e42e' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '60dc3069-4591-407c-ab92-f759534e47b7' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

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
 WHERE [UniformKey] = '5c454f7f-1752-42a0-a57f-f517c0b732e7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'e61f66ff-decc-40b1-90d6-f7cc2aa1decd' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '061ba79b-aef5-47c3-a6d3-db396b78b64e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'dd900b72-470d-4ec9-88e7-d3da07eecddb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '2d2c5f87-a9c1-4cc1-83a0-7f3659512f48' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'a4c94640-377f-491c-8443-41182100622c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '2dc80eb4-7c5c-430f-955b-7d7953651f5c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '45db5da6-904e-4a3f-86ad-166d24dfd8db' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '321b0c4f-032e-477f-ae17-6811fe3d7127' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '51473c22-1a5f-42bb-a022-335f0ded0a29' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '21ac2a76-e548-41af-9d40-f2b1db0e4917' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '44a2556b-043e-4a52-8bea-fcddc255fb09' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = 'a1297d54-ca84-49d8-9711-90f274912eba' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '77f4285e-7688-4ccc-8c0c-1e4bcbb2a765' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'bcb6497b-858a-4f5a-9131-c2f4fa4f8601' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'b1576b8a-bdf5-43a8-a59f-fd5416048031' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '3ef06daf-84ad-44a8-95e8-772f1459b519' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'be62478f-d245-4588-a762-6d01de29ae24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '25475bc2-9c11-4d21-866f-9d7e9df95196' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '3898550a-2e77-4733-8d11-07eab2e50d2c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '670be00e-c8e8-4f60-b149-0e8017852837' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '7e91e9d9-7a81-4bde-af75-1cd53cbd3bf6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'c110217d-01b7-4ff5-a57f-2e65ff638757' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4ad0d052-bbbe-46bb-90ee-2d295b7c5454'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'fcb91d45-8ceb-4533-be99-d5e991b0ab3e' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '7d5fe17f-7e56-4da8-8f56-3d93b3520e5f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '6befebba-1d09-470e-bb4f-b7ea11ba5c9b' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5ebcf930-93e6-4f0d-a99d-5e75b2c7e37a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9b65a09e-ceaf-4586-8750-ade909166065' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'bef750de-82c6-4698-bfc6-03f05c5a90a1' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'cdf92095-58e1-4be7-ae86-0992d72d9e60' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'dfa92d7b-a15d-4156-ad30-3f1af578adf3'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '19976614-9813-41ba-96e6-5e362552f16a' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '350926f1-2894-485b-8725-9afc4a3b357c' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'cfbfb05b-930d-4356-a232-9c5e8762313b' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '18828b7e-9ad9-4b4c-ae1b-d53e56299e83' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'db9d0b08-6471-4468-9907-3a0d695926b5' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'c376a730-8f8d-43a9-9485-dae0dadc031a' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '7a4aa5e7-c118-4365-8b02-3d5d27c9bb2f' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'c3c46f0a-87e2-4119-bfc7-aec2ed43dbd6' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'c5b1c7f8-458a-4e68-955e-1c7e03dbc160' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '6c2e40b1-a144-401e-8eb0-a889a9831af6' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '9c303bf2-6413-4dc2-b320-c858a7a690fb' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = 'a93bc541-67a5-44d1-a378-a24296320908' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '628b702b-5f5a-4194-a688-97b1a962ce23' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [UniformKey] = '7d11a01f-0c3f-40ac-978c-cd7f5713b334' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 30
 WHERE [UniformKey] = 'f72f6f96-0c30-40d4-aa80-37934e604481' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

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
 WHERE [UniformKey] = '8edbd333-a1bc-4502-ace8-a4235a987f24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'bc905f78-c6d1-4d54-8747-e30177852030' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'fd49eec1-0757-4309-9ab9-f593a05aaf47' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '338ae590-4e61-45ab-9bcf-fc7b01118935' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '71394bad-3650-4f1c-9a18-52ae3c37538d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'c4fe23fd-f2ae-4d93-895c-3ce3992a0f54' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '960da0a6-045a-4725-a779-b69551fac797' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'b37b9ee0-5a9a-45ed-b01c-488d864cfdca' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '9f65b52f-9658-4832-9452-f5f20534f0fe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6c010611-c7ae-44e3-9f35-4f5daa8014c0'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '097f2a64-e2be-4278-82b6-b12db027e303' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '89ac53f1-4bd5-45f8-a03f-ef32f4c47906' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '48150892-1392-4633-8a82-529c40760bce'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'c071afce-6e3b-40db-82ad-71d5b1a5ac28' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5ed62239-9cce-45ac-b00c-53529a55ad2e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '455ac1af-5120-4f3b-ae3a-beeb700a84a3' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

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
 WHERE [UniformKey] = '5cf2d1e5-9982-4895-a404-06249b5f6269' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'b5d0e12f-c69b-4c60-8ada-250b221a1942' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '2c976a8f-d43b-4004-9948-2162675cafa7' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'fca0767f-5f78-436a-9ff5-1db9117aa9b9' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '4c178cbf-980c-402d-be75-f2cc246e521b' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '94e31001-ce5a-4963-97ee-39cf39b6633a' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1f12e4e6-ff76-4af5-9d54-612ded81cb73'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '77828314-a2be-4a6a-9395-c2650214d0e9' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5e87fefb-49f1-4d89-abfb-68f1309bca38' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '4ad8795b-ad61-4414-bb3f-664366fd34ff'

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
 WHERE [UniformKey] = '78dd5bb5-c338-4ede-9017-892567542b79' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c94e3898-08db-4fdf-a4f0-165f7abf591e' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'f8b66648-159e-46de-bd2b-d48bddc377fb' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '917029dd-4695-44eb-b059-666ea329ffad' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '5599bb2e-f635-4797-bc84-7ce263d7bf53' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '6ff93c94-250c-4b63-b79f-d0dc612606cb' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

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
 WHERE [UniformKey] = '6e6319a9-f85f-4132-8cc7-d3fa045037c5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '588c5c55-bb54-40e2-af35-85d7462486b7' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '1b26bfbe-5a65-453f-80ce-ab0803b779e0' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

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
 WHERE [UniformKey] = 'd3b32821-71e4-4c1a-82b9-3df3cfe11c97' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f0ff1d24-e3a3-4ac6-98d3-3a1d2247c237' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '15218a87-1f26-4905-8392-3f690a39e02d' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '133e8fb2-7613-4918-ab9a-1bd960e89c2e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'ac7c3a5e-6954-4f00-9331-20a2def14961' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

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
 WHERE [UniformKey] = '836d7088-382b-46c4-846c-6bf01cc5b7f0' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '1c27d5f7-6f0b-4b73-89a7-81ae0d25154b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '11109a68-c79a-43a4-a709-7d3502a54f07' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'ef85b467-e2c2-4c65-98e3-c19b3fdc96cf' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'f254fca0-c422-415a-ab74-99b780fc2a1e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '886e4a55-c54f-4c51-98fb-90f2735e5d45' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [HierarchyKey] = '2fa977fe-67bd-4f65-9e38-a3b2739fc0b6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3f33fa5a-6226-4418-80a8-35ffd4e21e14' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'f73bae19-a049-4dbf-b923-09b82541b05e' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '25d359bf-71f6-4dcb-879b-20a6c1cdc74c' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '658a659e-1a09-4562-a52b-264a4fd9cff7' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'edc495ff-d157-4af2-b518-6b33197f76b3' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '4152b33b-475b-4fd4-a982-6b783e9f68c3' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '67f1098f-7d95-4455-83a5-e58a3490e741' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '2b94c2a6-5afe-488d-88a2-93b6114d5f0c' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '0ce42402-9aba-4ae7-a487-c1aaaf891962' AND [RootHierarchyKey] = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'

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
 WHERE [UniformKey] = '01edaa0d-3555-445d-aac6-2f2e6617d9f8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = 'c93317c5-5e10-409f-97f4-c9c53b8ab269' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

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
 WHERE [UniformKey] = 'cf700a2f-2d80-48b0-ab98-e10b14daddf8' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'e6553ed6-9b26-4741-9716-ec5b62464f46' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '38afa8d4-fe53-46a5-a976-bf13c5b40b68' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'eac20d14-a6d9-480a-822b-2f5f55b56f72' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '6a70dd18-770f-4cdb-899e-41d6f5e3f400' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '4495f673-bea2-4c18-ab26-1cc88f7fbc09' AND [RootHierarchyKey] = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '5c838498-df8f-4931-a4ec-b9e7511e0429'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '8c1471f3-a780-49c9-9033-96cd7cf0cb13' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'ef2f2b42-9294-40f2-8894-95cec129ece9' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '204066e4-087d-4389-a5ac-928841723f29' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'aca3a852-36c9-46dc-b91e-a5ceb00334c1' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'e64d79df-007b-48af-9f82-20a8685051e4' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'ae72766e-76d1-463d-a27a-51291c53e40e' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'e379134c-3d5f-466e-b69c-bee728490364'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '95ab82ae-3e9d-475c-8ac2-d8c596928219' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '213904cc-267d-414c-834b-da52ce7e7ca8' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '9418f7da-7dce-4623-8876-61536cafccb5' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '66910e5f-9577-46ea-9e05-22633eaf0cb2' AND [RootHierarchyKey] = '37430f7c-5b73-48e4-bc9d-57da9841f50a'

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

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'cc2af42d-63b1-45ff-afa4-cf15e1f33f7e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '40257245-22a2-48c6-a46c-bfdcfd265ca8' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '5ac97eb5-fe0f-4d3d-a762-811d089214e7' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '60474e43-404e-4480-a94c-f78d34c3b141' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '46545daa-2c08-4b3b-b3d9-941833f0e03d' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '4f73e9a4-5b08-4e68-a5ef-39c54b01b45c' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'c061ba3a-9ee7-4d17-b701-57f1923763c3' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = 'b804e93a-7ca5-4ab9-885d-f4c8180e3bfd' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'eb5afd57-b8db-4a8e-bb2f-58dc192e5470' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

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
 WHERE [UniformKey] = '64889e26-a69a-45f6-979a-482b55e3e9eb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '225fd0fc-9d7f-48d8-a809-55d88108de02' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '278acec6-700c-408c-9fb6-d5c69d0cdd51' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '0a775ae9-569e-4ac9-a7a5-9885caca326d' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '096f8b6f-8925-445c-9e3a-b28cd828edff' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = '49fed7b1-af0e-4c4f-9104-682ea0f21b30' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = 'b65c05e0-75bf-4d5c-85ca-e74816a79ab1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '11370a46-e44b-483c-a14c-39faa4be831e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = 'ddb1749d-e661-4e92-a0f0-490b60442fd0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '48ef86ac-e0bd-4f96-8473-0321a4a932b2' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '582b8125-a669-415a-8182-ea4ea2192eba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5cd0060b-463d-4a45-abaa-b23a4bc9db72' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '80ab0c54-1527-4c01-aff5-af08efbc6972' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1e4879cc-19b7-4151-a18e-135be0e1d3d6' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'fc4d663a-8aec-4d22-a1af-813d6f0678ae' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '2e54e23f-3ede-4738-8ece-7f9ecad1d553' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'e709b0c9-eb44-4872-bbed-b5d89ecd227e' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '1f2e4c5b-7e4f-4ed3-a1cb-ca00c143a7fb' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = 'ecacd6fe-6976-45cc-a698-97a45f79d73c' AND [RootHierarchyKey] = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'

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
 WHERE [UniformKey] = '6cf63900-8fb3-44e9-a52a-e89125cf8a44' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f76d9807-fd5f-40fd-a8c1-7129c20694c0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'c0fe87e5-7d9d-45b8-979e-89a039f4d1a1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

