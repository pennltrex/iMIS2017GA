SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '1b7594f2-ee61-45e2-9434-13e71392043b')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_fr', LocalizationVersionDesc = '', Note = '', DateCreated = '20140827 15:19:30', CreatedBy = 'User', DateUpdated = '20150119 11:43:32', UpdatedBy = 'Test User', CultureId = 'fr', ActiveVersion = 1, ActiveVersionLoaded = '20150119 11:43:32', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20140827 15:19:30', StatusID = 'A'
    WHERE LocalizationVersionId = '1b7594f2-ee61-45e2-9434-13e71392043b'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('1b7594f2-ee61-45e2-9434-13e71392043b', 'ASI_fr', '', '', '20140827 15:19:30', 'User', '20150119 11:43:32', 'Test User', 'fr', 1, '20150119 11:43:32', '', 0, 'A', '20140827 15:19:30', 'A')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = '60d3f1f3-f7c9-4d36-9f7f-c5292859f0e9')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_nl', LocalizationVersionDesc = '', Note = '', DateCreated = '20140827 15:31:20', CreatedBy = 'User', DateUpdated = '20150119 11:43:55', UpdatedBy = 'Test User', CultureId = 'nl', ActiveVersion = 1, ActiveVersionLoaded = '20150119 11:43:55', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20140827 15:31:20', StatusID = 'A'
    WHERE LocalizationVersionId = '60d3f1f3-f7c9-4d36-9f7f-c5292859f0e9'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('60d3f1f3-f7c9-4d36-9f7f-c5292859f0e9', 'ASI_nl', '', '', '20140827 15:31:20', 'User', '20150119 11:43:55', 'Test User', 'nl', 1, '20150119 11:43:55', '', 0, 'A', '20140827 15:31:20', 'A')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationVersion WHERE LocalizationVersionId = 'c90a36f7-1f26-480a-88f1-cd5048b61d05')
BEGIN
    UPDATE LocalizationVersion SET LocalizationVersionName = 'ASI_es', LocalizationVersionDesc = '', Note = '', DateCreated = '20150115 14:17:41', CreatedBy = 'User', DateUpdated = '20150119 11:43:07', UpdatedBy = 'Test User', CultureId = 'es', ActiveVersion = 1, ActiveVersionLoaded = '20150119 11:43:07', TranslatedBy = '', SystemTranslation = 0, Status = 'A', StatusDate = '20150115 14:17:41', StatusID = 'A'
    WHERE LocalizationVersionId = 'c90a36f7-1f26-480a-88f1-cd5048b61d05'
END
ELSE
BEGIN
    INSERT INTO LocalizationVersion (LocalizationVersionId, LocalizationVersionName, LocalizationVersionDesc, Note, DateCreated, CreatedBy, DateUpdated, UpdatedBy, CultureId, ActiveVersion, ActiveVersionLoaded, TranslatedBy, SystemTranslation, Status, StatusDate, StatusID)
    VALUES ('c90a36f7-1f26-480a-88f1-cd5048b61d05', 'ASI_es', '', '', '20150115 14:17:41', 'User', '20150119 11:43:07', 'Test User', 'es', 1, '20150119 11:43:07', '', 0, 'A', '20150115 14:17:41', 'A')
END
GO

SET NOCOUNT OFF

