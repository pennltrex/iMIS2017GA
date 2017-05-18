SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '1219842c-0979-4671-acbe-09f32ebffc99')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'iMIS Desktop View', WebsiteKey = 'fbdf17a3-cae7-4943-b1eb-71b9c0dd65d2', RootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '16c3e3be-34d7-41d1-b5f1-3f31f3d38cbe'
    WHERE PerspectiveKey = '1219842c-0979-4671-acbe-09f32ebffc99'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('1219842c-0979-4671-acbe-09f32ebffc99', 'iMIS Desktop View', 'fbdf17a3-cae7-4943-b1eb-71b9c0dd65d2', 'ecd702d0-d455-43ad-834a-6a18c9fcb529', NULL, '16c3e3be-34d7-41d1-b5f1-3f31f3d38cbe')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = 'cdafdb44-325e-4767-9f5d-30ab2e75224e')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Advanced Accounting Console', WebsiteKey = 'fad2fd17-7e27-4c96-babe-3291ecde4822', RootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '27eecb4e-1a62-4eb8-a1fd-4dbe1186c0d0'
    WHERE PerspectiveKey = 'cdafdb44-325e-4767-9f5d-30ab2e75224e'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('cdafdb44-325e-4767-9f5d-30ab2e75224e', 'Advanced Accounting Console', 'fad2fd17-7e27-4c96-babe-3291ecde4822', '3f0ec164-23fe-4a49-9c3a-d075c1a390f8', NULL, '27eecb4e-1a62-4eb8-a1fd-4dbe1186c0d0')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '14c95828-5d7c-4482-8d77-36bf7e38c3b2')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Donor', WebsiteKey = '60b993c6-6608-4d34-89e6-e8cfe0234e3e', RootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '44ba0f78-7a92-431f-8d09-f8c3171ca46c'
    WHERE PerspectiveKey = '14c95828-5d7c-4482-8d77-36bf7e38c3b2'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('14c95828-5d7c-4482-8d77-36bf7e38c3b2', 'Donor', '60b993c6-6608-4d34-89e6-e8cfe0234e3e', '37430f7c-5b73-48e4-bc9d-57da9841f50a', NULL, '44ba0f78-7a92-431f-8d09-f8c3171ca46c')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '287cd27f-a7d6-4d77-a9f6-466c77fb4d21')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Annual Conference', WebsiteKey = '77c6bf57-1505-456c-a3e9-8473532388ea', RootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '2c72c1ec-467e-4ee9-ade9-d08facf16cab'
    WHERE PerspectiveKey = '287cd27f-a7d6-4d77-a9f6-466c77fb4d21'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('287cd27f-a7d6-4d77-a9f6-466c77fb4d21', 'Annual Conference', '77c6bf57-1505-456c-a3e9-8473532388ea', 'eb587dd5-2020-4394-8de1-61a495816b41', NULL, '2c72c1ec-467e-4ee9-ade9-d08facf16cab')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = 'f7e48a90-1141-4174-bea9-47fdd4cd588a')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Member', WebsiteKey = 'deea0907-2d5e-405c-8ec4-e9794203eadd', RootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '8d34e992-65d8-4f9b-814a-8ba74846f418'
    WHERE PerspectiveKey = 'f7e48a90-1141-4174-bea9-47fdd4cd588a'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('f7e48a90-1141-4174-bea9-47fdd4cd588a', 'Member', 'deea0907-2d5e-405c-8ec4-e9794203eadd', '71e7ebe8-1f90-416a-ae0d-9560a6704f85', NULL, '8d34e992-65d8-4f9b-814a-8ba74846f418')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '9641d67a-52ab-429f-9eb0-4ac1acb8407e')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Member Responsive', WebsiteKey = 'e7590042-1672-4d0f-a20c-335e0bf62de2', RootHierarchyKey = 'b21b2362-c3d4-4441-8140-b40a5b36bfb5', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '96ddafab-81a2-4e33-8182-2bdb8439d828'
    WHERE PerspectiveKey = '9641d67a-52ab-429f-9eb0-4ac1acb8407e'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('9641d67a-52ab-429f-9eb0-4ac1acb8407e', 'Member Responsive', 'e7590042-1672-4d0f-a20c-335e0bf62de2', 'b21b2362-c3d4-4441-8140-b40a5b36bfb5', NULL, '96ddafab-81a2-4e33-8182-2bdb8439d828')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '5625eb60-3f3a-4dbe-a63e-6e4fa304a4c4')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Member Mobile', WebsiteKey = 'a9ef00fe-f87f-42a6-8150-3f3775861973', RootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '102ebc8f-d775-4ab9-a13c-b4ed78d9f4ef'
    WHERE PerspectiveKey = '5625eb60-3f3a-4dbe-a63e-6e4fa304a4c4'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('5625eb60-3f3a-4dbe-a63e-6e4fa304a4c4', 'Member Mobile', 'a9ef00fe-f87f-42a6-8150-3f3775861973', 'bed63250-4172-4027-96dc-fb9f5a559774', NULL, '102ebc8f-d775-4ab9-a13c-b4ed78d9f4ef')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = 'cbe7dbeb-acd1-4189-9f14-8cc4a9a14d00')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Annual Conference Mobile', WebsiteKey = 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', RootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '589beae4-2185-4765-b196-93974870ec26'
    WHERE PerspectiveKey = 'cbe7dbeb-acd1-4189-9f14-8cc4a9a14d00'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('cbe7dbeb-acd1-4189-9f14-8cc4a9a14d00', 'Annual Conference Mobile', 'a39d90dd-afae-4f98-85e3-ef34feaf63cc', 'b4ff3233-0478-4634-89a4-d75028af3bdf', NULL, '589beae4-2185-4765-b196-93974870ec26')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '3391c497-faa5-4944-b60f-9ad04c0b5b70')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'iMIS Web View', WebsiteKey = 'd30229f1-d53b-48d7-99ae-d0ce9fea621d', RootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b', MarkedForDeleteOn = NULL, HomePageHierarchyKey = '3a6df006-030a-4dc0-846a-82f508d1b2ef'
    WHERE PerspectiveKey = '3391c497-faa5-4944-b60f-9ad04c0b5b70'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('3391c497-faa5-4944-b60f-9ad04c0b5b70', 'iMIS Web View', 'd30229f1-d53b-48d7-99ae-d0ce9fea621d', '6edd071c-aeca-42f5-847e-3e7aabea2a6b', NULL, '3a6df006-030a-4dc0-846a-82f508d1b2ef')
END
GO

IF EXISTS (SELECT 1 FROM Perspective WHERE PerspectiveKey = '8d22e78d-5e61-48a4-9264-d3522a7d8f7f')
BEGIN
    UPDATE Perspective SET PerspectiveName = 'Staff', WebsiteKey = '4243d9e2-e91e-468c-97c2-2046d70c1e1a', RootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b', MarkedForDeleteOn = NULL, HomePageHierarchyKey = 'cea5f613-2240-448a-81c9-cf0dc487a55f'
    WHERE PerspectiveKey = '8d22e78d-5e61-48a4-9264-d3522a7d8f7f'
END
ELSE
BEGIN
    INSERT INTO Perspective (PerspectiveKey, PerspectiveName, WebsiteKey, RootHierarchyKey, MarkedForDeleteOn, HomePageHierarchyKey)
    VALUES ('8d22e78d-5e61-48a4-9264-d3522a7d8f7f', 'Staff', '4243d9e2-e91e-468c-97c2-2046d70c1e1a', 'a5105c73-fb1d-4e25-a877-1d2c7700b39b', NULL, 'cea5f613-2240-448a-81c9-cf0dc487a55f')
END
GO

SET NOCOUNT OFF

