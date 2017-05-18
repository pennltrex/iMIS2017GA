
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
 WHERE [DocumentVersionKey] IN ('4842E079-53DF-4D4C-B9EC-35004C50FB6A','1363E90A-B474-49FE-B2F3-A0E8034B9942','38132130-5FCE-44F7-AB93-6F922EA603BB','76223860-BA36-4158-9215-F0F4B331C7FD','10723585-F070-4DE2-8633-FA72A928D0A6','6CD53710-DDE4-4E11-A403-53BB3D34FA54') 
   AND [DocumentTypeCode] IN ('APC', 'APP', 'CFL', 'CON', 'NAV', 'TCT', 'WEB') AND [DocumentStatusCode] = 40

go

