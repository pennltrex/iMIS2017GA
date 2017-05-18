
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('AutoPayInstruction','AutoPayInvoicesFundraising','CertificationModule','CertificationProgram','ComponentRegistry','ContactOfferingRef','CountryRef','CsActivity','CsContact','CsEvent','CsFunction','CsInventory','CsName_Demo','CsNameFin','CsOrderLines','CsOrders','CsOrderType','CsProduct','CsRegFunctions','CsRegistration','EventRegistrantsReport','ExperienceCountSummary','ExperienceUnit','GiftAidClaimDetail','Group','GroupTypeRef','InteractionLog','InvoiceSummary','LicenseMain','LicenseMaster','LicenseOrganization','NetContact','Offering','Profile_Page','Program','RegisteredComponent') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

