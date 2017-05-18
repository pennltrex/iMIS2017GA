SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '94094ecc-77cc-4d94-8a91-3d91b17c6f3b')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Content'
    WHERE WebPartGalleryKey = '94094ecc-77cc-4d94-8a91-3d91b17c6f3b'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('94094ecc-77cc-4d94-8a91-3d91b17c6f3b', 'Content')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = 'e0777203-f85a-49d0-bcbd-5393646c5949')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Contact'
    WHERE WebPartGalleryKey = 'e0777203-f85a-49d0-bcbd-5393646c5949'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('e0777203-f85a-49d0-bcbd-5393646c5949', 'Contact')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '5ea13cbe-bb74-4b25-b0f4-9c4b59134d5e')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Group'
    WHERE WebPartGalleryKey = '5ea13cbe-bb74-4b25-b0f4-9c4b59134d5e'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('5ea13cbe-bb74-4b25-b0f4-9c4b59134d5e', 'Group')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '1b30e2de-83c8-450b-9fd1-a0ba4d8b333a')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Utility'
    WHERE WebPartGalleryKey = '1b30e2de-83c8-450b-9fd1-a0ba4d8b333a'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('1b30e2de-83c8-450b-9fd1-a0ba4d8b333a', 'Utility')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = 'eb050137-4e0f-452c-8d7a-bdc31655b911')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Marketing'
    WHERE WebPartGalleryKey = 'eb050137-4e0f-452c-8d7a-bdc31655b911'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('eb050137-4e0f-452c-8d7a-bdc31655b911', 'Marketing')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '06aa9dbf-09a7-4d71-a1b1-ca2e813d9d13')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Commerce'
    WHERE WebPartGalleryKey = '06aa9dbf-09a7-4d71-a1b1-ca2e813d9d13'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('06aa9dbf-09a7-4d71-a1b1-ca2e813d9d13', 'Commerce')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '20963035-9e81-4e22-9802-e4af0f5b1928')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Custom'
    WHERE WebPartGalleryKey = '20963035-9e81-4e22-9802-e4af0f5b1928'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('20963035-9e81-4e22-9802-e4af0f5b1928', 'Custom')
END
GO

IF EXISTS (SELECT 1 FROM WebPartGalleryRef WHERE WebPartGalleryKey = '5f83f431-ccef-4f65-94a6-f27ada283873')
BEGIN
    UPDATE WebPartGalleryRef SET WebPartGalleryName = 'Offering'
    WHERE WebPartGalleryKey = '5f83f431-ccef-4f65-94a6-f27ada283873'
END
ELSE
BEGIN
    INSERT INTO WebPartGalleryRef (WebPartGalleryKey, WebPartGalleryName)
    VALUES ('5f83f431-ccef-4f65-94a6-f27ada283873', 'Offering')
END
GO

SET NOCOUNT OFF

