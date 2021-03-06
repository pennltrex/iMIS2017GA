SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '506b8caf-9fa6-43c0-8c4a-1ea1db57133d')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_de', LocalizationVersionDesc = '', Note = '', DateCreated = '20161020 16:36:37', CreatedBy = 'User', DateUpdated = '20170303 01:26:13', UpdatedBy = 'Test User', CultureId = 'de', ActiveVersion = 1, ActiveVersionLoaded = '20170303 01:26:13', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20161020 16:36:37', StatusID = 'A'
    WHERE LocalizationVersionId = '506b8caf-9fa6-43c0-8c4a-1ea1db57133d'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('506b8caf-9fa6-43c0-8c4a-1ea1db57133d', 'ASI_de', '', '', '20161020 16:36:37', 'User', '20170303 01:26:13', 'Test User', 'de', 1, '20170303 01:26:13', '', 0, 'A', '20161020 16:36:37', 'A')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '9dc6e9e1-bf15-46ea-9da9-2c766443f4c9')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_fr', LocalizationVersionDesc = '', Note = '', DateCreated = '20150918 14:26:29', CreatedBy = 'User', DateUpdated = '20170303 01:36:39', UpdatedBy = 'Test User', CultureId = 'fr', ActiveVersion = 1, ActiveVersionLoaded = '20170303 01:36:39', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20150918 14:26:29', StatusID = 'A'
    WHERE LocalizationVersionId = '9dc6e9e1-bf15-46ea-9da9-2c766443f4c9'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('9dc6e9e1-bf15-46ea-9da9-2c766443f4c9', 'ASI_fr', '', '', '20150918 14:26:29', 'User', '20170303 01:36:39', 'Test User', 'fr', 1, '20170303 01:36:39', '', 0, 'A', '20150918 14:26:29', 'A')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '8ea77bc0-cac7-4174-acaa-41d847e7ed28')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_nl', LocalizationVersionDesc = '', Note = '', DateCreated = '20150918 14:27:41', CreatedBy = 'User', DateUpdated = '20170303 01:37:19', UpdatedBy = 'Test User', CultureId = 'nl', ActiveVersion = 1, ActiveVersionLoaded = '20170303 01:37:19', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20150918 14:27:41', StatusID = 'A'
    WHERE LocalizationVersionId = '8ea77bc0-cac7-4174-acaa-41d847e7ed28'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('8ea77bc0-cac7-4174-acaa-41d847e7ed28', 'ASI_nl', '', '', '20150918 14:27:41', 'User', '20170303 01:37:19', 'Test User', 'nl', 1, '20170303 01:37:19', '', 0, 'A', '20150918 14:27:41', 'A')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '0173adda-1211-45a7-896b-4f147922bb26')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_es', LocalizationVersionDesc = '', Note = '', DateCreated = '20150918 14:24:47', CreatedBy = 'User', DateUpdated = '20170303 01:36:03', UpdatedBy = 'Test User', CultureId = 'es', ActiveVersion = 1, ActiveVersionLoaded = '20170303 01:36:03', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20150918 14:24:47', StatusID = 'A'
    WHERE LocalizationVersionId = '0173adda-1211-45a7-896b-4f147922bb26'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('0173adda-1211-45a7-896b-4f147922bb26', 'ASI_es', '', '', '20150918 14:24:47', 'User', '20170303 01:36:03', 'Test User', 'es', 1, '20170303 01:36:03', '', 0, 'A', '20150918 14:24:47', 'A')
END
GO

SET NOCOUNT OFF

