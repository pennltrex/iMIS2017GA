
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('AddressToUse','AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoicesFundraising','CertificationProgram','CommunicationReasonRef','ContactCommunicationReasonPreferences','ContactSocialNetwork','CsCommitteeMember','CsContact','CsEvent','CsNameFin','CsProduct','CultivatingFor','DiscountableItem','DiscountableItemClass','FullAddressAllReport','FullAddressPrimaryReport','NetContact','SystemConfigXml') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

