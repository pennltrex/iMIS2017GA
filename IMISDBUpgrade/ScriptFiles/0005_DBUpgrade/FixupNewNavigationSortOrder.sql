-- Update Navigation Hierarchy Keys with proper Sort Order
DECLARE @sortStart int

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '9228611f-b47a-4e25-9088-0bd71b9d4238'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'ce3b9127-661d-4519-89c8-5db35db5529a' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = 'fbf0afc8-5b74-4bc5-bab5-5906ea352f3b' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'e5203591-55c2-4358-97a9-a7e48437347a' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '48ca3a88-f1ce-4cca-b95a-fac68d19df9d' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '6c3bd796-6e69-468f-a71e-8d474ead0d3f' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = 'd21296ff-2889-4a7d-a1c8-d650d3cd9c27' AND [RootHierarchyKey] = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'

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

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '425f218d-b8be-43b9-941e-20c22a38414e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '572b535f-034a-485f-92a2-b21ab2a3e52c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '061ba79b-aef5-47c3-a6d3-db396b78b64e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '2d2c5f87-a9c1-4cc1-83a0-7f3659512f48' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '8edbd333-a1bc-4502-ace8-a4235a987f24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = 'be62478f-d245-4588-a762-6d01de29ae24' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [UniformKey] = '25475bc2-9c11-4d21-866f-9d7e9df95196' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [UniformKey] = '3898550a-2e77-4733-8d11-07eab2e50d2c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [UniformKey] = '670be00e-c8e8-4f60-b149-0e8017852837' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [UniformKey] = '7e91e9d9-7a81-4bde-af75-1cd53cbd3bf6' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '63069a89-7024-46c6-a6a3-4efc6e527e9c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '3fc92aaa-7daa-4a36-8bbb-f1c4759eb7e0' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '4344d668-293f-4de5-80cb-8e96643ed3e1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'ea236186-2fe6-4b1d-9024-c646b528f6e4' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'f7ddd28d-9524-4988-bde5-744f4eda99ed' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'e041bf02-a145-4103-ba38-0f48bead36ff' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '0f95b57e-0874-4d08-bccd-b90b861c9a67' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '1fccb879-c4ef-41a5-bc3a-9792bfb06c1c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '44c97ddc-52c5-4c6b-96ee-5977425d663e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '789c372f-e5dd-4ecf-9b8e-0d8f080cdd70' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'a159d121-8dfe-499e-b43c-7abdb333605c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'e3c787e9-c54e-4e4e-b8ae-a8c0e906de2c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '2dc80eb4-7c5c-430f-955b-7d7953651f5c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '5f226464-7895-42dc-954b-108b8963327e' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '45db5da6-904e-4a3f-86ad-166d24dfd8db' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '321b0c4f-032e-477f-ae17-6811fe3d7127' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '51473c22-1a5f-42bb-a022-335f0ded0a29' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '21ac2a76-e548-41af-9d40-f2b1db0e4917' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [UniformKey] = '44a2556b-043e-4a52-8bea-fcddc255fb09' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [UniformKey] = 'a1297d54-ca84-49d8-9711-90f274912eba' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

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
 WHERE [UniformKey] = '64889e26-a69a-45f6-979a-482b55e3e9eb' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [UniformKey] = '0d5e8d7b-0bb4-4e08-a47f-92836a4ada37' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [UniformKey] = '225fd0fc-9d7f-48d8-a809-55d88108de02' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '3dd558bc-260d-4dbe-a316-e456537f5777'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = '5b0aab4a-adb3-4401-acdc-bd9c22e582fe' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '739aff8b-ce3b-448e-af29-c265380f4b54' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = '1820efcb-c05a-4164-a02f-59c0b3365745' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = '1ce5184d-5e3e-481a-8ef0-3edb8b35fe3c' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = '61d9e094-38d2-4841-8071-8adb1faf4ef8' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd63f23f3-b4eb-45f6-9b2e-ec4282fd163b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [UniformKey] = 'c62c921e-b799-4680-a825-c7d3461cea0a' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [UniformKey] = '54c287a3-b7a2-44f4-8128-567c66f58c6f' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [UniformKey] = 'fc51957e-99f5-468f-95ef-988f8fc2add5' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [UniformKey] = 'c78dabf7-ebd0-4611-8b62-900a4e565c8b' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [UniformKey] = 'a625a106-c4a9-48e0-83f9-90785f66c0a1' AND [RootHierarchyKey] = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'

