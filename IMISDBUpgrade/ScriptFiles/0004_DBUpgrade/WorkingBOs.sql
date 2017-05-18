
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('BatchSummary','CommunicationMessageTypeRef','EducationInProgress','EngagementMeasure','InteractionLog','SoaGroup','SoaGroupMember','SoaGroupMemberDetail','TransactionDetail','TransactionSummary') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 10 
 WHERE [DocumentName] IN ('AddressToUse','AutoPayInstruction','AutoPayInstructionDetail','AutoPayInvoicesFundraising','CertificationProgram','CommunicationReasonRef','ContactCommunicationReasonPreferences','ContactSocialNetwork','CsCommitteeMember','CsContact','CsEvent','CsNameFin','CsProduct','CultivatingFor','DiscountableItem','DiscountableItemClass','FullAddressAllReport','FullAddressPrimaryReport','NetContact','SystemConfigXml') 
   AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] = 40

go

