
UPDATE [dbo].[DocumentMain] SET [DocumentStatusCode] = 50 
 WHERE [DocumentVersionKey] IN ('322CC6A5-BBB1-4090-8F48-0228F9814ADA','23863721-974B-4FF8-9188-02D80AFB291B','32906E4F-751D-474F-BDB9-0516B5C3E2AB','4FDCCBC7-FFF2-4FA8-8ABC-0E4019E180B5','52324F11-45AE-4730-AC39-0FB1DCD9BD0C','4D1422A0-5A25-4264-ABA1-1006C84B85FD','ED7573C2-1F7E-4E14-A137-110F35A18170','43724841-1271-4081-8B45-12B403F317E1','B53A5197-883E-4B01-8CDF-1650DC5F4EF3','711615EB-C601-4EF3-8321-18265EC68C1A','D196F093-B3B0-4F09-916E-18D171973BE5','DEBFA74B-E29A-496D-AC46-1B033417481A','CA84CEEC-4939-44D7-9429-2179E1BEEB98','16C08962-A412-4EAB-B235-222EC76BF8E0','66F633C0-2E8F-4BDE-A1B7-238A90E37074','9D6590E0-ACB8-4DAB-ACF1-25A82518CA75','E0A08EB2-61BD-4170-9C66-2A9E2C3116CF','5A67DAFF-49C7-4D6B-A7E0-2BE46F86D57A','77922F06-2413-446D-A587-34F328989992','786B5A79-E9E3-428D-8B36-35993ADF611C','4DF6059F-0EBB-4ED1-B763-3713A60C7A6B','0D892199-255B-43E2-87B3-3819FF398504','66E87055-D805-4243-860B-39BD83E9FC5E','F6D821E9-8DBF-40B9-ABC5-3D9F8F3EB7DA','2770A0A8-9E54-4A03-A05F-4547ABE0BDF2','7BA2FE9A-1EFA-43C3-B91B-48B754847B46','648DDC20-AA7C-4A04-B326-48DA15C2753C','B8BD531C-D507-49FC-9478-4BDEADA5A869','31BAAB1C-2B58-4CAB-95F0-4C68A5105981','E45FFCC5-9B12-48F8-9DC2-4E8D508DC9C4','EA0E7DC4-AB64-49B3-8CB7-53EE00415DBC','16B115ED-414A-49FE-B9E2-5B5731CDBB35','B5D0B585-E480-4F6D-A7F4-602131ACC536','C46C310D-4831-4118-A690-62CA0DE74E61','339E3091-E79C-4C82-BDDE-76203BAE43DB','CC7EAD83-0AE5-49BF-A57D-772C86B7C051','079E5E79-5D01-4CB2-8BE4-77E9687BF320','4B810A85-0BE7-4CC1-93DD-782DC8E81EB4','48FF41E3-13F1-469D-9CE0-7D6692D6CF0E','7994F7D5-2F8D-4563-B717-8047E1B9B274','8963A3BB-C775-4102-99D1-82CBD32E023C','CCE48703-7F71-493A-B7CC-837A06CCC5D9','53E8D6C6-BEDE-4F7A-9414-83A163B4C69A','F890BD4C-3579-4DA5-BF78-8AB5C91AD4F2','51DA27CB-7EE1-4976-B378-91D0459A326B','90DC6D74-3C42-4DE4-BB3B-9795F2F16676','8B54782C-62E4-44C1-9BF6-A08C71294885','4BF8F25E-3F9C-48E5-B3AB-A19F87B8D9E3','69601897-2F15-4F14-B2CF-AEA622327AE7','C34B7E05-959A-48AD-A1F6-B30E38D13136','CC9646AD-0533-47D8-8CE3-B86A467D0A27','27F294F2-F0CF-4A72-82CC-BD83E7341DC3','6155A72C-C310-4111-A7EC-C359E148FB8E','AE6E44A4-35D4-4870-9F37-C37E2C9AA3DB','C20B8996-D374-4DF1-A7E3-C7A80215CA10','0BAB04CA-8593-47D5-92DC-CC20D4BB276D','47861EDB-A753-4782-8788-CCAF1CEC0DB3','3F4C30F4-110D-4540-83F5-CD34269BB834','382F6473-B466-4E68-95D0-D412AE37EF0C','DF83B80C-6DAC-4377-B22B-DA15E67A581E','69A23D1E-6E3B-4CE5-AEEA-DF03E40EECDB','730C088B-5DFC-4399-B30C-E3BDA8BCB8B9','04980D78-00C6-4E04-B378-E6E601114E90','B4E0E44A-08DB-4403-B888-F10D8F9573A0','A3AE5570-AA35-4E45-8331-F428AD838129','5580B7CD-0839-409D-B25C-F447BE0DC84E','BA425DA3-8F3B-464C-A8C9-F568782457DF','4050B11E-B1FE-4FE2-BA90-F5C61E3B6E00','9829E708-688C-4C69-87DE-FEAC9E549A2B') 
   AND [DocumentTypeCode] IN ('APC', 'APP', 'CFL', 'CON', 'NAV', 'TCT', 'WEB') AND [DocumentStatusCode] = 40

go

