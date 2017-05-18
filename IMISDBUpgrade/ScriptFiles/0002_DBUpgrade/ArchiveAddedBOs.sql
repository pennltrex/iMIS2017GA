
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
WHERE [DocumentName] IN ('CsActivityBasic','CsAsiNrdsAssociation','CsAsiNrdsMember','CsAsiNrdsMemberDemographic','CsAsiNrdsMemberDesignation','CsAsiNrdsMemberEducation','CsAsiNrdsMemberFinancial','CsAsiNrdsMemberSupplemental','CsAsiNrdsOffice','CsAsiNrdsOfficeSupplemental','CsName_Indexes','CsName_Staff','CsNameFin','CsSubscriptionsChapters','CsTerms','CultivatingFor','CultivationActivity','ExperienceUnit','FundraisingProfileDonorData','GiftArray','IndividualExternalNetworks','InvoiceSummary','NrdsLog','Profile_Page','SocialNetworkLinks','Solicitors','SystemConfigXml','URLMappingTypeRef') 
AND [DocumentTypeCode] = 'BOD' AND [DocumentStatusCode] IN (10, 40)

go

