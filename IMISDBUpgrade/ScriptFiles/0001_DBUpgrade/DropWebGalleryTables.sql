IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryEntryRef_WebPartGalleryRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryEntryRef]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryEntryRef] DROP CONSTRAINT [FK_WebPartGalleryEntryRef_WebPartGalleryRef]
END

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryLicense_WebPartGalleryRef]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryLicense]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryLicense] DROP CONSTRAINT [FK_WebPartGalleryLicense_WebPartGalleryRef]
END

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebPartGalleryLicense_License]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebPartGalleryLicense]'))
BEGIN
    ALTER TABLE [dbo].[WebPartGalleryLicense] DROP CONSTRAINT [FK_WebPartGalleryLicense_License]
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'WebPartGalleryEntryRef')
BEGIN
    DROP TABLE [dbo].[WebPartGalleryEntryRef]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'WebPartGalleryLicense')
BEGIN
    DROP TABLE [dbo].[WebPartGalleryLicense]
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'WebPartGalleryRef')
BEGIN
    DROP TABLE [dbo].[WebPartGalleryRef]
END
GO
