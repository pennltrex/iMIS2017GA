SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '5702ffbc-a0db-44b6-b4dd-0957963c1734')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '.', HierarchyRootDescription = 'Uniform Item Ownership', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'IUniformItem', CreatedOn = '20100624 11:43:50', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20100624 11:43:50', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '5702ffbc-a0db-44b6-b4dd-0957963c1734'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('5702ffbc-a0db-44b6-b4dd-0957963c1734', '.', 'Uniform Item Ownership', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000e02', 'IUniformItem', '20100624 11:43:50', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20100624 11:43:50', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Staff', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20120801 09:36:13', CreatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', UpdatedOn = '20120801 09:37:24', UpdatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'a5105c73-fb1d-4e25-a877-1d2c7700b39b'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('a5105c73-fb1d-4e25-a877-1d2c7700b39b', '~', 'Staff', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20120801 09:36:13', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', '20120801 09:37:24', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '26e359d1-ea83-42d5-bfb6-23ea456c9a87')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '.', HierarchyRootDescription = 'Uniform Item Ownership', OrganizationKey = '673a2ed2-ec66-4e5a-8453-d16844186c71', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'IUniformItem', CreatedOn = '20100624 11:43:50', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20100624 11:43:50', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '26e359d1-ea83-42d5-bfb6-23ea456c9a87'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('26e359d1-ea83-42d5-bfb6-23ea456c9a87', '.', 'Uniform Item Ownership', '673a2ed2-ec66-4e5a-8453-d16844186c71', '00000000-0000-0000-0000-000000000e02', 'IUniformItem', '20100624 11:43:50', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20100624 11:43:50', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'iMIS 15 Staff Web', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'NavigationItem', CreatedOn = '20070430 08:21:56', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20070430 08:21:56', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '6edd071c-aeca-42f5-847e-3e7aabea2a6b'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('6edd071c-aeca-42f5-847e-3e7aabea2a6b', '~', 'iMIS 15 Staff Web', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000e02', 'NavigationItem', '20070430 08:21:56', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20070430 08:21:56', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Donor Sample', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20120801 12:38:33', CreatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', UpdatedOn = '20120801 12:39:17', UpdatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '37430f7c-5b73-48e4-bc9d-57da9841f50a'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('37430f7c-5b73-48e4-bc9d-57da9841f50a', '~', 'Donor Sample', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20120801 12:38:33', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', '20120801 12:39:17', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Annual Conference', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20121004 10:30:09', CreatedByUserKey = '327cca4c-f450-49a9-bc5f-5f9228037177', UpdatedOn = '20121004 10:30:53', UpdatedByUserKey = '327cca4c-f450-49a9-bc5f-5f9228037177', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'eb587dd5-2020-4394-8de1-61a495816b41'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('eb587dd5-2020-4394-8de1-61a495816b41', '~', 'Annual Conference', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20121004 10:30:09', '327cca4c-f450-49a9-bc5f-5f9228037177', '20121004 10:30:53', '327cca4c-f450-49a9-bc5f-5f9228037177', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'iMIS 15 UI', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'NavigationItem', CreatedOn = '20070430 08:21:56', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20070430 08:21:56', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'ecd702d0-d455-43ad-834a-6a18c9fcb529'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('ecd702d0-d455-43ad-834a-6a18c9fcb529', '~', 'iMIS 15 UI', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000e02', 'NavigationItem', '20070430 08:21:56', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20070430 08:21:56', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '1cf36d67-5eeb-4914-b2ce-7a7611513db4')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '@', HierarchyRootDescription = 'Website Content Root', OrganizationKey = '673a2ed2-ec66-4e5a-8453-d16844186c71', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'DocumentVersion', CreatedOn = '20061012 17:01:55', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20061012 17:01:55', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '1cf36d67-5eeb-4914-b2ce-7a7611513db4'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('1cf36d67-5eeb-4914-b2ce-7a7611513db4', '@', 'Website Content Root', '673a2ed2-ec66-4e5a-8453-d16844186c71', '00000000-0000-0000-0000-000000000e02', 'DocumentVersion', '20061012 17:01:55', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20061012 17:01:55', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'd2c71101-e31c-4dcf-830f-8647236f99f2')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '$', HierarchyRootDescription = 'Default Root', OrganizationKey = '673a2ed2-ec66-4e5a-8453-d16844186c71', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'DocumentVersion', CreatedOn = '20050521 07:42:13', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20050521 07:42:13', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'd2c71101-e31c-4dcf-830f-8647236f99f2'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('d2c71101-e31c-4dcf-830f-8647236f99f2', '$', 'Default Root', '673a2ed2-ec66-4e5a-8453-d16844186c71', '00000000-0000-0000-0000-000000000e02', 'DocumentVersion', '20050521 07:42:13', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20050521 07:42:13', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Member', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20101026 11:43:05', CreatedByUserKey = '7b34fc13-ff4f-43e1-ad9a-d3a201002ed1', UpdatedOn = '20101026 11:44:49', UpdatedByUserKey = '7b34fc13-ff4f-43e1-ad9a-d3a201002ed1', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('71e7ebe8-1f90-416a-ae0d-9560a6704f85', '~', 'Member', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20101026 11:43:05', '7b34fc13-ff4f-43e1-ad9a-d3a201002ed1', '20101026 11:44:49', '7b34fc13-ff4f-43e1-ad9a-d3a201002ed1', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'e32f6fe8-1669-4c59-8341-9a541af5318a')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Tag Root', OrganizationKey = '673a2ed2-ec66-4e5a-8453-d16844186c71', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'Tag', CreatedOn = '20070119 14:11:59', CreatedByUserKey = 'dc770d25-9ed6-4101-a5e9-c2a2014651a8', UpdatedOn = '20070119 14:11:59', UpdatedByUserKey = 'dc770d25-9ed6-4101-a5e9-c2a2014651a8', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'e32f6fe8-1669-4c59-8341-9a541af5318a'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('e32f6fe8-1669-4c59-8341-9a541af5318a', '~', 'Tag Root', '673a2ed2-ec66-4e5a-8453-d16844186c71', '00000000-0000-0000-0000-000000000e02', 'Tag', '20070119 14:11:59', 'dc770d25-9ed6-4101-a5e9-c2a2014651a8', '20070119 14:11:59', 'dc770d25-9ed6-4101-a5e9-c2a2014651a8', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Administrative Console', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20120808 08:00:02', CreatedByUserKey = 'ce375ac7-8dd5-441d-ba3b-d5f76e2a12e4', UpdatedOn = '20120808 08:00:02', UpdatedByUserKey = 'ce375ac7-8dd5-441d-ba3b-d5f76e2a12e4', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '3f0ec164-23fe-4a49-9c3a-d075c1a390f8'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('3f0ec164-23fe-4a49-9c3a-d075c1a390f8', '~', 'Administrative Console', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20120808 08:00:02', 'ce375ac7-8dd5-441d-ba3b-d5f76e2a12e4', '20120808 08:00:02', 'ce375ac7-8dd5-441d-ba3b-d5f76e2a12e4', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = '387b4c00-a08b-4200-a5c2-d4c85f46b679')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '$', HierarchyRootDescription = 'System Root', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-0000-000000000e02', UniformType = 'DocumentVersion', CreatedOn = '20050521 07:42:13', CreatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', UpdatedOn = '20050521 07:42:13', UpdatedByUserKey = '209935b1-c94e-472a-94ce-8c3f1526d4a5', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = '387b4c00-a08b-4200-a5c2-d4c85f46b679'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('387b4c00-a08b-4200-a5c2-d4c85f46b679', '$', 'System Root', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000e02', 'DocumentVersion', '20050521 07:42:13', '209935b1-c94e-472a-94ce-8c3f1526d4a5', '20050521 07:42:13', '209935b1-c94e-472a-94ce-8c3f1526d4a5', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Annual Conference Mobile', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20121004 12:11:46', CreatedByUserKey = '327cca4c-f450-49a9-bc5f-5f9228037177', UpdatedOn = '20121004 12:11:46', UpdatedByUserKey = '327cca4c-f450-49a9-bc5f-5f9228037177', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'b4ff3233-0478-4634-89a4-d75028af3bdf'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('b4ff3233-0478-4634-89a4-d75028af3bdf', '~', 'Annual Conference Mobile', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20121004 12:11:46', '327cca4c-f450-49a9-bc5f-5f9228037177', '20121004 12:11:46', '327cca4c-f450-49a9-bc5f-5f9228037177', NULL)
END
GO

IF EXISTS (SELECT 1 FROM HierarchyRoot WHERE RootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774')
BEGIN
    UPDATE HierarchyRoot SET HierarchyRootName = '~', HierarchyRootDescription = 'Member Mobile', OrganizationKey = '00000000-0000-0000-0000-000000000000', AccessKey = '00000000-0000-0000-ca00-000000000e1f', UniformType = 'NavigationItem', CreatedOn = '20120126 09:43:31', CreatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', UpdatedOn = '20120126 09:49:01', UpdatedByUserKey = 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', MarkedForDeleteOn = NULL
    WHERE RootHierarchyKey = 'bed63250-4172-4027-96dc-fb9f5a559774'
END
ELSE
BEGIN
    INSERT INTO HierarchyRoot (RootHierarchyKey, HierarchyRootName, HierarchyRootDescription, OrganizationKey, AccessKey, UniformType, CreatedOn, CreatedByUserKey, UpdatedOn, UpdatedByUserKey, MarkedForDeleteOn)
    VALUES ('bed63250-4172-4027-96dc-fb9f5a559774', '~', 'Member Mobile', '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-ca00-000000000e1f', 'NavigationItem', '20120126 09:43:31', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', '20120126 09:49:01', 'c6a5b257-7284-4bf1-9773-3a1e5b63829e', NULL)
END
GO

SET NOCOUNT OFF

