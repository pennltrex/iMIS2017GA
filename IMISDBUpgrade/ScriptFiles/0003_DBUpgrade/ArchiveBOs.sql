
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('Address','CertificationModule','CertificationModuleRegistration','CertificationProgramRegistration','ContactBiography','CsContact','CsEvent','CsFunction','CustomerExperience','CustomerExperienceStatusChange','Document','DocumentType','ExperienceCountSummary','ExperienceRoster','InvoiceSummary','Offering','ParticipantRoster','Program','RegistrationStatusChange') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

