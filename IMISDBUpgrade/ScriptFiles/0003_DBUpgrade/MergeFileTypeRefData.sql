SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'AVI')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Audio Video Interleave File', MimeType = 'video/x-msvideo', IconFileName = NULL
    WHERE FileTypeCode = 'AVI'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('AVI', 'Audio Video Interleave File', 'video/x-msvideo', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'BMP')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft device independent bitmap', MimeType = 'image/bmp', IconFileName = NULL
    WHERE FileTypeCode = 'BMP'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('BMP', 'Microsoft device independent bitmap', 'image/bmp', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'DOC')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft Word Document', MimeType = 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document', IconFileName = NULL
    WHERE FileTypeCode = 'DOC'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('DOC', 'Microsoft Word Document', 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'DOCX')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft Word Document', MimeType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/msword', IconFileName = NULL
    WHERE FileTypeCode = 'DOCX'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('DOCX', 'Microsoft Word Document', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/msword', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'EML')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Outlook Express Electronic Mail', MimeType = 'message/rfc822', IconFileName = NULL
    WHERE FileTypeCode = 'EML'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('EML', 'Outlook Express Electronic Mail', 'message/rfc822', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'FLV')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Flash Video File', MimeType = 'video/x-flv', IconFileName = NULL
    WHERE FileTypeCode = 'FLV'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('FLV', 'Flash Video File', 'video/x-flv', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'GIF')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'GIF Image', MimeType = 'image/gif', IconFileName = NULL
    WHERE FileTypeCode = 'GIF'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('GIF', 'GIF Image', 'image/gif', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'HTM')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'HTML Page', MimeType = 'text/html', IconFileName = NULL
    WHERE FileTypeCode = 'HTM'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('HTM', 'HTML Page', 'text/html', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'HTML')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'HTML Page', MimeType = 'text/html', IconFileName = NULL
    WHERE FileTypeCode = 'HTML'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('HTML', 'HTML Page', 'text/html', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'JPE')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'JPEG Image', MimeType = 'image/jpeg,image/pjpeg', IconFileName = NULL
    WHERE FileTypeCode = 'JPE'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('JPE', 'JPEG Image', 'image/jpeg,image/pjpeg', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'JPEG')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'JPEG Image', MimeType = 'image/jpeg,image/pjpeg', IconFileName = NULL
    WHERE FileTypeCode = 'JPEG'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('JPEG', 'JPEG Image', 'image/jpeg,image/pjpeg', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'JPG')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'JPEG Image', MimeType = 'image/jpeg,image/pjpeg', IconFileName = NULL
    WHERE FileTypeCode = 'JPG'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('JPG', 'JPEG Image', 'image/jpeg,image/pjpeg', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'MOV')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'QuickTime Movie', MimeType = 'video/quicktime', IconFileName = NULL
    WHERE FileTypeCode = 'MOV'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('MOV', 'QuickTime Movie', 'video/quicktime', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'MP3')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'MP3 Audio', MimeType = 'audio/mpeg', IconFileName = NULL
    WHERE FileTypeCode = 'MP3'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('MP3', 'MP3 Audio', 'audio/mpeg', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'MPG')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'MPEG Video File', MimeType = 'video/mpeg', IconFileName = NULL
    WHERE FileTypeCode = 'MPG'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('MPG', 'MPEG Video File', 'video/mpeg', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'PDF')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Adobe PDF File', MimeType = 'application/pdf', IconFileName = NULL
    WHERE FileTypeCode = 'PDF'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('PDF', 'Adobe PDF File', 'application/pdf', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'PNG')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'PNG Image', MimeType = 'image/png,image/x-png', IconFileName = NULL
    WHERE FileTypeCode = 'PNG'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('PNG', 'PNG Image', 'image/png,image/x-png', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'PPT')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft PowerPoint Presentation', MimeType = 'application/vnd.ms-powerpoint', IconFileName = NULL
    WHERE FileTypeCode = 'PPT'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('PPT', 'Microsoft PowerPoint Presentation', 'application/vnd.ms-powerpoint', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'PPTX')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft PowerPoint Presentation', MimeType = 'application/vnd.ms-powerpoint', IconFileName = NULL
    WHERE FileTypeCode = 'PPTX'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('PPTX', 'Microsoft PowerPoint Presentation', 'application/vnd.ms-powerpoint', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RA')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Real Audio', MimeType = 'audio/x-pn-realaudio', IconFileName = NULL
    WHERE FileTypeCode = 'RA'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RA', 'Real Audio', 'audio/x-pn-realaudio', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RAM')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Real Audio', MimeType = 'audio/x-pn-realaudio', IconFileName = NULL
    WHERE FileTypeCode = 'RAM'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RAM', 'Real Audio', 'audio/x-pn-realaudio', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RDL')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'SSRS Template', MimeType = 'text/xml,application/octet-stream', IconFileName = NULL
    WHERE FileTypeCode = 'RDL'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RDL', 'SSRS Template', 'text/xml,application/octet-stream', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RPT')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Crystal Report Template', MimeType = 'application/x-rpt,application/octet-stream', IconFileName = NULL
    WHERE FileTypeCode = 'RPT'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RPT', 'Crystal Report Template', 'application/x-rpt,application/octet-stream', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RST')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'SSRS Template', MimeType = 'application/octet-stream', IconFileName = NULL
    WHERE FileTypeCode = 'RST'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RST', 'SSRS Template', 'application/octet-stream', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'RTF')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'RTF (Rich Text Format) File', MimeType = 'application/rtf', IconFileName = NULL
    WHERE FileTypeCode = 'RTF'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('RTF', 'RTF (Rich Text Format) File', 'application/rtf', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'TIF')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'TIFF Image', MimeType = 'image/tiff', IconFileName = NULL
    WHERE FileTypeCode = 'TIF'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('TIF', 'TIFF Image', 'image/tiff', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'TIFF')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'TIFF Image', MimeType = 'image/tiff', IconFileName = NULL
    WHERE FileTypeCode = 'TIFF'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('TIFF', 'TIFF Image', 'image/tiff', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'TXT')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Text File', MimeType = 'text/plain', IconFileName = NULL
    WHERE FileTypeCode = 'TXT'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('TXT', 'Text File', 'text/plain', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'WAV')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'WAV Audio File', MimeType = 'audio/x-wav', IconFileName = NULL
    WHERE FileTypeCode = 'WAV'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('WAV', 'WAV Audio File', 'audio/x-wav', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'WMV')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Windows Media File', MimeType = 'video/x-ms-wmv', IconFileName = NULL
    WHERE FileTypeCode = 'WMV'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('WMV', 'Windows Media File', 'video/x-ms-wmv', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'WPD')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Word Perfect Document', MimeType = 'file/ WP template', IconFileName = NULL
    WHERE FileTypeCode = 'WPD'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('WPD', 'Word Perfect Document', 'file/ WP template', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'WRI')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Windows Write Document', MimeType = 'application/x-mswrite', IconFileName = NULL
    WHERE FileTypeCode = 'WRI'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('WRI', 'Windows Write Document', 'application/x-mswrite', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'XLS')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft Excel Workbook', MimeType = 'application/vnd.ms-excel', IconFileName = NULL
    WHERE FileTypeCode = 'XLS'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('XLS', 'Microsoft Excel Workbook', 'application/vnd.ms-excel', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'XLSX')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Microsoft Excel Workbook', MimeType = 'application/vnd.ms-excel', IconFileName = NULL
    WHERE FileTypeCode = 'XLSX'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('XLSX', 'Microsoft Excel Workbook', 'application/vnd.ms-excel', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'XML')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'XML File', MimeType = 'text/xml', IconFileName = NULL
    WHERE FileTypeCode = 'XML'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('XML', 'XML File', 'text/xml', NULL)
END
GO

IF EXISTS (SELECT 1 FROM FileTypeRef WHERE FileTypeCode = 'ZIP')
BEGIN
    UPDATE FileTypeRef SET FileTypeDesc = 'Zip File', MimeType = 'application/x-zip-compressed', IconFileName = NULL
    WHERE FileTypeCode = 'ZIP'
END
ELSE
BEGIN
    INSERT INTO FileTypeRef (FileTypeCode, FileTypeDesc, MimeType, IconFileName)
    VALUES ('ZIP', 'Zip File', 'application/x-zip-compressed', NULL)
END
GO

SET NOCOUNT OFF

