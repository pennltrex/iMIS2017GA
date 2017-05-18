SET NOCOUNT ON
GO

-- Delete obsolete WebPartGallery entries
DELETE FROM [dbo].[WebPartGalleryEntryRef]
WHERE [WebPartGalleryEntryKey] IN (  
'B37BE990-4947-4EAE-BF21-605215E72110',
'6F7F8E9F-53E2-4054-A076-781BC7A6D4BB',
'731C6A8C-51E9-49B9-A8FE-ABAB3F94F3B9',
'D4534997-988D-45BF-ABFC-F930F72B1D6A'
)  
GO

-- Rename existing WebPartGallery names
UPDATE [dbo].[WebPartGalleryRef]
   SET [WebPartGalleryName] = 'Content'
 WHERE [WebPartGalleryKey] = '94094ECC-77CC-4D94-8A91-3D91B17C6F3B'   
UPDATE [dbo].[WebPartGalleryRef]
   SET [WebPartGalleryName] = 'Group'
 WHERE [WebPartGalleryKey] = '5EA13CBE-BB74-4B25-B0F4-9C4B59134D5E'   
GO

-- Add new WebPartGallery rows 
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Contact')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('E0777203-F85A-49D0-BCBD-5393646C5949', 'Contact')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Content')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('94094ECC-77CC-4D94-8A91-3D91B17C6F3B', 'Content')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Custom')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('20963035-9E81-4E22-9802-E4AF0F5B1928', 'Custom')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Group')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('5EA13CBE-BB74-4B25-B0F4-9C4B59134D5E', 'Group')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Commerce')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('06AA9DBF-09A7-4D71-A1B1-CA2E813D9D13', 'Commerce')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Offering')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('5F83F431-CCEF-4F65-94A6-F27ADA283873', 'Offering')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Marketing')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('EB050137-4E0F-452C-8D7A-BDC31655B911', 'Marketing')
END
IF NOT EXISTS (SELECT 1 FROM [dbo].[WebPartGalleryRef] WHERE [WebPartGalleryName] = 'Utility')
BEGIN 
    INSERT INTO [dbo].[WebPartGalleryRef] ([WebPartGalleryKey], [WebPartGalleryName])
    VALUES ('1B30E2DE-83C8-450B-9FD1-A0BA4D8B333A', 'Utility')
END
GO

-------------------------------------------------------------------
-- Sort existing iPart Entries into the correct new iPart Galleries
-------------------------------------------------------------------

-- Move existing iParts into Contact gallery
UPDATE [dbo].[WebPartGalleryEntryRef]
   SET [WebPartGalleryKey] = 'E0777203-F85A-49D0-BCBD-5393646C5949'
 WHERE [WebPartGalleryEntryKey] IN (
'79176926-3150-4937-B033-00F48FA092C3', -- Change Logon Password
'7536F6F4-5C9A-4143-9288-D548E05A2609', -- Contact Address
'25D063DB-FF58-4CB7-A9FF-A026502E7FDE', -- Contact Address Editor
'FB1B39F8-54FC-43EA-A0E4-41A68BA24943', -- Contact Communities
'6DE903A2-6E64-49E1-89BE-455CE2341C47', -- Contact Mini Profile
'D46C5BAB-7492-4B56-B335-F462083E93E1', -- Contact Name
'5956B39F-386D-497B-85FD-A42508A6B7D9', -- Contact Profile Picture
'D766BB12-F8AE-4A1E-A690-80C1B15215A4'  -- Contact Status
)

-- Move existing iParts into the Commerce gallery
UPDATE [dbo].[WebPartGalleryEntryRef]
   SET [WebPartGalleryKey] = '06AA9DBF-09A7-4D71-A1B1-CA2E813D9D13'
 WHERE [WebPartGalleryEntryKey] IN (
'AF4CA211-F219-4D48-BB3B-1F7331976C58', -- Cart Charges
'2D13AF42-E847-4C5F-BAB9-A2F33A4D8AB2', -- Cart Detail
'C949A1DE-7D7C-4E11-933F-38E2A271C0C9', -- Shipping Details
'5E39161D-0373-4315-8F77-BC8129BC0AD8'  -- Recurring Donation Expected Payments
)

-- Move existing iParts into the Offering gallery
UPDATE [dbo].[WebPartGalleryEntryRef]
   SET [WebPartGalleryKey] = '5F83F431-CCEF-4F65-94A6-F27ADA283873'
 WHERE [WebPartGalleryEntryKey] IN (
'E569790F-4C11-4262-BE84-F06421E2772A', -- Gift Aid Declaration
'0D33C7AE-8BF4-4BDA-9B56-EBA75DD3DECD', -- Gift Aid Tax Reclaim
'308C4436-BDC4-4807-9415-B0F13392BBD9', -- Product Display
'BDBC4433-E3F7-43DE-8239-16CEB951E5B2', -- Product Display List
'16EA174F-ABCE-4027-96D5-D244A586694B', -- Donation Creator
'DD730A10-AC19-49DC-9DD8-D3C7E852DDB6', -- Recurring Donation Commitments
'2D48ED96-F0E9-4701-91CD-1FBA41D0E8E9'  -- Recurring Donation Commitments Public View
)

-- Move existing iParts into the Utility gallery
UPDATE [dbo].[WebPartGalleryEntryRef]
   SET [WebPartGalleryKey] = '1B30E2DE-83C8-450B-9FD1-A0BA4D8B333A'
 WHERE [WebPartGalleryEntryKey] IN (
'9CA44C54-9513-4AF3-B7A7-D25178B6400A', -- AdvancedSearch
'AF35EB60-98B6-44B5-898E-1F6EED77C4F0', -- File Importer For Web Services
'299A4FD4-51A0-45B4-809B-F3EAD2E182AB', -- File Viewer For Web Services
'7413BFA0-9EEF-4BE2-A14F-EBB61A74FD5F', -- Friendraising Importer
'46EEA5FC-0BE3-4E6F-923D-267F26DA834F', -- Friendraising Mapping
'22DA4D93-32D9-444F-92EB-709C9C583A93', -- Friendraising Settings
'8DED80D8-F5F2-4801-B49B-F6BD43F11220', -- Log Viewer For Web Services
'4504762B-7AA5-46D4-B017-7B6B6496685A', -- Package Installer
'B23CBD68-D9FE-48C7-8802-F3C243D0BC1D'  -- Query Menu
)
GO

SET NOCOUNT OFF
GO
